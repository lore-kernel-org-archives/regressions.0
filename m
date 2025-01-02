Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A97442F
	for <regressions@lists.linux.dev>; Thu,  2 Jan 2025 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837451; cv=none; b=NoeGdX6TfiIw9eUdlHxdYKfYfStrVtU0R9wx3QWvjwGNLUqXEbXnTZZ9KL1ZaL+njAoSGQ4sMLV6UY/uMlBy7aph0Q0AatsnTOz0iBhfgnAPQNm6uPR6mlONu8DDzmBQbJPhlWF1P7Cg752BBXt0cn0Io+FC0++ckk2WYbAEpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837451; c=relaxed/simple;
	bh=2s40S4b6USjGIdNljcVdkIWW3U93jkP6hNwEQFJvfis=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ET7U0RI4COXtqWEoLOA3vSUUVSaTimEOc8LuHXPHyxVAQoFa3K1U60tmNPfiKtJRf7eaZRGHB6ER8rYdUtWohRYjQwqt/BH9WVXKjTR1eNjvbTNwbBYsmfq6xtbQGQ7b1o0TOX9Ufe0sMDfh3ql+HDaz4OYjwFLq8LQ0IJ0o6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ob6lFQyG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ob6lFQyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735837448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIhfj2neT2Cq5Sys8iG+Q7GAI3LQhoUylThNksKZoFg=;
	b=Ob6lFQyGRs/w8KHfd2srmqxPRNavQFG4NbvebsmWMpGykH6LTsz1+dphnYkzqB6oktZB4J
	mEc7wgU+nP0QDSR4fCZwZeGUJUB3otWbjCXQlIFlCWnvqipqDpgVbYnespaN4SQowo/zLj
	N5dG1yj2sGPFHEILpduZW7b7XAyVzxg=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648--g9ANvEwN7-wxlU7AvYzRQ-1; Thu, 02 Jan 2025 12:04:06 -0500
X-MC-Unique: -g9ANvEwN7-wxlU7AvYzRQ-1
X-Mimecast-MFC-AGG-ID: -g9ANvEwN7-wxlU7AvYzRQ
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a815ffe10fso15168475ab.3
        for <regressions@lists.linux.dev>; Thu, 02 Jan 2025 09:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735837445; x=1736442245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIhfj2neT2Cq5Sys8iG+Q7GAI3LQhoUylThNksKZoFg=;
        b=YSYezFV8QCoUN83Bsi4RYibLEKo+WOs3gSRr95S0dt+zInbfitJF8VbcIsi3LuHorL
         u0HNj2ykY1F/26LXVG55D5BSxKvt/arKUIl3WI7CTfV9YqlXYz+ec3Tn5Dq6UKBB1uJJ
         +O8inl779cfQX4FKhnSmbkvDHGBCbquuBTC7Z1z6H34D5L022AnE4jP+6kKeaM8BiRW1
         ZQUEYt8UYL5utJaqrpwm3MahonkorfgqO6pl8e9iV1PZfS1zvE1vUGQdDy/vZEbmlXVE
         3YLBt8ybmSFg9hHeOt7W63uvbcOD5rpSXDCeiq8Dqky4nBr6vQFg+PK3tyBgKtxuOzCH
         coVg==
X-Forwarded-Encrypted: i=1; AJvYcCXn0+LQC4WYC7WoJYb09HUPGM9lj06g37qYZWt0+O+HFwLe0Hjzi+umu8j0cPQrDhNMJQ7Ig3m9VkgTnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn2GjRsabIELS4pF7O7sUL0KDRDKXg13XXC1PAnYnPIzCdqJ5T
	m31kP4yA3fXLLkBcG56EXdBDrOOg8b7WOp0e+ZEBL14BVTHQVwfXEZUSSaJdWy7wZ4++8y5SZ7z
	3w3eJOdLzRY/xTjy5uMuyjfhVvilbVAlX9y8IhtAMn+iz/2Sm5YoCeuxZM7w8
X-Gm-Gg: ASbGncvq4dUQv/k+B4zarrCRmsufhaqSTO9DMpgiVR9RJgYdOOmPPLXzvob7uOmx67p
	+/bMglET0DVM+bj/LZXYAUtHFJaN4ntHbE/2L+gKZuq0bi8EVUpkXjCKvdIVooq35VeoSrBrMcx
	udp6WZR5ss2y8lbIOzH7YYE1xfA20EIAGZnNhTJRwadMePjw8I/aoV25W0PH/8tbd2hYWMVXta+
	i+5QzXMAAW2QiQgpntcsO37WjlQzpv1mhdMaX8GeOTUojdpXalVoMWiFwy9
