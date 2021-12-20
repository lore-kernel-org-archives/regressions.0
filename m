Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582292C9D
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 20:42:01 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id b1-20020a4a8101000000b002c659ab1342so3438796oog.1
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 12:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRvhlXLq7L2YbTCbc1T1kLAsYxro2S3SeoZnogVM8pY=;
        b=ZvD1Th8rpbQRSrioTCscGQZd7Z2rdh/FlGxKSl8P5IBz/+JlSMyMV86iRVOlEP5Gaj
         WKWq1WVjhYCAZToQLKIsWSgUcFj0Tb4aijNJ2lClVU6RNeaQjcZgDhn/jZsUalgBZoh5
         WkVYMFUFkrRgbP+lkn//4bL4NK+yH1UuRieGk+o2do/xdf5ppW/WAwYUfS1jp0L5A60c
         jSngayaVl4dBuaJZDq56gbUSpmCMKWrNQHut7LV+0KQcT14/twBxY8CYBxGgXQGFL4Fo
         o5rlqr6Mt3cHqyKtDWbtzmklk6OG4R6i+cf/P9Zx6i2P9TDxzgoq0aXcxU3z1xkUg2pT
         NYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRvhlXLq7L2YbTCbc1T1kLAsYxro2S3SeoZnogVM8pY=;
        b=5G/PVgHGMkVpZ7a/PiuTUM1P3Zk4pkDcJt/UoXgcraJ+Eo6kzclMfvnino/QCtCohY
         mNR7z8zp4Rr4Y5CAdVo/54oFhfr4Hd9egu52LKCHyElkZ6eUi1TyUw0jz7ocS/x1pZj2
         rsLVvmEJ2IdOQFR/D7cTvZziBLZzIr2XbKoXeB1FmQ/F3MAT1zLfWE1CwkrujTAWKrEq
         LtO1x/kjqnE6AhnG7cADO1GjY/8sdBNdbwf42dJNM6vYArbCRKal4oMz2RF/reKx+Jm1
         zoaqe/nm1Y4AWto4RXE7sBZrqhpHOprxpVg1x9BynQV4vshO82EnUq0YTZIkAucR2buP
         +t7w==
X-Gm-Message-State: AOAM531v6tpxVXdORcZtVV8M6EQdXjMDw+cYYpHeRl926Za4aor7Sc0F
	BQiarWvSKi2smQWQs0mVjjf5A/P1mi/9I8dpb1g=
X-Google-Smtp-Source: ABdhPJy1MZs4O+yyJBNYKMLmmBoVIsXRs8uqhfPBXDSfWex6X7qLQ7uu2VtlPx2eCyvlficUTrBR3AAGoUG9iNqDV8M=
X-Received: by 2002:a4a:3511:: with SMTP id l17mr11541366ooa.74.1640032920411;
 Mon, 20 Dec 2021 12:42:00 -0800 (PST)
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
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Mon, 20 Dec 2021 17:41:34 -0300
Message-ID: <CACjc_5qaGFiuTyEHt5sy_EkCBd6bGgQp-T19GyATQw=jeoLGpg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	stable <stable@vger.kernel.org>, regressions@lists.linux.dev, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Will McVicker <willmcvicker@google.com>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Mon, Dec 20, 2021 at 12:14 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
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

Interesting. These seem to imply that gpiolib-sysfs.c should be
allocating a pinctrl list. That seems very easy to do in the DTD,
although I don't really know if that is the right thing to do. Doing
it in the code seems more appropriate, what do you think?

> Gr{oetje,eeting}s,
>
>                         Geert

Regards,
Marcelo.
