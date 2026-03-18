Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F3175A9E
	for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854263; cv=none; b=Pxgq8y9uskvhbb6dB66kcUahOGL42qKqev83ZzsqGd16GlqOe7wtPwkjCpc11L0JeLwlyPo7iafXaYbuFVeWM9FYlDDb/h0DIdHKPvhuQX6ZEmvG4pUHyBjT/es67RS216E0qZuCfWhNOb4XxMjln4yD5+G19+Xcz9h2I3Ep7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854263; c=relaxed/simple;
	bh=SwbOaqRxn0YUzkbJlTfK2L07SYJlosET49dg3aunK70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stKzOpj0GkVhm1Drpw3rsmEvwmicuIQZr7j/0N6RfeA9fceP6RaKITw7TC0H8oZ+MgoZpxLnoSWAxWeLECwi+dC3zfEqN3aLHyXlP8S4QvKjYg8FVeLtGkE++NgGIZ8MFrjglAWz7v9khnLBcMxd/QwsT436ituNCsJNxepzn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3pLZICd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYlUVm/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3pLZICd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYlUVm/5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFglOT1788880
	for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 17:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VkAI+SqRR5EwHc2K4Pa/6PdC
	emEOi0RfCNii4UmGZ90=; b=E3pLZICdUK1fxxET9kYCRr7Ba9xurU7Jt2riDZzV
	eP0TNfAYdKX4Xb+PYzpbqgk146E4iKhdANe0Wa9QI3RWqGRki3brK0TCrtQkaC7t
	EIvW0eqImLyoQ4L3f0hr/uvRxJUtnnEdxIvIxOSp7HAgnbyB2pr38dc1E6OTuhu9
	whtCc2LLFPnLmU8I0zWxaMWRxSIWNCIcaXMnaoYlMMwDoN3ME0RnxeZc2b56Ndbi
	CyE0bsaOr9WCjKP2uXTxT57W092OUZ0xXG3eIUohUy3ubNq79aqga4ooQ6RAS+GF
	drVOpm3R+LXBsxbh8QEDY6abN11J8ly4Tntl6M75LmDH0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqeuc0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 17:17:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509070bda13so62183701cf.1
        for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773854260; x=1774459060; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkAI+SqRR5EwHc2K4Pa/6PdCemEOi0RfCNii4UmGZ90=;
        b=KYlUVm/5ZFV7lTzkSMVMw0QFuV592m3bb1S0H7qU/BaqJE4gTuyDd/t4xgHZIpZRMd
         +Mpf/bNoVHtxEoC2wquTpzMDGRWB1UrA1mzoosAf5MHMNqZxcc2WMm6uiOA5A0Or60hS
         2uWhlkBKPrkOKQQ7/OJpalKGZJpZHmXIsZ+h00x73LF3MQvgqvmxP76UT99kJgF7ovE5
         YX2tiOdYo0RmDEIaeNKavOwa3j2lcgVgaYJJuAy9SuvmVNiSxLS/yqvb8G/z/7LVQ3eq
         DAqg4oEfA2maODhpfpniNrd2+If1knfqARia+vx/bXcqbuWZodw+XK05dfZjkoM+NcqN
         G4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854260; x=1774459060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkAI+SqRR5EwHc2K4Pa/6PdCemEOi0RfCNii4UmGZ90=;
        b=lV9XgUbQJwOk6m8FuY4S1r9riMkttxnhW/Tntar811vtIHkab3SHT7upFqq84KRxoq
         R1wOuq0D/2ZdgyMzno7aMsfvnIarK0M0bUh/8lhWBJVG1y+t2oO2/NgrMjw1sAljN+0K
         ogBpSteHlodT2kt3xOo+oseUFAKRDoAY6QSEDcIh2tTdezmv/f9qlUQ/qvp1I0KMd1mN
         42ryKMQKG2KzyuGc+3QM7kTyW+Il22DbCSepE8t47d0YbMizxTHQqFZYdYID9tFlR2R7
         TT1TEi+zNJ9rspiDbcNmOyN/eAfFKl/+kxD1soNrASGKlbHTTnIbSTwRfwJtg/aiPkD3
         YdPg==
