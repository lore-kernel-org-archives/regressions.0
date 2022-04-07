Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF7120E9
	for <regressions@lists.linux.dev>; Thu,  7 Apr 2022 11:42:22 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id q129so5344202oif.4
        for <regressions@lists.linux.dev>; Thu, 07 Apr 2022 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SlNyJLkNkQjFibbjG7LibUXxMJ0vZJMxjm1ghUeLSo=;
        b=RyFz37RFrTq9tfEhm7CeR0XjT0XDM8te7eZ7yZTVn04gO23o3fYXZcM43nomGQETne
         k7I9SVLcJZsWi3Hfk8otl/I4P4YAlBF6HAuW+IhPYqZvKLVPsNuLUFvm76frX+RVZmn1
         EJLaHovsDsDTZqlT52trbcbd7nTvNGMLBZSNLyaXtpuq4KNeE/iKlH9MRyPxWNrglS2v
         8Hh6gIDU7InmRt+pgufza4JN2xpcLZLF1ef0u06op9zmgSjZXMHNmOh+MS+oXQmIX2pQ
         5HIWmA8Bu6/Qz5CvJGKvBtlb34aWLqpEGknEKNYwVumxYck8dYVDggcxvT5hL6UqNVYC
         G9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SlNyJLkNkQjFibbjG7LibUXxMJ0vZJMxjm1ghUeLSo=;
        b=348+CXDWG1SHzoIAbUzz2O9pt8kt7x6+gDMQWy7FI5FEePxe3PsQlXx8Dqst0SmLqI
         1KQkhScRdWqN+bxryO3q9WNU6SeziajVSaa9Eq68gP/HDSzearZWmI7WjdCjgBJGEErf
         jc5Yi9FMsDgc66iJJvn89YxD3mueu4O5ro9y1YSFbJ4U4/S4+tEKGXxUFbOwGRRD5C1R
         Snrel7spKuwqiBb5dgz+GqoBm/GYIwbPVt344MwHErY+HgK2cPoIfEfv7BJVVuqGlYnN
         dIFvIclgDzsSLkpMmhQce2/CsY06h0tHJSbjo36Uic0J8RAHxl+pHQz2BwrS6fwbpXUG
         lErQ==
X-Gm-Message-State: AOAM530nzCxByoqFIDfhZ0snvOGW9NVS981Md/PhYABT3GvAjuYn/vL4
	6FJux8SmFehOeUKfEqOlPxCdHqc1pGVDwi9U7yvqKw==
X-Google-Smtp-Source: ABdhPJwmb8NPaOfFwbH1UoLl7ZnI0TLh1pppFo6Oeu8yFnd1iYpTTiurcyIBl4X6Tu7dcJs42w/30+ElAs6L8dIdvzc=
X-Received: by 2002:a05:6808:1991:b0:2da:350d:f9fc with SMTP id
 bj17-20020a056808199100b002da350df9fcmr5606947oib.251.1649331741621; Thu, 07
 Apr 2022 04:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
 <20220401151058.fipdax3kvmxknctv@houat> <CA+G9fYu+WddXTb0NcbviUfGQHhsmThssVCafLPw7+nj3JsoFAA@mail.gmail.com>
 <20220407075435.ahlylmbqmqnpxz64@houat>
In-Reply-To: <20220407075435.ahlylmbqmqnpxz64@houat>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 Apr 2022 17:12:09 +0530
Message-ID: <CA+G9fYvT_W9+0AguQu97mqTm5zNnSvF0asnatZX8BTf=_1oANg@mail.gmail.com>
Subject: Re: [next] db845c: WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
 divider_recalc_rate
To: Maxime Ripard <maxime@cerno.tech>
Cc: linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, gabriel.fernandez@foss.st.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Apr 2022 at 13:24, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> > > I'm not sure if it's feasible, but if it is, it looks like something
> > > that could be fixed by the patch pasted here:
> > >
> > > https://lore.kernel.org/linux-clk/20220401122736.5yvanksa4pla7uql@houat/
> > > Could you test it?
> >
> > I have tested the single line patch and reported problems not fixed.
>
> Could you test this branch?
> https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes

I have tested your tree and branch.
I saw more clk prints in the boot log and did not notice the reported warning.

[    0.734195] clk_set_rate_range_nolock: qdss: orphan ? n
[    0.734222] clk_set_rate_range_nolock: qdss: core req rate 0
[    0.734235] clk_set_rate_range_nolock: qdss: clamped rate 0
[    0.734249] clk_core_set_rate_nolock: qdss: rate 0
[    0.734262] clk_core_set_rate_nolock: qdss: rounded rate 0
...
[    3.574169] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk: orphan ? n
[    3.581271] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk:
core req rate 300000000
[    3.589446] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk:
clamped rate 300000000
[    3.597521] clk_core_set_rate_nolock: gcc_ufs_phy_ice_core_clk:
rate 300000000
...

Please refer this link for detail boot log,
https://lkft.validation.linaro.org/scheduler/job/4861930#L2712

Build link
https://builds.tuxbuild.com/27SxYLYlZcKEUQGVbmnmLP3GxEp/

- Naresh

>
> Thanks!
> Maxime


--
Linaro LKFT
https://lkft.linaro.org
