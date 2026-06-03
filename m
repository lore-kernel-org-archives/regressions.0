Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDA41C308
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488704; cv=none; b=ftM4hqTho4bnbrtjpm2S3bq2UOM/4uihA3iiRLI2jlNPC3XJdfd5LTqhxzcWeYVPNdM2682eF8WH6mr2057Aqzphonh+lZvrMic6Ku93/KM8eJZTCbostPpfU8m0m/GrWTx5f1UMgtLuLT0OUebLBz+uCsQNF9971oZ1Uzq1WlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488704; c=relaxed/simple;
	bh=iEuZt0PELRvOLSZnoy3MivGwi/DQL6MCve315+aITS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8PgZxjQweQZtGCRZfEn5MgDBra/wlB4cqImJ3FTZ2NxbG+RhHM7flZmV2MPRlhPt+Yy6/+X7RaglwysTd1YhS2/SvoJnHL/GE/fq+lga6AGg6NZCFM7UvxaJmZg28qZ66YjM3l3/wpwTh8mdC/2wkCptf1sDLG/gEiUglDctRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX0i2Hu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ubu3lanG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX0i2Hu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ubu3lanG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RH2E2076091
	for <regressions@lists.linux.dev>; Wed, 3 Jun 2026 12:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=; b=RX0i2Hu14Z6G/nYV
	llUN5ypYsyHNPLreImPDfjN2eiGdjbi0nd7FFBpSgq9qSu5gLRabRJ/pW/Uh6qEH
	ZyBXxR3Phuc6JsYJAiTjSfpF6Q5xsIcgfl652hYFkyLjwK9ZxxFC2GZMPazZPwPa
	HZV2l2i5/aH/HWnqW90I+raV7Kn4Su9+hdqRqhYpoKFP1Jes9ebb0t+L4fuG/WlY
	EcMwjEUtkB0Sk2YvrKqKGEphL5U6ZYVhsCqdYfK4gzM+zaTVHbU0C6FnIBpMWwUd
	E9qbCSlg8UgzIZfoiqotFy1hlANEPbT4qpt6eupp6D5BCu7SyqyrE3ES5hSVbpnI
	pPgQNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19ek5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 03 Jun 2026 12:11:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so4803819e0c.0
        for <regressions@lists.linux.dev>; Wed, 03 Jun 2026 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488698; x=1781093498; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=;
        b=Ubu3lanGTsy/G+DY+ijXnsnF4j3tSUXj/r4w3hkadvFcseRKrM0+vB/QtVe2+09OwM
         yLLSdraeciH3zDugMyIdeNwQVnL5AADHNqArqTYRSr+2vLCrGOAqWzJoeHKK1bzwjGVl
         1mY4MCtGhJFMOme4qA5WD71OogjXPIeIQ7P4I/7D5rS1yXSz4pNMTngYB6Jpti4/EJhG
         1pZCXcp9jVFMiXSa6FSDW2kqaHtZrXKOicVzdtLE7aNx6RrYRnLUGpLT2vYFAkE1pKP1
         bnekZiQNWvdVrIz9h8M6dfAbBBi2D16ZvQBLLJ59WGYY/C5DUW8qGvdXzXubWx9/fET9
         JciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488698; x=1781093498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=;
        b=E2dg+ea5lseLIlJZdIPxKT8TkeTu+SdkTrjtsvxXyVi+506NXAEbTjJkcA9qrF7T2B
         o0Ts/LDqSjn+pp3EMZPL2XwKsEZmzUav2ogmm0l49y9OpV6XCF7EgQlgpvjIAmN+lFbB
         QmifV/leEZiuO/pjWHoHOwYZdyeBZUN7LwZKOGYauFf9ecOOc52FJTRGekvX90vMDaXQ
         TctkoH2OlhPmOyDoLU7agbvSKhm3LqwTPEdyvLPPRu2AHO4VdRhwJWJ1cGxlmjQg/aWY
         COku0BvK4cqazjPiD8ubPl599f1Bb2ylExpOm1INzwOmBYPG3WsuVWKAsyIKUZzrI0IK
         0JJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fzTmkg1QrOL2ESEmC9eRHLKILY+0/5dS2ELAGw6ipBTiv+HVqF4qCfFSifCIcpmFlZWX4zbrCY2vOWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1a1hf2TdB/BLZra4cqkkriN09Pb4/KUKMkgT6wXBnaWrfA76Y
	bs3EoCrUTimAbi1tg+zdqA1Y7AzclT2W4dp2An9TNRTm61wLx9FJuvL0avvBqTjQr0lPbd7KBXe
	ku+Y5z90PbVKy+s79kQRo4R1oppyhaU71HiS3f61RbWYhj9q3r6OJROal6HhL2dmKGg==
