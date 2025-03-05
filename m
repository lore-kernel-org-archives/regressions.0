Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBB5248863
	for <regressions@lists.linux.dev>; Wed,  5 Mar 2025 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186405; cv=none; b=qtrY0EeV10EHgLAU1eSlXshKgPNlOM418bs0tL1szlw62Pvkhc4lsvPeZTRPii8DPUa50VFmFyAX2wfyxk3jnxy51fsCvRUewKzlj9oIDh3Uk/LW67eEcxDaeQx8XykgJUnyUujrMtSUIdiLozJarI1VNhGeuFu6YcnNVNWsxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186405; c=relaxed/simple;
	bh=PGeG/E7ja4XGWHxNzROzI7h2oCS+EH16SyURg4QxoA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MBQI4XBMdo2khapsTimw7SgjJecYYFwL7v191b20CDfzGpF7BX1w2KdrphBtzoIk42DWPlgEohFSwRIdBVDof+ehKgViMdjjm0jfMmptoqhNYl+AKuzQiu8IaouYNYN8sxk0/EmzRaRfkCxU4GlX59Ptla402YQ2iPyrnxaW5LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rrz7Cy+M; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rrz7Cy+M"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fe870bc003so1882102a91.1
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 06:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741186401; x=1741791201; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1YW5U539CmDNjnWklLjoJJJx5nCfEh8QEnX9CfqX8=;
        b=Rrz7Cy+Msm+DoP+f4/2xo6qyrnk9vMloLjStuQ//PMmvVHKQLwTWP8BIJmh4kgfp21
         gC/RgOfoCsTw6DHpH4IDTAPxEARYpb71v6T9GxuiELIQYV0/amIofLvs2S3RDfRwNWqN
         txe9IO+OR0L1NAhohIc/xkIHwVNxm5U3+j7G8TvVz7c+B0kHeP3fcqjuwCy1TN47qxuM
         uKH9+iX/R78GC9EN/rBAK6f9W1/Pxcip3lj0sEjk8sJO4z7RqwB1Zz27dSNn2Vj+ajYa
         MO8Jf1Rn1JpjGNbyQQv8i5MWPjxm9sijRVfh/bm9gwuzyanSZ17HLU7WW3LayAnsW0zC
         LHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186401; x=1741791201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1YW5U539CmDNjnWklLjoJJJx5nCfEh8QEnX9CfqX8=;
        b=iC+DbbqJtani5Ppbh+C9hpCz1KgHWn93oQPBAbxJE7HsFOGwDdENmnsiyv4U8lpT02
         C9d3ZYeceN6DbEbLEwORHc9U5KsJwQbMPf4nzhosh4iU9XbVhmgGEZwZRWstlJypVCsV
         sn00FY2TigIYct9BkZm/iNQ7284liIjX9MNs5dNdgIs3iycNSJgfVZMAyLiTe+DjUt7c
         +HQIY4zBwq324JuY1BXOhVw/290T65iVrPLdiEHa0cxzcLBEV+JlJhJ+sgmKI8GaSJlk
         c95/9Uy7wPMhXlpaMFmlwEGBkhYbRow2LzjKjdLUTnPNeT27y6Qxd4ZFdR9YfqfbSR7I
         AoYA==
X-Forwarded-Encrypted: i=1; AJvYcCUcu8ANXZ8zTrlCe4kxwbhVZwH+J8xtZLI46nL6oA+BQ2snk49bbf08l+ikGWn7myUnieFUnH5tpJCPMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxNPsPdEXyapWSl6qcsnsN/3Rn0xD4jxzP98d63kS7rtI9Zne3
	1K7lnUHt8CtFieUoDdqviuC1DKJPzyCZomAAQ0uVGOiN0d6HPBnHJQX3lhoDbseq4ThtzUHwo8D
	YkA==
X-Google-Smtp-Source: AGHT+IHAYzQscJ8h7qg5HkSjPcaVcG06YIt5n669L2SaCaC2sybvLMQURj9aN7SRU326Fz9IYsQdsLpJF/s=
X-Received: from pfbft1.prod.google.com ([2002:a05:6a00:81c1:b0:730:9146:35ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f84:b0:2fa:1d9f:c80
 with SMTP id 98e67ed59e1d1-2ff33c2129amr12121356a91.17.1741186401066; Wed, 05
 Mar 2025 06:53:21 -0800 (PST)
Date: Wed, 5 Mar 2025 06:53:19 -0800
In-Reply-To: <2025030516-scoured-ethanol-6540@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250112095527.434998-4-pbonzini@redhat.com> <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
Message-ID: <Z8hlXzQZwVEH11fB@google.com>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
From: Sean Christopherson <seanjc@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, regressions@lists.linux.dev, 
	Trevor Dickinson <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au, 
	Darren Stevens <darren@stevens-zone.net>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 05, 2025, Greg KH wrote:
> On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> > Hi All,
> > 
> > The stable long-term kernel 6.12.17 cannot compile with KVM HV support for e5500 PowerPC machines anymore.
> > 
> > Bug report: https://github.com/chzigotzky/kernels/issues/6
> > 
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/x5000_defconfig
> > 
> > Error messages:
> > 
> > arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> > arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of function '__kvm_faultin_pfn' [-Werror=implicit-function-declaration]
> >    pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> >          ^~~~~~~~~~~~~~~~~
> >   CC      kernel/notifier.o
> > arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-Werror=implicit-function-declaration]
> >   kvm_release_faultin_page(kvm, page, !!ret, writable);
> > 
> > After that, I compiled it without KVM HV support.
> > 
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/e5500_defconfig
> > 
> > Please check the error messages.
> 
> Odd, what commit caused this problem?  Any hint as to what commit is
> missing to fix it?

833f69be62ac.  It most definitely should be reverted.  The "dependency" for commit
87ecfdbc699c ("KVM: e500: always restore irqs") is a superficial code conflict.

Oof.  The same buggy patch was queue/proposed for all stable trees from 5.4 onward,
but it look like it only landed in 6.1, 6.6, and 6.12.  I'll send reverts.

commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
Author:     Sean Christopherson <seanjc@google.com>
AuthorDate: Thu Oct 10 11:23:56 2024 -0700
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Mon Feb 17 10:04:56 2025 +0100

    KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    
    [ Upstream commit 419cfb983ca93e75e905794521afefcfa07988bb ]
    
    Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
    and continue the inexorable march towards the demise of
    kvm_pfn_to_refcounted_page().
    
    Signed-off-by: Sean Christopherson <seanjc@google.com>
    Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-ID: <20241010182427.1434605-55-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
    Signed-off-by: Sasha Levin <sashal@kernel.org>
