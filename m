Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A73D412C
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970011; cv=none; b=TUQtZQDQuLu/pBPhdkJXpi/OY7TwGAIEsT3YLCoeAjpmy3QwBHQBERdyKAJMBL4oOu8MpWqciQuuDzpBgtMv3rfJjiHh4wQY7Pml8u3/76wW5BvVC6ILuUtd3gTMFFFSwLElid2QZ6y7iWd+J1dR6EWp+RXblx58u0AaBLw3yrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970011; c=relaxed/simple;
	bh=Z79/ZV1E8lF2jWkDMN9b27oGyaC5VsZs3hHaYMieIGY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KS482yIYMqXu6Gag2V6B6AwA0eiamznpodTe5yoVEOWH1wTbVXQATALXIC3ddg7goc0cHFh8yKfxc2iiyE68ygfwzoQngu7MGp0bBP/HuJxBL087ELZaJxKhxqNuXe8aYObaSUODvEkKjyYVCR4Dyt/MG3XpEqP+wVgh9Ne+l0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhysNm1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WT0hTLCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhysNm1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WT0hTLCf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAGiI2811837
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06m8/yZdG4MzauTqBv305qAiTU6fVqdgjhYKqZEeEvM=; b=PhysNm1Qt2xf3c5H
	aWfD2KFpX1/JGIy2MrajMSKK9VmD7pXkFwLhuPBEDoTq0Z/4kH/eQ22pHWBVZmhp
	+7FDqELru6sXQoglKNT9nhb9LFPI5ubgsXeQUs+qORFOxDZNttcSv5MU0B1NMkjt
	wngqLwayRyvadz4Jn0KfKTzZrygM6ac6OZGfHiYhSWvQIVJHGKj9L8t1rr6Knlqi
	iVGqSD3ifL942K/cxRaqOcRWTmEywVWZJ5HZhqbz0vRdpkb40a+6ksIqeDNmF8zL
	Xk8c2v1KCS5khPGXLEq3Go/0OwBCGYspSfyNS+DYltTWKuKGoSLs97+sF+/VlaHY
	mFz9Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7s67f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:33:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so406796085a.1
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970008; x=1787574808; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06m8/yZdG4MzauTqBv305qAiTU6fVqdgjhYKqZEeEvM=;
        b=WT0hTLCfaAB2F5fA6OFTXH8vOZORHvFq815+I+uoocSLuczpgAfpX5xEOn9tisiRaz
         UUVtjsdkWlzRLUEYz7f83zcXm8YxQaCH6fPqyUDouXIUwAopNdfAhhy6VmOwpXcjk6c1
         7OsPaipoGk5Zq3P2GK0hdcglYlLRJYDbnMYfnddG5kGs0606Tdoo+XUVC0TTHJ6sk9nd
         6WxjJUwbheXQRxLQNNhahQGxDG78LgQrmSiP69m4D4Kg0NKO+J5K5eyki1grPu9fRpkc
         bPKz3zBHFOhGdnz9EqvzkcYg1g+2FGmOEcWsSXD4s+dLifnDaGvWKOwH+6S6DMUB6jwt
         29Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970008; x=1787574808;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06m8/yZdG4MzauTqBv305qAiTU6fVqdgjhYKqZEeEvM=;
        b=WIswQt0hz7BSD115r7ejvoyUuj3wdkZ6mMSbrT+Y08eAcEfDwCYJE1D34Qz7qnbRow
         q6iOZgC3mABx3lTgJDT5p+hexfOsx6S5mDAuwZ5DOp1k+E9xNn50kyrr3E1LC8QC0+/2
         RV0nkZqQAEeEWJf22/7y3dpeVU9pUGnlTB5+XwhclIlbjk7Yz/K2XziqUzPvv/LEBiQ/
         /fu3VH2YD5rGJh2yK9BGb38Dl4Co4Tb6PR2IQF6wuPyUBeOGZLiTtfpOK3KLNPUuRHwD
         Uue720DFX/S/COM104jrXXGgnRoTbZ12+Kf3bfjsxOy3NayxkS9TYdtpm3e/y1V88rl2
         /pCw==
