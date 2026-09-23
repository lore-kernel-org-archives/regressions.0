Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61D57C72C
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197140; cv=none; b=epWyFmdePjFjFHYuOLovU7YQS4CZQxS6Yc6DixOWNzZcyXeawWeyfDRgJEgPgRnBasEA1OYZ/K27eQjkYRz+CaRk80/XiBJ4+vD+YAwIU3dhntOpocsmsX/HTbR1+kuiatLqPEYjPKsDtD4bliyYwa2NqNgHgmzIKV+R6IW45FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197140; c=relaxed/simple;
	bh=vXmFA334QELe6ci7/KaCWn8302UvmFUJuxHATZA3VvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTq0BfuEL4RJVLm6FXESFNzvLqj+r18KK7rEc6At0rbBMU+SJeDtrpH2n5qg5yRbr+FO9PzjRrRS4PsJmDXOhaznam/Zfcim5sDAHJ6ynAEmUBafVNm1nqCXDy5jouB8Ti7Yamrf9A1g1OEbKUB/gDVntiCmNtemTVoDhuiOgKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRPJ/LYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2VKa/W2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRPJ/LYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2VKa/W2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJlYnQ4093973
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 20:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=; b=NRPJ/LYX0U54OgoJ
	g+VLOhVg3+gUpxMhVOirA+IR+q22MtJdnylA9VJX2oDP07y5UqGO3L9PxrnaRy6U
	3JAUVFOt/t44h3aFWJzE2MbhDLY47uv7A1URB2720RIRUXx2YYP5nJKRNNyoqhI9
	xapuPAdFspqTsJZ3VsEDk9pwu1wQ/vSG5bxQY72GihUD4pznEJFoQemg16NgQv6k
	17+piWr3c+n9ovlf3lEg8nSZkK9V6GjDm8zhHnyzennnBuGoPqml8jy+941vxpWt
	4GuTWZj06Ggot9Pp5RJ0dtZQHpXKPEu4/Iqr8tr4PVoyb+JwJLYGRNw4G9z4Rzd+
	Psc0nw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrr8e80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 20:58:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912348a0ffbso11576016d6.3
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790197136; x=1790801936; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=;
        b=d2VKa/W2JRmsMtPu4r6DJkZnROmZpRV6rm77HLOpXU/IF6lGp8QibSEAaoR985l31P
         Yx4kUyaf4DYRRDPo+zTKHjqNHGz8V+J9nccmobpNByDR+FCQNKNwU6yNgixc/I7vrV+b
         qpxtZIwjiptyAzVfD9MH8VoLmYsjzdKmYlm88AcAzesdNPaiy+IG6tfTYnzQn77q4Kf0
         4Er6GgQi/D8KYBuOAWKuM4dgLqm+Ov7q+kFZSdSqDdm3kxiIrvKk2Td13AzHzLkt1SO7
         YlDRTzJuGZuawmDXaEOGZaxHI6WsEjBuxAQ/Zo6fDMOtfKWnsXszhKVBcfoQ3x03t4Q0
         YEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197136; x=1790801936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=;
        b=SRRNnFtsqpLY9JSpYP563YIp6DH2gyLuUKxsiDLI70k91kuZhVdaOcSOqR0Xhit95t
         yeezUI8LWlGIoi1uwZLPBOHxjoJEZNEuuT/lRMp6CUFlpA5JogY6xLQRpiFHr3pyVkN/
         OHaO0DG097qtOjF1VHUjGkhCu0e2nJkyLKzgkgj1joCFPrKJpNCKzVO0x4jZGAKVatSE
         pY3l4AdB/Wd6GcQK+W0WfIO7LCzr/sPg5Ny2kC/NiI3ggJMILXlIOIjQjVBd8iwyBgEF
         sPVG6UgFRC5JdSShm+IKbIvMXqrWVkSO8N2zIO3FbbIHLSXS4YpFHzuBG1TJpnEdXUTr
         Zk7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaJszBsqw4+H9KWzjCpWaF+M9aDkyU4i66milI1xd1FuTFrj5R00e2wsVJ4ZjDZb2CS0enbfL50XQZDw==@lists.linux.dev
X-Gm-Message-State: AFuF++nisEEQa9tedWfytPGwSCMSluBh8CN+lR+CSThjC2NJ1x5QA2am
	YfnRLo0C8fviSmzllCTUBZDmWJvbNXKubbxzA1t9W1WoTi/t2IqfmliE7OZMYwvznKgxrgns3nF
	x70TKKH0XbxAoqFdgDkwcsqR/iT0nv7Uu2wXf/fDOJl3GN3WztXPyp8PoFJhMeH6raw==
X-Gm-Gg: AYBFou0TR3ElHr+a+kmdooGfjFrS6sDxnRNmz2B2qY1UqR6ChunlUycqgPU/QmlNEhJ
	9tqc8VbSbyGZpWRaJHm8axXnljgZ1FYdu3MfM+iJo9qCEKDDpeu47vdrxP5DptYLlNLCCFsrXst
	sY3anVVMiklQBCgio7gho1LxO8PO1webkgE53El9LtMAGDcuLpEXIYCNw4e4iouE38RejyhMy1q
	eyjFJfAeGiXMgQuDsf26AKtI0BAgdTGzdr+e5oy6NqH46gLWoDIIzAYh3X8PjoJ3igP0clR4cxm
	ZIt2dZn68hwsi6SnAq/JY+b+HGux/CeE0xkUB+3c1Ht0G+3Qd3JfvL14sMDgI8CnXhUM6+UXmoF
	ikGZDOCVR1z4HcRmCO35OTkzZbfIVfIDFZvvBHXa3KU51DXmTao4G9Km5tTksP0Hqmn2mFcJzb2
	UG4KbuWmRMRdrI
