Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945083AEF55
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528156; cv=none; b=Oq2YH/UykXXYbwJdf8jxCNI7ewM5ZHhvHXTWq1FT4K/QsSkpJMZR91ulDAZCNmJ+tVj2HdhTblVgW8N4Wh//iux7J5erDcBAzQOUbPjjjy7n9EoXULXkg1c+39hon212QaaEObkchgg6Hh4NyE/+XR0aevAJ2R+9UCWGdLqX7hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528156; c=relaxed/simple;
	bh=yM62N2H1bOa/X/eOm9XfJAW2/IsPTDWnjWPkAJTwNSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxrYcBm8WNE3Pgdr0eb0WUKN9HSVf9fW2lCVRBTeyaDRv7725wfdykCNNAzWve24D+Y/lMHxbeKGZYNQKKLUK+iS4ARFO8iyyKBlFf+5bUBw9SpeZP9OJPaZYBOACwmpFPNFmNNLVPK/v/5b4/g1ADdEeI00aicOr0qGPYU15/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2+SAIH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYNjBCEh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2+SAIH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYNjBCEh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZGuf1408669
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 03:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=C2+SAIH3viTGtLwt
	anuftS1UbBrRY8f6gP9mjistQDrN/AsiOiQf3x41sBtkTrxkv2qkMlbOelS7+vFH
	IxyGug34Y/8nBg3B0mKx4XygsIaqK+JD22LiMRTr4Iy5BUaoywgK+ha9vuy514bj
	Yv09UMS81I5PGX+OFQalGYMrKhGXhHuKYqG+0r2uQCrnEHQWgGabyWsvjY/Q0Lao
	VN5Lj1mSx7kknMqcLPpKj1pebCw5TB3fCq4/rVDxP2uuD8c9A8X/6FqQ3xbfhJMO
	olYD8haiGPL22qeTSxSnAJ5yAO7Drp62KAgx0RiblKph5ca7GqEBIgHXjfIu+Iaj
	ZhKE/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftugjt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 03:09:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3984945a91.1
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789528152; x=1790132952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=iYNjBCEhIWDQ9uzuU98sf5JWW5wAYigbrffXDILAPdBp3Ph1fdIusawQHaW7JFdnsq
         5wrwNCv7OwPEnWDi+EzUDWjyZHFnpTFDN7dFCTcmGTMdK4E7gOyZL1wiPIJpo4PJW3Ex
         ELpngsVtK/lWKXDCNd0YpPGL3HFZGlhC3M2bbmVXHHglqLSdm1UUcXKfkXOkIrQA7OQc
         hPx80nph6mPnhDLsi4UJiK1LkE00ZOpL43DSeK276MBSpYEcllCvFatAUZ7ObNe5DcPy
         CveHo1w4m6tMA6UO7xngkGEspThhbBmwvbbR3+BJAPoWdARNRnYTajofsGqqxDSooYWy
         k6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528152; x=1790132952;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=lrAaN8yjq7DeqYqS7Er+cU8u/8RisJUN7iFeRK9yOOCx5B9uaWm//wJ+vOQyDKmvSG
         bauaTID7+dwoZPobv2AnicOVROuFDc2kk2Gl+kRfkjRhoLXPpyG6Tn1XlGgO6AFoe4D+
         WY1XC6n/BGATfx8E80PE3HtH/FRGgK4VY06kSTDeUfP8jPpZlN27FYZN+nA3ri1K1/KL
         9NrL1TU0poau3fKFtlD+up0ZKtzvrXKAbFT57/78F6G6FhhVGPhZPoBGOzPUJYEyJAP/
         rzG4oaQvCQFJ1np2u6bcIZAq3oUVeg4PrOWC8MRPtxidTWALWvAw7WyQfNNKXsVfyEjm
         IzGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZOgDPgidD4N5x3W9zSoXf+h5pm3ESOpRl266/5kLeAZ4YnMhJx+Y2oj5qoMfKFBuzFxNzsBOUsTFO8A==@lists.linux.dev
X-Gm-Message-State: AFuF++nAcHGLQJOdfFTqlzqmFbQ6YLxhbnL4W3ZSY3NG61MCr+goET+0
	P8O4nLctx8m89Qe2utfbIC7mQVRjiIeNY0ZHCzcSQBgi1zq652B2ZGfj0I3tWQ99NXBXhUkG0na
	xPrWYGeZgBvV9H3jYk1T3EmDPoowscCYgWLx1oQm9j/DowbZhr/57rNjVF9Sr0JP7Kw==
