Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C59259C94
	for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911000; cv=none; b=WAOKCWOqmlvfl9FjQPZ7HxH/GAeDqb9S0ECdKGFd5bgl4uB74KKGMkjL51DokewFk2ME2lzeg0Q5kFoJ42UC4vVeiHupkpf7rDt30xS+mWjE4VyxYI92/3ZTv0Ru5eMZJSQzCUH/1hc9w2Ivz/WzijKLq4CjyCIEkV/2ERYH0Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911000; c=relaxed/simple;
	bh=fM18Y2UDoYBSYtZGWqXQbd5up5uRuayQ7l/F3XctdF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcdRy07D9HM7dlO/eY660BCZ1d/8BSjNVmrsCI5G0nU//WrQN56j/Of+bgfHT2zPKIl3nhwGxfXNhRcKMgQ2I5ch0+KuhML8mgPkqExJXmXOBtzjptIg1B2gp1o8DkPsnjbK7acNODdfrmas8LM/tIWnuF174WFbJwkO9ogzX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQOMullz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQOMullz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso584415f8f.2
        for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742910996; x=1743515796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCDJmpGf3Eg15VbX5Sp8vwTJcSjhepylteCEjoFRn4k=;
        b=oQOMullzSnp2KirOr8/mRW0L6pkhFNV0j8gX9QOSPL12Cq8Bli92Ga4UcZYXpg/9Xu
         Ix5OoIUz4mlz8xxlOjdjDZTTeYpyT7NwnSQBh87coLXtyNZlzsvpsigNAUUC0Vpr/Gse
         Tv2U0j7FmuLcPY5gRdtOOUtcC4l00ZrhhrijQL0IX1zgIqqfgxFAODsPTqljmJWzvREb
         suRWboirElS8mkfQLse31yFMdDhppCyFnSeMEhRcBtTmjNPWmiJh/VU1x0btHNRcQnFq
         OLLcXhU2wo1fVwz/hyaJnUkNsQKKMH/1R/ECEvFE9qWnjflb4YFvVaMg2esZy+v1qjD9
         XpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910996; x=1743515796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCDJmpGf3Eg15VbX5Sp8vwTJcSjhepylteCEjoFRn4k=;
        b=XYbNSzKHknnkru0jp9G6AtK/IvtKUUgOYXssAHKjIcN6lsKXbsTf7zo2XKM8vmdCFG
         7/muTML+1FPLSzUUjyRrr4rDcVxwTLkEUIC3nIDUqHUdHLaXpDSXHp0gtij5tnS8C7ya
         14LelCb4LVkzUFFsQbTbUgMB44/K0ton3BibrbXFsVhzB7SD7K/RANyN+cY6rcEY8Kpn
         FR+mL5CJ+FEXVbaVx6NK+kbuOOE/LWQt8XkqC5hA+9Jy9NTNmdjNTvTMmml+bHIDhWlu
         mu2GVryhZ9ctpBeP914qvlYyYNAEOF8HCFvvsK/nn+ranhSpJolJcn/HgibT7Q+fIIG6
         E/0g==
X-Forwarded-Encrypted: i=1; AJvYcCW8+IiStV1yy2PAW6jh+1NSnPAYhGF3YCkkm80Mhi/7r+4oFHns+7iBgk+Za8pYun8wqAPHqyPkcoP4Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFijwQnu1jCDARFeTn3EUzJD9BMnrHmyt758ojoJWwCaksqe9Y
	CW5NXlil7609IGnNXAWtcWSwnzIvDlIsrnXl8WoyXByj+FMLOuvEjEZLloAgrAY=
X-Gm-Gg: ASbGncu1w6GX+YjRo9x+LzovmR0kjoc+r4PLoaqQzQOLN7JwCD6B0O0eGct6nFxdHa1
	sQJBn7+1giaDgmeHQ3wyX8uwyPoK6IK2o/eBQWq+Rg4q46qwYfByMwc6eTyCc3AzICLTbwxSTCS
	wvcZ1tr1TFLMZ+L/lLvhPkXj+h0dSQkCqDSSrjkKasgOpZHgIf+j+/87WXwSkdJ6z8GniPNUz5n
	mY30k7QXn0fHqgQk8iBraGJWGB1w/bxCtlwdoKKxd/MvBcYziqAknqG+noKL69MQ9omgbxuiS+X
	phJFp8sjJMGvD7pflGDP78WYwMEKlJnkrkxwEe6RPRKga/vZfQ==
X-Google-Smtp-Source: AGHT+IEXygql+ba4dLAEprcqbbBUZm9vu5V/1aZTrj16kuq0a0ccf1f7yorovN1W6gxa7/NXqYYLjQ==
X-Received: by 2002:a5d:6da1:0:b0:391:10c5:d1c6 with SMTP id ffacd0b85a97d-3997f8ed9c9mr14586179f8f.2.1742910995979;
        Tue, 25 Mar 2025 06:56:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d440ed4d9sm203483275e9.33.2025.03.25.06.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:56:35 -0700 (PDT)
