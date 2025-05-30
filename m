Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADCD221DBA
	for <regressions@lists.linux.dev>; Fri, 30 May 2025 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598543; cv=none; b=C65UrcH71y1+1zP7RYDe3I4aAJXFPhYCAYUUlv9kc9yTecuASuTJG1BL0H8VBF6OOZ0QLLeT0k3fQ2iQ2Yse9Op/gOsiqRnGCp+iggmiVJqNxSsKtx05f79b5auINukQ789iu/d1NjTeDauceSrCjF5Vg1xHn3wMZ7HSYRpd4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598543; c=relaxed/simple;
	bh=b0TFhFz66sFrGEwBpP8D9ETS2sHd7pzb9TO/YyI/+/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBZ70pQFGrrtdW0ADJhG0cF0EvZFYy7xxg2ipdWq7EbgDaTjRG571jWDIft6AFAYfFJh5MciBQEVphKWpUDEqCaWFBCm6E5B9Qkc8XAbTqHyzqEilBWRWYUOUmH8gW40xGRGY92UxcRhCsCm+f4FjO4MHVg+UANAj9H1jwrm+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTaiqPDg; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTaiqPDg"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e45dae6c8cso1263888137.2
        for <regressions@lists.linux.dev>; Fri, 30 May 2025 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748598540; x=1749203340; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BX16TfDwmJeuNsVzAioGXDE8NBNHgG/KwWmvHJtVfv4=;
        b=DTaiqPDgGVUyFw0pQusI60IBmW6nLssqdt3IQuwX18iYqqhwSuDaw7YthAJY8UdhbA
         gRMCldpmvynLf/RX+yI6IbzZTyKJusEYyOV078/SRuC4TgAo+LTdCd/QIGLsYWoYMdXQ
         y8KDBjEE2QB2GvB9wg3uW25t2DvZS53CYumcF4cj2yvu0YOSlWwsQ63e7g0vRHTHp71Z
         4wu5paadeX/oe34K7JzSKf+YYvVpQPV1/GBvqFl0lIpDVd5vB1P21gCM+piFU+FnJHdq
         uecsQs1jisSDpEmrPQDsuMNcLNEYHkaKe2hdVKG7weT06LbCNZBo45ZS4wPeynPXg1Nm
         4ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598540; x=1749203340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX16TfDwmJeuNsVzAioGXDE8NBNHgG/KwWmvHJtVfv4=;
        b=H2rPDHRjmXpyYnipKhGz5jfh3q7GnCY5/FziONYEdsEZx0gzgRX9XgCLeZ7KeYwYfJ
         Td6nIc8k9kA8K/9Ql6YbdG+OUd+kMumHE10XF+TOIMZO/NGF9Q14UysjyCp2D9v+Q53U
         HkwRaXfnUeUPyKJyu3mBiVL0RNk2plfnlugFerItEDD4I+N4Q06AGTxcymh4tJNEPAvW
         4LgzeFL1owWLlDbbRLycWzuMa/StcONeg/xaVMDGxjV0Pk1iXZ1x4zSPBN6P5VW3ebQO
         7SxvB4yEnyPvDg8AgyoJplK44hbrHOik0m320p0E6/C/C/ObqXNLlI3SS9DJmMetGiGF
         EM7A==
X-Forwarded-Encrypted: i=1; AJvYcCWF/smV8x6ThYC6N8vLSk0tna0i/dKcUpSouYLjhyOU9glXP8dNeSA+2vdV7l/O5+izGBO+O/bPeHoUSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyN95l4FDYdHjbtQS5gIZYAG4EK14355TuVLA1CO6FYyYXsrlq
	G/Xx2ZLQnnbkEaNYYmRs9tT4JynDcENWOhNZbyTCdtF3PpCZAr/s85pXj5YY7bkLeuiP0ppwvrM
	Ab+10z9SPSz1Cvhwutd+cTGjtm/GcyvxnZUPacJOIqg==
X-Gm-Gg: ASbGnctMOh8Gg59+bXtCd/UrKXE/JNXOzTeOEzsWeldzvDTqRmhRO7OAw6bOituyUUZ
	XxGFw5qzP60/ixmSuicgT4rm3BDOQtVktM6m/BAL6+6U40x3ZTi/hYzYtymgIDdOEsHdXZYTulN
	dXPcFXrz/G+EgKAICFAd+Lq1gio4S4W+9AVEsEUnMY6HYi
