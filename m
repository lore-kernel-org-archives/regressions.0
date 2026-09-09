Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F8853FD59
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953035; cv=none; b=kkrX6SW9IS4TDwm1ni+SBRUlaoLBk2Ywb5O9clxwgUG0vQMNpEAZA41ejP2gxlCv9bmjtssQPXr9oaHRueIqwcc9XjzLON5forEImAt4hJo9Kig39iUAV9YuJVR8qrfbpU+tJW1lEppZPZQv2LlnJNsryj1MXSkMqJzpFXL38BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953035; c=relaxed/simple;
	bh=i5oc8G+FPJUXrDJ9GzNQWBwY5F3Q8cqZHnD+c8ruQgw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSWkotYn8IDUX2D/Rl+iggJjp26VGJqUKmP+md5KzuyijfyriXrX5KxjOCsO4AMyU12zq48shQb1z4WvJDtFk57X8RdMPbST6S2XptvHmG8UnZJQ8tS6wAN0A+Jrp2Zn4fzhPMBPOlntCPC4r6f/HfCpuz26zn3dTj8yYM8KvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aePvz5cR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aePvz5cR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso54525225e9.1
        for <regressions@lists.linux.dev>; Wed, 09 Sep 2026 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788953031; x=1789557831; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ec2Fsn3mNWnCkR7kAoCbAQzF9VNKLUvPjpImLB8zqX8=;
        b=aePvz5cRswe8ZmZqwZAQTpeZgGcuP5PMcK9XkMOgh2Hm6p1NW0mwfYzK4tJRm9R6z0
         r2ZSKszG8z2DwgqmfXfl57aFbXPvuKBaLm+g3uFbcpKFZ1lLR53WYVv+oaKoO5YfwSoc
         qeoNmWzv8bMhYmdpyXRM75eHk6Te6IAWh2pzNVAvgp5tRfOSmRNpMOiYzXra0bJJYDye
         LsbUyzMbaIvSlfz7Y2PPvx8nb5r5bq0/j4Efhpt//Hv5Ws7W3HbRx+MUQ39yAO/etMMU
         n6Ia/+5WqKxnh0hNxoydwS30FhEOSzdNtHep/d0+WoUQnkzGSnl4vlwrpQODMICy/uHu
         kiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953031; x=1789557831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ec2Fsn3mNWnCkR7kAoCbAQzF9VNKLUvPjpImLB8zqX8=;
        b=i1iOQUOxctwB58DsFNF3XcReYuAKqZ2Y5hjkwOIKGMNbHoBJEBT+DM7ifvu0N6MpMm
         udZggCgIcCkwOTHp0sP/oUY1ImiHu43WZ+jk+hvblOPsNUadLp3imB6v34AsfpRdeRWZ
         BcvN+3j28Vacew2JaKc/ypK4MrA/73xHYmmMlt/7yCJ9ZJzfuiiNlMQoyPPurkYAjwtY
         NlN1wSIG4pSBFe7TEz2Gzvfx8X0VyhSyGsPXYX8/8jawLoWozfXK8AtVK28IV8ebPUEr
         jrj8Qr6tn35+J1WS2/HqpM6Wt2JG3SgDDLgubMpvsx3KbHH22Yi82DHi89VOaoZNm9ys
         UeoA==
X-Forwarded-Encrypted: i=1; AKwUvBwkOUEMxFftr5G9P3Hfo5sOmhEZgo/Ajxx1V/XvglK5IEcm4hvZcrD1raL7801IAJUjg7wvgPt7eVHROw==@lists.linux.dev
X-Gm-Message-State: AFuF++mLboBMgDTh/nloMGoo8xMZ/aIeaquUUjK54JOJLMoWKNmj8xBF
	k22vJ5XrYpkS1xr6FRqqgjF4HNbqoQspzZfeMHPUX8ZNSrfPDL6LztMOem5Km08OPa8=
