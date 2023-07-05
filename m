Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCCA28
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 04:45:38 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-5ed99ebe076so46331136d6.2
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 21:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688532337; x=1691124337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
        b=h85RDU5faMJMQFRpL11aGFUvNF/ofs+2e1lUAoBYP8SLsCQG3po2qN0EcgfzDFwIBW
         BzJNoYc7bPOIh3frqeehvRErPNng/ZJBR2F39EflnmYKKm6DTzb/3bJcr9hAhBhde9m0
         zwEjKFR+OYjRIakJntOIQn1gpnPMeYhebdCLAlsSV1hbUwow1dZC0oJ0jFqPyyaVnVys
         /XhUDt1TCqEjSEyTswOrSLWS9xN1FOQ1NJQ5gU2oY4dS3UbKAnZ2tXnDtRrX9DXHhJch
         dHAfi/nlrITlGVNXKe0zxMCLQH6gJ4jzJBZZMFPtOQftUYfdDCv8RiuLOu1NQw5RfO9V
         xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688532337; x=1691124337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
        b=TjaIGa73RbFj9hy5hlWdHGVdwcCu6ZBpttTqCAeFBk47Xon+MzsQcapoz3xHSe+cM/
         DhvKKQLDk1tw9dphYhxdTGGf+cMIFI10ThiENy/VSee6lNF91xBehfncchqlYdaEkiPg
         WdfwmGlHfMP7PrB8rWaN0n/4B4gR1jHKj5h/dPYnxxfW8j6gGYFZ3SrfvqmTcY6Zn7bn
         QUxHRAXBBul9JYVKJmhSz86pxAOeUT+bLDH3DsjXVubc1I6qm62FRE9Q/VBZqIxD7gpD
         P2v/1cRJVvASgka2mdA0JnylXuf21FSsuqjk5Hk3cf0Os9xD/mcKCz4CW0DKc4vyZBc3
         Wzyg==
X-Gm-Message-State: ABy/qLa1KpDfiEWeYBLljSoFG8iPxqcEE3geLoSkguYM1KysDT+i91El
	GI8DCQMDJUfO3o4ScP5BJavpkzh8T138ynbZUt9FuA==
X-Google-Smtp-Source: APBJJlGJ2wHlfkfB3ZQ1QzikScAKQ6X408nThkn6EJ0gQwXU34hiTOLxSmGlh70SM1vVx/GFl+3ylm2hqxwKnXlu9vc=
X-Received: by 2002:a05:6214:27c4:b0:635:df49:719c with SMTP id
 ge4-20020a05621427c400b00635df49719cmr19427849qvb.22.1688532337691; Tue, 04
 Jul 2023 21:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
In-Reply-To: <20230403221233.500485-2-marex@denx.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 5 Jul 2023 10:15:01 +0530
Message-ID: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as these packets are not required. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.

This patch broke display on Dragonboard 845c (SDM845) devboard running
AOSP. This is what I see
https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
Reverting this patch fixes this regression for me.

Regards,
Amit Pundir

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index a25d21a7d5c19..151efe92711c4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -774,7 +774,9 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -                         MIPI_DSI_MODE_VIDEO_HSE;
> +                         MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
> +                         MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +                         MIPI_DSI_MODE_NO_EOT_PACKET;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
> --
> 2.39.2
>
