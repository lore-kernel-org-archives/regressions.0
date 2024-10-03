Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE319C55E
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727962052; cv=none; b=OO2o1VoikPlN4DovUcjsHbQmvjebuwTlD5pl5kj6nw7ix6NtN8EC3mOLRtVzSDQ2IRpVhNMoMPkOmg4ZpBZ/wSuTpHAzOstU5XHB1mqQNxMVym3nYiCpxEa9iuJWv1IU2FrwxEdh9RoL5l2RnZkyWxdfGbE8J15cWBnIZqthtqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727962052; c=relaxed/simple;
	bh=fO/v7yoHK0G4KfuGqKFqWb6J2OiSBHDF99CjyKvW9+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjEdhao9GNBluzSz25iU+GZC5upZ3kxmeZoGIaX6ZPt94Bf7i8ADpk61mBEFih1Z3mmrn2/S+exDwQG0N9FVo77XN4dKQ7EFq0AbWULnkIWSiRf6NBrYhedx94k7Q5WXk3e5wOq6FlWjVWHQ2Nb4qqqZQLxvIBSxJzrnDnAxLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU4eqQcR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU4eqQcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727962051; x=1759498051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fO/v7yoHK0G4KfuGqKFqWb6J2OiSBHDF99CjyKvW9+Y=;
  b=nU4eqQcRW+ON6ymGo5VezeA0/n7TdwdkJVZ1w7+etPwLgUpyletDhJfq
   AnVr0T+mTE9GMm39ugPOitmvmqpgjE2x2KqPxPzqUZlLrO95H9NoCJIGy
   cw8emIPksxqYRs+QGNyVO6+xGnB1i4de3zjDhj+rxPOoPoAmXQzIJj1ca
   JADb8jDaPAG1Z9ARcLWOtxq/zHzXv/peFORyI5oNAFoAMhEXms3SxQzvl
   RtD5OXoaHG+1E8ulu2iQiEkTPLQ9e/D9pb13aaIdOGWNWYG276Q06NpUo
   g57JTY/XVSkfIloY+r9jrywTKM6sl52MicDRxPRcvEEOzo8tCn9Je2uWr
   A==;
X-CSE-ConnectionGUID: R3YQIiNwSkGGmUEVNBUfaQ==
X-CSE-MsgGUID: MsvO2dJCQtS3LOWInHD+1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27031073"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27031073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:27:30 -0700
X-CSE-ConnectionGUID: j8Gmi4yxQMuBKUv7O5Rmbw==
X-CSE-MsgGUID: InEWK8ZSSAWA/xYa3JMflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79201222"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 06:27:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 66A553A3; Thu, 03 Oct 2024 16:27:26 +0300 (EEST)
Date: Thu, 3 Oct 2024 16:27:26 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, regressions@lists.linux.dev,
	Raju.Rangoju@amd.com, Sanath.S@amd.com,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003132726.GN275077@black.fi.intel.com>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>

On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
> On 10/3/2024 00:47, Mika Westerberg wrote:
> > Hi Harry,
> > 
> > On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
> > > I was checking out the 6.12 rc1 (through drm-next) kernel and found
> > > my system hung at boot. No meaningful message showed on the kernel
> > > boot screen.
> > > 
> > > A bisect revealed the culprit to be
> > > 
> > > commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
> > > Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > Date:   Fri Aug 30 18:26:29 2024 +0300
> > > 
> > >      usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
> > > 
> > > A revert of this single patch "fixes" the issue and I can boot again.
> > > The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
> > > It's running Arch Linux but I doubt that's of consequence.
> > > 
> > > lspci output:
> > >      https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
> > > acpidump:
> > >      https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
> > > 
> > > Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
> > > Another suggestion to do usbcore.nousb lets me boot to the desktop
> > > on a kernel with the faulty patch, without USB functionality, obviously.
> > > 
> > > I'd be happy to try any patches, provide more data, or run experiments.
> > 
> > Do you boot with any device connected?
> > > Second thing that I noticed, though I'm not familiar with AMD hardware,
> > but from your lspci dump, I do not see the PCIe ports that are being
> > used to tunnel PCIe. Does this system have PCIe tunneling disabled
> > somehow?
> 
> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
> tunneling, and I agree that looks like the most common cause.
> 
> This is what you would see on a system that has tunnels (I checked on my
> side w/ Z series laptop w/ Rembrandt and a dock connected):
> 
>            +-03.0
>            +-03.1-[03-32]--
>            +-04.0
>            +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>            |                               \-04.0-[36-62]--
> 
> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
> USB4/Thunderbolt PCIe tunnel [1022:14cd]
> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
> USB4/Thunderbolt PCIe tunnel [1022:14cd]

Okay this is more like what I expected, although probably not the
reason here.

Are you able to replicate the issue if you disable PCIe tunneling from
the BIOS on your reference system? (Probably not but just in case).

> > You don't see anything on the console? It's all blank or it just hangs
> > after some messages?
> 
> I guess it is getting stuck on fwnode_find_reference() because it never
> finds the given node?

Looking at the code, I don't see where it could get stuck. If for some
reason there is no such reference (there is based on the ACPI dump) then
it should not affect the boot. It only matters when power management is
involved.
