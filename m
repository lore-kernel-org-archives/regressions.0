Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4B42DFF8
	for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079628; cv=none; b=GwWEP/so/CNG6YiYqxSxEsreDqa/F2Trvu7sTBw+voFwXNqnd1hv2TwVjIz/+31x0IGrW84nm/Zrf3nOOXs6zBRVmwJbDNw2LddXPmo8vQPO6Cr2Ud+VKSZh2miTzL1LjIGH7lfKamDevrddIt8FXmiHzW7a8y5r6V85c3T/3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079628; c=relaxed/simple;
	bh=iJSzDSjOLouw8pRYuxyAYFFe9Y8DhZMRz12WUAc0D84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACrIDssPliNbU5JNzM+YJvFQcB+T7Eek/NLLnpuexX4FodrehDuv+EJvg07mGYa/uwq+aolo+n4wJ6z1cLoeEThOTLM74wZr3nawVrCjnrLu6zGzEVmPtlRdwyQ5D38pSFJRo8HqAcp1OJgjgAElnoy0gdSyUvgMGNKNCQyH6gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdh7uITA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdh7uITA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769079626; x=1800615626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJSzDSjOLouw8pRYuxyAYFFe9Y8DhZMRz12WUAc0D84=;
  b=Mdh7uITAGIM/yYztv2R3WCWaxWcvExGpFYthU7Hf53kgm8GBgIRMHZ9V
   eJTXcE291vn9KnnmVGiUs52TtFRdTo68t9CrCzW4LUcD03LPWtHsO/huA
   8jd+0ffhdE2p0wyhbb9+ekUEQ87TuTLHDA67ouQGLRybi/u2TxFqZ+1h9
   6xgtuMVuB0WW7Uw9Xv9o0TFomsrYU0IbhwmBViPCi6t7bM9WJBGQQMvXH
   0pDv5azbYP9TGvogFWGYeYmRNTlrAdACDbNnNRsoRjZvNKxJ5mNCenpRB
   92YK7LB6Ti+69xrtg06DXa0cKwoqcpZv7gM39EvBH7LYuNlKOUOQYxsMd
   A==;
X-CSE-ConnectionGUID: 4T9nb+IpRkKtkXMmgld5lA==
X-CSE-MsgGUID: 6A8h+gv0T52uHiFj6g8Jaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69336472"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69336472"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:00:26 -0800
X-CSE-ConnectionGUID: iTZLIFYrTg2FvTke9GHdKA==
X-CSE-MsgGUID: GqINrK8pTkGYPwza+Lh+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207137681"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 03:00:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 356A295; Thu, 22 Jan 2026 12:00:21 +0100 (CET)
Date: Thu, 22 Jan 2026 12:00:21 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: correctmost <cmlists@sent.com>, dmaengine@vger.kernel.org,
	regressions@lists.linux.dev, vkoul@kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <20260122110021.GO2275908@black.igk.intel.com>
References: <e5ee42bd-0d17-44e7-a306-61d19f1d24b2@app.fastmail.com>
 <aW4J6bmHn2dLuOxo@smile.fi.intel.com>
 <aW4MUisgI6d2Efbr@smile.fi.intel.com>
 <aW9LzBIOIePu59zV@smile.fi.intel.com>
 <d7627ea0-0965-4469-83c2-e2a15edd58a9@app.fastmail.com>
 <aXCYwBMTwkHZPYsi@smile.fi.intel.com>
 <20260121135803.GM2275908@black.igk.intel.com>
 <aXDos20kksml8wdU@smile.fi.intel.com>
 <20260121150256.GN2275908@black.igk.intel.com>
 <aXDuddwBCelAVouQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXDuddwBCelAVouQ@smile.fi.intel.com>

On Wed, Jan 21, 2026 at 05:19:17PM +0200, Andy Shevchenko wrote:
> > Well I mean if touchpads actually worked prior this idma64 commit and now
> > they don't isn't that a regression?
> 
> I don't think so, because commit did the right thing and just revealed an issue
> that was rather hidden. Reverting is not an option.

I now looked at both working and non-working /proc/interrupts and when it
is working there is no interrupt flood at all:

 27:          0          0          0          0       2277          0          0          0          0          0          0          0 IR-IO-APIC   27-fasteoi   idma64.0, i2c_designware.0

This makes me think that perhaps the toucpad is powered off and that causes
the issue until I2C HID probes and resets it. I looked at the ACPI tables
but I did not (yet) find anything that stands out.

I wonder if it was tried to put i2c-designware*.ko and i2c-hid.ko into the
initramfs, and does work it around? I would expect so.
