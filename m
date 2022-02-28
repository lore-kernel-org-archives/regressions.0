Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384F915C1
	for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 19:46:17 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id v5-20020a17090ac90500b001bc40b548f9so140429pjt.0
        for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 11:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tR+AhlIqjS9XYnLOtynP2EhZ/OV9mCnZ9eIc3MUdC24=;
        b=EEqg7pUkySZVbQvZfJGIVuw0lXwGWG+go3YvVrAhLQgLhiQhNzDWgCAEyKKhK7DPsx
         H1LWnVGxrPGJ5ZGzxfs/DLiWdoAxZu1P28f0+C1qdVWmaheFrUNc+ZjxCmcoA8AqfTkH
         r9Wsbvj+psRVE1ujQo6yM8ftEYCR7mER0tJ+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tR+AhlIqjS9XYnLOtynP2EhZ/OV9mCnZ9eIc3MUdC24=;
        b=hAUgzbimGkcyHh1+Zvv5bPFoTtEZDvwG0T8nPnTbO0vANOCWp0ef9tJF32O9ImW0X0
         hdrXeA13j55Wl4Q1hr9wmsSqsvV1zpE7ROXocC06vwnh2WuVEPZXbL3kVibATVEfF+iv
         wHnhqP6HBnp9QqL0+5lbVpIbqNmiqqqZo5sSe71hKan6Mqrqoa/yXKbDqDQLnmKUeaxS
         k8NiSUmHN62UitwlUViBLxY/LLOtzN9FfRCoRJ+1mq39GbvlAiQnBB+nbbg+mFiOp0nh
         BrTrZL3gxlf2PhPCT2rgZa3PCQajCOyv4TD53V6WlVkHxXLL7qZ6wY91CevIif/KqNg4
         W6rg==
X-Gm-Message-State: AOAM533csr0nsim8wtvebroIs44x+JEc0027Nh7rLllHiPfqP1v2lsKV
	N1erZb2w9T6aOtdd50hRDwjsug==
X-Google-Smtp-Source: ABdhPJz8yuUY3QLjcjfiLAIH3SgbY2+JCxtn3vQ51x519MkGnccf2G5leuKh/e98pxMWfX9wrbgW2g==
X-Received: by 2002:a17:90a:6688:b0:1bc:5492:6373 with SMTP id m8-20020a17090a668800b001bc54926373mr18053297pjj.161.1646077576522;
        Mon, 28 Feb 2022 11:46:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v10-20020a056a00148a00b004e0f420dd90sm14288692pfu.40.2022.02.28.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 11:46:16 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: Kees Cook <keescook@chromium.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	stable@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	regressions@lists.linux.dev,
	linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] binfmt_elf: Avoid total_mapping_size for ET_EXEC
