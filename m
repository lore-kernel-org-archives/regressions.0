Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA282989B0
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420175; cv=none; b=VPMs3synwEjYhOJizyNTA+ZwVqIbHA1WhU7yAj9S3Y4whbit6E9r0jiN4PIzPQ17BiXhJ4DoO4Ry6levirpVe/vMRuF2UKdyyTKe/3YVpzl/KByjQPnuW1+3nw/EhwGK+K6bQwiA8kP4X52q4KEYYvM80RIjLVxs7/PIX7lUwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420175; c=relaxed/simple;
	bh=5RlDZIH/oxFVBlQHiYFsX5wFXeqeq6URgoE2IqTx2jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnxLhjJxH2gUaXd9VexrHIN17Aok6Jhvm6nVDVLgt0AedTvBDpswx3Vw5Q68FPGhvtf9Mf0MMOQ/zYfSbtKdRcerGh0cX4xSs0SE3OReRiqQpOrgj4m8i/Msfdvbh7FM8QqvIvw8tr4WO4HNYALx0/CbTj12ZLx+R0uSjccsXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm8YKhch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bm8YKhch"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDXiL021451
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGQ1HH2B6A4U5Y0vYjvst9AOWsJbygVsidDBRZJFqLM=; b=Bm8YKhchNTQWmJjN
	jUjOdXQyZYANctX0THA3f25h2SlmblfVPHtvC+rES8PaCmr5/PpLcBxwYPSDgps7
	w5CYFGhsYFU+t9PYf/Mt7OEOl8/EFMFyfTxgQtpw/ocxd6TGhUqkcR6hiVpzq/P5
	fMKLqP4V9voGH47iKRrSbSsAdJ4OKWL9xttEBmaKnSoIWKK1yZvxYOWEP7ONhvIg
	0nQ3iGZK7elNFtouFjZNv9X4X+sbkLlsdYHaH6P1xFVeXrPd4Ejp0P1rkN/fTPHO
	JWid4pHEtPwG9HECFsrfYTm6eOct58r2vYVIRRXQ4C7Lx1htJU6nyUYcu2plrFP1
	nZpDyQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0by7qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:36:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so7804251b3a.1
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 22:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420172; x=1761024972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGQ1HH2B6A4U5Y0vYjvst9AOWsJbygVsidDBRZJFqLM=;
        b=iwk3o4D68JcGoYDeYPfZjUZYVmKeKZZiHATz8Rzkm2Wc1CzcjR3IZAraaf72tr4Cgd
         NqE7dwSiMTwmoXR+C4xMVzy2KeNu0hFEurQ9RWvO4HN6OXek/I1BV1+a4Z3g+nNIHwTX
         wYlLFRomtWTgRBWxe4quBKkIid3CxeAvyeg7JHKHviulhVl/DWCSlltwr0kSdacUsPcn
         JIuUC2mDP6pHJmz0omp0H+oYGuggefZ7zVudd9SBT/WawX4dwDmGVOE1mcqPusgwkTkh
         MYsS/1yb+cIe3FqPmkO8TntfJmT127JBtoAN6w8Ny+T7hQ0UHbRt0T9ZhOEIdz46HEI7
         Vt3g==
X-Forwarded-Encrypted: i=1; AJvYcCVZEhAm5MrtRdJT4NWP12FfCaaVVS2Cmrc8KmHBWBFF10ju7k18gdg6X6qK0EBpb05oxjKwdhnvpC5G7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNNxuHKN3sGVMBaVzlixS8g16E729C2QYxAB3wyaWVjICBDO3a
	NRU2k5zxwDBLCE6wUNCCEPrDpNTnOqQONfqQjv52a/zzw1Ntwu+DUrle2uLdv6UZvz+66Qoufkj
	khTdrtJrzPTEo09maognlYWIZ3kfB59y/JT2tah8lm+MyuCZjoi6KAx3GEq5YD3ZiEA==
X-Gm-Gg: ASbGncu4gthEg3EUXQE/ZBHfqTM1Pn6D6+WTRU+baDwv8gigmqDX64Fny0dFWbKNtyi
	M+vMPAOknZA6u9qd+oqaeDquWUgp7jloHkFLUuK+ksKSWheI1887AJeKUeuuQ2930+KEmLiRxZP
	MaPAgsbPJyzJY3HHlg6OoEM45oLztoQfvdH6iWhIC8MB0kx3ENspbHA2b4LC3GX8w3vHIqqcjXN
	GjPRQS1ik6Cxb4LCq4fp7b/Vf+AZRTjIsnDhbhH3W6T5JQ9VfvA0ME+Fi3bdL674pVZ0uJJIqSz
	vkUcK3bgKjekzZaa+v2ghBHJzRAfK5BB6o2mcjU+YjWm8OhuXAzr1MPizQuZXqZqbhj0l5h8JQ=
	=
X-Received: by 2002:a05:6a20:9188:b0:32b:83bf:2cdb with SMTP id adf61e73a8af0-32da8206da3mr31448325637.15.1760420171893;
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSlhc1mcSl8tmhuzaLaI+INs35wZ1CSXhcN7zcbL3S2avPe4DXFk5/GWDyliZFU2mc1MPfpg==
X-Received: by 2002:a05:6a20:9188:b0:32b:83bf:2cdb with SMTP id adf61e73a8af0-32da8206da3mr31448282637.15.1760420171401;
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df4c40esm10506658a12.33.2025.10.13.22.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
Message-ID: <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:06:06 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Ron Economos <re@w6rz.net>, Bjorn Helgaas <helgaas@kernel.org>,
        Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, mani@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
 <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: quFDw_V2fsrrZIKdP7laSlaPefR7giPm
