Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177B4EF14D
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972120; cv=none; b=u099dSph7K+2KRMMEz3iwgZD/pdjrvzxih66z6HJPJN6xn/0jYE0v7ImCqXQ87uZXXtQiTns/HLe7CNpc0dQKme+vKJCjvxvd51v0NSCKvp1N75T2u/kqZxgKA7WR4BosjCqVegV87vqGhk4qR9jj42Pc+57VgL0ZFiWItqNnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972120; c=relaxed/simple;
	bh=bxAABMcATBGCVbIdLI2E3IV2T/5FveIz1lB1kdv5BSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KJ/sTPRwlV8KF0eLQ0sjTlZjDvUKehvBRaaDFrxJJ086s/Hk2jl61MJA57Wj51H0exuDfeX0f/1jLZTz3/paIaPmviFAbw75Fm/RrQJtGaK+CS+RkLkNfCX/UY2r5ZwxXEmOh0A1q7GNyntAlNOxG+eP0FIabIpafzX5Quk3g8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtRtTzbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF03KcTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtRtTzbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF03KcTk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663UJ3365335
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 10:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=; b=XtRtTzbreLbENmD4
	w9nXdbO9+ui3nKl9oY0BLYee5c0YjQhis4AHR5mDZjszR844X7av0SCOJ0JiebSN
	cj2uDa9JoFT4XZEEI3q0mp8Zn6FJw2h4P3o+YIt8BKVj+S/6wlK7GC81Zw9kB17z
	2D3bc3zpMPhDXdHhWrtJeTX0ma16AzREevUBcPO+7YcnCOPfQkm2w6uMJostm/v/
	COTWRZbM0mdvs9XtLz/CjPEG6jPQ8IR0arPxTaOxX500uhNoCLm65ItV6aTe93n2
	Pjj133XIbfbRcX105R1GCek4kOAOCOeJcDGyrudOxjDQ/y+arROsXbpw2wOaBtjO
	tPxB5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621068-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 10:01:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5da613f7588so4460884e0c.2
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972118; x=1792576918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=;
        b=jF03KcTkDofuQ4BdmLVu04uQsJ3u4p65y/1is08pIgjrO5LoTeKVqvFWLM1F72BE9T
         CrFsrRnBcrakKMBNqh09Ix9BmXs9M1XNwVvSC4vBywwG33AxwsbIK8rTtNbV9CFV1sgN
         w2WpA+UEzTlZOTxZByALXqm3RTo7Z5sD1555r5UHNV1xnWNXlLX/nwKEDt2ZGdy6QClv
         2vB7eQgYsJmYqKlarj2lj3i9A281wToajdJ4awpDPx2D4xzrcl98T2F4sNr2+oOKtFdO
         IMhx2WICVG+jt6ioiTQ+iQ8cutRrg+HywinSnhD3EGjawr4/uOIpuT9HfVXSNa3X1Czd
         VCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972118; x=1792576918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=;
        b=fIo8ORGSad048WdizKOlBW8Z4k/RKEdL61gYx0VvM+t2zZ9DYfw4TOXUNIpbUQrNfc
         ADcocoOfj2QN8PuY48nfyD44nMARGCnXEbugPOdHgaWFatXt5tU5lahSTbxIEmGk6W3F
         lW0XXroeKxp0hYgKl1M3To6sc5SSJpHNI7Khzd3pCS7JhlE46p+MdOvS85fg1vy+dm2l
         SwP49/BJHYKW9YEbaKXdDY8H31V3kY+mzcyaIdL2KbJRP7kN/hOW4SVhxAhTmbF1EAjN
         hGVp4UOswB6BfMVIb2V9GU41eUd1DmWcV67oQljZDlFnwwFND8dxqNilyV4EiQ897O5H
         mLlA==
X-Forwarded-Encrypted: i=1; AKwUvBxjNmGlxmoRR8HodMFdWjVwSHgc0bXRBY8FexUDjkG+fEoL3KYBF85heeDrVybe7xR31biOYsWl7LyP2Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYICIY3BV05c2QGotG+VubQBW4STN69FoRQQlQ3wO3oXtB+0i6UX
	JMOkvCdcaflJr1e/z5RTGpluZjBCHqvx4CmluS8vnFd3gF8SXZV+NsQqFoKMbYHDLonhVwUjrQm
	+0B9tPcos1UJ+Epj21ZQtb2/q48TD/qnsXwOs3bClzG9OzFBWHsrkMmtjPlAElO6JoA==
