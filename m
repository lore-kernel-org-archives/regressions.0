Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FA35C6B5
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606447; cv=none; b=cUBUW+/2TSLmoT/7iDbTT2FpgMicbO/2DulylMVr09Eu9iKZLHT4RffGmyplQwps3Yb1Fus2A3hz5ilg+qrdB/WjVAVz7mXGGYeAi7wXcAhQ+LZG5AjluVfN0be8yv3qxWPGYMFJoAGurdaEBl1bVoSs7rPcKZg+P9V7goxhidk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606447; c=relaxed/simple;
	bh=XnpRpUcjV+SwhssoG64/pVM4fLCQfD7X+rQPr7zKOCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUtMVheFkuqkr+npE9BJ5Dc3mJySybjnjvA4e7kwsXGF1uCU/zKkmQwLnmTn2SFsl7h+U2QHPYXnyT85WtWX83JlTaJvENOrXe023WuRe8ZiWYKej2/37Sd3FYxkguuToRxlbuVtGcW2s9IWwf25X6QpZPSxh8RBkk+8LYbUqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEec6IwJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEec6IwJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so3428105e9.1
        for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 00:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786606443; x=1787211243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OGfHdF5zxh45WiCN9Yf2JdXz9PpfwZ4K8R4uurHSBm8=;
        b=AEec6IwJ8NmTCyKyf0J0J0nYzoX+4QhgzqIHdTg50LVWwZ9DYtoFf9TlNe60J+0fez
         nJO5eBlZbOnanCAL9DOqhhSgKS26TmYKumRAgoz/qHRst3mk7QJUMfo9jQWakdWwb+Lu
         iqXNuGADbdDXqK1u+hFxYDpq4dtajWlbcivzo+Lruz/DkyefjXdglSh1PGXoumskgVE9
         zi6KYOK+yhwBKknK5nMB2y3SYh/NDtm8hZrR9d5cwG44rlg1wUnc54jW/IbwRmEW4ZOT
         IZFBi9KMOp3s4lKgp/Hzz9dlZF7prxSSOtV1LN67ABKHJ148mA5uQ66dxtqSNcrj4GEX
         m+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606443; x=1787211243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGfHdF5zxh45WiCN9Yf2JdXz9PpfwZ4K8R4uurHSBm8=;
        b=aHqIQZeCY0xGnSXltBv8tK9D4RtlH1meHAKp8OLB4Y8nLHbNGaTzMXocVu2px4Psm0
         CzfqRKSNGNilSIo1fy2BpgD+dfl81Xz1W5l6en9HThlAjpMpZa426+lzDn5zHOn8VJ8x
         +4boY7o9dTNeLGJ1W8BPu0UZLJf7kirQq+dbeGnXYq0SrG76Ehyx1eJqkEAT4Big00tA
         4suBO+ophgOmn59ijG817bdWZ5ZPVhMBpeasRKWQWuAk7NayquHWALRtA50oS0sR4FAg
         naZi8Il/f2lkl7oB4TQJOIRwXTBCf/j4INkmbBtetoCoplbId6gSHGGUL/Osu9OXFQBT
         KKpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOMqWKvrMh+trCNPl4EzylqrvkaR1tDtgQBoV7pCL8V8pbWu4/qcB9J/o9Q4EPhQ/Nse3sOFwTnjOlaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGzcJIf6owTrqsUzilmySNLPQqLskjFlM+RHCTyP42xVpplxwv
	CGZzap//NE0D8SUiCHWQRdfh0vIrz3H1h8XN3Tpr8j06F55JOzMHGmTi
