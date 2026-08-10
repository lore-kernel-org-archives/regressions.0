Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BA3939A4
	for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339398; cv=pass; b=aGvIPxIKxn5gXktUjp8azcPlQyWxRn1u5hnXh7z/Bg1CLnIxAa24G48wFvrfX0ADcTHXrd+EmOiJm4746mffTYPj75eNQpsWxwdYfxTBAEhQerjgDMW6m8MLYG2o8NCcNgeaUMX2RJlcT9Rn4Y4XTbg1hGOHRC9us0UoVv+mQA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339398; c=relaxed/simple;
	bh=DyPbHUAtcMi/e7oergn3BUmtEbDPiOqnxDcdQz3Fu8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YH71xovxknvMoZY9qpfg6cQkKwCPSvJyMb5Sn9CbRXgtx7aRYxmEeb6P8DD9tbR6ktHdqmGBq6Pc0/4F6kDm2O9/tm7ygwGhaf3l/Sqw1tS1y7sq4aVpgSKi9p7tmrFkkTFAIlwli3pqofoToAf17Atsh62Dk1GBau2i/sysOrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxPX3TVT; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxPX3TVT"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66896892b6cso2096858d50.0
        for <regressions@lists.linux.dev>; Sun, 09 Aug 2026 22:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786339395; cv=none;
        d=google.com; s=arc-20260327;
        b=n1sMj/LiANUgL7JESenEsMM9rdeEgap5Y3YzSzOGURVdAMfFlMKdavDx8V4ctEtbKV
         dR1fYhZ+Fn1ZlJIXioDJ7k1KYmLuszept5Mk5vDgL0+nqp+ZFchTCeTi7pntdj4+7ReK
         lNsRHANrQlAjUXp0n/jS9JXOiMcfrIU17BnIyzTFEYvjbftl8ISu7PmgrQ1CjMG+nDgl
         XU8KFeYwdkAmfIVFN6EpFFsuBkx3JvxZxQ5eXup7o47FvYYBmw5J0wMIFDfZFX3YbPOr
         r3U6HfJlycKZHG4SXoOGR23eew68qplLCcZxRyVwPg8yCL6d2eKr1gSPPmyylJe7znFr
         GCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V5cg9cUMM483feITK+A0fq23fgcoTcw/hMKjOKcFiHw=;
        fh=WxbuJd4RLfsz7iO3kSi6c6JtZADVFVn+XEINBQ1mXL0=;
        b=g23CbLQIT/L9XkwXicrl8sf6wDLw/3gkIPrwOtI2vCLgOR3Z51JvkaD2jQ+GyYR0A7
         GEr+0SKn5jldq6fSts4XjrtdsJpo9dFhAoERk3EsP0va4LiCrx04yvhNJfonEpokUJ8l
         pEMbLMFc/5w8X+haknbvdngmQiYfHY94AoB/B5Xv4vKL6oxumN2DBKSH36Vls9/KZRDb
         7mCGd1kzRIk+Vmf37ZkSYHsM6COgnk7gvkgZMWP/vBGH1c9KYKRc1CgnVhfR6yxuW8Ua
         nFEh/CR56zUcZYg0e2SvDKDmuVUAb3Aal/MnNDkH18SfgA86iy86F74Z+4gj2z4nruOf
         LiFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339395; x=1786944195; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5cg9cUMM483feITK+A0fq23fgcoTcw/hMKjOKcFiHw=;
        b=OxPX3TVTxVBF5ESEpRzhgd9RlXmR+5D5U2GVx40HkBZLAe4mPDd6x09y9sdKFvwJaL
         YV3ZS3iZRLAHVTWg3lXjL6+2tG738xnckR5kyBXxL89urjOc8TJNBneUlsILycI36anO
         I5xfdfGy56wv12UpS7WcFwGJszDPBI2KMBNBwgfcpEjIyRu+XVulCvVUJ0jmnG2lPjY9
         7FAQBtAdShToFOyOysyfmTPiCrFmD5+4OU1bJzaAcba30CB0N/XFd49aLedDH/Q6O7Ie
         jx+/i7lMo65PdcGPZRayKKjh+ElycTmFTpYzJEl3nXbkTiC3Xcwt5/c/6rM/SdAbKDMQ
         h2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339395; x=1786944195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5cg9cUMM483feITK+A0fq23fgcoTcw/hMKjOKcFiHw=;
        b=X1yrXt/fBLHeWMzJgE8XfBKTTDdoYFywJ3ZxZSfGFA5FgbN4WS9UxX9/bTlidCKvVM
         Bbt/fqVQa2x1B7Hs9Y3pQmZ4VQDp1SQN5TWguTsW1NevGSJu4zpfRR+Gl+LgC4Y+WyBE
         wJZowImxgcIgeZ451SQn02CVRFzNIV9oWAwtYDbAmjL1BVujbWMN9hHIJqygRpkA0gl1
         lRyVeDXYAODhxT6x0x2OWHfkA2j+m2mYNLMh3v5H7Ad3VGaHE+2DpEgv40dAX5eG/dDR
         of9BbN8PIN6BgLJ2wR5M2jRgeNcjaM3QetD5QYrUAhQwf9oPbnPxGKUiRfpwbuvrwjjo
         esYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpifvGuorz+OlLoL9uwwj1o7D9eqonEA6SMNj8V5ffDa0d8YRwM35FMacKdLUsS0czD9pViBGi81TdA2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfLOzYam6rx5JooJ1xyeERYEMGTYp/jvjQkz6pv3CARzciDkRd
	706H/kP8ptvR9fZKjvWq7kYHY8VjTV0VF2e/UwVe0eP22E6XPw51RE5IPfA96j9QGlZCrFxFejt
	ah/kGRYkOBJ9IkkuYkeeyk4l0bsTj7Tg=
