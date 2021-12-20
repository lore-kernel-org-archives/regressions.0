Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ACA29CA
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 19:25:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z5so42671823edd.3
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJjZyoMEz6X8QZ+nRT7KOb+gfe1I0SKawSZhB5aruPE=;
        b=su9Y/CkoSWxaKwldVUT3CtIth3TGerz4kcfFjRhC7bTsjdv4Abi95GgngqUTRyQLdg
         Z6502yXJ4duoRlNaN8uoTwE6l6zTa3vLgV3eM+V1ZQE/FkGKMJzt41vqxTkdk+rAN1LE
         e9H6bf3rdhQeD97x20QTm4H+qjCIIWKDxPFHgJ47w5ra+2M+7m/rFeAuF4xwfW4D3nFe
         oOXR55YAuvcbrDNutAVFCaNTyWOWraWO6/tCcNCuUOXCk2ODkyIVBlsGQ8BYIJZAPHhX
         SPFDyYwv8NUEqIFOlbhd7UzvT2En2xHriDsvMEnw7+5e9r8dEcMfqiVkzeFnfeFNeEn+
         PS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJjZyoMEz6X8QZ+nRT7KOb+gfe1I0SKawSZhB5aruPE=;
        b=HWNA6A/ylrRDGoO6xSXVsX7hsvKtar0bf+/ZWrWoykzZ/P9rzS/FxdNx4uuJhTJlTy
         Hosh2KTcRg5R7QVXaKuAu/2Oz+G+r6Bb0OXJHF3zHgK1eq+ip6DCWuU67dOS5jD6LiZf
         y0OolUnGRqajDTMWHO41ez+cVIQKTou/gOWb5hksW9DZqs0pH0+ceBqG0S4KqvH0Zimf
         QL7AooqRkbpNkjI10+1ZB1/XE2/XF8KZ61kncKM2jMVv0IrdKmRK9Kx/v3eLlgrxs84k
         5/XPXLv19VbBRtDrCWpb5hRCogAlcWt6okYAc+b0+BXKTmgV0OnMeJ8ZjePqb7NcVPXH
         Ir7g==
X-Gm-Message-State: AOAM532zqSQ/zU5GALidTUjMm5fhzRf1q7cO73Dgi5zQjxLBCMgz5t7e
	5gGOoCinqMt9UJ1lTufhRMshiw3HRNi7Hm5XlSPGOg==
X-Google-Smtp-Source: ABdhPJx187CSWNjhZ46xw6UV3rJD4dVrv+U4cX641iKcm/e2YLbtgl7O8tXfKBWjOem/Az6G1NnVK/BmC9zObylBPo4=
X-Received: by 2002:a05:6402:3488:: with SMTP id v8mr17458750edc.398.1640028310148;
 Mon, 20 Dec 2021 11:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <a7fbb773-eb85-ccc7-8bfb-0bfab062ffe1@leemhuis.info> <CAMRc=MfAxzmAfATV2NwfTgpfmyxFx8bgTbaAfWxSi9zmBecPng@mail.gmail.com>
 <CAMuHMdVp621B0DywkW6sx6wNcPFez9=3-=cfSo7UoRttJ6QXCg@mail.gmail.com>
In-Reply-To: <CAMuHMdVp621B0DywkW6sx6wNcPFez9=3-=cfSo7UoRttJ6QXCg@mail.gmail.com>
From: Will McVicker <willmcvicker@google.com>
Date: Mon, 20 Dec 2021 11:24:53 -0800
Message-ID: <CABYd82b2i4Uuyi5+zLoTgiC-QMS1y=VkwmMznZqxLca0iP9qTQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 20, 2021 at 7:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Mon, Dec 20, 2021 at 3:57 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Sat, Dec 18, 2021 at 7:28 AM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> > > [TLDR: I'm adding this regression to regzbot, the Linux kernel
> > > regression tracking bot; most text you find below is compiled from a few
> > > templates paragraphs some of you might have seen already.]
> > >
> > > On 17.12.21 16:35, Marcelo Roberto Jimenez wrote:
> > > > Some GPIO lines have stopped working after the patch
> > > > commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
> > > >
> > > > And this has supposedly been fixed in the following patches
> > > > commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> > > > commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
> > >
> > > There seems to be a backstory here. Are there any entries and bug
> > > trackers or earlier discussions everyone that looks into this should be
> > > aware of?
> > >
> >
> > Agreed with Thorsten. I'd like to first try to determine what's wrong
> > before reverting those, as they are correct in theory but maybe the
> > implementation missed something.
> >
> > Have you tried tracing the execution on your platform in order to see
> > what the driver is doing?
>
> Looking at commits that have related Fixes tags:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bf781869e5cf3e4ec1a47dad69b6f0df97629cbd
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=e8f24c58d1b69ecf410a673c22f546dc732bb879
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Hi Marcelo,

Thanks for reporting this issue. I can give you a little context on
why commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not
defined") was created. We were seeing a refcounting issue on Pixel 6.
In our kernel CONFIG_PINCTRL is defined. Basically, the camera kernel
module requests for a GPIO on sensor enable (when the camera sensor is
turned on) and releases that GPIO on sensor disable (when the camera
sensor is turned off). Before commit 6dbbf84603961, if we constantly
switched between the front and back camera eventually we would hit the
below error in drivers/pinctrl/pinmux.c:pin_request():

    E samsung-pinctrl 10840000.pinctrl: could not increase module
refcount for pin 134

In our kernel the sensor GPIOs don't have pin_ranges defined. So you
would get these call stacks:

Sensor Enable:
  gpiochip_generic_request()
  -> return 0

Sensor Disable:
  gpiochip_generic_free()
  -> pinctrl_gpio_free()

This led to an imbalance of request vs free calls leading to the
refcounting error. When we added commit 6dbbf84603961 ("gpiolib: Don't
free if pin ranges are not defined"), this issue was resolved. My
recommendation would be to drill down into your driver to figure out
what happens in these functions to see why you're getting the results
you reported.

--Will