X-Gm-Gg: AR+sD12/VEsMrFqLBMsjV5uT+21gZNjDqRbaEARbkW2/RXavN3Pakn9KuD0bgwkFkOe
	stnv1MhgOWGemclmwWkCDV7EUnj48oHPn067GNKhq4Stdq3LmTZRMv1R7h8jjiqwjuy4Ea2kOPv
	Brul0knOZFi5rINsqblAl42C7YtyODp1UC+Iy2MZUfehS3EAjADVJ5L02OM7NBHptj5bxLNG9zR
	n2M8hwqbLe6e/md3meTF7vxCpitYzb5NYD3cjYfhefJI3/RpOa9jVedgOwvbtYr4zAhVv41tMyn
	m6Wb2g244rKD/5aXnJHdgtttX01aAkgUdvZJsL2q/QiDdd9X1Cb8xu7ragoDR+Yp5Ok+IxjW2DV
	vo+T4cujZ2xOWcF0AZjKjS3R9+re9USpEw4tEp99q5/WIFrfOiaInkFziajyZ8x7U9gglw7zeQk
	Oq1XVbRiNnExEv62vMVRyNrWh4smpVOgYWUx6OdT5q+chHFnR12AwdEWg0NxcXn98kiO3fK7BAC
	pbIpKjecIPXDT70LhLq0sc91DXEo79abRKowZrOJngAVoU7dmI9Irbk2clt+uqhnl1ktRjKzXYA
	cI/WCalM5yj8unjTgb6d6v4m6cp62Qai8bk=
X-Received: by 2002:a05:600c:c87:b0:499:810b:6f57 with SMTP id 5b1f17b1804b1-49982200fa5mr26972705e9.4.1786606443134;
        Thu, 13 Aug 2026 00:34:03 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981de6a05sm67287465e9.1.2026.08.13.00.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:34:02 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:34:01 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>, Leonardo Costa <leoreis.costa@gmail.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <t65y5d54axtksbfs7r4olcefqhwm6m4dz3njgnrnf7fcotj74i@o7avoznlafbj>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
 <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
 <3hxiy6aaiagt5zunntpidaeqc4or4wrebf7mu7asvyyibqmvo2@xhvasdqp64rw>
 <GV2PR04MB12019BD5B14FA63CDFCC2015B8CDD2@GV2PR04MB12019.eurprd04.prod.outlook.com>
 <20260811063752.GA7332@francesco-nb>
 <GV2PR04MB12019BC21C743E1BEF1BE8F4C8CDC2@GV2PR04MB12019.eurprd04.prod.outlook.com>
 <anwYlX0uC1nFCxnp@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anwYlX0uC1nFCxnp@gaggiata.pivistrello.it>

