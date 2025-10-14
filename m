Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24F26FA56
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760419255; cv=none; b=KGi9KulB1eZ3N30ZyuJkrev5dBsiWTHbZH3mt6wvSh/FOlMcqd4kh2Cjgefc/XuUqqKLQZvdUlaVxh6lcxcceN+8+1NPLN8pbl3dhhm2RCEICfATEcwHZbt71qYXsQTLiXukUKMxiMomEUDTd2J0lAYeXrpU34tOvwHCpLAgj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760419255; c=relaxed/simple;
	bh=UxrCrURIYoEaGcszpb56z3jQjOCNpu2sTBsM6wrz+yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpFjPn//VyEUSv4B7nEoOxJDIZo3VgMzN/tML75Froe/z8eFNjX7rRPPHSj1fECeNfqEz4cq3iW3Em4y8lJkC/0g9Z13qDh7ksgiAs2xe8/SYiDtuaWxJkzeJLgYTCRrnZmoUq/umGbnBRNH4M7GJehoQ1i/V2nV8XZ8y7mY8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX41j3W8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX41j3W8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBqC003097
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvqF8DYLjafvi+gMij4k/ZfLIN5YYyS6USXN/Cv/VcM=; b=fX41j3W8rvIocm7p
	JUQz0BlDwmPhjDPs3ykoqGHbg0BTCr1Y2rloEKSmcmY5XcZOzI0BLc4kpZDngQjf
	dLEDXdq9fiMEj7qY9JOH9Jx4boZUqzR5Xr3/EO792xJJuLT7VO2h8Tkvxb7l1OUR
	qYK1rtiH32nzpIFzsg1SF/8rgXyxrlNdOnkuRliU082bMP66HVirpOMCaP9J3YpF
	kH4f0ClRKlE7oi1E74lqHWiTQ4etfv9Hfg6GFcqCSro6Z+7tcKdXqwGawsb375tK
	93jnhlzHGqUHBlbutNlr8FHuwXw3cGGVzaeK/U4apiPaGf/T6+gjk3Klld8cXm9f
	pa9WXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0q6my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:20:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26983c4d708so71062525ad.3
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 22:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760419252; x=1761024052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvqF8DYLjafvi+gMij4k/ZfLIN5YYyS6USXN/Cv/VcM=;
        b=P4SGO/08JX4saYE4drVNhOB1JUNPesm3lF3YiVT8v+1lpoUGV6XxCwnK6vyxQlRfZk
         WLrkiFvxVHxFIqRHdWYhQHUuolw4Pi5RdpPAS2xd2ZMiP6if12xmHx4XbT5m2zuTzHq2
         3PWtXPDttRcEioSq/sI1bAnXTXeThQESioGUVEXPCm71WVLsYiS503E5x56ubX89VuDy
         6wlNdU+sEC3yXMoFULyNNWoUib/j+gZvIhhV/hZVS6Xrw5F8JlReRcM6hhCKZJjUsn//
         H0OLgxMC8r3yUAq+fmp16kkYmCvJViF7LnZWKni8DqiMtaAHQ75HxiqEno3D00+LGbLn
         6vKg==
X-Forwarded-Encrypted: i=1; AJvYcCVM9CWcK4je0y6cvcKZBAWQ9Z2GdzBiJFUH0O9uMDd8hAT0Qj7nKp7fJMSLfOy167tb+8YqGR/kB5qtKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqFgMH9sjPnGHrCfF2KfV9hH51955ScnEQQCmQw6uX6Ys7PU81
	CaIpjej0QtDyg5rScmekvRQNX7pe4xY0Cedo9uAw2e1ts7YjyrnlXMQ9lT/emDOwECeag4HfcWU
	Btw724vNj9XuN+/sLdLcDxOh41odoy3WjEmCx3Kbc2+iTJjNRkwfZjfmi1gDXmYTcFQ==
X-Gm-Gg: ASbGncuGWhzmWaVlD4e+adQumR64kcvfVAG3y/8z7rHRiDnnm3IRKlebNxQzyi67UqF
	/f0qGMTrFFTOT5SO71gmdDwOf/DgYUygWf4eHhe0CHMTxkM3VzdAYGb8ZkxEk3effJxHZfZKhWU
	HupxCNr9UxdhxbFo+juxK98bu8n5yRPoeg3Isk0lnDkshqj4c918TwJBKCHbzOv6nfx0AecnSwx
	Cl7NVDx1I+saRUDE4Q2030cDKavxhCtbPuVuND2eWpVjamfC8UYhvnsXiZW96HDvPMA7Eept7+4
	jfy4hn0NpwFDPo9MsUFSVTibKTL63iQ6b0g7mGGdiVv/Fdh+E//Ue5bvI3M9oP3Z1v8KiHtlwg=
	=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr281598355ad.44.1760419251722;
        Mon, 13 Oct 2025 22:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsL1A/NUIg/+/5DcYNeqv6XyMlYlzj4jSQQAAeiL0ON/Muf4qcSsKga9vyJuwXAaA1wTT+9w==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr281598155ad.44.1760419251227;
        Mon, 13 Oct 2025 22:20:51 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f894c8sm151716115ad.122.2025.10.13.22.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:20:50 -0700 (PDT)
