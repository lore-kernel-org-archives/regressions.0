Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDF1A8F8B
	for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734973154; cv=none; b=Kzbu8Kg13L1irltHbXa6ZfQrqhVdT2G9qYgDBHySR2/buhzR810JfVZ+3Mp00ipnMbjows56PFGu4WdFjdBaJI2iITHGSPZBO3vyLeia1WBH5WstP2Lt3eCtnYHftY2h5IjciEwL1nG9isbod5ZfJM3I5vOksZzdOl+BfwGXtEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734973154; c=relaxed/simple;
	bh=/eXm46f1zqFCIapOpV+LJv6AU7meQGgq4bWoJc1Vl4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=H3nXWJmfrLzrtdFRpmKm4BO21T5dvu9PG8psTx0saSkQGtm9qnMx8upi9/pZJ3/nYpYQ9lVImkc5hZvkhnJj6y2Ri2/AvXAWs8exllaZXvW00i/LvGQeayT6BiqbAMLE2nXzUmFKpCllkLOVE/i68Apa/ACF4h2JcuxfWQK8tyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YT82LOSv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YT82LOSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734973151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYhwmX9VYIzFjXFoGAhiV3rOfBz1b4KM/wduvPShNVk=;
	b=YT82LOSvFSY5Ii/EF8dpDUr/76bjQ3/uAYK8+i+FPsmFYdBeHqrJ9EsDRAMEWLwGmgG7Qi
	ZUBE25Aov4QhyKR1uV2/0DekDXnp9KaxOggKi/SxYV6B/i5k2ldSn4fd30Uq3MY8HrSiBN
	wrI920jbUlCxpZBu/igstRRvliUnOKY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470--6TwccGHNGqbXrgjmplQ6Q-1; Mon, 23 Dec 2024 11:59:10 -0500
X-MC-Unique: -6TwccGHNGqbXrgjmplQ6Q-1
X-Mimecast-MFC-AGG-ID: -6TwccGHNGqbXrgjmplQ6Q
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d87ee5fb22so65035656d6.1
        for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 08:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734973150; x=1735577950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYhwmX9VYIzFjXFoGAhiV3rOfBz1b4KM/wduvPShNVk=;
        b=WwSaLyjcfjOKuWrR4yLGURcF2HPcJHNcB3urvi92QCxLEsddzScae4kfBA9Mg+zrBs
         hR+ejuySGCywVyg1I12/PZZr8B3nAu39N/oy/itsNQsFRfY1NaoweeJteRTNJQiJwRLo
         BKDomQJXM/sgMzc7nePfbAsUAN++jla0fq+Dfg5C8gz2A8uQw2qg9jd6zYw8tFEtNRMJ
         6wmVGgIFFAC3bfez1sR6MsCSKy+WWDGAawNcKv0k5YjnMMS4c481u3VnPq4qQQ+olBNl
         4RkJ3ukSiLa7txIZQ0D0Tof3timy/sRLdy2cFnfNy4mpNp/Upcp1yy9C6QCMfLswE6As
         3fzg==
X-Forwarded-Encrypted: i=1; AJvYcCV9PtDe4PZSe3xMUidT3HUPUSqIjkajPuKKNeDP2v1f2Hb4SP1Fxgv9pwcmQj9qYzDC5ezRML67Vhf2hg==@lists.linux.dev
X-Gm-Message-State: AOJu0YylNeOFjmYjNIZeb6WqivzKrKfFqRB/q5bVSM+SWocG8/+87KsE
	OiEFYt5M0nBKq0jD6iPkeavOo/ASvbVcmaNsJbRguqiE51n8UVpYxq/2gkxW+92UYjp00Np7kEG
	DJE28SkuT1FFsFcuK2xfyLktUywjEiJx39GjLgwjKh7A8xGR7RJ5CqyThuioC
X-Gm-Gg: ASbGncvLZa8V3/uo70ymuCOVY/+frGrR/gNRdb1IazNLatfbWnNAiBt+ju680zo7dvd
	iZQDpmp7df+W0K6Z3DhM+Z8rk8hhWZ4n8wffZ80P2rzTUhmS8dex6dY9tk3K1wn+9HmA03yb+QA
	gP/dK/vn13xNA7oWAol9TI3+gYq4w6XVY+t4of1tI5VasnA7NB6GI0zz2G/Odg9xY1cvwrz896O
	vRBAkahQlsbaibwXWq0Uy7XJtkJ0Qkr+/QK2y++i3qH8dSlzkjl1+oWWKLIEisGl9xmT8JFbrJz
	AaTXRq9t3fX4S+TTYw==
X-Received: by 2002:a05:6214:27eb:b0:6d8:f612:e27d with SMTP id 6a1803df08f44-6dd2339ff38mr220808626d6.32.1734973149769;
        Mon, 23 Dec 2024 08:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiyg9xnnEYGXGK2rAB5forgSszecTTud5B0dq/EWmsMFf8C8vl0ZI9iiiIPpJtiZdzHVnwOw==
X-Received: by 2002:a05:6214:27eb:b0:6d8:f612:e27d with SMTP id 6a1803df08f44-6dd2339ff38mr220808336d6.32.1734973149413;
        Mon, 23 Dec 2024 08:59:09 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181c0fc5sm45137506d6.92.2024.12.23.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 08:59:08 -0800 (PST)
Date: Mon, 23 Dec 2024 11:59:06 -0500
From: Peter Xu <peterx@redhat.com>
To: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Linux PCI <linux-pci@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 219619] New: vfio-pci: screen
 graphics artifacts after 6.12 kernel upgrade]
