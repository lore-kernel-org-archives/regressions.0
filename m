Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E121DE4DA
	for <regressions@lists.linux.dev>; Mon,  6 Jan 2025 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189876; cv=none; b=GP5On89g/YYWFw8lG4SWoHGbDrkq7NHvWk7BHtZq3Oi6kKpzJRIHDmaPSG6umnIImQDSRb+VzIwVlR212RqOk5QiOLRt7q3eWa8Q0Y2h+hdUE02+pzmJTgtCOSe9+azU6OUYXmHxv5QcHJ03nEqfZnS8sjc4oriAvYzuSQbJOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189876; c=relaxed/simple;
	bh=2OZKrS1dUkLlPuhPdhwGi7QnWZ+8XGoT1QDIIrdkEpI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SkQYYZcv1L+7d/n7nwCeq9bjYmQ4EDwsMBRrYqPSPc0E8HhDfnuqW5HQruhAzwgKm17FTJRFkgj4jSFBm7NX8SJsG1b2e0cKQwX6u1w+0YyfRg5XcUv0+g1nXWZN/4PqYrp1W36r3y6SQBIEIHWVggriCbJDDkXO8S/Fi3deZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=075skolL; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="075skolL"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2165433e229so212423955ad.1
        for <regressions@lists.linux.dev>; Mon, 06 Jan 2025 10:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736189874; x=1736794674; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/aNADIekx2j0/enI87SMjtmQjX7teTUCuYI/dNHjl3o=;
        b=075skolLsukqed0BLXR9EDcIOiHCMsKQQQ09q3+i6vtZzdeu3O7Md+rHzy1HurPiot
         /uGEwjhkiBIHligF4d+jZiLjaV6qDXNW4YdyPnvFrHcY7zLns88xvSfE1UyWZR06P3BS
         0L+NTmxlvlfmES0XqYXFHNiTr85ZvVypo4YP5ni+U9YLjjI33+EnUnG70nr5h3ndeXE5
         zK6SJBBanmXYbePT0OpOVsKqm28/+Dw4C4DkGnTMwqLhnYv89wfzTk64ptLoIzlce7+Z
         Nqzwhpwk1THZISFkFe+eVrKc++PghD9i17Bi4V8n61vsf5kuq58lkquPTuG7dUGanCLx
         OzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189874; x=1736794674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aNADIekx2j0/enI87SMjtmQjX7teTUCuYI/dNHjl3o=;
        b=J28+of5cQgktYQQbf9Av+wLZM+tc0zgZFlQczJ/yu3Cc6A+lA3m3QZLDUpbMg/4Gr7
         t08nESybAdrwMYm8OKfR1Fn6NASgfjwCWMkZ6W4bPnevgxKXRNODaejowVaa2jok8epX
         hP0YxCWYhDMMzCLv6TGJ+44F/av8ABnMmE7UjXcuUHu9Zmz6c5G66xWomtrtLOsulOdV
         tl0Zjem2Bt9k+V9Y2+HDQOxXJTc/f+nsnURfbDaD1/ladirVxIABEin7fDqyZ//f9aN5
         aD+k7TcvUjZ9mh3UlvOihSGxvLTGeX5Jw38HpWMV9LxdVnJiULdwOVTYOEbgE+tI3JEV
         WPww==
X-Forwarded-Encrypted: i=1; AJvYcCUoZToRVCMRWCNMhcN3EwR5My8OlXCo4tIbz/aKvIllTfESpf2qgdqnQwD8o8k64B5EzTqMYJLWsPyb/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcpm6xESY+BsDkKeE9y60k7ANQl38Uk86AqplvI8VLO3bNKqwr
	1HcbFNPQKhlxC+z3SdbmjNUZRQ+uwm4fQfrmbbrFaYj5beVFun/Q1qxy58QTm67vTgtXdgtC7rF
	c3A==
X-Google-Smtp-Source: AGHT+IFTUQyqLv9XSGGLv1fnVkWYgSUL4cT3Eg9R6oafiMKaRGpJd6axUPFHZbm1bK48Dbcs7JdFs6gpXoI=
X-Received: from pgbcv4.prod.google.com ([2002:a05:6a02:4204:b0:7fd:4d08:df94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:8412:b0:1e1:b727:1801
 with SMTP id adf61e73a8af0-1e5e07a55e8mr87767148637.27.1736189874330; Mon, 06
 Jan 2025 10:57:54 -0800 (PST)
Date: Mon, 6 Jan 2025 10:57:53 -0800
In-Reply-To: <20250101064928.389504-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250101064928.389504-1-pbonzini@redhat.com>
Message-ID: <Z3wnsQQ67GBf1Vsb@google.com>
Subject: Re: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 01, 2025, Paolo Bonzini wrote:
> kvm_follow_pfn() is able to work with NULL in the .map_writable field
> of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
> despite KVM for e500 trying to use it.  Indeed .map_writable is not
> particularly useful if the flags include FOLL_WRITE and readonly
> guest memory is not supported, so add support to __kvm_faultin_pfn()
> for this case.

I would prefer to keep the sanity check to minimize the risk of a page fault
handler not supporting opportunistic write mappings.  e500 is definitely the
odd one out here.

What about adding a dedicated wrapper for getting a writable PFN?  E.g. (untested)

---
 arch/powerpc/kvm/e500_mmu_host.c | 2 +-
 arch/x86/kvm/vmx/vmx.c           | 3 +--
 include/linux/kvm_host.h         | 8 ++++++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..2251bb30b8ec 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -444,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = kvm_faultin_writable_pfn(slot, gfn, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 893366e53732..7012b583f2e8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6800,7 +6800,6 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
-	bool writable;
 
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6836,7 +6835,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_page);
+	pfn = kvm_faultin_writable_pfn(slot, gfn, &refcounted_page);
 	if (is_error_noslot_pfn(pfn))
 		return;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c788d0bd952a..b0af7c7f99da 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1287,6 +1287,14 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
+static inline kvm_pfn_t kvm_faultin_writable_pfn(const struct kvm_memory_slot *slot,
+						 gfn_t gfn, struct page **refcounted_page)
+{
+	bool writable;
+
+	return __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, refcounted_page);
+}
+
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);

base-commit: 2c3412e999738bfd60859c493ff47f5c268814a3
-- 
