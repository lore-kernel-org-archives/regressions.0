Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A3A55
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103190; cv=none; b=OOTQEwu47uwO5yKTr1DNDoMxY8lMFR+lJqxD7Fit+BSX7LQ9kVAT1LeCyLNbmONbcuOIW1vZts5aPra0s/kik9CsdYSNw7pJmoSgv3QBF70auX4rgDyL+kMKKzXbdftUX2wVpc3ziVsyVkwQnYHDRbPiNVCD/H+68Id45GrgVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103190; c=relaxed/simple;
	bh=xSJC7NE5dhe+djfu8MQAVula0O7UgKrN7fIsghtAq08=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dPf90RmgHXXlNyFnTqi+8ifOkiDGEwK1CHsjnvwX+MY9m6Xe8HIdjgqi+ZRwQ6bjjoCkQeK2oK0zqujOU1UDvvE9xC2tq+DRtZbalua4mlDf8CzWU0Br5D0pjjV6Yh9EUgQGOA0xErsGBzYyD5fHr/Mk6kXsgHNhI7RfVBUAZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9xbwbtv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9xbwbtv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so734724f8f.0
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743103187; x=1743707987; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fC+ON84pbmaEiijG4EesLfUkCJCg1TONLIcdty6Zbo4=;
        b=C9xbwbtvcLZfMfq+lmvjbNAWlkNT1YKCQZ5xqhaobHHXoQrOC7hd2P3ZpGvrnK7A/k
         EVbQka5N+AsYRFdPlrzE4jLpSW9If3cSaljqKyU0z80AXHkUAmeKbPetKiJnErhR4F5K
         Aw5nyv9aURyv3X+Q5Y86B9xOEzZ7UzW5dvdEG9+QrUr9uF+k6RErjyZyrGa0Z8N5WCof
         KBajArHXXXya+zyVmMqleLxNaXH9U6f9YAEd/r6v15O/t/JTth2KnAVE5cbdQpOtIzkc
         v2RHauhcP5OSSek+SeRYGwnZSCwaaK7JqKnnE6eoYuA93dWbWkfqhTk83haDHYeGjVV7
         LNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743103187; x=1743707987;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fC+ON84pbmaEiijG4EesLfUkCJCg1TONLIcdty6Zbo4=;
        b=FKODCZqBVbfpX6V+sqwC22IqliWZxm0CqHr6uXSGujdpDxtjuBe6399qTGLwDgzFeq
         HQ/dXGZCY3QLRA8hZ7wKOQMU0J2LYf1TSNZqPqHe2bzvY8+J8q6jN2F1K71JJw4J/YhH
         HTukwHO3xHgE/DgdSxuoOSWBd9ocCXIixSWkRZimS84qOi4nWoM5gZ/yjJtL92uZpEb7
         oh9BJ5pLBf2P1wgqIRE+KCD8VnNWcqMHkxmGT+ck8dLIOO47CqY2DfvFtVhUd0KG8zAY
         0OYu5DaEs3d/INGNLPZfyyOqiu9MkvRVUjG7IlB/UM2c4HrNQYa0t1rGYkmmX+ptL1pR
         ouzg==
X-Gm-Message-State: AOJu0YzX30/mdLloqTIkm4TNJMv2XNhkGewhbzlURxmPFYftSv9TxIxV
	Uke5cQZfBNDL5uZ4UcYbqoyjBmoLKB9IPLRwAR9iKE6Nwx0pjDzNO+w43g==
X-Gm-Gg: ASbGnctbNRd8+GazqsBX6XQwYvkVNYoKFCYK6Ba1Tt0XEXLWGJB9VEWaeXWtd728Bc1
	yrPmsHjCc1s0ki/a2FXoQiHK9LLm0SJlQOLixpcC6YKduKcgOZ+Ya/NJU9/xK08mETqduYyHBbS
	mnkGY0HbAZQU+0YCTynWxpy75zKHcYwpiydz/rmAjTlvgRZx5Yn9FXO/AkPy6FY8VrAbc2v3TJB
	eE24Knjt9/gch5BtHsM/+ZMqsyYrm9x940PfW8FMTTk/6Wes+1FseXYPvNWeufe6UJ44XGC8SeT
	TKU05tbW+Xz8SfQ509VzLon+GIA8b/zPfAHYgIh94cTChgfUOuUIv6CP
X-Google-Smtp-Source: AGHT+IE0YRzKoKJ+nJ2DEvPcKdz5HHbn0+yhV4zVfv6QF/QhHtCOpi/6zyve8Nl5vW6kdk+bXY89ZA==
X-Received: by 2002:a5d:5847:0:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39ad176bb18mr5654108f8f.38.1743103186742;
        Thu, 27 Mar 2025 12:19:46 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:4d4:f101:e41a:977a:f788:910f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b65b985sm366139f8f.12.2025.03.27.12.19.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:19:46 -0700 (PDT)
