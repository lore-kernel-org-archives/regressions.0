Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629985CBB
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:30:00 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57128297bd7so18810eaf.0
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693668599; x=1694273399; darn=lists.linux.dev;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94vGaJ39BVEqwQYt2X0XTeCa7BR+bq/679T/VBpfA0g=;
        b=MrWiQDhrhLUpG+4iSi89rj5wj8xSxvArokztFPKcbV3WGfHZ0HRLI87kBxoh9Pzymy
         GzRd4QIxejaalgHKlpcPI3CfpQ0KuHqa1psux5L/vzZ4s0ioc48Bq0WviSHNfsFNlBYZ
         6RM85NNI+TqlolQ3EezdI8D8beFoFy3TTSpAscgJLeP/OOaV4WsP/L9YwxYmOv1SzCSi
         a7fe9PBrIcMWu1l9ageLmxhmcOpFo/HdW6NhTHszuz5AOTfcx4iiWy5rMWCfKyuFWG+g
         KQrQkYwoHBLWmfPvsya9Y4n+/uga0vptTz8E+mXFS6Hb6O/U/YyO94aLrFx5CAh66nF2
         s3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693668599; x=1694273399;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94vGaJ39BVEqwQYt2X0XTeCa7BR+bq/679T/VBpfA0g=;
        b=Va5+2h5pyGsPTX1sfC5wISPvmeqDxZK3GOVUEBhW6q+xWlwlVqdI7WXyJeyJ5HSBQ/
         H+Q6eQU/4ZQY77bu/POJ+eHlPGueiXqMmt6KIpQjz1V2setPT7qnkTRpL6djNAHYPfEG
         z0UwvWj/26qds/Ag+YltxxPpUBj9NQrERVhGn/SoHE/N+aXC/QwOalUWBCoK4dXAsXgH
         iWjUWF1DztIdWAJRYWQsc19gA1cp//L41B8yRKSu3kCw54ca2gPpbiwtzvzNtgnec7hT
         EulsmSKzmhusi6rs0GNBvAPQOFVVq+yHAgHNrGPmxYrZLgsT6LkiarCXbfqxav8xmsdZ
         ju+A==
X-Gm-Message-State: AOJu0Yxts3/Tpn6U6HTfP4mMlfkNEyxHxHPYTJET1wMJeXzbpoCowhCS
	lMpUmMJt7B723/QTYo2cVEMEIQ==
X-Google-Smtp-Source: AGHT+IHA0XTRV8+ro9PdmZKhn1UTJ+8ioIcr8KGiOrHgZfMCqzyTp/BRmG0aV3RaSUgLAN9vhIP00g==
X-Received: by 2002:a54:418c:0:b0:3a1:e85f:33c3 with SMTP id 12-20020a54418c000000b003a1e85f33c3mr5821810oiy.50.1693668599087;
        Sat, 02 Sep 2023 08:29:59 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t78-20020a25aad4000000b00bcd91bb300esm1448109ybi.54.2023.09.02.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 08:29:58 -0700 (PDT)
Date: Sat, 2 Sep 2023 08:29:30 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, regressions@lists.linux.dev
Subject: [PATCH] mm/pagewalk: fix bootstopping regression from extra
 pte_unmap()
Message-ID: <8321a347-4a38-526c-97fb-5999ceaf6dd@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Mikhail reports early-6.6-based Fedora Rawhide not booting: "rcu_preempt
detected expedited stalls", minutes wait, and then hung_task splat while
kworker trying to synchronize_rcu_expedited().  Nothing logged to disk.

He bisected to my 6.6 a349d72fd9ef ("mm/pgtable: add rcu_read_lock() and
rcu_read_unlock()s"): but the one to blame is my 6.5 commit to fix the
espfix "bad pmd" warnings when booting x86_64 with CONFIG_EFI_PGT_DUMP=y.

Gaah, that added an "addr >= TASK_SIZE" check to avoid pte_offset_map(),
but failed to add the equivalent check when choosing to pte_unmap().

It's not a problem on 6.5 (for different reasons, it's harmless on both
64-bit and 32-bit), but becomes a bootstopper on 6.6 with the unbalanced
rcu_read_unlock() - RCU has a WARN_ON_ONCE for that, but it would have
scrolled off Mikhail's console too quickly.

Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/linux-mm/CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com/
Fixes: 8b1cb4a2e819 ("mm/pagewalk: fix EFI_PGT_DUMP of espfix area")
Fixes: a349d72fd9ef ("mm/pgtable: add rcu_read_lock() and rcu_read_unlock()s")
Signed-off-by: Hugh Dickins <hughd@google.com>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 9b2d23fbf4d3..b7d7e4fcfad7 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -58,7 +58,7 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			pte = pte_offset_map(pmd, addr);
 		if (pte) {
 			err = walk_pte_range_inner(pte, addr, end, walk);
-			if (walk->mm != &init_mm)
+			if (walk->mm != &init_mm && addr < TASK_SIZE)
 				pte_unmap(pte);
 		}
 	} else {
-- 
2.35.3
