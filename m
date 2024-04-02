Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4686251
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067098; cv=none; b=QXz3Nnu95yvPlltytu7sHzYM9TjR5vRz2tnrrv7OT5n/18xfdxxn2IH86ew5q0MSs3J02nIKPJtnt3+wJn48CjTofpqNieAUTKi4P/ACeUdyFyU84jaLI+ynVkiPq5I6bODqNFytZpmz0XYdfTS4PZsTya6T1qpiYPxayCYu/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067098; c=relaxed/simple;
	bh=WCDRnY/oJd/DONLSqBRLIktLGw9RKMQ5gh8bjDiLz/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhIC3MxODFs5IGIBsE1TLSH0rZbd04tKacfJF8guAPl58jZMhPsOIiMUYFFrlcDx52jjZHmQ6Y+dzCf6++O6mMgvJVoFH5q0pXQjsyBJ2gCjOYmQ7Y/MNXYpzGoRy9eQN9Imyv1MsfmfB47+cKs013FcqlBsrIu0JseITYeqhWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnqICsR7; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnqICsR7"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5078573276.3
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067095; x=1712671895; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfAyyaKhDHVtWK5o5tUmbDJTiRRfvCRYxpLagrGb6Sc=;
        b=SnqICsR7hJAS0RHRZ8SYGtDkpK29J7Ie5s2UUJa0+AjzCotu8vn/31rF/tjGV+fL6g
         +/xggpQQ0owyhWH5O9Pdf7bvXxX3FSWy/HPrN+Y0F7D2EqaSc7TWAaWSf5sQUp8rhVuK
         rm5M0A38bUzG+/YO3WxCvjhxeT2o9BdnIlP0E9OMUxby0+rB/sqG2sGl21DwsjGgZFwe
         MqLbh/O74ZzgnYta79GqjtTC3ZJRD3b8U0nxZq/f6Mm6aE6PcUREE/KwGJJAnoFa1S3Z
         9iflfyEFNxYhu7tDw7zNiLqqeL+96LHUF0lB11BBW8jImU+EF+R9pAeXmu33xGVByy0Z
         oTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067095; x=1712671895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfAyyaKhDHVtWK5o5tUmbDJTiRRfvCRYxpLagrGb6Sc=;
        b=TWaC18gkSWCM5E44m0KizRYsjYA1IpJp0hmjb5qRRuKuajeSs2dd0t5wDcKEUqoukJ
         aPGNHjECXC9KnfFzo/YocNTi3bok7mrvDLzZbZNXhZCbsgwPkpeKesqWqcWRdIc2D7wz
         HDIotCRxiLptFKmuA0VCP5n09IWee6+oFqQE3JPjBM8hTNylH2O2ctfhP/+7x7Qc2JLB
         dqAexORKA6d8XGsA6VpcSFDF3I+dexU3/sYpN9dao4c+81NuJeU/KRMHaUIOh6dzqJ1K
         bHzZO2Cj2ubyfKOIPZUEo5H+pYExEmRQgvRQiOlslXSTUO4hJRbYzHBod7OJmiXa8NA9
         FqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyB4l7YPwixDdJokVe7xf8+fcjD2O9tD2X2FALwFsw5JwlcOfLvr2HnEy3cUwK7b/hKdSCrphtBvAXRsXLHJ5bHlR/2BoTBWgR6YM=
X-Gm-Message-State: AOJu0Ywz9/dTRb/4DCCn8vlkd1eETGo+wDu5bnegyXDuJrLkqCtwKnup
	155nbfNbBNMx8FTujjhKg2m7fC0nD5RL1hW2MNYaTJ/HxyoKOdAtebA9Z0R3GXgQvAsnc6cvRKK
	HkDEJ1MuUrMFbMD5D+ZN2hvgNEUd50QstKTpgZQ==
X-Google-Smtp-Source: AGHT+IHtJx+kBMaX8BpuA0YA7KnAAQyaJsPxHeu2fo45Gx0F5VaYXK6jNX2qhgMuRzBxoSq5A3qMV2Nb0evHRXeU1LA=
X-Received: by 2002:a25:6ac1:0:b0:dd0:702:577a with SMTP id
 f184-20020a256ac1000000b00dd00702577amr10226940ybc.35.1712067095531; Tue, 02
 Apr 2024 07:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
 <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
 <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com> <ZgwOIKSRcK5X9-vu@smile.fi.intel.com>
In-Reply-To: <ZgwOIKSRcK5X9-vu@smile.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 2 Apr 2024 16:11:24 +0200
Message-ID: <CACMJSeub8aTbRCwEpW=V5A_aoE4iY+eoa4tnV_XfnumaEmJGDw@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hans@hansg.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 15:54, Andy Shevchenko <andy@kernel.org> wrote:
>
> On Tue, Apr 02, 2024 at 03:41:00PM +0200, Hans de Goede wrote:
> > On 3/29/24 4:16 PM, Bartosz Golaszewski wrote:
> > > On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
>
> ...
>
> > > Thanks for the report. I hope I'm not being naive here but would the following
> > > one-liner work?
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index ce94e37bcbee..69f365ccbfd8 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
> > >
> > >             gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > >
> > > -           if (gc && match(gc, data))
> > > +           if (device_is_registered(&gdev->dev) && gc && match(gc, data))
> > >                     return gpio_device_get(gdev);
> > >     }
> > >
> > > This would make gpio_device_find() ignore any GPIO device that's not yet
> > > registered on the GPIO bus which is almost the last step of the registration
> > > process right before creating the sysfs attributes.
> >
> > Yes that should work and it has the added advantage that it also waits
> > for things like the irqchip to be setup before gpio_device_find() will
> > find the gpio-device.
> >
> > I cannot trigger the race every boot, but I do hit it quite regularly
> > and with this change I've done 10 successful consecutive boots, so
> > I believe that this indeed fixes the race.
> >
> > I've prepared a patch with this fix now which I'll send out shortly.
> >
> > As for Andy's suggestion I'm not all that familiar with the RCU stuff,
> > but I think that if we were to go that route then the device_is_registered()
> > check should be moved up to above the "guard(srcu)(&gdev->srcu);"
> > line rather then above the "gc = srcu_deref..." line, since in that
> > case we are not using the gdev->chip pointer at all if we bail ?
>
> I believe you are right and we need to move this check out of SRCU scope.
> (FWIW, I also thought the very same way after I had sent the message and
>  was hesitating to reply with that.)
>

Yes, there's no reason to have it inside the SRCU read lock section.
It doesn't protect the kobject internals. The variable checked in
device_is_registered() is a single bit. Once we see it as set, we can
assume the device is registered with its subsystem.

Bart