X-Received: by 2002:a05:6e02:1a66:b0:3a7:de79:4bae with SMTP id e9e14a558f8ab-3c2d591aba1mr104010825ab.6.1735837445300;
        Thu, 02 Jan 2025 09:04:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUmgEQfcn/IbV4FmINh8hatAVeprR0hKK9j3SVlEr6dy3vdn1vftIkSYMIzcRiJ3nHmzeMEA==
X-Received: by 2002:a05:6e02:1a66:b0:3a7:de79:4bae with SMTP id e9e14a558f8ab-3c2d591aba1mr104010705ab.6.1735837444924;
        Thu, 02 Jan 2025 09:04:04 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e402a5a9sm75384225ab.58.2025.01.02.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 09:04:04 -0800 (PST)
Date: Thu, 2 Jan 2025 10:04:02 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Precific <precification@posteo.de>, Athul Krishna
 <athul.krishna.kr@protonmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Linux PCI
 <linux-pci@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 219619] New: vfio-pci: screen
 graphics artifacts after 6.12 kernel upgrade]
Message-ID: <20250102100402.33fa8435.alex.williamson@redhat.com>
In-Reply-To: <Z3bBOxFaCyizcxmx@x1n>
References: <20241222223604.GA3735586@bhelgaas>
	<Hb6kvXlGizYbogNWGJcvhY3LsKeRwROtpRluHKsGqRcmZl68J35nP60YdzW1KSoPl5RO_dCxuL5x9mM13jPBbU414DEZE_0rUwDNvzuzyb8=@protonmail.com>
	<Z2mW2k8GfP7S0c5M@x1n>
	<16ea1922-c9ce-4d73-b9b6-8365ca3fcf32@posteo.de>
	<20241230182737.154cd33a.alex.williamson@redhat.com>
	<bba03a61-9504-40d0-9b2c-115b4f70e8ca@posteo.de>
	<20241231090733.5cc5504a.alex.williamson@redhat.com>
	<Z3bBOxFaCyizcxmx@x1n>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ulBmOe63R-GTZzvJoipAwH1-qUfety8aZOMGA2kgY4Y_1735837445
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jan 2025 11:39:23 -0500
Peter Xu <peterx@redhat.com> wrote:

