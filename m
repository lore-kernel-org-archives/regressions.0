Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D432ED51
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942969; cv=none; b=lpalJQQqSy1907HO06KnUxSfeSSJpLdTI2XEuKX0QH5eL2Lu5hhf9AIN+vzsitccmJiGMdQkQbXdGdn/MinIhySa4AN7JzRqA4986pyFuIhZdTWhkVxaznR4mGtntcNhGVLY4zqHI50HvN/VyrxWbw7it3gMuyedLPO/xtrYp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942969; c=relaxed/simple;
	bh=n/BIBT2TQ6QLo2HPDq8SQzsjDi1TV37C1BbUNQ906YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIn6wdUCovch9lR7aO5FOV9Of72wTpPVph1fX0x7cGzskTj7OSNsUFN/xv0+rOwOzpX0XTKGF9ZBdby0ivRhWmG+shoRP8wIJYqbetyVuY/9j7EUfonLbRb3yH5GVtWKIwX0PBBg8Vnnwl4r6R5AxRpJFibMpmrPYB0WvZBPPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG32UTFw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG32UTFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764942967; x=1796478967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/BIBT2TQ6QLo2HPDq8SQzsjDi1TV37C1BbUNQ906YI=;
  b=QG32UTFwhRMgMl/2SRE1ooZOELVEGwwTiYshWw7kdeU+Qz4V7718dP9T
   ur7TroFUWY34Eg78G/RXEsyWlNvcdXAE5uLyGy/GK8/w2ioAHCWSyUp6A
   qlihmJsaHHJGfue1CB4/9jfYfk/VK5/YYLcHzScWOfCYSZ6EWagJIn6ZZ
   5v6qq7OqPguetJexg+GDX9DgjCEP5XZTcs1Ae0FOMWcBmahoV6P+t78ET
   kusyv6Rh/GDeBz/GCCWza/enxcrTSuGIjoyWA5jC4I/qEWZPTusc5sLJp
   eNDrkBKe1B9IZuOGWx71Fl6og/NVbYYyvXp2gCDJ50QX32bHpdx5X38JI
   Q==;
X-CSE-ConnectionGUID: C6UkVUWsRH6EoG3+Y930hg==
X-CSE-MsgGUID: Nap2q2TuQymoGQ2EfnasXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78326741"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78326741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:56:03 -0800
X-CSE-ConnectionGUID: lQVfrKF8SEGtxxPxGSHIpw==
X-CSE-MsgGUID: bi/wNcI6RlWASQ7eoOqxCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195326665"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:56:00 -0800
Date: Fri, 5 Dec 2025 15:55:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev,
	rrangel@chromium.org, superm1@kernel.org, wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aTLkbgwNFOJT_X1H@smile.fi.intel.com>
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
 <20251205021616.1570442-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205021616.1570442-1-safinaskar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Dec 05, 2025 at 05:16:16AM +0300, Askar Safin wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > > Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> > > try to add a quirk to prevent touchpad IRQ from waking the system. That should
> > > help I believe.
> > > Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> > > If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
> > 
> > It might be actually the touchpad controller name (as I see in the quirk table):
> > 
> > 	ignore_wake=VEN_0488:00@355
> 
> It worked!

Glad to hear this!

> First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".

Sure, sorry for mistake on my part, I never remember the whole names of the
kernel command line parameters.

> I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.
> 
> I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!
> 
> Please, somebody (maybe Mario?) author a patch.

You can do it yourself, we may help and I dare to say for Mario and myself
that we even will be glad to help you to produce and submit patch on your own.
The expertise in contribution to Linux kernel is valuable thing, and I truly
believe it will help you in the future.

-- 
With Best Regards,
Andy Shevchenko