On Wed, Aug 12, 2026 at 08:54:13AM +0200, Francesco Dolcini wrote:
> On Wed, Aug 12, 2026 at 06:22:57AM +0000, Hongxing Zhu wrote:
> > 
> > NXP Confidential
> > > -----Original Message-----
> > > From: Francesco Dolcini <francesco@dolcini.it>
> > > Sent: Tuesday, August 11, 2026 2:38 PM
> > > To: Hongxing Zhu (OSS) <hongxing.zhu@oss.nxp.com>
> > > Cc: Leonardo Costa <leoreis.costa@gmail.com>; Bjorn Helgaas
> > > <helgaas@kernel.org>; robh@kernel.org; krzk+dt@kernel.org;
> > > conor+dt@kernel.org; Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; festevam@gmail.com; leonardo.costa@toradex.com;
> > > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > > kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > regressions@lists.linux.dev; Sherry Sun <sherry.sun@nxp.com>; Manivannan
> > > Sadhasivam <mani@kernel.org>; Hongxing Zhu <hongxing.zhu@nxp.com>;
> > > linux-pci@vger.kernel.org
> > > Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
> > >
> > > On Tue, Aug 11, 2026 at 12:47:18AM +0000, Hongxing Zhu (OSS) wrote:
> > > > > -----Original Message-----
> > > > > From: Leonardo Costa <leoreis.costa@gmail.com>
> > > > > Sent: Tuesday, August 11, 2026 2:26 AM
> > > > > To: Hongxing Zhu (OSS) <hongxing.zhu@oss.nxp.com>
> > > > > Cc: Bjorn Helgaas <helgaas@kernel.org>; robh@kernel.org;
> > > > > krzk+dt@kernel.org; conor+dt@kernel.org; Frank Li
> > > > > krzk+<frank.li@nxp.com>;
> > > > > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > > > > leonardo.costa@toradex.com; devicetree@vger.kernel.org;
> > > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> > > > > kernel@vger.kernel.org; regressions@lists.linux.dev; Sherry Sun
> > > > > <sherry.sun@nxp.com>; Manivannan Sadhasivam <mani@kernel.org>;
> > > > > Hongxing Zhu <hongxing.zhu@nxp.com>; linux-pci@vger.kernel.org
> > > > > Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer
> > > > > boots
> > > > >
> > > > > On Thu, Jul 16, 2026 at 02:09:19PM -0300, Leonardo Costa wrote:
> > > > > > On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> > > > > > > Hi Leonardo,
> > > > > > >
> > > > > > > Would you be able to test this patch on your affected boards?
> > > > > > > Your testing would help expedite the merge process and ensure
> > > > > > > the fix resolves the boot issue you're experiencing.
> > > > > > >
> > > > > > > Best Regards
> > > > > > > Richard Zhu
> > > > > >
> > > > > > Hi Richard,
> > > > > >
> > > > > > Sorry for taking long to respond, I was caught up with something.
> > > > > > I tested the patch and it solved the issue. I sent a Tested-by tag there.
> > > > > > Thanks for looking into this!
> > > > > >
> > > > > > Best Regards
> > > > > > Leonardo
> > > > >
> > > > > Hi Richard,
> > > > >
> > > > > That patch might have introduced/exposed a second regression where
> > > > > PCI devices are not linked properly during the initialization. Sorry
> > > > > for not catching this before, as I didn't have any device connected during
> > > the previous test.
> > > > Hi Leonardo:
> > > > Sorry to hear about that.
> > > > I did test commit 7678e81498e2 with one Intel NIC (82574L) connected,
> > > > and I've double-checked today based on v7.2-rc7. The PCIe link can be
> > > > set up properly on the i.MX6Q Sabresd board in my testing.
> > > >
> > > > Here are the logs:
> > > > root@imx6qpdlsolox:~# lspci
> > > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > > 01:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network
> > > > Connection root@imx6qpdlsolox:~# uname -a Linux imx6qpdlsolox
> > > > 7.2.0-rc7 #30 SMP Tue Aug 11 00:21:26 UTC 2026 armv7l GNU/Linux
> > > > root@imx6qpdlsolox:~# dmesg | grep pci
> > > > [    0.256138] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
> > > > [    0.256307] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff ->
> > > 0x0000000000
> > > > [    0.256339] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -
> > > > 0x0001000000
> > > > [    0.256434] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu
> > > 0x01f00000
> > > > [    0.458388] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K,
> > > limit 4G
> > > > [    0.458492] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
> > > > [    0.555294] imx6q-pcie 1ffc000.pcie: PCIe Gen.1 x1 link up
> > > > [    0.555783] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
> > > > ...
> > > >
> > > > The following endpoint devices also yielded the same results.
> > > > root@imx6qpdlsolox:~# lspci
> > > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > > 01:00.0 Network controller: Qualcomm Atheros AR9287 Wireless Network
> > > > Adapter (PCI-Express) (rev 01) root@imx6qpdlsolox:~# uname -a Linux
> > > > imx6qpdlsolox 7.2.0-rc7 #30 SMP Tue Aug 11 00:21:26 UTC 2026 armv7l
> > > > GNU/Linux ...
> > > >
> > > > root@imx6qpdlsolox:~# lspci
> > > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > > 01:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host
> > > > Controller (rev 04) root@imx6qpdlsolox:~# uname -a Linux imx6qpdlsolox
> > > > 7.2.0-rc7 #30 SMP Tue Aug 11 00:21:26 UTC 2026 armv7l GNU/Linux
> > > >
> > > > Could you provide more details of your hardware setup (board,
> > > > connected devices, PERST# present or not)?
> > > > This may help us identify if there's a specific scenario that triggers
> > > > the regression you're experiencing.
> > >
> > > It's an apalis imx6, as reported already in this email thread.
> > > The DT is in Linux, you can check
> > > arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts every details about
> > > PERST# and more.
> > >
> > > This is the device connected:
> > >
> > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > 01:00.0 SATA controller: ASMedia Technology Inc. ASM1061/ASM1062 Serial
> > > ATA Controller (rev 02)
> > >
> > > 01:00.0 SATA controller: ASMedia Technology Inc. ASM1061/ASM1062 Serial
> > > ATA Controller (rev 02) (prog-if 01 [AHCI 1.0])
> > >       Subsystem: ASMedia Technology Inc. ASM1061/ASM1062 Serial ATA
> > > Controller
> > >       Flags: bus master, fast devsel, latency 0, IRQ 308
> > >       I/O ports at 1020 [size=8]
> > >       I/O ports at 1030 [size=4]
> > >       I/O ports at 1028 [size=8]
> > >       I/O ports at 1034 [size=4]
> > >       I/O ports at 1000 [size=32]
> > >       Memory at 01100000 (32-bit, non-prefetchable) [size=512]
> > >       Expansion ROM at 01200000 [virtual] [disabled] [size=64K]
> > >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit-
> > >       Capabilities: [78] Power Management version 3
> > >       Capabilities: [80] Express Legacy Endpoint, IntMsgNum 0
> > >       Capabilities: [100] Virtual Channel
> > >       Kernel driver in use: ahci
> > >       Kernel modules: ahci
> > >
> 
> I just did one additional test, trying to help out Leonardo.
> 
> Unfortunately I do not have the same PCIe card available, so I tested with a
> 
> 01:00.0 Network controller: Intel Corporation Wireless 7260 (rev 73)
> 	Subsystem: Intel Corporation Dual Band Wireless-AC 7260 [Wilkins Peak 2]
> 	Flags: fast devsel
> 	Memory at 01100000 (64-bit, non-prefetchable) [disabled] [size=8K]
> 	Capabilities: [c8] Power Management version 3
> 	Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
> 	Capabilities: [40] Express Endpoint, IntMsgNum 0
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [140] Device Serial Number ac-7b-a1-ff-ff-4e-a1-d8
> 	Capabilities: [14c] Latency Tolerance Reporting
> 	Capabilities: [154] Vendor Specific Information: ID=cafe Rev=1 Len=014 <?>
> 
> no wi-fi driver is loaded (but this seems unrelevant for the issue here), but
> the card is detected with the current mainline Linux 7.2.0-rc7+. I tested the
> apalis SoM on both the eval carrier board and on ixora v1.2.
> 
> Same kernel config as the one failing.
> 
> So, unless I did some mistake in my manual test, the issue is related to the specific
> PCIe card or some other subtle difference I cannot see yet.
> 
> For the record, the failure was detected by our CI/CD, and it is systematically
> reproduced on multiple hardware boards.
> 
> Leonardo: any chance you can test with the same PCIe board that is failing?

Hi all,

I reproduced the issue on my setup (eval board + same PCIe card as in our CI/CD).

root@apalis-imx6-11486042:~# lspci
root@apalis-imx6-11486042:~# dmesg | grep pcie
[    0.162860] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
[    0.162974] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
[    0.163043] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
[    0.163193] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
[    0.505056] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
[    0.505230] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
[    1.508173] imx6q-pcie 1ffc000.pcie: Link failed to come up. LTSSM: POLL_CONFIG
[    1.508314] imx6q-pcie 1ffc000.pcie: probe with driver imx6q-pcie failed with error -110

After applying the new sequence proposed by Zhu, the PCIe card comes up.

root@apalis-imx6-11486042:~# lspci
00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
01:00.0 SATA controller: ASMedia Technology Inc. ASM1061/ASM1062 Serial ATA Controller (rev 02)
root@apalis-imx6-11486042:~# dmesg | grep pcie
[    0.162515] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
[    0.162636] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
[    0.162702] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
[    0.162828] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
[    0.488893] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
[    0.489033] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
[    0.591333] imx6q-pcie 1ffc000.pcie: PCIe Gen.1 x1 link up
[    0.591967] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
[    0.602947] pcieport 0000:00:00.0: PME: Signaling with IRQ 291
[    0.603534] pcieport 0000:00:00.0: AER: enabled with IRQ 291

I'm completely out of the loop on this whole issue and I only helped out
to test the patch. However, I wanted to add that before applying Zhu's 
proposed sequence, I could only reproduce the issue by power cycling the
module, as rebooting alone did not trigger the issue.

kind regards

Franz
