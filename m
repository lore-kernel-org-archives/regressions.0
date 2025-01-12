Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC91A8F8E
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675742; cv=none; b=SxLyVl3dyFUF+EzHn4PWG00UGwjDj7PbQSE6TfhMhnWtBCkkkn9JD1e/XowBdjvmAONzbzQzX5BjKugFs5//vbmPXx9Ox9HzvjX/4lph3opNXZiT2OoydIrhNSpZlf8O3ib58XVk5VPBOKlbVL+KfJBTd0dWavKYVsRiq2sH/pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675742; c=relaxed/simple;
	bh=RUtYNoQ9BCw8rR1uJmMHYjgVRzEI8pcTkgifDneD3LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=KtciEy5QKSNYAW3GF8ePwALJ15MSJoo75DM+Urs4BRbXIBo9rAj8fgDXWNI+QqFQMLIOWvCpYaM6YaiaQ52Ebm6OahO5SAyI2fNLo+718NUpAVk/1DPIILnlwoiASPloGDFGkO7QMOjbIjLIc9rVFpp+U0qllx087QOPLbdARuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJAbn9Oa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJAbn9Oa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
	b=NJAbn9OaEx/kJFcY/+MZpPCQlDEZcb7RWFa45QTLKhZFQJq3Pc4hLyCf1Y/IFPyY45aMjC
	oURPcdRtGqDeqV1BzL6/+7G2rV3C2XOK0B//bYNY1kpA3g5zqgMj3eo9k08mu1EfCaHGTq
	F1hccReFGR5Ltu6fD1+aI0wNdTjGHA0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140--LKUQHuZNaao0U1YsUoLrg-1; Sun, 12 Jan 2025 04:55:37 -0500
X-MC-Unique: -LKUQHuZNaao0U1YsUoLrg-1
X-Mimecast-MFC-AGG-ID: -LKUQHuZNaao0U1YsUoLrg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a831f93cso401095166b.1
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675736; x=1737280536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
        b=Zq134GgyQ/01V8mj2W6gOZQI8cuRZoSYkGzCwmTogdSoJeFel5pAGfNXE1N6NaZue7
         0zc1y1f3BwTXiINCvw+HkRHAuix/LMU1ZBdu1L0QHMUVjsCSt/j3RkzYj73i4yewPqWd
         p4EYA37161B4dZ3rrqlf/yWtkrVL/LfoFtBUuTC6tWUndnvm+n2gPuzAGMmhNu/ZxWf6
         rJRh1OGo1egebq9sJU42GWwrVmmYE6o1W3Go0wffwLEV/2H7QaZxu9h9vczuTXvNIDM7
         TNk4kjn9/Io6gPh8kaoiGdI++DKx4BjM7AlvT0nyyIWX/yJiGdcwjoPhfF7osvwqIWFJ
         P4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXiL1HuAf08fQDo8zEO0rW6GPz85ApSx/CIy6RltZ8k7iilAv1Q9kc9WeBf1HYUTvYRmGxdvpuYr6H/CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoHx5eb40F2CDJRagcDNG+FiK5srKeG4qIXxJH4ZoTWwd5mEL3
	p/HVvb6PibxE0KiD1gJZcVWONGJKx39VU+hoDrHIiXSbEomWOFXlfvR2dgcV2bRe9mQ5LBilzNS
	asBkRBiZsvBcKhfBrx8NQF0UAHMcX3lUm7RdLJFSij1aWX3X6jmkEhYaF6+Go
X-Gm-Gg: ASbGnctimN/Y9McdJs1TVaYp+H2xkKaibtlgyKD8LFYg8u14Cw8gsqvc+94hoRiXRkN
	gFsmNyKY5xDWxNW3G03A/qTuaSI6YOMgZbDXrdHewMn2yozpreG05nninMIJMrSCHdp86lX6BVG
	GjjYHxAVLrJOz+DnNo0GWTMDdAqrcTI9yxYBjbfUtwiQJMT+p3f2GRN9yg0LEvmKNBZLKuiSA2J
	mc71aB8bHU+OYSy7KYVlxqSIBaA+EQguHzvHNrYPzs8ndSXw4hXZH1Pwx4=
X-Received: by 2002:a17:906:478f:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab2ab703f93mr1611128466b.17.1736675736618;
        Sun, 12 Jan 2025 01:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE57lWwmpDxmyLrpFomxsQp5nUpO/tCN5jrf13BA6wccxa5tYF5ClNyyJ2YVR15koS+dU7MVg==
X-Received: by 2002:a17:906:478f:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab2ab703f93mr1611127466b.17.1736675736279;
        Sun, 12 Jan 2025 01:55:36 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e283sm356143866b.31.2025.01.12.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
Date: Sun, 12 Jan 2025 10:55:24 +0100
Message-ID: <20250112095527.434998-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250112095527.434998-1-pbonzini@redhat.com>
References: <20250112095527.434998-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: svWxVMOGNmK9ExbllKqO_ZguXuThB0MfGMkw0zvfN5s_1736675737
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

kvmppc_e500_ref_setup is returning whether the guest TLB entry is writable,
which is than passed to kvm_release_faultin_page.  This makes little sense
for two reasons: first, because the function sets up the private data for
the page and the return value feels like it has been bolted on the side;
second, because what really matters is whether the _shadow_ TLB entry is
writable.  If it is not writable, the page can be released as non-dirty.
Shift from using tlbe_is_writable(gtlbe) to doing the same check on
the shadow TLB entry.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 6824e8139801..c266c02f120f 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -251,8 +251,6 @@ static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
-
-	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -489,9 +487,10 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
+	writable = tlbe_is_writable(stlbe);
 
 	/* Clear i-cache for new pages */
 	kvmppc_mmu_flush_icache(pfn);
-- 
2.47.1

