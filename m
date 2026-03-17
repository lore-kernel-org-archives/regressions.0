Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515EF392C56
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733635; cv=none; b=gl0gJlj4pHn4KxK84xTA/NLqnIOyYtseSAB6OB2m28v5NNcUtRUSNUalILLb9S3s8cwdZM5QfC6fGui/7TfQAAewsTkegc3REjy6zzla3oXXz76lhlCvmo/A1OKptq3yKgwgV47dR/fva87Amf/VCKm2SOVFidK8pUexLoggIOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733635; c=relaxed/simple;
	bh=gk1q4Zl54I8wiUXgNa0EFd9UnVCSqo9XNxXpZitFYp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qp/tLMTuXPzOP94WFlQUK3uOK/pdF6ZVT9qdKVGrGjIajAICPUZjn5HPy6TPhTovYGu+VFD4iiabA+HvltXFaBfaZLPqFc3eC8SQJT2BKvxNEB9ptRe70RFIviz6+PbmCWo3fj6ao+Abwad+yd1Bi6zjr+ouCVn+rT61tb752eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XtxgqvNF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XtxgqvNF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6631e0edcf1so7698235a12.1
        for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773733633; x=1774338433; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URtMf0QMNmyDbkNY3uQV2w4aEQAMl03HuCtwS6fp77Y=;
        b=XtxgqvNFBe9inbQN3CdRgfo6qZknq2CU8Pg9flOjeMRR/Rt0fnrXVjgRx9SN5SyLJA
         vgxZM64yByqhs2wkLb5uP496LP95AU3MPPHbU4kG76JcPh2EesTaO2B68Ad934hWMjkx
         omxqLYq63ZT4GpQx07m74Y46aKN/MYFGQSpK5ENOGWR5F26jH1XgTCdsO3ynuPFnQKKP
         hECIZUrtNEZa6FWiklo97zA3FZ96N/ozS7aGdF6kHoDbadL5uv5heFnCyV1jcgHVgpf5
         fdn0t3/83ZxNdl1RsPDfkNek2ChYMUAmwOppXFDUbZTn+Q4M/AS1Ei7OGdzN28A4KLs/
         VCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733633; x=1774338433;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URtMf0QMNmyDbkNY3uQV2w4aEQAMl03HuCtwS6fp77Y=;
        b=l+KXiid8h3DadSkPvqjr9b4v0XwgjDYcRl/VVblNCteGRiAPfHX1FR5JmmnVLXRjpD
         b/RaIiOwJNGyBDAMagNDCopSe2MondUzNSycPvRmFcoazDv6v5O84J50wH/mPkABAUOM
         GZFWEMYCF6yNNkIAo5aWFIhZa0H1hC5HPwFBS/QfRSJhz0uJNkaoqST4vJo6jdkb/7Bw
         lTBiZ0jxVVGyivfxOJiT8Q/g4PqWAKtlXuAe2oxcAWtB5ETd/Oo707zD2B0GShJ56sW4
         Ez7bEUD+PCetYiKWU1pmmsontj99vNhCI4nz9YjyKvA6sEEqccrjcxWSqvVpvlOaNsMd
         nV/g==
X-Forwarded-Encrypted: i=1; AJvYcCUys79V6mp1IUzkr3DZd6Y/kOgzviYc2DGz9tHTBnfFUy3jCrvbE6ehrCqbPfSEpgvhLmZwttHL1S7JXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe/e9afv0QyIKFIvKqxeVQlibX7L1gUgxKahcH+DNkQSi9wq8x
	jyDGN5npVhF7Jrggu1dZwhVK/A/mIKfvP4amaaUS+H9Pkyz8IELV1xKDJh7RAHwR4UA=
