Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB31A9B2D
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449204; cv=none; b=HFY8PM8iJia76s2eP28blN3hzKsdZ005IGQTgTvgpzFMAIFEMx9F10lzNkR+NRTXSklMbtJv+5qc7Zrp9X19K+QyGdczmPkAph8l065dCq3vWOgcf4KDQSpImmSuDSXl4P/KgJSU+bff8UhKiniN+I6eJ7+UvrKhgiqT4HsV4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449204; c=relaxed/simple;
	bh=BBqs3szBxL4esre0332Pv3td2KRryfSW/KpLMasw1tc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VPbNW05+H1W6tbUeZ81dEmkf5HK7gv8Spv0GEN5hbxrDV19hbsgRZKBO5593Dli7OkMQj6gQSWTQFo5yI97AIM9K74XRDJaoXtqtTTy9ocvcitCSEQhX8edw3VPAaWSryyZUPhGRp7Ixc9sQOMqNp5MVGcYPBS8Kvkgiu3d2D/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Awj2TJ1n; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Awj2TJ1n"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2162259a5dcso32229805ad.3
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449203; x=1737054003; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=haLW7l47J5rMTEJ8zSACBng3wk1nv637cJFnGsiAO+w=;
        b=Awj2TJ1nDbEHQBsT6tMcFsSGdL1/sjFfSI+fzRFI6IqRY+R1L7H3HwExHqxgFrItNn
         T2obS/cZMzFT42cVW25t3ikgmWjG58FQsfFl+gPQ1vXYnDfvFK5/yC+LlSOJh9sWEV+q
         RuYPV8Xq6mbXwFyZCQtvCuYGwa1hrbRUNG0341ak45JkAcU3lZGR707cb6uuh05mDlfg
         jXO2Wj9usnLC49AHRHKEsEFsTGyKHROn/dlSyHRZfa+aCBf4wWa/jMujB2cOfFMOaF1C
         aSun1d3JQ8xEP7S9G4na5dZxlu7/8WrrwEO86NGj0vQFQ8u9C7lV/5HxHaMdRHvLFxpD
         T0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449203; x=1737054003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haLW7l47J5rMTEJ8zSACBng3wk1nv637cJFnGsiAO+w=;
        b=sKH/v6FUfkqnCqk1Uv/0ZoZYA540EgcXVtw5rgubdjFyHmqzcqcMnFfOX5b4zP9O9a
         xtDvvCGaMI1MszeaSJOwhjDcz93yD0SnG9cRm/r/Yn2koUiDdFYpiZBVeXta1EBLFEnK
         dwKWjE4kVdK8e4Y/y/OmaxbHH/IYcl4iU/zXQqzEmEVZPswFMUEfQZPmw9F/xA6TCyKE
         groS0WCJfHbg1FXwEvtZlPX3T/BRVwqwdCS2Zy0debwjtcA6FQx7u/sLmZZJbB2g2X8J
         iiuQjEx+7ZMI16RJVCadp1yCJLPe6GuBgTIYBGMMqICE770mFjXD5gHCaZKoYfSppEVb
         ennQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxq+4WCjhAv5bUicpUbXHw08lifVFqFq2YI1keslbufYzLo9Mdt21PXEfjl4ee/GS8oDiWWkD3z2VNSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuYUUQE2J448K3guy+u0bCl7Q+Vk95/fgHGMAN8Ev/eZbCIk7z
	H1WXspPtki6MCuIboTLPuS7cChEXk86aAtkcQ4RxRp58vdPxOV3htlqFZXlCQEo8CQLq+dNQ6LQ
	eoQ==
X-Google-Smtp-Source: AGHT+IGGyRrFtOiXTLX0QGUwtIUWJLQiVZ+xflS3X78Pqi0jjnUrRHfKUFCx6IqJaMIjpIbZnthCmIRTyvc=
X-Received: from pgak9.prod.google.com ([2002:a63:3d09:0:b0:7fd:432d:551a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db06:b0:216:725c:a12c
 with SMTP id d9443c01a7336-21a83f46a4dmr117318665ad.9.1736449202497; Thu, 09
 Jan 2025 11:00:02 -0800 (PST)
Date: Thu, 9 Jan 2025 11:00:01 -0800
In-Reply-To: <20250109133817.314401-2-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-2-pbonzini@redhat.com>
Message-ID: <Z4Acsese_-Kh1GPr@google.com>
Subject: Re: [PATCH 1/5] KVM: e500: retry if no memslot is found
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> Avoid a NULL pointer dereference if the memslot table changes between the
> exit and the call to kvmppc_e500_shadow_map().
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
> index e5a145b578a4..732335444d68 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -349,6 +349,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  	 * pointer through from the first lookup.
>  	 */
>  	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
> +	if (!slot) {
> +		ret = -EAGAIN;
> +		goto out;
> +	}

This is unnecessary, __gfn_to_hva_many() checks for a NULL @slot.

  static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
				       gfn_t *nr_pages, bool write)
  {
	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
		return KVM_HVA_ERR_BAD;

	if (memslot_is_readonly(slot) && write)
		return KVM_HVA_ERR_RO_BAD;

	if (nr_pages)
		*nr_pages = slot->npages - (gfn - slot->base_gfn);

	return __gfn_to_hva_memslot(slot, gfn);
  }

  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot,
					gfn_t gfn)
  {
	return gfn_to_hva_many(slot, gfn, NULL);
  }

Not checking the return value and doing a VMA lookup on hva=-1 when tlbsel==1 is
gross, but it should be functionally safe.

Returning -EAGAIN is nicer (kvmppc_e500_shadow_map() will inevitably return -EINVAL),
but in practice it doesn't matter because all callers ultimately ignore the return
value.

Since there's a ratelimited printk that yells if there's no slot, it's probably
best to let sleeping dogs lie.

	if (likely(!pfnmap)) {
		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
		if (is_error_noslot_pfn(pfn)) {
			if (printk_ratelimit())
				pr_err("%s: real page not found for gfn %lx\n",
				       __func__, (long)gfn);
			return -EINVAL;
		}



> +
>  	hva = gfn_to_hva_memslot(slot, gfn);
>  
>  	if (tlbsel == 1) {
> -- 
> 2.47.1
> 
