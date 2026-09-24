Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3637DAB3
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226619; cv=none; b=btoe8wPw243f/rLZCcdLqhkIjE7T+E1VdQmBSdGXYN7BgXbDL6g9mXksRNH8PkybPzdvpDsoQG1lcbGBExTa0PyaMdBuAmv2PVrIefFw0f2ZUYu5XNI+Vv7a2PrzWiMBluqTK8xNIdTBVzLEVfjXqPegj2z5GLtDV4dHwhFTJXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226619; c=relaxed/simple;
	bh=EzS/SIPwNhc8n/arMuSg3yPaF0nMCEdu+ba1kwNXnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfk4loJp6jiYiFJCK5+bAPNFngIm+PRD+YmZx1ZSiy7+2IT/A70SnFDCGxifQB6R+Z+fbhFkxeLp1XmE1+NVOX5WTMgyD5DsjNiAH46AApCIpZDAa64kJp2SbL+5MHsrFMOlvD2KjVTN/AdOS7frX2OG9eISLzUKtkhQ6jjW60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYpFct6s; arc=none smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYpFct6s"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-484366874b0so1005254f8f.2
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 22:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226616; x=1790831416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Uje1jfPOPcmIbWgJBz3Sa+j8/FJrZMoBTZpzcUyL9A=;
        b=pYpFct6sylOtdnGhXHhR2e4Jsm4LBTFWxeQA2BgsSoKN5IDQDVdZk7frYz8akGc8oV
         aG5rl4zbWQTqZmiHm5qAEOLGDgn1O4sPTi1H+o0RTR/LcKrIFulTy4GCpMjdtRMR0U3T
         JyLZaL3a4/RvuEaSz18XvIUFJ9Ay9kthPmKtXyZDmM1vF92cgwoMVCYBOUFwWUFrveXs
         uhD51/G1tx9sEJqr8vBm+S8iexoHezu6B3pzu85iV6MQ6/1kzElI8jdTOL99SGoOQKVK
         qb0G7FySKDGGBk39X5Ju2fOix/+H9meotGGX0Tg14iEj5aUAqcXCKhqU32rlS0aerEHw
         AywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226616; x=1790831416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Uje1jfPOPcmIbWgJBz3Sa+j8/FJrZMoBTZpzcUyL9A=;
        b=oRAcrRS+0CiEfsQCoWkmFn5t+SrVlyai2REE0ivoBcr+M2brXHrQbW7X4HOLcF4Z5F
         BGJ8M48sMrnOUZ/y+YTViNfxTy3W9jd+QdLhD4ggEo0U5CyqENxuSBkel71Ylp8qXjdv
         hTsnTb9p5/2Kn43XJu5UH0JolC3DGP8XPZpJc7Zy3XG+BlR0/bDlhvPb9BFOf80K+AzS
         J9mLWR2/zjq9s6UXIL3chDVG8sPi9w4n4tgWMm75wa1Qy5loEeJn7VlA4PLGNPQRS/dC
         grZq/iAXAwZn/595vt6MKgTmUgRb88UFTnZXaV/EX21x7cWoSyNYMLO3Yu4Cw8fZbBs8
         8Zpg==
X-Forwarded-Encrypted: i=1; AKwUvBwLAGNeruF2NrwMzmjdXMEtFBtJ+hFpIiDEklBfZjJl3ppMtqKcdF3iJCoEomZIPlw9wBJ+ryAX3KDYlw==@lists.linux.dev
X-Gm-Message-State: AFuF++l+7qbUy5AVnZVa5fuz32Z8SCsVkgU92t/uMa5lCKsau8Nzs4Kq
	RvC7PWATx7O3+hCFl5FGdHoQx3Y4OXO4NSWb+e3+dsxLzCuOtxlWRxqs7FoEKNFT66DjlwB1
X-Gm-Gg: AYBFou2NTn1UvJTwxXpTFCW5aO0G3kwCgunQTRoGHuIc7o/Sau25AjaAn/UkJZDpduS
	SBgWA4MP4k5rjv1DxBiiZ+04dHWQCumf8PX9iiRPYzVdOsfEza1y3R+/NLV+eFBxdS/UN9YSiYD
	1YMrwJckpib1eRQeoPCu48pDKfFqdJ5+NpwuQNJTHWyCJu02o0f+74zrWk0phAZlmkLckNfvSiV
	UdmEyUJP+Qfp7vNhOioFkMUAQJ7QBKMtZU5Z2fGhUKje363StAjnGtldisCU7iGEx2OYaVGLAgN
	mqcnWK16cHIxZZs+b4BmLRQOzB4AFxiE2qIgWUacJhRvDN1F/gxD32CPbj/KF+CL14qujPfWowH
	kjQIeyzZbArvY1QGXMeFhqAskHOA+dXmfWE8GSI8+uCaH9L8wSB2xF4n6kY85hBprA51he+cGAK
	/UxLSN0KXFenDS4z3ItW+ZmFA9uQqTy5r3aZ2zyz88SG2pl/4dRJEKtx3FnWI1I0yoYRTSi0FKs
	pE8u3LuMJnua3tjz+firoX9XboWCF2BCEKSZJgYcGSEf0R4L4VyX6+gHo/mCSAVLXnLo7w=
X-Received: by 2002:a5d:5f52:0:b0:487:232c:a9fb with SMTP id ffacd0b85a97d-4887166daacmr2047188f8f.12.1790226615925;
        Wed, 23 Sep 2026 22:10:15 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c417sm10993394f8f.18.2026.09.23.22.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 22:10:15 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
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
	Pedro Falcato <pfalcato@suse.de>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from pud_free_pmd_page()
Date: Thu, 24 Sep 2026 10:10:11 +0500
Message-ID: <20260924051011.21237-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e1f8a64a-e4b5-4c1b-b83d-50425a7621a4@intel.com>
References: <e1f8a64a-e4b5-4c1b-b83d-50425a7621a4@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 16:07, Dave Hansen wrote:
> There are a few things we need to figure out like having
> pmd_free_pte_page() return 'int' when it doesn't ever fail, the
> comments, and the reverse Christmas tree.

One data point for the return value: the x86-PAE pmd_free_pte_page()
does fail.  It returns pmd_none(*pmd), and vmap_try_huge_pmd() relies
on that to keep ioremap() from replacing an existing PTE table there
(the comment above it is about the sync'd PMD entries).  Huge PMD vmap
is enabled on PAE whenever the CPU has PSE.

pud_free_pmd_page() has no such case: the PUD level is 64-bit only on
x86, and with v2 applied the x86-64 version, like the arm64, riscv and
powerpc ones, always returns 1.

> I'll dig into it a bit tomorrow and see what I come up with.

Thanks.  This box reaches pud_free_pmd_page() on every boot I have
checked, so I can run whatever you come up with through the same
boot-time kprobe and reproducer check.
