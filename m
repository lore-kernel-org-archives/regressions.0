Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04F217722
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716666; cv=none; b=Hkd7dWs4jvkOZmE0bLoNBiCmFSNX1xRpGXJGb/R2yRaPOWC9Iu16t461n5BmwQFOlPBvozJLUnp2buHfpvZQGPSBoC0y6tGXB7yOmvV04oeA9NoCd6JXwPgu1oyixZOTkrITjwUmjyWW2AWUrt5SGD3Uq2eFIDgX5LBFN58/u1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716666; c=relaxed/simple;
	bh=1z8mFPc+g7yAQ/45ZUryZ9zAoZA5Kq2Um1llUPtHebc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIlW7uc5wSdGo6QcZxVvFaKFX0YeFWhklkSLW68B1RZ7n5liQsgcNKAx59r3bI0KUAbGQmHI24cw71uvMVFAqCgZ0jGoTM6e2xHb7AH5kVdV/7olS03H9ck5o855qSREqqqP6x7KKslnVXisrDZLrQQWhBUYWcRyOrCQCSDMFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtAt1Kef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtAt1Kef"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H847t1017663
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 15:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=; b=GtAt1Kefag9lGI6W
	Y7+UMD4gK2sEnhYr4bxvc50x/7GdpfhBWJqZjlL7CfGPoBbYAwm7RSpgwFnMjIYl
	Ab4kHiP0EsQ64P0MhXtRlMruwvJtIWGwdhjd/i0PIyDfsAVjT6v7BUuF44cadJbF
	MRIVfkZPqc7bM85sydhJQYSHkzFoukZNkV3pnuycXnI2nUPrgGLM9Zjikwxl0rY+
	BuWr/dB1u5c9XJaoMAArJbhcFbn+g4MznrbP2GYckqiRmpEvzzxZWl8tlUfckHTd
	c2HOMxquKS7xKDaJOpRwS0whJ51DGiEo+JUpoY6Fdtx+v4yySGJxQHXjBzwfOBAr
	pe0dTA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5w0d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 15:57:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78106e63bc9so2355852b3a.0
        for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 08:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716662; x=1761321462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=;
        b=SsY1SwX9QMOYfapkfcCjJs4tcqNLt2/TiGE/31LT4pReEfWHnH08KlvByKyKjtk9VO
         5VJEL9MSQgB4XmYQGI5/N7Y8NlfB4g13OlvBpEBVAFpCTMouhERkJcGcT0xwcNHzQb6W
         GKkhaaFZomY+aN5lLI4gdn0z0iwpnGyoVIGMSTZKblzQnScZVUzG1UuCpLmlNo0uAAkb
         eZXYDmEXa+JNqymjZjou80QoWlkCeucE89A+dDi7psBCfpwJgkq+YWtRufXiv8SGL/NI
         dlq9dy/C8OWYL/i6Mfugiwosqeh4ZE3EnJV9qft24UQJnrD0wU97GKhGs45MS0FQzfxO
         q8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS9rYDc6KwORE+3mq0iXwJURrXVXP4+5E89mLwd/DjzPZ0oka7EAUufTvR1YZhmEYEpGBXcKii/xcGqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHi6X2PMKll04puuTJ1pi5/dqz5nAiRe4UdKG4o0c8Dm3kfaaO
	jeDkRM+LZAZHZqXHxn3eNF3n0MpfaNdE2CIBmZtZJKhsfU1JPjN6fi19eiqoLew/KQzFBfRyoy6
	Jx1BOnI6wJm+aF37gG/qxjGj5fKe0s4G5IsWD7lCP0SocXd6uSEh9D6k9ZVf0qGnmpw==
