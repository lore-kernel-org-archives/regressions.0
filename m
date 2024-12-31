Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE41534F7
	for <regressions@lists.linux.dev>; Tue, 31 Dec 2024 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661261; cv=none; b=s6E1k/qav2auyLN7XgCnfAZy0Gr57IBMgxgfRPh3Gf7Xw34yLY0BrmhIM9iBOr3xR2kMqV8iT5HRc6mWi8sItPAlX3ftnvDr19q/m1yt9CNdtCrjkEy2C8TgbzanHTxgUcIQxoUFgikTZTrdXr5tcj6ZHgPG16NaRPcikjG1TLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661261; c=relaxed/simple;
	bh=6Zmla0LVyTncR3/v9mqhQIHU8lTg7K5Gahp1bf0CymQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahbMnSk9YhgGohQQRvdNVEACdkmPj/f+9CVxukBPAV92mnQOY2Og9pvKk5e9sc+VLSuUhrdnIvy0N8Xicy0pUUqpmredkdVzQ1ZQbola2UKIv8AuCaslH6x9MzIsI2xFhc3lcFhvFYdNy04pxeMGZvZSJ/LqDAGS8DMIvrUgEuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZnpajFo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZnpajFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735661258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjCxAz/SLu3yTa+rxUG3pUgBMnmOle1zayM2SEx7fQ4=;
	b=AZnpajFoJPCFBDgdV41ceswlsz/JDqZ2OxZJVUfod1N2t2sbqTuUv4eb20HlT3MAr0yNya
	JgFfABmWhRERx8yVC9rKOUOLNV0AgWNmfTuXZruXiac4iDIzdQSdMNOn9IrU48D1HjEdIO
	t1+C8WvRA0t+2AKUz6J3D0bh8GvOV8o=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-Pp8xaNBCPBuuW6hDq7dzKw-1; Tue, 31 Dec 2024 11:07:37 -0500
X-MC-Unique: Pp8xaNBCPBuuW6hDq7dzKw-1
X-Mimecast-MFC-AGG-ID: Pp8xaNBCPBuuW6hDq7dzKw
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a81764054aso12045605ab.2
        for <regressions@lists.linux.dev>; Tue, 31 Dec 2024 08:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735661256; x=1736266056;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjCxAz/SLu3yTa+rxUG3pUgBMnmOle1zayM2SEx7fQ4=;
        b=XyN1AJMyAMC72P9NJvLwdDzbkMAN1v9j64XAuhlrJnXjmw+xhVaHbREjBbVWNHz/0U
         0vUuGozr5m4FfQIYN4iM6Vu4gac2//04iJkUESyoHsfepb9uZhz72dywc0cW8ED1JdaB
         3QwLa1DMWH1gRVJ4KvZ8BJRMce+7G3W02FMrJbiTjpfJfTOyMDcLwL1NJQezN0NOUrnh
         MRbvKT5feFCxQffhd35n50jXs1aEwuPc9fTFjlIcckEbtFC27nji/7yhTJLs3FK94BFo
         WM0u1SwI4ymAdpnQZQQ42X3Lvhi/ncj0m5Cjg1z/FbaHgx0GT1jQ20qTg/JKuwSCO07Z
         haWw==
X-Forwarded-Encrypted: i=1; AJvYcCXRn+eGbApVoqEROPAL2pcYuAmPg9oZ4+8zkxchnaJGVo2eNFab2lslUnvnMpMZ6UHjpfJ7JUP3FTfLOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw64m0jCY8ZEoCxnZF1NlxAsiHweJN7zirfS2RRaFZnOyR5UTNt
	LJkBHQxsnQnh3QhC42y3gVuYuemyx8gLmugzguRYa3O5URjsW/VtjwfIMPtPds4A4d1mevsj2cp
	MzSKJmKwIk7jMKd77LB5n6XiVHFj6YJevSndCtf15qyQexgAtEWJP5KF8fumxycLmlwT3
X-Gm-Gg: ASbGncs8J020wz4g9d257cIuNCMF4m7+fjacnz7OLqb9u9H2MIVr0Fb5nrw9ChR2/W7
	/wZhGmwvoXVGupFQMTskFBO5vQ3oOEL4a7QefML7KvMdgly/JqziqvAGnCHHsrT43w2p8RubDd4
	LKfRJW583UK7Ovw2ctzfbo8NZEQbm+8jE6KgUJVB7EWiTMW3369SIb+cZ0HmB9fYkNC90E8AhNu
	zfnwHOVEsz3/iBJo/Qpc2I2C/dOBG2xEuUerM9NieA7J34wKng5ZVCXtbu0
X-Received: by 2002:a05:6e02:1c81:b0:3a7:bd4c:b17e with SMTP id e9e14a558f8ab-3c2cbd89eedmr95086565ab.0.1735661256343;
        Tue, 31 Dec 2024 08:07:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMDJl87fngylKomV7UV+zvAJP64mA5EIAts1gnV02QFp9Ynw1i2pTj7v8/N5Bcv/u7RWxG+g==
X-Received: by 2002:a05:6e02:1c81:b0:3a7:bd4c:b17e with SMTP id e9e14a558f8ab-3c2cbd89eedmr95086375ab.0.1735661255788;
        Tue, 31 Dec 2024 08:07:35 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1dab95sm6152786173.123.2024.12.31.08.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 08:07:35 -0800 (PST)
Date: Tue, 31 Dec 2024 09:07:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Precific <precification@posteo.de>
Cc: Peter Xu <peterx@redhat.com>, Athul Krishna
 <athul.krishna.kr@protonmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Linux PCI
 <linux-pci@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 219619] New: vfio-pci: screen
 graphics artifacts after 6.12 kernel upgrade]
