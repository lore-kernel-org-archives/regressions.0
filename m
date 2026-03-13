Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B301D86FF
	for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422060; cv=none; b=M0rbBYJ55QSA7aUwL5/YrsG2FSmOhi9BuHlxmq8GUGUc46pidOVrwMvr5qY6nQbwHxqaYV2Fgb1eRxpMM5HcT7ByzMCu3LT3qMl6/+pbkfBCqLDB9k5B9jMEt8X8yWpGzuCJw2GnpYaJof4OzPNhrChP+NNQ3yQ4GYDlt2wl0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422060; c=relaxed/simple;
	bh=wnGrAP1sODNKavYJdLIMQN0twxFHY7qFf+lSbA16lrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n48laDyCvl5D8xAHGieQQNZc3RNj27qdEAmt44EHaoayBPw+bQspRxL8auTZ9DyT8gBSLe00w8U4ENkIvg86kc+cC1BXHqMLPeeShK+mw12wYLgXup4D9D+1JmTijwob2ocmp+RZDvqU/y5LtZFUEXVc2JkQu+4D+gOSYbqb7hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLXFsAD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpUzDz+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLXFsAD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpUzDz+T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9Tj821498959
	for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 17:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ftmGZg82HsvVE5aL4YKHhM6r
	iSgn0jTKomy1uoJs+Hg=; b=QLXFsAD2H7ZX6fLnJf0+EpaoSLC6q0bnNyo2aQPY
	6lzVMFg3UlUMFL5IhKLZNE2/Ki377wMU7wPGpP/OFBHqUO+sZgr2ZGn3AwohP8PF
	9wMmDKmrz4O/tz4RNlilIFjDqFFzE+taxTsVN4C7AtnpheIK2/LiMDlVYvnW0wCb
	rh7JKFIcigKkUunUG/PwwvHHDmEfqKQW4Z+ruSf9f7FcO8RKxr7RILqUf+a+h6KJ
	gI3L3TBDnzkGODia/VGbexez9AC3R019Ia4OBad+Coy8j/MuLX6oaq60jOOjKtn0
	eQkj/fRCqXSFDpCoIV7uvwNJaEie/UQZF8XVDS54wR+Rtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hhht1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 17:14:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffb295babbso3573455137.1
        for <regressions@lists.linux.dev>; Fri, 13 Mar 2026 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422057; x=1774026857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftmGZg82HsvVE5aL4YKHhM6riSgn0jTKomy1uoJs+Hg=;
        b=SpUzDz+TUMrSJUIVZK6jO8f5ztQy8YL1QeFhZqTkD+AuZdVXW0eq/sW8AiuJZsnFK8
         2jIga8P3txaUE4fgzejVj4plvi9GOOa1K4JgfnGjW7DFZw8Ss/AU3tXDdbx5a0VY7hb8
         +eKIOn8674//TlL3rscymtqczYyxLkWdQ65H11nNmzTm6i1ZVLvhWhh11G1XSzz0DYiw
         JKZN8TFBopRt06pkOPEVor7BJjk/+9YmjV4P/y2lnLjDYQo57BsoPgrC39ItUbbWHNj+
         JzGEplmjdKSir8Swtn4moWsvtvXTLVMtD9JdUEHjQyRjVx4WtCQ0FZqUIIwVuTAXvY+t
         55fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422057; x=1774026857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftmGZg82HsvVE5aL4YKHhM6riSgn0jTKomy1uoJs+Hg=;
        b=oieeiPDAV1N19Bcqgm0jXYQZ/klVfqLGo2OngbUBkXOGk9T69uwmzmjRETllpVDAK8
         JBWdR8PND0Hcea6bjbehx0bCZTx9mgEch6XT7bkRxKCz50vmK+JuuRrbNcpxd9M0S1LV
         OXtm7czYwycTfx8y+81YLCD6nTOhAHKYNtntvvlci9hBBvIwKfUZmsq7t0jpea8XSsH0
         M5LPKmxAL2rsJ8Wuxgm0jKaEHnYrbLyv2X/pSDLgVAdc/6M4mK2z+c+Z5iy+5D+JXriy
         aHsCYkesw7W1QNeadwu4/T90a+uIkqKaJWrnEuC+RPGkDMn5IPTr2TjbP6OX2Fc+r6IG
         QTlg==
