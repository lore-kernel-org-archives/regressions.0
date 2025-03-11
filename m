Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739C41C72
	for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717547; cv=fail; b=CAawUfYvLSYpUuxKfNyKBWEGyAwHh0hjWrHe30d80EUC3lQlGwDOGcFpU2xoRe8VOTHqV0jy3Sa6bB3G8gHI41iFQZECEOvj34xgdhYDB8u5AYoLX8wEOxnautw1SppqqIiDWkGZRHarJltNWl07xnYHcfnZifdzOAAHBWIuOsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717547; c=relaxed/simple;
	bh=Bdo3yspjyp0exSh9OZzyVJJYBWECEAwZ+dHnAXcTRew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mV0FAALI1hKKYlsvtDSyE5hdyPICInvMqIY/L7a277ju+XmyI5NiDPKxXLo2kFJXYOdvogooqbytae3R9NNftYDRdcsN9DXdGXioesTJ/lyymH72RV5Rs2k5UMi56sI6pzbLt2VfNSKcHjxk3Z9Vvx0EyoQDhEiXukpz7TdyYt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lT8H3M2a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CsBpOWeB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lT8H3M2a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CsBpOWeB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BGQlWn012984;
	Tue, 11 Mar 2025 18:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Bdo3yspjyp0exSh9OZzyVJJYBWECEAwZ+dHnAXcTRew=; b=
	lT8H3M2ajhnYmten1JRJr18M03yHrnhPKUGmPSNmVdcud6w29/gmOITPb8bcAH+m
	gLa570kyaGz5077+fvh0tIOUgaKrZu+SYsbKvh7fAuePJV24l6dOyUSNZc6P8A2F
	pycJyLhJ/Is0nG5q+avxtFTFNe3EiX46rRWbLeDWfI5q2qka+G+7R/QkfV/oR8rh
	YkwctQ+hRaA2/LpAEHOskUtvxdrXmPdU6Rg2COuVFjKEBFwENFg++n+1poPhzyV3
	tEyl3muznC1A+4aMDJdDsd8Sxxhegtn1lEBZTDnd9yvqWQ7ap776PMtiptV3daVS
	J2xLTboAwBbyxlwBTdBRgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458cp35jjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 18:25:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52BHCPcs021840;
	Tue, 11 Mar 2025 18:25:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 458wmpwysb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 18:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNy5OAc1hB0bV1ZodtBgsncTNPRbfE/Aosn2Kd8y6gjdiH2AI5vy1V6PlO8k6SQkR6VYOg4XJqi1zv94eW8+Vv5SCAAh+ViiAfcbP0zAi/qguQIc6iPqWYfJU5/uEvyxTydXJ5J2Kr7l6R046mEEyIPvaElhRbnfl2cGaywlrqOyHMnitP5LBON7g7M9iYoD/n+WMJ1GdzEkbsSS1R+grLjpCgPxdMagCYM785ARLUT2zBqeZxef4kIHr+9A9qYA1zgGc4DgxMCViCEHV2Oh13j2koPaIZNlyyw4pj9pE9s4WmyKIqhdU9u6xnV/MmGe32Hbn9h+ppWj1KxHcA2yMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdo3yspjyp0exSh9OZzyVJJYBWECEAwZ+dHnAXcTRew=;
 b=WvI8tEeTOOFRw/N576p9mu99AXs6gPlJchrF3U3YLuVkENiI6wSX4MUco8u1PVi5gW4/ULtOQ792R2Y9ouSMsB8tYhux3IXiJADIBKY8bvt3+KtCH9nfEgnXc6nGVc1S8haQPGr1DYwVpFcF9kM6bKMQj1EhwelPyMQ7XIBosWxqeoP6zqujhK5zrkD9fjn0JF7y3gF9MX3WXg9BopCr8txUjfeYe6nYgfikOQrV+oa7zN/fRYxJ4n8XL47BqK4k84Uc4gQCzFaNKBZN0kYmL70A15zDJ5mhdiSlC5MeJUpEVih9+94IGFSOFAgSqvHC0ocnWsvkc9LMnl1ubgCRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdo3yspjyp0exSh9OZzyVJJYBWECEAwZ+dHnAXcTRew=;
 b=CsBpOWeBS6j25yfHvKOm9s2NGja5VRvOjk12Vezr5S9oV3XlgL9x2Fw28wOWllLB7RHeecrMmPEYh7dAmmDgJRdILMZnkpiFrqc/mmCrJlxp42ZuaQgFCcaZQqdNVbcf1AFwBsrre2k7hc3fgY6g9AZoZJ9joezkF4dmNumeT5I=
Received: from CY8PR10MB6708.namprd10.prod.outlook.com (2603:10b6:930:94::7)
 by PH0PR10MB6434.namprd10.prod.outlook.com (2603:10b6:510:21c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 18:25:33 +0000
Received: from CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::3cb6:cdfe:1028:4199]) by CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::3cb6:cdfe:1028:4199%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 18:25:33 +0000
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: Akihiro Suda <suda.kyoto@gmail.com>
CC: Linux Regressions <regressions@lists.linux.dev>,
        Linux x86
	<x86@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
Thread-Topic: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
Thread-Index: AQHbkpLuFgFttZI0r0G9buBCDVL0lrNuQMAA
Date: Tue, 11 Mar 2025 18:25:33 +0000
Message-ID: <CC16418A-C02F-4ED0-B3E7-9BA9A5157C02@oracle.com>
References:
 <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
In-Reply-To:
 <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6708:EE_|PH0PR10MB6434:EE_
x-ms-office365-filtering-correlation-id: 35cbbf98-b862-4bbc-5c99-08dd60ca1c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emozbTZkYmdQQWpnd3R3UDdMN0VocHVSNi82Sm4wSFgyRUMyWEJUUkZ2WlBj?=
 =?utf-8?B?RFQ5WnU2ZjJSektTMUZkWnlDelY1REF3YlhaUDMvMW5ab24xZG5yeWlIbDRH?=
 =?utf-8?B?TXlpR3pWRDk2M09kSmNLV1NzWkZ0MWZlY2FhQW14c2tjOUNzWTVOZ3RqeVZH?=
 =?utf-8?B?UW8vZ2wrOG5Zdi84Z1FZTUpTdGJtcmNONTRabHZqZXp6R0ZZOG5yOG4yZVVZ?=
 =?utf-8?B?U29xRzdlOHM3eUlVcXhnZ1I5ZE9RU081RWQzZW5LM29KTldjdVhHdlZQZnhI?=
 =?utf-8?B?VHBvVTBwbHlOOEx4N0dCamVKcFUxcXpCRWZEazZSQjR1bFl3ckRjNjVsbURC?=
 =?utf-8?B?NUJKVXFFVitmYWd6bGswSlVlZ3h3ajdkSXo5dkRyWDBwNlZrTUtodDhIWnJx?=
 =?utf-8?B?emZlYWl0Z09rcXhtOUgyOHBVNE5Xa3NycGhRYTJIS01jRnA0RUxkTmpqcUVv?=
 =?utf-8?B?RisxSFRRb3MzekFjaDRVRGhlczk1TjN5dmxVUGxYUEd6L1BxdGZVRzlPcktH?=
 =?utf-8?B?YmlFYWhVV1piVFJ1SWdhWjRNenFFSWt3RWlmanZFY1JicXB0RnJjMDY1Ym9n?=
 =?utf-8?B?Yi9BQVpFVHVtdzBheHJmLzRRNWVObjUvRUw0cDRkanQ0V2oza2NhbkRXY2NJ?=
 =?utf-8?B?QmprVC9VdVNlaExQMUJjeGZmdmNOQTRHT0VrbVBoOC9taG4rbGFxcGlNQ2tE?=
 =?utf-8?B?U0FZMWhxWjdhaitGMERVbmYzTUY4Y2hrZ2JqRzdRcGxjZkxENnlHc0JoalBX?=
 =?utf-8?B?cXVENVhxaGZ5Zjh2MTNYb1V4MVNqZXVJekZWUkhhYUR1dE1kNWpvN3lPNXIv?=
 =?utf-8?B?RFZkWlJKdjZxaTZLZHV1b0RUblJBZTZwZ0lRUmIwWmFhZkVXeFhQcEtyNlYw?=
 =?utf-8?B?VVpXWkFkOXZONHRaZW9rVVNaVy9mMDVQQ1NoSVVUVllORk1BRDRsclc3SGNr?=
 =?utf-8?B?Y1o2NEpjcGRiSzNyRU9CSXJYbzE1eFpqVkdXNmpYM2UyZnVhMXBKWVNhQTZT?=
 =?utf-8?B?SUQxeklycnNpZkRWWWlaZnZacTBmaGpUTCtmemVsQUZpQ1UxSUtyNklzTzFT?=
 =?utf-8?B?NFc5cXRaSHlvY3Zyai9HNWhjWmVmYjRqZWxVdmJXMUR3TVhielZhRjZhbmJ4?=
 =?utf-8?B?Yi9EYUppcGhzTUNOWkVmQTloRlYveEp2QUs1aHoxOTBOckF6SHp1bG9Ha2hK?=
 =?utf-8?B?R0Y1Z1BWU1pJYk1xT3ZUZkRadDY3eG1aaUxtRmVRSXVrMHNmaDZLSFFUNTVr?=
 =?utf-8?B?MUFmbXVNZTV3cXYvTXcraG9YTE8wcVcvNVNBVXNmSGcwYWlMR2pDOUpIYjNp?=
 =?utf-8?B?cDN5Sm1oQVhNeTFRQk9RMGxlUCtTSWNtV0syalc4Y09BU0hvUjFIV0piNnht?=
 =?utf-8?B?V3FFalZFVGR3ei9KTXg2U1B1RGI4SVpKYjJmVnovV0hWVlZpODV3VkV4UUQx?=
 =?utf-8?B?T0VmZldHNTRZaG9nY2dsdkZlYWNKTFJlTHZXaENhT2puSk5yRzRlR0wvRjBp?=
 =?utf-8?B?UExnZ1pWUFRldzZwbzNlOWo4L1JLMmFYbnJjaTNqTjdkYmM1UU9tNmFVbGEz?=
 =?utf-8?B?VmMxSTNPNzBEWEt2WktxVTR3UzluZ1FBS0h2MWtaZ0tpWUdsM2VqUGZJTFg0?=
 =?utf-8?B?QVFEUjBQS2FacDJNN3FNSHVKQWxjMUR3eUlMNHZLUGNkNUhncGE0ZjZkcDAy?=
 =?utf-8?B?cXRCWnBaNm8zYjN1S3RTcTRKYkd0TnRFajg2R0dHTnFCWE9sQzA5L0pJenhY?=
 =?utf-8?B?bWhmdnJNYXlwZXNSYkszYXlGQUFqQ3NiQkhrSXVNa3ZkdnVUd0MvZzNaUnMw?=
 =?utf-8?B?NFRDbG5TZ0R0aWhramJmb0o3em44RlJOd1Nrc0lXUnZDcW41Z2Y4ZDlGUlJp?=
 =?utf-8?B?Y2IrN3dxVm9jNWlKS1hoWnBqQXEzNnNOeHhtNHhlU2gzcGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6708.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTJzYjBHOEtlQy85OG50SDZwU1Uwc3NiTEh5NW9HQ2xtZTc4Zkd4N0w4NDh4?=
 =?utf-8?B?Nk1QcjhJNmZQTFN3bmNoQVUrTW82QjBGazIrTXBkRkh3c0pac25pT0hoOEY5?=
 =?utf-8?B?TXlCeXJwdERlMXV1dDhLMVBuQ2FXc3AvV1hYckx5UXUxejVLRmhyMVNGeVZI?=
 =?utf-8?B?Ykl5RFZSSmhpUVRGdElxQUJtdU5hVjUvV3FmaFdYVUtUZ2JPK0x2N2dsa2VS?=
 =?utf-8?B?Q3RsNnhHMlhKZ0t5b0lNQWlBOWxHdXlSMDV0R2lVemRPa2w0UU5vMDlqK3h2?=
 =?utf-8?B?TnpoNFNmTVRJZi9wU0duSkJLSEszbTFRZ080Q1Z5VmI5SFhvNE1NQ25qcnYw?=
 =?utf-8?B?aFNFajkxSlF1UURCZHlQMUdYQlFhdzh5WnorUEdUakF3U0k1T2x3Y3lhdjg0?=
 =?utf-8?B?VVdUeXk1eGNNRjRLdVpZMlVoRVVkT215dEhsTTBtclJRRFI3a1R3V0pVYmow?=
 =?utf-8?B?SmM5N1o0eXlWalEwd2ltc1E0N3VOQkpieXlmbXEyN1lKSklaenVEdWQydkJL?=
 =?utf-8?B?RjYxTHg5dEszZUgrU3JUWGxFMmhiYS9YeS9Oc0hxUUd3STFmZDBjRzBGTHha?=
 =?utf-8?B?ZDd4YlFORHFzMnVVTzVOb0w3U0Q2bHhkVytJMncrSlR0OUltR21iZ1g2M2N2?=
 =?utf-8?B?RUxTYlRCbGxJdVlVNnNpZnk5eXRTZmlycEtwYkF2TVJmNllEbmhnRGdvUkxX?=
 =?utf-8?B?RkN4ZTFuamgrSXIyZVRES2d3U3VlUGNnM1NacGFjdUkwUk9nTjM4aENOVXNU?=
 =?utf-8?B?SHMyOVp6UHUxNlJONHZNRkwzKzZtRitzUjR1aS9DK29FVkJnblRmaHM0VUZp?=
 =?utf-8?B?b1RGVVdNcy9qdnRsdGNYZW9ScnhmTW1WNDFVNi9MMVJYelRIV2RKYnlzc2R0?=
 =?utf-8?B?aWw5LzhkRUFiZzVYQ29hMFFSbWU0VFBXSmdZRVkwVGpFNjByYUNOT3ZjZk1v?=
 =?utf-8?B?WHJ4aVFYeU5LdFBYUXgvNFl4YzlnWlVWTmxsUGI0aWQ1WDE2YzRCSHJHWEVm?=
 =?utf-8?B?WFdnTEs3YXdBaTBnV2w2UEkwRnRSNzVZMng1NjZlWDBieStobXdpamdrNm5k?=
 =?utf-8?B?c0tZRmxCT2FvbktTTHNjbENHdzhuekU0TzM4OXhjTTlpUWFBWk1WTjU4MFk1?=
 =?utf-8?B?TWVlazlxZ0VvZTh0VVdDeDBUdE5xaWlqMk4vWFhhN3owZVJXQWdsOEo3YmtC?=
 =?utf-8?B?QkwwcVVtUkw5RXV0ZmlTMnV0T0NOOGJ1QU4zd2FveEJLY2wxREhmT0VqckU0?=
 =?utf-8?B?OGxJK0ZKeTZ0cDJaYWtrV3JseUEzTmlFbTcyMkxnQmVScEpvOTBlMU5SNk02?=
 =?utf-8?B?UzRIMUVRZ29FWFd3ZGJpazByWTRzWUVvdG82ekgyMTJ6SWtqSHVySm9sMGZD?=
 =?utf-8?B?RmZtekMxVzlQZW91WW9XR1g1T0NuL1VQSTlBbWJzVk1zSDFmeXRGYWhEQXU0?=
 =?utf-8?B?QkZib0lhY3UwZFFDbWRnRzF3Q3pvNDAyazhHWVhFL3FwcEttbVd2Q3FmL3gz?=
 =?utf-8?B?cWx4UGdIcVArejI4RkFsUG92Q1lhUUhveW9FTlQ0cHJvUTU2a2dtVTZVSzVO?=
 =?utf-8?B?eExycERyQjVSU1JHUlJ2bVhOTkxvdk5JQVBqd09URHR4L1dZY2d2VHdBZVhU?=
 =?utf-8?B?VjUxRmU3eFVjd3RvNXljNmFxZzV0aUZpUUpMZHRnZEVFR0k2SERLNW9BTDZo?=
 =?utf-8?B?SVg1ZUxiU1lnaWl2eTZ6QnlLc0J3ZnF6WDd2eHhxSWJrQkNzOW1oK0F1UEdo?=
 =?utf-8?B?S1Z0dW9ZdCtrWnQ4ZW1WSzhublF5M0V2MGdsTHBWVnJ0M0lhSDk2bzd2RllN?=
 =?utf-8?B?TFhRbHRYVXFhMzlGdHB1YUpUb3c2bEhvdmpRSytLUjRSVHMyMlU0Q0xmODBL?=
 =?utf-8?B?c3U0QVRCVEdvckNodllVRlFqdk1HVkthUkxQWFBhYkdCbVBXVzhBZjZIU2tZ?=
 =?utf-8?B?Z0ZNVWdhcjN1LzJTRUVBcCtCblhaVWczOVlPN2MxTFlTd3E2R2c1K0prNkxX?=
 =?utf-8?B?N3hBZ0ZCdjlnZVhCWmErTXI0RksyVTA5ZHBiZlBhR1RLaUVJZnh2Tk9lS0Nl?=
 =?utf-8?B?MXpIU1ExNHVuWlJWTkdDb3RGQ0ZWOC9LRGlvc0NVMTExdFMrY0JjVUkrU1JH?=
 =?utf-8?B?bDhFVGNrVXhOWUh3WEN6bzRRempNeWpGVEtHRWphUzFsTmdyN3FoYk9kZFlL?=
 =?utf-8?Q?hNc/RF3ajEuECk2/MDKqUx4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47C517B2448CCA47A5CE8CC1F6F63DA3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RN8VLzEjCD06+bbZcTC/0KBip4PxiuMK63TTPw59RiQglkT/tAFYxfECgcLQfFmLtLyMufNTrbamEpHdq9TTxqLpOzKtSYU47aTz+/oLxmurPiohKfrAGCPttFrWl337xx6PG06hhpWaL9wSMMCjxPxPXd7Wh2B1AYYtWcpU9IVBmyF2UK0KGLWwuLpOiTdqRN2wr1CBma4Mmc5affr6wBnv439w3A1pJEdZhpQHuwxAG6KQ1n+9E0cuj3LvnfKNT6HO//Fzv5CJ5H++9tT3+FYK/SsZzfGuUe8Qt1uK1QBtRnNY5Y+tUo4xcU8lqQR/eEpYiXw2ggRwqmp+AI2AYsNPMEb8eXmts9xVKKwZiPkY/NAuih3kdymClC3KPESn/pgzR9DRgzS3jFp2f4TvvCjTpa32R80yYa9A2qTln4k9gzPyMlbd4uTgM6G/eD/SucuEb8vDH0y5ONOAwPLFweP5pjK0pdkB8lSXpyX4LlSX6dBQMZEG7oag5hp2JTbwNhWx1dNCFpV9OmIv+duU/2wPyTx9CQ3HPVVsPtlutHiXBhSRWsfFfxeRsnaqZBK/taHgNbrEU4bYmz4PufBv1E75TukEca9Ptps1PUSTmno=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6708.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cbbf98-b862-4bbc-5c99-08dd60ca1c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 18:25:33.6008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOTVc+iTC3OeAKG+/LE4fMtA6PIHCnWQOM0bUUaB1vAYX/0+Ak/qu3W2sSwkp5RgORz9l5dv2u9bZx19XI8aNxnuol+Im1cWFw7ZaZTLU1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6434
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503110118
X-Proofpoint-GUID: uBJ5FlHVOzTu-q_j-Obubo1BXoQZKJLU
X-Proofpoint-ORIG-GUID: uBJ5FlHVOzTu-q_j-Obubo1BXoQZKJLU

SGkgQWtpaGlybywNCg0KPiBPbiBNYXIgMTEsIDIwMjUsIGF0IDc6MzXigK9BTSwgQWtpaGlybyBT
dWRhIDxzdWRhLmt5b3RvQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIHRoZSBrZXJuZWwg
aXMgY29tcGlsZWQgd2l0aCBDT05GSUdfWDg2X0lOVEVMX01FTU9SWV9QUk9URUNUSU9OX0tFWVMs
DQo+IGl0IG5vIGxvbmdlciBib290cyBvbiBWaXJ0dWFsaXphdGlvbi5mcmFtZXdvcmsgWzFdIChB
cHBsZSdzIGVxdWl2YWxlbnQgb2YgUUVNVSkNCj4gb24gSW50ZWwgTWFjcywgc2luY2UgdGhlIGZv
bGxvd2luZyBjb21taXQ6DQo+IA0KPiAgICA3MDA0NGRmMjUwZDAgIHg4Ni9wa2V5czogVXBkYXRl
IFBLUlUgdG8gZW5hYmxlIGFsbCBwa2V5cyBiZWZvcmUgWFNBVkUNCj4gDQo+IFRlc3RlZCB3aXRo
IG1hY09TIDEzLjUuMSwgcnVubmluZyBvbiBNYWNCb29rIFBybyAyMDIwIHdpdGgNCj4gSW50ZWwo
UikgQ29yZShUTSkgaTctMTA2OE5HNyBDUFUgQCAyLjMwR0h6Lg0KPiANCj4gVGhlIGlzc3VlIGRv
ZXNuJ3Qgc2VlbSB0byBoYXBwZW4gd2l0aCBRRU1VICsgSHlwZXJ2aXNvci5mcmFtZXdvcmsgKEFw
cGxlJ3MgS1ZNKS4NCg0KRG8geW91IGhhdmUgQ09ORklHX1g4Nl9JTlRFTF9NRU1PUllfUFJPVEVD
VElPTl9LRVlTIGVuYWJsZWQgaW4gdGhpcyBpbnN0YW5jZQ0KdG9vLCB3aGVyZSB5b3UgZG9u4oCZ
dCBzZWUgdGhlIGlzc3VlPw0KDQpDb3VsZCBJIHNlZSBsc2NwdSBvdXRwdXQgKGp1c3QgdGhlIEZs
YWdzOiBzZWN0aW9uKSBvbiB0aGUgbWFjaGluZSB3aXRoIHRoZSBpc3N1ZT8gKGFmdGVyIGRpc2Fi
bGluZw0KQ09ORklHX1g4Nl9JTlRFTF9NRU1PUllfUFJPVEVDVElPTl9LRVlTIG9mIGNvdXJzZS4p
DQoNClRoYW5rcywNCkFydW5hDQoNCj4gDQo+IFRoaXMgaXNzdWUgd2FzIG9yaWdpbmFsbHkgcmVw
b3J0ZWQgYnkgQmxha2UgR2FybmVyIGluIExpbWEgWzJdJ3MgU2xhY2sgY2hhbm5lbC4NCj4gDQo+
IFsxXSBodHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi92aXJ0dWFsaXph
dGlvbi9ydW5uaW5nLWxpbnV4LWluLWEtdmlydHVhbC1tYWNoaW5lDQo+IFsyXSBodHRwczovL2xp
bWEtdm0uaW8vDQo+IA0KPiAtLS0NCj4gI3JlZ3pib3QgbGluazogaHR0cHM6Ly9naXRodWIuY29t
L2xpbWEtdm0vbGltYS9pc3N1ZXMvMzMzNA0KPiAjcmVnemJvdCBpbnRyb2R1Y2VkOiA3MDA0NGRm
MjUwZDAyMjU3MmUyNmNkMzAxYmRkZjc1ZWFjMWZlNTBlDQo+ICNyZWd6Ym90IHRpdGxlOiB4ODYv
cGtleXM6IFVwZGF0ZSBQS1JVIHRvIGVuYWJsZSBhbGwgcGtleXMgYmVmb3JlIFhTQVZFDQo+IC0t
LQ0KPiANCj4gQSBib290IGxvZyB3aXRoIHRoZSByZWdyZXNzaW9uIGNvbW1pdCwgd2l0aCBkZWZj
b25maWc6DQo+IA0KPiAkIExpbnV4VmlydHVhbE1hY2hpbmUgYnpJbWFnZS1nNzAwNDRkZjI1MGQw
IGluaXRyZA0KPiAoLi4uKQ0KPiBbICAgIDAuNDc3MDY0XSBSdW4gL2luaXQgYXMgaW5pdCBwcm9j
ZXNzDQo+IFsgICAgMC40Nzg1ODVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQ0KPiBbICAgIDAuNDc4NzQ3XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0DQo+IGFyY2gveDg2
L2tlcm5lbC9mcHUveHN0YXRlLmM6MTAwMyBnZXRfeHNhdmVfYWRkcl91c2VyKzB4MjgvMHg0MA0K
PiBbICAgIDAuNDc4ODkzXSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gWyAgICAwLjQ3ODk5OV0gQ1BV
OiAwIFVJRDogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZA0KPiA2LjExLjAtcmMxLTAw
MDA3LWc3MDA0NGRmMjUwZDAgIzE1DQo+IFsgICAgMC40NzkxNDhdIFJJUDogMDAxMDpnZXRfeHNh
dmVfYWRkcl91c2VyKzB4MjgvMHg0MA0KPiBbICAgIDAuNDc5NDU0XSBDb2RlOiA5MCA5MCA2NiAw
ZiAxZiAwMCA0OCA2MyBjZSBiYSAwMSAwMCAwMCAwMCA0OCBkMw0KPiBlMiA0OCAyMyAxNSAxMiAz
NiA3ZSAwMSA3NCAwZiA4YiAwNCA4ZCAwMCA1NSAyMiBhOCA0OCAwMSBmOCBjMyBjYyBjYw0KPiBj
YyBjYyA5MCA8MGY+IDBiIDkwIDMxIGMwIGMzIGNjIGNjIGNjIGNjIDY2IDY2IDJlIDBmIDFmIDg0
IDAwIDAwIDAwIDAwDQo+IDAwIDBmDQo+IFsgICAgMC40Nzk2OTldIFJTUDogMDAxODpmZmZmOTVh
ZjQwMDBmZDgwIEVGTEFHUzogMDAwMTAyNDYNCj4gWyAgICAwLjQ3OTk4M10gUkFYOiAwMDAwMDAw
MDAwMDAwMDAwIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDkNCj4g
WyAgICAwLjQ4MDEzN10gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAw
OSBSREk6IDAwMDA3ZmZlN2IxMGJmODANCj4gWyAgICAwLjQ4MDMwMV0gUkJQOiAwMDAwN2ZmZTdi
MTBiZjgwIFIwODogZmZmZjk1YWY0MDAwZmU5MCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAg
ICAwLjQ4MDQzMV0gUjEwOiAwMDAwMDAwMDAwMDAwMDAxIFIxMTogMDAwMDAwMDAwMDAwMDAxMCBS
MTI6IGZmZmY5MzAwODExOThjNDANCj4gWyAgICAwLjQ4MDgyMF0gUjEzOiAwMDAwN2ZmZTdiMTBi
ZjgwIFIxNDogZmZmZjkzMDA4MTE5OGMwMCBSMTU6IGZmZmY5MzAwODExOTgwMDANCj4gWyAgICAw
LjQ4MTExMl0gRlM6ICAwMDAwN2ZmMzEwNzEwNzQwKDAwMDApIEdTOmZmZmY5MzAwZmRjMDAwMDAo
MDAwMCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgIDAuNDgxMjYxXSBDUzogIDAw
MTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IFsgICAgMC40ODE0
MTVdIENSMjogMDAwMDdmZmU3YjEwYmY4MCBDUjM6IDAwMDAwMDAwMDExZjAwMDQgQ1I0OiAwMDAw
MDAwMDAwNzcwZWYwDQo+IFsgICAgMC40ODE1NTJdIFBLUlU6IDU1NTU1NTU0DQo+IFsgICAgMC40
ODE2NjBdIENhbGwgVHJhY2U6DQo+IFsgICAgMC40ODE3MjZdICA8VEFTSz4NCj4gWyAgICAwLjQ4
MTc5OF0gID8gZ2V0X3hzYXZlX2FkZHJfdXNlcisweDI4LzB4NDANCj4gWyAgICAwLjQ4MTkyM10g
ID8gX193YXJuLmNvbGQrMHg4ZS8weGVhDQo+IFsgICAgMC40ODIxMjJdICA/IGdldF94c2F2ZV9h
ZGRyX3VzZXIrMHgyOC8weDQwDQo+IFsgICAgMC40ODIyMTJdICA/IHJlcG9ydF9idWcrMHhmZi8w
eDE0MA0KPiBbICAgIDAuNDgyMzE2XSAgPyBoYW5kbGVfYnVnKzB4M2IvMHg3MA0KPiBbICAgIDAu
NDgyNDA4XSAgPyBleGNfaW52YWxpZF9vcCsweDE3LzB4NzANCj4gWyAgICAwLjQ4MjU0MF0gID8g
YXNtX2V4Y19pbnZhbGlkX29wKzB4MWEvMHgyMA0KPiBbICAgIDAuNDgyNjA5XSAgPyBnZXRfeHNh
dmVfYWRkcl91c2VyKzB4MjgvMHg0MA0KPiBbICAgIDAuNDgyNzMyXSAgY29weV9mcHN0YXRlX3Rv
X3NpZ2ZyYW1lKzB4MWJlLzB4MzgwDQo+IFsgICAgMC40ODI4MDFdICA/IF9fcHV0X3VzZXJfOCsw
eDExLzB4MjANCj4gWyAgICAwLjQ4Mjg2OV0gIGdldF9zaWdmcmFtZSsweGYxLzB4MjgwDQo+IFsg
ICAgMC40ODI5NTddICB4NjRfc2V0dXBfcnRfZnJhbWUrMHg2Ny8weDJjMA0KPiBbICAgIDAuNDgz
MDU3XSAgYXJjaF9kb19zaWduYWxfb3JfcmVzdGFydCsweDFiMy8weDI0MA0KPiBbICAgIDAuNDgz
MTQwXSAgc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZSsweGIwLzB4MTMwDQo+IFsgICAgMC40ODMy
MTVdICBkb19zeXNjYWxsXzY0KzB4YWIvMHgxYTANCj4gWyAgICAwLjQ4MzI3MF0gIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YNCj4gWyAgICAwLjQ4MzM0M10gUklQOiAw
MDMzOjB4N2ZmMzEwN2IyMDQ2DQo+IFsgICAgMC40ODM0MDVdIENvZGU6IDAwIDAwIDQ4IDhiIDE1
IGIzIDFkIDE3IDAwIDY0IDg5IDAyIDQ4IGM3IGMyIGZmDQo+IGZmIGZmIGZmIDQ4IDhiIDVkIGY4
IGM5IDQ4IDg5IGQwIGMzIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDQ4IDhiIDQ1DQo+IDEwIDBm
IDA1IDw0OD4gNjMgZDAgM2QgMDAgZjAgZmYgZmYgNzcgMTAgNDggOGIgNWQgZjggNDggODkgZDAg
YzkgYzMgMGYNCj4gMWYgODANCj4gWyAgICAwLjQ4MzY2Nl0gUlNQOiAwMDJiOjAwMDA3ZmZlN2Ix
MGNhYjAgRUZMQUdTOiAwMDAwMDIwMiBPUklHX1JBWDoNCj4gMDAwMDAwMDAwMDAwMDAzZA0KPiBb
ICAgIDAuNDgzNzc0XSBSQVg6IDAwMDAwMDAwMDAwMDAwMzUgUkJYOiAwMDAwN2ZmMzEwNzEwNzQw
IFJDWDogMDAwMDdmZjMxMDdiMjA0Ng0KPiBbICAgIDAuNDgzODc2XSBSRFg6IDAwMDAwMDAwMDAw
MDAwMDAgUlNJOiAwMDAwN2ZmZTdiMTBjYjBjIFJESTogZmZmZmZmZmZmZmZmZmZmZg0KPiBbICAg
IDAuNDgzOTc2XSBSQlA6IDAwMDA3ZmZlN2IxMGNhYzAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIw
OTogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgIDAuNDg0MDc4XSBSMTA6IDAwMDAwMDAwMDAwMDAw
MDAgUjExOiAwMDAwMDAwMDAwMDAwMjAyIFIxMjogMDAwMDdmZmU3YjEwY2IxMA0KPiBbICAgIDAu
NDg0MTc4XSBSMTM6IDAwMDA1NTYxZjlhZjEyYTAgUjE0OiAwMDAwNTU2MWY5YWYyNjAwIFIxNTog
MDAwMDAwMDAwMDAwMDAwMQ0KPiBbICAgIDAuNDg0MjgwXSAgPC9UQVNLPg0KPiBbICAgIDAuNDg0
MzE4XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IChrZXJuZWwg
aGFuZ3MgaGVyZSkNCg0K
