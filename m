Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867F369B
	for <regressions@lists.linux.dev>; Thu, 17 Mar 2022 08:38:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bg10so9159745ejb.4
        for <regressions@lists.linux.dev>; Thu, 17 Mar 2022 01:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxRIhMtIGNyuquPw1lmiPJQSJaGq9K+fhRuZGp4hFSw=;
        b=ij5/WzoJfQisplvcvRzMcZbis0DL0CSs9Z2z8zmQXhHH03o0i7whAhVUcmSgaIIStE
         ct0EAwRbaSVhJLVKDmxAXxkuuz1Wh4YZemlEbncEe3wT3mQMWbNEJR7ycMiS8GNNbTqU
         i1QrKrRJnAHvbCsxkYo883M4xF9dSJjmlW4nrTn1/Nt4wczQ3TRvjnd+DCscDcIVmNlN
         7/mtlso0lfs1R4v5sHuegjpbIj+25Wf1QdF77lP/kkA0jmjzVOwYXUiuIyJ6G/FH5vMd
         Y1BH20uCcHYoycllNyAs1JB2y0ayf1wnGfuZAQqZZTMNg6eavsMz6xPeJlGCjX7TtqRj
         nHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxRIhMtIGNyuquPw1lmiPJQSJaGq9K+fhRuZGp4hFSw=;
        b=NyFnqQ/zvPWxRZEtNTyqhDvc3EX1v+CYYdWIWAQM+M5qBKWBVwwg+g6a6Rdk83815A
         pn5Hp5qDw1PygBuOy/K4M1H7+X9xE2X+gaVlIJD9amhnB8ZFK8fbz4Dx00ryBULHv3E6
         15+IOUKd15XVL5Lz/V/827d8ZVp4HwAnp6TXBJL+PEFLiJwAg0Rj6FXDjHl7FSKwictq
         tenT6GNcRrwRyeTbXLc/mFlWEpgwTquPOd2BYuPR7fE3fGWB8+8LuCGwl13k50mWWls5
         hdwy/IKfevG5S286G1igGwVfpTy9lTb9FD9akoAZsBnf95KI2m7crNA6dJAmWLGSwKqP
         CEcA==
X-Gm-Message-State: AOAM533xTMOOTGao9gDBDz/EIYNq6ufYbv/t6w7l5yKbLdgmLuUkhKPN
	Rtibhi8mscSbqNl2RzhfWsWU+cwcMa7kSbAGy0I=
X-Google-Smtp-Source: ABdhPJzKY289Ymbui0103ayg4U18iS7VJLj7hCueAp3BfI5ctm34/W2tHc27SGZJA/vNwLVlKykI67UuFIdov9SsEBs=
X-Received: by 2002:a17:907:7289:b0:6df:9746:e7c4 with SMTP id
 dt9-20020a170907728900b006df9746e7c4mr1391329ejc.497.1647506330740; Thu, 17
 Mar 2022 01:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <20220314155509.552218-1-michael@walle.cc> <CAMRc=MfH00YJv07TaiZ5z1w4gzqP5_8z9bKFcNU1Z37AVih4hQ@mail.gmail.com>
 <fe1ba600b2b30b4cba702d6aebdfda50@walle.cc>
In-Reply-To: <fe1ba600b2b30b4cba702d6aebdfda50@walle.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 17 Mar 2022 10:37:37 +0200
Message-ID: <CAHp75VeoFQHAh6SbVu7fsXfziW+2RoFTWKA6jFhFswBbazzGAA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Michael Walle <michael@walle.cc>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Saravana Kannan <saravanak@google.com>, 
	Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>, Andrew Chant <achant@google.com>, 
	Edmond Chung <edmondchung@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, regressions@lists.linux.dev, 
	Stephen Rothwell <sfr@canb.auug.org.au>, stable <stable@vger.kernel.org>, 
	Sergio Tanzilli <tanzilli@acmesystems.it>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Will McVicker <willmcvicker@google.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 7:36 AM Michael Walle <michael@walle.cc> wrote:
> Am 2022-03-15 16:32, schrieb Bartosz Golaszewski:
> > On Mon, Mar 14, 2022 at 4:55 PM Michael Walle <michael@walle.cc> wrote:

...

> I started to try this out, but then I was wondering if there weren't
> other gpio/pinctrl drivers with the same problem. And judging by the
> reports [1], I'd say there are. Then I wasn't sure if this is actually
> the correct fix here - or if that old workaround [2] doesn't work
> anymore because it might have that empty ranges "feature".
>
> To answer your question: I don't know. But I don't know if that is
> actually the correct way of fixing this either.
>
> >> Also, I'm not sure if there are any other other driver which get
> >> broken by this. I.e. ones falling into the gpio_stub_drv category.

I know that OF is a mess, but I want to understand why in ACPI we
haven't experienced such an issue. Any pointers would be appreciated.

-- 
With Best Regards,
Andy Shevchenko
