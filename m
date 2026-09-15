Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADBC41D4F3
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476380; cv=none; b=fREaCo+saeHke1CAnzH+IvmBbO8d6YoPFkp8Y2clyx5f8Df6aJZmSkNULoP0q9OXQ6UGUl/A+PV8tiFRjH3Fbu+feykT5SkcOVCjWo2bMGeSori68zOEMs42C25RNEt0BDdwoaLyTw+/ru9SQRSA4CdV2knGtFLvBqrPv97GaIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476380; c=relaxed/simple;
	bh=MFvrABvZfyoApq71yJbOooDIx6a0otlO9jt2EdnP3HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P14ni4r6lthNKmg8UxyqjixRoCHFBRYg47oBvKWzC0Kwk1+OMGWTCupnXbLHiCHY+A2X2/fBFaSx5cyPKTdCULiITECWixMB4vXbwH6J6Awiejn0RphwOdoLv9UDPlW344tJp6MVw0qgFgk4OeIJRSKOozxykUfg3SKyOYq0lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJ8uhZ4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz1GAa5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJ8uhZ4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz1GAa5+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hSYI3742209
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 12:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w9qFLTvgJUSRq4Cj2Lly0+SK
	Yzt9MO14DnLjeqUt63c=; b=VJ8uhZ4VK5CqTV/9wDmgaAd1dfmS157o9prMfpTU
	gCBQh70HIm8LpBfWSYGmPfr6OWcIYS8kgqe1iNQS8h765EVRAAp7e2340EcnhwFP
	Bxqf93SPqZRC67MkUWj7Ve3B/txnbBVimzQ9JH7ZfWfhMXn88B+PrW+A1+JuTguE
	+8HnP8R526UC1dEfybqYaLxHDwxTNJoboNtH4snUilNxLPFpUtu+QGWP3y0JCIMK
	R57X+Ybnw0aWU5MY5AUDTvbKrZJtsZodn2U+4j2i3XUaDmVhqw9Qq/fmy8uk9icg
	Y7plGtMbsTzKNiUPv+HHqEZAWvjDB8dXr20wVjL48CvAog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1t1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 12:46:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso669420085a.0
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476377; x=1790081177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=Hz1GAa5+P7r+ppNTm42bwxElrZ+9zgg1FRYsGGUr68ysq7pbFXAr949zy4acyzG299
         kbGOMs+0brmUS2UXSDssuFuZ+vS2tYboexa3+B7J+IJeDmgNomczyzc8AAvzCCYgy2dR
         pxKLXhp9X+jQ641D44DYnZQucxf+BrSM6yT+WK2P8KPodpV673x4qcFFBCM33KwQ0xTb
         BC+N9w7zVNfOGu7Y38l0yb8rjkAblhj209T5IYBRLvZXg4ZsCoz1az3kktBvKlPtrKOM
         sUpluJki3lTSX5CT8Aak6nz5uRvKE7gF2tVNk3HW7aBZN7db17LSxoLcKa0RQPeQNeh5
         OU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476377; x=1790081177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=ykxl3Qdx1u2qGyWXj3uwnT8uu6W9J6+1aHMp9GpWiUmsLu/T64xUvFL2XLeK3jGGEs
         MaHzgk7f2jfqLW1s7Z2Pc6RyRbh0I82oXIA/NRDBSINnXD29cJ4dFDnR62shR4Th0cBz
         XGqFQZcCSUL/EhJAPB/Eh+geMB9SQmsmwGxB6MfzyPClcQs2jeogVRukay0w+NlPHNWf
         MMqdFmlHW9RfA4HLa7N0K0f3m+Q6GbuurcS/jMdhUcuIptbjlg0p9XqQHOj1Jz9ehLOd
         xB/3Em8+NLl7r1Wv3fkfHihdcKqHNF0JbfHiFpvpCM7z58LKN32HFDbQJllTRx++RGE9
         +Hng==
X-Forwarded-Encrypted: i=1; AKwUvBwB0h+V3idhybUu8ivIvSdeOHlbHiL85BWpCIyR9YFhsnmZSrcvV0q2WB3IqFzFETw5/v4lfFvOqRQj4w==@lists.linux.dev
X-Gm-Message-State: AFuF++mTViPGrSrBi8niI3VRgU3Q1ex/vvxSyecSye/tsb2Io22Hy4WU
	pfw54o+VEYW7xb2DUyfdcVlcttjGJQCO71tsTSJjh314fb0ZfvCkzdh69CvJTUaCA60Fv42XwLa
	nrvVJh6UhI1Y/PkWN08+KEG/K/q9+xqMFMtlXRgZ8PZ/NmLjtE0Aqavyqh06My1aZmQ==
