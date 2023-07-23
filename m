Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8D1869
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 21:17:58 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d124309864dso37359276.3
        for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690147077; x=1690751877;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ClyfQRII0KmHt/9r+i0dJc4DTXIAKS+yHZIsBKwm8b0=;
        b=j4Iv6UMTgCAZpk+GOIgvsm5SoPDEVKa3yHiChXovsJAjaTsKLJwsd6ihUoZgOjn+Ei
         Vz0OupFPWW5drRE02+02C4o/WHFDB0+U866ETV6R0Yczyow+OkhWAWipQTgPKGWtvXxf
         1v4TkIjz34NedtuvYZz1EE6ltvXutCWxKUx30amy68jnkyL0qJceNKs0XL1SBjDispzB
         aPYZb7nWmTAmehxMKTA3ln7V6SO3HTCTyAuS3MQdS92h+Pvm4YL8FbFUfMH4KeXvxmMA
         hXJmpRFEU0oLsSpUWkNSVXWjtEh6IQwoKU7dfhEDFz169mbC82/XQVjKgiic5ZgNfG9l
         ab3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690147077; x=1690751877;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClyfQRII0KmHt/9r+i0dJc4DTXIAKS+yHZIsBKwm8b0=;
        b=OggkXuxyhCwaZ92CwgNI8VQAIDM3vSjf+mCN9EiNC7gmFUcYBmg+Gs2SF1VFlVmN/U
         ML0wHchTrpL0HH2n+9qZaXnmFFB7gCXxgdrjC2vaU7UK+X3xGvqTn2U27zctdh1dN0Pp
         hb0dN+hNaXXS3vFMG9wV4o1jCcVRdIbsRrAMyJ7fwMai1HjPKloMeGN9BYIRX0Usql3I
         SlvQaum7fDwcSHS5uX3op7Z/LsEf+ItyOQl3Q41o/HMeZcX8SR+JQhrtChwASdKs7U0y
         1ZAffqbSXwQ8Vgh5VpTGZO23bCxS11PHqdUdUCzjApW9BJWqCukZDbEpkcClXiwo9BzH
         dRxg==
X-Gm-Message-State: ABy/qLZGt+xkgMGN2ilgszd7nkNbBsKgLEOyg5K7qyGzXXOC54XQ1zxS
	PYI5Q255b0l7JjA3YaowmIsiXA==
X-Google-Smtp-Source: APBJJlHahDDGpI2cgHome4itZU+LQz7FHUyWtt38KqofgJTDGg3Tf49kES+F1V1vdSJSSh1GFcGSJw==
X-Received: by 2002:a81:6a45:0:b0:577:3c17:5b2c with SMTP id f66-20020a816a45000000b005773c175b2cmr4330199ywc.27.1690147077357;
        Sun, 23 Jul 2023 14:17:57 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b185-20020a0dd9c2000000b005707b90331dsm2411955ywe.10.2023.07.23.14.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 14:17:56 -0700 (PDT)
Date: Sun, 23 Jul 2023 14:17:55 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
    Bagas Sanjaya <bagasdotme@gmail.com>, 
    Laura Abbott <labbott@fedoraproject.org>, x86@kernel.org, 
    linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, regressions@lists.linux.dev
Subject: [PATCH mm-hotfixes] mm/pagewalk: fix EFI_PGT_DUMP of espfix area
Message-ID: <22bca736-4cab-9ee5-6a52-73a3b2bbe865@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Booting x86_64 with CONFIG_EFI_PGT_DUMP=y shows messages of the form
"mm/pgtable-generic.c:53: bad pmd (____ptrval____)(8000000100077061)".

EFI_PGT_DUMP dumps all of efi_mm, including the espfix area, which is
set up with pmd entries which fit the pmd_bad() check: so 0d940a9b270b
warns and clears those entries, which would ruin running Win16 binaries.

The failing pte_offset_map() stopped such a kernel from even booting,
until a few commits later be872f83bf57 changed the pagewalk to tolerate
that: but it needs to be even more careful, to not spoil those entries.

I might have preferred to change init_espfix_ap() not to use "bad" pmd
entries; or to leave them out of the efi_mm dump.  But there is great
value in staying away from there, and a pagewalk check of address
against TASK_SIZE may protect from other such aberrations too.

Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/linux-mm/CABXGCsN3JqXckWO=V7p=FhPU1tK03RE1w9UE6xL5Y86SMk209w@mail.gmail.com/
Fixes: 0d940a9b270b ("mm/pgtable: allow pte_offset_map[_lock]() to fail")
Fixes: be872f83bf57 ("mm/pagewalk: walk_pte_range() allow for pte_offset_map()")
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/pagewalk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 64437105fe0d..2022333805d3 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -48,8 +48,11 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (walk->no_vma) {
 		/*
 		 * pte_offset_map() might apply user-specific validation.
+		 * Indeed, on x86_64 the pmd entries set up by init_espfix_ap()
+		 * fit its pmd_bad() check (_PAGE_NX set and _PAGE_RW clear),
+		 * and CONFIG_EFI_PGT_DUMP efi_mm goes so far as to walk them.
 		 */
-		if (walk->mm == &init_mm)
+		if (walk->mm == &init_mm || addr >= TASK_SIZE)
 			pte = pte_offset_kernel(pmd, addr);
 		else
 			pte = pte_offset_map(pmd, addr);
-- 
2.35.3