X-Google-Smtp-Source: AGHT+IFCDzCsC18lIEI9eoPRpN1VBwQuWtrYeQzK5FfBQTEKVxOjXzBK+FhiElxrVAbMsJjHyUqfWwTNH+a+X8F2fyY=
X-Received: by 2002:a05:6102:4b08:b0:4e5:8eb6:e8dd with SMTP id
 ada2fe7eead31-4e6e40d655dmr2670174137.5.1748598540530; Fri, 30 May 2025
 02:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
 <6e0ef5cc-b692-4d39-bec4-a75c1af3f0aa@arm.com> <CA+G9fYs_nUN2x8fFJ0cfudHWbCOLSJK=OhEK0Efd1ifcjq_LRg@mail.gmail.com>
 <5a277d1d-c7b1-430c-a463-1e307a2823f6@arm.com> <03e6283e-2ef7-498c-9460-8411114711e2@arm.com>
 <e6db6396-cb1e-4e24-8fd0-3cce388a3913@arm.com>
In-Reply-To: <e6db6396-cb1e-4e24-8fd0-3cce388a3913@arm.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 30 May 2025 15:18:49 +0530
X-Gm-Features: AX0GCFuc1bDuO-IvLHLzjp596VNTvH9_C6fgPX5wyzKbvtGEon1kLQjQtXhQSq4
Message-ID: <CA+G9fYuroDkk3qrd7yJJG7twZV0sM=t3mDjhrBMm==q2MjS41A@mail.gmail.com>
Subject: Re: arm64: juno-r2: SSD detect failed on mainline and next
To: Robin Murphy <robin.murphy@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Fri, 25 Apr 2025 at 20:48, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 11/04/2025 8:11 pm, Robin Murphy wrote:
> [...]
> > OK, I found it, but I'm still not sure what exactly to make of it - it's
> > the pci_request_acs() in of_iommu_configure(), now being called early
> > enough to actually have an effect. Booting with EDK2 already using PCI
> > prior to Linux, here's what I get for `sudo lspci -vv | grep ACSctl`


Linux version 6.14.9-rc1
# lscpi
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
03:00.0 Mass storage controller: Silicon Image, Inc. SiI 3132 Serial
ATA Raid II Controller (rev 01)
08:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8057
PCI-E Gigabit Ethernet Controller


Linux version 6.15.0
# lscpi
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)

> > with 6.15-rc1:
> >
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >
> > whereas with the 6.14 behaviour they are all '-'. I don't have a working
> > root filesystem with the U-Boot setup, but if I boot it with
> > "pci=config_acs=000000@pci:0:0" then the kernel does assign the bridge
> > windows and discover the ethernet/SATA endpoints again. I can spend some
> > time getting NFS working next week, but if you're able to get lspci
> > output off a machine in the "broken" state easily that would be handy to
> > compare.


On the 6.15, After adding this into Kernel boot args
pci=config_acs=000000@pci:0:0

The SSD was detected and mounted successfully.

Linux version 6.15.0 +  pci=config_acs=000000@pci:0:0
# lspci
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
03:00.0 Mass storage controller: Silicon Image, Inc. SiI 3132 Serial
ATA Raid II Controller (rev 01)
08:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8057
PCI-E Gigabit Ethernet Controller

> >
> > So at this point it would seem to be something about how Linux
> > configures ACS when doing it from scratch. What I don't really know is
> > where to go from there. I do know Juno's possibly a bit odd in that the
> > switch supports ACS, but both the root port and endpoints either side of
> > it don't. Could this be tickling some subtle bug in the PCI layer, and
> > what is EDK2 doing that makes it not happen?
>
> Just following up on where I ran out of ideas. I poked at things a
> little more, and from a process of elimination, the culprit appears to
> be is that we enable ACS source validation on the downstream port while
> its secondary bus is still 0, *then* we get to the "bridge configuration
> invalid" bit and reconfigure the bus numbers, but after that, config
> space accesses to the secondary bus still apparently fail to work as
> expected.
>
> What's now beyond me is whether this is just an ACS quirk of this
> particular switch, and/or whether there's something we could or should
> be doing in the PCI layer.
>
> All I can suggest a this point is that you could at least sidestep the
> problem on the LKFT boards by updating them to a less-ancient version of
> U-Boot which supports PCIe for Juno (looks like that landed in 2020.10),
> which should then configure the switch at boot such that the bus
> numbering doesn't need to change when Linux probes it - that appears to
> be the only "magic" thing that EDK2 is doing.

I will work with my team to address these issues.
Thanks for your suggestions.

>
> Thanks,
> Robin.

- Naresh