X-Gm-Gg: AYBFou32nJqBzpsDz1bMywbdEfQkEQFdp9/uv1xsuD3RnHMQiTZVJePKvK2eynO+fdR
	nOk8qfhPrhWDFfiMjK2sLBZcmBDRjnDjQCArJsWtSan9i9+zywyMVGIctYZZBCCxdeA3/Lll+0j
	4vxvy0NEIyaovVkoa6Zp+y6YMbm/Rg2agOqJUBEhHRCLNfiCk9VFLDIeG0gFKZqM3p3aPr1dWHF
	XQAbX5/y/A3Nul40kNI3fGS86d/hY5z1UUHXASvCQfnW05LQ3+zoQ5cwrI9SmQtma7PXA30zLuq
	rc5brjUev/clFQbSYr4xr5LM4OLScAAaYzJ+gZm+tzLtE6zQSmf6da+ioEyh+ALKdLVOb2fM5hA
	8fTcKTKnFCTchZA==
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962788385a.32.1789476377210;
        Tue, 15 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962783085a.32.1789476376693;
        Tue, 15 Sep 2026 05:46:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm28920000f8f.0.2026.09.15.05.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:46:15 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:46:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <454ljf5swr6fqigv43pv467liciyzaez5f5mys4366qywqqoco@rdtfoinr4wsy>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
 <867bkw3zic.wl-maz@kernel.org>
 <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfXwo8+JpTk2lYJ
 WhCLrisldT1fIiy7wCxnZw0fAHLUsNzqcaVgoQo00hhMFbIhm13XyrPm0BKV9cgY9pD6dHeYxYK
 2GdkY356+GQCg7jhbEvdQUMET6IGUrco9z3vfR1drYQN3aMpDi28PSWLbcSGXTj5+BE815wu/0V
 xk3wsJE1TZIwNNNJGLOJJWUelHr8rxHOi5Fjwi1uTzD83ZyZFPb3oQwVSjhgqOnzXPkZ31weuRE
 W6IzvB2QAzSRG/x3VoucyJrllOVuGkS9oiTS2aW3YdgfiuPvNsOO0QWKrzAwi0XuHHgyQOQ24sH
 vQcSYJn/5myyEoxw6mwhmC4k01GtWZ16kt2NR5mNY/6ZeggBBcfUfplMdhOrdlfdKO3atOI9CWu
 1R/v/q0btPZPkPsaA2TfyD8RTdVhRymdFjFedvvpiDqC2930yyuhw6HdCVDpq6QqNivc0HGA/ST
 xPgrc2UTyGzaVPY9k+A==
X-Proofpoint-ORIG-GUID: xTNwDbDNGbovqava8RjLJ9B2b2o-GYXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX2gizsMIp1WP+
 4GBzg+LeRcSH0Hg/qzuUH3va3pAYoh6RxAOMajsJ7eJ4H3KFp95ktHRJ8mSyJT0Ww55pv1PxRFl
 XfgfhE9KnnyY7mu4prN/OrHGeKUrUNU=
X-Proofpoint-GUID: xTNwDbDNGbovqava8RjLJ9B2b2o-GYXZ
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa93e1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lmjIgOJzRCt-5ZhLMtQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150185

On 26-09-15 14:12:30, Thorsten Leemhuis wrote:
> On 9/8/26 10:42, Marc Zyngier wrote:
> > On Tue, 08 Sep 2026 08:34:18 +0100,
> > Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >> On 26-09-07 22:15:09, Marc Zyngier wrote:
> >>> On Mon, 07 Sep 2026 21:21:44 +0100,
> >>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
> >>>>> Recent addition of QoS configuration to the X1 variants resulted in
> >>>>> systems that spontaneously reset at boot time or under load.
> >>>>>
> >>>>> Given that this is both very unpleasant and hard to debug, give the
> >>>>> affected user the option to survive such event with a module parameter.
> >>>>>
> >>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> >>>>> offending QoS setup.
> >>>>
> >>>> Lets not start doing this, please.
> >>>>
> >>>> Can we figure out which platform deosn't work and then maybe we can 
> >>>> add a quirk in DT per platform?
> >>>
> >>> We have at least 3 machines that are dysfunctional since [1] was
> >>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
> >>> going to be the one doing a survey.
> >>>
> >>> What really should happen is [1] to be reversed until QC figures out a
> >>> set of parameters that actually works, instead of making this platform
> >>> even more unreliable than it already is.
> >>
> >> I'd rather have the patch reverted than adding a module parameter which
> >> users might not know about and distros will probably never addopt.
> >>>
> >>> Just like [2] should have been reverted.
> >>>
> >>> Until then, we'll have to paper over this stuff.
> >>
> >> But a module parameter complicates things rather than just papering over.
> >>
> >> I suggest we get both reverted if they break existing platforms.
> > 
> > We're in violent agreement.
> Did anyone submit those reverts? Doesn't look like it from what I see.
> Do we maybe need to poke the subsystem maintainers?

Sent the revert for the interconnect driver commit only.

https://lore.kernel.org/all/20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com/
