Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051517C6
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 10:25:06 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id s39so2802994ybi.0
        for <regressions@lists.linux.dev>; Tue, 07 Jun 2022 03:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHsUvtPKP5XpLfzstYmPmoxmFK2aDYzyw6bVJWhp+7I=;
        b=w00SDC/3MJW646GYiEMN9IkHITmHZKkhfjcuLzDzYEZbzPMK6bPAuyYvOK4Eh0t6Xo
         qFMKSzl934/XIWwvjx2IsSQfToG4b1iob1y8e98deJB7d4a7NTKuIeoLh/T9pi4RAIPc
         bpsYSzHzw4586HhlAGyTFP78ZNLJxpacYevbzEL/2XNetpLNOXkn9/UEJ5HopIhlcoMO
         Ii0R0+4T3UKM711c3WKc9LY/30oFRtN3nSKTHnWiK/cNU02P3784L4ahBHvkKybzW6+8
         +9vaUdei41JrR5RojV7opdw0ckmmIaWXkRgHRjWxhmOvIS90dWu/z37e+ighdkB2u8S3
         lXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHsUvtPKP5XpLfzstYmPmoxmFK2aDYzyw6bVJWhp+7I=;
        b=2f+fABttKODgjqUWi7Ub8INZFfzRJrhICnlJa3aBUN0pWz/Hl14053uZpFGS6cIp2x
         T3bCQNM31Q0HSugdyAcSZZ0LJ/f1WXSJVfhv8L93IR1j3J8mHyfj05yekkWsnC2IVIeR
         Ovh9hcVQN3Pcwq08PesC11aXoBgujCobjx7Xug7qR4p+BlkXyNbeVW/DFvoNkgbtKziB
         wXwcpS66JgMuj0h22/FNBAOs1tF1um8KdHdmt2UYPULl87xg4WIZKlLbsSZw92Q64wGj
         JPii2M/guWagsg1At1sXMRv37o2WC+0FWfdz4rSDGAxrDwH7KR9OlJNKkmMbcL0tOVvy
         muQQ==
X-Gm-Message-State: AOAM531BOwsJUQ4YglY+U6rUNDNC2l7rsi0bERrZ3tsKPuoFo3SGBZ5G
	/ccliY+9iN48tt1STKdsH2aMigwzifCaGT3Z/umWQg==
X-Google-Smtp-Source: ABdhPJyo75CgyMDf7Lpz7KKoFjzw977s4SnCfOO4oMpGAtz6y9q4YDvsHC9fiBLOfY9uG51R2fxL62X0UT3AYw+KmX0=
X-Received: by 2002:a25:4f03:0:b0:663:dd99:b7d2 with SMTP id
 d3-20020a254f03000000b00663dd99b7d2mr2545119ybb.490.1654597505724; Tue, 07
 Jun 2022 03:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <20220607162504.7fd5a92a@canb.auug.org.au>
In-Reply-To: <20220607162504.7fd5a92a@canb.auug.org.au>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Jun 2022 15:54:53 +0530
Message-ID: <CA+G9fYtA3EahEGePq4nQopDvRp9LwgF93HjXSvqC94KjZmhgzA@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>, Mark Brown <broonie@kernel.org>, 
	Will Deacon <will@kernel.org>, Shakeel Butt <shakeelb@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Vasily Averin <vvs@openvz.org>, 
	Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Tue, 7 Jun 2022 at 11:55, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Naresh,
>
> On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > I am bisecting this problem.

The bisection found the first bad commit as,

19ee3818b7c6 ("net: set proper memcg for net_init hooks allocations")


After reverting this single commit I am able to boot arm64 successfully.

- Naresh
