Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D13BA24F
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780148090; cv=none; b=f42NL9V2UHtgZb1Hcx/x4L+QMnWQ8dnLVtmoRPA9RbebTOu7/Bj6FixhpYgXXs3oGoyYTMRluTKGOLw4ZsUhWxhyrCSZiaZljIL0H/RaSnPBR71nWIIyPmaqwn4nu9uIvXsLg132Ina0IbZMu/Jqe1YeihB2HLG27K9ujpR5GRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780148090; c=relaxed/simple;
	bh=nZm7/KrAFnUmw0HLeCbq5IVzJNNGM1ZDj6512w4P8Y8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lnvzV70IskZuJhDkhiUKrXc1wd6ep8gM7dlDOQsW1ZPYHrWzhrgA3HVTnBrMqaRKEfZcSBPtWK5swetEQ6cSfwvZu3wQJKVEl7Ph1wnYi8fArnUupBuoB68x1yZGm2GCE+4Hn5Uv9VS8ApU4KRE3/7He5if4FUqV91b31Ki5D7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJk4ZQAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSiEbD6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJk4ZQAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSiEbD6S"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U2XebJ1400395
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 13:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=; b=CJk4ZQAwCqxaXy3r
	L2HLKZg9u9DRzbofSzp0fLi+FRrJG350s7E78UPm9VzTvligyzWOUzAj6ef0VKP+
	I9pKrRDQs/e3HDhpl7l5bOFe2NE5MoT2nWM6QJS9zW0gUHB0sQQQbVfbRCr3vcMW
	znMCDkJDeCwYusRp/DvZTQXMMn+4DSz608FBT9gnWulhfuHUT1/hlMBCpTdua9HW
	LfS4Kbvz8z0y1hiN8OWnONUwPVHDoZKyZw0iMpPk1P6I7JdFOxGHuWmOHEaKL22D
	xUgyR/H1xF7XY3xmN9sUeyGnaxsjnP0eAfYd7CgSauGF4NZxRzQSRErUmrAqEADV
	9VDH5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7f9573-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 13:34:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d09e77e6so185122201cf.3
        for <regressions@lists.linux.dev>; Sat, 30 May 2026 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780148088; x=1780752888; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=;
        b=bSiEbD6S6dC11EultvHCDuHNACqcnAdymBZ7E1emsC0VihAHf6ZhlFCoiRa2Ly0Qgq
         c5n7//UlrVy+W+b0cYuwzUCVzTxoknw3MtsZLfrAQ78+xrH/OuvEIpiIMmiOByVzx6VX
         9HsWPnOFlej1Tl1NhQQq14n/Y0/Z+EVnB4NpVzQWan5lAeBhvMdbLtSUzOTNawzsUUPK
         9YEr75nhiz2hTFHiPVPqutVlVj5Ior1tQ/HR/n9whgfre+V3e/8Qa4T9fTcmWi464LAz
         INxtkRxqjO94hx+FX+zUaDOX6wX3snu0cuv9OM7hN/ZAtrlZ9rAHhHRm/dJlpoGiuL1m
         DzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780148088; x=1780752888;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=;
        b=ZryoFNr0jjwPclbCnLXK0tDVXQ+8veklqx9CAfTiVdoAd1fI7BdPAwIOxZoThc3VE8
         QxtDIgg89uhSfCmPRLO3db7vPtFc6F2SD/KVVHIOfnSVyuuw+k6v+9T5RAyyJDvUHMYH
         UfGGKaQl5umzW7+g697RR5CR5pczE/DwVXdxl02aoHxFPgsGIU9aJTB6LM5V22sJNyHy
         8Ludc02YadFROzuPwNHrLFfFCt3yAE7vwVtj7ZJrxzqahMUxEQy13r/qBywHawnxhN+M
         2hSxVM8MTAU4jgkW3Nuj22q11pYSQYE3WuahYgHd/VnLI6OtD3dszWPd7v/dzx01iX1N
         jJqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rfpy7LGiEKuqJ4X+GRo207xn8KZl8QQ50vbtP2sBb+IM9WsseHbyApTGXBApnE0YOFrRe2tchT1lDuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL2COekQDkVkajiXHpvU06WoE6+EINNXeqaY6qMwcQ2hXmtx/0
	3aXO10TNdj1l3FqxqL2RXUYlAjuyyaasOEE3MU8xTjD/IjzjLB9N62+lCkbsSsjMIzD0tLnOpA/
	eSsAuwW0KTxH8U60jJOVCE+9nwTtwjAO3O0Gr4Rr1OHznSx5c/NeyIZ+6azr0KHJiFQ==
