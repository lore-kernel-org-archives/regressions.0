Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5AF53B5EC
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986427; cv=none; b=YQ9kIWXaFzc5SeGtQp/xbLK1LiUd4KW49+5GwjEYNT14+z/F+0I36tM+WdqqWF0jF9nTAo6hHo60/W5YmmjaU2SySO1/iuQ54sL+Wy3LTgfuPwsTrIZIz/8Acm0pb5Go7SPG5e/P9ItZYvYSJ9PAbpDUjew5yftGmNrcWJZgBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986427; c=relaxed/simple;
	bh=Pxet30TRJQtNsCxEqkZUTERC6HZaIwRxrkW5u9k6X6A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nq87oXIXO6XFxDyGdRxfhqpIKP42ZJEAs4Vc3EVhyeFDPIq5QZLgTJQKItUmdhIj+ogtVB4Z5u2C6XoKLetiRD6i/R5TxHCeP/pIgl2j1HUBP5UF1Eg4PbBQeQoI4utlpo3WAtnKA+PySKd2G4QUI5BbD3bBtxZ1ijuFlSWk6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TM88gY/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PC530EwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TM88gY/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PC530EwQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBX6Ra3951486
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 14:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M45fNMyP5YyLBZ5igr+FxKq6/r20bqTD6HB21/sx/vg=; b=TM88gY/SAkuivGf5
	+yFWFP4405hUK4+veo6xqA8dkTVtPOBN96tlIMpYl66yC4OPDWEYnoW3ostFzXvP
	/QxUnuWc0oekyclc2OdhCRsz5NQpn2pHquNClmYxC8hHJI53iRycdoczS1lXAgZI
	8cRopjdlyX11Dhc+gxJTAmnlJTHA6Cp3dhZGg3sFugbI8Bejo2l7JRCnRlhG7hqS
	9RwcaRNDYCak+N0+yJF/bsoqIDwaXOAOkS1j44CS8KXp7UpUAFQdwmw5tRig80oR
	UJTomABLqeBTPY0zH4J+6r43Lbga/EYLgEjqPjknpgEBuU59+4pW3FR+37AKi2Bi
	l2Re3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1wx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 14:00:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9195c59ac8cso131579276d6.0
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986417; x=1792591217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M45fNMyP5YyLBZ5igr+FxKq6/r20bqTD6HB21/sx/vg=;
        b=PC530EwQ+uVrsnErelZVhZZlXcnqDoS+m1t3Yn0Doa8gN02/U0CGs5oDxbDtHcFujS
         A8ubQgloTtIicr7YwIcPPSq/eU4aocUTdMCbtnR81LxoyF1t7IbBDjPxEkCusqJt9fG0
         yIse6pJ80Vdh5J0+oFPBv3hZK5wAxn++5RLENcTjtqt5jCziqE3+TYSkCigblv2X73Fw
         h+wXcnXAlNLdUCVS0J9aAxyTwgyDohzf6XDstXFjfZp/laSgkzRpv3WspoK60Ie8FLDk
         et4Js7BOuYCn7VYF7okLzReNOHVnOjDSFqoIo4bONqcmVUTrsLhXXfyzaI30lMb7mjWh
         3ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986417; x=1792591217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M45fNMyP5YyLBZ5igr+FxKq6/r20bqTD6HB21/sx/vg=;
        b=cG6GhYZhb/Rma2mZx60UUPH1ZubA95x/kITNf4wRgSOX+IUQ2F+ZKdxtNpWOHzv5TR
         SoWm7yqrDgSaETNcFAs48INJc79MdaJtzyIjlHeOl2DPwW4ceW2dOezA7xrtrJtK1fQD
         hTPtdIbrePH/7xwDoUnMb1XTLZzx+o6j99zd2y9DbIOhGNWzhc6R+4K6vMZhuES80RVp
         JMuu1udWVGGSkETKT1GGDip1dqZCmpXgVZVXvoqwWuxWX4eW9/2NB43jKaPuIXFIYUGo
         9zksksU0y2zPtN7BwZ6pCH9yEqRFA/fDt/NHh0H9tATdFvbnlEiVReImSAqfdPXiPajb
         rOAg==
X-Forwarded-Encrypted: i=1; AKwUvBz39daYxdQgcgjA1niJUllH/+DVgTQGMoRDPkYQ2CWyzPtkLJ9yJTsztbcYYy89t/Td/VxBJob5z6oK2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJXkN2aIh2R2tl+/kwjtI2rZ76+Zl4quCVzTqGcmSJgtcQDNZ8q
	oMSm+mdh0+33L1wDSIvEXpzL1ffyYWk8dR6XVcoe2zz/MSYV421JHVY2OuqhSwwwLv/JjhTAgnZ
	KrTWm9pWanfvMkHxZ2p9q/WfiAcxAwncSJfjVlzw+dflgJP+BF0F2mqZzGDpqeq8Q/g==
