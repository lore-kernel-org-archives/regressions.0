Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7F1A9B38
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449269; cv=none; b=Hj9/N+U4fH4Uwzh6iw/utpsTSDFz+pSzX8b3v4OpkFhJeeEZCtWXEKPMtnklJhIifbAJCSQTejQ2d5qTzIE8oHjVDa6wYco131tn7K4xTbslEXeJXsUPhzW0s37gQEbQShcZAHeUpG7HTtyICP3iWZnGjXo/EN0xnNEHrgbAz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449269; c=relaxed/simple;
	bh=0Wqndvrw6Ac797CYqWAX1cSbrSIBep0LKHDXmfAwv3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uSFyAxop9+qhMqeDPC2rZPsg01dsZX489qeVtQzH9Q6N5TDSCDBM3ewrjEmu8sPH35QJhaEY7eNKEgT25AkeOgtqn2pVjYUktQqtiURmgXT+j9D6GW3aFgSCpcEaUsy6u0ksrm9KoU5DHQnBUHlwPc4cAb//xR1cRTa8Dw7SvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvMZ7hkS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvMZ7hkS"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso2280319a91.1
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449267; x=1737054067; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfpA5fbP7TfH76TZ3Uj5yQZsZSY/yn7fUa0meeoBcw=;
        b=MvMZ7hkSRGajxRw0F4YMxRKm7kUy2YKjupYt6fzLHqsMiQxCCoAm4yiBxe1t1rPYpo
         MuyamqXiw3RMCNyjqoubmSGvTeOiSmfAswBllG6t3ZhJbqR7aDqdQbSsN8HBVBze6Feu
         IYur/RD9aeNMQ4dIgAY5mGjbFgcdRrgwfdBCiMQAPeht9IHp3WHr5vIBRWDr/EyM3k/9
         g1QWwLzOYAYHwLqbz9RPa0Zz219ndBgYJKJ640nEZd21qOfDwyzgRFJt0TXLTrN8yM0N
         TtwlqeEE9MJcYY+vYo4+uG3T3XxVrzp5IopT5dQPJlA1sy2rQtAa8omUrsQo1y+5Dyyn
         g8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449267; x=1737054067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfpA5fbP7TfH76TZ3Uj5yQZsZSY/yn7fUa0meeoBcw=;
        b=SbbB+l3j5eDcxIYsIDZGfMDOmD35WKDMu7zT/bhTEIzLlUAHmNX82KzBnp1wRckN9G
         kjDcQy9fVAFWXhIkUFojr48QH0hDBMfv3FInmRR4SvgET7x68jF4P5gH9SL6D7c8FPXi
         9HknxqPBZJ7QdFqTd9XqI8I0KOF0WLZvzLzkOeCUAV9QjUtCaU07uKcArnZFA+4PIhC3
         Xdd5kwjkFaquNfBr4uWpA0F8ns3zsfKOcPrcDt7Ih4/CZXAIN6wi1gqR2jsREEXW9aKs
         X42kqxnCNqRGcrOnMUyuRCEwp+YIbhbmjxnAKr10d0MzPN+8euzDs8spQ32PNSgv7xjq
         RDWg==
X-Forwarded-Encrypted: i=1; AJvYcCUrPDXM4E4dcd04NPYShPTm5ENeRdTQUItNFpYQ8oV/0QgXtKGWw7raqZ/uL16WJsyjADDxCNnkx1x9+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN1hWsIcy9BSYycXrufnSNPq8Q7BmEeO0eu4NoHzRZhsOmXjq/
	HLyV9zQdjVOlUXLPV49y/vIeVJ6fRkxhrSUvUJ7dhWAATMhHz1eiBIIdf03T3sBosM7OamjcWNn
	YDA==
X-Google-Smtp-Source: AGHT+IEy+gndLs4E1tSPKEcp4HwCWd68h7GZr39HDdXY/jAdD+K43aJiHJRninKh3yqF1SWahOdjjhE3bz0=
X-Received: from pjbqb12.prod.google.com ([2002:a17:90b:280c:b0:2ef:9239:aab1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc48:b0:2ef:e0bb:1ef2
 with SMTP id 98e67ed59e1d1-2f548ecc3a7mr10739900a91.19.1736449266829; Thu, 09
 Jan 2025 11:01:06 -0800 (PST)
Date: Thu, 9 Jan 2025 11:01:05 -0800
In-Reply-To: <20250109133817.314401-3-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-3-pbonzini@redhat.com>
Message-ID: <Z4Ac8Xw4ELtHGAHo@google.com>
Subject: Re: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> kvmppc_e500_ref_setup is returning whether the guest TLB entry is writable,
> which is than passed to kvm_release_faultin_page.  This makes little sense

s/than/then

> for two reasons: first, because the function sets up the private data for
> the page and the return value feels like it has been bolted on the side;
> second, because what really matters is whether the _shadow_ TLB entry is
> writable.  If it is not writable, the page can be released as non-dirty.
> Shift from using tlbe_is_writable(gtlbe) to doing the same check on
> the shadow TLB entry.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
> index 732335444d68..06e23c625be0 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
>  	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
>  }
>  
> -static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
> +static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
>  					 struct kvm_book3e_206_tlb_entry *gtlbe,
>  					 kvm_pfn_t pfn, unsigned int wimg)
>  {
> @@ -251,8 +251,6 @@ static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
>  
>  	/* Use guest supplied MAS2_G and MAS2_E */
>  	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
> -
> -	return tlbe_is_writable(gtlbe);
>  }
>  
>  static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
> @@ -493,10 +491,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  			goto out;
>  		}
>  	}
> -	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
>  
> +	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
>  	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
>  				ref, gvaddr, stlbe);
> +	writable = tlbe_is_writable(stlbe);
>  
>  	/* Clear i-cache for new pages */
>  	kvmppc_mmu_flush_icache(pfn);
> -- 
> 2.47.1
> 
