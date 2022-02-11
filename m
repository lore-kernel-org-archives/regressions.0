Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD17F
	for <regressions@lists.linux.dev>; Fri, 11 Feb 2022 22:36:35 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id o9-20020a9d7189000000b0059ee49b4f0fso7101256otj.2
        for <regressions@lists.linux.dev>; Fri, 11 Feb 2022 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrQU9kPhTmMT0JRjFGnOOsQus5ycZcO8eaHkc9H/feM=;
        b=jMgkG8SOtXPubi3dkZAAOA5uWohAGoFh5fwlc18aVLdpeQqoEwONp+sRhN/luGJeQf
         ylbfLxnl4BUo4RuBiEDOEiTru3K9aMVoe/nEtFSpxjsfZwSqTNUXQwhkdt75URLdjBgW
         X7SdrH7Ta+8hIXpU5+Ql/0YYw0O+RvLhegQv/jzK0JgTtP6iJ9WEmpB4Yo4o1h0nw35U
         2kRVFXhZkLU7FClnHgvgY9Kn19AfQdZUZU/J8QQqaSmp5FdjYXDSlevlzvcJjoNtYxQr
         eJtrcHieWSZZMalajbenSKec6V97OKF/GzS8iocps/YkQfi6Ff4qzoQEc2vTOuZdj0SM
         S4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrQU9kPhTmMT0JRjFGnOOsQus5ycZcO8eaHkc9H/feM=;
        b=Y3MtKy7qvVAkYsBX+CcignhJYfyy4iWPoDAhuH+P8mB/cVH3hsWn1hBG7N+uyR0GyD
         3JY97bXpQyiieLMA7O4cPsPF357HCzlY57rojK1ckZAMQoPtZHzoosRjb6EK8LGmYLCI
         Mp3znzrqiZ6tS8vVEFjjtv+ba5xm4RrJI28a+7TrP6CudBkTHZvVuS368p3SM0yLoVti
         PyEKCRfidVbuRSnf6njLvaenPihfelg/ezPsZhjE5oDyoEwAgihhMXLGf8JNU+d6tA2t
         9JHv+vMAyfYd0RmP5oy+qX1VEQ6sPuno1zYcFGYh9FPsAIXvfzGDGG487Aom8vwtRyaG
         feNw==
X-Gm-Message-State: AOAM533fO8PhxVDsb3wmJ7u25hw6E0LH7Y1hw9OL/FPYqXUTtO8qB7KS
	VVvd26P1lEKTtLyA1z1DpVJt1vNF+AHZlOcaRhU=
X-Google-Smtp-Source: ABdhPJyOhyYlzGFY9SbnMJlo6NVxz1wof4C0E0HUqAqA26wcjYkxPW1erEqe97d0n/2oKUEN1N0XjmaIVwiLs9bp84M=
X-Received: by 2002:a05:6830:4422:: with SMTP id q34mr1370577otv.312.1644618994685;
 Fri, 11 Feb 2022 14:36:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com> <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
In-Reply-To: <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Fri, 11 Feb 2022 19:36:08 -0300
Message-ID: <CACjc_5q247Yb8t8PfJcudVAPFYQcioREAE3zj8OtPR-Ug_x=tA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Linus Walleij <linus.walleij@linaro.org>
Cc: stable <stable@vger.kernel.org>, regressions@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Will McVicker <willmcvicker@google.com>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 10, 2022 at 9:02 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Dec 17, 2021 at 4:36 PM Marcelo Roberto Jimenez
> <marcelo.jimenez@gmail.com> wrote:
>
> > My system is ARM926EJ-S rev 5 (v5l) (AT91SAM9G25), the board is an ACME Systems Arietta.
>
> Which devicetree or boardfile in the upstream Linux kernel is this system
> using?

arch/arm/boot/dts/at91-ariettag25.dts

But it is worth noting that the first lines in this file are:
/*
 * Device Tree file for Arietta G25
 * This device tree is minimal, to activate more peripherals, see:
 * http://dts.acmesystems.it/arietta/
 */

And also that the URL in the comment above is old and now it should
read: http://linux.tanzilli.com/

In any case, the upstream file should be enough to test the issue reported here.

> Yours,
> Linus Walleij

Regards,
Marcelo.
