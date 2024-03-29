Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8A1EA8F
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725407; cv=none; b=OMMEsZOSt4Aj+yNvaF4/J99F+F1sHElUKhXOlQrnUnSAvMYCP5GjVudnQ4XhtZ5KSwuf23pCzv7n7bxhOc8O2Q4TychdP6MIYAtbRwz8zbIfmBk52W7ZAtL1AduxmGbvrx6uRjsx+wl7cNjZGCvB7D61bEJFrchWmvcJdMK03x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725407; c=relaxed/simple;
	bh=bXqO9ldKgORkZ+8U29cEO9eCzS1Prl/TZB36JmaV/hs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYSG5Ylwjpwhpvhebxfr2T5mDyHIztbvKSWc31QrPrYEyGNlTRI036c7PGebYmtS69MHNNyFjtCEvGy0SSBzuIRiGsVYKE75VX98aMOaDOerEaXE7n4EB+AOfjPMrJ6PXWzz0Z6F5+8f1r013fMzFU3MNndIjkDwoQs6D43137g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eELclVTP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eELclVTP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513e25afabaso2242161e87.2
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711725404; x=1712330204; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqNwX/X38tayRDAW4Zlj0+695u0d2YomcEbZiHh9vxQ=;
        b=eELclVTPwX2wiGHl4sI1czKNPb0CDRdKTPS1TjLsrp/g1w+oSaRjWmw2axEuyEUBHy
         nmY0zSRwaG5iARQJoSXWOx9Pcb88X3jpMaqKNGbgrFCM7AjFd0FHCboVSbgBFe1XVO4/
         jVRrO06c6wqLMRmeRtPCT16caDiLN6hVs4ueHxP+y6QA0zW8zTxDl45Q7AThRCXGL/7Q
         F4kfvXdygxrdM5PjEYY1GcSZlKSedqcKJhC11q58EU4STiD6APiDU3k/Xdsf6Yfyf7cw
         Vm7OqwWvmIaJ9NsWuhmJMr9/nRWI86zjg2E5tq+ef/R+2P+443H6DlEtQJs4kwrhFTPf
         +ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711725404; x=1712330204;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqNwX/X38tayRDAW4Zlj0+695u0d2YomcEbZiHh9vxQ=;
        b=SUTMB77KIb5CYpcnV0fHJdHHPmFaM4bdwWK62oRMXRYC6VKMO8nHfpi+YO7AwcUxHx
         RyvhLNyZK3qsl2CE7YbPJpvXgVUpyyhPq/ALuNdzRXe94GyDBBu1i2we0aai/YogtEG7
         gDM0SVcXrJQsMFEC/7Dy9WdntMks5RFCnF5OlXap8RKGSXDNB+WKnISQFdj34wilukjt
         h3ie86wHy+1KQV4WJD/HAKx/5kfg32o/0RUQJoaGMWi1VTPqatyRuP551AsP7C1vw+f9
         Yqu+iuogEiGWd7mB92Gew60G4B3GUmN72MPLN8+Kta7VqUGbspJaUXysm9Ibj0d509Yp
         g3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLRzPs8AUYxK8hOORPU2M4Otsr6cu6CatLB7jl66B87QfvjarRb5Uv0YGTHZqHsY3exO4YTx0GqtkYhq9SFNhEVcYeUTpxq8dOBHs=
X-Gm-Message-State: AOJu0YyF+CXKVaG2hgbJVh5dMEQnHnX2hXKvbsWIb2SXDrmD0ctonBsM
	2/guygd4A/WBsaz9xx+Hq+lFO6A4o902sqEH8P1Q3Civ8jl9Ty6p7HL6DNkUF4u5I6QoAu8zwBk
	ggUFLAopmcUb0gPySxVuVpFkYV3m2b6MgRByokA==
X-Google-Smtp-Source: AGHT+IG21XPIIeej7UxBpa2cGsWVRF31o4EA+Zq7Y09z8tl5e0tGI8gOndkj1llDUytkKUy8+WDfp10/Oe2W/IeM0aY=
X-Received: by 2002:ac2:5d71:0:b0:513:c9ca:1333 with SMTP id
 h17-20020ac25d71000000b00513c9ca1333mr1655888lft.22.1711725403783; Fri, 29
 Mar 2024 08:16:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Mar 2024 08:16:43 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
Date: Fri, 29 Mar 2024 08:16:43 -0700
Message-ID: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Hans de Goede <hans@hansg.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
> Hi All,
>
> I've already tried to fix this, so let me just copy and paste my half finished patch
> to explain the problem.
>
> I was planning on submitting this as a RFC patch at least, but there are also some
> other new issues with 6.9 on this tablet and I'm not sure how this interacts
> with those issues and I don't have time to work on this any further this weekend.
>
> Anyways below is the patch / bug report.
>
> I'm wondering if a better fix would be to add a "ready" flag to gdev
> and may gpiochip_find ignore not yet ready chips (we need them on
> the list before they are ready to reserve the GPIO numbers) ?
>
> Regards,
>
> Hans
>

Hi Hans!

Thanks for the report. I hope I'm not being naive here but would the following
one-liner work?

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ce94e37bcbee..69f365ccbfd8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,

 		gc = srcu_dereference(gdev->chip, &gdev->srcu);

-		if (gc && match(gc, data))
+		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
 			return gpio_device_get(gdev);
 	}

This would make gpio_device_find() ignore any GPIO device that's not yet
registered on the GPIO bus which is almost the last step of the registration
process right before creating the sysfs attributes.

Bartosz