X-Gm-Gg: AR+sD11kBh21YHezrnMQu1OiTfDK0rpZ8MG8rSnXQHNQpcAtoE/dF6hh8icQOlH+ZfK
	QSvUsMBxfIb+rpNsYT+nAd11yxrFE9/tdIejbYyP0m3D2sMmEiMmmKXb6UBUKn0FA6x11WD+HDt
	Sv/oevdygryK7ji7JQYJKxrFyFlrOUFi+ZFRnw3iGl1GkrmF5L80JA0Rda2yoP7uHqOy8R+9RD/
	zpm8rBC84MH6Ft+XcpOLS6WDGKdZT53I2tdedhEol0e4Gcl3OIdy4Cn47l+P7wBe5lulPSh/sQB
	htPr8mSrMA1HPgH3sbemKsdQW/UhN0BAH7GDM7UrD5M4zaEDSRvBmb0jH00LxfD8P0bt+OZm8bA
	sCcocD9jW8wenMCiMX+jdH7RFSr2czIa9R9GHOiRv8vHRFTV8JBUxd8Bhmml6JqobLo7Kl2gppE
	dkfTIIb702zDj2furUEaw=
X-Received: by 2002:a53:e031:0:b0:668:2e27:22a7 with SMTP id
 956f58d0204a3-6699ab03662mr18080078d50.33.1786339394857; Sun, 09 Aug 2026
 22:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <amhodWpAI3K6aeBH@zenone.zhora.eu> <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local> <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
In-Reply-To: <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 10 Aug 2026 10:53:03 +0530
X-Gm-Features: AUfX_mzc26r5Gwao6z1n18JIQF8v7sMo9AJLWMgvWgubjztpIoyYpHjrO1eEy8Y
Message-ID: <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Aug 2026, Thorsten Leemhuis wrote:
> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
>
> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> [...]
> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00

Thanks, this trace looks correct on its face (defer at 0.619s, retry
succeeds at 1.122-1.136s), but the link above points to the same file
you sent last round (the master+revert baseline, no debug patch, no
i2c-dw-gpio-dbg lines in it at all) rather than this new capture.

Could you share the full, unfiltered dmesg from this exact boot (the
one with the debug patch applied)? I need to see where
"lost arbitration" falls relative to the trace above.

Separately, from your DSDT: NFC1 (NXP1001), which shows up as a child
of AMDI0010:01 in your trace, declares its _CRS as a raw resource
buffer containing three GPIO resources referencing \_SB.GPIO -- one
GpioIo and two separate GpioInt entries. Not sure yet if that's
relevant, but it's a pattern I haven't seen on my hardware
which I've tested against.

Thanks,
Hardik

On Sun, 9 Aug 2026 at 21:49, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 8/8/26 22:25, Andy Shevchenko wrote:
> > On Sat, Aug 08, 2026 at 10:31:28PM +0530, Hardik Prakash wrote:
> >> On Fri, 7 Aug 2026, Thorsten Leemhuis wrote:
> >>> This became 0a4bb2abc3e56d ("i2c: designware: defer probe if child
> >>> GpioInt controllers are not bound") and causes a regression for me: the
> >>> Touchpad in my ThinkPad T14s Gen 4 (AMD) stopped working. From the
> >>> kernel log:
> >>>
> >>> i2c_designware AMDI0010:01: i2c_dw_handle_tx_abort: lost arbitration
> >>> i2c_designware AMDI0010:01: controller timed out
> >>> i2c_hid_acpi i2c-SYNA8018:00: failed to fetch HID descriptor: -110
> >>> i2c_hid_acpi i2c-SYNA8018:00: Failed to fetch the HID Descriptor
> >>>
> >>> Reverting this change in current mainline/master (f9a2394a23482) fixed
> >>> things for me. Full dmesg of current master and master+revert can be
> >>> found here:
> >>>
> >>> https://www.leemhuis.info/files/misc/dmesg-master
> >>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >> [...]
> >> Two things that would help narrow this down, whenever you have a moment:
>
> Thx for looking into this. Here we go:
>
> >> 1. A DSDT dump
>
> https://www.leemhuis.info/files/misc/dsdt.dsl
>
> >> 2. A dmesg with dynamic debug from a kernel built with the attached
> >>    patch on top of current mainline/master
>
> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
>
> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> [    0.619018] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> [    0.619076] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> [    0.619079] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> device=AMDI0030:00
> [    0.619080] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> NULL, deferring
> [    0.619082] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> [    0.619102] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> [    0.619104] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> [    0.619159] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> [    0.619162] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> device=AMDI0030:00
> [    0.619162] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> NULL, deferring
> [    0.619164] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> [    1.122517] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> [    1.122523] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> [    1.122625] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> [    1.122636] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> device=AMDI0030:00
> [    1.122639] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> [    1.122642] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> [    1.135894] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> [    1.135898] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> [    1.135976] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> [    1.135980] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> device=AMDI0030:00
> [    1.135983] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> [    1.135985] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> [    1.135987] i2c-dw-gpio-dbg: check_child_gpioint(adev=NXP1001:00)
> [    1.136005] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> [    1.136008] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> device=AMDI0030:00
> [    1.136009] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
>
> HTH, Ciao, Thorsten
>
> >> On Fri, 7 Aug 2026 at 19:37, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>> On 7/28/26 10:30, Andi Shyti wrote:
> >>>> On Sat, Jul 18, 2026 at 11:13:31AM +0530, Hardik Prakash wrote:
> >>>>> I2C controllers may have child devices with GpioInt resources that
> >>>>> depend on GPIO controllers being fully initialized. If the I2C
> >>>>> controller probes and enumerates children before the referenced GPIO
> >>>>> controller has completed probe, GPIO interrupts may not be properly
> >>>>> configured, leading to device failures.
> >>>>>
> >>>>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> >>>>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> >>>>> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> >>>>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> >>>>> fail with lost arbitration errors:
> >>>>>
> >>>>>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >>>>>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >>>>>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >>>>>   2.348157  lost arbitration
> >>>>>
> >>>>> Add a dependency check that walks ACPI child devices and defers probe
> >>>>> until any referenced GPIO controller is bound.
> >
> > [...]
> >
> >>> #regzbot introduced: 0a4bb2abc3e56d
> >>> #regzbot title i2c: designware: ThinkPad touchpad broke
> >
>
