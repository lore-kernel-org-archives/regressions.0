Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0D265620
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776847836; cv=none; b=IiZyM9pu38dEVGZEy+sgEs5zAcb1r1HTeL2efQLbX9eiT0q/vSshIdZLVw9FDJIp3kWXx++hC6/+fDzWYXK1X5sM+2ZkK8EFO7iYNIcdahrlSUiFUqBY2PpmvkMCxyl4MWV366bkktUQ8RRLbq0z9QHjatUWmvR05zpevfgZB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776847836; c=relaxed/simple;
	bh=UoNNWejVPd7hs13AQjbM92rOJqLOq2gQgMbjziajEXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWQkHJQmum45I4JgSmCJz/Eg1R3UrNo6Yl0kUq868G01i/wooROUthU8fCrM8Um/H+Hxy/5IsoLTGl6hn9sH0mmI9Kn9+1olxr1f83donptEI0LbyPeJf6n3VTupKky+HpsmJeteiEyqlQyVL2oPvwEdMpwU1+kBdP0kcxUhh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=G9VMQbw3; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="G9VMQbw3"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g0tGV3bSMz432R;
	Wed, 22 Apr 2026 10:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776847826;
	bh=UoNNWejVPd7hs13AQjbM92rOJqLOq2gQgMbjziajEXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G9VMQbw3U+3uD/beEUl/lg0owARpGYHBtjltMErFpm3WxS1fkG8Nh9n6s+gW9Wjc/
	 5vo+AaYxZnfNGCKopzCBNvdLbxHIuLEDjxHvDT8NpT0VPjiPet9gPgk1ODQgqMzTkN
	 P9mjxsQKvc6lOHe70TqAgLC3M9jgXCeF4YOUmuGdr6ufNDyMh5dmTNuqImKL+MeBiQ
	 OfChDVXTyPn7FIhbOz4JyxHbhlb6WXrmTuCEur8jHKICQl4+Mqi+R2qPaLKqtzJf+V
	 3EY0Dtc6w0ESWHbFVezQ3oW2lIGeCEYBqtuyvCLgpuFHLdyOk9dtl4hlVxKn+gpHhT
	 L04AUThNVeTDw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g0tGV2rTxz431T;
	Wed, 22 Apr 2026 10:50:26 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g0tGR5m03z8sgT;
	Wed, 22 Apr 2026 10:50:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6AD74632AC;
	Wed, 22 Apr 2026 10:50:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
Date: Wed, 22 Apr 2026 10:50:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 1127635@bugs.debian.org,
 "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>,
 regressions@lists.linux.dev
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
 <87ed2a8ow5.ffs@tglx> <abE_QoS5DM-ZltaV@monoceros>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <abE_QoS5DM-ZltaV@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177684782298.1836032.2315212415003084841@mxe9fb.netcup.net>
X-NC-CID: 8svQcuXlMJfsWuveqt4IJPBzsT/evTL+TKk/YW+C8wRDCB14NMA=

On 3/11/26 12:22, Uwe Kleine-König wrote:
> Control: forwarded -1 https://lore.kernel.org/lkml/abE_QoS5DM-ZltaV@monoceros
> 
> #regzbot introduced: a60b990798eb17433d0283788280422b1bd94b18

Thomas, in case you missed it: this is a change of yours: a60b990798eb17
("PCI/MSI: Handle lack of irqdomain gracefully") [v6.13-rc5]

> #regzbot from: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
> #regzbot monitor: https://bugs.debian.org/1127635

Thx for forwarding the regression. Nothing happened since then -- or am
I missing something? If so: is that okay for everybody, or should we do
anything about this?

BTW, did anyone check if this happens with mainline (6.13/7.0) as well
to rule out that this is something that only happenens in the stable
series it was backported too? If it's the latter I wonder if reverting
it there might be a easy way to resolve this.

Ciao, Thorsten

On 3/4/26 09:47, Alexander Stein wrote:


