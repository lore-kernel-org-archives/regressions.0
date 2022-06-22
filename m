Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E88137A
	for <regressions@lists.linux.dev>; Wed, 22 Jun 2022 10:59:33 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id fd6so20574542edb.5
        for <regressions@lists.linux.dev>; Wed, 22 Jun 2022 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wj1B3rbla67dRHBQd3aIS8YH2O6WyryO8AEPaxFsJyo=;
        b=F41jgn/3+dYOv8iERCwg43h6IvZqTibMge9LkwVaB7blZudC10xBDFwcrj7vNfiACS
         warpSAkPMAi0K7Cj6mbucgq4N/+ZDO1c/ld1ozSfcTmxjMx1iGV7rq3yBiA6RbmF3DhL
         yqatch4bRC51WMI6k2EUKt1gXhRT8qyO2Lhfw5YGvazDt3zPRCXnfRLVvRMZablXm9YU
         HgH61fM3wDzijZUpqGFvO65wDf0fHWjTErwdyO1se82Ce+Fbg4jO3smycsilnV6mcsQP
         OeE6XMXNdW0m66CxsXOXqH1gZ+QUUwgltDhEjWsYTe6GyvD5rY5/Fw83C/IQYJB45jtN
         RU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wj1B3rbla67dRHBQd3aIS8YH2O6WyryO8AEPaxFsJyo=;
        b=2s3DNwehtYWXEnMUov9bYEtelW+YjDIX0NwmiDoRhdmOOQ7c+HruxUlwwBXL5BZNLi
         ib3CVUQ7B8VV/93xlPvfowDm/FbPcDNs/MuvodKSBBnf5Jmf25SbTJzGttqyLpdqnAcj
         V/hV6fxUmcAbVjARa9TvzzR0bzaGsGUGtOg8xhWpd+/fkLTtv9bEAAf6HDZ4u4jCNaRD
         NaB9bw/XHokE6I3/YBWAJMJaFtLwBwSMBHCc0W9GUWk7idwRU/sTzZW5UycjW+RD4W1E
         2Vqqaot4+ukXVp2kye5s1/4oS3qNNg428nE+1qYdVopu4ZEJOWKiHwZncB+B+NyMuSd8
         fBLg==
X-Gm-Message-State: AJIora90DjhepM9bDs5gQfYbqnURxxYhi6lnU+bVd6hyTRMD+Arp0svY
	3KGysrZu0KYQvMQ+s+0o5GemQV5owKUj2ZT++GlPhA==
X-Google-Smtp-Source: AGRyM1usguThhtkDmHl7BY4SM52Xi7XhmpslgIGFT9Fcp9guUqDUlDedM37XJ3e4ReBmdiFE5ks3eSkofnpGgs2Cxdc=
X-Received: by 2002:a05:6402:1694:b0:435:79d2:a441 with SMTP id
 a20-20020a056402169400b0043579d2a441mr3447377edv.55.1655895571612; Wed, 22
 Jun 2022 03:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv4S2TqZ53oH5FEK07qHV+LwkZEx7+KNiCa5wZWruDSfA@mail.gmail.com>
 <20220622071151.xmabagjyr5qasff5@pengutronix.de>
In-Reply-To: <20220622071151.xmabagjyr5qasff5@pengutronix.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 22 Jun 2022 16:29:20 +0530
Message-ID: <CA+G9fYtUu2VCZ2NRpKMV4iCimi8koQ3OTeqQ3byZ9W11sE9fSg@mail.gmail.com>
Subject: Re: [next] Unable to handle kernel execute from non-executable memory
 at virtual address - devm_clk_release
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alexandru Ardelean <aardelean@deviqon.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Jun 2022 at 12:42, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Wed, Jun 22, 2022 at 06:41:30AM +0530, Naresh Kamboju wrote:
> > The following kernel crash was noticed on arm64 Raspberry Pi 4 Model B
> > devices while booting. This crash is always reproducible.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > metadata:
> >   git_ref: master
> >   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >   git_sha: 1e502319853ceebfe7480a436ba22ab01372fa0c
> >   git_describe: next-20220620
> >   kernel_version: 5.19.0-rc3
> >   kernel-config: https://builds.tuxbuild.com/2ApqivCh2DP6v2QxI17B2GnWiU=
k/config
> >   build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/p=
ipelines/567830223
> >   artifact-location: https://builds.tuxbuild.com/2ApqivCh2DP6v2QxI17B2G=
nWiUk
> >   toolchain: gcc-11
>
> Patch available at https://lore.kernel.org/all/20220620171815.114212-1-u.=
kleine-koenig@pengutronix.de/

I have tested your patch and the reported issues got fixed.
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> I wonder how the recipents of this mail were choosen. If your build bot
> identified abae8e57e49aa75f6db76aa866c775721523908f as the broken
> commit, this would be a very helpful information in this report.

We are working on improving our tooling for test bisection
and reporting emailers.

- Naresh