X-Gm-Gg: ATEYQzx5c9pQd/BVXxA+rKirGwWMsY3TsU/4X4XdeMVbvgBSViqxv1hoRhnjYjYcKb1
	h+oWmtrMM+9xtRAxrgQMTk/AdUmWGhMZml0yrvoCFrhjc8QGfUtlBl536aC2EJ5aCIGEbUz43uq
	7wVkDbvRqkiGJSSMtU+g0bSRIwhr+XVPBd2p8d0Asv3Y5Ur2UJMB6lmSLTvhbbrt4eqkU6k8R/s
	uePd3Io6aGUf6R5hoWuFM2cSLfPl1+PeGuhZhg8vow+bWmnaPF/DEkNp641ct9joQy/TnRnZk/3
	sdFkf5xf2Oo9KgtFeVtdsMyHKEa2FoU3MKuaVLou/0He5nLedNgan4gZIXDLyhnqf0KDyYFdTQL
	LRdEKgFUAmS4wPCB/1xCOR0+AMMjUS5qBKPnA8R6ge8rvU3LIV3PiFVyjDpdzaIR0gept3ARb39
	trAPPezy4o/e2MtVX51O3Eb9OrxWIob21nw4U0j7Rxn0FXMyxfTUUxUVEWu8Ly8eWi7gLs
X-Received: by 2002:a05:6402:27c7:b0:665:20dc:cb44 with SMTP id 4fb4d7f45d1cf-66520dceb70mr4727389a12.29.1773733632583;
        Tue, 17 Mar 2026 00:47:12 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6670b92e7e0sm985353a12.11.2026.03.17.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 08:47:11 +0100
Message-Id: <DH4W3H5N4HQG.GAHFYE9XGEI5@fairphone.com>
Cc: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>
In-Reply-To: <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>

On Mon Mar 16, 2026 at 8:54 PM CET, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
>> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
>> >> Hi Mahadevan,
>> >>=20
>> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
>> >> > On SC7280 targets, display modes with a width greater than the
>> >> > max_mixer_width (2400) are rejected during mode validation when
>> >> > merge3d is disabled. This limitation exists because, without a
>> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interfa=
ce),
>> >> > preventing large layers from being split across mixers. As a result=
,
>> >> > higher resolution modes cannot be supported.
>> >> >
>> >> > Enable merge3d support on SC7280 to allow combining streams from
>> >> > two layer mixers into a single non-DSC interface. This capability
>> >> > removes the width restriction and enables buffer sizes beyond the
>> >> > 2400-pixel limit.
>> >> >
>> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display fo=
r SC7280 target")
>> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> >>=20
>> >> This patch is causing display regression on QCM6490 fairphone-fp5.
>> >>=20
>> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on th=
e
>> >> screen. When reverting this patch everything becomes working again.
>> >>=20
>> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-li=
nux/-/issues/41
>> >>=20
>> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
>> >> quickly?
>> >
>> > Could you please provide the resource allocation parts of
>> > debugfs/dri/0/state for both working and non-working cases?
>>=20
>> Broken (with the patch)
>
>> resource mapping:
>>         pingpong=3D# # 68 68 - - - - - - - - -=20
>>         mixer=3D# - 68 68 - - - -=20
>>         ctl=3D68 # # # - - - -=20
>>         dspp=3D# - - - - - - -=20
>>         dsc=3D68 - - - - - - -=20
>>         cdm=3D#=20
>>         sspp=3D# - - - - - - - # # # - - - - -=20
>>         cwb=3D- - - -=20
>
> I see. It tries to use two mixers with a single DSC. What about someting
> as simple as:
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index 0f4921b1a892..cbb7caa194c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_top=
ology(
>  		topology.num_lm =3D 2;
>  	else if (topology.num_dsc =3D=3D 2)
>  		topology.num_lm =3D 2;
> -	else if (dpu_kms->catalog->caps->has_3d_merge)
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 topology.num_dsc =3D=3D 0)
>  		topology.num_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  	else
>  		topology.num_lm =3D 1;

Thanks Dmitry, this also resolves the issue!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca
