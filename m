Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1183101A6
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892936; cv=none; b=jqOZSX9oogaDNyQs3Eio7m7iTP/xvK6Ybq8u4GokERlnhiAi4nm4bG6qR6ykISfhU9nwbHrt61ulfd5ZVRMk1Io2Xi7+2i3jKpbsq6z97V4GQXuXNQZcQQ+rlL4n9YIWZCOHD62TMFN8rTqUH6Dmsu/41TWhZYnFGDn9ew9eDIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892936; c=relaxed/simple;
	bh=bE2aq9apwOgEFP7XvaW+vWVk73wY42f+rL2BryMu2Fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AURSmUxCU3S2fHECnBgMacv9rBB/FZLp5yz5AL9cfzQlQVvYVus2Nso8dqMATUGKnv1BIvqTdHtOouopECr5wpOqEazrOQeueFDjjos8nSUsFogc/5lkKsC1RdMJrobASWrcEGrGvhiVOwPq4e/BEaohU98R+d2AeCnGTUngGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bPGEy2iL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+0stXMUH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bPGEy2iL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+0stXMUH"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776892932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyMPKfqTnkr/wpefzF9zf/jvUqC/u5Z37wY0HaS628U=;
	b=bPGEy2iLgIS/3+ASIsxWtQFQqbNxezXXCblZwkitvFakngQS7SJU9uItNcq2VHDq3EsK5y
	iZSByNFulqqihhiwQ6qyHad4Ohm42wJbTrV3xiJfUtGj3zDLiCv51iaB107Q4HxTL3oAUR
	ovqT+Bmi8FQyQjuBhXPGaOLcLmOGrTdIi2Pn8nWHmS72ywT5+JI97K30z3+tE/dXhuyLoM
	ibkRcw7u75LOCrOWUtphW3UiyqtYNaD1j3k+sSj5OzyNcSKt7EpvgWN1K9NQIiPgpQQPxG
	ajqPmlCNe6AKmL3Z6nr733RPUSUtp6ViIWXWr00HgkZGUIO2MWDOWGzqdApmRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776892932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyMPKfqTnkr/wpefzF9zf/jvUqC/u5Z37wY0HaS628U=;
	b=+0stXMUHjrp3yLi9hY9WbQXlMutm0VstfQon0n3u4Y9EMzJTxYGrP4Kfcu8BFxR96HzGM2
	qHUocyNWLv2eS3Bg==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup
 Patel <anup@brainfault.org>, Sunil V L <sunilvl@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn
 Helgaas <helgaas@kernel.org>, 1127635@bugs.debian.org, "Aaron D. Johnson"
 <debbugreporter@fnord.greeley.co.us>, regressions@lists.linux.dev
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-Reply-To: <abE_QoS5DM-ZltaV@monoceros>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
 <87ed2a8ow5.ffs@tglx> <abE_QoS5DM-ZltaV@monoceros>
Date: Wed, 22 Apr 2026 23:22:11 +0200
Message-ID: <87qzo61yik.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11 2026 at 12:22, Uwe Kleine-K=C3=B6nig wrote:

> this patch became a60b990798eb17433d0283788280422b1bd94b18 in v6.13-rc5
> and was backported to 6.12.y and 6.6.y (aed157301c65 and b1f7476e07b9
> respectively).
>
> A Debian user (Aaron, on Cc:) on powerpc has boot problems and bisected
> them to this commit. The relevant boot log of the failure is:

> [    2.643879] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [    2.643891] Faulting instruction address: 0xc000000000a39514
> [    2.643902] Oops: Kernel access of bad area, sig: 11 [#1]
> [    2.643909] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeri=
es
> [    2.643920] Modules linked in: ohci_pci(+) ehci_hcd nvme_fabrics ohci_=
hcd nvme_keyring nvme_core usbcore nvme_auth scsi_transport_fc ipr configfs=
 ehea(+) usb_common
> [    2.643965] CPU: 5 UID: 0 PID: 250 Comm: (udev-worker) Not tainted 6.1=
2.17-powerpc64 #1  Debian 6.12.17-1
> [    2.643976] Hardware name: IBM,8204-E8A POWER6 (architected) 0x3e0302 =
0xf000002 of:IBM,EL350_118 hv:phyp pSeries
> [    2.643986] NIP:  c000000000a39514 LR: c000000000a36ed8 CTR: c00000000=
0a35820
> [    2.643995] REGS: c0000000351f6f60 TRAP: 0300   Not tainted  (6.12.17-=
powerpc64 Debian 6.12.17-1)
> [    2.644004] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 24222288  =
XER: 00000000
> [    2.644031] CFAR: c00000000000cfc4 DAR: 0000000000000000 DSISR: 400000=
00 IRQMASK: 0
> [    2.644031] GPR00: c000000000a36ed8 c0000000351f7200 c00000000182e200 =
c0000003df294000
> [    2.644031] GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    2.644031] GPR08: 0000000000000001 0000000000000000 c00000000228fcc0 =
0000000044222288
> [    2.644031] GPR12: c000000000a35820 c00000000eeacb00 0000000000000020 =
0000010037fcab20
> [    2.644031] GPR16: 0000000022222248 0000000000020000 0000000000000000 =
00003fffebe8bb80
> [    2.644031] GPR20: 0000000000000000 c00000000204db60 c00000000204dd60 =
c00000000b1ae780
> [    2.644031] GPR24: 0000000000000000 00003fff8c9ac758 0000000000000000 =
c0000003df294000
> [    2.644031] GPR28: 0000000000000001 0000000000000000 c0000003df294000 =
0000000000000001
> [    2.644164] NIP [c000000000a39514] pci_msi_domain_supports (drivers/pc=
i/msi/irqdomain.c:366)
> [    2.644181] LR [c000000000a36ed8] __pci_enable_msi_range (drivers/pci/=
msi/msi.c:437)
> [    2.644192] Call Trace:
> [    2.644197] [c0000000351f7200] [c0000000351f7304] 0xc0000000351f7304 (=
unreliable)
> [    2.644211] [c0000000351f7340] [c000000000a3578c] pci_alloc_irq_vector=
s_affinity (drivers/pci/msi/api.c:277)

