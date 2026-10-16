Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE2481241
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156960; cv=none; b=M14tvy0xcrddQq8/vwjDgj3eDnHdonNhXXLR3UGx3lJWPw2zCPCp24VZEphvgDGTy8fTqK1jN/R7MA2euLHacvzUEV7xsgZ+teeW9GZi8W1JO3H87aEy8hgibw9rovkxnJGnMY67e5lwv1PE8JAhv2vNy5eck9toX/x/flur5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156960; c=relaxed/simple;
	bh=u3NCbjlF65MzYbR+oR2Tct4Ob6r1UTi0DYYNdD9tCKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YONtYCszhGPKucmHbX6awqwcFVI38f0GGujDq+rp40BoGjoMRfJh1SdpWjqiF050K5QDkuF006Muhqm8D3LA+QaS5t2HqeDZDVmIk5m4SSyhUL6l7UHW/5DnQcvjZkWglzidelWVwhkD6MGjG/1bARKUMZfeBuhFbDznt6MxiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8xAVPq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUNDXWu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8xAVPq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUNDXWu0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAHwm2998512
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=; b=m8xAVPq28s85+rGt
	66bkL94GxtJPu2AO1TQCIUNqtScwBLYGQHBI1z1cekyAjnhrLvGUVYUOBwQ1vmbr
	wVaB3zwHUN0OvxpSaYUY/MLzYVkFK1qnHjrvKvTpTmA8HRS1THBKHxWdvhLZyC3P
	z02XANusJN5Rg/Q5UpgC4yPDl2mzXU7qwLfyn1YGN2BgLjP4KRINTH1BFWsoRuUj
	4OYipnacOdXJRW7XWMla6xyMoJHRX+CZz5e2nAt/0fXHxxfwe15ai195rj4c3Wv3
	TCcdjYP/QJbMsSpwEHwmThg7HcqO0BHBPqHVJm8XxSguQoWZAuEhYrJZWDj7qMYw
	9vWoxA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12qp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:22:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso258048e0c.0
        for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792156958; x=1792761758; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=;
        b=jUNDXWu0x7P/a2pc85I4qDXjA5G/wqTyVtsAKdqO6sLCOQlHMIh7tBw4AHaK632Okn
         K9Fg2l2qiinpg8rFgNz7Eh3WPqRh3woTgaLwRM2ZByU8mwYzGnPf7rQHjBeuC7gDcnss
         iz3EFZwwOPGnq4rR/kTca/ytBex21X+z43S/LUWQ0ndLM7v2IqLXefU7WzFDpo4aISI/
         FwP0d5+93kYpIJAipMrHZ/sEO93+7tX6tz7AjIDo5jsb7CXlcxMnJpk3tBtRgeZ57F/T
         ZtLk7OZjDEuGohDj4O+qclay39VTEqKnLFeyY3Ypp7JkJ3x4ozknjI22DgOlaTp3E8QB
         cSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156958; x=1792761758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=;
        b=UySNHvCobso3Mr7lxLY/rhcz7Va4pnfIckslTrZF9JT45I4DUsdIzSdqoLKhbwgvQq
         WikEprOvrAggTSvNiFBb3mfxcHOu+eQ1bGL3ud/vYVz+IaPmydYKTMSm8tCzHU2Z70cz
         Rk+RzbxlpHazx+lurAoijxikZ6kG/GNZWXte3C6kmeU16bV4jMFcgxDv0E1SGNESnfUs
         ijcyobutkEQrr9LsYAYya9WE3/uOlUWBDltIMX+CoobS0wGj6lm5aA8Hqc1sZWht9v93
         HvlQhXGphFI3vn35axCXEJcXr2R4GBGteRRfy/OHYQS3iRsYsAIKZBpzYNKzbcNHcN5S
         N9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBya9wGSu8PFSVZ6U/w5lPbieaEu/nKO2bEdrKG+Z3zxi6egq++2fDrEELaXD6K5xCFdTByQOOA8H4j6PQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhMYQ6u0PW8j45QVdn98skbATZ1qLN9uvdYEOJoe4f69n9Qvg+
	uRVBhvOIfZoYq32h58/euFgAWWB/U/lSGXxmU+tthgDXYi+wRpmIMtDfSMnbOftLCEMdxaWlRrK
	TbzSElVWUv3YF0+Be01N31xhGF+X/+ZMiK0z5kKA8DOBQ4zwZmaGhQRW7OwQjvWTiPA==