Date: Thu, 27 Mar 2025 19:19:44 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: regressions@lists.linux.dev
Subject: [sashal@kernel.org: Re: [GIT pull] irq/urgent for v6.15-rc1]
Message-ID: <Z-Wk0DUiGO8mkF6h@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

#regzbot introduced: c3164d2e0d18
#regzbot fix: 3ece3e8e5976
#regzbot title: Intermittent boot failure

----- Forwarded message from Sasha Levin <sashal@kernel.org> -----

Date: Wed, 26 Mar 2025 21:07:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [GIT pull] irq/urgent for v6.15-rc1

On Wed, Mar 26, 2025 at 08:08:16PM +0100, Thomas Gleixner wrote:
> Thomas Gleixner (1):
>      PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends

Hi Thomas,

I haven't bisected this, but I suspect that this commit is causing
boot-time panics that are observed on LKFT. Note the line numbers are
off by a bit.

Full logs of the run are available at:
https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.13-rc7-16083-gc13edfd29c29/testrun/27775255/suite/log-parser-test/test/bug-bug-kernel-null-pointer-dereference-address/details/

<1>[    1.540630] BUG: kernel NULL pointer dereference, address: 0000000000000002
<1>[    1.540630] #PF: supervisor read access in kernel mode
<1>[    1.540630] #PF: error_code(0x0000) - not-present page
<6>[    1.540630] PGD 0 P4D 0
<4>[    1.540630] Oops: Oops: 0000 [#1] SMP PTI
<4>[    1.540630] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0 #1 PREEMPT(voluntary)
<4>[    1.540630] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
<4>[ 1.540630] RIP: 0010:__pci_enable_msi_range (drivers/pci/msi/msi.c:300 drivers/pci/msi/msi.c:342 drivers/pci/msi/msi.c:412 drivers/pci/msi/msi.c:463)
<4>[ 1.540630] Code: ff ff ff e8 4e 18 fe ff f6 83 9f 06 00 00 10 0f b7 85 66 ff ff ff 74 0c 0d 00 01 00 00 66 89 85 66 ff ff ff 8b 8d 60 ff ff ff <41> f6 47 02 40 74 0c 25 ff fe 00 00 66 89 85 66 ff ff ff 89 8d 6c
All code
========
   0:	ff                   	(bad)
   1:	ff                   	(bad)
   2:	ff                   	(bad)
   3:	e8 4e 18 fe ff       	call   0xfffffffffffe1856
   8:	f6 83 9f 06 00 00 10 	testb  $0x10,0x69f(%rbx)
   f:	0f b7 85 66 ff ff ff 	movzwl -0x9a(%rbp),%eax
  16:	74 0c                	je     0x24
  18:	0d 00 01 00 00       	or     $0x100,%eax
  1d:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  24:	8b 8d 60 ff ff ff    	mov    -0xa0(%rbp),%ecx
  2a:*	41 f6 47 02 40       	testb  $0x40,0x2(%r15)		<-- trapping instruction
  2f:	74 0c                	je     0x3d
  31:	25 ff fe 00 00       	and    $0xfeff,%eax
  36:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  3d:	89                   	.byte 0x89
  3e:	8d                   	.byte 0x8d
  3f:	6c                   	insb   (%dx),%es:(%rdi)

Code starting with the faulting instruction
===========================================
   0:	41 f6 47 02 40       	testb  $0x40,0x2(%r15)
   5:	74 0c                	je     0x13
   7:	25 ff fe 00 00       	and    $0xfeff,%eax
   c:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  13:	89                   	.byte 0x89
  14:	8d                   	.byte 0x8d
  15:	6c                   	insb   (%dx),%es:(%rdi)
<4>[    1.540630] RSP: 0000:ffffa0df00013748 EFLAGS: 00010246
<4>[    1.540630] RAX: 0000000000000080 RBX: ffff932e00981000 RCX: 0000000000000001
<4>[    1.540630] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffffffff85e6e74c
<4>[    1.540630] RBP: ffffa0df00013820 R08: 0000000000000002 R09: ffffa0df00013714
<4>[    1.540630] R10: 0000000000000001 R11: ffffffff84ef46c0 R12: ffff932e009810c0
<4>[    1.540630] R13: 0000000000000001 R14: ffff932e00981000 R15: 0000000000000000
<4>[    1.540630] FS:  0000000000000000(0000) GS:ffff932ef5f71000(0000) knlGS:0000000000000000
<4>[    1.540630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    1.540630] CR2: 0000000000000002 CR3: 0000000020a2e000 CR4: 00000000000006f0
<4>[    1.540630] Call Trace:
<4>[    1.540630]  <TASK>
<4>[ 1.540630] pci_alloc_irq_vectors_affinity (drivers/pci/msi/api.c:?)
<4>[ 1.540630] pci_alloc_irq_vectors (drivers/pci/msi/api.c:235)
<4>[ 1.540630] ahci_init_irq (drivers/ata/ahci.c:1720)
<4>[ 1.540630] ahci_init_one (drivers/ata/ahci.c:2004)
<4>[ 1.540630] pci_device_probe (drivers/pci/pci-driver.c:325 drivers/pci/pci-driver.c:392 drivers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:451)
<4>[ 1.540630] really_probe (drivers/base/dd.c:?)
<4>[ 1.540630] __driver_probe_device (drivers/base/dd.c:?)
<4>[ 1.540630] driver_probe_device (drivers/base/dd.c:830)
<4>[ 1.540630] __driver_attach (drivers/base/dd.c:1217)
<4>[ 1.540630] bus_for_each_dev (drivers/base/bus.c:369)
<4>[ 1.540630] driver_attach (drivers/base/dd.c:1234)
<4>[ 1.540630] bus_add_driver (drivers/base/bus.c:678)
<4>[ 1.540630] driver_register (drivers/base/driver.c:250)
<4>[ 1.540630] __pci_register_driver (drivers/pci/pci-driver.c:1448)
<4>[ 1.540630] ahci_pci_driver_init (drivers/ata/ahci.c:2090)
<4>[ 1.540630] do_one_initcall (init/main.c:1257)
<4>[ 1.540630] do_initcall_level (init/main.c:1318)
<4>[ 1.540630] do_initcalls (init/main.c:1332)
<4>[ 1.540630] do_basic_setup (init/main.c:1355)
<4>[ 1.540630] kernel_init_freeable (init/main.c:1571)
<4>[ 1.540630] kernel_init (init/main.c:1459)
<4>[ 1.540630] ret_from_fork (arch/x86/kernel/process.c:159)
<4>[ 1.540630] ret_from_fork_asm (arch/x86/entry/entry_64.S:258)
<4>[    1.540630]  </TASK>
<4>[    1.540630] Modules linked in:
<4>[    1.540630] CR2: 0000000000000002
<4>[    1.540630] ---[ end trace 0000000000000000 ]---
<4>[ 1.540630] RIP: 0010:__pci_enable_msi_range (drivers/pci/msi/msi.c:300 drivers/pci/msi/msi.c:342 drivers/pci/msi/msi.c:412 drivers/pci/msi/msi.c:463)
<4>[ 1.540630] Code: ff ff ff e8 4e 18 fe ff f6 83 9f 06 00 00 10 0f b7 85 66 ff ff ff 74 0c 0d 00 01 00 00 66 89 85 66 ff ff ff 8b 8d 60 ff ff ff <41> f6 47 02 40 74 0c 25 ff fe 00 00 66 89 85 66 ff ff ff 89 8d 6c
All code
========
   0:	ff                   	(bad)
   1:	ff                   	(bad)
   2:	ff                   	(bad)
   3:	e8 4e 18 fe ff       	call   0xfffffffffffe1856
   8:	f6 83 9f 06 00 00 10 	testb  $0x10,0x69f(%rbx)
   f:	0f b7 85 66 ff ff ff 	movzwl -0x9a(%rbp),%eax
  16:	74 0c                	je     0x24
  18:	0d 00 01 00 00       	or     $0x100,%eax
  1d:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  24:	8b 8d 60 ff ff ff    	mov    -0xa0(%rbp),%ecx
  2a:*	41 f6 47 02 40       	testb  $0x40,0x2(%r15)		<-- trapping instruction
  2f:	74 0c                	je     0x3d
  31:	25 ff fe 00 00       	and    $0xfeff,%eax
  36:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  3d:	89                   	.byte 0x89
  3e:	8d                   	.byte 0x8d
  3f:	6c                   	insb   (%dx),%es:(%rdi)

Code starting with the faulting instruction
===========================================
   0:	41 f6 47 02 40       	testb  $0x40,0x2(%r15)
   5:	74 0c                	je     0x13
   7:	25 ff fe 00 00       	and    $0xfeff,%eax
   c:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
  13:	89                   	.byte 0x89
  14:	8d                   	.byte 0x8d
  15:	6c                   	insb   (%dx),%es:(%rdi)
<4>[    1.540630] RSP: 0000:ffffa0df00013748 EFLAGS: 00010246
<4>[    1.540630] RAX: 0000000000000080 RBX: ffff932e00981000 RCX: 0000000000000001
<4>[    1.540630] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffffffff85e6e74c
<4>[    1.540630] RBP: ffffa0df00013820 R08: 0000000000000002 R09: ffffa0df00013714
<4>[    1.540630] R10: 0000000000000001 R11: ffffffff84ef46c0 R12: ffff932e009810c0
<4>[    1.540630] R13: 0000000000000001 R14: ffff932e00981000 R15: 0000000000000000
<4>[    1.540630] FS:  0000000000000000(0000) GS:ffff932ef5f71000(0000) knlGS:0000000000000000
<4>[    1.540630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    1.540630] CR2: 0000000000000002 CR3: 0000000020a2e000 CR4: 00000000000006f0
<6>[    1.540630] note: swapper/0[1] exited with irqs disabled
<0>[    1.574039] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
<0>[    1.574664] Kernel Offset: 0x2c00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
<0>[    1.574664] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---


-- 
Thanks,
Sasha

----- End forwarded message -----