X-Forwarded-Encrypted: i=1; AJvYcCVVyqMpGR4dq2M04gTkuCfdO4NENmnyT3u0OcglHkbBXc/cu3tG6gZ++vfqmap1qAUIJBVVLKZ3UEXTcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHkg9hKhP8cT1El3VCcm6nFx2EkDWQBOdrpA/bkFNeFdWvBkIS
	EIdmKC0CMQFBKdXw+4hl1dO902IxaQGIuDBy+IS1QNgwZSdnbnkzMoRb7EjKOVLLEaL3Fch54Sp
	4TXCGdCNZGywtlr6rGG3afSHPYq1YvtvaP6VCKvlSnmg0gQQvKwnymVF8ZN55146NMQ==
X-Gm-Gg: ATEYQzzvs+yySKNNzdMH3etNSK1OUF48U2U4K2OELrepEOJkpiCmwESJ13rH4TO6PZb
	JguXTJGVLF9peJkk0qBIIavmPIgVUHsWvVPSJbfVGvhtZ4AObui3LzVUal28CaWOuAsNBrJOdQB
	kfy0FaYgAwaGTyzpokXNW7/z4BWWmqHUWHbxHO5yycADrkf/0F8myp7Hj9D6I6lwkBWlYNMG9dX
	RW4Bd4VOnCbGAEeAX+UlHaJjMrJihN5Gle+xSqOk7yhQkrNrlIeoCiRjeYC+do6dDYNtVaUdmLq
	CS1WMerqNqoP0VcZvKoLC5UOXN3fAwv0ESMmkFKiIEmRWubAxSCIg5DXYSXeBdOJWVgxPBJlj33
	29O1HSW9/vxV4rcfLiq/j+mnbkx/244Phsq/LLLXi/uVVmY3iS+VSwwrotHxyrtcJouack9X6FA
	NE/w/hkQcXkF6NbxxucqsAa4jAFBpd89h8/uM=
X-Received: by 2002:a05:6102:304c:b0:5e5:66c6:d23e with SMTP id ada2fe7eead31-6020e1aa78bmr1714992137.1.1773422057425;
        Fri, 13 Mar 2026 10:14:17 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:5e5:66c6:d23e with SMTP id ada2fe7eead31-6020e1aa78bmr1714980137.1.1773422056967;
        Fri, 13 Mar 2026 10:14:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67dbc223sm16625041fa.19.2026.03.13.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:14:15 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:14:14 +0200
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
Message-ID: <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b445ea cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=GhyGFkOBsQlZH4ZKdbYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: An0k43_9OJZRPAMNOnv9zrmvifMYjFkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfX63qccKSZlG+X
 P4ONph4U+phczIOmxlQKdNSCZhxoG0Z87sqhsqKAcnGJw5yjpKNQcn7u9tIzE9l21jTiTkJPZaU
 SUcMO/IQZ+TemqYjlYHJrqS6eKunsy5med71HojEhchkXVlKSWhwdlffUXYeIpKA0YxIrNcb8KO
 V+icfq6m58FeGF0CcWvpf7+oXD4wgs7tqb2DNtFJFyycejg8y29cWJqOaBVegwLQm8+QeXReKmU
 CzIQr09zEjbjKvgWzgMxNUL9ff7gPtDeMYi2F9poJSYX+lF6PE5M5k34emC3zb+f0THSF8dElFr
 ZKfGikKkN8miJzGCoWadCl9XEcBVXzR245e5xeQTMuFU7BswIg8jwr6ImiYCVelPqPSlpXTyJW9
 tLDuBlcvf9mnDEOb8USe79cXQDXiqUgE8hTZEuA4yjch0e56hXLhReDPLonpYtex2XD2LiMYZrr
 NANbjGzyUsQuauVlL9A==
X-Proofpoint-GUID: An0k43_9OJZRPAMNOnv9zrmvifMYjFkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138

On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> Hi Mahadevan,
> 
> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> > On SC7280 targets, display modes with a width greater than the
> > max_mixer_width (2400) are rejected during mode validation when
> > merge3d is disabled. This limitation exists because, without a
> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> > preventing large layers from being split across mixers. As a result,
> > higher resolution modes cannot be supported.
> >
> > Enable merge3d support on SC7280 to allow combining streams from
> > two layer mixers into a single non-DSC interface. This capability
> > removes the width restriction and enables buffer sizes beyond the
> > 2400-pixel limit.
> >
> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> This patch is causing display regression on QCM6490 fairphone-fp5.
> 
> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> screen. When reverting this patch everything becomes working again.
> 
> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> 
> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> quickly?

Could you please provide the resource allocation parts of
debugfs/dri/0/state for both working and non-working cases?

> 
> Regards
> Luca
> 
> #regzbot introduced: 2892de3f4f985fa779c330468e2f341fdb762ccd
> 

-- 
With best wishes
Dmitry
