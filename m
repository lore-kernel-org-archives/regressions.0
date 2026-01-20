Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D1272E7C
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937881; cv=none; b=lh+CHYcpm0K1psW67OmObKVkc/pgRKo+oCb5QJ08EGX4s5hAitZm4G5EnyTY6g0JyxOPd74qy0gSa0VsM8smF+DmPvgJtBqAFz+oPLa0bteHRXc3H9qL8mG6QoMznxb3CnI5pnXhPHa1U1w6HvL6XWyW2mOuwvJRMB76UMUB3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937881; c=relaxed/simple;
	bh=aLYewYaidV95JSBfkMgzIpwgMWf1mMuoxBwdhsvxb2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4/wZXykX1B9Cf4iPlm5hp8+MEJXVqmu1BhDIJKa2q9zYNsV2x+g/qEb+wD0PM0lUBUion6EkQKKwz5ThoIKWhp2QvgNpMvcyi0HaOePufpJUdtV5Or7F5pUlXBBxhprM08GWMWql4vCAlJmdsws9bX5VNhIpf5OieO49gtBsgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLyvB+9X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLyvB+9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768937880; x=1800473880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aLYewYaidV95JSBfkMgzIpwgMWf1mMuoxBwdhsvxb2g=;
  b=cLyvB+9XWSEZM8OllRziI4Ffdl6hBvuazZkKV/hd8JhAgzYxfmRSFbTx
   R/vTgY1GX2/TawxdMr2X140bhwUCmmH1+uWefxVPYK6CeD49MXxVhg9wT
   T4+uUu+hSh+elRgIszK2ez+DVHMypbr5m8MF/x/7WEYMuWzTF7xozpH1V
   Pmbdz95KwYdCCUrCmNqLxoE7bgChVWNhRldDyBycj5tQiM4LOroXuOGYy
   UV7p1kbVQUfpUwIHGkv1zoEu9XBS8omQNMMbhki9Svq4Nz23p0Je3/52d
   kE0aZoyUpYhCEPbPBo09XlrGmC2ignSvqjpqghcfmsqaTc4n7w2HfOM1m
   Q==;
X-CSE-ConnectionGUID: zrNbqK0RR3mgRJlsud5lhA==
X-CSE-MsgGUID: HGYggrChRNS0R+Ic7X9lOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70323651"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70323651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 11:38:00 -0800
X-CSE-ConnectionGUID: cQamuSVDSKmyrHbjuRvDPg==
X-CSE-MsgGUID: M3Zt97TzQMK9R7gTkA3DeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="210666001"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2026 11:37:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DFA4595; Tue, 20 Jan 2026 20:37:55 +0100 (CET)
Date: Tue, 20 Jan 2026 20:37:55 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Vijay <vijayg0127@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	jikos@kernel.org
Subject: Re: Regression: SYNA3602 I2C touchpad broken in Linux 6.17.7 (works
 in 6.17.6 and previous versions)
Message-ID: <aW_Zk7v63HPJl01C@black.igk.intel.com>
References: <CAMBhvbYA=onQkkcgkODaTj=+tkybwo28Cdi6P3vodGpVZi8OVA@mail.gmail.com>
 <CAO-hwJJRisVpZWeSA+3_fLaa8_52f7ypUocDcD+PojuF3KjHYw@mail.gmail.com>
 <08000f1a-2c1e-4a0d-a5b5-fc7dcea3d8a8@leemhuis.info>
 <CAMBhvbZHcOwd-i04TGMXdbvi1vmpnyPD1p7SgkUtjfFsc+9nWQ@mail.gmail.com>
 <2c8d4baa-679f-4af7-a78d-41774410e9a6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c8d4baa-679f-4af7-a78d-41774410e9a6@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 08, 2025 at 02:54:20PM +0100, Thorsten Leemhuis wrote:
> On 12/8/25 13:13, Vijay wrote:
> > 
> > Yes, the touchpad is not working in 6.18 also, getting the same errors
> > as mentioned previously, 
> 
> That's really good to know, thx!
> 
> Thing is: I fear that nobody will look into this, unless you or somebody
> else affected checks which change broke things. Benjamin mentioned three
> you could try reverting in 6.17.y; alternatively, perform a bisection in
> 6.17.y. For details, see:
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

Might be related:
https://bugzilla.kernel.org/show_bug.cgi?id=219799

