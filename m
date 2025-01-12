Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A319F115
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675751; cv=none; b=dvU5b6BzUiErSpUqHHMvJo9bCgnziIR2KngFAf2vuUdjal+e3B2vEYGe7T72FDxSR4QzYpwKFyPjlQb/+iRtyMiylrwkUdpoWRuZCzFAXQ9Szy8wlPCzQEGraiYzY0ctF9AopWm0PqPwAbPEcGMyTnYMJyfYmpD1BqDHm+6CkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675751; c=relaxed/simple;
	bh=hLGdHo4tiVX9rnua7cU6TNNXH51b2lPfYTsAAypovsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TtAlsf0Ipe5qBEvJGPjxtUShzFaKdf+C6CeON2yytD33nPYH79HHoIxSGjMsG/MCeHrE97hJcbOhvprgq29fox8NoNE9EKxXS36dqFuBhYEvQsl8gXQdpW8OxMjhYfd993ufedaULFuyOt+vraHwsnf9CAl7aHAy1zoh3EY2/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRfSvUYa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRfSvUYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
	b=NRfSvUYa+MQHWryKoSPeSRMt+tx/51e44DJkwoaFOlXIVIxoHD620Y+VC9PAT2Ok8g0gSO
	amNgDV2SAhkp3FH+/885LTy0IyUHQI9akJxk6McktlJqujd8L/OEU3MAt+Hf47ts3BxR1j
	OsE/DakdX8q/YUCFmJ8FtUNEkAU40p8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-auuh3hKkPZ-wcWgKdJvlkQ-1; Sun, 12 Jan 2025 04:55:47 -0500
X-MC-Unique: auuh3hKkPZ-wcWgKdJvlkQ-1
X-Mimecast-MFC-AGG-ID: auuh3hKkPZ-wcWgKdJvlkQ
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3f0411814so2848826a12.0
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675746; x=1737280546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
        b=jWDdqeySLRsQ5il4gvpW8NCcn4yOH9wu4BzjT5AfgUe9vKQSs2FBJAXKhUwSBq/EGq
         CpcaWkAFD1UDkffSkWSrcxKrnONFcYIipYawS9uiC7nhZ24kuK+6HYolLyu08q9hxoQq
         vyypCd7zlemL2Wevf3o9T3NBQWtmol5ze9Oxr2iFo+sKT1x+ku4dYtt38JA5nnJ8zIBb
         ml29J1jJn2MMzWVJn/UTCG9BtDk8AhexfLUFwYDHM5eyOIhoffoCur/3IdSWWu1FBmfY
         OEl82yJzOqpzEItsOxOI6x+n/AnYlx7TKjZBT7lK24lq86/Zmzf9fyjvvG4jmEf4noec
         GQyA==
X-Forwarded-Encrypted: i=1; AJvYcCUvEnDdsajjWpwHivOhNM7GL6BM3MVkeDADH2aGApWm0mDpO5zerDsyQndC/kr833p0X73zs/LwFb6nkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxuckVxGrrgpRyTZQK8iuz1CTv9vQ8xqTdZU2EMpZdtC/Grw0j
	BjvCMsgAdoXEGKC52AVotdE3oU17EVOstxO2xMAWOPRcP0r6O31eC/LEv3Tm+c/sCYPaICcbGeb
	JZkry2e4Hq6zzX8KbSnTfDm3iyQOr2KU7a2U4axG3ygGQ3RuW7/k6ye+oi60TtA16HS+h5aA=
X-Gm-Gg: ASbGncuCj6Q/ztP33D4Wl2tL6j/3MKXaxxjrxFMxHzwjKAmMcTkLMhADWaqQ0tfs2YU
	slVpyp8wMjIsafhZZ7+kedZVUGiGNLmtu6KsQZw2xw+MJ8SQgpw0aTgkXSphhfZne3IPGQpxmdO
	wJWk0qWBsr6C71TK9KgulglY/+urKIWMy/fJSkxQNkcVC7Zzq3CIr4y5CE/MA5nlnTSa/2e9sSE
	w0mmDGpPmxkbOBRwyW7kGAyuTPXmrDPrVDzI1r5OhvfIoiKZWnZ4JCzIng=
