Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B57D136E3E
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142320; cv=none; b=l+LCB4/FFUHVZ50M6/bld1y4nTTr1e8gmQQ4blE9Gc7dIqqnhuBzmXyQiwMar4fIrKEWcDaW8P80VTooIhexo7y2sJIV79iOp2h9LFSDkSuMoX7LECh07Gcr8ulajwhkOHpEzZ9JaTVq9VcY/GqfHaZp2urLpR7pFTy+A03je0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142320; c=relaxed/simple;
	bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r75QxafFixH/A6VhKZ67PgLKFW8niuK586U+3EhuQHuLqFcWMZ0c/QNK6dzNtzZzZbSQ7sFri/z8WUiGoJiHWcM6GTM0jbopfkQbMdUA8YSLv3/ShtYaFAitTAdG9YDyxqkKhr3QiI3/YxHgcOK8RKHJiTBrh1BHOmt89++1LZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vst8ujd+; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vst8ujd+"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d52e65d4a8so85697871fa.0
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712142317; x=1712747117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
        b=Vst8ujd+ErPnXVywiwVdsXsecFlvjIY7O8Cosda7GH/dJVIxx3AmTMeS+JDxXByVZv
         SanyRBLcRmJ6T/bwXJOkjMr7i/A14bgLK75ibFII92c809C/uInSNiso1/V1GbLl6pDO
         HEKh/0cT5aeApjEDPVxx8p8VGyVF0DTypQlWrQLmuhJngpft7ZDrmUIf5KxrH7dl4hLQ
         S6Hbv2qDz5DtE60XoUzoRvqdiiBQtNlh4Re/v+bDv60yv4Q7F7KcFJc68HrUyfEMy4Be
         4mNR7t+VUGI6pnSp/+zzAIENTsOVTALDxRRtqU+vC0z0+HBqqLegh2oujRr5q/GLT9/T
         6vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142317; x=1712747117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
        b=K2lipK8Bufrk1Bm3ZTJY+5KXaTcNSwPFIJhKjxif+eB9B4iAmDEbm3u4lhRJ53koQX
         CoExHHfrM3Qzc+9bk41WZHRc9KlUIT2eP+L/rBslimXWc0qWfcLiWPY7aDFY+qnYlVcW
         jARMvWObM0Ew5PHmQAt4SVdXcYMJ89WYzoHA8pdhm6Al+st0UfNXty8gNobl0X5lzJav
         LS63iC1zyNsubKW3v3Z9bY+BG//LVM2FqsBU4cR0NmtfUw2wSFkz7tXIsdlWiFeMAgWs
         WG9aF02SIeQzmsxDtsCrIOUKB2K/e/hXfqlyFo4BvcCuI9MVmsD6/Gq+5691b2fi3nJg
         Lg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYGa+dXFnQ/FUnuLVN+WbS6AzLBwqhkqAOCpkK9Gh+VO2apVfK8bcCvy7GYolFbDJAryVNpcidqYnkCHdNHN/xSXqAV/3Z/cDbXbU=
X-Gm-Message-State: AOJu0Ywxy/OqY1gVTJfkk5roCreM+mjrNCDXXXQjHxZZA7FFaRH2jzbl
	STddZ4zB7pg3ejkC5dbp7Fc3GEj6Lwz/K6LblidrDiLhrMLNf32RjXv5HPnxJ0Z1qscXsqXDR2g
	u9PLVzT1Vn6zQi7dgXX7XTw7gJ2oHmOwKN2fF3Q==
X-Google-Smtp-Source: AGHT+IGUbSycw+xhCKbzuunuEt8CNkPSdh4HUdvDp0mg4wHbwgOvRmj7W6DJfRWgVQ/4OQszflMyHYsz/5zEYPSkFKk=
X-Received: by 2002:a2e:b5c3:0:b0:2d6:b424:a634 with SMTP id
 g3-20020a2eb5c3000000b002d6b424a634mr8638113ljn.15.1712142317196; Wed, 03 Apr
 2024 04:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240402164345.14065-1-hdegoede@redhat.com> <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
 <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
In-Reply-To: <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 13:05:06 +0200
Message-ID: <CAMRc=Mcocz5fJUJsjje_2qSRcptv-dx6bWFsaWZNVQs=+n7YKA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 10:17=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 4/2/24 6:51 PM, Andy Shevchenko wrote:
> > On Tue, Apr 2, 2024 at 7:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> >>
> >> When a gpiochip gets added by loading a module, then another driver ma=
y
> >> be waiting for that gpiochip to load on the deferred-probe list.
> >>
> >> If the deferred-probe for the consumer of gpiochip then triggers betwe=
en
> >> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find(=
)
> >> see the chip and the gpiochip_setup_dev() later then gpio_device_find(=
)
> >> does a kobject_get() on an uninitialzed kobject since the kobject is
> >
> > uninitialized
>
> Bartosz, can you fix this up while merging or do you prefer a v3?
>

Yes, queued for fixes.

Bart