> > On Thu, 4 Dec 2025 at 20:40, Thorsten Leemhuis
> > <regressions@leemhuis.info <mailto:regressions@leemhuis.info>> wrote:
> > 
> >     Lo!
> > 
> >     @AM Vijay: 6.17.y will be EOL in about ten days, so this is unlikely to
> >     get fixed there. The big question is:
> > 
> >     Is 6.18 affected?
> > 
> >     If it is, we need your help identifying want went wrong; if not, then
> >     it's likely not worth looking closer into this
> > 
> >     Ciao, Thorsten
> > 
> >     On 11/28/25 09:05, Benjamin Tissoires wrote:
> >     > Hi,
> >     >
> >     > On Fri, Nov 28, 2025 at 7:40 AM Vijay <vijayg0127@gmail.com
> >     <mailto:vijayg0127@gmail.com>> wrote:
> >     >>
> >     >> Hello,
> >     >>
> >     >> I would like to report a regression in the Linux kernel affecting
> >     I2C-HID
> >     >> touchpads that run through the Intel ISH + DesignWare I2C controller.
> >     >>
> >     >> Hardware:
> >     >> - Laptop: Infinix Y4 Max
> >     >> - CPU: Intel (13th gen core i5)
> >     >> - Touchpad: SYNA3602:00 093A:35ED (I2C HID)
> >     >> - Bus path: SYNA3602 → i2c_designware → Intel ISH → HID
> >     >> - OS: Linux (Arch/CachyOS)
> >     >> - Kernel config: Default distro config
> >     >>
> >     >> Regression summary:
> >     >> - Touchpad works perfectly in Linux 6.17.6 and below versions
> >     >> - Touchpad stops working in Linux 6.17.7 and all newer versions
> >     (6.17.8, 6.17.9, etc.)
> >     >> - Desktop environment does not matter (Hyprland/GNOME both fail)
> >     >> - The failure happens before userspace loads
> >     >> - Touchpad also works fine in Linux 6.12 LTS
> >     >>
> >     >> This is a kernel-level regression introduced between:
> >     >>     Good: Linux 6.17.6
> >     >>     Bad:  Linux 6.17.7
> >     >>
> >     >> **Dmesg logs from broken kernel (6.17.7 and newer):**
> >     >>
> >     >>     i2c-SYNA3602:00: can't add hid device: -110
> >     >>     hid_sensor_hub: reading report descriptor failed
> >     >>     intel-hid INTC1078:00: failed to enable HID power button
> >     >
> >     > Looks like i2c-hid can't even communicate with any I2C device, so this
> >     > is slightly worrying.
> >     >
> >     >>
> >     >> And the DesignWare I2C controller logs around the failure:
> >     >>     i2c_designware 0000:00:15.0: controller timed out
> >     >>     i2c_designware 0000:00:15.0: lost arbitration
> >     >>     i2c_designware 0000:00:15.0: transfer aborted (status = -110)
> >     >>
> >     >> These errors appear only on 6.17.7+ and not on 6.17.6.
> >     >>
> >     >> On working versions (6.17.6 and 6.12 LTS), the touchpad
> >     initializes normally:
> >     >>
> >     >>     input: SYNA3602:00 093A:35ED Touchpad as /devices/.../input/
> >     inputX
> >     >>     hid-multitouch: I2C HID v1.00 device initialized
> >     >>     i2c_designware 0000:00:15.0: controller operating normally
> >     >>
> >     >> This narrow regression window should make it possible to identify
> >     the offending
> >     >> change in either:
> >     >> - HID core
> >     >> - I2C-HID
> >     >> - Intel ISH HID
> >     >> - DesignWare I2C controller
> >     >> - ACPI timing changes
> >     >>
> >     >> I can provide:
> >     >> - Full dmesg (working and broken)
> >     >> - acpidump
> >     >
> >     > Are you running on a full vanilla kernel?
> >     >
> >     > The changelog between 6.17.6 and 6.17.7 is rather small, so it should
> >     > be easy enough to bisect and get the offending commit.
> >     >
> >     > I have my suspicions on:
> >     > f1971d5ba2ef ("genirq/manage: Add buslock back in to enable_irq()")
> >     > b990b4c6ea6b ("genirq/manage: Add buslock back in to
> >     __disable_irq_nosync()")
> >     > 3c97437239df ("genirq/chip: Add buslock back in to irq_set_handler()")
> >     >
> >     > Because anything else is unrelated to any component involved in
> >     i2c-hid.
> >     > (But that's also assuming you are running vanilla kernels without any
> >     > extra patches.)
> >     >
> >     > OTOH, I've booted a 6.17.8 and 6.17.7 shipped by Fedora and I don't
> >     > see any issues related to i2c-hid, so those 3 commits might not be the
> >     > culprits.

> >     >> Please let me know what additional data is needed.
> >     >
> >     > Can you do a bisect between v6.17.7 and v6.17.6?

-- 
With Best Regards,
Andy Shevchenko