Date: Tue, 25 Mar 2025 16:56:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	PCI <linux-pci@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	shivamurthy.shastri@linutronix.de,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20250324: x86_64: BUG: kernel NULL pointer dereference
 __pci_enable_msi_range
Message-ID: <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain>
References: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>

If I had to guess, I'd say that it was related to Fixes: d9f2164238d8
("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag").  I
suspect d->host_data can be NULL.  I could be wrong, but let's add Roger
to the CC list just in case.

regards,
dan carpenter

On Tue, Mar 25, 2025 at 05:11:20PM +0530, Naresh Kamboju wrote:
> Regressions on x86_64 boot failed with Linux next-20250324 tag kernel
> 6.14.0-rc7-next-20250324
> 
> First seen on the next-20250324
>  Good: next-20250321
>  Bad:  next-20250324 ..next-20250325
> 
> Regressions found on x86_84:
>  - boot
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducible? Yes
> 
> Boot regression: x86 boot fail kernel panic __pci_enable_msi_range
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log
> <1>[    1.525485] BUG: kernel NULL pointer dereference, address:
> 0000000000000002
> <1>[    1.525573] #PF: supervisor read access in kernel mode
> <1>[    1.525573] #PF: error_code(0x0000) - not-present page
> <6>[    1.525573] PGD 0 P4D 0
> <4>[    1.525573] Oops: Oops: 0000 [#1] SMP PTI
> <4>[    1.525573] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.14.0-rc7-next-20250324 #1 PREEMPT(voluntary)
> <4>[    1.525573] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> <4>[    1.525573] RIP: 0010:__pci_enable_msi_range+0x306/0x6b0
> <4>[    1.525573] Code: ff ff ff e8 1c 05 fe ff f6 83 21 08 00 00 10
> 0f b7 85 6e ff ff ff 74 0c 0d 00 01 00 00 66 89 85 6e ff ff ff 8b 8d
> 68 ff ff ff <41> f6 44 24 02 40 74 0c 25 ff fe 00 00 66 89 85 6e ff ff
> ff 89 8d
> <4>[    1.525573] RSP: 0000:ffffa83b00013740 EFLAGS: 00010246
> <4>[    1.525573] RAX: 0000000000000080 RBX: ffffa11c8023e000 RCX:
> 0000000000000001
> <4>[    1.525573] RDX: 0000000000000000 RSI: ffffffff9e60c683 RDI:
> ffffffff9e6519a8
> <4>[    1.525573] RBP: ffffa83b00013810 R08: 0000000000000002 R09:
> ffffa83b0001370c
> <4>[    1.525573] R10: 0000000000000001 R11: ffffffff9e60c5b0 R12:
> 0000000000000000
> <4>[    1.525573] R13: 0000000000000000 R14: 0000000000000001 R15:
> ffffa11c8023e000
> <4>[    1.525573] FS:  0000000000000000(0000)
> GS:ffffa11d5c339000(0000) knlGS:0000000000000000
> <4>[    1.525573] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    1.525573] CR2: 0000000000000002 CR3: 000000007d844000 CR4:
> 00000000000006f0
> <4>[    1.525573] Call Trace:
> <4>[    1.525573]  <TASK>
> <4>[    1.525573]  ? __die_body+0xb4/0xc0
> <4>[    1.525573]  ? __die+0x2e/0x40
> <4>[    1.525573]  ? page_fault_oops+0x3ae/0x410
> <4>[    1.525573]  ? kernelmode_fixup_or_oops+0x54/0x70
> <4>[    1.525573]  ? __bad_area_nosemaphore+0x52/0x240
> <4>[    1.525573]  ? bad_area_nosemaphore+0x16/0x20
> <4>[    1.525573]  ? do_user_addr_fault+0x738/0x7a0
> <4>[    1.525573]  ? irqentry_enter+0x2d/0x50
> <4>[    1.525573]  ? exc_page_fault+0x4d/0x120
> <4>[    1.525573]  ? exc_page_fault+0x70/0x120
> <4>[    1.525573]  ? asm_exc_page_fault+0x2b/0x30
> <4>[    1.525573]  ? __pfx_pci_conf1_read+0x10/0x10
> <4>[    1.525573]  ? pci_conf1_read+0xd3/0xf0
> <4>[    1.525573]  ? _raw_spin_unlock_irqrestore+0x28/0x50
> <4>[    1.525573]  ? __pci_enable_msi_range+0x306/0x6b0
> <4>[    1.525573]  ? _raw_spin_unlock_irqrestore+0x28/0x50
> <4>[    1.525573]  pci_alloc_irq_vectors_affinity+0xbf/0x140
> <4>[    1.525573]  pci_alloc_irq_vectors+0x15/0x20
> <4>[    1.525573]  ahci_init_irq+0x90/0xc0
> <4>[    1.525573]  ahci_init_one+0x82c/0xd10
> <4>[    1.525573]  pci_device_probe+0x198/0x230
> <4>[    1.525573]  really_probe+0x146/0x450
> <4>[    1.525573]  __driver_probe_device+0x7a/0xf0
> <4>[    1.525573]  driver_probe_device+0x24/0x190
> <4>[    1.525573]  __driver_attach+0x104/0x250
> <4>[    1.525573]  ? __pfx___driver_attach+0x10/0x10
> <4>[    1.525573]  bus_for_each_dev+0x10e/0x160
> <4>[    1.525573]  driver_attach+0x22/0x30
> <4>[    1.525573]  bus_add_driver+0x175/0x2c0
> <4>[    1.525573]  driver_register+0x65/0xf0
> <4>[    1.525573]  ? __pfx_ahci_pci_driver_init+0x10/0x10
> <4>[    1.525573]  __pci_register_driver+0x68/0x70
> <4>[    1.525573]  ahci_pci_driver_init+0x22/0x30
> <4>[    1.525573]  do_one_initcall+0x121/0x330
> <4>[    1.525573]  ? alloc_pages_mpol+0x170/0x1c0
> <4>[    1.525573]  ? alloc_pages_mpol+0x170/0x1c0
> <4>[    1.525573]  ? trace_preempt_on+0x12/0x80
> <4>[    1.525573]  ? alloc_pages_mpol+0x170/0x1c0
> <4>[    1.525573]  ? preempt_count_sub+0x63/0x80
> <4>[    1.525573]  ? alloc_pages_mpol+0x170/0x1c0
> <4>[    1.525573]  ? trace_hardirqs_on+0x29/0xa0
> <4>[    1.525573]  ? irqentry_exit+0x57/0x60
> <4>[    1.525573]  ? sysvec_apic_timer_interrupt+0x52/0x90
> <4>[    1.525573]  ? next_arg+0xcd/0x150
> <4>[    1.525573]  ? next_arg+0x138/0x150
> <4>[    1.525573]  ? parse_args+0x16e/0x440
> <4>[    1.525573]  do_initcall_level+0x80/0xf0
> <4>[    1.525573]  do_initcalls+0x48/0x80
> <4>[    1.525573]  do_basic_setup+0x1d/0x30
> <4>[    1.525573]  kernel_init_freeable+0x10c/0x180
> <4>[    1.525573]  ? __pfx_kernel_init+0x10/0x10
> <4>[    1.525573]  kernel_init+0x1e/0x130
> <4>[    1.525573]  ret_from_fork+0x45/0x50
> <4>[    1.525573]  ? __pfx_kernel_init+0x10/0x10
> <4>[    1.525573]  ret_from_fork_asm+0x1a/0x30
> <4>[    1.525573]  </TASK>
> <4>[    1.525573] Modules linked in:
> <4>[    1.525573] CR2: 0000000000000002
> <4>[    1.525573] ---[ end trace 0000000000000000 ]---
> <4>[    1.525573] RIP: 0010:__pci_enable_msi_range+0x306/0x6b0
> <4>[    1.525573] Code: ff ff ff e8 1c 05 fe ff f6 83 21 08 00 00 10
> 0f b7 85 6e ff ff ff 74 0c 0d 00 01 00 00 66 89 85 6e ff ff ff 8b 8d
> 68 ff ff ff <41> f6 44 24 02 40 74 0c 25 ff fe 00 00 66 89 85 6e ff ff
> ff 89 8d
> <4>[    1.525573] RSP: 0000:ffffa83b00013740 EFLAGS: 00010246
> <4>[    1.525573] RAX: 0000000000000080 RBX: ffffa11c8023e000 RCX:
> 0000000000000001
> <4>[    1.525573] RDX: 0000000000000000 RSI: ffffffff9e60c683 RDI:
> ffffffff9e6519a8
> <4>[    1.525573] RBP: ffffa83b00013810 R08: 0000000000000002 R09:
> ffffa83b0001370c
> <4>[    1.525573] R10: 0000000000000001 R11: ffffffff9e60c5b0 R12:
> 0000000000000000
> <4>[    1.525573] R13: 0000000000000000 R14: 0000000000000001 R15:
> ffffa11c8023e000
> <4>[    1.525573] FS:  0000000000000000(0000)
> GS:ffffa11d5c339000(0000) knlGS:0000000000000000
> <4>[    1.525573] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    1.525573] CR2: 0000000000000002 CR3: 000000007d844000 CR4:
> 00000000000006f0
> <6>[    1.525573] note: swapper/0[1] exited with irqs disabled
> <0>[    1.553459] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x00000009
> <0>[    1.553844] Kernel Offset: 0x1c000000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> <0>[    1.553844] ---[ end Kernel panic - not syncing: Attempted to
> kill init! exitcode=0x00000009 ]---
> 
> 
> ## Source
> * Kernel version: 6.14.0-rc7-next-20250324
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 882a18c2c14fc79adb30fe57a9758283aa20efaa
> * Git describe: next-20250324
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250324/
> 
> ## Test
> * Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250324/testrun/27735988/suite/boot/test/clang-20-lkftconfig/log
> * Test history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250324/testrun/27735988/suite/boot/test/clang-20-lkftconfig/history/
> * Test details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250324/testrun/27735936/suite/boot/test/clang-20-lkftconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ulLSNJUAxmyv6UZdUMeoptIZNn/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2ulLSNJUAxmyv6UZdUMeoptIZNn/config
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
