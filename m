Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B55382F19
	for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390802; cv=none; b=h94vAx3zgDXkBUDzNirsnoDr4jR1FpodOYBpqJlaXPXcI5MC0bBstQH4XbimvlOZbtWGRAhZv/vX5ruddwNrozFjDsxyIPNwez1RbMRFihmOZlvBFAA68ON7kT8f5ZWDqTZsWJXUCYh7PadiRuRe58Tqdtit7fa9AZNhT5/I778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390802; c=relaxed/simple;
	bh=nIe5XlUNriiR8D6Am6b8PFXzokq99k3sTxbhixq+J8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BUU/rd5C9vGJrdHXmycneNmknYHpEA16rRDb+S8G5JWaBDBrwop5c67g+iyq3D3KLooycKD2vWKpnJ13ivGZhHv3N28cc6STLmdXXN0lwycZtjz4tC8lhdhTbSmwFPMcQ+c78P4WBRHUKWCFgiNlkl3HI4Lh+Uk+VWlTMhK0C5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aXdZuwKL; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aXdZuwKL"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso2546597a12.2
        for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773390799; x=1773995599; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/of78zuCI1x5T6ZYrwM97n73xB/ugxAeVuA7riCgkNo=;
        b=aXdZuwKLq2MQQCrY87IHOGLXGv8nazRI8UK7nm09UKLSCNXQLcOk52T3VnyRHRHxGJ
         uPg5SFEV6V4Nabv8RzFL1gE9WcRxiNE6KnmJe04rqDfN6n/KIGt7eIjeycFM/ThUbwIc
         a70hK4GKALabAZdHbHgpPFTSOkiOymhfkwqyaaBD1TpYf+UJGcKOuKhs2aZUcAAG3Ltx
         6jvwMVbqYfftL+mcvW5B8U4+F2JmdyQDh9xPdtkvyvdTTdRHOFg9DXgsloOAavimD2wt
         bZ4Dh4qxIsKyUhQbr4gCa5Mt9vUOND4JCARFCfSk8nwTtu4S6/H57KNmfqW5Kdn0PKBI
         9tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390799; x=1773995599;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/of78zuCI1x5T6ZYrwM97n73xB/ugxAeVuA7riCgkNo=;
        b=rloa861wTo4oOjO8d6uU5hH8nel9SZsxzMplgRJVvYM4kEC+bX9sJFps68jvrc6uEB
         H1aqFUoRy5TGZd/uPgwjGNshC8F8fwmh1AO/JV+PwoEubMZfDL50oAuuAGrGWmqvoFAL
         LZ3w1kTv79oywp4oUM8qj//W59fEE1omzjfVFWSO4MhtM3HFomjSZg2q+PSoeiV6bT6g
         1CzZv64ANIfMJ00NObr3Au29EXeSdO1tFBEcHT0u9TjvkyzoJ1itmPwB8/G402cdQHu7
         trNxOnmUc9m5NgD4KPBeSh4ciA7Z4t34MnuetZbD4rt7wjcn6TmY2iN/6pOpRxYFhc8r
         E37A==
X-Forwarded-Encrypted: i=1; AJvYcCXHlMDj5G33s5oeh+19jiZCMpIX2vr1AuKaLlELMmUmbPTFCIgm2rl5vCkOCmlKg8DW9l1p5dYRhZuZSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4jI8Ph9mnIRStKUVyr2xk2TBwZvdoG0Z/AkkWlMHJF0W8fDem
	ZKyxihAvcMzwgvXNVW5uPb5Ut/fTXAOaulTxnTjqbLZ6pahRJM46XIGuyyDb/owqiIc=
