Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBE1FBC
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 10:44:43 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7b91422da8so1086426276.2
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1693392282; x=1693997082; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kEkxxzA0TthGJR16AScaoyAkvW8C73WWinCGUiXZc+s=;
        b=VITYNb5EZq/NOgb+EdDUB2lf8gjlN8ei4Ns0ItS219qfuz8iDMsSMQ1R0Utz2Jr0VX
         eGqVzwyig3xdj9Yqx3Vm9/1sdp/3z9Xt0z8tHNc5iRNzjsneP0wBKoBzyzg7EC5Klwjd
         7iz/sfpB8fwjDMkW9oeJV1RGbPHvrJ+hJkD9XtlKUr6Lj/ULakjHEB6w1AhMg2CfgexC
         zVnFby+NWu1991Hr1yEMOXhP1he/XImU5IzTbgEo0LedqltRCwmZErruBeMfSXKILATa
         f8+SieIRDX/gC+IARftcxE4vcwW9sGUrKvRtglS2Vny1HwSvH64CCyJQkvtk+Hv10stA
         +Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693392282; x=1693997082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEkxxzA0TthGJR16AScaoyAkvW8C73WWinCGUiXZc+s=;
        b=RVtGrQpwln9mIJxWwv1SleysjVph1UUmtago8wGU4BmewsfZenIu/7ZUO6uhAI+mJn
         tGlEICTJ5SbqXJzbY5WcjOgTZjTWqpSGvTwiIwumhYjNU9NPwWhFfmiuwbXh1d2HrLAg
         JoLeo417p2jrmeTvloqbgWchpMvjlg3LGhGsoxZZm1IGkcg1EIUvicXsbNYIql3IoY76
         fGAP3RhLD5PwQ/WK1fz8Llz3cQkbRFFVSfvKjTA2A1q8V3GJuZCTFchLOstXwjgpX995
         Kf9B0JzpjLMixjVDLO4C+M2nZUU1+GOWUQZ402BNv2ezxDU3cAxCSDLAvW53pZF6CqQ8
         YnZQ==
X-Gm-Message-State: AOJu0YyHbeu5d0leT+9nT313RJZGJh2iRRGCVbfIUCv7QBc0VjWYzrPR
	T3FotVvk4VZpN/zkYXEOChFV3FDQxKSklQlOBwtzIA==
X-Google-Smtp-Source: AGHT+IEspIeeEeFYPYME6t2Gr5efuuQkhkeXO4wFGw/AOG+e06wL/S1SLrMT9JWVnuG+tyzq4OikRR9sJol1OhLm/p0=
X-Received: by 2002:a25:be08:0:b0:d78:21e0:c06d with SMTP id
 h8-20020a25be08000000b00d7821e0c06dmr1641099ybk.64.1693392282091; Wed, 30 Aug
 2023 03:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bc97ece5-44a3-4c4e-77da-2db3eb66b128@gmx.net> <ZOiP2H_6pfhKN3fj@zx2c4.com>
 <20e3c73c-7736-b010-516a-6618c88d8dad@gmx.net> <2a0fd8ef-8b43-b769-b4aa-c27405ead5e7@leemhuis.info>
In-Reply-To: <2a0fd8ef-8b43-b769-b4aa-c27405ead5e7@leemhuis.info>
From: Phil Elwell <phil@raspberrypi.com>
Date: Wed, 30 Aug 2023 11:44:31 +0100
Message-ID: <CAMEGJJ1c8=gxK=2C3pg7d0dFonNQqiBRM2PGRDBoQ_6=QP8uMg@mail.gmail.com>
Subject: Re: bcm2835-rng: Performance regression since 96cb9d055445
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Stefan Wahren <wahrenst@gmx.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrei Coardos <aboutphysycs@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, 30 Aug 2023 at 11:38, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> /me gets the impression he has to chime in here
>
> On 25.08.23 14:14, Stefan Wahren wrote:
> > Am 25.08.23 um 13:26 schrieb Jason A. Donenfeld:
> >> On Fri, Aug 25, 2023 at 01:14:55PM +0200, Stefan Wahren wrote:
> >
> >>> i didn't find the time to fix the performance regression in bcm2835-rng
> >>> which affects Raspberry Pi 0 - 3, so report it at least. AFAIK the first
> >>> report about this issue was here [1] and identified the offending
> >>> commit:
> >>>
> >>> 96cb9d055445 ("hwrng: bcm2835 - use hwrng_msleep() instead of
> >>>    cpu_relax()")
> >>>
> >>> #regzbot introduced: 96cb9d055445
> >>>
> >>> I was able to reproduce this issue with a Raspberry Pi 3 B+ on Linux
> >>> 6.5-rc6 (arm64/defconfig).
> >>>
> >>> Before:
> >>> time sudo dd if=/dev/hwrng of=/dev/urandom count=1 bs=4096 status=none
> >>>
> >>> real    3m29,002s
> >>> user    0m0,018s
> >>> sys    0m0,054s
> >> That's not surprising. But also, does it matter? That script has
> >> *always* been wrong. Writing to /dev/urandom like that has *never*
> >> ensured that those bytes are taken into account immediately after. It's
> >> just not how that interface works. So any assumptions based on that are
> >> bogus, and that line effectively does nothing.
> >>
> >> Fortunately, however, the kernel itself incorporates hwrng output into
> >> the rng pool, so you don't need to think about doing it yourself.
> >>
> >> So go ahead and remove that line from your script.
> >
> > Thanks for your explanation. Unfortunately this isn't my script.
>
> And I assume it's in the standard install of the RpiOS or similarly
> widespread?
>
> > I'm
> > just a former BCM2835 maintainer and interested that more user stick to
> > the mainline kernel instead of the vendor ones. I will try to report the
> > script owner.
>
> thx
>
> >> Now as far as the "regression" goes, we've made an already broken
> >> userspace script take 3 minutes longer than usual, but it still does
> >> eventually complete, so it's not making boot impossible or something.
> >> How this relates to the "don't break userspace" rule might be a matter
> >> of opinion.
>
> Yup, but I'd say it bad enough to qualify as regression. If it would be
> something like 10 seconds it might be something different, but 3 minutes
> will look like a hang to many people, and I'm pretty sure that's
> something Linus doesn't want to see. But let's not involve him for now
> and first try to solve this differently.
>
> >> If you think it does, maybe send a patch to Herbert reducing
> >> that sleep from 1000 to 100 and stating why with my background above,
> >> and see if he agrees it's worth fixing.
>
> Stefan, did you try to see how long it would take when the sleep time is
> reduced? I guess that might be our best chance to solve this, as
> reverting the culprit afaics would lead to regressions for others.
>
> /me wonders if the sleep time could even be reduced futher that 100

FYI, this is how I tackled it downstream:

https://github.com/raspberrypi/linux/commit/6a825ed68f75bd768e31110ba825b75c5c09cf2d

I can send a patch if it looks appropriate for upstream use.

Phil
