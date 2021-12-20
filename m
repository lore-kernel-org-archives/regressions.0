Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5632CA0
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 15:14:30 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id u40so18279534uad.1
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 07:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1RrQd9GJbr8VHOo3UvKL+r03emDIirUU1mO3qVTnuYM=;
        b=hvAG+sC6Xqp9sW5Ceu85F9GQ5l8H+PBExZY59U68+FDuiXzZ97D10FgmERX6hd+NUU
         62yfLO6aJugCSSxX1m1Z14wWO3YEf5I4PNOnvRbnEzvxVyW97GZ0biPHzW0Ni+6ZY+m5
         x/k1JQeewjpndYEP/rlZPbB6GlZ5kcuUJwrWzws24FSszDnfVGhtEVeIDapl9Ynuyo3c
         Prgyox2S0bKTNQXW8xwA0E4Sbov75lh4vlgtVzaC5kyGsaltNxnlYFRVSttz8O1p+CZk
         9LdTcgIksh1nrXzKPJk4e2S82VawtLhssDwrgG0VXk1ZH6TIsNTM4COIvS6IvoSnpu89
         itsQ==
X-Gm-Message-State: AOAM533pwAb0vp/TKc8oE/soqJejY+orN4qdtVrgGusRssjZmateKh/0
	ej1c3e04L/UEYsrFeETboOAMNcwNHqGABA==
X-Google-Smtp-Source: ABdhPJwqm4qZ2ZDEoLYegRHo0kxcfkPX11RsyvJbd6psiUQgwx4sjuTwJTZWFKo5tV0wQ8ywGa5iNA==
X-Received: by 2002:a67:f287:: with SMTP id m7mr1716570vsk.9.1640013269703;
        Mon, 20 Dec 2021 07:14:29 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id c69sm1746033vkc.49.2021.12.20.07.14.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 07:14:29 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id r15so18289219uao.3
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 07:14:28 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr5360780uai.89.1640013268654;
 Mon, 20 Dec 2021 07:14:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <a7fbb773-eb85-ccc7-8bfb-0bfab062ffe1@leemhuis.info> <CAMRc=MfAxzmAfATV2NwfTgpfmyxFx8bgTbaAfWxSi9zmBecPng@mail.gmail.com>
In-Reply-To: <CAMRc=MfAxzmAfATV2NwfTgpfmyxFx8bgTbaAfWxSi9zmBecPng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Dec 2021 16:14:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVp621B0DywkW6sx6wNcPFez9=3-=cfSo7UoRttJ6QXCg@mail.gmail.com>
Message-ID: <CAMuHMdVp621B0DywkW6sx6wNcPFez9=3-=cfSo7UoRttJ6QXCg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Will McVicker <willmcvicker@google.com>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 20, 2021 at 3:57 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Sat, Dec 18, 2021 at 7:28 AM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> > [TLDR: I'm adding this regression to regzbot, the Linux kernel
> > regression tracking bot; most text you find below is compiled from a few
> > templates paragraphs some of you might have seen already.]
> >
> > On 17.12.21 16:35, Marcelo Roberto Jimenez wrote:
> > > Some GPIO lines have stopped working after the patch
> > > commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
> > >
> > > And this has supposedly been fixed in the following patches
> > > commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> > > commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
> >
> > There seems to be a backstory here. Are there any entries and bug
> > trackers or earlier discussions everyone that looks into this should be
> > aware of?
> >
>
> Agreed with Thorsten. I'd like to first try to determine what's wrong
> before reverting those, as they are correct in theory but maybe the
> implementation missed something.
>
> Have you tried tracing the execution on your platform in order to see
> what the driver is doing?

Looking at commits that have related Fixes tags:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bf781869e5cf3e4ec1a47dad69b6f0df97629cbd
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=e8f24c58d1b69ecf410a673c22f546dc732bb879

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