X-Gm-Gg: AYBFou0V3ZbmPgJOSV7eZDzTqf1b+nKFKRpWlR5Ip33WUM/HFkLDBFBsKEBT8QFaK+K
	6VL1fkWzlX4uV3v+QpJKl/rx0/AiE9ylQBz2Ogq89RVlywU/34/EbX4UGRSJkyb/2TK2hv9mNDx
	z2PMFeSZqb0ri0IbWEMRDVo2HWWthNguQFVlQV3dtzsmW6iOfqCe5teq/UN2kGnoua75l0JCzY7
	SVrkMbrlJvYFLC1aesl/PrW5IskZA72nyHpo3u3J/hus5dGAmobbK/V6+rcK1tUiCydeWzj3mYs
	oQPFYZA0172sqP9bZKUALMRHEDU/AHrylKzpRV/ZRcY4Gw4fi+j0XtkPcf0QDQO41yyRvqYzcQD
	PRimrgQMztIXZQ8uxYME96BSrELr7Z0vwWS9EuomfbI0OVMNALRgsEvOBSA==
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015610a91.16.1789528152104;
        Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015526a91.16.1789528151476;
        Tue, 15 Sep 2026 20:09:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3191996eec.15.2026.09.15.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:09:10 -0700 (PDT)
Message-ID: <6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:09:07 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Vlastimil Babka <vbabka@suse.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Daniel J Blueman <daniel@quora.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
 <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfXyGxEdkSqa2au
 5t3EClBrd4c4QxsqHVtAiF2kLMDfegkSyqgUVRtS/jpeJNod343fO2p1cqpf+Ya2BVMjy9VnNKM
 XpZ5xbfmyp+G6U5bG//KmuA5pZTSpTaYaWzxShjQSD4iNw5HtzJyRT/xbPTuiJsuoM/jMSIIefe
 OjjJDQ1DsuGLPYvOTA+skSkr2s1NIkEnYdRxTeICD8lkWcJyO8M7buDLgW0Czs3kQHOZyEM9rg+
 6nRp2ICtGD4q0frG3qKTnhI+2SW2bSJptGmwBAYmvpivcQtlYZiPm04iZnIOXbXjjJb/275n9U5
 YZXHIIwVwX3c0BWcK5f0aSsFy8xKUcCwr/k8R12M2c/8rg/pMQL9otyOUnu2Q8y/Mt+VPWZZlsS
 bns7mNF7wLpS3lw3aH95DWkXAIf42BN2MOrDweVxEC0mPdgxf505O//T1wQlMRl7m2meSm9cStI
 bGqJ5m8Vx5Yu8zEGYOw==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa0859 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=_wE0MnXGkHm9nJMVzvUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfXyfnLzFvBGugq
 /2kxxnuaLjKZ1ENw5NZ2ZyJOCOrOdW2aXTuqcNQuJBGlPlGWlBxOfkDRV64/YuLtppU5YR57jYv
 qlu5iRuJ4lO3pid5xTBojno4MlFiH9g=
X-Proofpoint-GUID: 52Ph2IiJ2f7eswL6uAcK0aahh72ojAA5
X-Proofpoint-ORIG-GUID: 52Ph2IiJ2f7eswL6uAcK0aahh72ojAA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160040

On 9/15/2026 3:48 AM, Vlastimil Babka wrote:
> On 9/11/26 12:44, Manivannan Sadhasivam wrote:
>> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>>> Since the MHI HELLO exchange was relocated, it is sent only at device
>>> registration. During a suspend-resume cycle, the firmware in WiFi
>>> cards such as WCN7850 indefinitely waits for another HELLO,
>>> triggering:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>>>
>>> Fix this by triggering the handshake from resume_early in the MHI
>>> transport.
>>>
>>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>>> suspend-resume cycles.
>>>
>>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> ---
>>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>>  net/qrtr/mhi.c     | 10 +++++++++-
>>>  net/qrtr/qrtr.h    |  2 ++
>>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 78347c937af7..2ffcfc2fdb4a 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>>  	qrtr_port_put(ctrl);
>>>  }
>>>  
>>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>>
>> Use proper kernel-doc please.
> 
> Please prioritize merging this sooner than later (it's a regression from
> 7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
> fixing up non-critical aspects later, or by maintainer upon merging.

Concur. I recently fast-forwarded my ath tree and picked up the buggy commit,
so everyone using my tree is now affected.

And just want to point out that many of the function comments in this file do
not use kernel-doc format, so I would not consider that a blocker. But it also
would be trivial for the maintainer to add.

I've tested this on my HP ZBook 14 where I've replaced the OEM Wi-Fi adapter
with WCN7850...

Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

/jeff
