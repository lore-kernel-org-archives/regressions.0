Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E751614F
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 18:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916143; cv=none; b=FEzpedLSGHG12fSzd2T1mzE6qDr7GTxc+W9+Cb7ZVosS6x1WKMrLONdeSxIbwg4nyT3KlQHiqM8UpdFdpZJb3r7fKUgRTbLUsctrdNx5nPybhhT5aNMA0CeFGSYIs4vO76ckShruppqsL9J+eO0Xx9uGXCUeqr2DdI3mH4TtGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916143; c=relaxed/simple;
	bh=e9zBphVBZjd44IWcpVI0lqCnAplEQpZXDYyGO8O3PSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZIpZb/75urAf95DpUGmaG46OeWtCkpEfJhnY6GUAApWepyUAL/5a/NjEWfQcLzFKnFoXHXRkErwyUfskbB6eTFYFM1W94B1CwnwG5CeYU1ld7bV5kmEVf0gdq2QNTl+qdaplv4tBWHXbvGi4Ap0UqnF62nMnvJjNzosO6dIii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZ6bS9TR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9RBjd8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZ6bS9TR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9RBjd8c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3qO71999236
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 18:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSYA3BT7fccaOgtCBIv4Ihm58BgpNYihDvGMqz3iMdc=; b=YZ6bS9TRHlzDLJ1M
	S5RPkSa/7+VXXes6MMLQbiUVW7Ag0HpQcmw3TjFHKrUzQLem6KECe9yf4me1uiTM
	KF0i8Zi9ATtrLN1dYlIUsSpMoby4PhY23fCgp3Li0+QZOTMfCeEt3HZJnlmyrAfC
	56oh+tvRP05IlY+5Ot+VeIFl+M9AdpegzATZekhxE33xFN1dpTX+raO+5AnysYbI
	h3O3hBgp3s6KL5+INtX7yemKJY8Fg4LfYDvI7ACE3f12KpUvADPXwSIzVGOncIg5
	1h0nTao4ggd6Bpp6FkwdvHQbv4ASvzBUDeTS4zp6z6PvkKQd5JI1qjDlkSjw/4R3
	//YMcw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62b8a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 18:29:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso456302eec.1
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791916139; x=1792520939; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSYA3BT7fccaOgtCBIv4Ihm58BgpNYihDvGMqz3iMdc=;
        b=H9RBjd8cErW5jct16s1bx1o9BnUj1WBODT1a900OFQOXAQh2mGfARviAWrfgRc+SsI
         wet6qCQGLMwfLqe3NO3Xy3n5UsbIR9QM8J3YS3JD9Q9UmsFeLZIfH7jQ4hm0hPQt/A+M
         +haLodLlUIObOvVrLBp6lvLMjPL/3kZKbS51cRlBcP+OER+gD9QyaUuOh4JIv6s30jkT
         mhbVMa5YFuWAK9acPZ2z4Wp0FYp0UpKb+p3gct2nDiImhXHcx5uKy4U3DUeSTkEDxxpC
         WNgrCdxK5CpVRFj9Ghr5YBlLYC22jIFzY7ikEV6+g9UA5uTjRFZajFbtGbM+OiN5ej1K
         3A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916139; x=1792520939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSYA3BT7fccaOgtCBIv4Ihm58BgpNYihDvGMqz3iMdc=;
        b=gq4/K4ESlxs9RvkHodeR0kFZA5Re/audAR1ykTPyXpEXTI8l+dBCWgNkBZhqrdtuJv
         sU7kkSJFfaYUMiRRuKsotDC+5E2X0HVMQVnRNCRkCheTzO9HExIScK7wRt/67GPvuDZg
         IY2ZyoL3UM8JlspWACkqqIYwPO8aZ88cy25Jcnnp1ciHquWjG9P/gCZjvv3lT9ExCfRJ
         uEpcy4Wl7hsfyFw/XrZJZs8dwk57UEXs5ChmW0Mq+Yj46/SNgTH49jlHIVTO45K0Fl9w
         +mgUb9rVHGOdAXwyajIg5tPaie6tCrMskBSlfZBmeOg383CEux5ObNCkDUlCdSy088D1
         Ry4w==
X-Forwarded-Encrypted: i=1; AKwUvBy//LPbQCt8ZYg0dEBuJTY0u73zT83BNTqG/Ofs/Lq4YQ/Z57TQ6l/afz0Wzc8Nc6YbtTX8OkZxsl26+A==@lists.linux.dev
X-Gm-Message-State: AFq9FYK42gih5IvqVlors/exZVxukgGyI1SSBHtbD2BLsYvSWebYP/sA
	nIduLEwL1IUUylO4xa2+VJygYS/u3siCs7RTS76s0tmvUabtmSZs1wS0Za/e8AUR9AzLYqjRDZA
	QNBdnU0Ppxh0h0ne/9/Qojbve5SXN4SiKhvfK+peNYiOHMx9lqT4FhiYfkJCIbjJZgzldJ5htKQ
	==
X-Gm-Gg: AYBFou0HPwJhlIGd2h+vNQtYqwbKD4KGGWSgwHiXYBfvNOz20PySI/AxZDTA5kzg520
	uCaYxCULjDOnN+mFnPxEl3xOHzw90RovYZ3xXQhpW4EtiDlZIq/5m8pMY9UXKBjegLsPy1lCYmi
	2lIjEchy1E5nncG+vI3yCSs5zMrVP/k1cl5zq6et6il3EO2TaZ6WMmbAxlsXMLAg/0Hg/ISwM51
	PAOqgS6ucTSMLkJ7PHOQNoEYq2EWuhI6P8tndKwqwEucrgYeWlAfltbcPoEDuEpqwv+sdFZcbV2
	O4b+kTtBbbGLLaB2/O7ZOcO1h5IZPzOHkQbv4tCFKSGfz2/t9laUSpsecjgK3u8K3gYGlBdua1s
	Fh9KR5u9pl4896ryz1jLdAtjYy/U09gYA3+wYJkb93IvxM//SHdtigXs8UHbU4DJtQixw59A=
