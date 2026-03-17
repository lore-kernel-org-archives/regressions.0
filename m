Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CE37BE94
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769534; cv=none; b=C0SeCX6aQOTENzPhR5ESgySSeU+pJWOpvZ5cNu1xucAr2x20wfsrg9ScnOk2+PZext9u8V+tBkln1DkAQAYP93p4e1VM2QN0bxlIju9YME3EEjk3ysPvbAVVTBZZcncA6MLTIBOK4q+VYIlVRKHjConqPZuZnWbWTCXdK4dSEDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769534; c=relaxed/simple;
	bh=iaNWFVFLm7vozirDxvC9jTtq6cozMvhQkxb9+GR6/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYgl6KJG6sqgw0+pA7PbYOjlgKwoAevcmsDsfGqOhPmag7DV906SLLGDGfzUiUc9hpKFpbaFbbT41Adj9Gu3c06HlPw0UYk8iF5M0xD03UcesYjdsbaZ8sfAg6RGe287DXkcpqNc+xQ805SPGCHubSWPLn3Ip7sGgb38ea+0CQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDpdg9LH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGOHlKg/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDpdg9LH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGOHlKg/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEHsSo2188418
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 17:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sve/0XHVXakpPoL6EEAxjWXr
	d/xyFE0tTXS0gGte2N0=; b=nDpdg9LH6CceQx9RwAn5zn9AU+Xt2QzpPN2MYRF5
	3INjPlpOOCTH1DZA3EqWY0MRvluGeq6/EnccZEF2Ojmbx7ixmZOmQYNCBFPdhN2S
	Mou7xh+70D3aGseV2PFHlzu5pJrdGNxr/ioc+/iT6tFdrg+cmA2DyPoIXH34ZgkQ
	uPMO+Rumub2H3y102PI5ZXEzxqsdkz2kAXl0LwNxh7OrVz+TXFXuxZZ8MFMSFvMR
	w3th+G25fSoxgTOQIo1BqBaFch+QknnSd3VjhohHtf8zypOGIyK9bIlLraiUPZP9
	xlZj1snVyEJQ0I15FKhOT/qHeYeR2L/Sfn94N95vx99K1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjrv3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 17:45:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so3369382885a.1
        for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 10:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773769529; x=1774374329; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sve/0XHVXakpPoL6EEAxjWXrd/xyFE0tTXS0gGte2N0=;
        b=jGOHlKg/aQWkJiU3dxv0QrHaKbv7hwM1S0s17EEHAPRz+gIkQAjWyN0Yw6hoOHzUhi
         fjOm+16+EJTRny1GydkndztCTYGVgd/oAWsJg5l3OVOd8/3YbIJPN80ceJ2WaXqjvmTj
         UWq2Lfjxbi/368U9qyPgmc0qbKxn+PHvvQC3spKiPnA19L35JgOzn4Nrix9xV029Zesf
         5Pf8MLYGCzLABA8REMN+xjCxu4dTl/VSTM3w5nnBeux9WdZZtpxT3+booxsu03rvErAl
         wDvSZjxCIJBqYG8kduNpWEii2pATcexNyfsz7nQAeO6q3ihJ7EQBEormhM3QqEqIQpHp
         ktqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769529; x=1774374329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sve/0XHVXakpPoL6EEAxjWXrd/xyFE0tTXS0gGte2N0=;
        b=f5NM7dCmJPVaRh6yhGeOY3ZgEH7fgJA3yruRNydhAAo43BP2KYOrwTetEdkN+M1W+y
         XbBo9f9QOsOWjCWmel6Ms7UEfJaYdg/SwKug8mEn5XVEPled6LOo7X5E7YktCIKrHq5z
         ZrIqqtqzfCnHnQaHIZmcMdqVaVCyPYvc7L12GgrikCQXarfkB8YzbqyHvSddis2yq15j
         vyci7+vr7rWzSbWky+JTQidCJ2wVrqCb+hYTOXLNtOR1/WM0ss103D52muIq05nK85hU
         PfB0bheEacgojyyAmglyLDNLt1CX/cA1EXS3lfyFqBtjisKpGcJUa9cg7X6gVzc0iobF
         Eu8g==
X-Forwarded-Encrypted: i=1; AJvYcCXDvjir34eqllfuFfw+H9QkCA6Wep0wpsywa/DQdK1bvDzGhEQX6L56Rm8d1S8TaKNE7t5apYgdbZ2QJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOH0mxnRKLD/6kJFHhAzPSPZkymkcYIPmVIe4zUB1O6FMVZjdD
	7N/8/Pilqcl/j1gOQAyUFFzeNiVp4lvcYMSQZCb8t6Hrs905BlX2hNORR4RVXmvva7ZU3SDxsi6
	w21v7rKh5J3YoTf4BgvzSwHmMKOsQpepYx3PRHUyM71K52J8O7XCOaOc5O+o9Dv3Z+g==
