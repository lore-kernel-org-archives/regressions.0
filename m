Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120253;
	b=uf9dV+byPUd89hzP0V7g012A4u7rOsbk42BZo/mAN1nRBRov8X+9ZlreSrby4917cVmV
	 mnCGCr/45q+7GryJaF6h4VfDyfbknWfo06vGhDH9rrxJfE+7J6XNkpVZT32cNRV6NlnSx
	 E5G1T47ypIOrfw6nzfFXXTrZ3uh3prG3uaYROvBWDVGgdyY+KUFhkUnTbqVaDbl5aQ3Oa
	 Z5foV2uibbVQuPRnLua4Fd6d4GynT2jkYKNG/ig0wbplUdXNNZ75V3enolUhu3B9kgS7s
	 J4FYRPogUv+GfrtQ9zWtCG3EiavBQlLsZFmpe6QjkuuWteLVO96NtBMy+MJq+MuAX5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=tytvhk3JrVSHsXOPa2vj4/q7ALh5xJT51+mQ59xmCMM=;
	b=4mgQfImB92XgZ2DhtQAo3lhoBvw2/EPF8IML9xqWIOiJIvig/Ew6n+eQVM1KZK+ID/nd
	 DgZWFszJESyDekYfCHcsncaP7rthjkZYS6FS3fi+2iZ21Hb3H3HfGP+VeZziNKWNzWUlF
	 6fdplbX+w+qjf8BB7lJRUnhHHRA7+teKCVkVDhIdSEFPWKAO0uF3edbqCguhcGCBq6YCL
	 YGXDgOsrZfAXIIuGOvwIuFIMFKRnoPL5HcXAmtm+qxxmVPinCfV1wM04+zkY43XUhlls/
	 c0EFXkw4+pkdXf9/uFxIoaiIUd6DzDt6BFkosue0LeQB/ZMV0pzV5urERz//0ORZTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzDDyvtZ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE48606A331
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 20:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE48606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzDDyvtZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795120253; x=1826656253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7S1RuKZKjFiciBHtIpfDPfnceGxBPatJxPFsTbrfcd4=;
  b=JzDDyvtZ6IDxoN9VPFaVSRw8oW58hqscyS6zII8QMLzqd8OlTSPlDy2/
   69XNGPhrWODOuFNnUJn0DOxogR3/EqspY7o1Tjg3i8IbwrPsg+U42BzsP
   NbSdcGL+CZijx9YPofIS9rVsbxQd3Wq+jwBykX0M4MDoV9qaxtehyUlyU
   6+d5YDaSUKbi6wKPvRSzKwGky4up4LLrOr3bw2EE217ygDeSqd7TIDW2f
   yI6O3gsOj5X930SSVDKFHk9R22RYWeI7fJuBaNAv3uzhsuewRPWH/B0I5
   iTqvIiBAWcVqon+qlmEO/e4Jjn9KeqKz0LsMWiHgAs0U8kA91RfKyS956
   A==;
X-CSE-ConnectionGUID: +i/OPfZaRSS7OYcOck8Vpg==
X-CSE-MsgGUID: HOZm4SIPTZWo0oMP8NvgyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3982252"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3982252"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:30:52 -0800
X-CSE-ConnectionGUID: gKSvUEcGTfyH7sSrxh70EQ==
X-CSE-MsgGUID: gn6DCL6xQgK2aVUP4tq2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10521474"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:30:50 -0800
Date: Thu, 19 Nov 2026 22:30:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Ted Vera <tedvera@gmail.com>, linux-sound@vger.kernel.org,
	regressions@lists.linux.dev, oder_chiou@realtek.com,
	lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
Message-ID: <av9cdww9a7NV2DHz@ashevche-desk.local>
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 09:11:13AM +0100, Pierre-Louis Bossart wrote:
> On 11/16/26 22:24, Ted Vera wrote:
> > Summary:
> > On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> > kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> > with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> > appears in devices_deferred, no RT5677 ALSA card is registered, and
> > only HDMI audio is available.
> > 
> > The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
> > resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> > device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
> > and mic-present), not Yoga Book-style external reset and power GPIOs.
> > The driver requests the mapped GPIOs before registering the codec’s
> > GPIO chip, which appears to cause the deferred-probe loop.
> > 
> > Test and result:
> > I built a temporary module against the matching Fedora kernel source
> > that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> > that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> > card appeared, and laptop-speaker audio worked. Secure Boot remained
> > enabled. This strongly supports the ACPI GPIO mapping as the cause.
> > 
> > Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> > resource layout matches the Yoga Book, rather than applying it to
> > every RT5677 ACPI device.
> 
> Humm, it's a 2015 device that I used in the past without issues. It was
> one of the early SOF devices... See commit bcb43fd.
> Is this a commercial version or an early prototype? I don't recall what
> EVT2 stands for in Chromebooks.
> Also adding Andy in Cc:, he was the one who suggested the GPIO fixes.

I have Google Pixelbook 2015 (still one left), I may try to install F45 on it.
Note, F43 worked on this device so well!

-- 
With Best Regards,
Andy Shevchenko


