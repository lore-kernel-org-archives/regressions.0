Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDCA43F4AA
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329867; cv=none; b=XTUjIQDQQd+md1ewzqLKAnEO2u9TOnXuGVoFo/4jIyNkX4cu/P6DExULsy79sXeA1p4rwJQ5rQd+rKhAiHkMAEaSi5/1yn0i2I0attUKkYqbL3Abjn/grGeakNe9U8OkaRtXve19DFRLbVZMO9oxgLsUiZEw83tZZ0CZbQ4J8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329867; c=relaxed/simple;
	bh=MnksAUFrnZoQ453I02yXVhjqgK5PCtlmo3eJI7f8BhE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WCEwTkFtQoqbzVJhjeTQIHozkzZjHZ2Sb84abEWzjFvAxn3HqfqFEcsMU26FvDu57pKqkyHP9RauRLD8+BLG+AdlH73S0J7ewwT3aChXCtslEpEp2+e+0jSlTUkEET34uL1uq8moG5wtO+IjxuNAwqnXdm97P1Y7FcI/ppTAUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJpZSQnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MM41u59J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJpZSQnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MM41u59J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Ik52600050
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=; b=nJpZSQnVNi0hEPhw
	6j2LaXbhj3nOebH+M45W9Aqf4MNtRlbFHkhlkUmKUSY9qPlaqg/ykbN2Gt5CiWuQ
	mRvODl98id6WkCUdsC+jVRXk3Q08EhvVpfYVOFhGcmwDgvsmdyzIiABNKZ21xqA2
	jJFKHeUdozDf/uqPJH0si8Aqd6BD9QzzPHQKlxe2ON0RnMB3+rciB93PLthR7MhJ
	hIZYnC4PZuuCfi/sXFZwlak76CIYSsoOdFZo0QzG7Kt4VagTfKgfJfAhLMxqhbeL
	+D7FmEtOrkpSA24WjttEibUvg3jy5eI2YbL/1bn3P1gz1ltmsxhxOnvGJhQivwcD
	1AuJug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrt9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:51:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so144247885a.1
        for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329862; x=1790934662; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=;
        b=MM41u59JOOBGVj5bj2ZM81PzbqUdxT+AaeIvoGuzJwyCDkRB6nS9+svKpDl5M/cl6S
         d06+HPRUlllUW1jotYQkz+sLzxGVCNAlZv8Itq8V14LMcXAgUylNX6oeWg1iFrCFde/m
         P5jqCHGFb7i3c7BHEYh7npRfESipQ9R+SM5ksI0VYusD5GAbwOmh+07uNgXb5CDsHY6S
         nAHot1+0UVTOLTLw2Xtu79SRfBXF6dqftNXl0d8Xd1IETjB3CHlx/JyHon0QPcAOmHiI
         I9NGjtkpk2zlL64el6a3uiAXkUQtH/ubzfiifdmvrNHDigIWcQG2Ye5wKzgDnRuxPFux
         tlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329862; x=1790934662;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=;
        b=kLbnRKnTh2rH/qtyoUESGltzhEfKWiSwQEI+tT2nrb1HQSsLBt74e+LO+0SEhCUxJF
         C1ogPyKMIO81BokcfefwNYxf7PBiBLNueMIDzOoXsyhdoIrirho1QsgmhOVLtlrEL7Fc
         A2Ajxl058Uxhb8S1tMsDM/lY8yYfbz514a899YIJab49ecGBMedTtRJU6GBYVq9QTEC1
         63mf5x+DiPlQx/yPrphTypF0ocLg75DvNbolEVJWJLz4H2/ZKkiHIgnWdOiNgDvv2Hxn
         m75cPzFCjv+cWOU2zkNaQB+19vOweWBpYcTaztsNIrEo1wPIxWnLe1dy3jHoViFre1qW
         mQTw==
X-Forwarded-Encrypted: i=1; AKwUvBy8cVOZAccm/JnpcJSCuYKcyufbsrtWrtuHscsv526en2CkG9TnrP58hIUMDHoixFd29oTnc0VDsbgcug==@lists.linux.dev
X-Gm-Message-State: AFuF++kdkbcBCUCuhS5M44rywvcouGgjvh45pZvly9wyD/wHvkooDU0V
	w1qnDFsI2ezynZWw3P5GgiyL8011jmUfCSQ1G/QjYKNyW50ON87TJnux6/VJW6otopMtpDAc6ji
	sHkyUvv57cKJ2tX6LnKDvD5hoxPq58+66UcBtbLXQ/PS55xZjB4LPZYa9QzI2G2DVGw==
X-Gm-Gg: AYBFou3Bm4KekEnBnilP7xG3nwN9racm43L3vhETm9S1WR/7fSddTXXB3XrwvkIR9NK
	AqT8cZElJoPOElW+nvT+8UJaP2E6Ifd50ZFnyBHLp4As53LECF7J5mGkgM5p+6TqZvRvIAf/bDA
	26ipAt8INmHCrAvQ3oa+zoTfvubxdnvw89xsnyLv4ckSCtGagZGPIGoA1k/LUiEYSTxFm/FgrkR
	IjmzdLWCL7At2VYpi0goMYP3W6sp1sCoSLhO79OY1ChmDRkybIpQ8ApCbqP3pRD4in7DAtTKj6v
	ooZccdJvmcqC4VdoY64+IWKUPpzsBHaBEKMRNgSxK0FsCNohV6DyRa4XuDu0WxgW4ieFG2rLuBD
	k9eCFaUMf+G+DXBsfpvfCuaNV8AePVcGmXf1PivjGDinhqsLMS9H9ofnqSwm0dmSwD2AoEyq4k+
	CKU9Kim1CtuBvkAdMRNH97ss0r7wS9MW7yzbVBUcIDbGnsvyyQGoEM5z+Jy7Wg9Qstyw==