X-Gm-Gg: AYBFou1Gpd35VnL3aSlAIcJe1fWZ95kG7ip0V7gJs0xM1Hp10OGew8L/i9wsjQfK+yQ
	bdLZg9CSulNxTrIjPjBGBc/u1p1wqY+P/jLOMsd+iynZu2k2UyCkfVP1amFljW/iz4g76r4pdP6
	G8RpNdLgh6zyfcJXBxQtmilS+7K+puE19hcLmuDSGZM9SQRRONT1nGqMjHGGokcDrvShR0ZgvT5
	Suyb2AdnivYXTqfueF48JP2QgZXOM1UqE5PWivfLSckifjBFg/vIabwJGFwkbk4uiElX+BCrCuG
	LsJllVzEsgwuEFNuwAVzy9Go231BX1MAQ/dtVTqyQH4OD2mNEFOA6JPs50HTsbsonpqpLbsftFt
	kg33zCPS/8Dp5ueG7Iqo4UY3NkCSgkbZZ13UimhsVycTINZClrs0slyHNTS/i9N8JOX5TpMYJ65
	nK09BkbSuRSQ1RwV15No5npIz6FANZUe5kv0rpSw3riPZgBuO+/FUPf98Y6Vge9VUvDQ==
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5e91f4d187amr5598573e0c.16.1791972117920;
        Wed, 14 Oct 2026 03:01:57 -0700 (PDT)
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5e91f4d187amr5598522e0c.16.1791972117285;
        Wed, 14 Oct 2026 03:01:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm683926066b.80.2026.10.14.03.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:01:56 -0700 (PDT)
Message-ID: <ab5c5ae1-1bfd-4fe4-adef-fb64b5b3dfbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:01:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] ACPI: battery: Re-read battery information in the
 complete callback
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, regressions@lists.linux.dev,
        Mark Pearson <mpearson-lenovo@squebb.ca>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org>
 <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
 <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
 <044e9df4-1399-4ceb-80f8-f7cfe031d04f@oss.qualcomm.com>
 <CAJZ5v0isCM3K3U6HSdDnvXzBX41AgQMFYxqLx3KvMA0W_91-ew@mail.gmail.com>
 <20261013210609.8117-1-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261013210609.8117-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JXDbXV352GH1QQssHp8_7zDCPejM2NDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX5e8G3b89Q+2C
 Dxw4+7d+AdNtTh78W8LaVl7RHX+TQZRuBoO/AOZq7ljcdHLd/I9oZdher/TC3R2UPMrkCIgORyK
 xWbgBDscYqBqlnhly+CPRaImxHJ3k1cTbwcQouULvvH5YU1CC2yUiQ0sNVwcMeVkBPRQJgGBFLz
 13tkcBFC7yk5CAb/FbER8KcOFPUYVDJ/QrWhWuxrFc2U/p7UCCcRTX9nkBdIReasbz6V2H0c8ak
 /zL1Yko3QjRmJa2R1bKmC/LF32T72NwSVDp8jgldJFD+GXRGCAe5HH94X8T7qR566sk2GxP0rUz
 OEk81+RjChL3Ny8hCUoNn6hcHyZUBzg3crRmJg1YSNisgvf4nTx//sQzizivBSpg1a9geT5wGAW
 xTa+w9LsSJUilmjvlj0EfXD4jpFYjsTwXTQkXqgBtWb6veqfYM0MkaJbMYzPmzquqVZqxQeNKYm
 6FzBinFQA9SMf2bX51w==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf5316 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VKiBM6ZALRNij_qUCYgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX/n5F2H2qanzE
 UasgUklMGZuz0HwbSQoMmgrXRcapekhYDbjvMr0QEOEz3q5VX+lwYBvoxleXhm1fe0KsVgz/e3t
 dMy5i6w6AWwqlnO9jeyg0VlDV0cgpSE=
X-Proofpoint-GUID: JXDbXV352GH1QQssHp8_7zDCPejM2NDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140039

Hi,

On 13-Oct-26 23:05, Ali Ahmet Memiş wrote:
> On Tue, Oct 13, 2026 at 07:20:55PM +0200, Rafael J. Wysocki (Intel) wrote:
>> Also, we don't actually know how many "bad" cases there are and so far
>> we have identified a few.
> 
> I wrote a script that extracts the ACPI tables from all 208 BIOS
> packages in Lenovo's ThinkPad catalog (370 models) and flags methods
> that switch the EC page selector (HIID) without BATM while other methods
> use it under BATM, and checked the flagged ones by hand.  Two BIOSes do
> it both with \GTST from _TMP: P1 Gen2 / X1 Extreme Gen2 and P53 / P73.
> Apart from those, NVPS on T450 / T450s does it from the NVIDIA GPS
> _DSM, which only the out-of-tree NVIDIA driver evaluates.  This doesn't
> cover races like the UCSI one in bko221065.
> 
> FWIW, the exclusive variant is done.  With it the emulated \GTST breaks
> neither _BIX after resume nor _BST at run time (0 of 5 and 0 of 1074),
> and with only the _TMP side converted both still break (5 of 5 and 421
> of 424).

As I just agreed in my reply to Rafael, it looks like we want to go
with the exclusive variant for now.

Can you post a patch series for the code you've for this now ?

Note I guess you're using LLM to help you with this, that is fine,
but can you please manually shorten the commit messages of the patches
a bit if they were written by LLM? OR instruct it to write "short and
concise" commit messages?

LLM's tend to write overly verbose commit messages. Note a good commit
message is important, but lets try to keep them compact.

And the same for the cover-letter.

Regards,

Hans

