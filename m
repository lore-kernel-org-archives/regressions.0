Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0749242D77
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902110; cv=none; b=CLGf+cpPkANuYSwSZU7Q1eXvtoIBl5aLO+lXSlz4OqrOx9Z7ihPbU9hRPQIA8iAPI9dkcMjS97kZ7lz1ByuUMPUrRdftZVHo2qtR5zBvGhsy8ck37/Jn+TiZJZpCCQkQXGheLG1O2hn3IvwKGR4nR8epghypUz1ssy8fO10e08U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902110; c=relaxed/simple;
	bh=VqOCPkWUr9CZnMaCodKIveASZIVnzNQmiel7M9LF6tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFReiXN/jdIr4065OzvB04ajzwQ9CV2HZZBz7AXvbwkSOr5I38CM9/H2rOPmBTHm7qHfqIZoBoQYYxVr/8L0LeUrm33+vHNewjfUW6NyWK+yfFAaLHXQa3uXPP1N8ilssZvLYrxSewLmHY12IQVSK0/2uyL3Zr2S42tiZkNQe7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aq8p8Ao9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aq8p8Ao9"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32909637624so55159491fa.1
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747902106; x=1748506906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW+uhUhcGi/qFjEIYz1RUaPA9UVbNHNQ6EqB73r6lsU=;
        b=aq8p8Ao93y6a9qMMTgGhFCeppzi2fPOPwnNXDq0SVtPagOc2gXEBw3JQYXjLGOCxP2
         5hZcZinoO3eqaSjJ12QvPToXMM2xDuSUfbwBquSBOKAeZOSRDodLJae0Fy0W1qH/6yC9
         yG16O7fOyLgLd7a9/znG52APXvmfSx4mM2ypzk5cXGyBcfTlQo7X/BTpYE653rgmSXzD
         IBVgeBck2M+JEZXBZ6SvtDVwzMvM2hTq80af5L+B0ajlB85E7/FVLRybW2mIX06E90yJ
         QtFw0TGWs1XLvA+7S3c9gV7a2pyZUd+365rv5vqqagKH7oa2A6mDjkwh/C16HDgCRFS7
         lAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902106; x=1748506906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW+uhUhcGi/qFjEIYz1RUaPA9UVbNHNQ6EqB73r6lsU=;
        b=qU3x4WmADgDIWnTe7UFPqKd+pnzD/vT1cGmjdD7XKUhuek1FSqXL5l4Ax4OMLA38y0
         MadfqupX8ypnvviWrwJN6XHTej7YVlJmDpX9mQxytT8CErgfcjV9Lodc4KJtG+ZHsTNZ
         DBZxmWs9QniILNg1w8QHtoh6LYjA6Gz+KsqUrNyuki+B2kdHEsxNyfn5JGARq+BhhhAd
         vX2Qg0+ScRkyTVam9KPcOn6Bp/E3Ao7nI4/s8Z+H59eRykutTiWac/pQpFDaPlH0YmGk
         6vY5zOZ5FlpW6/BEWlPx9WZSlARL5R9uoMpsGuKWyz++rDBmvTt0DqDv0IZLD83BOGGA
         Rg+w==
X-Forwarded-Encrypted: i=1; AJvYcCWd7TFVMi6dbGhX0HUkyeHvX5hCulJE1i/UYPxnKqSERyU39AlkDfmbQI7qJaDxzIQz8uwHYfNDIyHpVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC00IOQDX4slUN8e8ozdn5v8IbirmZcsw0bMzCd0TD2mg/IrAV
	QD/OOQTnZeRwa37HWTKD52eB4TH5iJyXPcTPC6E+rOrpPo/4awOQjhfxDlGpWjxFYYmq3VzaNi7
	FLonkuuk5m91hY6XK+UEpTG/30xP1DXLzx9LvI+drwQ==
X-Gm-Gg: ASbGncsORIL890KpgAfjT2J9NXLpTNwvOeVW8zH6BJ+raI9BemEJ60bql3k1806q9qF
	HV9nt6SClEja1TCIeHSVBMxsXpp8Ps5s6wOwJLwAMTIZBB3fRIGqOkrXbDxylJ85GLJdaMDEPTI
	V9R1LLd/AfzwJ9srzENRtysEiM2DFxqBAG
X-Google-Smtp-Source: AGHT+IFuVWqRIf+xf4DijNOl0IDx8Qgv/jtCzf68FUzLuSbdLNyij11XpLfpriSkG3Sjekzh/okS+B8fvY52d+Rfu1M=
X-Received: by 2002:a05:651c:2214:b0:30c:518e:452 with SMTP id
 38308e7fff4ca-3280771e0c9mr84948681fa.13.1747902105732; Thu, 22 May 2025
 01:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AM7P189MB100986A83D2F28AF3FFAF976E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <8d249485-61f6-4081-82e0-63ae280c98c1@heusel.eu> <3352738d-9c0e-4c23-aa9a-61e1d3d67a50@hotmail.com>
 <AM7P189MB10092C41B59EF58CBCB290A2E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <60a9ea8a-edb1-4426-ae0e-385f46888b3b@heusel.eu> <AM7P189MB1009A8754E90E4DE198DAC32E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <AM7P189MB100943AF796568B45AB7099AE399A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AM7P189MB100943AF796568B45AB7099AE399A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 May 2025 10:21:34 +0200
X-Gm-Features: AX0GCFts_N2nJIo0yBksSJy-pd69zxVe0kQhRD0A3krKVPkQ2gCk7ftDFl_F9N8
Message-ID: <CACRpkdaG5NNbfPhBMgCRUXqy_j5f=KaT75r9iQMg1HAyrAipoQ@mail.gmail.com>
Subject: Re: Panic with a lis2dw12 accelerometer
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Christian Heusel <christian@heusel.eu>, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 9:15=E2=80=AFAM Maud Spierings
<maud_spierings@hotmail.com> wrote:

> I have found a fix but I don't know if it is correct to do. This deals
> with the deferred probe correctly, no longer panics and registers the
> device properly. This is the patch I have come up with:
>
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c
> b/drivers/iio/common/st_sensors/st_sensors_core.c
> index 1b4287991d00a..494206f8de5b0 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -231,7 +231,7 @@ int st_sensors_power_enable(struct iio_dev *indio_dev=
)
>                                               ARRAY_SIZE(regulator_names)=
,
>                                               regulator_names);
>          if (err)
> -               return dev_err_probe(&indio_dev->dev, err,
> +               return dev_err_probe(parent, err,
>                                       "unable to enable supplies\n");
>
>          return 0;

It's the right fix.

If you look in drivers/iio/accel/st_accel_i2c.c clearly the driver enables
the power before calling st_accel_common_probe() which is where
devm_iio_device_register() is finally called and the IIO struct
device get initialized.

And that's not all: st_sensors_init_sensor is also called before the
iio device is present, so this:

        } else
                dev_info(&indio_dev->dev, "Full-scale not possible\n");

and this:

                dev_info(&indio_dev->dev,
                         "set interrupt line to open drain mode on pin %d\n=
",
                         sdata->drdy_int_pin);

is also unacceptable.

I hope there are not more...

They also need to use indio_dev->dev.parent, or a local copy of
that struct device *, so please fix them too in the same patch.

I tried to chase down a Fixes: candidate but this misunderstanding
goes way back and such prints were introduced several times.

I would just tag on
Cc: stable@vger.kernel.org
and be done with it.

Thanks for drilling into this!

Yours,
Linus Walleij