X-Received: by 2002:a05:620a:1b99:b0:939:35e5:94ba with SMTP id af79cd13be357-93c43b82bebmr319156985a.6.1790329861753;
        Fri, 25 Sep 2026 02:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:939:35e5:94ba with SMTP id af79cd13be357-93c43b82bebmr319154385a.6.1790329861314;
        Fri, 25 Sep 2026 02:51:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a4b0sm89001266b.60.2026.09.25.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:51:00 -0700 (PDT)
Message-ID: <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:50:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res
 wheel mode
To: Roman Stingler <roman.stingler@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
        Erik Hakansson <erikhakan@gmail.com>, Filipe Lains <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kheE0MDqZBq1U1R6OyLKSfQS9W8UX3Yf
X-Proofpoint-ORIG-GUID: kheE0MDqZBq1U1R6OyLKSfQS9W8UX3Yf
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab64406 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Dp_lu2mDYKKqGQaK_HcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX0X9LzcYEAS9r
 k4t4F7p549t9HVm/FdBpQi0aOgb+EvQ08V18NqFPIOKKdndYr0471xt6dPtMPZVyDFdktR88HTv
 ODop7YHXdFoAYoB6F7zLTt4ZYlylhuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXxqADOdq+qCzY
 apRNXJEz8f+TMUDW2c9o+ytqFFQmJzfQ2pT9xxV+JZX2sRWWQ+bwUOUL5m/+ChkqlZu/klBXVkx
 b6oITgbBqC1d/ZLyDYIbHHZ/7ly6BJLGZdvoBfM3D561cIZbOclEaDJ4g1i+A/jdB47lqCmurZ/
 GjNaPUhw57NG2U1j+g0K8sJ5Cyhduns2o+dN84YxOBh7u3OShnETxSyOqffXufuVSwRRtEPJ2J6
 vKo51Sne7Y02Q1YMXCcTY01Kvf4wv/gbSQhxrLRnJ3BsrXJa02UJ/W+k9YtvbGHp0/QcAD5EZhM
 JZPq+kzJo2em9u4sQwP+s10fdW1F2+trTxH60o1E6PbslSvdbRcUO8tOnfagfIoEVjhuw2QElGw
 9mnlfTDNObZCuT8xQeV0SA9foL1haLrAyY9F0Sghn0zqnZIVDTHO0ubR2h2xZLBEuDtV5YdpsGk
 TJIp4GHT8Av/v+uMm5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250039

Hi,

On 23-Sep-26 20:11, Roman Stingler wrote:
> hi_res_scroll_enable() unconditionally puts HID++ 2.0 devices supporting
> the HiRes Wheel feature (0x2121) into high-resolution mode on every
> connect event.
> 
> On at least the MX Master 4 that mode is persistent state in the device.
> With hid-logitech-hidpp unloaded, a mode set from userspace survives
> switching the mouse off and on again. Writing it at connect therefore
> destroys a setting the user configured, and does so on every probe --
> cold boot, receiver replug or module reload -- so userspace cannot
> reliably keep it either: it gets no indication that the mode it set has
> been changed underneath it.
> 
> This became visible when Bolt receivers gained support in 7.3. Before
> that these devices were driven by hid-generic, hid-logitech-hidpp never
> bound to them, and nothing in the kernel wrote the setting.
> 
> 0x2121 exposes getWheelMode alongside setWheelMode. Read the current
> mode and scale vertical_wheel_counter.wheel_multiplier to match rather
> than forcing high resolution: a device left in high-resolution mode
> still gets its multiplier, and one the user configured for low
> resolution is left alone.
> 
> Note this changes behaviour for devices sitting at a low-resolution
> factory default -- the kernel will no longer switch those to
> high-resolution scrolling.
> 
> Link: https://lore.kernel.org/all/20260920094508.39682-1-roman.stingler@gmail.com/
> Signed-off-by: Roman Stingler <roman.stingler@gmail.com>

I assume the low-res mode factory default is because not all OS-es
can handle hires mode (I guess mostly much older Os-es cannot).

This regresses (new factory default mice) to no longer support
hi-res wheel mode at all under Linux, even the non Bolt ones even
though this is only a Bolt issue.

So in so far as this is a solution at all, it really should be
limited to Bolt devices only. Although I wonder what switching
Bolt devices to the hidpp driver wins us after this patch?
Do they still gain any meaningful functionality from the switch
to the hidpp driver?

AlsoI wonder if there is not a non-persistent equivalent of
setWheelMode, that would be ideal.

Do we know what Windows (with Logitech drivers) does here?

I cannot believe that Windows will not use hi-res wheel mode
in that case...

Regards,

Hans


