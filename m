Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED113002D6;
	Wed, 21 Jan 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012745; cv=none; b=hS5Q1uBn5G/jSdq9PVexKSosQlg4UTtoLSsyPUPhptYFkRCKNqf0byQS8WDoIWFfYqOjAnlZqAPu5M5wmkgILz3JkbGrZdgzOr7ebszXPKlEqTU36CFeRyzf1I0t7ixT3fby7vaJ2MInzTI9chR1DCrI5qgWdGMu2+SPkes/iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012745; c=relaxed/simple;
	bh=Whc/kcX3hnhTeIAYH8SPMeuh2COtMk+lnyySuY2yQP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU97jfN/pbdZcqZpOK+QwJXz/FiQOIUBahrURJGhdZLW3bNwNxHqJm28pBv0GCkx5dtH6LXc5rZQkWbp7dh4qURsgFqL3ydtIxG3/7Rn3uBX7KcYC/AUduX/dxZYXoQeOA1vVEKzXDkRAaFiTsv1HGfUIyGJd5cM8pOPNUdPqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjLywE63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjLywE63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C7EC4CEF1;
	Wed, 21 Jan 2026 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012744;
	bh=Whc/kcX3hnhTeIAYH8SPMeuh2COtMk+lnyySuY2yQP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjLywE63y3ZCblxUPwIDykhVcWRaCX+762m9SOnZdqM3dkgl8PPeMfOfoWWzHo8qA
	 gN0pQ+hvF189L2fkwVsAQoQAwAbBnDZQftlBLmx6TpvUGDD2Tofo/kxsoHsz40YcYd
	 RdA8JaIA6giBpLRYS+lHJkn7sxE63Ajjo5fY7U8W0MzxN/bGt3RXMeshKNZ2xI4k9c
	 6FrKiE1ry7naYQ4WF2rXSfeegl8Nu3bX319lLOOkSlEm7KIgwI2DXdA0IWr3oUV4Sq
	 Gus/LBfZnVL2V/jyWu0wxTETr7zPj8vli0QR/RfHL2pS7jLAFRpitSq/q7B8HCG0sY
	 B8AaPHsq7jiWw==
From: Sasha Levin <sashal@kernel.org>
To: sashal@kernel.org
Cc: acme@kernel.org,
	irogers@google.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	rafael@kernel.org,
	regressions@lists.linux.dev,
	torvalds@linux-foundation.org,
	x86@kernel.org
Subject: [PATCH] objtool: fix libopcodes linking with static libraries
Date: Wed, 21 Jan 2026 11:25:32 -0500
Message-ID: <20260121162532.1596238-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aXDBRPmk1N5m6Jr-@laps>
References: <aXDBRPmk1N5m6Jr-@laps>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 436326bc525d ("objtool: fix build failure due to missing libopcodes
check") tests for libopcodes using an empty main(), which passes even when
static libraries lack their dependencies. This causes undefined reference
errors (xmalloc, bfd_get_bits, etc.) when linking against static libopcodes
without its required libbfd and libiberty.

Fix by testing with an actual libopcodes symbol and trying increasingly
complete library combinations until one succeeds.

Fixes: 436326bc525d ("objtool: fix build failure due to missing libopcodes check")
Reported-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Rafael, I'd appreciate if you could test this patch without the .so symlink
workaround. Thanks :)

 tools/objtool/Makefile | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 9b4503113ce5f..a40f302329291 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -77,8 +77,21 @@ HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
 # We check using HOSTCC directly rather than the shared feature framework
 # because objtool is a host tool that links against host libraries.
 #
-HAVE_LIBOPCODES := $(shell echo 'int main(void) { return 0; }' | \
-			$(HOSTCC) -xc - -o /dev/null -lopcodes 2>/dev/null && echo y)
+# When using shared libraries, -lopcodes is sufficient as dependencies are
+# resolved automatically. With static libraries, we must explicitly link
+# against libopcodes' dependencies: libbfd, libiberty, and sometimes libz.
+# Try each combination and use the first one that succeeds.
+#
+LIBOPCODES_LIBS := $(shell \
+	for libs in "-lopcodes" \
+		    "-lopcodes -lbfd" \
+		    "-lopcodes -lbfd -liberty" \
+		    "-lopcodes -lbfd -liberty -lz"; do \
+		echo 'extern void disassemble_init_for_target(void *);' \
+		     'int main(void) { disassemble_init_for_target(0); return 0; }' | \
+			$(HOSTCC) -xc - -o /dev/null $$libs 2>/dev/null && \
+			echo "$$libs" && break; \
+	done)
 
 # Styled disassembler support requires binutils >= 2.39
 HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
@@ -86,10 +99,10 @@ HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
 
 BUILD_DISAS := n
 
-ifeq ($(HAVE_LIBOPCODES),y)
+ifneq ($(LIBOPCODES_LIBS),)
 	BUILD_DISAS := y
 	OBJTOOL_CFLAGS += -DDISAS -DPACKAGE='"objtool"'
-	OBJTOOL_LDFLAGS += -lopcodes
+	OBJTOOL_LDFLAGS += $(LIBOPCODES_LIBS)
 ifeq ($(HAVE_DISASM_STYLED),y)
 	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
 endif
-- 
2.51.0

