Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24085268
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066977; cv=none; b=Pewy0/ubvx5GMeeuRpddMgKVFHCySxAHex3oM8bIwG/3t3eXF9MLPsLHMi86NlE8aWlKDtgGH13FsnILVHj6rjpAUwcWvvgdwB2aQBoXU+bEMuP4wrj5pkFS/HQvtTON2PI9wLhHqViYv2THflKHZ5xm3eFODOj/w2qIT0FiuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066977; c=relaxed/simple;
	bh=Jt8J83Qs52Euab+TTyyULznFALZqzcKbukrVmjAqGVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYEDw6+yIoNPju+QBgR65dBfoLEGGk7IAtoWVcp8yRrrZB81D3i8SdUg1Abay+PQ5HWyiBBkoeRBgpn2xlmx14JifPFZxLn1c95n6/LauRl+SDn0TLJ1O5zEU3X84YVYGIDJi/2MZPGAKuwe9/h3HEd85yA5gfQcwRbZqqF0pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZqJQDFnD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZqJQDFnD"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d71765d3e1so52872271fa.0
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712066974; x=1712671774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPGwoUzYRhrsxJJ6NbAyzYSFsQyX9rvT9zXjZL5FaHg=;
        b=ZqJQDFnDkVOYEScuSmEsZDEA6nBKK1oJcsOhWD/G0UNurvPWiQhMQ0+hoNPN3fhg2z
         jxun3e2W1GSVxggfxe36ma+WR/6GZlASxv3tt6PuI33722QT0JHrJxkZvPU7lKgtBNs1
         sZ/qOSvbLst6LnT/ZZpkBFVnIhjDUv3GkjUKAJGxqUfVwqvlMb4spGeN43Z8GqUkgW09
         YgqVQLtm7crdjQuboxUNgNayRJkVhSd6b41w9Mqz1fP/2eCoTE7jPTWzvkblfGIukl4A
         kSKBeEMDGRZ1gMxk3IjgAlXYbypYDGScJ2034WMEtgKHqht0hwT7M2z0J+Iy198u7Gry
         cMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066974; x=1712671774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPGwoUzYRhrsxJJ6NbAyzYSFsQyX9rvT9zXjZL5FaHg=;
        b=tjkiJtVfZvigSw5rJinOWvMwkIEs4LL5UpAIErkGdvgpPA3qlniiEl0WVko6nki7u2
         Vh3G+HtyqqfYuQfjIZSlGNeF/vI+kGefLXJcA+EFprlOWTH6kzmz58fJCkaXQnXS8OzO
         UO0vDflphZOb1mkQNoApjmxa7XEiBuSDIIIk8Rxe2Z3ydK7/pvgXQPh8hqy2qkdc2rGF
         yBw6hQMh0sdwTm3H97xXZ3BNkL3LqVRPNe3gGpEROfV/pTRhiNNCYWKeoD3SekrCy09s
         Q9sExlGv9OnTT7ABhmeyZHCMI2kQ/bM/x7oW5k9ECZoCKb7oBEzX6UrBeTQZpFtB+g/P
         1vhg==
X-Forwarded-Encrypted: i=1; AJvYcCWx3FClIyiIL4xYeefipXD4S+VM2TLeVGPRxoX5+k/APD7Y2XZ9V9wTeS40UQq9FJZ/S8mFHxoFgxXOmETrTWJ5h6Q/ydY0P5XwYz8=
X-Gm-Message-State: AOJu0Yx8pljOwToxeqmkIwMuFB2HGuc9+pbbMyDPG9F2er/8Xr2rdks0
	szhUbOFqOpqk7Xgc369DYJTXLii4YVPl6ycW/HnXLpZ0x6mVeXanYEo/pn+Zkq1hRHJ44OWEfhu
	cSl9h/t6pBEpR7NI6xUE3SKZEIz81wQyn88brEA==
X-Google-Smtp-Source: AGHT+IGVLgbiu0THc2aQqtdUiIKArPfEBHJNcPp4M7o4+j2DroDeGXiKjz7cFgg590XIJhOVWCEaf+V62qpHjsMKBqs=
X-Received: by 2002:a2e:740f:0:b0:2d7:1323:6792 with SMTP id
 p15-20020a2e740f000000b002d713236792mr8996831ljc.43.1712066974361; Tue, 02
 Apr 2024 07:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240402134334.173409-1-hdegoede@redhat.com> <CAMRc=MciKFPrqSG0BbLr3oQmXXfDsJGiqukhjKryxUGNPg4KYw@mail.gmail.com>
In-Reply-To: <CAMRc=MciKFPrqSG0BbLr3oQmXXfDsJGiqukhjKryxUGNPg4KYw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 16:09:23 +0200
Message-ID: <CAMRc=Meygux5seJTkW7ya-Bm-4bQkzd56VPJ-RWMTNjAoG+qWQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 4:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 59ccf9a3e153..4c674a37bcfc 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *=
data,
> >
> >                 gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
> >
> > -               if (gc && match(gc, data))
> > +               if (device_is_registered(&gdev->dev) && gc && match(gc,=
 data))
> >                         return gpio_device_get(gdev);
> >         }
> >
> > --
> > 2.44.0
> >
>
> Can you do what Andy suggested and move this check even before taking
> the SRCU read lock? It doesn't protect the underlying kobject struct
> in any way.
>
> Bart

Oh, and please add a Fixes tag too.

Bart