> On Tue, Dec 31, 2024 at 09:07:33AM -0700, Alex Williamson wrote:
> > On Tue, 31 Dec 2024 15:44:13 +0000
> > Precific <precification@posteo.de> wrote:
> >   
> > > On 31.12.24 02:27, Alex Williamson wrote:  
> > > > On Mon, 30 Dec 2024 21:03:30 +0000
> > > > Precific <precification@posteo.de> wrote:
> > > >     
> > > >> In my case, commenting out (1) the huge_fault callback assignment from
> > > >> f9e54c3a2f5b suffices for GPU initialization in the guest, even if (2)
> > > >> the 'install everything' loop is still removed.
> > > >>
> > > >> I have uploaded host kernel logs with vfio-pci-core debugging enabled
> > > >> (one log with stock sources, one large log with vfio-pci-core's
> > > >> huge_fault handler patched out):
> > > >> https://bugzilla.kernel.org/show_bug.cgi?id=219619#c1
> > > >> I'm not sure if the logs of handled faults say much about what
> > > >> specifically goes wrong here, though.
> > > >>
> > > >> The dmesg portion attached to my mail is of a Linux guest failing to
> > > >> initialize the GPU (BAR 0 size 16GB with 12GB of VRAM).    
> > > > 
> > > > Thanks for the logs with debugging enabled.  Would you be able to
> > > > repeat the test with QEMU 9.2?  There's a patch in there that aligns
> > > > the mmaps, which should avoid mixing 1G and 2MB pages for huge faults.
> > > > With this you should only see order 18 mappings for BAR0.
> > > > 
> > > > Also, in a different direction, it would be interesting to run tests
> > > > disabling 1G huge pages and 2MB huge pages independently.  The
> > > > following would disable 1G pages:
> > > > 
> > > > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > > > index 1ab58da9f38a..dd3b748f9d33 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_core.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > > > @@ -1684,7 +1684,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> > > >   							     PFN_DEV), false);
> > > >   		break;
> > > >   #endif
> > > > -#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> > > > +#if 0
> > > >   	case PUD_ORDER:
> > > >   		ret = vmf_insert_pfn_pud(vmf, __pfn_to_pfn_t(pfn + pgoff,
> > > >   							     PFN_DEV), false);
> > > > 
> > > > This should disable 2M pages:
> > > > 
> > > > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > > > index 1ab58da9f38a..d7dd359e19bb 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_core.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > > > @@ -1678,7 +1678,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> > > >   	case 0:
> > > >   		ret = vmf_insert_pfn(vma, vmf->address, pfn + pgoff);
> > > >   		break;
> > > > -#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> > > > +#if 0
> > > >   	case PMD_ORDER:
> > > >   		ret = vmf_insert_pfn_pmd(vmf, __pfn_to_pfn_t(pfn + pgoff,
> > > >   							     PFN_DEV), false);
> > > > 
> > > > And applying both together should be functionally equivalent to
> > > > pre-v6.12.  Thanks,
> > > > 
> > > > Alex
> > > >     
> > > 
> > > Logs with QEMU 9.1.2 vs. 9.2.0, all huge_page sizes/1G only/2M only: 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=219619#c3
> > > 
> > > You're right, I was still using QEMU 9.1.2. With 9.2.0, the 
> > > passed-through GPU works fine indeed with both Linux and Windows guests.
> > > 
> > > The huge_fault calls are aligned nicely with QEMU 9.2.0. Only the lower 
> > > 16MB of BAR 0 see repeated calls at 2M/4K page sizes but no misalignment.
> > > The QEMU 9.1.2 'stock' log shows a misalignment with 1G faults (order 
> > > 18), e.g., huge_faulting 0x40000 pages at page offset 0 and later 
> > > 0x4000. I'm not sure if that is a problem, or if the offsets are simply 
> > > masked off to the correct alignment.
> > > QEMU 9.1.2 also works with 1G pages disabled. Perhaps coincidentally, 
> > > the offsets are aligned properly for order 9 (0x200 'page offset' 
> > > increments) from what I've seen.  
> > 
> > Thank you so much for your testing, this is immensely helpful!  This
> > all suggests to me we're dealing with an alignment issue for 1GB pages.
> > We're getting 2MB alignment on the mmap by default, so that's working
> > everywhere.  QEMU 9.2 provides us with proper 1GB alignment, but it
> > seems we need to filter alignment more strictly when that's not present.
> > Please give this a try with QEMU 9.1.x and an otherwise stock v6.12.x:
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 1ab58da9f38a..bdfdc8ee4c2b 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1661,7 +1661,8 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> >  	unsigned long pfn, pgoff = vmf->pgoff - vma->vm_pgoff;
> >  	vm_fault_t ret = VM_FAULT_SIGBUS;
> >  
> > -	if (order && (vmf->address & ((PAGE_SIZE << order) - 1) ||
> > +	if (order && (pgoff & ((1 << order) - 1) ||
> > +		      vmf->address & ((PAGE_SIZE << order) - 1) ||
> >  		      vmf->address + (PAGE_SIZE << order) > vma->vm_end)) {
> >  		ret = VM_FAULT_FALLBACK;
> >  		goto out;  
> 
> That's a great finding..  I wish we could have some sanity check in things
> like pud_mkhuge() on the pfns at least for x86: SDM says the rest bits for
> a huge pfn must be zero (for example, bit 29-13 for 1G), but didn't say
> what if not. I assume that could panic at the right place if such check
> ever existed.
> 
> OTOH, a pure question here is whether we should check pfn+pgoff instead of
> pgoff alone.  I have no idea how firmware would allocate BAR resources,
> especially on start address alignments.  I assume that needs to be somehow
> relevant to the max size of the bar, probably the start address should
> always be aligned to that max bar size?  If so, there should have no
> functional difference checking either pfn+pgoff or pgoff.  It could be a
> matter of readability in that case, saying that the limitation is about pfn
> (of pgtable) rather than directly relevant to the offset of the bar.

Yes, I'm working on the proper patch now that we have a root cause and
I'm changing this to test alignment of pfn+pgoff.  The PCI BARs
themselves are required to have natural alignment, but the vma mapping
the BAR could be at an offset from the base of the BAR, which is
accounted for in our local vma_to_pfn() function.  So I agree that
pfn+pgoff is the more complete fix, which I'll post soon, and hope that
Precific can re-verify the fix.  Thanks,

Alex