Message-ID: <20241231090733.5cc5504a.alex.williamson@redhat.com>
In-Reply-To: <bba03a61-9504-40d0-9b2c-115b4f70e8ca@posteo.de>
References: <20241222223604.GA3735586@bhelgaas>
	<Hb6kvXlGizYbogNWGJcvhY3LsKeRwROtpRluHKsGqRcmZl68J35nP60YdzW1KSoPl5RO_dCxuL5x9mM13jPBbU414DEZE_0rUwDNvzuzyb8=@protonmail.com>
	<Z2mW2k8GfP7S0c5M@x1n>
	<16ea1922-c9ce-4d73-b9b6-8365ca3fcf32@posteo.de>
	<20241230182737.154cd33a.alex.williamson@redhat.com>
	<bba03a61-9504-40d0-9b2c-115b4f70e8ca@posteo.de>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1ElrC6CgYXTkNFnJbJ2cpf7nJW_pMqG8mjDu1Cqbdn4_1735661257
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Dec 2024 15:44:13 +0000
Precific <precification@posteo.de> wrote:

> On 31.12.24 02:27, Alex Williamson wrote:
> > On Mon, 30 Dec 2024 21:03:30 +0000
> > Precific <precification@posteo.de> wrote:
> >   
> >> In my case, commenting out (1) the huge_fault callback assignment from
> >> f9e54c3a2f5b suffices for GPU initialization in the guest, even if (2)
> >> the 'install everything' loop is still removed.
> >>
> >> I have uploaded host kernel logs with vfio-pci-core debugging enabled
> >> (one log with stock sources, one large log with vfio-pci-core's
> >> huge_fault handler patched out):
> >> https://bugzilla.kernel.org/show_bug.cgi?id=219619#c1
> >> I'm not sure if the logs of handled faults say much about what
> >> specifically goes wrong here, though.
> >>
> >> The dmesg portion attached to my mail is of a Linux guest failing to
> >> initialize the GPU (BAR 0 size 16GB with 12GB of VRAM).  
> > 
> > Thanks for the logs with debugging enabled.  Would you be able to
> > repeat the test with QEMU 9.2?  There's a patch in there that aligns
> > the mmaps, which should avoid mixing 1G and 2MB pages for huge faults.
> > With this you should only see order 18 mappings for BAR0.
> > 
> > Also, in a different direction, it would be interesting to run tests
> > disabling 1G huge pages and 2MB huge pages independently.  The
> > following would disable 1G pages:
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 1ab58da9f38a..dd3b748f9d33 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1684,7 +1684,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> >   							     PFN_DEV), false);
> >   		break;
> >   #endif
> > -#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> > +#if 0
> >   	case PUD_ORDER:
> >   		ret = vmf_insert_pfn_pud(vmf, __pfn_to_pfn_t(pfn + pgoff,
> >   							     PFN_DEV), false);
> > 
> > This should disable 2M pages:
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 1ab58da9f38a..d7dd359e19bb 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1678,7 +1678,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> >   	case 0:
> >   		ret = vmf_insert_pfn(vma, vmf->address, pfn + pgoff);
> >   		break;
> > -#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> > +#if 0
> >   	case PMD_ORDER:
> >   		ret = vmf_insert_pfn_pmd(vmf, __pfn_to_pfn_t(pfn + pgoff,
> >   							     PFN_DEV), false);
> > 
> > And applying both together should be functionally equivalent to
> > pre-v6.12.  Thanks,
> > 
> > Alex
> >   
> 
> Logs with QEMU 9.1.2 vs. 9.2.0, all huge_page sizes/1G only/2M only: 
> https://bugzilla.kernel.org/show_bug.cgi?id=219619#c3
> 
> You're right, I was still using QEMU 9.1.2. With 9.2.0, the 
> passed-through GPU works fine indeed with both Linux and Windows guests.
> 
> The huge_fault calls are aligned nicely with QEMU 9.2.0. Only the lower 
> 16MB of BAR 0 see repeated calls at 2M/4K page sizes but no misalignment.
> The QEMU 9.1.2 'stock' log shows a misalignment with 1G faults (order 
> 18), e.g., huge_faulting 0x40000 pages at page offset 0 and later 
> 0x4000. I'm not sure if that is a problem, or if the offsets are simply 
> masked off to the correct alignment.
> QEMU 9.1.2 also works with 1G pages disabled. Perhaps coincidentally, 
> the offsets are aligned properly for order 9 (0x200 'page offset' 
> increments) from what I've seen.

Thank you so much for your testing, this is immensely helpful!  This
all suggests to me we're dealing with an alignment issue for 1GB pages.
We're getting 2MB alignment on the mmap by default, so that's working
everywhere.  QEMU 9.2 provides us with proper 1GB alignment, but it
seems we need to filter alignment more strictly when that's not present.
Please give this a try with QEMU 9.1.x and an otherwise stock v6.12.x:

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..bdfdc8ee4c2b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1661,7 +1661,8 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	unsigned long pfn, pgoff = vmf->pgoff - vma->vm_pgoff;
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 
-	if (order && (vmf->address & ((PAGE_SIZE << order) - 1) ||
+	if (order && (pgoff & ((1 << order) - 1) ||
+		      vmf->address & ((PAGE_SIZE << order) - 1) ||
 		      vmf->address + (PAGE_SIZE << order) > vma->vm_end)) {
 		ret = VM_FAULT_FALLBACK;
 		goto out;


Thanks,
Alex