X-Gm-Gg: AYBFou2RWBNq+5xhdaOWoPsJTui//dZG9T9tKsJWWo38+YhA9nwrLYUpHAC1GUaN7lQ
	/cE3G06uD/8U/UNhaQmUbtDOkm7OIyaGNX7VOE9hSEQN2p48xvwPpAPq2OYZvN/ZC6YwFHWziaa
	QGop34n7Bp1uY8PLLK7EE1Ge1ikYw9/HdRemx1bD/LRkC5YGo9VEO2GXbMvhReHhhK9wYS6ijK6
	C6EaTk1lRFNJMNImcjCbZXRyHl1DlXvrTWj8CrHQBVkSViqWOwokLV20GYbQlCkm5gU3aGOUuAb
	WbP76ApQk5ufjzcnv2cOni1PbA6GoSzrWUg/2OyL34AydKAe0PTpc8Z8hNX82FswKjrd9uBC3mu
	gpMnL+H+zYTy2Yo0uWxfwhsOPxRepus4tHjafdrzsv0tFMqxWn0VTBuWgw7u2SGFat3xsBJ1OrO
	XznqLYeZHVMW/a39dkfyv0mkYd+1CQF8ANFhOad3MBVHzBFMUjJcOgMJ40Nbd+JKOkIA==
X-Received: by 2002:a05:620a:460d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93ebd224c25mr2846062085a.26.1791986417267;
        Wed, 14 Oct 2026 07:00:17 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93ebd224c25mr2846046985a.26.1791986416149;
        Wed, 14 Oct 2026 07:00:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3b3836547bsm73203366b.13.2026.10.14.07.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:00:15 -0700 (PDT)
Message-ID: <a8d28d1a-5bc4-49a2-8437-18d1ae9d4f51@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:00:14 +0200
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
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Armin Wolf <W_Armin@gmx.de>, Charis Stratakis <c.stratakis@proton.me>,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        regressions@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org>
 <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
 <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
 <044e9df4-1399-4ceb-80f8-f7cfe031d04f@oss.qualcomm.com>
 <CAJZ5v0isCM3K3U6HSdDnvXzBX41AgQMFYxqLx3KvMA0W_91-ew@mail.gmail.com>
 <20261013210609.8117-1-aliamemis@disroot.org>
 <ab5c5ae1-1bfd-4fe4-adef-fb64b5b3dfbb@oss.qualcomm.com>
 <20261014133218.94357-1-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261014133218.94357-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfX0rTEFbybb9WB
 uUXwhcltpbBetncj6n3Y1+54ypMGqj2AJPsXdcSYLJxHiTkyRvoECW9SrommP13EEFOA9dTYO4B
 7Pkn8f1gTF/1AnKQZiqwpP9jwwtQDrw=
X-Proofpoint-ORIG-GUID: wiRC1gZYku6_fSIEy9oIlCeNQCuxabae
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf8af2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=uisTf_hR4FytVPXRX4QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfX5fSx0QL08/MN
 gyeij9mxF+2i+nYON6iKyG2xfze3wWESS7wa2Gz28gmp9mHMHbffjBoR7KhaukzhS6eURulkJoh
 IuMmaqd3mLDSukDT4ROWa40gPo+eCu6DO1/9w6hjPvFSRPeaBh7+ocDLCo4MQBvsynLFGO2qreR
 xTDWE/2714ur7WtyedhMFflmuAiznRl/Xcir7ZFPeCogDFuTNFa5fTSzItEjJyNXK9SfzWsHAw8
 go10hvCfd021GKuPsZx+fODd0Xhgqno08vn0NyTuRIQtZhm918X/AjI7DgkcZSnJIvv618xWEOG
 HoXp7vE9XwJsFitiMbSYr2Qpf3TibLE6w/4p//Ad9X6m3rGiEgDLXkUyGbNsV1QC1jKwRv0cOHP
 Ki8o3QPm66oNus227711Eg1RyVyL5QCyydTbGPzdGQsnifjxJOwX0D2pPymtCObMPHiaQ+gPZu6
 f9C6nSssQHsbSvb3nJQ==
X-Proofpoint-GUID: wiRC1gZYku6_fSIEy9oIlCeNQCuxabae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140055

Hi,

On 14-Oct-26 15:32, Ali Ahmet Memiş wrote:
> On Wed, Oct 14, 2026 at 12:01:55PM +0200, johannes.goede@oss.qualcomm.com wrote:
>> Can you post a patch series for the code you've for this now ?
> 
> Posted: https://lore.kernel.org/all/20261014132703.93355-1-aliamemis@disroot.org/
> 
>> Note I guess you're using LLM to help you with this, that is fine,
>> but can you please manually shorten the commit messages of the patches
>> a bit if they were written by LLM?
> 
> No LLM used here, I just thought the race needed some explanation.  

That is fair, sometimes it can be hard to find the balance between
including enough information and keeping things short and sweet.

> I kept the series short.

Much appreciated, thx.

Regards,

Hans