X-Gm-Gg: AYBFou1qIg/jgMw5kRaL1iioiOro8pAn7rJPTa2EfTsHfUyInC6P5KM5/SD2OPAlOnt
	0X5C72/iZzm/Ox7sHUI12u7rNfSpr5bRedOBFGVj6fOct2Ue3KMC023RU9+s6vN/zBJFVM1WsTq
	c4uzIHXfpVwv5n2LfqYDjBGdptekgPVTOrbo1dSeFNaPFwwLxmgpVa3bN6URg/PhFY168DbZmZ4
	5N+sSp5fVwIN9aIYujrtwVltkMrDGyGLLTRO00AiNn476hN6dNVzLrgyLwmWSBYrosA2SPFfakg
	V5TzXE2dvReruOVmEFspkAct4KmUS7Te3wyLw/YNpv9VPE2NFcdwy1qfA22uWW5MSvoJByIm8oj
	9XllURbb342v5bEzQge8x4w==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3414857e0c.4.1792156957629;
        Fri, 16 Oct 2026 06:22:37 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3414831e0c.4.1792156957176;
        Fri, 16 Oct 2026 06:22:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm71413666b.78.2026.10.16.06.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:22:36 -0700 (PDT)
Message-ID: <95d6c0a0-b0ef-4e4b-a8b1-772ac27e9d07@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:22:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
To: Joonhoe Kim <26rote@gmail.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, christopher.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com, pranav.phansalkar@oss.qualcomm.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, stable@vger.kernel.org
References: <20261016124600.31-1-26rote@gmail.com>
 <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
 <20261016132034.711-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016132034.711-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PeDFUtoeTzfWz50JcO_-1rnQ3xBPQNfc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MyBTYWx0ZWRfX4tcNCHN4XZ7U
 AYxRfyzYeSwdFM2gmeUoyMB8nSyOfliszYgA/P2HgFW7g2DFVMIqMUUp2dwMalXmxALMpPxvOrp
 WLPs0TQQOJtD6fcBReAkMLPiOYP1+tg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MyBTYWx0ZWRfX8rgtY+WV9Oae
 jQSmkh6VV+9W1Pd5nYhBTF67/TSD4dBPb8ZF7RNqXzmIPHKc8xILJ4d/K2hvHqZFObncvgdAhiL
 QPc6M0Eq/sTS+aF2G02v/8RW6HBj758yoD3419Qa+W/TiVmrZ8vqZvaF8tVZsxh90TAcLVDrDPF
 0Lw3Wgkzgn6q8aUwOfhG6NbyKJ+HIVvCO3nvgTyi7L0BDv5IAQyOKNFYzmXmKc4BhZmscAIoOgy
 vet32vs3Re4GL/vSw3aAtYOcztNaXTfU9SInqr/5my+GoJu4e9x3NA+fZigCWbDWJLHs1RklUMA
 xcEG8HTQVfCLeH+5FD6lZPLqUZbRXT1cuojM8ATFAcDtG8bZcbhmWSFxttLdqHGK38UcDbVQ72u
 8k/35Mid2n1M1r8UozN/KaN5e4T61xPwGWkPrDkMV8RAm5kIf1m+Qumux5GpYxofblvlVrushAw
 RYh32ZMZLlANz0ysFcg==
X-Proofpoint-GUID: PeDFUtoeTzfWz50JcO_-1rnQ3xBPQNfc
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad2251e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=BNqwQ8rykVb9Ldng7p0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160053

On 10/16/26 3:20 PM, Joonhoe Kim wrote:
> On 10/16/26 3:14 PM, Konrad Dybcio wrote:
>> Please remember about Assisted-by tags if they apply in your case
> 
> It does apply: I used an LLM for the analysis and for writing the
> patch. I left the tag off after "docs: remove Assisted-by references"
> was queued in docs-next, but I can add it back in v2 or note it below
> the "---", whichever you prefer.

OK so we went through with removing that, didn't notice. No worries then!

Konrad