X-Gm-Gg: ASbGncvSseodDbtpPZFAn0kQGh7Iw22hlTsMo5TK/jk2qrdFz8+bLrTCDz5BeLnlVzj
	gS2rf4hAJeyR/MeJL02ORMdyuw1q8mW1dltoSUlP3BVR8PtOAsJoaoDj3/kRgc1rPxOZxRAdBXm
	CRuzBJtNhMM55SmjNDOuPPUzipucZxTI+P6GdyO06sHBJyBXXKVF6bS+XrBv4eMJtxuLRrUnSQY
	Gm63GYyw+nTeu85ScjEg829WUMuBU7C+Tgql5BuncrNInizC/36QLO+8VH96TmyX6/qPDqPuBXa
	w+UbGD1EU9lZFsEPolyLYnscjJkJiZp552L2TBOFnwEMI048gnAcomDeLzIuZJIJ8BpxE66bKLK
	Nhc6dabu41fWT1X1m/DgfWNynDzUx750jDHiJFKthWLwaQBWZqnWi2Ei8JwY09mvvQSl+f1k=
X-Received: by 2002:a05:6a00:3a05:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a220a83474mr4870547b3a.11.1760716662323;
        Fri, 17 Oct 2025 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEG0kQQyBJokWPqPUpBDr+VClTQlOa2zZV29zqtuleUAhDclL+l5xJ+z+cpPiams7RTcEdAg==
X-Received: by 2002:a05:6a00:3a05:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a220a83474mr4870521b3a.11.1760716661866;
        Fri, 17 Oct 2025 08:57:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b065ac2sm26007964b3a.16.2025.10.17.08.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 08:57:41 -0700 (PDT)
Message-ID: <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 08:57:39 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
To: Klaus Kudielka <klaus.kudielka@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        regressions@lists.linux.dev
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: my6DmvOIzA-415vsfBuYdHG7lnClcH0H
X-Proofpoint-ORIG-GUID: my6DmvOIzA-415vsfBuYdHG7lnClcH0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyJycmGUKXhCU
 fDOAHrN36YSkGqhywS/wNkIAUdYEfjGns3no64ZvQSwcoCj9mYs+8ix3c7aEfIAWPHoPZxGD/BR
 13Psn4jzwBRLItSado4CRohlpzmdV5TAWjaBhzp/3rRE8tKsdLxflQPj9Ee/Q9lNkqQZeEVBm0U
 r6N5Co4H05g7npPZWKbQy3wi85GLYIAlR7aBk5WwAfOYzhn5Pi2oqg5sY9w2TgsalwVo77Y80hf
 /0dgDBGV+alvHQ6Ycay7nf6niz/FVJhk8fxIIJBWW4seYVWLdwxrcWnNNoQYCDF3Vl6zdNNi4wh
 SXcCcg5AfF+02dXmEaIgDBxPau1jyOz3SMt+6wunK/8sK3DisqQtOB5wpME9ZMx9+7UmRIBbVmo
 mo+IMGsestfX/2gUqVKbI5PPiOCFIw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f26777 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=CbrLfc9WufdjtirxkE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
> On Thu, 2025-09-18 at 16:47 -0700, Jeff Johnson wrote:
>>
>> On Mon, 11 Aug 2025 17:26:45 +0800, Baochen Qiang wrote:
>>> Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
>>> failing") works around the failure in waiting for the service ready
>>> message by active polling. Note the polling is triggered after initial
>>> wait timeout, which means that the wait-till-timeout can not be avoided
>>> even the message is ready.
>>>
>>> A possible fix is to do polling once before wait as well, however this
>>> can not handle the race that the message arrives right after polling.
>>> So the solution is to do periodic polling until timeout.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] wifi: ath10k: avoid unnecessary wait for service ready message
>>       commit: 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a
>>
>> Best regards,
> 
> 
> Unfortunately, this particular commit completely breaks the ath10k driver in my setup.
> 
> 
> Hardware:
> - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
> - Wifi card (output from lspci): Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter

This issue was previously reported with that particular chipset.
This is currently being tracked at:
https://bugzilla.kernel.org/show_bug.cgi?id=220671

It may be useful to supply your information as a separate record to that bug.

/jeff