X-Forwarded-Encrypted: i=1; AJvYcCWzbbdcymLEnnPhawYK7KmRgzydMLCjR3yj7iD2rJLVt0P4BsQCqgsJ2j98czH9bxDmuBywwBk+jcBXjA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1TYx3DX0le4+wkYQDDgdvT588471wu3KOet5W0hZm0uu37dRI
	RiUGxZz6AMcmyoE21gMiTxaEeVG7LdeM6wXUzM7PHDXgUj04WqdW0K/KNQp54ZlBEc8dNyHShDG
	h65U9LnpSLSyKdVmLjOHTfhbfGYSm3CiXIeBjS+pId9Jbmbp25iy8W/zqpPq783ta/A==
X-Gm-Gg: ATEYQzyBsTbKCFuorwceJZXOd5D8Ge83v17IF0Ypl6lj6g9YWPbDVZ+AdA/DT8ngJRn
	TbXLPYu9/FrxkaOHaQBqTneah1RSQyVuiy+oVqeoSxOZZztvWhVGPBE/acQjY8N5LvuACaNaxGI
	UpXFLClvbcL0hVU73Og81uOnhommZv6yl8Wnfzok37WOnmbcKu8o9H9f44WPUz0dG918z0KSQLm
	5hTMbbDGG80latSzRvEPuYFIh6vPbAYI0FfpNtiJAaCIM9JAqhNVW/xojdUq3HNUn4gy21GA7h1
	bftyJWS5gc8RNEdQRk4jh5Rs9qlVXN7pXGzM8/X6EG5PmIk24F2G9LTol1KjD7PlkmfrPtCLWFY
	2K7cCDfajfWxavxfb618HkqOlY8Z7cRZ0XnERJGhwwdDsq7Gt4gloKrNpM8HJks6xcVUGSg8km1
	KnkW3T4adxGz+VNmuVGfwafoJW3HkLHh/0opE=
X-Received: by 2002:a05:622a:44:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-50b247043c6mr5164661cf.19.1773854260005;
        Wed, 18 Mar 2026 10:17:40 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-50b247043c6mr5163871cf.19.1773854259047;
        Wed, 18 Mar 2026 10:17:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54d538bsm7852561fa.35.2026.03.18.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:17:37 -0700 (PDT)
Date: Wed, 18 Mar 2026 19:17:36 +0200
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
Message-ID: <2zgpsqzcktlxu4yrvx235zh2llsdyh4mkreaziv66tkcq24uj2@3hkq4nskyscp>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
 <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0NyBTYWx0ZWRfXz3ZyISnwsKzx
 UypdWDRpGFGVQvEIsNkm5Rb3hHVHfIZ6s6kiMVUtq+OYbJcW77xc7x5PKxrnOF6cPw4uAO66xpn
 ir9dbx6vctVociQ6XoUFofdbnK+FSEkNHH/pbyqDeL7/kF3DiGEs2vXD1clnR8W5FBanvv81qX2
 FCCR6legaeD2vOpQ1VgVK6ezLmhUviyZwLxMD/1Ac+y4cM8Ksfz0QTSPYMGYfGeitMQVlbtF2/3
 abwBWjFFBHZr0pLJOFCNO3fWqzP77daB7RpBMx6uPQIPbA4mY5Le1Ce+fKuA4/FsVVlLItx0i/i
 yNACl6EKIPLxa/ty1OEst8UDIhhGALCGJcOm38flNkUIggAwVFI66NPcOyce+y8H4tj2NTN5qea
 A2J2SZwO6d0nYV9tyTd7cQClbOxfX/TTHwbU10h12jbDC7w35IAnhxmfWP4oVUd/noGLB/60Dxn
 xioz8fiQF4tJR70v74Q==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bade35 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=BcIQnNHhHFwDr4imAaIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _Y2eSmD2rWcn618RniCjSKEQDtiDEsjI
