Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438B2ED148
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809194; cv=none; b=aUYKbcOBpCK6HKTEb3vNomODLhl2GG4FKgUJXUbR46qf5LXf8b6TUCGkud6QWrkUEmcpt2amlydhXoXIETo3Y9vR5P0kelLbIBxNx9/3biqAuUoGea1ZQhjRSIbklrL2W+ZSzS2bFr63e1rjb3meyCrB3Q1L7oK/xSga7lUgdb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809194; c=relaxed/simple;
	bh=f7NgVaGDtwB2j3QBdDotfl4Edn+cJz4VwgmShcfeNQA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ed3eQsmMp4EBwVbSdHiUNIsKetU5JS9FHOkyF7KJRq6FNWxsgn2JxdC/U16kyASo0TlLTRA8AB0lk97B5d79TGR0eNxBQ63m1qB72QNBi0Q/31eX8H8Ksf62gdpfTMJZgs6tGcq6xlQ6+e5QaQnRIeMuhDXsfPPc+hZ634jZouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEV9YJ7v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEV9YJ7v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ce47d1f1f8so3478516f8f.2
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756809191; x=1757413991; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nUH3hKBGBMf/pIveP3QzHoZ1J0gJRqgw9aKaWY+MxPo=;
        b=QEV9YJ7v/GwqjEiLPwXvtv2HsAlrctO7Pib+FgGYzGViE4Xbbmfa9fNLltJqJzjvSQ
         PMDyhJ0dfSnyyzhrwNRXyZySGuFkr5BvALMFe4UtZpF9hON1QaQh7KL7lob3ZbOx2aAU
         VERkaWt9GeXBmpGuaJQYA0+1Y/FGADDtRzNqDB3zQCinbmB6PVxA39CS+ie0+SneEsq+
         hx5gOu9TyvI/pimw3oqb1XMaiiyXBqX6VgCeMsXoTpEb2DlxcR2Be1Wzco34hC7vvYph
         ZDA/7LcbluNpifjXsGPW7wHoOMyHnw/3mojSP2NTqOAGDYvF+x8z/2Z9X4LlegME8nj/
         B6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809191; x=1757413991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUH3hKBGBMf/pIveP3QzHoZ1J0gJRqgw9aKaWY+MxPo=;
        b=RyDpBg2CE4qydzXW5nmp3DOjq5RDqrJycPJnJZNiKhyvdqMd17aoWjtqnjHXPerrSl
         mt/t8Ge+upwcFQtr4U1KNojazMT3pWmE91WQnJvIkpNCJR/HiHnEPVeeRRz4w/mjQC0f
         Z06Iy1riJhnOsfZKA9blR+L66gjuZU2t0RrL6TTPxYtANSLRakYNbaci1CMDFNdFzI1Z
         XXN8NgiZ4MInI/+PH3iQ33aDiggPrVG4MWPeGm3o1/X6kms7TsY1PrOy5+icjRfEhAy6
         58V++7tirOclAB9wh15tpJ92E53x9EnJGG3XFezcxhfydlVOgtbnVb3ZPL8K5RRoNTx/
         yV0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhrQh2qQutOrcwJVFEMxZpDMzy36zV8oaS9stBYEohudQFEUnhd78fn2J7S5U5zsQQwMalQoABXiTG5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnlLXKs9pKTp4lkrgDsQI6RSGK6euP7pdBBbmsLdnMrFRm3Xc1
	TDPpppFlR1mr4I/rphgktG/KQ8VDQeuCe+k8QfJ6vDkmKsJrsTsvvYc8