X-Forwarded-Encrypted: i=1; AHgh+RqMbVaMkjH4Y410QLpH+m67e1NU/VrDO9PdaWVO1jcW1U9fldE69tIOquibD0zrni36MKnzvmL7tEWczw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3HDH/u6yNkcwbWiLpEdgSicFnsd2DFKbBmq9vfh0q8vMtPspr
	zWx6vdYBtFDVv8biz8Wa4xS9z7Tc5LAlAKF9Cgcx+WwnBXHNtaHegECI/d62uwgQ6HWQQ1RV3cW
	7wfEQxewkn89l76eNRnnBkHRgqHpTYERPnAwlYR1ccymaOWPipRFqiraXUMZN4uvDwA==
X-Gm-Gg: AR+sD10Un1rw7vsF4meG6esS7U4/9Mf1WN25LqFU5daP9gG9jxWgdEkW8A19P8uYm4V
	8WHHBwgZygvuRsnEI3swciv9E5L3W77ONZpU92b9lbjh2FJmV2Q/jK0VUzryXHhYmLdjDGH+XKJ
	10EUu8PpbY1kNe2zPWtT0NNIQRFMbMVIJk4TE+94+LlsLAFiQtkkRWuk/kjZmSYUegMPUKljrL+
	yVUZx7xhfX6X8xNL2ZXL7KhnOmsfC+qX/hxtGKPAd5JyHeQej8Aa/IBg2CiqNrV+Urv5UBTaZHP
	Ybq0iZ4XKetxbH/2ym2E1CBm07tWHidMMcozO6QvZyWJGtF0zbmRD+NolFfO7ZWOgj81qNa2+dN
	Ukyl4m4PWpvAvjvna6qg=
X-Received: by 2002:a05:620a:45ab:b0:92e:f3ca:2ebc with SMTP id af79cd13be357-93704c10e97mr4003785a.37.1786970007929;
        Mon, 17 Aug 2026 05:33:27 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:92e:f3ca:2ebc with SMTP id af79cd13be357-93704c10e97mr3999885a.37.1786970007473;
        Mon, 17 Aug 2026 05:33:27 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm569500a12.25.2026.08.17.05.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:33:26 -0700 (PDT)
Message-ID: <dbef6c37-0124-4b2b-b223-53362c659ff4@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:33:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <regressions@leemhuis.info>,
        Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, wsa@kernel.org, brgl@bgdev.pl,
        basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org,
        chaitanya.kumar.borah@intel.com,
        Linux kernel regressions list <regressions@lists.linux.dev>,
        trantiendat29042005@gmail.com
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local>
 <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
 <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
 <1a209e14-05c6-4796-a8fc-d0c3a776520d@leemhuis.info>
 <CANTFpSWnTjoTS8hBOvVM_w3pWHyOiBhch_GXe_mG-d56WeF-0w@mail.gmail.com>
 <5a5f7f58-b35b-407f-a5e5-293a88cafcc0@leemhuis.info>
 <CANTFpSWTkwmb3F9UnZmeaLizH-cC6evXD=kd1eNwJWkCfyj8DQ@mail.gmail.com>
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
 <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
 <444caa3c-01ae-4516-b63a-576e095fef94@amd.com>
 <9095d7c8-92fe-4163-98f8-a53bbcefd6cb@leemhuis.info>
 <CANTFpSV9jguMzmfN7STb7XANYdn8i34bVmpT=0NdJ_o=3_Y1CQ@mail.gmail.com>
 <1bca212d-fe9c-4666-8ac1-743f8c9ef1c5@oss.qualcomm.com>
 <7c410f84-86f2-48e7-bee9-4c5c038bd115@leemhuis.info>