X-Gm-Gg: Acq92OEVg0mI6ZjnHdBFrWpnVjNKwc7jBex48n58XV44mqKgcgDTWD/usA+N6gQ234R
	n51vsljJEAOHBR+0GLrc9F/C7ivESzLiA7+FfvnpCY74QGrRa/KvZxlKAM6h629mvWAWlKfKYNk
	Fv/QQt2nOkZpgWvVbKawhYS8UVhJYdyz0RT/upGEHV0S61IckDm416dBbsfO5WWIqmN1IOG1EKm
	ZVcWS9oFxETkx2ryqNRmweL21QdfZRF/Ngq6KJ3tbCg+u7AI3bHjKNroT1rYSwfBLd6eEMQzB8+
	TkTCYejfinC2DeU/fu8iCxr+R9WthpyvXpj6W3rnMew8SDJcgJ8FoFi+UumjGQ/tscVbAl+YLfo
	wfbXMjkha5vAgOlUNny5b5hcfdWuTFp40j2a4zHlhif2BFZ6S2PsG39KPO9OMg+GClFVfONnDWR
	pD6sg3Yz07Qzv0gYwtawkfDvGjfBFLqe76/5qn8AWNmr4wRHm9aAPtWwJ4U9GP0gdRlHDmKI8iq
	KMS82oXvzki+vzKqjfgavLMeFI=
X-Received: by 2002:a05:622a:4c8c:b0:516:dcbd:aab9 with SMTP id d75a77b69052e-5173a67adb7mr54009771cf.16.1780148088257;
        Sat, 30 May 2026 06:34:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:516:dcbd:aab9 with SMTP id d75a77b69052e-5173a67adb7mr54009351cf.16.1780148087807;
        Sat, 30 May 2026 06:34:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beb4356b901sm38478066b.9.2026.05.30.06.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 06:34:46 -0700 (PDT)
Message-ID: <8503d297-68ca-4bfe-bbdf-537a85890d86@oss.qualcomm.com>
Date: Sat, 30 May 2026 15:34:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [REGRESSION] Toshiba Fn keys + lidswitch
To: John Veness <john-linux@pelago.org.uk>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Nick <nick@kousu.ca>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        regressions@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        todd.e.brandt@linux.intel.com, xi.pardee@linux.intel.com,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <E2OXET.4X5GTP37VTNC3@kousu.ca>
 <CAJZ5v0jVQyWYqPo_MiUwNQb7FLNR_Q_++Xq=xA1owcHpcjN=OA@mail.gmail.com>
 <bc9d5258-d4df-46a1-bba9-de3486f722ab@pelago.org.uk>
Content-Language: en-US, nl
In-Reply-To: <bc9d5258-d4df-46a1-bba9-de3486f722ab@pelago.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FjEJaDVWxX6lgXPlpazS7PqILJVg1Ynm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE0NiBTYWx0ZWRfX6QJ1odvIg8Bk
 yuT9C0dGVhTbOKw6beoPzKN6wMLKn8baaaqhE0DOrQkzryaWUi8+sk7iO2RPVurEGsajLnhkCIZ
 WYHpouZG7wnoeW4HYMqP8t500aAlECYnCkQ2dvaKC58l4mDDIMuMMBcixx0hIYTNhGOXNNS3xim
 jjBHYfazlMLemZyTAJFCq14eMaYtmboHVij3oh2ElWB+cKljjNWFg3+Xz9R3JyHzWSpPBMVYq2B
 rvPsNNODlahB7z1TbJG/tonm8laxi2ExUevnDsatCCoHv/Cu9B7evPhGQIuagJOtOy0tGETVikr
 CtVNpAElcvZz+xICLetsaQy0FVzfETTqcMlrZ0929TsnCPYy6tFq4DbBiMJu5c0D5kHEvb8an8J
 FPIuYgn3f6/Oown5jSp4rua72VSexSsiAQC9CU6Gc+3l3OKa7xlkPxJL3Lkb4f+V8WZiJCImcAl
 FbuFKlMq4MKn2ZBxXRQ==
X-Proofpoint-GUID: FjEJaDVWxX6lgXPlpazS7PqILJVg1Ynm
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1ae778 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=jmGAqP9c4pEhswuVvyEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605300146

Hi John,

On 30-May-26 14:19, John Veness wrote:
> On 19/05/2026 15:08, Rafael J. Wysocki wrote:
>> Thanks for reporting!
>>
>> I think that the problem is acpi_setup_gpe_for_wake() doing too much,
>> I'll send you a patch to test later today.
> 
> Hi, can you release the test patch publicly? I'd like to test it here,
> as I have several Toshiba laptops whose Fn+keys don't work (apart from
> vol+/vol-).

In case you've not seen it yet, Rafael send out the test patch
publicly later that day in another email in this thread:

https://lore.kernel.org/linux-acpi/12896447.O9o76ZdvQC@rafael.j.wysocki/

Regards,

Hans