X-Gm-Gg: ASbGncttJVEo6NkgkR+qPK3uGmfdMqWSvJIERXM/iHMRjY4P3fbum1qqCOhJCVeGgts
	Cgy71DkCl7IFOFhq+ksSctTgO7YF5yqkrxVC4qs1F7Ho/q/rpWBgFgbqHfu9xU27w1Wny56IwZI
	9A9k0mHTQa7osFsjaFm2Btg1Q84zV3oNKqSJGf3HLBo285j7bP6BhalK3DYJRSd7yrZMyz1UipS
	BBYQZ7iXiCvy19Qcdmaju5wcW8WF97ilT0guCD7FCwZqSchRYNbjLFhMIdfpxNOvxpk7dran/Ai
	0O6RngkGfGlqNEwuM6QE45kh1KWzfzCUPcccc8G9243iCFbkNVWP1uVNQ/FaTH3rF/clzKRbYoe
	rJmyH9IWdf13TwrnZUngZUFzkIcih5Z1KC5+PTUFxyR/CuUWq063jud+Nx/NRtbLtvgaZ2wiK/n
	lYA5FnQReCe/SS1gk=
X-Google-Smtp-Source: AGHT+IHAQoKS3kQS6aPIjL5KoMCjfW1ghSpx1C+y/3keGn9VbWBBe28FMc6gH+07RyC/PgYLdjR8DQ==
X-Received: by 2002:a05:6000:430c:b0:3d3:9b18:227e with SMTP id ffacd0b85a97d-3d39b1825a8mr8939060f8f.10.1756809190834;
        Tue, 02 Sep 2025 03:33:10 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:3f02:d36b:e22e:74c6? ([2a02:168:6806:0:3f02:d36b:e22e:74c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm10118932f8f.0.2025.09.02.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:33:10 -0700 (PDT)
Message-ID: <aa3f03dcb1240d43820c9b75501c092a7732b22d.camel@gmail.com>
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jan Palus <jpalus@fastmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, 	regressions@lists.linux.dev
Date: Tue, 02 Sep 2025 12:33:09 +0200
In-Reply-To: <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
		 <20250820184603.GA633069@bhelgaas>
		 <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
	 <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-09-02 at 11:09 +0200, Klaus Kudielka wrote:
> Something like this on top of mainline - completely untested, but maybe w=
orth a try.
>=20
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/=
pci-mvebu.c
> index 755651f338..3fce4a2b63 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struc=
t platform_device *pdev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_ioremap_resource(&=
pdev->dev, &port->regs);
> =C2=A0}
> =C2=A0
> -#define DT_FLAGS_TO_TYPE(flags)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((f=
lags) >> 24) & 0x03)
> -#define=C2=A0=C2=A0=C2=A0 DT_TYPE_IO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1
> -#define=C2=A0=C2=A0=C2=A0 DT_TYPE_MEM32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2
> =C2=A0#define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
> =C2=A0#define DT_CPUADDR_TO_ATTR(cpuaddr)=C2=A0=C2=A0 (((cpuaddr) >> 48) =
& 0xFF)
> =C2=A0
> @@ -1189,17 +1186,9 @@ static int mvebu_get_tgt_attr(struct device_node *=
np, int devfn,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -EINVAL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_of_range(&parser, &ra=
nge) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long rtype;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u32 slot =3D upper_32_bits(range.bus_addr);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtype =3D IORE=
SOURCE_IO;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtype =3D IORE=
SOURCE_MEM;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D range.flags) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tgt =3D=
 DT_CPUADDR_TO_TARGET(range.cpu_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *attr =
=3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0=
;
>=20

Following up myself. With this patch on top of 6.17.0-rc4, I do see the PCI=
 bridges for the two free slots on my Turris Omnia.
One slot is occupied by mSATA. I don't have any suitable Mini-PCIe card to =
test, though.

$ lspci
00:02.0 PCI bridge: Marvell Technology Group Ltd. 88F6820 [Armada 385] ARM =
SoC (rev 04)
00:03.0 PCI bridge: Marvell Technology Group Ltd. 88F6820 [Armada 385] ARM =
SoC (rev 04)
$ dmesg | head -5
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.17.0-rc4+ (klaus@mars) (arm-linux-gnueabihf-=
gcc (Debian 14.3.0-5) 14.3.0, GNU ld (GNU Binutils for Debian) 2.45) #10 SM=
P Tue Sep  2 11:49:13 CEST 2025
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Turris Omnia
$ dmesg | grep -i pci
[    0.015195] PCI: CLS 0 bytes, default 64
[    0.026199] mvebu-pcie soc:pcie: host bridge /soc/pcie ranges:
[    0.026224] mvebu-pcie soc:pcie:      MEM 0x00f1080000..0x00f1081fff -> =
0x0000080000
[    0.026240] mvebu-pcie soc:pcie:      MEM 0x00f1040000..0x00f1041fff -> =
0x0000040000
[    0.026253] mvebu-pcie soc:pcie:      MEM 0x00f1044000..0x00f1045fff -> =
0x0000044000
[    0.026265] mvebu-pcie soc:pcie:      MEM 0x00f1048000..0x00f1049fff -> =
0x0000048000
[    0.026278] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0100000000
[    0.026290] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0100000000
[    0.026302] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0200000000
[    0.026314] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0200000000
[    0.026326] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0300000000
[    0.026338] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0300000000
[    0.026350] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0400000000
[    0.026358] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0400000000
[    0.026554] mvebu-pcie soc:pcie: pcie1.0: Slot power limit 10.0W
[    0.026743] mvebu-pcie soc:pcie: pcie2.0: Slot power limit 10.0W
[    0.026955] mvebu-pcie soc:pcie: PCI host bridge to bus 0000:00
[    0.026963] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.026970] pci_bus 0000:00: root bus resource [mem 0xf1080000-0xf1081ff=
f] (bus address [0x00080000-0x00081fff])
[    0.026976] pci_bus 0000:00: root bus resource [mem 0xf1040000-0xf1041ff=
f] (bus address [0x00040000-0x00041fff])
[    0.026981] pci_bus 0000:00: root bus resource [mem 0xf1044000-0xf1045ff=
f] (bus address [0x00044000-0x00045fff])
[    0.026986] pci_bus 0000:00: root bus resource [mem 0xf1048000-0xf1049ff=
f] (bus address [0x00048000-0x00049fff])
[    0.026991] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7fffff=
f]
[    0.026995] pci_bus 0000:00: root bus resource [io  0x1000-0xeffff]
[    0.027113] pci 0000:00:02.0: [11ab:6820] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.027127] pci 0000:00:02.0: PCI bridge to [bus 00]
[    0.027134] pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
[    0.027138] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff=
]
[    0.027277] /soc/pcie/pcie@2,0: Fixed dependency cycle(s) with /soc/pcie=
/pcie@2,0/interrupt-controller
[    0.027311] pci 0000:00:03.0: [11ab:6820] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.027323] pci 0000:00:03.0: PCI bridge to [bus 00]
[    0.027329] pci 0000:00:03.0:   bridge window [io  0x0000-0x0fff]
[    0.027333] pci 0000:00:03.0:   bridge window [mem 0x00000000-0x000fffff=
]
[    0.027443] /soc/pcie/pcie@3,0: Fixed dependency cycle(s) with /soc/pcie=
/pcie@3,0/interrupt-controller
[    0.028311] PCI: bus0: Fast back to back transfers disabled
[    0.028319] pci 0000:00:02.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[    0.028327] pci 0000:00:03.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[    0.028418] PCI: bus1: Fast back to back transfers enabled
[    0.028424] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.028506] PCI: bus2: Fast back to back transfers enabled
[    0.028510] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[    0.028526] pci 0000:00:02.0: PCI bridge to [bus 01]
[    0.028535] pci 0000:00:03.0: PCI bridge to [bus 02]
[    0.028542] pci_bus 0000:00: resource 4 [mem 0xf1080000-0xf1081fff]
[    0.028547] pci_bus 0000:00: resource 5 [mem 0xf1040000-0xf1041fff]
[    0.028552] pci_bus 0000:00: resource 6 [mem 0xf1044000-0xf1045fff]
[    0.028556] pci_bus 0000:00: resource 7 [mem 0xf1048000-0xf1049fff]
[    0.028560] pci_bus 0000:00: resource 8 [mem 0xe0000000-0xe7ffffff]
[    0.028564] pci_bus 0000:00: resource 9 [io  0x1000-0xeffff]



