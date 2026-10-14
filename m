Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E364E8DE6
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983722; cv=none; b=ejUhWfSHs01uBWNhE9QNoCZheGN64QnJgzJtP3MDTrzmeWICXYVKVdFepYsFXTWctirBAtrbBs7NGSbpbeIx8WQz8kIP7Orw9GSyDfB0F2zT3/+wuy8WiGPzCrGfzn3hVmd/4mGXvEJ1VjaTu7UjphaebpwKxXmn0qZecJ5xxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983722; c=relaxed/simple;
	bh=RJIg6DVyFl/JbgK4vyZA949yfWm7M6w93iBPf750RVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nW7tBV1q3Zw9on45P6qTs7433B+oHyJt8WMgy/9JS05HTCYGlaxhZrT4GXLjTmy43rmlexFgvbZUNULrX+zpTUu7lqt0ZvIQUW8tcbGi2YLUp0ymzhvkAwYqR9VsFmjkcrNLeWhBOMVxo+A3ZRViMdotHw8Agk6UmuGf3KkaSGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8l4uNRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBC64tZp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8l4uNRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBC64tZp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBOsbM2515923
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=; b=j8l4uNRMxMWBSJB9
	u0k86TnyMIuKD1gEV7Lj06vFiyQbzxbRF9IAA/vRUmv7VhcL2Hc0G8UrXvN3qg2O
	KJOXoyL4GOEyhX23sUwrtGbZ/Tta5mXwelAPFk3zPndSSofcAp9ipTfs/pVzyNoe
	lRNAQKKdBYK6MymPFmFsvt/WZZc2i0NQE5nl5O1oQZqlQeyM6ydqTvjElhL4MDIt
	gSiPtEBYktFbShC1ONTkOgo7DMtJyBBMBY+NXOdiKxlKbeH5O5f753Bcc//4KAo1
	SmB3ocTvfJOc6WHXkke8Zmy1yhc1s7NbzxvTIj2hV7+43ucEckp5afE4qdYOaRU4
	0ydDdQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709gys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 12:30:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so86721e0c.3
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981054; x=1792585854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=;
        b=QBC64tZpgwWGaT9stdA/uRmBW/wrxonmFN+wc9PuTJNLezq9vi96O+S/G0POIXSYr+
         RSlo4Ru3Of1nTsnBruoZ1lV6OwOuVyMiQ+Fi/+BNLglxJ287XU3Q0qWhVEhnpWEeYxZg
         MlfijGMMG0df6QHvdyefKdg3kCq9GLWY3Ve36ZVxclgWrvqvLHSrIj/QAYOJsctDkiNQ
         r6ZrJRSb0ujPAUaEbdN33/GDuV3mZcRJlkmNxdVdMo3DzB0rajvpXPK094hnLiuc0bd/
         rZr8x4TndoI8UVBhgIhoL0ZbbV0Mc39Hxjz36zJU+GCCXuOMtWktfN759Tpth/1zRaxr
         XIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981054; x=1792585854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=;
        b=Dd56/GSdoQzVQiWw9rTwkIHOPgo+NkFPYTagI/3kCtZmdu87Q9qqtpOSk8xCwl85Ca
         Imzq5fV2Omc8j8+0enDws0VZf6yI6yPex8djdENdyDlLvDW1EaeIFh1DORkdFzrEuqXd
         9hY3CS4yT/Nvsy2mlVbwKogq//scylhPyRoFy1Gl4JZr5KyM9zW6NkR0PKxxRcFr1Igq
         OS26JG/SgyKxwjojxk1DIIonDhjkM8e0rtpPRkE9JjbN7PAdLHm9lPmHdsKjvL4TfGyT
         06Nm3xzldyc1hZDcidzCL1sDIse6KArE2wW7TEc8Qn/dne6KOPUnaYKp36CNt2kDasOG
         IOsA==
X-Forwarded-Encrypted: i=1; AKwUvBwdsAVGTsliCv7pdUHUxl7HWHgmW/wK7c3gUll9x0IeL56a3k0qxDmQ78eyi0T+nWh/E0czIDwPPHvHxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIOiBigN2E1PPVqBarg31cxn31n/WoMwmk9XRaT1WL8XFinYSw8
	qjsrsHrKHcbZNw7J+u4OO6RGBGnAc21QQN/JLe+5vMRn8xLJt3W7MOQRrSi4vYg3LQHmv9F0JoU
	4IwS04BgP8WEAbWvyWRiZtlQlfZwftgSU8pk91LksrTxTqnWqz1NoRhcYxmJcTz6XIQ==
