Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB15311C3B
	for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526573; cv=none; b=Dl7RBbzyDFc5+w8njQ/dlriQs3hbZpVEV9+UzKcpvcevpqs+972omYjRA2aIt54owzwZ+gSArSWwNfZaTLSkRJPHb8akTzlHUBGfUF0OHcM0ld1adWJPOG1vcdaYm3OhWUno2b2yftZ/YHMy0E0l0pzc+ZTAJRwKwbA2yk/dY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526573; c=relaxed/simple;
	bh=l6MXp60odRBYxNQsyCcgzadItXrr5jiugzsoSFXfN/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux0tMAetos8+KOGaY0X7r8yBADqlual0F9V4VuY2u/RVFqeetM4OTpTGeFcgAnwYF3ds+qCFZ9u6SiXEASc3dxhnQzngrE5fVLq0elnKA2tWdBcUwcv8ulHn7fJpvm9XwYsxm0BAsQWlVTCBLol6bbCISg9z3m0JVgh5m0hPEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8FGOuhE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8FGOuhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769526572; x=1801062572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=l6MXp60odRBYxNQsyCcgzadItXrr5jiugzsoSFXfN/4=;
  b=Z8FGOuhEuhe54KcoxF3AJciSR4PWsfTDjYSDXsE+k17BVzsU24WigLoQ
   WYHxwY/EsYwOgJvcQbOzggEt8MO0arEGzmu2R6TGQzD+oWTjVXCUTgEKg
   jrkYTF0wurELAEKJ5OhImVJ4Axh7FdoItHzhiM4d1z2ot25BX0J+wq94L
   Dukj6mJLLYhTRoIYNAZlYscnlfY5SWl4NLoX5VniWWi5ehaCT2xTOq3HO
   MfT28IOKH/c7gVcRuxcAlzKChG/NHkwdn8TtCsNvMYzG/BMLoVlYaNlq7
   k09P2GJkN8NuX7EqpfvFh7ZV55MprGNJoy0yyGadcLX3npiG1U2HFle9I
   A==;
X-CSE-ConnectionGUID: kLdz2mPgRFO4jIq0NTajhQ==
X-CSE-MsgGUID: P6CPLO1ASveAE078KjdJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96189316"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="96189316"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:09:23 -0800
X-CSE-ConnectionGUID: Clr8MPhzQXa4KHaExIpsLg==
X-CSE-MsgGUID: I/tFTgRpQJuAxW+dJaJraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207240877"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:09:21 -0800
Date: Tue, 27 Jan 2026 17:09:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: correctmost <cmlists@sent.com>, dmaengine@vger.kernel.org,
	regressions@lists.linux.dev, vkoul@kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aXjVHocwkflAnKw2@smile.fi.intel.com>
References: <a6474592-87db-4fdc-958c-8b09d324df1e@app.fastmail.com>
 <20260123063621.GP2275908@black.igk.intel.com>
 <5c5645eb-66b8-4419-a4e9-ba2672af2f40@app.fastmail.com>
 <20260126135353.GT2275908@black.igk.intel.com>
 <57727c07-33d5-4b52-abe2-4fdc2a7488b6@app.fastmail.com>
 <20260127084201.GA2275908@black.igk.intel.com>
 <b285137a-06bc-43c2-ab24-b3bacf8592ec@app.fastmail.com>
 <20260127101912.GJ2275908@black.igk.intel.com>
 <3d78d3cf-bebd-4bdb-8dca-3024dd769f76@app.fastmail.com>
 <20260127144357.GL2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127144357.GL2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 27, 2026 at 03:43:57PM +0100, Mika Westerberg wrote:
> On Tue, Jan 27, 2026 at 05:56:37AM -0500, correctmost wrote:

...

> > > Okay can you set CONFIG_INTEL_IDMA64=n in .config? That should prevent it
> > > from loading. Keep the rest as it was.
> > 
> > That change makes the IRQ message go away and the touchpad seems to work
> > fine in my desktop environment (log attached).
> > 
> > These are the config changes that I tested with:
> > - CONFIG_I2C_DESIGNWARE_CORE=m
> > - CONFIG_I2C_DESIGNWARE_PLATFORM=m
> > - CONFIG_INTEL_IDMA64=n
> 
> Okay thanks it looks good to me too.
> 
> I tried to go through the datasheets again but could not figure why the
> LPSS I2C IP would keep the interrupt asserted.

We can try to dig something internally, but it's another story.

> However, I think we can
> hack^Hwork this around by simply not creating the IDMA64 device at all for
> I2C. This should be fine to do because I2C is really not using DMA in the
> first place so this is kind of just wasting "memory". So something like
> below.
> 
> Please re-enable CONFIG_INTEL_IDMA64=m and the rest and try if this makes
> it work without the irq splat. And if it does please try with the
> "original" arch setup and see if that works too (keeping the patch applied
> of course).
> 
> Andy, what's your thoughts on this?

Fun fact, that I was thinking about the similar approach as in "don't enumerate
DMA for I²C LPSS controllers" a few hours ago (and for the record, sometime ago
but I don't remember why that time).

So I'm fine, but we need to put also a big comment with the reference to this
discussion or so.

...

Btw, do we have an i2c alert interrupt here? Might be it's somehow related?

-- 
With Best Regards,
Andy Shevchenko


