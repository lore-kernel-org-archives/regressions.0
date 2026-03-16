Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C33ED5C1
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690897; cv=none; b=K8y3jxT1C4NfmIsnTaQTxzpRsdU7NZkmH5Sk0FjicVUgONvIE009caxyOi+jsCgAIx2wosieN3IzhaGK+6tN8P9zOXmaS9nw5r22vju2+Jj14h9MtTjjuS0DUWwfgQt/JHzWpoMABBJrlS8RTCNceKo0Wva5PaIObGPhlwi6cfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690897; c=relaxed/simple;
	bh=jGryuGs8NIg4evojpko6Xnvf6SVVFXEFBx+g4p431Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMN3WZ9A3/ASfm9/7WsaI9o/baxi8ZXIrKAB2vDWn1Rno2oqenS6SSexsuJjwRBKuyDv/bt4ZcLMOlnDZDtKypdJkpvJ0KhVLs5FhsicGOcXfhLwfoavPBa1A5cKZKkmclUQdHccF4he7XEzMcqbEj5nyzkTGkSA+0jtOvyrLjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3FenR7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJUe8iv9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3FenR7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJUe8iv9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GIgeGU1428842
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 19:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pIDGUC66DjeB5/G8Sh3DXLNt
	596Pz7YBrzXPtS3KZpA=; b=f3FenR7xKGBt7N689oX1FC7QCS3nZKWyany+Ukve
	AhGgqwm9iAgDQemKfXde2XKj4dmel1184ERT0DJphfT5NRqMNwVM113O+oewmBfb
	l7WjLUQxTBYuydQGuiniirF0uwDiy78WWJ/vMQ+bvMy60eo5koNmr9Nj8UWJ1YJ6
	cY2BVEbsBLiLpzgbgPbO+gH0RakTe6GjTAZyKnL4zYxHDeQjaP+GFFRwOjQAe1/S
	auRfD8JKoGljAfRFauPH1duCup4fBX+Jt3rssfxVio3bu3swuUzzt2N14iPhNOcT
	UsFKEZKkbyVsx6MGpXXL0csd8LlSpJGhIjUoJIhY3wAHrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh999t2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 19:54:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so686305685a.1
        for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773690894; x=1774295694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIDGUC66DjeB5/G8Sh3DXLNt596Pz7YBrzXPtS3KZpA=;
        b=VJUe8iv9bXqrJ/R6T9f+toG0P8OYW2isPJna7l8wr17+xHjnUvGGRqHC6ScqEkceFE
         Usgp+4EctB7oDfikx/U68whRa9rfUlGq5RLayrwGuGD6fHsAnTKXqlhRnWLKczb7I5Yi
         1/Xw8XwGVZYA3JlKQthIKpu9mdeP9sWGr7UYZSZrWt5F17l19mFzH0vtwPR77CCA4RC8
         fA7YaJBLHjq2cVZXSlLAIj1OlTpGHnKHrACVkGeevF2nqL7y9ezbW+DPRmb5Ci8sSyh5
         pfOoDWteigXwrPO4CetLIWGKnxpxPgka/v+M2X9UAndSSE0J5N9GjYSCaCZpNM8wgH+T
         CcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690894; x=1774295694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIDGUC66DjeB5/G8Sh3DXLNt596Pz7YBrzXPtS3KZpA=;
        b=mCM89+WEpxh48PoSmAjoZp6F1uh7cLWmLh3Ub9je/ZnY2LRD7ow8ob2Ekp+stFclGJ
         88xSPni7xMqJYXH3cGA9puQIexBq8juWeXpzMyiL16iEJZBWV+YE1vzePUZdm/Bw1ENl
         IX1ipCpd18J0s0QQnCE+rGKYtKaZPh8+pql1tOUtQr1yL9YTifb4u+geN0FBVkn77MW9
         YF4VzGsggQ9aRzHuRZSENcccd2Cw3bGFLMyOU1FCVc/FGN3HmVz+MA/hk+QzfYfuGmK7
         zcKsUbFgFOeRHaolKVBxi34L+RA7Qcq0lhJ2qUFpP480ulgDCrdnPPJne4Sp/o8+as3g
         +eqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhRwnY+NW//Rz00ROgPQQe92kOniesPpaoI8+MMlouadrPn9Yu4A2I1VAvvlGuQxkrzhlSvICUOdUSvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOO4PsukfMlqcH2i5zNyO+jugUjNueHzPkBL1nTiP0HLcGfZ4k
	qywNHsMyQp9+KUe4ORz233mJluEhD32CS5zSQ2KoAW1mApTEpRt7NJeKEhRhLGvSj9orpxnFlVc
	12YYDPBe5WIfsuaYwsmEeA/7kc7BoLSdycIvuyaLg/E3935t7poDJqmKOGqGzn/NACw==
