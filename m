Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B0156D0
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 10:05:48 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565bdae581eso57727087b3.2
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685959547; x=1688551547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
        b=XYdvYRCtVg88YsxqwOeTmZpVKBps/jJvevf/4HoPJA9d8x95OX/S5meaL79fdZ+lcf
         TYo9EiIJxuqP8I6qT3/hs4a+sekKaLD3qHISTEdhINV/jCa8UfLVBQTVAnCtBimV9HIV
         IsUz2k1t2TnpiUzXKWYKOHwU1KsgmdGBhGasng7QrDgprD5hdibslehcmb3AUAEFF/2U
         hqxRhA4nXn7swnfehttcvH80+nzB/igq5TC0Su5RC38Rpqp3M9iDIK+J7E5QgGsnR6MU
         d/l+lwzxIjkgtyTDbWPAk2rmmdCzaivtkfhcI9PBvyBhf1/WvOcHQZwgRrqJZkHFIMCV
         UiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685959547; x=1688551547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
        b=k5xDghFrP53+d1SYzraEZ23mFTget1rpMFWbb6AMs5BZGrQDYFmbCiwLXe5YH8bqTV
         UMFEQKnFN1BXS7hUyTvszxXYcfxztVuTpKWHK9mqKcLbxQSA+SKv+24OQHWdOGwuxytU
         QNuuio5f2sVGslIMSJuo7q7VWK15a6cxs8TOCdVnLNaShjX3gRUcx3GA/AJprWrnpFH7
         /VKZm6SdI7C+0E+z3h0NmJpVqQcUODUQSOP3cPqkY055mUqcmpyBUrwKxecKbo7uzhji
         3jeV3dLVwx9zhEuaLn2CxWhMXIXeyIAvZPgvmBH+5RnxuzmAKoIb3mvCcU4wK8XGWIc6
         OVzw==
X-Gm-Message-State: AC+VfDykiHoerV2R145rH1s9HM9svzk6ba9X1l/YxhRu3+gAycfJG3OB
	RkvEz0F0stSBEVFTOhW0UegsnbOHKaBunfvczW9ggA==
X-Google-Smtp-Source: ACHHUZ7ZahqapikQv5X3CgkTgJs9qJu2UzKM4VpKBCDBA8zf8Pp37d7CHhoxAHvX6jPlV3ZKeHf2tzZIaPEO8cq6JLY=
X-Received: by 2002:a0d:f447:0:b0:561:e561:9fd7 with SMTP id
 d68-20020a0df447000000b00561e5619fd7mr10796136ywf.39.1685959547562; Mon, 05
 Jun 2023 03:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230523151646.28366-1-johan+linaro@kernel.org> <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
In-Reply-To: <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Jun 2023 13:05:36 +0300
Message-ID: <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR support"
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Vinod Polimera <quic_vpolimer@quicinc.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: Thorsten and regzbot so they can help with tracking this
> regression ]
>
> #regzbot introduced: v6.3..v6.4-rc1
>
> On Tue, May 23, 2023 at 05:16:46PM +0200, Johan Hovold wrote:
> > This reverts commit 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3.
> >
> > PSR support clearly is not ready for mainline and specifically breaks
> > virtual terminals which are no longer updated when PSR is enabled (e.g.
> > no keyboard input is echoed, no cursor blink).
> >
> > Disable PSR support for now by reverting commit 1844e680d56b
> > ("drm/msm/dp: set self refresh aware based on PSR support").
> >
> > Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >
> > Bjorn reported that PSR support broke virtual terminals two months ago,
> > but this is still broken in 6.4-rc3:
> >
> >       https://lore.kernel.org/lkml/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> >
> > despite the following series that claimed to address this:
> >
> >       https://lore.kernel.org/lkml/1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com
> >
> > Let's revert until this has been fixed properly.
>
> Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
> X13s two weeks after I reported this, and there has been no indication
> of any progress in the other related thread:
>
>         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
>
> Seems like it is time to merge this revert to get this sorted.
>
> Rob, Abhinav, Dmitry, can either of you merge this one and get it into
> 6.4-rc6?

Rob sent the pull request few hours ago, see
https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/

-- 
With best wishes
Dmitry
