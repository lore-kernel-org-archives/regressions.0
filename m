Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7884AA1CA
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365639; cv=none; b=TVCfmDA3RsbnMPZZ107Tmyon1OVbcXM+lXxtHF8rvv98SEfjDQ+IXOxc9ewg/BcqGnEbbY8aJ7oVJhVFnAu8EWes5+8ofpN8kMnprnpo4YLBlRg4K6v7d2sA6SeRTiKjcpDVev8pre4GSrE3epaWbdGGOgc3BlEX4SKNN1uE18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365639; c=relaxed/simple;
	bh=gOExmsjx/Dcw2wBkDJUC85QTuE+P4KTcC0JuSpPzL5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKcvfqgityBqbS9fFf8qqoQN68RWeZ6Ghqb8Bxx51DZVUk3jTiavcx9qF8XJPGsCoBOqdibIUFZvZTuL827ta0vnRPOvpZYsoqIQ66Dj9z9C/V4IAazuXHxcrlLmQxGMfAMLdIT4Kff6WsleKGkSvAMrAuztjs0yfKqUm/9eWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSZMOK/v; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSZMOK/v"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25b661d37dso193964566b.0
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788365635; x=1788970435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=HSZMOK/v7k2zj2bMshRmZNDDwkQFMLo5ys8Faj01Q0KTYhvSulnVJwHfNE0Emv1PKF
         h1MA1aoKRlqrU0X0M1zwwKroCub0h11H//VcfPzPxEd9o5MqmanzmmFXRRSdH+s/lfZQ
         PaXwiEWdRBHbhRwQBHxKMq+MB66pf4X2ZDkIkVGswifeG1JaVGSo46pMj9/V6wOOPjXK
         RjhodX8BlH+5MekHzWJGYy6Eiyl90aWnMq1ceZYRjLzKCT3QUS8ic0QIwMwni3Geit3B
         q3UiXTHPksHVKR1WkK7i3YEEHkB0KBBA/p1RTk4N1n2/YirOD8531p5EskZmld5QVUkf
         AR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365635; x=1788970435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=BkegQi5Y928GzH19Uf64ZO62MoIfwQeq83bH7E0aW7aOQOZJ7+u9MdBebJrbdwCnGQ
         RjWp7K+XIUgudv5JxotqXKlb5ItAcZOZgbgvK8G0zAFt1+IkHM64zGDWBowBJtwO4XFo
         d8wO7ccB0Txgh9voyD8Z7Xz3NyT1Zfhx8iMPlZcSfQbti6HlkUaX8PfG8gtQxfQpZW0B
         YpTEb9+qvy7xPmKsyvIlSPdr7ZhnVKC1odJhzMjsz/JnT8yUcIvpaJnRu1eYk7cHWRUr
         fYu6QM4OG81I0j9xVVEUDgzMJxvym0H6xCaaD6IJ68z2bn21S726g+fqN9ecx97ubOmX
         0AkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7jq+ucK7wh9RFbzuZltcOgqOcq6JURsbqS4PLq78c0STjBvCVdnkKtlvXZuIYawKv3EN5cyWIPKotVQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nyom2EiuVfJB9AFg2Zgwf7SbBVQg+VVrrLUxwUoxg3NJ1BQlEg
	65AISKrvguucscKFjurN7I8zobGZuvdjetZTCnSOa0r9HfbZeeqo7ZpQ
X-Gm-Gg: AYBFou2whXIwkSxMU+hwGm8RYF0PbhdlyDefUX1OOSMb72R9lCAfksVNE32ukhowUia
	o8ttCsGbnV9cg5RK5eipxJTkzziDCQDICOxlf55jTG9XMgNQrQ28zCVjmrYWfnzf6S4qfFtzt90
	scfM3C7FbSO9qBV8o+U2emDb1Jb62UJr4t/g0NBrAIvUcB8GEgfO2MqzGYxophj2JeGcw8TKvKb
	DjUEukVcwEtaf2oX3dDNsvXTEGATRrLXOxtz/tLqYtDwt/liWN8pLmpDZFfY8aGnWd91wG7QvRD
	+zi/IYWWQQ1jSxwT7X1zh/NOH/uoLjNdYIyl9GQqohv2SFpmHh0qCAH5oEDeTcTnQM9CwKZaPvo
	Uj42qcUmUCMPr0EM/l9eZKbGWXixdt2EmMUQgTT67NpHWBHSWi4ei/8O/nk53nKfKagiyivvs5R
	j2msyhxuVVhV+XhG65cXzJOvzhvfk1bsWKlL8+it9eKhH4pwOtPJXz1g4=
X-Received: by 2002:a17:907:3ea1:b0:c20:33db:41d3 with SMTP id a640c23a62f3a-c25d5476414mr370581766b.11.1788365634473;
        Wed, 02 Sep 2026 09:13:54 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:48::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm167062066b.32.2026.09.02.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:13:53 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [PATCH] kbuild: don't delete in-flight filechk temporaries in asm-headers
Date: Wed,  2 Sep 2026 09:13:47 -0700
Message-ID: <20260902161347.4163577-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
subdirectories") switched the stale-wrapper sweep in
scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
invocation, so that generated headers in subdirectories are considered.

The two do not match the same set of files. Make's $(wildcard) uses glob
semantics, where a leading '.' has to be matched explicitly, whereas
find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $@)
before renaming it into place, so such a scratch file, if it happens to
exist in $(obj) when the sub-make is parsed, is now picked up in
old-headers. It appears in neither generic-y, generated-y nor syscall-y,
is therefore classified as unwanted, and cmd_remove deletes it.

On x86 this races with archprepare, which lists both asm-generic and
arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
-j they run concurrently against the same directory, and the build fails
intermittently:

  mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
  make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/cpufeaturemasks.h] Error 1

The same commit also converted the generic wrapper rule to filechk, so
those wrappers now create .tmp_*.h in $(obj) too and can race among
themselves.

Restore the previous behaviour by excluding dotfiles from the sweep.
Subdirectories, which is what the find(1) conversion was for, keep being
descended into. While at it, quote the -name argument: it is currently
expanded by the shell against the build directory before find sees it.

Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
#regzbot introduced: 2d69b891e646

 scripts/Makefile.asm-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index b38931314ad7c..f1c3d287c14b0 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h' ! -name '.*')
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
 filechk_wrap = echo "\#include <asm-generic/$*.h>"
-- 
2.53.0-Meta