X-Received: by 2002:a05:6402:51d0:b0:5d2:7346:3ecb with SMTP id 4fb4d7f45d1cf-5d972e08366mr15294465a12.12.1736675745737;
        Sun, 12 Jan 2025 01:55:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwE26l9isFf3nQZmRGpyTPcP8J8/ysUQYlXL5+4ti/a8bZoN63209mlmD5afvsephqydEaqg==
X-Received: by 2002:a05:6402:51d0:b0:5d2:7346:3ecb with SMTP id 4fb4d7f45d1cf-5d972e08366mr15294450a12.12.1736675745359;
        Sun, 12 Jan 2025 01:55:45 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c3fccsm3491359a12.21.2025.01.12.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 5/5] KVM: e500: perform hugepage check after looking up the PFN
Date: Sun, 12 Jan 2025 10:55:27 +0100
Message-ID: <20250112095527.434998-6-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: GTlXhiM0CSMBDoGr98yPsS5ULVF_juH5cD0O26Y9tnY_1736675746
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

e500 KVM tries to bypass __kvm_faultin_pfn() in order to map VM_PFNMAP
VMAs as huge pages.  This is a Bad Idea because VM_PFNMAP VMAs could
become noncontiguous as a result of callsto remap_pfn_range().

Instead, use the already existing host PTE lookup to retrieve a
valid host-side mapping level after __kvm_faultin_pfn() has
returned.  Then find the largest size that will satisfy the
guest's request while staying within a single host PTE.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 178 ++++++++++++-------------------
 1 file changed, 69 insertions(+), 109 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index b38679e5821b..06caf8bbbe2b 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -326,15 +326,14 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	struct tlbe_ref *ref)
 {
 	struct kvm_memory_slot *slot;
-	unsigned long pfn = 0; /* silence GCC warning */
+	unsigned int psize;
+	unsigned long pfn;
 	struct page *page = NULL;
 	unsigned long hva;
-	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
 	int ret = 0;
 	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu_e500->vcpu.kvm;
-	unsigned long tsize_pages = 0;
 	pte_t *ptep;
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
@@ -356,111 +355,12 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
 	hva = gfn_to_hva_memslot(slot, gfn);
 
-	if (tlbsel == 1) {
-		struct vm_area_struct *vma;
-		mmap_read_lock(kvm->mm);
-
-		vma = find_vma(kvm->mm, hva);
-		if (vma && hva >= vma->vm_start &&
-		    (vma->vm_flags & VM_PFNMAP)) {
-			/*
-			 * This VMA is a physically contiguous region (e.g.
-			 * /dev/mem) that bypasses normal Linux page
-			 * management.  Find the overlap between the
-			 * vma and the memslot.
-			 */
-
-			unsigned long start, end;
-			unsigned long slot_start, slot_end;
-
-			pfnmap = 1;
-			writable = vma->vm_flags & VM_WRITE;
-
-			start = vma->vm_pgoff;
-			end = start +
-			      vma_pages(vma);
-
-			pfn = start + ((hva - vma->vm_start) >> PAGE_SHIFT);
-
-			slot_start = pfn - (gfn - slot->base_gfn);
-			slot_end = slot_start + slot->npages;
-
-			if (start < slot_start)
-				start = slot_start;
-			if (end > slot_end)
-				end = slot_end;
-
-			tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
-				MAS1_TSIZE_SHIFT;
-
-			/*
-			 * e500 doesn't implement the lowest tsize bit,
-			 * or 1K pages.
-			 */
-			tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
-
-			/*
-			 * Now find the largest tsize (up to what the guest
-			 * requested) that will cover gfn, stay within the
-			 * range, and for which gfn and pfn are mutually
-			 * aligned.
-			 */
-
-			for (; tsize > BOOK3E_PAGESZ_4K; tsize -= 2) {
-				unsigned long gfn_start, gfn_end;
-				tsize_pages = 1UL << (tsize - 2);
-
-				gfn_start = gfn & ~(tsize_pages - 1);
-				gfn_end = gfn_start + tsize_pages;
-
-				if (gfn_start + pfn - gfn < start)
-					continue;
-				if (gfn_end + pfn - gfn > end)
-					continue;
-				if ((gfn & (tsize_pages - 1)) !=
-				    (pfn & (tsize_pages - 1)))
-					continue;
-
-				gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
-				pfn &= ~(tsize_pages - 1);
-				break;
-			}
-		} else if (vma && hva >= vma->vm_start &&
-			   is_vm_hugetlb_page(vma)) {
-			unsigned long psize = vma_kernel_pagesize(vma);
-
-			tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
-				MAS1_TSIZE_SHIFT;
-
-			/*
-			 * Take the largest page size that satisfies both host
-			 * and guest mapping
-			 */
-			tsize = min(__ilog2(psize) - 10, tsize);
-
-			/*
-			 * e500 doesn't implement the lowest tsize bit,
-			 * or 1K pages.
-			 */
-			tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
-		}
-
-		mmap_read_unlock(kvm->mm);
-	}
-
-	if (likely(!pfnmap)) {
-		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
-		if (is_error_noslot_pfn(pfn)) {
-			if (printk_ratelimit())
-				pr_err("%s: real page not found for gfn %lx\n",
-				       __func__, (long)gfn);
-			return -EINVAL;
-		}
-
-		/* Align guest and physical address to page map boundaries */
-		pfn &= ~(tsize_pages - 1);
-		gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
+	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
+	if (is_error_noslot_pfn(pfn)) {
+		if (printk_ratelimit())
+			pr_err("%s: real page not found for gfn %lx\n",
+			       __func__, (long)gfn);
+		return -EINVAL;
 	}
 
 	spin_lock(&kvm->mmu_lock);
@@ -478,7 +378,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	 * can't run hence pfn won't change.
 	 */
 	local_irq_save(flags);
-	ptep = find_linux_pte(pgdir, hva, NULL, NULL);
+	ptep = find_linux_pte(pgdir, hva, NULL, &psize);
 	if (ptep) {
 		pte_t pte = READ_ONCE(*ptep);
 
@@ -495,6 +395,66 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
+	if (psize && tlbsel == 1) {
+		unsigned long psize_pages, tsize_pages;
+		unsigned long start, end;
+		unsigned long slot_start, slot_end;
+
+		psize_pages = 1UL << (psize - PAGE_SHIFT);
+		start = pfn & ~(psize_pages - 1);
+		end = start + psize_pages;
+
+		slot_start = pfn - (gfn - slot->base_gfn);
+		slot_end = slot_start + slot->npages;
+
+		if (start < slot_start)
+			start = slot_start;
+		if (end > slot_end)
+			end = slot_end;
+
+		tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
+			MAS1_TSIZE_SHIFT;
+
+		/*
+		 * Any page size that doesn't satisfy the host mapping
+		 * will fail the start and end tests.
+		 */
+		tsize = min(psize - PAGE_SHIFT + BOOK3E_PAGESZ_4K, tsize);
+
+		/*
+		 * e500 doesn't implement the lowest tsize bit,
+		 * or 1K pages.
+		 */
+		tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
+
+		/*
+		 * Now find the largest tsize (up to what the guest
+		 * requested) that will cover gfn, stay within the
+		 * range, and for which gfn and pfn are mutually
+		 * aligned.
+		 */
+
+		for (; tsize > BOOK3E_PAGESZ_4K; tsize -= 2) {
+			unsigned long gfn_start, gfn_end;
+			tsize_pages = 1UL << (tsize - 2);
+
+			gfn_start = gfn & ~(tsize_pages - 1);
+			gfn_end = gfn_start + tsize_pages;
+
+			if (gfn_start + pfn - gfn < start)
+				continue;
+			if (gfn_end + pfn - gfn > end)
+				continue;
+			if ((gfn & (tsize_pages - 1)) !=
+			    (pfn & (tsize_pages - 1)))
+				continue;
+
+			gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
+			pfn &= ~(tsize_pages - 1);
+			break;
+		}
+	}
+
 	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.47.1

