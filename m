Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C92FDC5A
	for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136208; cv=none; b=nEcIhcUBGH7QQTyUanp3o/F5JWsuIC5Cnz0Y7lsSx+SmyjmCTXg/PfXkl35Ia7Jn4y/Op6BIgN5UyruJ5VLwgM8NReYdR2MzrvZ4g32mL19zzLBnyHdm593bxNDXmmJw/1nf/jQzPL4ST2jiblz+vuygLfo4G8/uGBRU4/r3Jv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136208; c=relaxed/simple;
	bh=/N+e2fzdzvHEqec+1vLZEoG/o3VY3GE8rhD0Hv2QYFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOhK0syh5fp9GaEd6WzxOgyub/G+0WtkJkQaU42LjVRYNt0iqcuAUjcU8y9VK5gl2erc6i02Bqdpt0F0A939bYQD4YWFhgLxw2A5oqpQhS5kOWUUdiGbgYbMTb56yVaa3fW7u1Eb0XOkp4yTNAKH5hVwpYyyBHjdA5b9ta0B9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSQV+r/q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSQV+r/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756136206; x=1787672206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/N+e2fzdzvHEqec+1vLZEoG/o3VY3GE8rhD0Hv2QYFM=;
  b=PSQV+r/q+JSQlJRRX1iaDLYop4nMNects7n0hP8rq1FsmaAppvx22pF+
   jgAGVpHMqks1I9B3crK8NYljB6aCEs65ldiqfUMUx5yw5aumG3VlvRgjQ
   jFEwaaTi/WnuVMP2jhGjt3QfQ8Ve5VCPbdO4IVj+LLECKnuD/1yAJFMHc
   x9f+1y7HUgGNwKLCnJyRdx2f0DSx4lUoPlbpDFogBBESO9Iv4zm99VpQm
   IOsKzJbQt70G8OMZbqlX1tBvXCDscqybCHyI3sVGPR5H2FtQ7Jo/7/lkc
   C/lukbNTV57bgvsuht+3iqYw6MdcjfGNPKRzeHsHyQPpnWm26ZQEvi03g
   Q==;
X-CSE-ConnectionGUID: 5tZhaHK7TX+NVUnKiSQE/Q==
X-CSE-MsgGUID: /0fl+UajSO2n6nQIgHYwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69066218"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69066218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:36:46 -0700
X-CSE-ConnectionGUID: xkHHoNUCSqqFEsqi4pFGAA==
X-CSE-MsgGUID: 8LVu6i6pSnKd/mXXCMHeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169260341"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:36:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqZFQ-00000008Y1x-089o;
	Mon, 25 Aug 2025 18:36:40 +0300
Date: Mon, 25 Aug 2025 18:36:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Askar Safin <safinaskar@zohomail.com>,
	Linux i2c <linux-i2c@vger.kernel.org>,
	linux-acpi <linux-acpi@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>,
	DellClientKernel <Dell.Client.Kernel@dell.com>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
 <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
 <aKyCl_ly_LhtEOpc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKyCl_ly_LhtEOpc@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 25, 2025 at 06:34:48PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:40:28PM -0400, Mario Limonciello wrote:
> > On 6/30/2025 3:14 AM, Askar Safin wrote:
> > >   ---- On Fri, 27 Jun 2025 07:58:15 +0400  Mario Limonciello <superm1@kernel.org> wrote ---
> > >   > That's odd.  It should be made when the PMC core driver binds.  Maybe
> > >   > others will know what's missing here.
> > > 
> > > Command "grep -r -E -I last_hw_sleep ." in culpit kernel (1796f808e4bb2c074824d)
> > > shows nothing. (This is somewhere around 6.1).
> > > 
> > > So, culpit commit is too old.
> > > 
> > > If you want, I can retest this thing on current master and on current master with
> > > revert 1796f808e4bb2c074824d.
> > > 
> > >   > I see in your bad config interrupt 14 is waking the system.  In the good
> > >   > config interrupt 8 is waking it.
> > >   >
> > >   > What is in /proc/interrupts?
> > > 
> > > /proc/interrupts from culpit kernel: https://paste.debian.net/1382819/
> > > 
> > > --
> > > Askar Safin
> > > https://types.pl/@safinaskar
> > > 
> > 
> > Looks like your interrupt 14 is ACPI device INTC1085:00.
> > 
> > Some quick searches this seems to be an Intel GPIO controller.
> > 
> > Andy,
> > 
> > Any ideas how to debug next?
> 
> I believe it's related to the touchpad (can you check that wake happens due to
> actually IRQ on pin 355 of the GPIO controller?

In other words we need to enable debug of the pin control subsystem and see
what it will print in dmesg.

-- 
With Best Regards,
Andy Shevchenko


