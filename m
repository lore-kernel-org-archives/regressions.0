Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4738F22E
	for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823529; cv=none; b=XXA6fq1sLn8hIZP3W6urK7Ol3ew6PUAdiHlObkvrmPQIIgSgIKkjjUsB3FbRFhHbjl6gIonshTxiroipdf34FO1wOew617ZZI+4LelD1Qo+/G2u/wukGCLnYG9zW2JnYKn0HLp59dcNQN6l0H6Tajm4PGqkLd64vt4/+Z9DPQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823529; c=relaxed/simple;
	bh=vpkIzwAlbt2wev8FSusK7M7mrMVmaNBRwgRTC9/C208=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=d1DFrNlzfLjhcvHtxgZT8qmgXz9LKu6St7BtR/Hewi4o7ZNfvcgZEqk9v519/dWhNoGRluxnovRME8GUF6fIiC8ZuMOK45R/tdKorR7fGAX3xo9qrf8IJSi0foruNvQ7gFSrTphMNvb2JoStRUvD5epqK64xkFiJm/Oqf27lzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JZnkMn02; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JZnkMn02"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-667de793310so666074a12.0
        for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773823525; x=1774428325; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2NVg5azhBgjIMGuyOtSlU5XnHGYpWJdykiqlxTKsf8=;
        b=JZnkMn02Z8PCtIjtCp+Pkk1XdpOfTMfbYOPW+pEkzZNpRN7f89QNhI6ywB2CCjdq6f
         MDk4pabaOOThFhGX3aDj0OlTAQd6duZtW7hJ1Z3ZA6Orz16LfWbqdZ10sHk/146D7f7Y
         dADb0+EJJRCqdINbcQ0I5if+KRZlREuL0AvuPetcCEmFa63PuQv4D4dGfMsNjFLawZOv
         K/klkx+GixIpHhbSXzd/HgwVfOyiLEz76cPo+lXJi8ZqpWUkb1UgcpUkGaHCzSMjN2Aj
         Q2fX1PjHb9tF8zvzHo/2dG9BVhVdVnME9LorOrIhCVSbnF9bZRWitUa8SGWMUWusSTju
         4iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823525; x=1774428325;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2NVg5azhBgjIMGuyOtSlU5XnHGYpWJdykiqlxTKsf8=;
        b=nVhyY0OurZ6/28jMm+erUuNTxUxiraqdQ9xVewheF+rY4usM2pk9xkEe7QmsQJrCLM
         gM4BXi4YozPtYJg0V1K1bNl6Qvy2d3fBPgQN4YqJW5yojeIDUc2tiIqRwLrJJAsIthz9
         p6loj6KJfvKIU6psKJbPPmIOdEOFiov9bLqI26OcUJOvjjleCcrW6pCDWjYYENNUTgpU
         gW/VUfhhypSToCSs8qnHTRrSBQ5XdAmuPHcTSuFUxVlQeUx9NgJ0WCP9Om/QyJEXcBVs
         WT+7gT2mUiI4Go/LZvt0YZo97oyk92MC5prO8vSvYQTUTbHRBfipCDwY1fBI0mdM6niX
         /W/w==
X-Forwarded-Encrypted: i=1; AJvYcCXfFJ2jy+CAKvjsuqkblIb13n5m4z6k3bZfQE5Db6JtPYSAAjEouvplOJeHwAbE1Z9XEmnAkQMWxVkBQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW+Dwl3RyGbnDPYdFO3nT9EYRhVEEVIvDc47789n4uzqBYbjAK
	DWNWcCnydDDPvr6kzC7FJIwp3yun3x/t1imSgUWZ8m1AmhUIbeedO1YGWBZDWqfMWdo=
X-Gm-Gg: ATEYQzwUhd22G4ji8MIM6UhfebrAllpT8iBIj49siBXKhe0SwYQZY//G6EvmYV9/jGo
	9Jjh7caCfloNOEsDCSwChi24CozJzs5Rw+3DRlKs6KIC1LiprhBTbrQWENaDB5S/90InBYGnj9b
	WgK3l5nF4/BaiRuqDLJBOCO28rEJzHwHUTLwuf0LGq1fSkkl2vGGR21YEjuzrbe0Ylk/se4TVHS
	V7mEOGC30tLsQU24BUKEgRbNYeS/VNpOtFzfe9vQhhaoy+gsJg/UsqPwB6AVjTJl/TPWBWebLPJ
	k1f+N2J3LVZYjXrE56wT69Ufrb8EQrOUacFQggxoQJtAgq1hf9m6PdETtbVlUSeKvnOY49Tmojv
	jdLrn5m66N31ucu38CwbEX1l+YonDMbeUOhR/JIFH/DuYNvD5A8L2Bzx5F2wWNjlKvrAEJ3MKC1
	TIxX1tkiYuvtCdlutqZBeAG64U+Y1qs+ufAhhWVDDYapV70dI2q9GdawndQmuIzWDcvZHX
X-Received: by 2002:a05:6402:144b:b0:666:d8bb:85ea with SMTP id 4fb4d7f45d1cf-667b06e45e7mr1800366a12.0.1773823524789;
        Wed, 18 Mar 2026 01:45:24 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm1186045a12.17.2026.03.18.01.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 09:45:23 +0100
Message-Id: <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
In-Reply-To: <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>

On Tue Mar 17, 2026 at 6:45 PM CET, Dmitry Baryshkov wrote:
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
>> Working (patch reverted)
>>=20
>> resource mapping:
>>         pingpong=3D# # 68 # - - - - - - - - -=20
>>         mixer=3D# - 68 # - - - -=20
>>         ctl=3D68 # # # - - - -=20
>>         dspp=3D# - - - - - - -=20
>>         dsc=3D68 - - - - - - -=20
>>         cdm=3D#=20
>>         sspp=3D# - - - - - - - # # # - - - - -=20
>>         cwb=3D- - - -=20
>>=20
>>=20
>> Broken (with the patch)
>>=20
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
> As we have identified that the issue is what downstream calls
> DUALPIPE_3DMERGE_DSC topology, could you please also check several
> things (with the broken kernel):
>
> - What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
>   the broken config)?
>
> - If there is any difference in working and broken configs between
>   values being passed to (and programmed to the DSC) in
>   dpu_encoder_prep_dsc() ?
>
> - The same question for pclk calculation in dsi_host.c

Is this helpful?

Broken:
[    1.247165] dsi_calc_pclk:649 DBG pclk=3D111546490, bclk=3D83659867
[    1.490559] dpu_encoder_helper_get_3d_blend_mode:309 DBG BLEND_3D_H_ROW_=
INT
[    1.491008] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=3D0 initial_li=
nes=3D1

Working:
[    0.998043] dsi_calc_pclk:649 DBG pclk=3D111546490, bclk=3D83659867
[    1.233836] dpu_encoder_helper_get_3d_blend_mode:313 DBG BLEND_3D_NONE
[    1.234277] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=3D0 initial_li=
nes=3D1

Or do you need some more things? There's a lot of data being passed into
dpu_encoder_dsc_pipe_cfg() for example so I'm not sure which values are
relevant for this.

Regards
Luca
