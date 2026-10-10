Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534D368D79
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595783; cv=none; b=T1fEYHCwoqmurKZQuTmaFBKVX4i7vBxI4WroK7RSusHJ/I+jOdOTzOdz6m9GfdC8Dx/9IvhVA0Nhnf6MUw073uKitjpRguW/c8u4Cd6VnKZyQejS5VCokcWtPwXAyvOx9PIqUFD52wPO+gw0FjOLvP3veqAHqsMqZUMe0ulEnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595783; c=relaxed/simple;
	bh=KBTgGPXwqYMTvTgguf27DJ1ah3djAKSMH1oBB+BYjq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VngSOMZiN9ncEQ6+vPSprGBetMQc0LBFPKuy23Xqu+Yw+mTPnc2IzFbKc1azpge7Ljm/m7g2oM7WJkLZa/C9h0pqYRZ/heUx3i64gLDYEybM124giTTNO3DiA2NyL5L6GegGHg1AM4jP9ixI9Z6v/bipiRKwbPOWJE6GM33mMFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQBA1QzI; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQBA1QzI"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-141395927feso442795c88.0
        for <regressions@lists.linux.dev>; Fri, 09 Oct 2026 18:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595782; x=1792200582; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3zas76OUfhL96GeojGYBzXO7tmHzkqw0ykYvlYF/R0=;
        b=iQBA1QzIY3z5KYcbjGxGy4JfFdbHq9cupecYZWez4Ezd2RFxIOVqfp4D5RTkyr9ZIT
         I8LRbFsSGiaKOktDAfcuUe22J2KLa+MqVb016UkCZaAHBK6SNqP5vtiE9UPhrdsZ2zEL
         t70yQ7BrcynB64/XN2d1jeJ+0MFZAjbbWTuL60zm0Y/bYMYyYVFqgTYULZOC6DSBy8c/
         pdbSQunttDXcG55EakEV8xyK8g2/hpBDIEiIozt3EHiryE+5e/2Gjt88mIW3/YJhA85G
         47cH5Rx11byckhapIdRY0m+zgryqRWdQrZmjq2tgF296dVe6+YObQVhi7E4G/wZzZo4X
         K66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595782; x=1792200582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3zas76OUfhL96GeojGYBzXO7tmHzkqw0ykYvlYF/R0=;
        b=BGSyKf39XnK8TvEoTrL8ha2gEMvcu7icUk3oQ/Caez6b77EbpuhRRs6jKLzXUN4iUS
         5XdpvtjjxeRvy4YuUv3/ydVXpHFfZecGHE6NV3BfBTuhiaCSvicZfRE/q4Xf8vpIQXDr
         DkjuK1h9NoeKKRbceezMRXqn40DO2CKuXKVJKSHmgIvXdsD0uhTxMC0V4oh0mH7YWRuJ
         o/FyowIu89NOdT6fs6DyIeFUroDi2X2WVECL90AWr05in+phfzfoRdEfRIRwdFtVxLwZ
         wXADcZYJiEM1LQVsbY1QIs3uBdglv7NMEhhJXls1x+DDp0pSZIGzj6jxNpjvjYRzuKLk
         R4hA==
X-Forwarded-Encrypted: i=1; AKwUvBzCWIRG8wiNivhEzdL5FwGSKfsHQOa08B0hf/dDOxPUT9QtGjlAcb5kEfgGUiy5lawgNTv+oOtrrHWXTg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIj/GXPyt+X6wDsTE7QN0T4dzT8aL/T6OgcxQ69OjvoZ1TEPnwd
	772pZAn+nO5KnuHvlJqNabUjTEGrjZNCDvzZE7o4gqdiHVsiUbQPdkhU
X-Gm-Gg: AYBFou2c18f6gOL5SD4c017ThCjLUESM54TF9FC5s+UgR8c678RVoiOVgbVEh3nFZB0
	KnyMdPCAPEzjvEIbkvbx7tRbqNIOhTchLh+HpaBTOXAsrHRi1+jnK8QPJb5CUUIzIgb0Mz8qH2N
	vumF+SEl4N4pzPK0JWudFIB9KIK8e6BBlUR+O69E3dOj8ajw8k9wlPImwJNIrXMk6ZO7V7Otpn8
	4LOxiHKM7fEXJOsFAHtuwXyjWwaLrbRQQXxydVwLK/kdNz+0vdxU+Sm9DZD5T2A4ur8YetAE/Cs
	cj2MUtEEaKlUyZqTY8iLMdKuw+o5soJPlfBPBDEtn+VN7jp7+laXUk6CVwyMPZ6mrwZEqA3Rtcw
	zEyuKDuasXh0bOz744bC3RpxLjfZR8TuCX5ToRkMjAPNKCgK4l5pg4+J1YFBBFwjiift4NkrZ9F
	qWIMYJaGk6gaFFzch7svAQmtdE4uimPDhKwnh/d37LpHE+ID7FPEN8Qxn3Q07QSQvmI1GWbu1nL
	ah0HTnk3Qdhi04SsSW1URMfGvt25761jYmDHOuS
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr5007124c88.11.1791595781518;
        Fri, 09 Oct 2026 18:29:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm8624343c88.19.2026.10.09.18.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:29:40 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:29:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oleksii Kryvenko <diver.ua@gmail.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] thinkpad_acpi: probe deadlocks in
 hotkey_poll_setup() (next-20261008)
Message-ID: <asmU_fdpt0I_JQK8@google.com>
References: <20261010002413.30007-1-krivenko@itstep.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010002413.30007-1-krivenko@itstep.org>

Hi Oleksii,

On Sat, Oct 10, 2026 at 03:20:24AM +0300, Oleksii Kryvenko wrote:
> On next-20261008, thinkpad_acpi hangs in probe on my ThinkPad
> X9-15 Gen 1 (CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y):
>
>   INFO: task (udev-worker):537 blocked for more than 120 seconds.
>    __mutex_lock.constprop.0+0x569/0xa30
>    hotkey_poll_setup+0x50/0x110 [thinkpad_acpi]
>    hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
>    input_open_device+0xa7/0x170
>    kbd_connect+0x73/0x90
>    input_attach_handler.isra.0+0x6f/0x90
>    input_register_device.cold+0xd5/0x16f
>    tpacpi_pdriver_probe+0x442/0x4a0 [thinkpad_acpi]
>   INFO: task (udev-worker):537 is blocked on a mutex likely owned by task (udev-worker):537.
>
> The input core calls ->open() with dev->mutex held, and since
> d6479c25ecef ("platform/x86: thinkpad_acpi: Use
> input_device_enabled()") hotkey_poll_setup() takes that same mutex
> again.

Thanks for the report. I posted a fix for this earlier in the original
patch thread here:

https://lore.kernel.org/all/ar1iwx_390hWw_e7@google.com/

Instead of taking tpacpi_inputdev->mutex or reading dev->users directly,
it tracks whether the input device is open via a driver-local flag
protected by hotkey_mutex, which also keeps polling suppression working
properly when the device is inhibited.

I will send it out as a standalone patch shortly so it does not get lost.

Thanks.

-- 
Dmitry
