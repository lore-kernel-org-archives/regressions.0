Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E9381B1B
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652133; cv=none; b=MbTPMjLGmFXYyS7E0NXcPkU/tyKTslpOs8crOIdc3jKvF62QRga6A3NgTKI1YLDj8gDAWF1GBjB91jeNBws73AXnxW95cubH6VXpanBiMi/HLZeQFiupLKHsS02MOvH+Xo5r3mTrSmNeB0zmg8u1P/0VXSWiT+49+KRjNC0Zhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652133; c=relaxed/simple;
	bh=wkQX15AyJfsKKCCOWFspBnke5YAnjhGrFoyLBmhBKVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=csvIn2YKTQaL8LpAAxM7aIz50UC+dTcohz8c6MAvfBlvS3nGpKvmY8F/TQGg1jhkSAQWBdjcbhZhNAqDCyk7mvT/+d7cGtjeRY7km0Ggp+ML4SuHJEjTm9B97rPFiBXKUmPq/NE6j78a8lUBYwz4MngYDyT0jIHRs5rIx1gp1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PvqgtqYk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PvqgtqYk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b886fc047d5so711605366b.3
        for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773652128; x=1774256928; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkQ3ltXCFznTU4ceGv0LPxbwLcaDE8cpGKaOEA1BzBs=;
        b=PvqgtqYkRmUSEnavCFoWi/COeNAI1ZoG4LgVRkU2VxX1oAwz9EOseW3alQVG51fc+P
         kZks4kUxYcuH7KhQXpL7XUcx69l0aormClTo+Dew5QlyqZE1Db0FWr0r+RVqjvOtGYa2
         r/fEC0iZwazf4oUHByxb8B/RbK5rY990BMep87TM8p8eF1OS3vYqeZ8O+xLHvzzIGG2S
         IpzSwj1i2kNN42IUk+w4RRP3ZD955jkFQfVwv4RvvqYjFFd/7pgGiV6vcATjnhVaMneU
         270L/JZcPMWkAk+Ashvm7fqcFy00pgOMltk4qR4wlZVFjRtlS0P4I8bJ3mFlwkHYGkVi
         kmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652128; x=1774256928;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkQ3ltXCFznTU4ceGv0LPxbwLcaDE8cpGKaOEA1BzBs=;
        b=WssaeMMdGOAaGz48hWD/rN5ePvvLpeFUTV/avtR2CjXOTZC6BkVYg44PMXX6QXF0F6
         8t2ZLswV3QfyC4nwJKw5T3RH49wpIk8YSzH+2nLlkOKDBHjleYzdf/AEqofjNWlFuqOE
         qUg1QnXsmKQ056pA1/YzM8U/mz/AiWVCplsGr158fPXFJPDlhK5g3rJslq/nQ0rJVuyh
         Yhubsk/ieRUso7u9GrYlIzzG2ldHvqtbi0sy7/baEAXc/CBsubCSZWAKZJrXL3PUXrjf
         WlxWnmg1dHC9JZlZjxevazStR+j3zDOQUuFApIEMh8lOae1Rl5u7ijpSeKXglmQzT4yq
         Qv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvAyqC5jkEikzaT4GNQplKwW8Sn+0zqh1Pe1QMQpL7xWrtX94I9rVIQV/371ZrkFBkz74o0O30L2zTZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoxPQbwCzrqAotlKQC10o4RPppwR12MK9Eef+1I+XMqOvD5UkR
	VZcQMxWm8vbBCnZcJJb1xLPFBIpi0z1gqza+KouJCvKDG1a4wYUyp+39IkxFJPN3FHQ=
X-Gm-Gg: ATEYQzyZnlExlY07XXTGAIMogHXjyPsidcQaf1PAnqhHF/eo08LKHI5MRU546KzjgP4
	OfC9Btkax7o6lQ26Vf74uIAAH9icFCbIlkkHRunD+RxqnFUtRpdubAFQrrvQ7b33T/ELisLBqZl
	UoKT3ErF62l30+WczDvQSn3kHwFD6NgWVzgu0/JM9tsOMfkjLMSmbk7XD5P59LvHKQzPWb2Wjhe
	Vl079v4maY+7pSvu3RFczBRT665nkquhEtd13g/PD5nCccU2tQrFBLQnEzHiDYagQrQtbptywJB
	ky7Hqa5gMZ1wVRm+61FLI0itmoqNfWieSwjZyqQvn92Z4iiFNpr98mFfq8uxjCJ/EKtVRWMIuPU
	9KdERUuLXrVZAB0tvAdco6HChQJAB059VcDyhyzT0mLMTxvlRetaQ9FhxgUfD65qebAK77a3YE9
	0MG+9NYb4oj3pWQqK7mTq+QupL8bgrC3T8q+dCzjnStydoA4wFP0glrfNSsXm/JRpcEwof