X-Proofpoint-ORIG-GUID: quFDw_V2fsrrZIKdP7laSlaPefR7giPm
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ede14c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JizxZ_2zm4TzMdWxA80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6l6hf7t55+Ro
 OoiH1s8CrZsLARvfGR8fmL2Wk0t1tqrV3FCaKjV13gtVVXlaiH4FvTC9Zyf6eFFJUtl6X2lR3iu
 0xS5In/356L4dQRsp1ynVHPlpfG/qgIaZThI3vdFd6jPfXbCjeWbtC1+MgMBInWqVJgeUR8WMIR
 sHDPSih/uJ8eAUAbWGP5vGvK6a5elQS+Ay++8lBODJugx5/FoI4kXZO51HjheYBvlQDQOq4p3kB
 zFHrU1BOy1Hjzuaesz+Ius76uFPSmsU1MBRaS6DA/QFr/pr0gIw45Ot+cxZXWUwI8AefaCTH32o
 voUT1Rf+JkAML1ymzM8GrWSCpB+U6uvarMS+0ZFKk6+m4EqHo+Mhis/81E0JvV495p8PZRkrT74
 mQE7yVdMu5OMOhOjy7mc4YHKGtgQxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/14/2025 10:56 AM, Ron Economos wrote:
> On 10/13/25 22:20, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 10/14/2025 2:58 AM, Bjorn Helgaas wrote:
>>> [+cc FU740 driver folks, Conor, regressions]
>>>
>>> On Mon, Oct 13, 2025 at 12:14:54AM -0700, Ron Economos wrote:
>>>> The SiFive FU740 PCI driver fails on the HiFive Unmatched board with 
>>>> Linux
>>>> 6.18-rc1. The error message is:
>>>>
>>>> [    3.166624] fu740-pcie e00000000.pcie: host bridge 
>>>> /soc/pcie@e00000000
>>>> ranges:
>>>> [    3.166706] fu740-pcie e00000000.pcie:       IO
>>>> 0x0060080000..0x006008ffff -> 0x0060080000
>>>> [    3.166767] fu740-pcie e00000000.pcie:      MEM
>>>> 0x0060090000..0x007fffffff -> 0x0060090000
>>>> [    3.166805] fu740-pcie e00000000.pcie:      MEM
>>>> 0x2000000000..0x3fffffffff -> 0x2000000000
>>>> [    3.166950] fu740-pcie e00000000.pcie: ECAM at [mem
>>>> 0xdf0000000-0xdffffffff] for [bus 00-ff]
>>>> [    3.579500] fu740-pcie e00000000.pcie: No iATU regions found
>>>> [    3.579552] fu740-pcie e00000000.pcie: Failed to configure iATU 
>>>> in ECAM
>>>> mode
>>>> [    3.579655] fu740-pcie e00000000.pcie: probe with driver fu740-pcie
>>>> failed with error -22
>>>>
>>>> The normal message (on Linux 6.17.2) is:
>>>>
>>>> [    3.381487] fu740-pcie e00000000.pcie: host bridge 
>>>> /soc/pcie@e00000000
>>>> ranges:
>>>> [    3.381584] fu740-pcie e00000000.pcie:       IO
>>>> 0x0060080000..0x006008ffff -> 0x0060080000
>>>> [    3.381682] fu740-pcie e00000000.pcie:      MEM
>>>> 0x0060090000..0x007fffffff -> 0x0060090000
>>>> [    3.381724] fu740-pcie e00000000.pcie:      MEM
>>>> 0x2000000000..0x3fffffffff -> 0x2000000000
>>>> [    3.484809] fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 
>>>> ib, align
>>>> 4K, limit 4096G
>>>> [    3.683678] fu740-pcie e00000000.pcie: PCIe Gen.1 x8 link up
>>>> [    3.883674] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
>>>> [    3.987678] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
>>>> [    3.988164] fu740-pcie e00000000.pcie: PCI host bridge to bus 
>>>> 0000:00
>>>>
>>>> Reverting the following commits solves the issue.
>>>>
>>>> 0da48c5b2fa731b21bc523c82d927399a1e508b0 PCI: dwc: Support ECAM 
>>>> mechanism by
>>>> enabling iATU 'CFG Shift Feature'
>>>>
>>>> 4660e50cf81800f82eeecf743ad1e3e97ab72190 PCI: qcom: Prepare for the 
>>>> DWC ECAM
>>>> enablement
>>>>
>>>> f6fd357f7afbeb34a633e5688a23b9d7eb49d558 PCI: dwc: Prepare the 
>>>> driver for
>>>> enabling ECAM mechanism using iATU 'CFG Shift Feature'
>>>
>>> As Conor pointed out, we can't fix a code regression with a DT change.
>>>
>>> #regzbot introduced: f6fd357f7afb ("PCI: dwc: Prepare the driver for 
>>> enabling ECAM mechanism using iATU 'CFG Shift Feature'")
>> Hi Conor,
>>
>> Can you try with this patch and see if it is fixing the issue.
>> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c 
>> b/drivers/pci/controller/dwc/pcie-fu740.c
>> index 66367252032b..b5e0f016a580 100644
>> --- a/drivers/pci/controller/dwc/pcie-fu740.c
>> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
>> @@ -328,6 +328,8 @@ static int fu740_pcie_probe(struct platform_device 
>> *pdev)
>>
>>         platform_set_drvdata(pdev, afp);
>>
>> +       pci->pp.native_ecam = true;
>> +
>>         return dw_pcie_host_init(&pci->pp);
>>  }
>>
>> - Krishna Chaitanya.
>>
>>>
> I've already tried it. It doesn't work. Same error message as before.
Can you share us dmesg logs for this change.

- Krishna Chaitanya.
> 
