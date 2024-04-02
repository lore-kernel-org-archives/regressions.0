Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3147215A4BF
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076721; cv=none; b=SGF0TYQP2ZzSk38a4hV7vNqNZibKKr1YimIglHlLJmQWuSYl5BeMyNM0CGWsKOfqSM3ThFIU5//djx8FOn6JYovVSexQ94oKzpIWQwtR3Tq+VkTe92HO6yAZr6cRPVu2XrjM9ZrHXMWkopm3ehK7GsR6TCf/Vdfqh9Mog8t4IKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076721; c=relaxed/simple;
	bh=SJbU2X7441mYJCFBc2qvaCsgEGCMk8xV0KIIvRAIKzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVfbs28e3T4+yYYzalVXuyUDx05DArkwnnLKeJwQIEs5c4cKJKl9LgpAFwEfBsiZjQ4eQx6N7vDlLnXVkOtrLvOhFczvZlMrOdToAC9WFB2ISH8kwvgWyAXGEtuDAViuiWneRvXO3f58CDOcMUZAcUK10oMRyFhYRlruvPU12Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGfvNeLK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGfvNeLK"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513e6777af4so8932290e87.2
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712076718; x=1712681518; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgISE5etL0neRViDNv8SHE5eH5odsBSeTE4yjpddWsk=;
        b=jGfvNeLK2LQLbSYqJe4qbPk7FsCoWTHHFoXX+T8CmygfsAJf7fvqqYycgn3xFebp/I
         RptPUEQS+VOPQ03ZU5X/vdBEQzEf9lOODT+Hez1TYC/CuBjnA4DWFQ6CoVBPtU2DR403
         CRjn1uVQAxfLM9kZBbSf4PBzkeHlsDOKnS0U58Rf7vOjt1zYqFp4qcoJjgVnhTUgApY6
         CxC5rcexBYXf3IOc18ZpDShXXDR5BLiH+f9bu7/wDYyXVSfJaM4pex7xCea0dVTqw1rs
         NDbBQHLohtOvNYbyuEAnfpRGZs+TjnxOFO/TMY8sdLEQE9pfBcA7oQFpsA3jB5MgL8Ja
         7dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076718; x=1712681518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgISE5etL0neRViDNv8SHE5eH5odsBSeTE4yjpddWsk=;
        b=KStIsp/T39aViC3X+hbv3tn/dnnmwLJl2vpufiTXACwdBwI5L0sVkhT8is3y96DYQN
         hyL3gRmIx8keejqcIPq9dy8rKUatq8tFwEbzkur1e9heWHLoi92o22pPgkNEGXklTA41
         wN5PwjzpSAidgdXUUeGLREhdllCUcYIp42UpSoBZIza5ngauCygwsl0S2xjfe8Jx4Ewv
         1Qc4hJ+yf+dlyFR9xGu6wDsKZV6B0fC8LQxe4TMIvndo+pc5MuR+LGYEgtoR/0It7s6Z
         RJZsplBVFHTLLHSGayisdJ3ohnzVbW7WR7aAN5mBtXL4Hae2zO4P+WJOY9TGK2y29ipC
         k22A==
X-Forwarded-Encrypted: i=1; AJvYcCXB5+HkSDmjd2beBgAJG+D7bGkMyyHu0j8FUoLAxAJ5IwHb1ilVnKpVS2bD50Afjo3PzicvEwoOsIdxFgNysFEK0x3x00WdWxJZdZI=
X-Gm-Message-State: AOJu0YxerAbbnxPIMp5IJ0XhdC8P95zOG0HZvtMGbb68FEyiHFyGm39l
	epem7gmQUB2OIGDwN/9JaZsssJJcBhpXi8EDNHrRXiK/2PWJ/eXhCC4K6dl5BHcoPBoObGLV+ME
	l1/M+ZdSV84YJ1Pi7EMHu7w0yL8I=
X-Google-Smtp-Source: AGHT+IFkZ8Fljuu+7esyL9W9leJUOufQMhdJaMevUKQhSvGeXEfzLVh/OLYbTMyr2Xz/3ayXWd9W6SkCVg8xApbQmU8=
X-Received: by 2002:ac2:4149:0:b0:516:9eb9:dcd1 with SMTP id
 c9-20020ac24149000000b005169eb9dcd1mr1955851lfi.34.1712076718157; Tue, 02 Apr
 2024 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240402164345.14065-1-hdegoede@redhat.com>
In-Reply-To: <20240402164345.14065-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Apr 2024 19:51:21 +0300
Message-ID: <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 7:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> When a gpiochip gets added by loading a module, then another driver may
> be waiting for that gpiochip to load on the deferred-probe list.
>
> If the deferred-probe for the consumer of gpiochip then triggers between
> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
> does a kobject_get() on an uninitialzed kobject since the kobject is

uninitialized

> initialized by gpiochip_setup_dev() calling device_initialize():
>
>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>  ------------[ cut here ]------------
>  kobject: 'gpiochip5' (00000000241466f2): is not initialized, yet kobject=
_get() is being called.
>  WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x43/0x70
>  Call Trace:
>   kobject_get
>   gpio_device_find
>   gpiod_find_and_request
>   gpiod_get
>   snd_byt_wm5102_mc_probe
>
> Not only is the device not initialized yet, but when the gpio-device is
> added to the list things like the irqchip also have not been initialized
> yet.
>
> So gpio_device_find() should really ignore the gpio-device until
> gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
> check to gpio_device_find() to ignore gpio-devices on the list which are
> not yet fully initialized.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