Date: Mon, 28 Feb 2022 11:46:13 -0800
Message-Id: <20220228194613.1149432-1-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328; h=from:subject; bh=l5ScQA97desVa/cbVIp0ld/aMpV+dI3qivoNgmUT4HY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiHSaEHNpWviXuAR7FBfgnykVicWqBdDFz4Mm5Oxru Wk8kzj2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYh0mhAAKCRCJcvTf3G3AJvL6D/ 4/8Opfekx+etBVTmmg6BBaHAHA8L48+PvyAvXuTrQcBwmTx6u2kHTlNm05KEHD78I3pPl6WFdLidNX hdHtV9YD4pJtlDXWQYpaKFFRSPyMb1Q+Zr3T3Pcw2ONhm72yKR+w2EWSmncLYr9WVuBMr/sMMYY5y0 d4fUjZ0olF55wDUFE+2rN2CcIU4e8HjqVoo+2yvOLqPh8YDdw86l3Z0q9Vj5iq+gH6eLvU5WxEG/eZ cjgfLahNoXjCP0/dlPZeGn4vO8xP36bTR3heewwP2OUFH6FokRxzK85fJXQuhjeTP9WhSdxUtHSezM tHCWIEPOOULFM4ONKAHuXgfjk4aOsipHcg+5sWqeuzU6H3aQb40AiEIR/X7ToKo74ys1wDl1ZYvu2v c07D7+PJ59abndEeaJhxsqJUfYh2JY7ggnaUD/qTMlV+h+6oYiQ2xfc6fp0mcaO4qduMYvC30ATa4G rBzu0m3FByxUJKRnhZnkt6cNIIovqdDVjUbCt0fboRZUO0OOPjAJDGrGqPeArViNIyUJHYJyU87fIC o6/z5yPlNufXyH4ki0eM09QNq+3oIB+MFcUlvE1VrtB4qJYmqVYosQg35kBCPgpeFH9s9ZaIiEZb6q q00aBsO4vT+xKC6RAmJH89G7YBiDGotMkgw0F44f/jTcOCP3obE29Gyc86/A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Partially revert commit 5f501d555653 ("binfmt_elf: reintroduce using
MAP_FIXED_NOREPLACE").

At least ia64 has ET_EXEC PT_LOAD segments that are not virtual-address
contiguous (but _are_ file-offset contiguous). This would result in
giant mapping attempts to cover the entire span, including the virtual
address range hole. Disable total_mapping_size for ET_EXEC, which
reduces the MAP_FIXED_NOREPLACE coverage to only the first PT_LOAD:

$ readelf -lW /usr/bin/gcc
...
Program Headers:
  Type Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   ...
...
  LOAD 0x000000 0x4000000000000000 0x4000000000000000 0x00b5a0 0x00b5a0 ...
  LOAD 0x00b5a0 0x600000000000b5a0 0x600000000000b5a0 0x0005ac 0x000710 ...
...
       ^^^^^^^^ ^^^^^^^^^^^^^^^^^^                    ^^^^^^^^ ^^^^^^^^

File offset range     : 0x000000-0x00bb4c
			0x00bb4c bytes

Virtual address range : 0x4000000000000000-0x600000000000bcb0
			0x200000000000bcb0 bytes

Ironically, this is the reverse of the problem that originally caused
problems with ET_EXEC and MAP_FIXED_NOREPLACE: overlaps. This problem is
with holes. Future work could restore full coverage if load_elf_binary()
were to perform mappings in a separate phase from the loading (where
it could resolve both overlaps and holes).

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Reported-by: matoro <matoro_mailinglist_kernel@matoro.tk>
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Fixes: 5f501d555653 ("binfmt_elf: reintroduce using MAP_FIXED_NOREPLACE")
Link: https://lore.kernel.org/r/a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
matoro (or anyone else) can you please test this?
---
 fs/binfmt_elf.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 9bea703ed1c2..474b44032c65 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1136,14 +1136,25 @@ static int load_elf_binary(struct linux_binprm *bprm)
 			 * is then page aligned.
 			 */
 			load_bias = ELF_PAGESTART(load_bias - vaddr);
-		}
 
-		/*
-		 * Calculate the entire size of the ELF mapping (total_size).
-		 * (Note that first_pt_load is set to false later once the
-		 * initial mapping is performed.)
-		 */
-		if (first_pt_load) {
+			/*
+			 * Calculate the entire size of the ELF mapping
+			 * (total_size), used for the initial mapping,
+			 * due to first_pt_load which is set to false later
+			 * once the initial mapping is performed.
+			 *
+			 * Note that this is only sensible when the LOAD
+			 * segments are contiguous (or overlapping). If
+			 * used for LOADs that are far apart, this would
+			 * cause the holes between LOADs to be mapped,
+			 * running the risk of having the mapping fail,
+			 * as it would be larger than the ELF file itself.
+			 *
+			 * As a result, only ET_DYN does this, since
+			 * some ET_EXEC (e.g. ia64) may have virtual
+			 * memory holes between LOADs.
+			 *
+			 */
 			total_size = total_mapping_size(elf_phdata,
 							elf_ex->e_phnum);
 			if (!total_size) {
-- 
2.32.0

