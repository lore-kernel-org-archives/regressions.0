Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BD48424D
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329819; cv=none; b=Uxb38q9oEIg5iSH8YoHkHQ0y+1sIFGNEsHHfi+VHAq7Wf3lbZG4CB6mVJ7xollHd0yYMP0UcoLodPVYP+alAKcrAG6lOsyJW5CbcNSbXyg4V2wFnTHg5QvOPWmis3OFBwAC5Oer5jRkkMksH2gT+pPuyfVWWjEitBpA/9unDlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329819; c=relaxed/simple;
	bh=fVJK/ODa4zbxOESRyzBgT/5Apdh+pjZlARY0HosiZe4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CNpT56RyQUt7Y83rTM0UVNf8CHXxh0tcPxLV6kD5KEZ2j7NjRkEI+EEdiQYRrA0/HC3OCUV+ojzhSl8GIhrVnI81uQbfnMdRZgaX2B227d3pK+Gqr3SO3CEdd9u0gjNDk+JrDaz3OaYKHgcdo6FOUeC4x3CTXTjNQZe4TRbmeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E81RnA5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpOjLo+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E81RnA5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpOjLo+D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YcCX039720
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=; b=E81RnA5yZSkXnTk9
	CJohkSx2n1JQfJPCAsqAm3jn2vW/zYa7IOzXx800q8CqgGR3mvJuxUvSkndBTkwa
	kgZQs9vRSFPUGTpn4JZyJhxeIRLaHLFx8LvlO/vKaG4BIgjUaMOu3voKtZERfOrc
	pRsOXJMC61l+cY+Jxs2DSnTerDqe5N9SwC7OYp4ovGe0cGgTbHMYx4r+v4MrV+m/
	Vw/ZRVG8d9SIFGfSyvBFB9qyhS6k98Me8FF814NFJjDPP6rQJ0VnSyuIRLgPbUxN
	kDcLtyaTL82INl3qL5rzLq7sP0YZsuJqYoGx1uvFG18U885arlsYu8Cwg5ZHcWOy
	nFM8Zw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46545ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 09:50:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso126751185a.3
        for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329816; x=1790934616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=;
        b=DpOjLo+D2136zYN8pF+3fGgobpHGh6nhUErwB+xvH+94zYnTx3ycUwPAxaTJNrx1gY
         ElixC0C6sssnRLp4Y+mmsTG220ZWZZjnegBX9ZSpAaeDRPm+0h3VzJGjHu6JzzFdiDOU
         6Qb61WCPMaopt44wygl1QmJLf+VnDaXC+mBE5fuRggJaQAkXvgIbZHSCmN7FGvfKdjgN
         bmoGoXg/JwfCnHHhk+e6SBRR4rfQSlOR9w2SznXyIbkNsenzSb/17/rJ4Y9ZiROn0Nt9
         2jZydhbuxhMhOHpEtyFS0+BmptxCe1bkHD5AtQ7bKEliAmEmj1b7SVslmXSn9k2qYVVL
         IYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329816; x=1790934616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=;
        b=UIEViQ4Yjw9EFrQPw+3ZekAqvznkbgnla2VY5ZIcmRxwmknBqyNJlTqPUtyk91slHS
         WQkP4bLMC9gadWU7hVjEXgevAlJBS8RUtMW4iFKnRK7as0GozHksfaEF8uwZYDTvzgNI
         /xvFL7JjqWnynTx9RoDbFWkwEXRbiAjfQBpAInlRJAcqU86id8FB97i+h74Fr/BprxiB
         is9s2F/B713lDaiNcu75ytqispFVO33PlRQ/J+RYOOwxnpeZ2I+JOgo2XJ8rKqmibHtb
         2hYLsR9rgmc+b3OFQnkTv5aST2qXnZl2ER7p6/uBduekAdardEUAPgbJibTIDbyOfVgN
         SGQw==
X-Forwarded-Encrypted: i=1; AKwUvBxv2t+dcT4TIXBH/3qvSWtICT897oZEYWRAS4VDF+ig7zxJsct2e7dUzOKOK2lHz9Pmm2vBL/Tk0sVtZw==@lists.linux.dev
X-Gm-Message-State: AFuF++mfpxFEvZN3AAr/qOLw9QrgHsH8I/g+W8qPKZGaEs76DmUoPkkL
	f7IiTDkDiVJkK+hXnYJVtqUlBqmRd+u4CegkpfgAlj8BsaT20w0az2Vq0vSumUPR6T2iqDBf8OB
	jQu2xIXs8SF1MmvXwTDjlhHxDCjptqMkh1tsoVDKNLuU/egTKGvy+t8txWbtsnX+Ulg==