> =3D=3D=3D=3D=3D=3D=3D=3D
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	80 69 00 00 	lwz     r3,0(r9)

> [    2.644031] GPR08: 0000000000000001 0000000000000000 c00000000228fcc0 =
0000000044222288

So R9 is NULL, R10 is the domain pointer.


>    4:	4b ff ff d8 	b       0xffffffffffffffdc
>    8:	60 00 00 00 	nop
>    c:	7c a5 00 34 	cntlzw  r5,r5
> [    2.644769] ---[ end trace 0000000000000000 ]---
>
>
> (That's the bug splat from the bug report piped through
> scripts/decode_stacktrace.sh)
>
> The kernel has CONFIG_PCI_MSI_ARCH_FALLBACKS=3Dy, so the first hunk
> shouldn't change anything.

Correct. But the Ooops is in the unchanged code part of
pci_msi_domain_supports().

> so the trapping happens in drivers/pci/msi/irqdomain.c:366 which is:
>
> 365	                info =3D domain->host_data;
> 366	                supported =3D info->flags;
>
> According to the register dump domain =3D=3D r10 =3D=3D NULL, but then th=
is code

No. You are looking at the wrong register set. The second one is the
user space register set from the syscall entry.=20

R10 contains the domain pointer and R9 is NULL, which does not make any
sense.

On 6.12 power64 still uses the global PCI/MSI domain model. According to
the splat this is pseries so the global PCI/MSI domain is created in
__pseries_msi_allocate_domains() via pci_msi_create_irq_domain(). The
latter takes a pointer to

       static struct msi_domain_info_pseries_msi_domain_info;

which is assigned to the global PCI/MSI domain::host_data.

Upstream got rid of that and uses per device domains, so it might have
been magically fixed by now, but I doubt it:

That new check in __pci_enable_msi_range() is benign as the actual
allocation code further down relies on domain::host_data being a valid
pointer as well.

It might not reach that point due to the subsequent checks, but if the
PCI device has pdev::dev::msi::domain populated, then this has to be
either a global PCI/MSI domain or a MSI parent domain. Both have
domain::host_data populated with a msi_domain_info pointer.

Something is mighty fishy here.

Aaron, can you please apply the patch below and see whether it fixes the
issue and provide the dmesg with the output of those pr_warn()'s?

The other information which would be useful: When you boot a kernel with
the commit reverted and look at that OHCI controller with lspci -vvv
then you should see whether it has MSI enabled or not. If it has MSI
enabled, then please provide the output of

   /sys/kernel/debug/irq/irqs/$IRQNR

You need to enable CONFIG_GENERIC_IRQ_DEBUGFS for that.

And that's actually useful for the debug patch below too because you can
then look at the domain name output and gather more information from

     /sys/kernel/debug/irq/domains/$NAME

Thanks,

        tglx
---
 drivers/pci/msi/irqdomain.c |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -115,6 +115,8 @@ struct irq_domain *pci_msi_create_irq_do
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent)
 {
+	struct irq_domain *domain;
+
 	if (WARN_ON(info->flags & MSI_FLAG_LEVEL_CAPABLE))
 		info->flags &=3D ~MSI_FLAG_LEVEL_CAPABLE;
=20
@@ -135,7 +137,12 @@ struct irq_domain *pci_msi_create_irq_do
 	/* Let the core update the bus token */
 	info->bus_token =3D DOMAIN_BUS_PCI_MSI;
=20
-	return msi_create_irq_domain(fwnode, info, parent);
+	domain =3D msi_create_irq_domain(fwnode, info, parent);
+	if (domain) {
+		pr_warn("Created global PCI/MSI domain %lx %s flags: %x\n",
+			(unsigned long)domain, domain->name, domain->flags);
+	}
+	return domain;
 }
 EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
=20
@@ -356,6 +363,12 @@ bool pci_msi_domain_supports(struct pci_
 		return false;
 	}
=20
+	if (!domain->host_data) {
+		pr_warn("Device MSI domain %lx %s %x lacks host data\n",
+			(unsigned long)domain, domain->name, domain->flags);
+		return false;
+	}
+
 	if (!irq_domain_is_msi_parent(domain)) {
 		/*
 		 * For "global" PCI/MSI interrupt domains the associated

