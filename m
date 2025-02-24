Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BE23C8A5
	for <regressions@lists.linux.dev>; Mon, 24 Feb 2025 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387068; cv=none; b=cq64pTNDxfyl0FdeyXsiPQNX0EYqEc7pm2EYn9y5AyatyPNJGScl1OERivLU9zmEZjOrf8SfjEqbIMyKLFt2h0ywe2jJLEsr74fshXctPp/CIQehQdY+G3/uQbTeSYsrzDms5WYN9Qpa7veMTdfz6nAXRtNNo/af1ggG0lLtrDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387068; c=relaxed/simple;
	bh=AWpVnDdHPnLjlBgLHsI5jv6cR6R9p5fUnRdwZCiqPx0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4/4OOBhSyBxXPc7mHh5T75G4kNVpjO4xdZlqE8Cx4i7QAmZ9fytW4tPZMHKmmXVY4dr4gG9abenGjRTcbJm18tlR0HdaGHxUZ3qUAkKmFX9LJl6PjndvC/O55Gbyac4h/zeC0GLVZQ6c2Nekr8HRRHVlg+rpWjpKwnaHyNyprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OuY5Yg0O; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OuY5Yg0O"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5452efeb87aso4176549e87.3
        for <regressions@lists.linux.dev>; Mon, 24 Feb 2025 00:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740387064; x=1740991864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BhzG4nBQaS6pZEmDj6jN7Om9fMKvu1IxUm1+KATAIU=;
        b=OuY5Yg0Of1Dc81ingFW1QP3VnS1sfJKcmNvh94EvbJXxDD7NwNMHgXSgvjer/KuFHr
         YI+LcN0+9lC50nuI5XzfngQir38eSK8xMHLUvcXFItvKfQjZ26VeDyNfkdjlw4qEKJz6
         5yGSM0yvlMFcsGBuKMZUfhoRK1IAQ8Qlwcy1bIqaC6JUDyfGSwTkvBANwR9pN7xOR08W
         yruMtGOWVhyr1EAOyMXqEIR9SN5ztMyfSQ/EJJV7bUYAEKfNaPhgARrFFmFl+Jb8DUMG
         +VqPIalx+4DEbVXNJjAtXglLQqeN3EDEPQToJPhZzbSkD0t/a77lcnglyQql2QNQskBn
         i3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387064; x=1740991864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7BhzG4nBQaS6pZEmDj6jN7Om9fMKvu1IxUm1+KATAIU=;
        b=ToHiXHiOGocf2J0NXzN4IrBzeOTdOdv0lQXGhX8eB5nHE+lfNeoIp4HlqJgwldnps7
         E0xDc1vGlvuzRXjlnFsk+MuMDGxcIW8VixwzSLtZ9VbidnO/rXUPdM/3tlkiDGfPQeBE
         tGWIq2OowHTHYqtaZtPD4cBJ1yPA85leGZRTQ5FpvRWRVCdk3gD0/d4D5kKBbAjlGdBp
         6ZprcVGYukq2gRQABsGP3uwpzMgpM+TAAUTXgDUepIJTyOTMzYazKKR3T33XK4oPJ1Ez
         eVo0lJhPR7wS1mkYmHO9LI1ISC0KiDOho8TqiH98b5UrC22YdlXNaNNBlpIgnGS7v/cP
         5r2g==
X-Forwarded-Encrypted: i=1; AJvYcCVoLpdZzQ/6IuB/MxsnGv5znzCTUOODljfY/tZFmsiJXG18Kb2pnVr+03tOAd5NeQ5VFt/hQykSLIB0+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxELQUdprBcm98cD573AuQEsQ+8diXFm24qvBnIclAWESA7K+Kf
	2N6BXv7dUWyAP2OhlRyC24ywqEyzHVRCbRNI9iUlNCjJ9qyT6jfvFOi7b1DmDvIgbRW9sovwlUm
	6aQ0IJQjrmpnbXEx/LSvZaQ9GQj+/qDVXlp/rFA==
X-Gm-Gg: ASbGncu9wZukKoiucoym+XH0nao+EqEdF+bFl2zNj72RyR6TN+1uAgWJvcfBcfaQOXN
	IKbljvJLXga6bvMoF0MkdQEEF2KIpgEEuf4yWXAP8lZRkStZd2kXN/fS1P0SwBXefC6JAHlpe+w
	4H4jC9STWEWb8HhdTHyJR32ZMMScsNLVAgGsY1Rg==
X-Google-Smtp-Source: AGHT+IGJUguXGJKpeBE7PfOW0x1i38GshOmr4oabfnWWPRN7xFoQCCjbLZq7tN5p972Bi+c4LXaf/H95WQaopgTHhSw=
X-Received: by 2002:a05:6512:ac3:b0:545:f69:1d10 with SMTP id
 2adb3069b0e04-54838ee1c94mr4275057e87.8.1740387063972; Mon, 24 Feb 2025
 00:51:03 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Feb 2025 03:51:03 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Feb 2025 03:51:03 -0500
From: brgl@bgdev.pl
In-Reply-To: <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
 <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de> <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
 <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de>
Date: Mon, 24 Feb 2025 03:51:03 -0500
X-Gm-Features: AWEUYZlDQScCnGqmGbQZrje1sb8Ipabug5b7HPQ3I9vkOhxdFZWYtY64UwmbNKc
Message-ID: <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Feb 2025 23:04:05 +0100, Paul Menzel <pmenzel@molgen.mpg.de> sai=
d:
> Dear Bortosz,
>
>
> Am 23.02.25 um 21:54 schrieb Bartosz Golaszewski:
>> On Fri, Feb 21, 2025 at 10:02=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg=
.de> wrote:
>>>
>>>> What GPIO driver is it using? It's likely that it's not using the
>>>> provider API correctly and this change uncovered it, I'd like to take
>>>> a look at it and fix it.
>>>
>>> How do I find out? The commands below do not return anything.
>>>
>>>       $ lsmod | grep gpio
>>>       $ lspci -nn | grep -i gpio
>>>       $ sudo dmesg | grep gpio
>>>       [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key: get_di=
rection failed: -22
>>>       [Just these lines match.]
>
>> If you have libgpiod-tools installed, you can post the output of
>> gpiodetect here.
>
>      $ sudo gpiodetect
>      gpiochip0 [INT344B:00] (152 lines)
>

So it's pinctrl-intel, specifically this function in
drivers/pinctrl/intel/pinctrl-intel.c:

static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int of=
fset)
{
	struct intel_pinctrl *pctrl =3D gpiochip_get_data(chip);
	void __iomem *reg;
	u32 padcfg0;
	int pin;

	pin =3D intel_gpio_to_pin(pctrl, offset, NULL, NULL);
	if (pin < 0)
		return -EINVAL;

	reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);
	if (!reg)
		return -EINVAL;

	scoped_guard(raw_spinlock_irqsave, &pctrl->lock)
		padcfg0 =3D readl(reg);

	if (padcfg0 & PADCFG0_PMODE_MASK)
		return -EINVAL;

	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
		return GPIO_LINE_DIRECTION_OUT;

	return GPIO_LINE_DIRECTION_IN;
}

Can you add some logs and see which -EINVAL is returned here specifically?

In any case: Linus: what should be our policy here? There are some pinctrl
drivers which return EINVAL if the pin in question is not in GPIO mode. I d=
on't
think this is an error. Returning errors should be reserved for read failur=
es
and so on. Are you fine with changing the logic here to explicitly default =
to
INPUT as until recently all errors would be interpreted as such anyway?

Bart
