Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7228139D04
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711741247; cv=none; b=d0djzwNhdQ43qGfYao25+NU6fbq7p/5Q37E46cUi7Uxt7tfRUux1MhXRgWBAVev9cDW7JM8vYMnpJ+u8PC3ZNfvnu+6vDu5QjwVzsTREi9dNL5HL/Z4mNb+hv8vYVXhY5477fHrM9ptYYHwHI5u1ejz1Dj8+OBQrDChivNl9lo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711741247; c=relaxed/simple;
	bh=BOQI1k1tfyqL0tc7+yYdpT34753QIX3JP8lZfbTdaqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKO6AE8jQOiyC4zbEr2LWWIOuoYnvP7TyqB1KMAmnDD17irjMtgeD6dhy6glOGxvyWXUCpt6v7Vqp5LqhSl89+ZT5dMotpaXmxrllwp/pM7pJZl0tBPaGfi9rMRfHpww/0V4f5VTcFcCfJ51+K0fWbDJ3s6xi5NsGi7CcnrR7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmd+54DQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmd+54DQ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a466e53f8c0so295303066b.1
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711741244; x=1712346044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFomKtJ/ko5gP2de8iELQHNaNB6nelyPz/WP1+pjQaI=;
        b=lmd+54DQTk6QQCBoIzGd4Jv1glrYwkGm7p0QUKv7DFe8t8pn48lNSyzi9SwelscnLH
         VWY2eJ0LDBQzhOWfhfYV55T3UaupU5EfMzE3mrdZZoGdq7ASxABakTX08pACXcZeLmJD
         fwyIU3X+l00tg9QxNE4BTkBDTng+YAFZcJPWgWSI2fefqezVddbyyKaBa6Lfpmdn55PX
         gwvMLxuj2oWVvrAyQgrNAwTjZMWEU2vXYm+H8vNXL/GsYVw0xeAd/ck8JDa5V12ECRR9
         oYdZEZrIXvJRa40/E9vGBP45Q8PDcBHaf70hCwH3hEuFOi3xsWpgoj7l4R+1PpCf8I7C
         YqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711741244; x=1712346044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFomKtJ/ko5gP2de8iELQHNaNB6nelyPz/WP1+pjQaI=;
        b=cLe+NitKxWKdrnzBqvLU9pyKuO1BJxswCCqa/h9vqzxUIcCtJNPhVvSS5SgiDpAIir
         3ysg5R+O0U3po3po/uLWRjxd0sW+YEwvuuyc9v+Bim4brsX64b9uXQF3MtULQcytmG63
         r9tF7+LJaeKJae9VSCgQyezlnhp67fyHL3v47iuBKp0FvT45Tg1T44M+EnQ9utasZ/Yd
         VUOih9Fpmf21SMtbu/0/9mBq8/loeE6gpbwjNOF46H/9ZsVS5Lqkrf3ddtx9JYXrPPz2
         tkj8/R4IwvaNiFGbQegt87sVolwZgtZp2edsN+wp6Id4NwWI+Ssn+94Wx94xYzPyZ6Ds
         34UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh0i+Iu/0oDFldiRfIzfEj9bCz/aYrTU9lJcI+VsaW9Rly58hUW9AXNlqp8LeCHYd4mV7Fnrm0+OU2uH+b6WFFbyxoKbuTUDLC9P0=
X-Gm-Message-State: AOJu0YxjOy42ucC6S/THf4MVUJpzzFK3BrqYrFoeb7XvoJOdY+brX4MN
	XxjodpIzz/2lcipBB86ZAfKjeYOmuxm9JFtYoIoqWjUPWGxctWNV4JE7R7XD0+GgdVu4xsWncst
	CfU/o3QRZP/Q2yGG6iWu0PNvShM0=
X-Google-Smtp-Source: AGHT+IGEd5TAwHxcVRtd8OO7jcqTvMmHL9Tj1oNs1dYRZsLV0e01+/MQ6GAw59woWU5+V7U+VpgndoJAejiFMZ0RdHI=
X-Received: by 2002:a17:906:1699:b0:a4e:4369:236e with SMTP id
 s25-20020a170906169900b00a4e4369236emr591925ejd.41.1711741243955; Fri, 29 Mar
 2024 12:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org> <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Mar 2024 21:40:07 +0200
Message-ID: <CAHp75Vd3qQC6YY1Ysf2EqH9RFHQygX7HXP37Ju5p6BzsD7S3Ug@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hans de Goede <hans@hansg.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 5:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:

...

> Thanks for the report. I hope I'm not being naive here but would the foll=
owing
> one-liner work?
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ce94e37bcbee..69f365ccbfd8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *da=
ta,
>
>                 gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
>
> -               if (gc && match(gc, data))
> +               if (device_is_registered(&gdev->dev) && gc && match(gc, d=
ata))
>                         return gpio_device_get(gdev);

In case you are going with this approach, wouldn't be better to

  if (!device_is_register(...))
    continue;

  gc =3D ...

?

>         }
>
> This would make gpio_device_find() ignore any GPIO device that's not yet
> registered on the GPIO bus which is almost the last step of the registrat=
ion
> process right before creating the sysfs attributes.

--=20
With Best Regards,
Andy Shevchenko