X-Gm-Gg: ATEYQzzjNru0V2J65zAlpxzT6AHd/jxJ7m9R3qnSqnelmDHWkw/vvrux6z8F7EfpuWm
	j4fisBFnYr31ssmGZ9Ev6TzO1+PH5xu6lb/5Yv2J8m3DzPORxfah8ACSaCk+IpcfPKCIk45I2gs
	roCWOfuxFBTR3S0z+Qhpvl0mtjfh7NudK0P6iG9F+CxdZp1ea5+MAZA4J1sUkCdOoraogrbORCC
	gOiHwVO54hFWIPTuk74H88LqeCriD006Q6rnQU3sh7QJkEcxvMtOq1SFwQBGMV99ZvtxVtpRr0r
	1lCfIs5MYwItICNfI4zXDoW35j3jFmq+lkFHEG9LYVIXDWZDLOOARso2y5OJyoPO0TyMoBUpKo8
	ppmllPpUNMtMq5jpknAdrDfeRhYuUkIXVAc8S6vt+QSVkC2qXug8KvczskUQPFim9rn5EUl3Gga
	py5nA0qyWtcooDggRcGwGylTjMycTIA/H5DUI=
X-Received: by 2002:a05:620a:19a9:b0:8cd:8320:3359 with SMTP id af79cd13be357-8cfad1e0b92mr60710985a.9.1773769528705;
        Tue, 17 Mar 2026 10:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8cd:8320:3359 with SMTP id af79cd13be357-8cfad1e0b92mr60702685a.9.1773769528096;
        Tue, 17 Mar 2026 10:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517df25sm1088111fa.15.2026.03.17.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:45:26 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NiBTYWx0ZWRfX2fp9siTROwsV
 S1VNSyBc3vDSqlEjvvFGeXZAVB8/vApVtGOJzOQDsCaTnAikVWttXlixRZ3ZlZYJauhDYRBqomT
 /9kELkPABKPVgTbcw06xL0X3xgh974/EX1EGNHTHvqHkntzgELdy2NQ8K2BfM3AnYc7DloC4y5I
 J1OsZ4/xcdeYRa1MZR7thr0UVO++eLkMljqTdQs9zgy8MEe7qOK86VXHITLn2ZMrrZ1BspQXbYA
 kHn6dGcDCppD6qx8x9BO6BZziNRhinu/Il4ac0n6fFK50MxdSH+W0n5jxeP+t1L2MtL3pn/60Qa
 pOtaqJrh5VhhW7sTHMpKi3P8ftx1FVo5CGE7BUyGRECXLXYZaR42t361G2XFE+lrUMFLOdpQUzc
 FLnKFQHvR5TcVIdxQ8/L9B8nRjgdmBbMUQOfpZT7JiR9Uck/vXsOf2yEH3xbTQUIH8m+UgJIZE+
 OFybbEtWG4OGd9NDjdA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b9933b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=WX5Q9rlaD-dN8u3Ux8UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ji3_FUrjO-xFQwLYFMy3jel_ESxGPPSU
X-Proofpoint-GUID: ji3_FUrjO-xFQwLYFMy3jel_ESxGPPSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170156

On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> >> Hi Mahadevan,
> >> 
> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> >> > On SC7280 targets, display modes with a width greater than the
> >> > max_mixer_width (2400) are rejected during mode validation when
> >> > merge3d is disabled. This limitation exists because, without a
> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> >> > preventing large layers from being split across mixers. As a result,
> >> > higher resolution modes cannot be supported.
> >> >
> >> > Enable merge3d support on SC7280 to allow combining streams from
> >> > two layer mixers into a single non-DSC interface. This capability
> >> > removes the width restriction and enables buffer sizes beyond the
> >> > 2400-pixel limit.
> >> >
> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >> 
> >> This patch is causing display regression on QCM6490 fairphone-fp5.
> >> 
> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> >> screen. When reverting this patch everything becomes working again.
> >> 
> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> >> 
> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> >> quickly?
> >
> > Could you please provide the resource allocation parts of
> > debugfs/dri/0/state for both working and non-working cases?
> 
> Working (patch reverted)
> 
> resource mapping:
>         pingpong=# # 68 # - - - - - - - - - 
>         mixer=# - 68 # - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 
> 
> 
> Broken (with the patch)
> 
> resource mapping:
>         pingpong=# # 68 68 - - - - - - - - - 
>         mixer=# - 68 68 - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 

As we have identified that the issue is what downstream calls
DUALPIPE_3DMERGE_DSC topology, could you please also check several
things (with the broken kernel):

- What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
  the broken config)?

- If there is any difference in working and broken configs between
  values being passed to (and programmed to the DSC) in
  dpu_encoder_prep_dsc() ?

- The same question for pclk calculation in dsi_host.c

-- 
With best wishes
Dmitry