X-Gm-Gg: AYBFou0NE/xofAFRnIi5kCGLsNCVoIK95Z1hlkNlrP7m3g7aAFjHbmvWa3es4Jwohzt
	5xgarYnmp/CNHI3mcyG4BJOi9Y7PfkmULA319GWRTP25l81Qdv9kNfaLyL0yBQ299I/gYIy9pPI
	daA1hkM8CFTxueq790edkkOUbluLVPuwCkunEopXhaoIikp2CsPrS8jl2XaIgwaDLiqk7dL69CQ
	6zVP+9A0E+dxq2vy8g7feC4LJbAFy4FT0EaZJjbPKkX8/UEIgQznrS1RSznmtHUZImZcNyI/zwM
	oDBhk6WmSPtSh76uuanUf+BFaxlzN++G1zHK0/+1pgPR4MSsrNNabPhGlHDILTfFgVIoMHKhjch
	h7d8QArD0SA66Wb+E4mTkVw==
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr3342744e0c.1.1791981054263;
        Wed, 14 Oct 2026 05:30:54 -0700 (PDT)
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr3342717e0c.1.1791981053779;
        Wed, 14 Oct 2026 05:30:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9fffbsm691074966b.49.2026.10.14.05.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:30:52 -0700 (PDT)
Message-ID: <ae03e7a3-75f1-42df-b0e6-0e64358be647@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:30:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
To: Birk Skyum <birk.skyum@pm.me>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Sasha Levin <sashal@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260929041444.9837-1-daniel@quora.org>
 <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
 <CAMVG2svsfP+6cpRq=kBCZFva_r8jXSm+-pp+qC9D372S10z12g@mail.gmail.com>
 <eaa6f116-7556-4791-857d-cd50c504528d@oss.qualcomm.com>
 <20261009145800.rc-reply-0004@kernel.org>
 <b7bfbf6a-e5b5-48be-84ad-8bcd8e22c5de@leemhuis.info>
 <4acb0eee-f7ae-4817-9848-d72cf486bc06@oss.qualcomm.com>
 <e8f862fe-f86c-4522-9ef9-70fd754529af@leemhuis.info>
 <179197985641.52689.14222546983549320957@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179197985641.52689.14222546983549320957@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX8vLrjFHyvPE0
 ++uyqjru0UqdOHTENG+ccusnUgO22JdIqMhMwFC0O3od8eiZfcL1O6c6AKLrSv328N/tGLqbQm+
 hdb0b4rtlhMxD3amMncb4fbIv+Gi9cJOKo+I9aIKz5+aFNLCvGZa6h89n8cyuLtluZRUTg1x6zY
 5CrKwxXT5t9f8tO56Cqejjxx1hsgRagNVnTQRNJkc2DXxeTGgXoilTakDNJdGQ2//rE+A6KEtVJ
 5bSecGV7K5iqgJ/cUy8EVFIsXWWGkbXLxLxQegRavWfNlUnyNRbTIQAR12k91mLoEMG5wSEoYWi
 fIBcPQKbJlCqQsD3VNdEEBLw29/xyhX1+gXVZaLP0wbwmtAfGx3bcGttpHjnb2+c+hiZ/YNLuAe
 nY/0mBKaauN0nc3JjH9kua7N39eCEIkgHf1byXnA87OK/gpHnp+P9yqN4JkpG7ml9WuOwSVBPA6
 DQFYIOXzb4Zl1dmF8kA==
X-Proofpoint-GUID: KRB0y2z4620t_kzSJjWR8JCj4pw48X4h
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf75ff cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ISgNb0KN0Rerl7bivZwA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: KRB0y2z4620t_kzSJjWR8JCj4pw48X4h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX7ret9zg1b4Gi
 cwa47bNUrO2gs7EOcPxI643IgfbtWMvLJb1TSV8L44bKq5vP1WAhl9CHResFwgI7MTyzuNlZbpF
 PWC5P31pgF/yrDM4vI3nZOqvLex/cSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140049

On 10/14/26 2:11 PM, Birk Skyum wrote:
> On 10/14/26 07:08, Thorsten Leemhuis wrote:
>> That's how it is sometimes, but then it's likely best to go back to the
>> know old state by reverting the culprit -- or is that a bad idea for
>> some reason?
> 
> Hi Thorsten,
> 
> One correction first. My report was from 7.2.9, and I had not booted
> mainline when I sent it. I have now, on the Yoga Slim 7x with v7.3-rc7
> (a distribution config, no patches), and the keyboard and touchpad are
> dead at the disk passphrase prompt.
> 
>   geni_i2c b80000.i2c: Bus proto err, noisy/unexpected start/stop
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -5
> 
> Same kernel with only i2c-qcom-geni.ko swapped, one boot each.
> 
>   v7.3-rc7                          keyboard dead
>   v7.3-rc7, cb97bf3d4f91 reverted   keyboard works
>   v7.3-rc7 with Daniel's patch      keyboard works
> 
> The touchpad binds whenever the keyboard does. The I2C serial engine
> clocks read 32 MHz on plain rc7 and with Daniel's patch, and 19.2 MHz
> with the revert. In all three boots the touchscreen and the three PS8830
> retimers on the other four buses work, and only b80000 fails.

Since the discussion still hasn't settled, please go ahead with a
last-minute revert for 7.3 so that we don't get an utterly broken
release.

Konrad