X-Gm-Gg: AYBFou1EqjPjT4e/te5Amuuw/B4dj4GakQ7PUxJcNpdeW2J1n9rxpK6GDYbcnBBPAYl
	VYcJRGARNHfn9l86cp/ADin2zrycCdeTM+nVmLS/FfeRbpStXSUZSNHxT7PWejLwCudGn35jqu6
	82LsvZdClwSLWzb6Tp4FLA2T+a8Ordwwp2NYhfXrSv+nsY0jul8NJKnSkKYP+ySQS85uMBJZZgO
	woKq9g+rLCKpJ/aqsgP4JM37jJYs602Fe+uyC3rMa9+6eNX059tD6Mv7ljxCSjAOnpCTUly75yu
	x7Gvn6H0jxG02j36J0z+F28yM1eN1dI7LnvYXI2KwqNog8iY5dCQVyUHyYDanyyROddGM+iLPEU
	4PKkf4cYdq8K11+YGil/DkP3NuWSGvQBhAW3ai5ymGE96WoXMuMw7RIUjdhAAunxCeFwCwWkZH1
	tuODf5x/SmgcwQpr8JC+eH9Xnz7FakA8VJr3Wsf71fVXelNFYIFpfJwiUo7s3uCh1GMRcz7go6e
	/h6wsY=
X-Received: by 2002:a05:600c:474c:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49cf8227619mr315909275e9.5.1788953031373;
        Wed, 09 Sep 2026 04:23:51 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d08144037sm381473505e9.7.2026.09.09.04.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:23:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 9 Sep 2026 13:27:30 +0200
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Angel J <iamanaws@httpd.dev>,
	Lizhi Hou <lizhi.hou@amd.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	"florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>
Subject: Re: [REGRESSION] PCI: Dynamic OF node creation hangs on invalid
 bridge configuration
Message-ID: <aqFCouobgTYOBbEe@apocalypse>
References: <GXe6anuewkS4bLNwca3cYOmUxN9csc0TxLYGSBc1qNRmfrmvFlcmD62wEM23TxfzfuXAv4P3yvUv7pyraleARrL1Na-aN8w-t9uc1Igu8DA=@httpd.dev>
 <20260903231744.GA2281658@bhelgaas>
 <20260904105743.1c396a8b@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904105743.1c396a8b@bootlin.com>

Hi,