X-Proofpoint-GUID: _Y2eSmD2rWcn618RniCjSKEQDtiDEsjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180147

On Wed, Mar 18, 2026 at 09:45:23AM +0100, Luca Weiss wrote:
> On Tue Mar 17, 2026 at 6:45 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
> >> Hi Dmitry,
> >> 
> >> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> >> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> >> >> Hi Mahadevan,
> >> >> 
> >> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> >> >> > On SC7280 targets, display modes with a width greater than the
> >> >> > max_mixer_width (2400) are rejected during mode validation when
> >> >> > merge3d is disabled. This limitation exists because, without a
> >> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> >> >> > preventing large layers from being split across mixers. As a result,
> >> >> > higher resolution modes cannot be supported.
> >> >> >
> >> >> > Enable merge3d support on SC7280 to allow combining streams from
> >> >> > two layer mixers into a single non-DSC interface. This capability
> >> >> > removes the width restriction and enables buffer sizes beyond the
> >> >> > 2400-pixel limit.
> >> >> >
> >> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> >> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >> >> 
> >> >> This patch is causing display regression on QCM6490 fairphone-fp5.
> >> >> 
> >> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> >> >> screen. When reverting this patch everything becomes working again.
> >> >> 
> >> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> >> >> 
> >> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> >> >> quickly?
> >> >
> >> > Could you please provide the resource allocation parts of
> >> > debugfs/dri/0/state for both working and non-working cases?
> >> 
> >> Working (patch reverted)
> >> 
> >> resource mapping:
> >>         pingpong=# # 68 # - - - - - - - - - 
> >>         mixer=# - 68 # - - - - 
> >>         ctl=68 # # # - - - - 
> >>         dspp=# - - - - - - - 
> >>         dsc=68 - - - - - - - 
> >>         cdm=# 
> >>         sspp=# - - - - - - - # # # - - - - - 
> >>         cwb=- - - - 
> >> 
> >> 
> >> Broken (with the patch)
> >> 
> >> resource mapping:
> >>         pingpong=# # 68 68 - - - - - - - - - 
> >>         mixer=# - 68 68 - - - - 
> >>         ctl=68 # # # - - - - 
> >>         dspp=# - - - - - - - 
> >>         dsc=68 - - - - - - - 
> >>         cdm=# 
> >>         sspp=# - - - - - - - # # # - - - - - 
> >>         cwb=- - - - 
> >
> > As we have identified that the issue is what downstream calls
> > DUALPIPE_3DMERGE_DSC topology, could you please also check several
> > things (with the broken kernel):
> >
> > - What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
> >   the broken config)?
> >
> > - If there is any difference in working and broken configs between
> >   values being passed to (and programmed to the DSC) in
> >   dpu_encoder_prep_dsc() ?
> >
> > - The same question for pclk calculation in dsi_host.c
> 
> Is this helpful?
> 
> Broken:
> [    1.247165] dsi_calc_pclk:649 DBG pclk=111546490, bclk=83659867
> [    1.490559] dpu_encoder_helper_get_3d_blend_mode:309 DBG BLEND_3D_H_ROW_INT
> [    1.491008] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=0 initial_lines=1
> 
> Working:
> [    0.998043] dsi_calc_pclk:649 DBG pclk=111546490, bclk=83659867
> [    1.233836] dpu_encoder_helper_get_3d_blend_mode:313 DBG BLEND_3D_NONE
> [    1.234277] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=0 initial_lines=1
> 
> Or do you need some more things? There's a lot of data being passed into
> dpu_encoder_dsc_pipe_cfg() for example so I'm not sure which values are
> relevant for this.

It looks sane up. I will try asking internally. But for now the posted
patch should be good to go.

-- 
With best wishes
Dmitry