X-Gm-Gg: Acq92OFm8B45wNK2DViP1Ttop35LtKx11hDeCjT3KjtAh60+58jv9ATRsf5JVxvfhsP
	LlvZZrLQIjcPjYjm0/CRyvJXm3E9VqVsl4yUAEMQFoaWWKRHR/hCQb1z57Gq5A8+BfEaufdQEoE
	pUuWQUkd3IAaJXZz86YIGwNc/ztO/fJnQ7OSX/la9kkAvJPWTbZeuZdtfYyscdo/MJ4MyHFrSNn
	lwALgWAkvwWULDfCMVxvupOW8EdiRbwSuqgZeIY0KwgFBThL/u2utJpWFgkyetI//bVKMzzu3f5
	kNvr6bEyScjgrlNGDdNCxtDsjQnNq62QkCBjDhqU1xVpRFLCf6KXvogHg47IX1pZaSCH3JTAEMA
	Q7MpZF9oq5nmsxlCjw/AILNG78Z1VJIJ7xDF+Li7edlaKYfzdhHdMnxQ+WZagpYBQnzMMjnyR5K
	JuXPthFXZn3RS1AcfeFIBU3GO1zpVC/d22qGeXn+DwdGpJSQ==
X-Received: by 2002:a05:6122:4b81:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6e9aa38d3mr1534864e0c.13.1780488698106;
        Wed, 03 Jun 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6122:4b81:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6e9aa38d3mr1534817e0c.13.1780488697683;
        Wed, 03 Jun 2026 05:11:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm616108e87.23.2026.06.03.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:11:36 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:11:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: neil.armstrong@linaro.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
X-Proofpoint-ORIG-GUID: QFNr-mErDc_2ffdesJh2zba6ReknPDQ2
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a2019fa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=kGZGFaQSV3qHyNJQVSEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: QFNr-mErDc_2ffdesJh2zba6ReknPDQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNiBTYWx0ZWRfX8IFXbk9mj4k1
 I43saZJkLW1d59abHE3ECq1i0+ST+TtV/BGx0YG4SeRw8V60ToPdire0DFs6NfgdNVr0U/47iJ0
 5OqjAoXu2k7AMQeRzcvSSSH+kO+8fkr02f70eoeat0hRaqhe55BERAmGfuXvPxFzhswK/GNoc0P
 nYcnSY6TACB/OdO3A/RHCSfsjIyOJLQuk0hGj79KUmbftwDI7UUf+3Z052jZ+KJbWT2TBTPTMkB
 DhIVaMDBB0C7P3S2Hw/hvWfbwk4geaFoFPJZxqwMLBXEUU0OoSa73+tIf7XNaW5Lu2NdsDy69OM
 6K5YakMIMG3RpqB0SNeVj4V04Zpxs8eiSOqvQ6ael7MHVb6Yc2zMyI5v7a2ouHOjdg7mDtWkOmf
 M5NCc7NyooxbPSIy4I6zqSAbN0PGASbfVVzLh7EcW+MXKw7dEIVy82xhQZ6E287lZOZwv3TaZg1
 wczCGwk9iYZMYBYZ8jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030116

On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> On 5/4/26 22:09, Mohit Dsor wrote:
> > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > working and non working case. Lilliput is just a normal display working
> > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > Gen2 only.
> 
> Neil, Dmitry, and Mohit: what's the status here? From the outside it
> looks like this regression is still unfixed with nothing happening for
> weeks now. Or has progress been made and I just missed it?

Thanks as a reminder. Unfortunately, it takes some more time (and I've
been a bit overloaded lately). Worst case I will send a revert soon.

> 

-- 
With best wishes
Dmitry