X-Received: by 2002:a05:620a:4415:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93c348282c5mr60118385a.66.1790197135584;
        Wed, 23 Sep 2026 13:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93c348282c5mr60113685a.66.1790197134958;
        Wed, 23 Sep 2026 13:58:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d9b9972asm705666e87.18.2026.09.23.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:58:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:58:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <y64m2frbbg67zfukyuuds5cx65fx3rjxfujbckoerv7sswhk2u@i6p4k3ul4aec>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
 <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
 <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MyBTYWx0ZWRfX/Rw3wruAqtPQ
 mYY45O2K6pHPrmoofOn29dhxIoKolHFI04ZWZwzk/SQXxBfdRUR88MmdmALbaQpdpIKaa04liD6
 psomloL3g141tRmMWeERzfEv6TfKQAQjOp0wSIdwaBWjlPGk7JM+O9RaDJuAHnEny7dqkuT6N44
 cDGd0axPorkTCVJOYu8MokEOweYsmns36RZ9qY0bZD9UgzR+qc3Ku7ygxXmbS79AcqIaoBRFPPJ
 QYYqMewm+ZuxneUCsMP7l3uD+foMOUgswFdU1ufyh1QSLQpcgsqM3YSzs7uWctJ6FvJMRoQg/E5
 pZbddNyQHX1J7kpvSi5NS1BtrhTiQH/5euV9Z46zAc1Lv0frLXe8/XpWqbrywyac8iRTFUxN1ww
 anbHUjgveED68Msw2WjOhsN+fOy7HwIBT+OB8bhRPtSscv25VyD2DBSa3ZdoXPMZ2RLd3labe4M
 m4KBZXJk/EqZlYqPDuQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab43d90 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Gbw9aFdXAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=f6ktmeKAyBHkVzSEkbUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MyBTYWx0ZWRfX/TSaJ/3kV4gP
 8QCvFyqN/8/Z+IoByxu0ziJIWXjqMm4IpEjAfOh3wE6YZMKWq770Mh3ptUGCowhns3MyfiyJx9V
 YHSq2u1kRjVKVQNA59u9zw/kV/krjtg=
X-Proofpoint-GUID: DmI420ndBfSNpBnWOOuH-UdIWnjB7L-A
X-Proofpoint-ORIG-GUID: DmI420ndBfSNpBnWOOuH-UdIWnjB7L-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230083

On Wed, Sep 23, 2026 at 12:48:21PM +0200, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 7/8/26 15:31, Dmitry Baryshkov wrote:
> > On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
> > > On 7/6/26 11:52, Mohit Dsor wrote:
> > > > On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> > > > > > On 5/4/26 22:09, Mohit Dsor wrote:
> > > > > > > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > > > > > > working and non working case. Lilliput is just a normal display working
> > > > > > > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > > > > > > Gen2 only.
> > > > > > 
> > > > > > Neil, Dmitry, and Mohit: what's the status here? From the outside it
> > > > > > looks like this regression is still unfixed with nothing happening for
> > > > > > weeks now. Or has progress been made and I just missed it?
> > > > > 
> > > > > Thanks as a reminder. Unfortunately, it takes some more time (and I've
> > > > > been a bit overloaded lately). Worst case I will send a revert soon.
> > > > > 
> > > > Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> > > Hmm, no reply. Given that we are entering holiday season and are way
> > > past what Linus expects in a situation like this[1] I'd say we should go
> > > for a revert, unless some fix shows up really soon now.
> 
> Sorry I'm very late to the party, and checked again, reverting this breaks all dual-DSI setup
> on SM8650, and probably other similar SoCs.
> 
> Here's a complete log of the breakage which appears on the Ayaneo PS2 running v7.3-rc3 with mainline panel driver: https://gitlab.postmarketos.org/-/snippets/65
> 
> I don't see why my fix did break this use case since it reverted the way the dual DSI PHYs
> were initialized to actually allow the dual-DSI setup.

See commit cb55f39bf7b1. Without PLL_SHUTDOWNB and DIGTOP_PWRDN_B most
of the PLL registers read as zero. Currently the regs are handled
correctly (almost). With your patch in place the SHUTDOWNB gets dropped,
making PLL loose reg contents (and return 0 to CCF as the selected divisor).
Current code depends on those two bits being set across host_power_on.

> 
> Thanks,
> Neil
> 
> > > 
> > > Ciao, Thorsten
> > 
> > Please send a revert.
> > 
> > > 
> > > [1] To quote Linus statements from
> > > https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> > > 
> > > """
> > >  From 2026-01-22:
> > > 
> > >   But a user complaining should basically result in an immediate fix -
> > >   possibly a "revert and rethink".
> > > 
> > > With a later clarification on 2026-01-28:
> > > 
> > >   It's also worth noting that "immediate" obviously doesn't mean "right
> > >   this *second* when the problem has been reported".
> > > 
> > >   But if it's a regression with a known commit that caused it, I think
> > >   the rule of thumb should generally be "within a week", preferably
> > >   before the next rc.
> > > """
> > 
> 

-- 
With best wishes
Dmitry