X-Gm-Gg: ATEYQzw7VyHJuyRAmpRJw1gHjsXnf9oSZNIqIgUF7m2ZKUmmwJGahXbB4n5mkeGAmcF
	1mDEhBNZppAkfTUl9QwgMfvEvxaOEYF1rS26csfo8k1XZAUL6uC/zjZMfXzbpL4SWrks0oFyK6p
	KbRsD8l5RN9rBBjIGCNRBlDIVN4YBngJHB3tUKllDg97IgH0ovmMk/IDgkdCVrOC1k+szC2a0Im
	Gz4EA4azo4jVRoNj8DYrT4VE5I8CO9RywBNSxN0wQ2ZahZaQRhfKkq/eAEqEgig9YC7HmQVkz+Z
	egds+OFpnoSCrviD8UxqY5mm96ctCoi6u5d+MjC9TEuYuHOGiP5vH8NdYPRGSmA5EWCqO0y1k8S
	5AE263xjrw6UWo1dswaSM+2z4tDwn2I8lUgMh3MoreU/GqS+3dPaTn59zAsqH42K2DhsgESSQ1i
	VoxWAgWeMInyOcQkkYcaj0qAx+KtWGtV2lInzdDGVxB3N8c+QszC/ljTemOqtm9JATng7X
X-Received: by 2002:a17:906:4a9a:b0:b97:f3:1231 with SMTP id a640c23a62f3a-b97653525a2mr101020566b.57.1773390799228;
        Fri, 13 Mar 2026 01:33:19 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc1c154sm28620666b.27.2026.03.13.01.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 09:33:18 +0100
Message-Id: <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <regressions@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>

Hi Mahadevan,

On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
>
> Enable merge3d support on SC7280 to allow combining streams from
> two layer mixers into a single non-DSC interface. This capability
> removes the width restriction and enables buffer sizes beyond the
> 2400-pixel limit.
>
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC72=
80 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>

This patch is causing display regression on QCM6490 fairphone-fp5.

With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
screen. When reverting this patch everything becomes working again.

See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/=
issues/41

@Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
quickly?

Regards
Luca

#regzbot introduced: 2892de3f4f985fa779c330468e2f341fdb762ccd

> ---
> Changes in v2:
>   - Updated commit message for clarity (Dmitry).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++=
--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 8f978b9c3452..2f8688224f34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps =3D {
>  	.has_dim_layer =3D true,
>  	.has_idle_pc =3D true,
>  	.max_linewidth =3D 2400,
> +	.has_3d_merge =3D true,
>  	.pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
>  };
> =20
> @@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] =
=3D {
>  		.name =3D "pingpong_2", .id =3D PINGPONG_2,
>  		.base =3D 0x6b000, .len =3D 0,
>  		.sblk =3D &sc7280_pp_sblk,
> -		.merge_3d =3D 0,
> +		.merge_3d =3D MERGE_3D_1,
>  		.intr_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  	}, {
>  		.name =3D "pingpong_3", .id =3D PINGPONG_3,
>  		.base =3D 0x6c000, .len =3D 0,
>  		.sblk =3D &sc7280_pp_sblk,
> -		.merge_3d =3D 0,
> +		.merge_3d =3D MERGE_3D_1,
>  		.intr_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  	},
>  };
> =20
> +static const struct dpu_merge_3d_cfg sc7280_merge_3d[] =3D {
> +	{
> +		.name =3D "merge_3d_1", .id =3D MERGE_3D_1,
> +		.base =3D 0x4f000, .len =3D 0x8,
> +	},
> +};
> +
>  /* NOTE: sc7280 only has one DSC hard slice encoder */
>  static const struct dpu_dsc_cfg sc7280_dsc[] =3D {
>  	{
> @@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg =3D {
>  	.mixer =3D sc7280_lm,
>  	.pingpong_count =3D ARRAY_SIZE(sc7280_pp),
>  	.pingpong =3D sc7280_pp,
> +	.merge_3d_count =3D ARRAY_SIZE(sc7280_merge_3d),
> +	.merge_3d =3D sc7280_merge_3d,
>  	.dsc_count =3D ARRAY_SIZE(sc7280_dsc),
>  	.dsc =3D sc7280_dsc,
>  	.wb_count =3D ARRAY_SIZE(sc7280_wb),
>
> ---
> base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
> change-id: 20251231-4k-969b53d2ea4c
>
> Best regards,

