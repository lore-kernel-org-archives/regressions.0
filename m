Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35535637
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 12:35:33 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id a3so25135791ybg.5
        for <regressions@lists.linux.dev>; Mon, 23 May 2022 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZl/fl0qeIvUdvyZE0jXdpw2d7CYxFND/Aqlck8hL7Y=;
        b=g3QNKrPTU1y3Hrxty3WEbBcbkZxQCGaVdrI1t7cV6FoIHEh9ApyTyjigXadNjRuARd
         WBsyRpJpm6CvGeg1/msOeMA1GJYcN27fAsKFCV4xQO/fRhTP2iDjT8bYzY93h8B+Nkib
         JBFdE0ll5yFBll//1q9Be7OjXIdJe0O6nC8fDo1eIINQWobSNLsforLswaDJNel/hmwD
         Xxsc/+qAQBGThqbn8YkDwke51gsJsgLlfeZCIUnuT3kh9WjLDs6WokwERf93TXAelLDt
         q3Wjw0yC1wU1SCETaIoppFY5Mcn/wYzsfVrKegm6WRuj5DoO4cSBLYLOlXX6z/jtENFg
         +g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZl/fl0qeIvUdvyZE0jXdpw2d7CYxFND/Aqlck8hL7Y=;
        b=c9hM1v+2AdBzja3SN271scNfz32NoNL23me5oXNDP24r+arVZQ3WihQK1vHBHHENA7
         KpquBO+sk7Os6+x4h6xXj/ETKsv8QhE5hg0opCqNO1Vo7l7ucBSgstfnIhM57/HDjiso
         ztiPBwmAYCPCDW5M/U6zkJLVe3pJCSdXGVixz0US5CvQYPaFpBJzogG5bKX/lp/Qj+2H
         hQ0m4uWJdzZgCIfE+ZaAFN6iaPwwZ/2rttzyMlTdeZMkBNLRue8Wj1wjNlx9ibk2gt4A
         /JrThban8G/bVSMEsbbL7IgZSqeCv9u7iNqhyfz66Y3D8CZRUmWCQePhOyJGwlPoXryD
         8zHw==
X-Gm-Message-State: AOAM533DhWmghlJfREtxTqfBdLNvxMBg1vmwyOGBDjiGiqq36u5qTm5S
	rs2ADfGZNUftee9tf15N5NcJpRBkVbwhmL3UVizz1A==
X-Google-Smtp-Source: ABdhPJxe/lvuePKCeGxuB9+ABxg16S0q/9rDILB02Ubcpk7fvZjoqmGGH2zyZ9//gkOuI4bTXW0IMEtSpS2nkzeORqg=
X-Received: by 2002:a05:6902:2c6:b0:64f:5b77:6869 with SMTP id
 w6-20020a05690202c600b0064f5b776869mr15492879ybh.494.1653309332081; Mon, 23
 May 2022 05:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt4+47GzfEYT1nV3dqbGa1YCwFm9XwC668D4PkK4BHFgQ@mail.gmail.com>
 <55d49dea-1a67-d857-218e-ef2343251361@i2se.com>
In-Reply-To: <55d49dea-1a67-d857-218e-ef2343251361@i2se.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 23 May 2022 18:05:20 +0530
Message-ID: <CA+G9fYvF7HGmJQtk7ktmakwQNjjraK3EoBeiMr+3NuEvsixi6Q@mail.gmail.com>
Subject: Re: WARNING: CPU: 2 PID: 3331 at drivers/firmware/raspberrypi.c:63 rpi_firmware_property_list
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: open list <linux-kernel@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	rcu <rcu@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	linux-mmc <linux-mmc@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 May 2022 at 16:43, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Naresh,
>
> Am 23.05.22 um 11:04 schrieb Naresh Kamboju:
> > The following kernel warning was noticed on raspberrypi4 device while
> > running LTP controllers with Linus mainline kernel tree.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > metadata:
> >    git_ref: master
> >    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >    git_sha: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
> >    git_describe: v5.18
> >    kernel_version: 5.18.0
> >    kernel-config: https://builds.tuxbuild.com/29XDpgnCMxtWJ6lVJ9M0x3hTNWu/config
> >    artifact-location: https://builds.tuxbuild.com/29XDpgnCMxtWJ6lVJ9M0x3hTNWu
> >    toolchain: gcc-11
> >    System.map: https://builds.tuxbuild.com/29XDpgnCMxtWJ6lVJ9M0x3hTNWu/System.map
> >    vmlinux.xz: https://builds.tuxbuild.com/29XDpgnCMxtWJ6lVJ9M0x3hTNWu/vmlinux.xz
>
> thanks for your report.
>
> Do you know this worked before (e.g. 5.17)?

Yes. it worked before.

> Am I correct that you are using GPU firmware 2021-02-25T12:10:40?

Correct.

- Naresh