X-Gm-Gg: ATEYQzyoAkcMHw6u6gmM8qz9tSa/ReWI2ssDOv98Q2wN97MFD8DbfuCf2M2+XGr3fJ4
	/GEaIopuUWJdtQCkS0zejHhEWO3kTAhUG5aaLFRF6cXZ5tmBL1DmAgmt+iggPEezgk/jw0EiqQM
	nQGJ9hCJ9niyfpTk4uyhf2AEOy7qKZsQ7+toh6c9sJWSmQw25k5VMhjulPN9VvjnKNK7d3VyW+7
	t4gzTnS1ZLDsh982ZAJgpDN+ZmVvCBZmFoKxYxPPkH9BW9aP7AQs0mend8fTU2sFDje3vzUxeke
	hyKL/Ix7Ld6YzLexeVndJn5+hsazuaZ8b38l3drQCeuufqaTEjps4MsUSgML16bSJXytbqGXTWf
	G9nraiJ6STXnmXA8/JBxoSzWBL3t7KZPQH8w5KtifE+M3ANmDSOUn5FbILNabnNiNrYPjXCo2eX
	ndV/rIQOd/QiqP6ib4FDCpzanRPKlZssSFFBY=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr1799113685a.38.1773690893990;
        Mon, 16 Mar 2026 12:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr1799109585a.38.1773690893417;
        Mon, 16 Mar 2026 12:54:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156358066sm3681927e87.63.2026.03.16.12.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:54:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:54:50 +0200
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
Message-ID: <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>
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
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b8600f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=PZxLfFMIzHLfKC7kn-cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1OSBTYWx0ZWRfX/E5c/JRUUaYu
 GthgdTArxyS+QILVSirWxmmxRqCIc8x1tQddtswbsXwCbVltbZG420kk1BPH8wL+XdmJh8+D4Wf
 q45NkcAb3QyexX+RkfYSudUvJfvUqvAxCdgfJKxWKIYTA9RqYNf2ajKC4i/u6RIfAjShJoT3kbU
 wuiPYzsMLiRf1o0r4H1+saX868Y672xOQaqr+ZOfPK6eMJ+aptqvFUqa0tmJ2Pw2x7SlUyF3F89
 LmJ6wKUTC8lnxojMc1i1L/JY32Yo+6tYNSgOxNeTf4ICjM0yJD/GY/AjK14shKs9dssR8kLwflA
 QhuOQY+jlTbGLBhXLCrhy/Bi7gzWYPgskYnHzPtGGKxK++v3W6Xjvm85hVVEY/AJUX+Ev8O0F2k
 mz2nu4HMKBS4ItoEUtgwT4cJlqQMuh7JdcqueUsx6bobJjvGc91m64AmqupHyHZ3IMfpPeY7XSd
 9Pwpp06BmDy9engTXIA==
X-Proofpoint-ORIG-GUID: Psn65rQp8S3ZQpHLjenUStwVyLPhdi1N
X-Proofpoint-GUID: Psn65rQp8S3ZQpHLjenUStwVyLPhdi1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160159

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
> Broken (with the patch)

> resource mapping:
>         pingpong=# # 68 68 - - - - - - - - - 
>         mixer=# - 68 68 - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 

I see. It tries to use two mixers with a single DSC. What about someting
as simple as:

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0f4921b1a892..cbb7caa194c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
+	else if (dpu_kms->catalog->caps->has_3d_merge &&
+		 topology.num_dsc == 0)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 	else
 		topology.num_lm = 1;


-- 
With best wishes
Dmitry