Message-ID: <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:50:45 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Bjorn Helgaas <helgaas@kernel.org>, Ron Economos <re@w6rz.net>,
        Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, rishna.chundru@oss.qualcomm.com, mani@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Paul Walmsley
 <pjw@kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251013212801.GA865570@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX32pZRghVXXBP
 CQ1tWuBU0mopzswHW2/6v8gOEuFihCHTaxFSnV+aUe8nYFJQhZeCv325g6qV3eeBuTxIhtrFf++
 AeN8uKkgFk43cS5JcnB5T4vr2HLoXh0jZQvINNzMGH4AyqKNWzhGJ0knSmu0Jeg6R7jvfW5fNYi
 nLYCVQTpehPx+lGXVvwsBWV04fI9OX0HqnMAFaZHam7ePdDzeXAetnZFHx+3WEUStcY9updrxLU
 Jpj4UYPUmibS2TaEH2D3WZZ1+QHSvBxgKYtzhK2TL4Mdb0RQIW3W2GXB4pUQKqMqyO1LrT6xtVq
 3eloqs7mRGXRILQ/Qusp3JoN/g+bSO7hapPu09LrJm0TzWDn6jTxbrDlHFhzTgLAW2ICqTtao18
 rhpnETVqoOEBMovJZTWbW689qrfc3g==
X-Proofpoint-GUID: GNEo3nV9FXEs_2Q5z2Ho2fbZqxNvasC9
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68edddb4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fhfb3jyVSOwbcj7u4KkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GNEo3nV9FXEs_2Q5z2Ho2fbZqxNvasC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/14/2025 2:58 AM, Bjorn Helgaas wrote:
> [+cc FU740 driver folks, Conor, regressions]
> 
> On Mon, Oct 13, 2025 at 12:14:54AM -0700, Ron Economos wrote:
>> The SiFive FU740 PCI driver fails on the HiFive Unmatched board with Linux
>> 6.18-rc1. The error message is:
>>
>> [    3.166624] fu740-pcie e00000000.pcie: host bridge /soc/pcie@e00000000
>> ranges:
>> [    3.166706] fu740-pcie e00000000.pcie:       IO
>> 0x0060080000..0x006008ffff -> 0x0060080000
>> [    3.166767] fu740-pcie e00000000.pcie:      MEM
>> 0x0060090000..0x007fffffff -> 0x0060090000
>> [    3.166805] fu740-pcie e00000000.pcie:      MEM
>> 0x2000000000..0x3fffffffff -> 0x2000000000
>> [    3.166950] fu740-pcie e00000000.pcie: ECAM at [mem
>> 0xdf0000000-0xdffffffff] for [bus 00-ff]
>> [    3.579500] fu740-pcie e00000000.pcie: No iATU regions found
>> [    3.579552] fu740-pcie e00000000.pcie: Failed to configure iATU in ECAM
>> mode
>> [    3.579655] fu740-pcie e00000000.pcie: probe with driver fu740-pcie
>> failed with error -22
>>
>> The normal message (on Linux 6.17.2) is:
>>
>> [    3.381487] fu740-pcie e00000000.pcie: host bridge /soc/pcie@e00000000
>> ranges:
>> [    3.381584] fu740-pcie e00000000.pcie:       IO
>> 0x0060080000..0x006008ffff -> 0x0060080000
>> [    3.381682] fu740-pcie e00000000.pcie:      MEM
>> 0x0060090000..0x007fffffff -> 0x0060090000
>> [    3.381724] fu740-pcie e00000000.pcie:      MEM
>> 0x2000000000..0x3fffffffff -> 0x2000000000
>> [    3.484809] fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 ib, align
>> 4K, limit 4096G
>> [    3.683678] fu740-pcie e00000000.pcie: PCIe Gen.1 x8 link up
>> [    3.883674] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
>> [    3.987678] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
>> [    3.988164] fu740-pcie e00000000.pcie: PCI host bridge to bus 0000:00
>>
>> Reverting the following commits solves the issue.
>>
>> 0da48c5b2fa731b21bc523c82d927399a1e508b0 PCI: dwc: Support ECAM mechanism by
>> enabling iATU 'CFG Shift Feature'
>>
>> 4660e50cf81800f82eeecf743ad1e3e97ab72190 PCI: qcom: Prepare for the DWC ECAM
>> enablement
>>
>> f6fd357f7afbeb34a633e5688a23b9d7eb49d558 PCI: dwc: Prepare the driver for
>> enabling ECAM mechanism using iATU 'CFG Shift Feature'
> 
> As Conor pointed out, we can't fix a code regression with a DT change.
> 
> #regzbot introduced: f6fd357f7afb ("PCI: dwc: Prepare the driver for enabling ECAM mechanism using iATU 'CFG Shift Feature'")
Hi Conor,

Can you try with this patch and see if it is fixing the issue.
diff --git a/drivers/pci/controller/dwc/pcie-fu740.c 
b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..b5e0f016a580 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -328,6 +328,8 @@ static int fu740_pcie_probe(struct platform_device 
*pdev)

         platform_set_drvdata(pdev, afp);

+       pci->pp.native_ecam = true;
+
         return dw_pcie_host_init(&pci->pp);
  }

- Krishna Chaitanya.

> 
