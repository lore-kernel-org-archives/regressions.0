Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F31876
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 21:56:14 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id j12so216970ybh.8
        for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EZ5q++YgykAGpmunP4misegIALHkWjqPtYqC2VXU0d0=;
        b=EJtxPtg7dBta1ocWaVmXeFyVO/Fb3XKx+YPBWIpfdoG8+4qvhGacxIFYFnoRVa9ihX
         48TG7nxBsmcmuQE75OzQjZInI0jpBDR78nEmbdu6u/Sxj4qmDpL9hbigkZrjgCCHEo2t
         Dw6pFYQn/jWQu3DqqkFE8L9+/5vJQmAmY/K4SJZE0CbMp1xHthRZ8srcDLxnBELwWvYp
         6HzczCqa3wRWxfxW/dMldH4MBzMGWaW23FWBO/HqUCJO2HFh1KMEG3sJ/iuSdjc5FScg
         zL7Yd65Rj13CIDMQ0F/CESvlPi5/+XFBpvq3HV1ZBAHmiS5bnFTzUKu+Wu+a7HY1TzgA
         PrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZ5q++YgykAGpmunP4misegIALHkWjqPtYqC2VXU0d0=;
        b=BX/8mDt9mky0xcrRqktzcD+nr3WhrSL04T8yvXoM+UJAHPKlzirdBrNUK33ybnMdex
         CS7T1SCakdBmhp4TLYVmqGX1aj1qSvYLkF3t9u4mtYDRkz4ofvwMwzL4HUkJmWDeZj++
         VyeAxdQKlQps2EV1Cc42EJiphXoQERojSJmGdMsoeWHNfvpUGqKlfFKA1WsMfMxNRF+y
         nUQ4Eq70nYkoMUTJFmCrcI4r5fb7Bzdum1VKqc2YRp9JeoP/v8IIEe/DaE+qL55uoQLh
         ZngSM2D4r5NtX6EVa8L6Xhj6jP9iINo66oX4hgNexXdyOm2sEI44Uh9hjXI0SPPnwGFJ
         +/IA==
X-Gm-Message-State: AOAM533l7QUGTHBe5HC6JMIra/CKyaKmoj6kYDSftV0sHem8ncXMwiiy
	Lj7n2x2FUxFLWzvzG88Jfr5N/O03icKf+WA0UqRn6A==
X-Google-Smtp-Source: ABdhPJzG0B+DhMonvyx1eAizm9Pr/8IzyJW1KRh1R1rK2yw6uE2Ix/pSISU0TKx7BOD9f6MfvQqvqmB2Bqzfyfuor6U=
X-Received: by 2002:a5b:f4b:: with SMTP id y11mr866089ybr.634.1644962173974;
 Tue, 15 Feb 2022 13:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
 <CACjc_5q247Yb8t8PfJcudVAPFYQcioREAE3zj8OtPR-Ug_x=tA@mail.gmail.com>
 <CACRpkda=0=Hcyyote+AfwoLKPGak7RV6VFt6b0fMVWBe8veTwA@mail.gmail.com> <CACjc_5r7i3HJ466MtwR0iZD6jdVXEqq4km0Tn7XwRijGnsDz=Q@mail.gmail.com>
In-Reply-To: <CACjc_5r7i3HJ466MtwR0iZD6jdVXEqq4km0Tn7XwRijGnsDz=Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Feb 2022 22:56:01 +0100
Message-ID: <CACRpkdZGVq19GZuOP1BwLB2-qxj1_=O9tHMVRvphvy3m6KbNig@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Cc: stable <stable@vger.kernel.org>, regressions@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Will McVicker <willmcvicker@google.com>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 12:24 AM Marcelo Roberto Jimenez
<marcelo.jimenez@gmail.com> wrote:
> On Sat, Feb 12, 2022 at 1:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > I am curious about the usecases and how deeply you have built
> > yourselves into this.
>
> I don't know if I understand what you mean, sorry.

Why does the user need the sysfs ABI? What is it used for?

I.e what is the actual use case?

> > > In any case, the upstream file should be enough to test the issue reported here.
> >
> > The thing is that upstream isn't super happy that you have been
> > making yourselves dependent on features that we are actively
> > discouraging and then demanding that we support these features.
>
> Hum, demanding seems to be a strong word for what I am doing here.
>
> Deprecated should not mean broken. My point is: the API seems to be
> currently broken. User space apps got broken, that's a fact. I even
> took the time to bisect the kernel and show you which commit broke it.
> So, no, I am not demanding. More like reporting and providing a
> temporary solution to those with a similar problem.
>
> Maybe it is time to remove the API, but this is up to "upstream".
> Leaving the API broken seems pointless and unproductive.
>
> Sorry for the "not super happiness of upstream", but maybe upstream
> got me wrong.
>
> We are not "making ourselves dependent on features ...". The API was
> there. We used it. Now it is deprecated, ok, we should move on. I got
> the message.

Ouch I deserved some slamming for this.

I'm sorry if I came across as harsh :(

I just don't know how to properly push for this.

I have even pushed the option of the deprecated sysfs ABI
behind the CONFIG_EXPERT option, which should mean that
the kernel config has been made by someone who has checked
the option "yes I am an expert I know what I am doing"
yet failed to observe that this ABI is obsoleted since 5 years
and hence failed to be an expert.

Of course the ABI (not API really) needs to be fixed if we can find the
problem. It's frustrating that fixing it seems to fix broken other
features which are not deprecated, hence the annoyance on my
part.

> And I will also tell the dev team that they must use the GPIO char dev
> and libgpiod from now on and must port everything to it. And we will
> likely have another group of people who are not super happy, but
> that's life... :)

I'm happy to hear this!

Yours,
Linus Walleij