Content-Language: en-US, nl
In-Reply-To: <7c410f84-86f2-48e7-bee9-4c5c038bd115@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6hh8HvJB7cli2QyKbClA5JE3mnj4CmVb
X-Proofpoint-ORIG-GUID: 6hh8HvJB7cli2QyKbClA5JE3mnj4CmVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NSBTYWx0ZWRfXyyfxy83scvip
 3dQzcuRUcwYz9Y3rcKQLCPzhswF1Lm7bQ5nwbV6TMD8YSw8ALKGvENxbYHVNHty2r0tKv3m/ETS
 wKXGGMvjfPgkvP8v/DAJaIpZb4J/gSU5uycAkOlDzA7GxiKzB45P2SwyzNc7V17nY6DvNvhthG6
 MkjpEA05aREOLtv8IGUimSL3opeZ3vIX4Ug4AW0otOcYid8HxmZcbZ8OlKXVzpK4d4aWorzaz/O
 d6OJhLm8+uLYwRFeFsK+7mWnEJuwxcMGLYG7kHVCnKJBoI6ukNaEiGuSctIJ3ZUDDvL5rqdP1by
 9YN8bXKWfuPhGQk6cXKJFpmhFgpeEzZKlCh6tQLtGOgWU2Be4AZ5R9wwzxp6liRdZB9yFI2Un3w
 zmC9SaJOGC0o+fr7NEXlzDTZJCLMrEe9uCSd+85/eORAMZeLgYK4V6bU7qZA24KJM0b9ca+sKE+
 OcdCM5LdtXhIBzcHD3w==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82ff98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=lAgNKBcoAAAA:8 a=EUspDBNiAAAA:8
 a=KMWZhIlz7PXNtTpEvL8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NSBTYWx0ZWRfX5j4WMZC7Odnk
 JAeUuDdPZvoRmhWcFw64lm8yo8aRSt2Vd5I3VNOWxLkS56o88uzAyN2p7RB3FsPhHBZGjLJUeir
 a6Paaft01+Lfxvf0LeaIBcU9dXKqPPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170095

Hi Thorsten,

On 17-Aug-26 1:12 PM, Thorsten Leemhuis wrote:
> On 8/17/26 11:51, johannes.goede@oss.qualcomm.com wrote:
>> On 14-Aug-26 12:09 PM, Hardik Prakash wrote:
>>> On Wed, 13 Aug 2026, Thorsten Leemhuis wrote:
>>>> Hardik, could you submit a revert to the lists? And then I'll provide my
>>>> Tested-by and ask Linus to directly pick this up?
>>>
>>> Sent: https://lore.kernel.org/all/20260814100719.9548-1-hardikprakash.official@gmail.com/
>>>
>>> Verified on my end that it builds clean, boots clean, and correctly
>>> restores the original Yoga 7 race (expected tradeoff) without
>>> introducing anything else.
> 
> Hans, thx for looking into this.
>> Thank you for submitting a revert for this. Note it looks like Torvalds himself
>> beat you to it and already reverted this for 7.2 final :)
> 
> Yeah, I pointed Linus to this and a few others issues and then he
> reverted the change directly:
> https://lore.kernel.org/all/628bbf10-29f1-4e9e-b23b-4c47657433b9@leemhuis.info/
> 
>> I hit another problem caused by this now reverted change, where the PMIC
>> i2c bus would not show up on many Intel BYT/CHT devices. I wrote a fix for
>> this (attached) on top of the now reverted commit.
> 
> FWIW, meanwhile "Tran Tien Dat" (now CCed) with -next ran into a problem
> on a MSI Modern 14 H D13MG that the revert seems to have resolved. But
> the symptoms were different: the two DesignWare I2C controllers in that
> machine apparently deferred probe forever and are never retried:
> 
> 16.429266 platform i2c_designware.1: deferred probe pending: (reason
> unknown)
> 16.429286 platform i2c_designware.0: deferred probe pending: (reason
> unknown)

Right, that is actually the same thing which my patch (on top of the
non-reverted original commit) addresses on BYT / CHT devices.

When I wrote "the PMIC i2c bus would not show up" I meant that
the i2c-controller for that bus would never get registered with
the kernel because of the probe being deferred forever.

Regards,

Hans