Message-ID: <Z2mW2k8GfP7S0c5M@x1n>
References: <20241222223604.GA3735586@bhelgaas>
 <Hb6kvXlGizYbogNWGJcvhY3LsKeRwROtpRluHKsGqRcmZl68J35nP60YdzW1KSoPl5RO_dCxuL5x9mM13jPBbU414DEZE_0rUwDNvzuzyb8=@protonmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Hb6kvXlGizYbogNWGJcvhY3LsKeRwROtpRluHKsGqRcmZl68J35nP60YdzW1KSoPl5RO_dCxuL5x9mM13jPBbU414DEZE_0rUwDNvzuzyb8=@protonmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CdN0gQn9uwLNOKsuGwtYVZi8Z6wwRYISC1LzKx8azHs_1734973150
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 23, 2024 at 07:37:46AM +0000, Athul Krishna wrote:
> Can confirm. Reverting f9e54c3a2f5b from v6.13-rc1 fixed the problem.

I suppose Alex should have some more thoughts, probably after the holidays.
Before that, one quick question to ask..

> 
> -------- Original Message --------
> On 23/12/24 04:06, Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> >  Forwarding since not everybody follows bugzilla.  Apparently bisected
> >  to f9e54c3a2f5b ("vfio/pci: implement huge_fault support").
> >  
> >  Athul, f9e54c3a2f5b appears to revert cleanly from v6.13-rc1.  Can you
> >  verify that reverting it is enough to avoid these artifacts?
> >  
> >  #regzbot introduced: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> >  
> >  ----- Forwarded message from bugzilla-daemon@kernel.org -----
> >  
> >  Date: Sat, 21 Dec 2024 10:10:02 +0000
> >  From: bugzilla-daemon@kernel.org
> >  To: bjorn@helgaf9e54c3a2f5bas.com
> >  Subject: [Bug 219619] New: vfio-pci: screen graphics artifacts after 6.12 kernel upgrade
> >  Message-ID: <bug-219619-41252@https.bugzilla.kernel.org/>
> >  
> >  https://bugzilla.kernel.org/show_bug.cgi?id=219619
> >  
> >              Bug ID: 219619
> >             Summary: vfio-pci: screen graphics artifacts after 6.12 kernel
> >                      upgrade
> >             Product: Drivers
> >             Version: 2.5
> >            Hardware: AMD
> >                  OS: Linux
> >              Status: NEW
> >            Severity: normal
> >            Priority: P3
> >           Component: PCI
> >            Assignee: drivers_pci@kernel-bugs.osdl.org
> >            Reporter: athul.krishna.kr@protonmail.com
> >          Regression: No
> >  
> >  Created attachment 307382
> >    --> https://bugzilla.kernel.org/attachment.cgi?id=307382&action=edit
> >  dmesg

vfio-pci 0000:03:00.0: vfio_bar_restore: reset recovery - restoring BARs
pcieport 0000:00:01.1: AER: Multiple Uncorrectable (Non-Fatal) error message received from 0000:03:00.1
vfio-pci 0000:03:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Requester ID)
vfio-pci 0000:03:00.0:   device [1002:73ef] error status/mask=00100000/00000000
vfio-pci 0000:03:00.0:    [20] UnsupReq               (First)
vfio-pci 0000:03:00.0: AER:   TLP Header: 60001004 000000ff 0000007d fe7eb000
vfio-pci 0000:03:00.1: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Requester ID)
vfio-pci 0000:03:00.1:   device [1002:ab28] error status/mask=00100000/00000000
vfio-pci 0000:03:00.1:    [20] UnsupReq               (First)
vfio-pci 0000:03:00.1: AER:   TLP Header: 60001004 000000ff 0000007d fe7eb000
vfio-pci 0000:03:00.1: AER:   Error of this Agent is reported first
pcieport 0000:02:00.0: AER: broadcast error_detected message
pcieport 0000:02:00.0: AER: broadcast mmio_enabled message
pcieport 0000:02:00.0: AER: broadcast resume message
pcieport 0000:02:00.0: AER: device recovery successful
pcieport 0000:02:00.0: AER: broadcast error_detected message
pcieport 0000:02:00.0: AER: broadcast mmio_enabled message
pcieport 0000:02:00.0: AER: broadcast resume message
pcieport 0000:02:00.0: AER: device recovery successful

> >  
> >  Device: Asus Zephyrus GA402RJ
> >  CPU: Ryzen 7 6800HS
> >  GPU: RX 6700S
> >  Kernel: 6.13.0-rc3-g8faabc041a00
> >  
> >  Problem:
> >  Launching games or gpu bench-marking tools in qemu windows 11 vm will cause
> >  screen artifacts, ultimately qemu will pause with unrecoverable error.

Is there more information on what setup can reproduce it?

For example, does it only happen with Windows guests?  Does the GPU
vendor/model matter?

> >  
> >  Commit:
> >  f9e54c3a2f5b79ecc57c7bc7d0d3521e461a2101 is the first bad commit
> >  commit f9e54c3a2f5b79ecc57c7bc7d0d3521e461a2101
> >  Author: Alex Williamson <alex.williamson@redhat.com>
> >  Date:   Mon Aug 26 16:43:53 2024 -0400
> >  
> >      vfio/pci: implement huge_fault support

Personally I have no clue yet on how this could affect it.  I was initially
worrying on any implicit cache mode changes on the mappings, but I don't
think any of such was involved in this specific change.

This commit majorly does two things: (1) allow 2M/1G mappings for BARs
instead of small 4Ks always, and (2) always lazy faults rather than
"install everything in the 1st fault".  Maybe one of the two could have
some impact in some way.

IIUC basic paths were covered and hopefully should work, so I wonder what's
the specialty. Might be relevant to above questions on the reproduceable
setups.

Thanks,

-- 
Peter Xu

