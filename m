Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121292;
	b=J1QVj9a89rWkM7uOwcH1cG7BrtkpXnZvYSls7toyvYOYDbhAf975+728JvxOPFXKQ0lT
	 wBO/rOhzH7jD0rKKIF9PNoJs8AHTjHabuU8WzX8kGse+baOW4xHjNTQKobGwAfUqiLA4b
	 uD0pjX7fWvx5P+iqpHpnYqy0Sww0Knu5gtD3Qyi9XrbT3h1EeaS/hHZ9frfjuuYAE+lUL
	 9mAOA9pO2+QElH19od6CwjQLgdz6VWczBKSYHY8IydU80+qTKmxJajvlwdjcvNQ0/7Okv
	 dqeSEd36bcJNLB9QS2eSQmiAmCoPZ9u8Kz6q1Xlm3Cjaq766POZoapwhUSLFuFK3CjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121292;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=vUVGYXfSBMcZ9ImHmmeVeiFksKPd1GhXxTWc4hmFxAk=;
	b=LNXmMaFa3qiq0LmCWHoqiW3Xlh2DDp/jNYjrgDCiymk2hnXQpfgYh1o5leK5pV2ssAV5
	 tjnyq2Nm3OF8MDwnnlcXZZMMUJd6Pl0VrvUuz8Wq93d/WgTklNAl0VjxVVjUZe8xRdZbv
	 8qVTSWH/CxU3rs8oxKsDDdrwZcLxMdS34YDoTldMOgejhztehDBoGwqd+OmW7E5paXET7
	 UlGbgYBvbUtD7lKdkFPBod8ME2zVmPGXeDuw3ckUIoYyPouKTKUD4XNOQ6M9qP1+94Tmy
	 fk0NpWRG5HwqMU/O4/ZSOoPpNmfyNKbdRmeunh5YIbmljQjkgX/reAhBsjfOrv4bkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GG8mCz4M;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4818606CC5E
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4818606CC5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GG8mCz4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795121292; x=1826657292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ta7bLLR3GCIuukKIwdgqYEPhilOjBShzgLRaNePvnrc=;
  b=GG8mCz4MlnRe6Rtx7+CzFWCLnMcMqezxb/lZAgYunoqCC1+yeW82Jt5k
   Fe4k0koF7/Ml6yAZx0nuLU/p5DnJmRZEOJksX8zpKTPN+y2R2UYU9aMpY
   SVX3Qm4I0PysW/ngADHkQjxVGXuMwuNTYb72dcBNmPEHgPNAAYEdwvWGm
   RF8I0mDoEdzeZWCU2NYu6G8RKBf2G0gG7PvirMQA+UtmnsgdvfOrtXl5B
   DNaByreVrLxFol8cGKyLu52o9J8Kmj0sNjxE6EgaCFixsFCvtGBD4h9W9
   9GXs6BL3bb1fUU+Emw9xvJkf8QKoaAlp1vGYB4a471nqFjTDz4d4JPqeF
   A==;
X-CSE-ConnectionGUID: pUkGhTSjSzGUItD85eKx4A==
X-CSE-MsgGUID: QI/GFKLHRDS0Vbu0/q90ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4021625"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4021625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:48:11 -0800
X-CSE-ConnectionGUID: gOyj60AzQOSBkc720uMPyQ==
X-CSE-MsgGUID: OWJsTmOlRiigvjai4ffZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10551135"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:48:08 -0800
Date: Thu, 19 Nov 2026 22:48:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	johannes.goede@oss.qualcomm.com, Ted Vera <tedvera@gmail.com>,
	linux-sound@vger.kernel.org, regressions@lists.linux.dev,
	oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
Message-ID: <av9ghv5KIcXoc_l9@ashevche-desk.local>
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
 <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
 <CAKWEGV5XEncchpzBJWjjYh+cXE4ZSSiBvEDUdN-3nLw8tA4W5w@mail.gmail.com>
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
In-Reply-To: <CAKWEGV5XEncchpzBJWjjYh+cXE4ZSSiBvEDUdN-3nLw8tA4W5w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 10:08:32PM +0200, Yauhen Kharuzhy wrote:
> вт, 17 нояб. 2026 г. в 19:34, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev>:
> > On 11/17/26 11:54, johannes.goede@oss.qualcomm.com wrote:
> > >
> > > Note adding Yauhen the author of the troublesome commit to the To: list
> > > (why was this not done in the first place ?).
> > >
> > > On 16-Nov-26 22:24, Ted Vera wrote:
> > >> Summary:
> > >> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> > >> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> > >> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> > >> appears in devices_deferred, no RT5677 ALSA card is registered, and
> > >> only HDMI audio is available.
> > >>
> > >> The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
> > >> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> > >> device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
> > >> and mic-present), not Yoga Book-style external reset and power GPIOs.
> > >> The driver requests the mapped GPIOs before registering the codec’s
> > >> GPIO chip, which appears to cause the deferred-probe loop.
> > >>
> > >> Test and result:
> > >> I built a temporary module against the matching Fedora kernel source
> > >> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> > >> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> > >> card appeared, and laptop-speaker audio worked. Secure Boot remained
> > >> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> > >>
> > >> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> > >> resource layout matches the Yoga Book, rather than applying it to
> > >> every RT5677 ACPI device.

Yes, the ACPI GPIO mappings should be on per-board basis as the PCB design
appoints the GPIO function (semantics).

> > > Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
> > > a DMI match of the yogabook sounds good to me.
> > >
> > > DMI strings can be taken from:
> > >
> > > drivers/platform/x86/x86-android-tablets/dmi.c
> > >
> > > Note there are both a X90F/L models which ship with Android and
> > > use a different BIOS, as well as X91F/L models which ship with
> > > Windows (same hw, different BIOS).
> > >
> > > Yauhen, I guess the ACPI mappings where for the Windows X91 model,
> > > since on Android I expect the GPIO's to be hardcoded in the driver?
> 
> For Android tablet (X90) I used x86-android-tablets module to create a
> ACPI-independent mapping via GPIO properties, see
> https://github.com/jekhor/yogabook-linux-kernel/commit/4e3c2f5f7c74305d4825bd1c031fdb3bd16edefa
> ,
> was submitted as
> https://lore.kernel.org/platform-driver-x86/20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com/
> 
> 
> If GPIO mapping in the ACPI entry for RT5677 is not generic actually, then we
> can use the similar approach for Yoga Book X91 also and don't use ACPI
> mapping et al.
> 
> > But the open is whether those GPIO mappings belong in the codec driver?
> > Back in 2017 (!) Andy moved the Samus mappings to the machine driver
> > bdw-rt5677, why not add those YogaBook mappings to the cht_rt5677
> > machine driver?
> 
> I actually cannot remember why. Intel's SoC subsystem has so many similar things
> made in different ways... AFAIR, I didn't find any mention about other real
> devices with ACPI and RT5677 so tried to apply these mappings as generic
> and belonging to the rt5677 driver instead of tricky management in the
> machine driver.

GPIO mappings via swnode appeared not so long time ago. ACPI GPIO mappings
were the solution way before that (but only for ACPI based systems).

Technically we may convert all ACPI GPIO mappings to be generic GPIO swnode
ones.

> > Looks like the addition of those mappings for the YogaBook didn't follow
> > the Samus precedent, now we have two different ways of doing the same
> > thing even though the codec is the same...

-- 
With Best Regards,
Andy Shevchenko


