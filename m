Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586E396D0D
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202410; cv=none; b=MmQVjmNtcxhEEkp09mEEJmXR71jP/qv3yJqD/qJaLRYfeb0H95CA4C4LJBOVwk6nAjnhK1oBDWPIsGTMEfTJp3m5kj33oXq/U6blU6Fun2nQUARkCHXHkLCDUzpmfzXwRkWW5bj1rNSo/FyxMYybtYZHqQTpl7hqmAMeu8MqXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202410; c=relaxed/simple;
	bh=9Bev4jjvUbnc7XlkbVqojQsi0GBxp0vU5PjLSj6H1Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeHu9Aa3DmhstA+GtDxz1o4q6MROE/TDQN0LWkGQX0GSx0Ns0LJZwwtJPvjxkWQlD+5gaI65GVPyC9fbS/nvb51GhGvH+lPpZmz40yMYpXGmzVnrVpI17reBO829P996xSr7SyYd+buQWorPSyPHGvrA9EoPYzkP5+swK+Z11KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqwBCA6x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqwBCA6x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso9451445e9.0
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202408; x=1790807208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5bBPD/fgdc2g+Epb2XIUlms+kxdY9UZmRZAc6Exgfw=;
        b=EqwBCA6xG+3VToL2OlzjBa9zVDq5OY0178BFyo5fLSAmJl5L+GEMi+Ud6Toiem8/63
         02nGY/Ks4TAfUTM1oI9A7lX90rw3yyZQvCfflpBEH9IAI6Z/WjBNeAg2TLcXwBsHDXDk
         OljdoKQN1asANksB0ElhoW3JKj+W9WRRQVeiS0y3X1LekgZjNXJrJDVW+OnwlZbtl6lN
         tE4pYLp85DDCP5/LOHD4zY6MESFE7hYcy9aphbj50/dvbRwDJe6ZATCKipCW54pVZ78c
         PnvAP/RkvQad6mCF77cReEFIpTtrkI8IESyxHnJFrY8ka8upG9q38vmJKq4ghOazbIVU
         Ruuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202408; x=1790807208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5bBPD/fgdc2g+Epb2XIUlms+kxdY9UZmRZAc6Exgfw=;
        b=oKgOgtg6HLjxjNdTB01/HYISZGTB9X/vjuEMcwB3uJfDkltQ+FBR4edsu9+u1RiF71
         IwoaXAMEg1tzjSzQdfIBVKzakFHmjujiRfm3uBbuJOb8UMH3YJUiAydkZvmQCEIk+X2z
         gNqsMTuTqRfQVLGzADv4fI+OjmPmCOfOtV+V8NLpl2MoOJQXpHBgPzOXFZuag7S/EEY3
         8kprslTjaKZAIqSc3gfTxSPOK4RIwyC//U8+2VrsNzDIKxrylEC24owM5q/hMTCkQ5F2
         D/rdkth6SrznlA+BeE+mPTPSMfjVtgK/lkaqVv1cjY5hLDb7akm94jN2gIj1y0eB7pIp
         0eKw==
X-Forwarded-Encrypted: i=1; AKwUvBz2RuvkMr+ih/Dzx6d8jBqIc+6EGxsVR2ojeHR6M3mQ+5YVqf+H7XDXEBY4uULIFiYeF15U/fLR/FBBUA==@lists.linux.dev
X-Gm-Message-State: AFuF++mrdEVZiWnw0Gu+J+xTPxtoTvjTYpz2fF8sn34vUFCxhteX0PqA
	5DRtm6ThqRV/Ig2IJe2zDBkeFMvupi0IMp5OyXv6OonTOmETlFPPMkbc
X-Gm-Gg: AYBFou3cKo7AY3pgEId8tXq4pTvDXGMd7ZDWofMj98WROHrgOkCU6r9mh8y9jLE/FHw
	qvOrnnM21WMVlqe0PSzmZg71JZGWytM3P0/fn5GUeiu7tNE4yNJhtUzVqwKQuyiF/oJoeFsy6kv
	LUjgwvL1vvKYZ8bc/sO1vNHs1ayUsmvyl7t8+fpnqhgJfzHOxUC5r7hQTkzrzbHBFDGvxpuK5Nd
	OQN0H91+HOWlFmP3mkL1dwNoIM4hMpmFqPtzdoH/PwyikIR3cVRb9GetsFp0tqmZRObHuoV1jKU
	u0zcEdpMKtbx9ZRaQpiIVpsew9W7hmbVM2kdWaEPTSHkqAw0Mdhwp465EkC0x3Fj2N6zt3yxZUT
	wHYxY0ajypAzr0j8oHKRM9WSzlc/BnRe4T3zhuBv8OjQg+85MRkNu3P62ujtMt6B/FbXQaiTdL8
	rPTS/3M9JiNLhE7JW1z3rEBcTsQUh9OTMEW1wcq9i95wWDfCRntxQ5alygYPE2fkblMuHhuzdE2
	7+MhDho+6ayJY022YlJI6kBTbkO55JwRT/Yrj3cw47jx8Mh4O/qDjfH0+Cc6q2u2VBvu86kQfTK
	uob1YA==
X-Received: by 2002:a05:600c:8b8b:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fe66d470emr9604715e9.14.1790202407439;
        Wed, 23 Sep 2026 15:26:47 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ba0444sm18212535e9.2.2026.09.23.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:26:46 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Thu, 24 Sep 2026 03:26:43 +0500
Message-ID: <20260923222643.19010-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arQbFrGiilXn7ABD@pedro-suse.lan>
References: <arQbFrGiilXn7ABD@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 07:38:55PM +0100, Pedro Falcato wrote:
> So, the question is: why the heck do we need a copy? PMD is still allocated
> by the time we flush the TLB. Why doesn't a simple pud_clear() + flush_tlb +
> free over the pmd Just Work? Am I missing something? The git log isn't
> clueing me in.

I don't see anything you are missing.  The copy came with 5e0fb5df2ee8
("x86/mm: Add TLB purge to free pmd/pte page interfaces").  Its changelog
explains the flush but not the copy, and the only discussion of the copy
in that thread was Joerg objecting to the allocation and suggesting a
list_head on the stack instead:

  https://lore.kernel.org/all/20180529144438.GM18595@8bytes.org/

The existing code already frees the PMD table itself after pud_clear()
and that flush, so it already relies on the table being out of reach of
the page walker at that point.  If it is safe to free it then, it is
safe to read it then; clearing the PMD entries up front buys nothing,
because nothing is freed before the flush.  Nobody else writes to the
table either: vmap_try_huge_pud() only gets here for a range covering
the whole PUD, and ptdump is kept out by the init_mm lock the caller
holds.

> All-in-all, I would much prefer not having a copy of the PMD at all. Perhaps,
> if this isn't workable, then a linked list of PTEs would work. But I would rather
> not have tricky logic at all.

Agreed.  It also removes the allocation instead of weakening it, so no
fallback path is left behind.  I'll send a v2 that does pud_clear(), the
flush, and then frees the PTE tables straight from the detached PMD
table - the same order pmd_free_pte_page() already uses one level down.

Thanks for looking at it.

-- 
Thanks,
Mikhail
