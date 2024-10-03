Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A768C07
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727963270; cv=none; b=Q5gdl4//y9md3/Eqqh4vjOkvd/zzwGrkI+8HOlaL2vipBelDpfrCLHEVJbyH4wV16Jd0QXMPZbHb/07DuJ+b3fNTagL78y5kKI9o8fHatyYXbmfnFqXD9FbW+swfzrR2Lu5roK18DT3KBmuMxORR//N0iKzahHG3NC5Z2+vtXRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727963270; c=relaxed/simple;
	bh=fHy/YcuLQEXGDCdgADRD7flqRemnkaQmpKv/WseNZzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp/qHwDm7WlwkEG/frzBMxwmzyk2B/tRfIEef6cBsulVOdjKeK0b2ggoFumQQDR2HXHXnyfBeGqBIulEekSYLmA+g5PmDGZtTit9YE03+ObFBCYIQ5Pf5xQLFSjs+ZW0G5TVEV1NDiOTboDjCH1TpTmZ6v7eX0V+vzywF9O+Gng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgkeIf53; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgkeIf53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727963268; x=1759499268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fHy/YcuLQEXGDCdgADRD7flqRemnkaQmpKv/WseNZzE=;
  b=dgkeIf53EdbXKW6Fs6o0+dn9Vy8VvHT5CBhiOwNto7qRAeYsLnXBLGlX
   J/kkpZ5aYLFL0K00N+gU2c+XnuEnsZ6hCvjK3X+tEbSSwKP+4mBnkUbHq
   a7foh/Nwtx0TMur145QrLL2MaKy8T+xEBeKJ8k3G5Q8osr1tyA8WVc+TT
   m+TB9Rk8XedStgA50ScW313+Q57ZGlwm6B/7b6GttLNcSTn6v5fCOoRfG
   i9HKHlm9lt+52HhDRPFoQWziPUL5MISdVACmvknrPoGHQ6pTBgZujXeKo
   /E1VqDzXavle1Jgr/+N8Cn0Yjeb9dkHzGWD5pyvax4sa9HWc1aQoGebUi
   g==;
X-CSE-ConnectionGUID: IRaLNwniQPy+ctPjGF6ggg==
X-CSE-MsgGUID: 8f10pfr9QZCP5lozBwdO9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27286759"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27286759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:47:48 -0700
X-CSE-ConnectionGUID: x1TBu/fZTTGACdPhxOdlyQ==
X-CSE-MsgGUID: MT6/jeB1QomADxkInXyVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="78356851"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2024 06:47:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 530093A3; Thu, 03 Oct 2024 16:47:43 +0300 (EEST)
Date: Thu, 3 Oct 2024 16:47:43 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, regressions@lists.linux.dev,
	Raju.Rangoju@amd.com, Sanath.S@amd.com,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003134743.GO275077@black.fi.intel.com>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>

On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
> On 10/3/2024 08:27, Mika Westerberg wrote:
> > On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
> > > On 10/3/2024 00:47, Mika Westerberg wrote:
> > > > Hi Harry,
> > > > 
> > > > On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
> > > > > I was checking out the 6.12 rc1 (through drm-next) kernel and found
> > > > > my system hung at boot. No meaningful message showed on the kernel
> > > > > boot screen.
> > > > > 
> > > > > A bisect revealed the culprit to be
> > > > > 
> > > > > commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
> > > > > Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Date:   Fri Aug 30 18:26:29 2024 +0300
> > > > > 
> > > > >       usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
> > > > > 
> > > > > A revert of this single patch "fixes" the issue and I can boot again.
> > > > > The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
> > > > > It's running Arch Linux but I doubt that's of consequence.
> > > > > 
> > > > > lspci output:
> > > > >       https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
> > > > > acpidump:
> > > > >       https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
> > > > > 
> > > > > Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
> > > > > Another suggestion to do usbcore.nousb lets me boot to the desktop
> > > > > on a kernel with the faulty patch, without USB functionality, obviously.
> > > > > 
> > > > > I'd be happy to try any patches, provide more data, or run experiments.
> > > > 
> > > > Do you boot with any device connected?
> > > > > Second thing that I noticed, though I'm not familiar with AMD hardware,
> > > > but from your lspci dump, I do not see the PCIe ports that are being
> > > > used to tunnel PCIe. Does this system have PCIe tunneling disabled
> > > > somehow?
> > > 
> > > On some OEM systems it's possible to lock down from BIOS to turn off PCIe
> > > tunneling, and I agree that looks like the most common cause.
> > > 
> > > This is what you would see on a system that has tunnels (I checked on my
> > > side w/ Z series laptop w/ Rembrandt and a dock connected):
> > > 
> > >             +-03.0
> > >             +-03.1-[03-32]--
> > >             +-04.0
> > >             +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
> > >             |                               \-04.0-[36-62]--
> > > 
> > > 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
> > > 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
> > > 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
> > > USB4/Thunderbolt PCIe tunnel [1022:14cd]
> > > 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
> > > 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
> > > 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
> > > USB4/Thunderbolt PCIe tunnel [1022:14cd]
> > 
> > Okay this is more like what I expected, although probably not the
> > reason here.
> > 
> > Are you able to replicate the issue if you disable PCIe tunneling from
> > the BIOS on your reference system? (Probably not but just in case).
> 
> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
> but the system still boots up just fine for me on 6.12-rc1.

Okay thanks for checking!

> > > > You don't see anything on the console? It's all blank or it just hangs
> > > > after some messages?
> > > 
> > > I guess it is getting stuck on fwnode_find_reference() because it never
> > > finds the given node?
> > 
> > Looking at the code, I don't see where it could get stuck. If for some
> > reason there is no such reference (there is based on the ACPI dump) then
> > it should not affect the boot. It only matters when power management is
> > involved.
> 
> Nothing jumps out to me either.  Maybe this is a situation that Harry can
> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
> enlighten what's going on (assuming the console output is "working" when
> this happened).

There are couple of places there that may cause it to crash, I think.
And the __free() magic is something I cannot wrap my head around :(

Anyways, Harry can you try the below patch and see if it makes any
difference? Also if it does please provide dmesg.

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 21585ed89ef8..90360f7ca905 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -157,6 +157,7 @@ EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
  */
 static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 {
+	struct fwnode_handle *nhi_fwnode;
 	const struct device_link *link;
 	struct usb_port *port_dev;
 	struct usb_hub *hub;
@@ -165,11 +166,12 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 		return 0;
 
 	hub = usb_hub_to_struct_hub(udev->parent);
-	port_dev = hub->ports[udev->portnum - 1];
+	if (WARN_ON(!hub))
+		return 0;
 
-	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
-		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
+	port_dev = hub->ports[udev->portnum - 1];
 
+	nhi_fwnode = fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
 	if (IS_ERR(nhi_fwnode))
 		return 0;
 
@@ -180,12 +182,14 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 	if (!link) {
 		dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
 			dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
+		fwnode_handle_put(nhi_fwnode);
 		return -EINVAL;
 	}
 
-	dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
-		dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
+	dev_info(&port_dev->dev, "Created device link from %s to %s\n",
+		 dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
 
+	fwnode_handle_put(nhi_fwnode);
 	return 0;
 }
 