X-Received: by 2002:a05:7022:b0d4:b0:143:2984:6518 with SMTP id a92af1059eb24-16a612bc1e8mr20627362c88.39.1791916139184;
        Tue, 13 Oct 2026 11:28:59 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:143:2984:6518 with SMTP id a92af1059eb24-16a612bc1e8mr20627312c88.39.1791916138466;
        Tue, 13 Oct 2026 11:28:58 -0700 (PDT)
Received: from ?IPV6:2401:4900:889d:390b:491d:8cf9:7389:5b70? ([2401:4900:889d:390b:491d:8cf9:7389:5b70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm39437810c88.19.2026.10.13.11.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:28:57 -0700 (PDT)
Message-ID: <4acb0eee-f7ae-4817-9848-d72cf486bc06@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 23:58:44 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
To: Thorsten Leemhuis <regressions@leemhuis.info>,
        Daniel J Blueman <daniel@quora.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Sasha Levin <sashal@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260929041444.9837-1-daniel@quora.org>
 <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
 <CAMVG2svsfP+6cpRq=kBCZFva_r8jXSm+-pp+qC9D372S10z12g@mail.gmail.com>
 <eaa6f116-7556-4791-857d-cd50c504528d@oss.qualcomm.com>
 <20261009145800.rc-reply-0004@kernel.org>
 <b7bfbf6a-e5b5-48be-84ad-8bcd8e22c5de@leemhuis.info>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <b7bfbf6a-e5b5-48be-84ad-8bcd8e22c5de@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace786c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=-sI2l8CUKJjV0ebggCoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3MyBTYWx0ZWRfXyxZN6EZEHYlw
 PTQSkvdL0Zo0r9KaDDjlNjwjajmWkcx8JneOkHETXdxP2GYSL9jF7IWRwyq1KQ+QOjDlIM8+t4e
 lGnPlznYZDDY3Qet1BTC+QFqG1cgrEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3MyBTYWx0ZWRfX13pTPpWynnpW
 jCt9dEXUaU2EHBbes2FwzK06sZXPSCN6K1+10OnP5Hbgb8yKXV9HOsoNwufy7V9moUMhmwbCt+U
 JMZXgOTnpfS8Gwrui8K/9ipiW/q8oE05WzfoDGpspadqsLZrprzdh/fAgs1xeIrkqBGjQwpz1e4
 Zds5NWEF7FNMiDXQM601xsqf9etYVA2S32v3HAZet1q7YKd1i+9m2q9Bg7tD5D4O76xaNCsqZW+
 ce+8nb21XsdiKFV8PYd7l7OojsaonWh5DzuYgIlBrYArq/PmM+xmS6YcFF5u0zxl0nOhAZiiUQg
 t5sXDKh9uHPOyx1/A4JhqFbshsyWNvtDDytctPqiyXk3G0lxBV5sz5mq6qvP99M7IRe4F4cYyBT
 PK/evqD0oYYheIKW5lVwpD36gcVgTYQGTEcgXn3gTmETXA1dBnYrFAoY7yTnQHdc5rbJm3u0xnX
 TYnErUOfVGOi1g3zjOw==
X-Proofpoint-GUID: GKnrIabgE1fA0Gnzj-dOIvcmnY6f9i9j
X-Proofpoint-ORIG-GUID: GKnrIabgE1fA0Gnzj-dOIvcmnY6f9i9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130073

Hi Thorsten, Thanks !

On 10/13/2026 1:04 PM, Thorsten Leemhuis wrote:
> On 10/9/26 21:01, Sasha Levin wrote:
>>> On 9/30/2026 3:01 PM, Daniel J Blueman wrote:
>>>> I would revert the original patch if there is hardware that uses the
>>>> I2C 1MHz fast-mode, since the current timings aren't to spec, but also
>>>> weren't before.
>>
>> For stable: cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
>> SE_GENI_CLK_SEL") has already shipped in 7.2.9, 6.18.55 and 6.12.112, and is
>> queued for 6.6, 6.1, 5.15 and 5.10.
>>
>> The 32 MHz clock map (506bb2ab0075, v6.13+) does not exist in 6.12.y and older.
>> The backports there pick only the 19.2 MHz entry, so the Yoga Slim 7x /
>> X1E80100 timing regression cannot occur on 6.12.y or older, and I'm keeping the
>> 6.6 and older queues as they are.
>>
>> 7.2.y and 6.18.y do have the 32 MHz table and are affected. Once the fix lands
>> in mainline, I'll pick it up for 7.2 and 6.18.
> 
> @Andi, @viken, and/or @Daniel:
> 
> Is the patch at the start of the thread or some improved version heading
> to mainline meanwhile? What Sasha wrote above is one reason why that
> would be good rather sooner than latter; another is a regression
> report[1] from Birk (now CCed) wo ran into the problem with mainline --
> so it would be good to fix this before 7.3 is released, too.
> 
> Or is a revert the better option to achieve that?
> 

This is in active discussion with hardware experts, but taking time to 
get specs compliant configuration values while it's being tested.

I see 7.3 release on 25th, so what max time we can have before reverting ?

I am trying to get values asap.

> Ciao, Thorsten
> 
> [1]
> https://lore.kernel.org/stable/179173732257.29426.7905170638383807320@pm.me/

