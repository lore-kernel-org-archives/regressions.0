Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E92571
	for <regressions@lists.linux.dev>; Mon, 25 Apr 2022 18:41:26 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id i27so31338805ejd.9
        for <regressions@lists.linux.dev>; Mon, 25 Apr 2022 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mya3nkIwUh+TIu4djYFcQK6BbUW1zaOYt4akasWqvFg=;
        b=B9KKXsLTpzuVV8sBlKnNNvWObeafflqmJvR/smeZgdhpHe7uFZ496oEr1jZfzXMymA
         pVVpZlQzDspkhMyYyU2BEn3cLLzy+4K1AJIP8KNuHHK2F4+OXzHT0Lx4MAnyADwSC2fz
         C3xXlkkJaCxNbA2z0qwrIsYi0VRxXQVfQNb4GKBP2wWkiow6GzhhujMirqo82yf2GMd/
         sS9eWHmKe84vW/wgDaguhMBHbRRg6rKcnOyzyk/LMSi+TOaBqwwqq8KAdCli/3p2a2Tp
         LEvpc51OZYXOjxQlQEjLMcq9Lpjbv+8TlCYiyAzWWCKDPD+dZI8GzuCtdxJwpd8joV6j
         Wcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mya3nkIwUh+TIu4djYFcQK6BbUW1zaOYt4akasWqvFg=;
        b=H3E7ZjhbS0lTf0OBL0XG8zDVHYF2Z2osZK5nh6tXXPp4xWl6ES3DveiVdzNTu80Ibg
         4HJVbDG1fseESG2I+uFygQ+DwE/H7Lrh/m7fgPAfwYNPDCUNX6mEiZnAHH5+l+omQy6T
         tAzEr6QHYvoRVO6o/2slxn2iwpjhNFQWugnJwjscu+/ekjZM7VMmo06Efw8iGPV6plKL
         l2Bbsu6cRWfJTiCFMxKsPQY6Hh6ht3DtqxwTkDTGL9kvKjJ9rBAU28clV+wg+M5qqgNX
         O5uOiMFDaS87rX+2mSS6+vWkCVsetdDoAjle2rleoSzSlI8/tr3L1nNTE+aKiNghKSdG
         I+Lw==
X-Gm-Message-State: AOAM53003OoHYV9rSGjOPO1g4RuT2Bj/Zyoq/dAE7FI9br8ybEnGrdpB
	eKOCKYM2ch4OrhexLMcNd2Vr3mZqQQukIW1p85lgFQ==
X-Google-Smtp-Source: ABdhPJxxi69r7JPs9NcrUSZVx/mya0DVWjV7GHPAed3DI2n08j+lZIdXYcnh6dMilSxNEph0K4PXbEgKFunxQP6p+cs=
X-Received: by 2002:a17:907:6d94:b0:6e8:c309:9923 with SMTP id
 sb20-20020a1709076d9400b006e8c3099923mr17335243ejc.101.1650912084719; Mon, 25
 Apr 2022 11:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422131452.20757-1-mario.limonciello@amd.com>
In-Reply-To: <20220422131452.20757-1-mario.limonciello@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Apr 2022 20:41:14 +0200
Message-ID: <CAMRc=Mf7FVN4QeAEdap_JzKmTy6i0A=BbcCZtCCQhzocg4PDfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Fix regression in 5.18 for GPIO
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Natikar Basavaraj <Basavaraj.Natikar@amd.com>, Gong Richard <Richard.Gong@amd.com>, 
	regressions@lists.linux.dev, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Greg KH <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Shreeya Patel <shreeya.patel@collabora.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 3:15 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Linus,
>
> This patch is being sent directly to you because there has been
> a regression in 5.18 that I identified and sent a fix up that has been
> reviewed/tested/acked for nearly a week but the current subsystem
> maintainer (Bartosz) hasn't picked it up to send to you.
>

Hi Mario!

I don't have any previous submission in my inbox. Are you sure to have
used my current address (brgl@bgdev.pl)?

Bart

> It's a severe problem; anyone who hits it:
> 1) Power button doesn't work anymore
> 2) Can't resume their laptop from S3 or s2idle
>
> Because the original patch was cc stable@, it landed in stable releases
> and has been breaking people left and right as distros track the stable
> channels.  The patch is well tested. Would you please consider to pick
> this up directly to fix that regression?
>
> Thanks,
>
> Mario Limonciello (1):
>   gpio: Request interrupts after IRQ is initialized
>
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
