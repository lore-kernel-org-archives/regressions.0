Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530122C9D
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 20:42:09 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id g11-20020a4a754b000000b002c679a02b18so3427522oof.3
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 12:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86q6mGPUW4i0Ae9W5pTbC5IqFkYxCsVwOjM880qisKg=;
        b=om8J+juci05U81DBgVnGqUJ2oUdCRZjDGd+lGjYueYFIttOeh20S3wNcK0h9moIAzk
         IQxo/eyZJEFIB+q/HWK+qCJWRdWnVgsvqSrrgM5qExdMz63vG4tKPwWAboM/THwOTMGc
         OPsWv6mJ2uXWixt3ujBgcjIXew/hxKA/u2qMU7Z/QvDg5E9YO8fyPF+hixeZ1pFjYT0x
         egwkZiyzedSrtqeweQvnXlzg25nksNIyUH475e7v2L0c+PjfwRjuEhZPuGw47rtCCLc6
         db4NOM5sK/A1RS0eDlZqXteuu8ayFKmc5mQ7bwmqgFl5JKIC2mmzRfT4RgYtGs4UFvyo
         mDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86q6mGPUW4i0Ae9W5pTbC5IqFkYxCsVwOjM880qisKg=;
        b=uwQ2AaNLfB9CCLtxdQMeHokklw52sUrMLL9u+J2fqgcIIjkSBlgyjaiMVuAcnBziSN
         VQbL0wsSfs7w5cdA1TZqJoiQ3rTN4qYRQ2uqZA9EubJ9kRH1gbNKD7fp1G+QM4BkhyXz
         gP/5FszZt5qbQa1Rwqb5msSNhdwJz5SVTUyzMCVbdyh112TyPSVris9wn9EBE1YRU+Ck
         /9WATJzVdoJJNztzcfmghQlF3SjpIWFirS43PS8XhZQICD+cZk6E25eRlCMfjG7OrK8L
         r0ez9x+6Q82r0651AIK7zQUHhLsd6Zugd9to+8J8hpsPMntPCArW1q/ZcP5c0cdNIsDf
         CL/A==
X-Gm-Message-State: AOAM533TSPl7yc3+s8kqSR+Q5cdr8hzdfOBnKO1ctRFeYAXT93IynLY3
	xl/AQbpTQNzZJAboIVc6QOdDE4VZwlanc4Asteg=
X-Google-Smtp-Source: ABdhPJyqqffSkXvODMEsCx/EpSsjjcIv17gUSuEsOTyhqF1IRS3Rg2WkKFZFauMLFilHPkk/OwChKQe91ycOPT/7fcg=
X-Received: by 2002:a4a:9406:: with SMTP id h6mr11394881ooi.80.1640032928320;
 Mon, 20 Dec 2021 12:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <a7fbb773-eb85-ccc7-8bfb-0bfab062ffe1@leemhuis.info> <CAMRc=MfAxzmAfATV2NwfTgpfmyxFx8bgTbaAfWxSi9zmBecPng@mail.gmail.com>
 <CAMuHMdVp621B0DywkW6sx6wNcPFez9=3-=cfSo7UoRttJ6QXCg@mail.gmail.com> <CABYd82b2i4Uuyi5+zLoTgiC-QMS1y=VkwmMznZqxLca0iP9qTQ@mail.gmail.com>
In-Reply-To: <CABYd82b2i4Uuyi5+zLoTgiC-QMS1y=VkwmMznZqxLca0iP9qTQ@mail.gmail.com>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Mon, 20 Dec 2021 17:41:42 -0300
Message-ID: <CACjc_5qQv_vWawtbA8O01EaiY6GqSXQYs0jgC8XLAGYuwtnUUg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Will McVicker <willmcvicker@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Mon, Dec 20, 2021 at 4:25 PM Will McVicker <willmcvicker@google.com> wrote:
>
> On Mon, Dec 20, 2021 at 7:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > On Mon, Dec 20, 2021 at 3:57 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Sat, Dec 18, 2021 at 7:28 AM Thorsten Leemhuis
> > > <regressions@leemhuis.info> wrote:
> > > > [TLDR: I'm adding this regression to regzbot, the Linux kernel
> > > > regression tracking bot; most text you find below is compiled from a few
> > > > templates paragraphs some of you might have seen already.]
> > > >
> > > > On 17.12.21 16:35, Marcelo Roberto Jimenez wrote:
> > > > > Some GPIO lines have stopped working after the patch
> > > > > commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
> > > > >
> > > > > And this has supposedly been fixed in the following patches
> > > > > commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> > > > > commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
> > > >
> > > > There seems to be a backstory here. Are there any entries and bug
> > > > trackers or earlier discussions everyone that looks into this should be
> > > > aware of?
> > > >
> > >
> > > Agreed with Thorsten. I'd like to first try to determine what's wrong
> > > before reverting those, as they are correct in theory but maybe the
> > > implementation missed something.
> > >
> > > Have you tried tracing the execution on your platform in order to see
> > > what the driver is doing?
> >
> > Looking at commits that have related Fixes tags:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bf781869e5cf3e4ec1a47dad69b6f0df97629cbd
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=e8f24c58d1b69ecf410a673c22f546dc732bb879
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>
> Hi Marcelo,
>
> Thanks for reporting this issue. I can give you a little context on
> why commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not
> defined") was created. We were seeing a refcounting issue on Pixel 6.
> In our kernel CONFIG_PINCTRL is defined. Basically, the camera kernel
> module requests for a GPIO on sensor enable (when the camera sensor is
> turned on) and releases that GPIO on sensor disable (when the camera
> sensor is turned off). Before commit 6dbbf84603961, if we constantly
> switched between the front and back camera eventually we would hit the
> below error in drivers/pinctrl/pinmux.c:pin_request():
>
>     E samsung-pinctrl 10840000.pinctrl: could not increase module
> refcount for pin 134
>
> In our kernel the sensor GPIOs don't have pin_ranges defined. So you
> would get these call stacks:
>
> Sensor Enable:
>   gpiochip_generic_request()
>   -> return 0
>
> Sensor Disable:
>   gpiochip_generic_free()
>   -> pinctrl_gpio_free()
>
> This led to an imbalance of request vs free calls leading to the
> refcounting error. When we added commit 6dbbf84603961 ("gpiolib: Don't
> free if pin ranges are not defined"), this issue was resolved. My
> recommendation would be to drill down into your driver to figure out
> what happens in these functions to see why you're getting the results
> you reported.

Thanks for your reply.

Commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not
defined") is perfectly fine in the context and fixes a serious issue.
But to revert the original patch we need to revert this patch too, for
the same reason, i.e., in order to not generate a *_free() imbalance.

In my case the imbalance causes problems as soon as the test script is
run a second time.

>
> --Will

Regards,
Marcelo.