On 10:57 Fri 04 Sep     , Herve Codina wrote:
> Hi Angel, Bjorn,
> 
> On Thu, 3 Sep 2026 18:17:44 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > [+to Herve, Lizhi for PCI dynamic OF node stuff]
> > 
> > On Sun, Aug 23, 2026 at 02:14:25AM +0000, Angel J wrote:
> > > Hello,
> > > 
> > > This regression was introduced in v6.17-rc1 and remains in the dynamic
> > > PCI OF node code. Linux 6.18 fails very early during boot on my Dell XPS
> > > 8940 when CONFIG_PCI_DYNAMIC_OF_NODES=y. The display goes black before
> > > any useful console or pstore output appears, and the machine remains
> > > hung.  
> > 
> > Oof, sorry, that's a terrible failure to debug.  Thanks for your
> > persistence in chasing it.
> > 
> > I don't think 49d63971f963 ("misc: rp1: RaspberryPi RP1 misc driver")
> > is a likely culprit by itself because there's just nothing there that
> > looks like it would relate to a Dell XPS 8940.
> > 
> > > Disabling CONFIG_PCI_DYNAMIC_OF_NODES makes the same kernel boot normally.
> > > Linux v6.19-rc5 also boots because the RP1 driver stopped selecting that
> > > option, not because the dynamic PCI OF node code changed.
> > > 
> > > Hardware:
> > > 
> > >   System: Dell XPS 8940, board 0K3CM7, BIOS 2.27.1 (2025-04-03)
> > >   CPU: Intel Core i7-11700 (Rocket Lake)
> > >   Triggering device: 0000:00:00.0, Intel 8086:4c43
> > >   Firmware boot: UEFI, ACPI-based x86_64
> > > 
> > > Test results:
> > > 
> > >   Linux 6.12.103: good
> > >   Linux v6.17-rc1: bad
> > >   Linux 6.18.44, CONFIG_PCI_DYNAMIC_OF_NODES=y: bad
> > >   Linux 6.18.44, CONFIG_PCI_DYNAMIC_OF_NODES=n: good
> > >   Linux 6.18.44, CONFIG_PCI_DYNAMIC_OF_NODES=y, skip invalid bridge: good
> > >   Linux v6.19-rc4: bad
> > >   Linux v6.19-rc5: good
> > >   Linux 4621c338d33f: bad
> > >   Linux e55feea3a03a: good
> > > 
> > > The first-parent boundary between the last two tests is:
> > > 
> > >   e55feea3a03a ("Merge tag 'soc-fixes-6.19' ...")
> > > 
> > > That merge contains ce26f588c831 ("misc: rp1: drop overlay support"), which
> > > removes:
> > > 
> > >   select PCI_DYNAMIC_OF_NODES
> > > 
> > > from MISC_RP1. The generated configurations differed only by:
> > > 
> > >   -CONFIG_PCI_DYNAMIC_OF_NODES=y
> > >   +# CONFIG_PCI_DYNAMIC_OF_NODES is not set
> > > 
> > > CONFIG_MISC_RP1=m in both. The known-bad 4621c338d33f and Linux 6.18.44
> > > both boot after disabling PCI_DYNAMIC_OF_NODES (and MISC_RP1, whose Kconfig
> > > select otherwise forces it on).
> > > 
> > > There is no RP1 device in this machine, and its driver does not probe.
> > > MISC_RP1 affects this x86 system only because its Kconfig select enables
> > > PCI_DYNAMIC_OF_NODES globally.
> > > 
> > > I narrowed the hang to dynamic OF node creation for 0000:00:00.0
> > > (8086:4c43), the Intel Rocket Lake-S integrated memory controller. On
> > > this machine it reports PCI class 0604 and header type 1, but it is bound
> > > to icl_uncore and is not a usable forwarding bridge:
> > > 
> > >   Bus: primary=ff, secondary=ff, subordinate=ff
> > >   I/O and memory bridge windows: invalid/all ones
> > >   kernel: bridge configuration invalid ([bus ff-ff]), reconfiguring
> 
> Is this PCI logs reported with PCI_DYNAMIC_OF_NODES=y or PCI_DYNAMIC_OF_NODES=n
> or always whatever the PCI_DYNAMIC_OF_NODES Kconfig value ?
> 
> A PCI class 0604 is a PCI-to-PCI bridge.
> 
> Something in kernel code prevent the scan of this PCI-to-PCI bridge even if the
> kernel tries to reconfigure it. Indeed, the device is "Intel Rocket Lake-S
> integrated memory controller" and not a PCI-to-PCI bridge

Indeed, a Host-bridge should have 0600 class and Header 0 (or 80, if it's multi
function as it seems). Angel, could you please provide the following output:

lspci -nn
setpci -s 00:00.0 HEADER_TYPE

from a running (i.e. with CONFIG_PCI_DYNAMIC_OF_NODES=n) system? Just to make
sure we're talking about the correct device and that the hw is 'lying' to us...

Many thanks,
Andrea

> 
> The of_pci_make_dev_node() is called by the PCI core [1] to create OF node for
> bridges.
> 
> of_pci_make_dev_node() will set (device_type = "pci" in the created node).
> 
> But if the device it is not a bridge, this is obviously wrong (even if I don't
> understand why it hangs the system).
> 
> Maybe the test done at [1] should be improved to detect those wrong bridges.
> and skip the of_pci_make_dev_node() call when a wrong bridge is detected.
> 
> [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/pci/bus.c#L355
> 
> 
> Best regards,
> Hervé