X-Gm-Gg: AYBFou0AASynwmcmuowxZTNE+UbU+GeAmv4X3Xuj/jf1dLipNVtwSpf4/BJQrv9uU6k
	sQSy7xewSehwvU8tTy2xZO4EoKSO8kVuauoPo4MGMT+MSTPzIYsUvsrmnopk9f0zk6Itn3qg0qd
	t31CbYPUlE9gOSnXU3bQKJJhVLUpD0xe/nQ/LSL1MZmLL00UWNtdK7+LBLHyUhaf++XdpxAK3p7
	CgNMgZCIM75AeYd4bX6R7IKWSYnfI6bCp8sC+9MlthtaD6LifdyQwE0DNeokwx6LxfHt0AiWerj
	IS/b5DSCM0Rp+FMtaQayd1QhLhBVMWgrullYLMzJ19cO5+kkNVJCZKtiHf+Py7qH1O17ASFUf8Z
	7NH1fdR91Kf17gnMDu4YILrG2aizzegTdzIjqJGfvZbvHH5wKPpbl+qkO1ApKjWu9FOJmMpCmu+
	YQncXIbbMgXuPPaJxALcZq1qPsZRDvcvzsySHba+Q3rTWRoWZ9MpceZttzdV7j6cmetqg=
X-Received: by 2002:a05:620a:618d:b0:936:cae5:8b38 with SMTP id af79cd13be357-93c43b80a0fmr321749785a.10.1790329816397;
        Fri, 25 Sep 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:618d:b0:936:cae5:8b38 with SMTP id af79cd13be357-93c43b80a0fmr321747185a.10.1790329815917;
        Fri, 25 Sep 2026 02:50:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm89637766b.33.2026.09.25.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:50:15 -0700 (PDT)
Message-ID: <7be922e5-4d48-4285-8552-9a0281591f8a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:50:13 +0200
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
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab643d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=m2H-BLnp-5XiiflOyWcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hIT39MIiYjWuUjWWy2cd3CVnz9tZm246
X-Proofpoint-GUID: hIT39MIiYjWuUjWWy2cd3CVnz9tZm246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXz2YGAj5UafXz
 wUzKNGdo1AflEvoZHhtJyC1gp50hIm7C0KaQdzvnedwR9QI8ebcWIlKPAgU0CSPZtgDvrh0dH8l
 70JgPFJurT/iiL+SXZ3NURTdBmT6QYuBOrKGSRB1u4c2i266fzxbo8RKqh5uj0B0AMn9Ccalrev
 aTOUPSzjQuCfo2yWXqUGzX4zPEi07V/aNtEpXcIyOy4JjLEHlhuxE9a+TszvsW3YTNbjQE0bQhY
 9UWm8EzXQzPE1n4gGrNM3+JgSELuwRYbmQTEQE+TuLSn8mmRFimblWADb4vaPxiIjlRn7/UtM5R
 5yXqX06fHOKj4c6eQjyGUgSUaY6sznsux1AO4H6TRDuFuZfwtlKqkZw1KHTfKL2YxNetuLJDGSt
 KwLpnNAfzx2trbUD9BWFkUzAjxddDFznzBIDMZSK2ofVlBfWsv9kV/BO3bwA+ZFY2GptuMaWGeS
 iPWaE+HacCQDu4KRDQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXyyPUbyq8qCD1
 JRi7SdZ1mVCykbva3i6M8U0swa00xeoUVGmBnFSkJch5lPuAmv3BOOkziKf5qdlg33owQiEPTx+
 ANlGo9wBNALMgD+crZbUoS16vdeP6zU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

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

Also I wonder if there is not a non-persistent equivalent of
setWheelMode? That would be ideal.

Do we know what Windows (with Logitech drivers) does here?

I cannot believe that Windows will not use hi-res wheel mode
when the Logitech drivers are installed.

Regards,

Hans