> On Sat, Dec 14, 2024 at 12:50:18PM +0100, Thomas Gleixner wrote:
>> Alexandre observed a warning emitted from pci_msi_setup_msi_irqs() on a
>> RISCV platform which does not provide PCI/MSI support:
>>
>>  WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
>>  __pci_enable_msix_range+0x30c/0x596
>>  pci_msi_setup_msi_irqs+0x2c/0x32
>>  pci_alloc_irq_vectors_affinity+0xb8/0xe2
>>
>> RISCV uses hierarchical interrupt domains and correctly does not implement
>> the legacy fallback. The warning triggers from the legacy fallback stub.
>>
>> That warning is bogus as the PCI/MSI layer knows whether a PCI/MSI parent
>> domain is associated with the device or not. There is a check for MSI-X,
>> which has a legacy assumption. But that legacy fallback assumption is only
>> valid when legacy support is enabled, but otherwise the check should simply
>> return -ENOTSUPP.
>>
>> Loongarch tripped over the same problem and blindly enabled legacy support
>> without implementing the legacy fallbacks. There are weak implementations
>> which return an error, so the problem was papered over.
>>
>> Correct pci_msi_domain_supports() to evaluate the legacy mode and add
>> the missing supported check into the MSI enable path to complete it.
>>
>> Fixes: d2a463b29741 ("PCI/MSI: Reject multi-MSI early")
>> Reported-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Cc: stable@vger.kernel.org
> 
> this patch became a60b990798eb17433d0283788280422b1bd94b18 in v6.13-rc5
> and was backported to 6.12.y and 6.6.y (aed157301c65 and b1f7476e07b9
> respectively).
> 
> A Debian user (Aaron, on Cc:) on powerpc has boot problems and bisected
> them to this commit. The relevant boot log of the failure is:
> 
> [    2.643879] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [    2.643891] Faulting instruction address: 0xc000000000a39514
> [    2.643902] Oops: Kernel access of bad area, sig: 11 [#1]
> [    2.643909] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    2.643920] Modules linked in: ohci_pci(+) ehci_hcd nvme_fabrics ohci_hcd nvme_keyring nvme_core usbcore nvme_auth scsi_transport_fc ipr configfs ehea(+) usb_common
> [    2.643965] CPU: 5 UID: 0 PID: 250 Comm: (udev-worker) Not tainted 6.12.17-powerpc64 #1  Debian 6.12.17-1
> [    2.643976] Hardware name: IBM,8204-E8A POWER6 (architected) 0x3e0302 0xf000002 of:IBM,EL350_118 hv:phyp pSeries
> [    2.643986] NIP:  c000000000a39514 LR: c000000000a36ed8 CTR: c000000000a35820
> [    2.643995] REGS: c0000000351f6f60 TRAP: 0300   Not tainted  (6.12.17-powerpc64 Debian 6.12.17-1)
> [    2.644004] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 24222288  XER: 00000000
> [    2.644031] CFAR: c00000000000cfc4 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
> [    2.644031] GPR00: c000000000a36ed8 c0000000351f7200 c00000000182e200 c0000003df294000
> [    2.644031] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.644031] GPR08: 0000000000000001 0000000000000000 c00000000228fcc0 0000000044222288
> [    2.644031] GPR12: c000000000a35820 c00000000eeacb00 0000000000000020 0000010037fcab20
> [    2.644031] GPR16: 0000000022222248 0000000000020000 0000000000000000 00003fffebe8bb80
> [    2.644031] GPR20: 0000000000000000 c00000000204db60 c00000000204dd60 c00000000b1ae780
> [    2.644031] GPR24: 0000000000000000 00003fff8c9ac758 0000000000000000 c0000003df294000
> [    2.644031] GPR28: 0000000000000001 0000000000000000 c0000003df294000 0000000000000001
> [    2.644164] NIP [c000000000a39514] pci_msi_domain_supports (drivers/pci/msi/irqdomain.c:366)
> [    2.644181] LR [c000000000a36ed8] __pci_enable_msi_range (drivers/pci/msi/msi.c:437)
> [    2.644192] Call Trace:
> [    2.644197] [c0000000351f7200] [c0000000351f7304] 0xc0000000351f7304 (unreliable)
> [    2.644211] [c0000000351f7340] [c000000000a3578c] pci_alloc_irq_vectors_affinity (drivers/pci/msi/api.c:277)
> [    2.644225] [c0000000351f73d0] [c0003d0007d2f4d4] usb_hcd_pci_probe (drivers/usb/core/hcd-pci.c:192) usbcore
> [    2.644246] [c0000000351f7470] [c0003d00084e6030] ohci_pci_probe (drivers/usb/host/ohci-pci.c:285) ohci_pci
> [    2.644260] [c0000000351f7490] [c000000000a260e8] local_pci_probe (drivers/pci/pci-driver.c:324)
> [    2.644274] [c0000000351f7510] [c000000000a26218] pci_call_probe (drivers/pci/pci-driver.c:392 (discriminator 1))
> [    2.644287] [c0000000351f7670] [c000000000a27348] pci_device_probe (drivers/pci/pci-driver.c:452)
> [    2.644300] [c0000000351f76b0] [c000000000b2e658] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658)
> [    2.644314] [c0000000351f7740] [c000000000b2eb24] __driver_probe_device (drivers/base/dd.c:800)
> [    2.644327] [c0000000351f77c0] [c000000000b2edc4] driver_probe_device (drivers/base/dd.c:831)
> [    2.644340] [c0000000351f7800] [c000000000b2f188] __driver_attach (drivers/base/dd.c:1217)
> [    2.644352] [c0000000351f7880] [c000000000b2ac64] bus_for_each_dev (drivers/base/bus.c:370)
> [    2.644365] [c0000000351f78e0] [c000000000b2dac4] driver_attach (drivers/base/dd.c:1234)
> [    2.644377] [c0000000351f7900] [c000000000b2cd98] bus_add_driver (drivers/base/bus.c:675)
> [    2.644389] [c0000000351f7990] [c000000000b30ae4] driver_register (drivers/base/driver.c:246)
> [    2.644402] [c0000000351f7a00] [c000000000a24f88] __pci_register_driver (drivers/pci/pci-driver.c:1450)
> [    2.644415] [c0000000351f7a20] [c0003d00084e6800] ohci_pci_init (drivers/usb/host/ohci-pci.c:308) ohci_pci
> [    2.644429] [c0000000351f7a50] [c00000000000fd60] do_one_initcall (init/main.c:1269)
> [    2.644444] [c0000000351f7b30] [c0000000002760f8] do_init_module (kernel/module/main.c:2543)
> [    2.644460] [c0000000351f7bb0] [c000000000278fe4] init_module_from_file (kernel/module/main.c:3199)
> [    2.644473] [c0000000351f7c90] [c0000000002793e0] sys_finit_module (kernel/module/main.c:3211 kernel/module/main.c:3238 kernel/module/main.c:3221)
> [    2.644487] [c0000000351f7da0] [c00000000002c084] system_call_exception (arch/powerpc/kernel/syscall.c:171)
> [    2.644500] [c0000000351f7e50] [c00000000000cb54] system_call_common (arch/powerpc/kernel/interrupt_64.S:292)
> [    2.644515] --- interrupt: c00 at 0x3fff8d653d8c
> [    2.644522] NIP:  00003fff8d653d8c LR: 00003fff8c9a4680 CTR: 0000000000000000
> [    2.644531] REGS: c0000000351f7e80 TRAP: 0c00   Not tainted  (6.12.17-powerpc64 Debian 6.12.17-1)
> [    2.644541] MSR:  800000000200f032 <SF,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22222222  XER: 00000000
> [    2.644573] IRQMASK: 0
> [    2.644573] GPR00: 0000000000000161 00003fffebe8b640 00003fff8d757100 0000000000000052
> [    2.644573] GPR04: 00003fff8c9ac758 0000000000000004 0000000000000058 000000000000005a
> [    2.644573] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.644573] GPR12: 0000000000000000 00003fff8de947c0 0000000000000020 0000010037fcab20
> [    2.644573] GPR16: 0000000022222248 0000000000020000 0000000000000000 00003fffebe8bb80
> [    2.644573] GPR20: 0000000000000000 00003fffebe8bb70 0000000000000007 0000010037fca210
> [    2.644573] GPR24: 0000000000000000 0000000000000000 0000010037f6be40 0000000000000004
> [    2.644573] GPR28: 00003fff8c9ac758 0000000000020000 0000000000000004 0000010037fca210
> [    2.644698] NIP [00003fff8d653d8c] 0x3fff8d653d8c
> [    2.644705] LR [00003fff8c9a4680] 0x3fff8c9a4680
> [    2.644713] --- interrupt: c00
> [ 2.644719] Code: 4182002c e92a0088 80690000 7c632038 7c632278 7c630034 5463d97e 786307e0 4e800020 60000000 60000000 e92a0020 <80690000> 4bffffd8 60000000 7ca50034
> All code
> ========
>    0:*	41 82 00 2c 	beq     0x2c		<-- trapping instruction
>    4:	e9 2a 00 88 	ld      r9,136(r10)
>    8:	80 69 00 00 	lwz     r3,0(r9)
>    c:	7c 63 20 38 	and     r3,r3,r4
>   10:	7c 63 22 78 	xor     r3,r3,r4
>   14:	7c 63 00 34 	cntlzw  r3,r3
>   18:	54 63 d9 7e 	srwi    r3,r3,5
>   1c:	78 63 07 e0 	clrldi  r3,r3,63
>   20:	4e 80 00 20 	blr
>   24:	60 00 00 00 	nop
>   28:	60 00 00 00 	nop
>   2c:	e9 2a 00 20 	ld      r9,32(r10)
>   30:	80 69 00 00 	lwz     r3,0(r9)
>   34:	4b ff ff d8 	b       0xc
>   38:	60 00 00 00 	nop
>   3c:	7c a5 00 34 	cntlzw  r5,r5
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	80 69 00 00 	lwz     r3,0(r9)
>    4:	4b ff ff d8 	b       0xffffffffffffffdc
>    8:	60 00 00 00 	nop
>    c:	7c a5 00 34 	cntlzw  r5,r5
> [    2.644769] ---[ end trace 0000000000000000 ]---
> 
> 
> (That's the bug splat from the bug report piped through
> scripts/decode_stacktrace.sh)
> 
> The kernel has CONFIG_PCI_MSI_ARCH_FALLBACKS=y, so the first hunk
> shouldn't change anything.
> 
> The disassembly of pci_msi_domain_supports in the kernel looks as
> follows:
> 
> 	c000000000a394c0 <pci_msi_domain_supports>:
> 	pci_msi_domain_supports():
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:334
> 	c000000000a394c0:       60 00 00 00     nop
> 	c000000000a394c4:       60 00 00 00     nop
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:353
> 	c000000000a394c8:       e9 43 02 e8     ld      r10,744(r3)
> 	c000000000a394cc:       2c 2a 00 00     cmpdi   r10,0
> 	c000000000a394d0:       41 82 00 50     beq     c000000000a39520 <pci_msi_domain_supports+0x60>
> 	irq_domain_is_hierarchy():
> 	debian/build/build_powerpc_none_powerpc64/include/linux/irqdomain.h:661
> 	c000000000a394d4:       81 2a 00 28     lwz     r9,40(r10)
> 	pci_msi_domain_supports():
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:353 (discriminator 1)
> 	c000000000a394d8:       71 28 00 01     andi.   r8,r9,1
> 	c000000000a394dc:       41 82 00 44     beq     c000000000a39520 <pci_msi_domain_supports+0x60>
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:359 (discriminator 1)
> 	c000000000a394e0:       71 29 01 00     andi.   r9,r9,256
> 	c000000000a394e4:       41 82 00 2c     beq     c000000000a39510 <pci_msi_domain_supports+0x50>
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:375
> 	c000000000a394e8:       e9 2a 00 88     ld      r9,136(r10)
> 	c000000000a394ec:       80 69 00 00     lwz     r3,0(r9)
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:378
> 	c000000000a394f0:       7c 63 20 38     and     r3,r3,r4
> 	c000000000a394f4:       7c 63 22 78     xor     r3,r3,r4
> 	c000000000a394f8:       7c 63 00 34     cntlzw  r3,r3
> 	c000000000a394fc:       54 63 d9 7e     srwi    r3,r3,5
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:379
> 	c000000000a39500:       78 63 07 e0     clrldi  r3,r3,63
> 	c000000000a39504:       4e 80 00 20     blr
> 	c000000000a39508:       60 00 00 00     nop
> 	c000000000a3950c:       60 00 00 00     nop
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:366
> 	c000000000a39510:       e9 2a 00 20     ld      r9,32(r10)
> 	c000000000a39514:       80 69 00 00     lwz     r3,0(r9)
> 	c000000000a39518:       4b ff ff d8     b       c000000000a394f0 <pci_msi_domain_supports+0x30>
> 	c000000000a3951c:       60 00 00 00     nop
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:355
> 	c000000000a39520:       7c a5 00 34     cntlzw  r5,r5
> 	c000000000a39524:       54 a3 d9 7e     srwi    r3,r5,5
> 	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:379
> 	c000000000a39528:       78 63 07 e0     clrldi  r3,r3,63
> 	c000000000a3952c:       4e 80 00 20     blr
> 
> 
> so the trapping happens in drivers/pci/msi/irqdomain.c:366 which is:
> 
> 365	                info = domain->host_data;
> 366	                supported = info->flags;
> 
> According to the register dump domain == r10 == NULL, but then this code
> would not have been reached and the faulting instruction would be at
> c000000000a39510. So maybe it's only .host_data = NULL and the register
> dump is unreliable??
> 
> The offsets match: .host_data is at offset 32 of struct
> irq_domain and .flags is at offset 0 of struct msi_domain_info.
> 
> For more details see
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1127635 .
> 
> Does someone spot the issue?
> 
> Best regards
> Uwe