X-Received: by 2002:a17:907:3d4c:b0:b87:b0ba:5d2d with SMTP id a640c23a62f3a-b9765410045mr711976966b.57.1773652128251;
        Mon, 16 Mar 2026 02:08:48 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97afca45c3sm229016866b.13.2026.03.16.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 10:08:47 +0100
Message-Id: <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
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
In-Reply-To: <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>

Hi Dmitry,

On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
>> Hi Mahadevan,
>>=20
>> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
>> > On SC7280 targets, display modes with a width greater than the
>> > max_mixer_width (2400) are rejected during mode validation when
>> > merge3d is disabled. This limitation exists because, without a
>> > 3D merge block, two layer mixers cannot be combined(non-DSC interface)=
,
>> > preventing large layers from being split across mixers. As a result,
>> > higher resolution modes cannot be supported.
>> >
>> > Enable merge3d support on SC7280 to allow combining streams from
>> > two layer mixers into a single non-DSC interface. This capability
>> > removes the width restriction and enables buffer sizes beyond the
>> > 2400-pixel limit.
>> >
>> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for S=
C7280 target")
>> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>=20
>> This patch is causing display regression on QCM6490 fairphone-fp5.
>>=20
>> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
>> screen. When reverting this patch everything becomes working again.
>>=20
>> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux=
/-/issues/41
>>=20
>> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
>> quickly?
>
> Could you please provide the resource allocation parts of
> debugfs/dri/0/state for both working and non-working cases?

Working (patch reverted)

# cat /sys/kernel/debug/dri/1/state
plane[44]: plane-0
        crtc=3Dcrtc-0
        fb=3D71
                allocated by =3D phoc
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x500000000000001
                size=3D1224x2700
                layers:
                        size[0]=3D1224x2700
                        pitch[0]=3D5120
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D6
                                start=3D00103729
                                size=3D14680064
                                imported=3Dno
        crtc-pos=3D1224x2700+0+0
        src-pos=3D1224.000000x2700.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D1
        sspp[0]=3Dsspp_0
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D1224x2700+0+0
        dst[0]=3D1224x2700+0+0
plane[50]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_8
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[56]: plane-2
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_9
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[62]: plane-3
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_10
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
crtc[68]: crtc-0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D1
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D1
        connector_mask=3D1
        encoder_mask=3D1
        mode: "1224x2700": 90 311156 1224 1256 1264 1272 2700 2708 2710 271=
8 0x48 0x0
        lm[0]=3D2
        ctl[0]=3D0
crtc[69]: crtc-1
        enable=3D0
        active=3D0
        self_refresh_active=3D0
        planes_changed=3D0
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D0
        connector_mask=3D0
        encoder_mask=3D0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[34]: DSI-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[36]: DP-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D1
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[39]: Writeback-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
resource mapping:
        pingpong=3D# # 68 # - - - - - - - - -=20
        mixer=3D# - 68 # - - - -=20
        ctl=3D68 # # # - - - -=20
        dspp=3D# - - - - - - -=20
        dsc=3D68 - - - - - - -=20
        cdm=3D#=20
        sspp=3D# - - - - - - - # # # - - - - -=20
        cwb=3D- - - -=20


Broken (with the patch)

# cat /sys/kernel/debug/dri/1/state
plane[44]: plane-0
        crtc=3Dcrtc-0
        fb=3D72
                allocated by =3D phoc
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x500000000000001
                size=3D1224x2700
                layers:
                        size[0]=3D1224x2700
                        pitch[0]=3D5120
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D6
                                start=3D00103729
                                size=3D14680064
                                imported=3Dno
        crtc-pos=3D1224x2700+0+0
        src-pos=3D1224.000000x2700.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D1
        sspp[0]=3Dsspp_0
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D1224x2700+0+0
        dst[0]=3D1224x2700+0+0
plane[50]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_8
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[56]: plane-2
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_9
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[62]: plane-3
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_10
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
crtc[68]: crtc-0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D1
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D1
        connector_mask=3D1
        encoder_mask=3D1
        mode: "1224x2700": 90 311156 1224 1256 1264 1272 2700 2708 2710 271=
8 0x48 0x0
        lm[0]=3D2
        ctl[0]=3D0
        lm[1]=3D3
        ctl[1]=3D0
crtc[69]: crtc-1
        enable=3D0
        active=3D0
        self_refresh_active=3D0
        planes_changed=3D0
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D0
        connector_mask=3D0
        encoder_mask=3D0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[34]: DSI-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[36]: DP-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D1
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[39]: Writeback-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
resource mapping:
        pingpong=3D# # 68 68 - - - - - - - - -=20
        mixer=3D# - 68 68 - - - -=20
        ctl=3D68 # # # - - - -=20
        dspp=3D# - - - - - - -=20
        dsc=3D68 - - - - - - -=20
        cdm=3D#=20
        sspp=3D# - - - - - - - # # # - - - - -=20
        cwb=3D- - - -=20

