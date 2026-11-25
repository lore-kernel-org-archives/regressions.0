Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795591790;
	b=NnAStrijZJODY8r/s22iPfpZk+pIxwYZjyHIwQdkFkfanRGzYdTcO9lLHQxjuWT3+VGR
	 e2wGIvmarZ2uNS4/hTfYpD8pY1eh39J4Bf2lV3w+wd0y5NmnRFvBDMoA4yArjXwdpyHoC
	 qn3OQTz8GvrUAlCq9i0P4RFL5HlDKDAMUyU2Q3XyXfZ6sUp+22VFSoJXuwOE26Tit96h3
	 7H0p5rwy5+BaAt7uVLkdrmlw1D021Zguv8f+T0FPBmy570EbjBPmcfzyItwOQPEhAqxVn
	 MzBjwT4JT+/k8pmp5m+Tm/PbTCJBTuCEhgMmtwah3mpOE7Q16FN3Sd2/8YyK+hHj6Qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591790;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:References:Content-Language:Cc:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UJrdepwTh8OEpNHr+yCZuIYtbbBoKKauFEWOvyWn1v0=;
	b=XsVkZc5lxJLYVf6KPSpgJ4tpJOx1dY5pK+0V2VHsPlfOnqde0c9P8K0SjOPgPD68g0Mj
	 yoMNRan4JHUncCuGRFWspI7a7rNp4/+8Xdi8H5V+ylFn3MSJf2ftng0A4y9ujb+k5sdY7
	 utM3oop4lJHbncnUTUClMSnym5ptjjIW4XBUPi46UmO1SoDaI9GulVxs21cBHXWSOjJ/f
	 69j0igIg0bEXMFBBN6K3BYYO4RJdHOqQkHXPdtEJ7KP7wrOFE7tw68LaYrtYAQZRwJ1zD
	 r5t5wYCX7s/zRUcPHmMzR2seIuH3Rc10Y0aVNLpqW4Dudhzn44NFTSFnb9B77IHlpBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.kr;
	spf=pass smtp.mailfrom=outlook.kr;
	dkim=pass header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=oNbpHRuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.35
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011035.outbound.protection.outlook.com [52.103.43.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC3606A32C
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 07:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DC3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=oNbpHRuO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsYqKOxf3re5+LuaKBGmUrLQ0o9G0gKsfC0FqboouveKebvW1X1SRezp6VtT1k0A2qXTs/fz/eediwt1JMIvhpWMyGwYgOWcAFLrripcRozVNiL5tFvdEZ9nXMfYgOn5fixAiUOoTk7Jd3sANqwLVnPoKXD2K6aacctvO+JfBT+INZjjmUyXs24XHA1LbbzEBhI25dVRbz+vG+YEpuI+lN77v3BvamyaavJkd5S0lCfDP4gL5x1r2MBcfU2bj4h2H14gbI1poWif2qHwv7IsDcdGi4Q4rsR2nujSCTg/tMf3EcMjJWovzPu/DUHhElFq8np3xDcBoG6cMZDaxixoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJrdepwTh8OEpNHr+yCZuIYtbbBoKKauFEWOvyWn1v0=;
 b=P9eC3x3RZ+mAnNGtsRygrIyZmudBnFNQkjIR9ejGgOi8EJ4o7eCYbhS6yVrLQ32AN/oAVEYiU1mTFNq1gLYBrY/hR+xw32/nukeYOec+oSouGS2gOVV5D1bWhFcuk5vfoTBuWLtlCp2I2lKyABi3Wmk6ALXppdTLYANeF8sTeMI5objQCbtbMY+IU4DfWx72MkUx6Skloc+93Y5J+qfz702ihdUHjD2gAvanTDg82XgT7NtzawSB9f0rben+GPBNsfSEP0r7r3yvUkUM75m8Ajv5hPdu6oTwqWUeqJuM7zaksSBzIAkyVcHJMqoOuyknLJJeMkBNJqfbAn3uVixvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.KR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJrdepwTh8OEpNHr+yCZuIYtbbBoKKauFEWOvyWn1v0=;
 b=oNbpHRuO5G3dA4Jw72EgejkihVqihnlPzQfEENHg4JFKkaSV91BDJT7NV834fKrmatqJHQ7H1La9ewUsKAyJpDMuU0apopaEHyOpGAZnDC3Bzors9prtOI7CcE+2HFfN5IYHo8xsvzbyVayfX7/ZQ22Wc69OP7WRNM320X2kSqyYvFxdUaHbevt5DzHhoJl7j1jxGQP2qT2WEtuh+K514PxUM7DR0+xa2t9ieF4y4lyL0K3IGqEnpKe9SdxQg814oq30KsXg/DS0wWZQUX+mXGzLUhYjWKW7TP26lBVkH1e1h9OEgmdQQVMo91KwLr21ZRaIwkkAhThwPuzExwigmA==
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13) by TYRPR01MB15632.jpnprd01.prod.outlook.com
 (2603:1096:405:285::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 07:29:43 +0000
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc]) by OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 07:29:43 +0000
Message-ID:
 <OS7PR01MB139145F4FF9A86B5BDD7B428696432@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Date: Wed, 25 Nov 2026 16:29:41 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
From: Eric Kim <seohyun.kim@outlook.kr>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Content-Language: en-US
Cc: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0132.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::11) To OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13)
X-Microsoft-Original-Message-ID:
 <efc06d8c-400d-4388-a2a9-2914ec93e037@outlook.kr>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13914:EE_|TYRPR01MB15632:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cfc076-e44a-415a-1279-08df4ac5df78
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|12121999013|41001999006|23021999003|6090799003|25031999004|5072599009|24021099003|51005399006|25010399006|19110799012|8060799015|3412199025|4302099013|440099028|1602099012|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ukh4elUyYnFubkRGaVNNWGM2aW1HYmNQbW80aXpQZFo0MGJNSjQ4b3A2emV4?=
 =?utf-8?B?cVBWdnVMUjRrNmJmZHFRYitBdTY4bGU1ZmcyUW5DQ1UwamYycXNTbU5pckdX?=
 =?utf-8?B?dmUvbTNTcVVVMWRVNXhlQ1lFR1FHbzZOMG96ZDdEZmVKM3kwSUtpSVdLTWE5?=
 =?utf-8?B?dk1ZK2UwMGk0bTc2TkM2QmlzbjdYWnYrME1QN296KzRqY2lXVVc1L3gvLy9O?=
 =?utf-8?B?MVkxdEVZK3pvK1VSb0h4YUxpMzQzNHVmR2xkSzEvdTU3K1BYalNMMTBpVFdx?=
 =?utf-8?B?d0hiRFJYSFFHT3MrRVpjVDRkMU84d2VURlFSenNsRkJxTDh1aWVmbFhxMGJI?=
 =?utf-8?B?NHVLeC9WZXpLNmpZZkVQYmp1Zm10MGo4SGF3WmxPclFmSEsyU0lISERrOVJV?=
 =?utf-8?B?Sk5rY3dra1hLa0NlYU5rSzJCdEowZ3BicEc4eENQM2xDZHpJdU9lTkNhZ0NW?=
 =?utf-8?B?UFpLRVdjcmxPRjVCUXZQOWhLay9CRktBaWNwN1ZHMC9oM2dYZVNKb0wxVzBG?=
 =?utf-8?B?dEFkWURqRy9OTmMzWkZrTHF5UEFSM1dyMnRvRFd2ZjdQZ09SZGk2RFdSU1lx?=
 =?utf-8?B?NmZHcGlGazN5MGs5UlloK2s0aHFYdHdLZTRHYUFWUmJEcCtsamNlQ2VaZnhP?=
 =?utf-8?B?RDE0OUN3TVJNN1BpalBjaytlWGU3Vm40Q2thUmF5OEd4REZwekwrNFlUZVJ2?=
 =?utf-8?B?c1pGT0FKMDlZRUlZTXhxQk5wTnF3Q1VPWWY0L2dhajB3OG1VNkpxY05QZHB3?=
 =?utf-8?B?K0dWb2ZKYlM4NkZ4VGVuMmtYYTU1Mkh1WTNpQkhibWlBVnEvZmZQeFZtZ2Ju?=
 =?utf-8?B?aThxK2VDZWhsS28zMWNLYVNMeG9RZ1FreVhBZWtSMERqZ0xtdDB0MVpZUDZE?=
 =?utf-8?B?bGpCdlhINVlaMFloR3BRWWpiczJkOTN2TUpvTWNvU1NHNHRNRFdIUVA3U3Ay?=
 =?utf-8?B?Q2xIL0hwVzBsRVlESjZnYUJyTDIyOGx6cUVWTE83blBYMG1OYWd2RGtxcHpy?=
 =?utf-8?B?ZjlQdkdIWlRGMVhMQm5Qa0FtRjAxUFlVUlpKRy9EWXNwNVNZZzZ1eDRSZ2Jw?=
 =?utf-8?B?MW1qV1JKZnVhU1g4RTFnTHVKYUNQVkNJU0NwaXRBdVhIWlo1TmErSWgvTzNx?=
 =?utf-8?B?bFZ2RXJDcXA2N3FyUkxncFNObmRyc1prRVVvRi9VZk9NNXVaS0ZLckxJbzhI?=
 =?utf-8?B?RkFHaXFrRGlZUDFQeTVKWUxhcENMcTRXSGxXdWplWTV4WWVmV0M0UXJvVmsr?=
 =?utf-8?B?QU5MeU14YWtDQkhVSmNTQlBBTmtQZmFrRVhyL24rYnE0THk0T2J5R296VGlK?=
 =?utf-8?B?YWllNnRGd00xS2R3WFVhcjJ6dXdycTZYcnRUTWoxSjVzM1J0YjVWOUdOZTdQ?=
 =?utf-8?B?TU02SGQzL0Q3dlpJU3Q4K2RnZllpVjMwUktPY2JKc1Bham5Va2ZuVWZpTy9Y?=
 =?utf-8?B?aGdWK2tkWWpscHFPOGozUFF6UXR2azVvVmdDR0VTR3lXbTdRK3pNQXVpVzBh?=
 =?utf-8?Q?RRHgAM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm8vK2phZlJoWFNDNG1PV0pYNGVVK3FxTVhaaDE1MDljaFlzaUpmSzg2RVFj?=
 =?utf-8?B?eTNvbHgxb3pnR29kcGhyZjE2TWN0OExCYWlVWjFCbzIwNExqRGxQQnNLNXo1?=
 =?utf-8?B?WGZpOWp2RWZiU08wWitlVE54a2M4aHA2Z0ZydDl2Tm51T1YvM01OanhsZWpQ?=
 =?utf-8?B?UUVuSXRYU05XOTN6dXJpUVhXK3A1S0xOWmdIRExUZldoZjFrSGxXdU0zZmtw?=
 =?utf-8?B?cXBKSENwL0JTUFA3SDJPdGRTOEVwenpaa1A1ZUEweG4vdDZUNHR6aytOYUJo?=
 =?utf-8?B?LzUvRU01bUJIZXF1bm54TUhneGhDa0gzSnBjNHVoVFR3dW1MK05TY3ExdU1I?=
 =?utf-8?B?TUN5TUdTMGQranEyTjAzSmFnU01IaTJpWWVBd1VUUkY4VTd6eFhqcnZwdklv?=
 =?utf-8?B?dzJmZDRqT29TcmtUcUdQT1pxZS9GTUgzcDZRcHVxUGI1cENaeUNMWm9XNnM3?=
 =?utf-8?B?b3FkY2NPWFNTMDU2eWF5ZjFWb3BVODAySEpNVGc4Q0tsbjVMRGc4VTg4MEp0?=
 =?utf-8?B?emdVa1hRTzJUV1ozMFVuRXRzRG1OYzhQRGdBazFWWFNhMjk2WksxeGRqVWtB?=
 =?utf-8?B?bk9kaU4reTN2TFVhakZhUk9FaVcvV1FxNy80Q2ppU01EY290WTUzMGRlM1BK?=
 =?utf-8?B?Ykd2cDVtK3F3YkJLZUlLbUY2a2RkZ0trejg4WmdJSEgwME00eVo5Y3lyTVBy?=
 =?utf-8?B?bkZFekw2S2RycXRsYlo5dUVuSFlRS28wUUM3ME44c0syWXNVN3A0SmJCZzRF?=
 =?utf-8?B?UUhidHpTYkZvOHFmYWFOM3g4VDlaNDdlcTdhZ3ZxT1B6YSs0WkcrMFFtYVN3?=
 =?utf-8?B?K0FKMWV3U1dtL05zTzF1OHVsZDJoOWNQWG40ekM2VDlUY3BtY1EzMlBoUXhJ?=
 =?utf-8?B?aHhIb2VUOGpKaFpqNUczU1dkSjh0UW5ENEJGaExFUmdETWxkS25DYm0vcExu?=
 =?utf-8?B?aVNGRjF4cVRCVk1Qa0RuREFsMzhzMHZUV0g1RStiMkJoUGJ0WUpGelpES3Fp?=
 =?utf-8?B?VjBJbkdtNllIUE1aamp0YnVLdEhoMml3T3pmT2NDWlFvQ3hiYjQzdlpTNEhY?=
 =?utf-8?B?MHo0Tzk2K0YwM21rdmdmdnhNVlVuVDVPRnhoWmJrUS9SS2JDM0tOdFpkUWRr?=
 =?utf-8?B?dkJrenZSazV4WHExR2dla3ZXVW1ubnBnTzF0MmxnSDQxNjh0U0NJSHRjY0pD?=
 =?utf-8?B?My92a2I1b0phTUxOVGs1VjdnSXpLQ1RYSkU5Nk8vcFR1Z2hEL1VvcStNVWhB?=
 =?utf-8?B?T2pqNk5qVGtSTC9VOERXT0grNDh2YnM4YUNkQUtXQkZUb0g0bmRkc1d2aGlR?=
 =?utf-8?B?UGRrTDYrRVlub2tqRWh0Q2RMR2owRHhaMHhuZ0pvWWZuQ2tTandDazRrcXFn?=
 =?utf-8?B?UWZJTk1oTVlnVkxieUI4THE3QU1yWUFkeVhYeGJ6L3grVVN3WHZ1bGZVZWNT?=
 =?utf-8?B?YnNRaFI1dEJsbGtLQnhyN0JvOVJyR2pGT3Mxc0k3UFQvZlUzRnRncXB1RWl4?=
 =?utf-8?B?WHUwNHQ1by90VytTZFRhQVhoWTV0QytySDM4QUo4YklTakZjN1Aya1VXZCtm?=
 =?utf-8?B?KytQYnJUU0xPZkZHeGsybCtoN0JFY3A5a2NWcVFJK1VXMXJ0NS8rd080MlNC?=
 =?utf-8?B?enNIRXI4VzZyTS9Da2RxOUVrZDN4UTlEdXU3RGVHTlkxcUFNRG42NUNIWVFi?=
 =?utf-8?B?TDJ2c0lJbWxaOFpYSmZZKy83cG45WitvY1ZNUFQ0MVBZWS9YZ2YzMk9Fd3A4?=
 =?utf-8?B?Y20rWnlDdlBLR2JlQko4ZFcvR0lxQ2loZC9RRFhtbVlobEZBalo2NWMzU1BF?=
 =?utf-8?B?Wkw3bmRJNlBXdFh2K1FPWWVpVFRPbEFBa0ZxZGtwM3VQaWxXWStuZmpLTmFV?=
 =?utf-8?Q?kXmiP5LEl9ou8?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cfc076-e44a-415a-1279-08df4ac5df78
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:29:43.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15632

The regression has been fixed by the following commit, which has been
merged into mainline:

Fixing commit: ed7fb901fce31588bd12ab95adc36ebcb51bc8ea
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed7fb901fce31588bd12ab95adc36ebcb51bc8ea

--
Cheers,
Eric Kim

#regzbot fix: ed7fb901fce31588bd12ab95adc36ebcb51bc8ea

On 11/2/26 9:47 PM, Eric Kim wrote:

> Hi,
>
> On my laptop, which has GP107 GPU with intel graphics and uses nouveau 
> driver, booting kernels after commit 
> 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer 
> dereference at initialization.
>
> [   17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on 
> minor 0
> [   17.556364] nouveau 0000:01:00.0: [drm] No compatible format found
> [   17.556792] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> [   17.557237] BUG: kernel NULL pointer dereference, address: 
> 0000000000000000
> [   17.583880] #PF: supervisor instruction fetch in kernel mode
> [   17.598078] #PF: error_code(0x0010) - not-present page
> [   17.601475] PGD 0 P4D 0 [   17.608839] Oops: Oops: 0010 [#1] SMP PTI
> [   17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tainted 
> 7.3.0+ #1 PREEMPT(lazy) [   17.608954] Hardware name: SAMSUNG 
> ELECTRONICS CO., LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS 
> P11RDV.075.170829.XJ 08/29/2017
> [   17.608990] RIP: 0010:0x0
> [   17.609090] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
> [   17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RCX: 
> ffffffffa97d8091
> [   17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RDI: 
> ffff89b74c466800
> [   17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R09: 
> 0000000000000000
> [   17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R12: 
> ffff89b74c466800
> [   17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R15: 
> ffff89b77f1a2400
> [   17.610320] FS:  00007fc4a888d780(0000) GS:ffff89bac4364000(0000) 
> knlGS:0000000000000000
> [   17.610357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR4: 
> 00000000003726f0
> [   17.610448] Call Trace:
> [   17.610483]  <TASK>
> [   17.610521]  drm_atomic_commit+0xb1/0xe0
> [   17.610558]  ? __pfx___drm_printfn_info+0x10/0x10
> [   17.610590]  drm_client_modeset_commit_atomic+0x25c/0x2d0
> [   17.610618]  drm_client_modeset_commit_locked+0x5a/0x170
> [   17.610647]  ? drm_master_internal_acquire+0x1d/0x40
> [   17.610675]  drm_client_modeset_commit+0x25/0x40
> [   17.610700]  drm_fb_helper_single_fb_probe+0x1aa/0x1c0
> [   17.610729] __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
> [   17.610754]  drm_fbdev_client_hotplug+0x79/0xb0
> [   17.610782]  ? drm_client_init+0x13e/0x180
> [   17.610811]  drm_client_register+0x79/0xc0
> [   17.610839]  drm_fbdev_client_setup+0xc9/0x1c0
> [   17.610867]  drm_client_setup+0x6a/0x90
> [   17.610893]  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
> [   17.610922]  local_pci_probe+0x4a/0x90
> [   17.610951]  ? cpu_hotplug_disable+0x15/0x30
> [   17.610977]  pci_call_probe+0x5a/0x1a0
> [   17.611009]  pci_device_probe+0xdb/0x180
> [   17.611060]  call_driver_probe+0x23/0x100
> [   17.611104]  ? driver_sysfs_add+0x55/0xc0
> [   17.611137]  really_probe+0xd7/0x2d0
> [   17.611171]  ? __pm_runtime_resume+0x50/0x60
> [   17.611220]  __driver_probe_device+0x9c/0x1b0
> [   17.611261]  driver_probe_device+0x1f/0x80
> [   17.611297]  ? __pfx___driver_attach+0x10/0x10
> [   17.611335]  __driver_attach+0xcc/0x200
> [   17.611373]  ? __pfx___driver_attach+0x10/0x10
> [   17.611409]  bus_for_each_dev+0x97/0x100
> [   17.611451]  bus_add_driver+0x1d0/0x280
> [   17.611493]  ? __pfx_init_module+0x10/0x10 [nouveau]
> [   17.611530]  ? __pfx_init_module+0x10/0x10 [nouveau]
> [   17.611567]  driver_register+0x75/0xe0
> [   17.611602]  nouveau_drm_init+0x60/0xff0 [nouveau]
> [   17.611633]  do_one_initcall+0x89/0x3d0
> [   17.611667]  do_init_module+0x8e/0x290
> [   17.611703]  init_module_from_file+0xc8/0x180
> [   17.611736]  idempotent_init_module+0x23e/0x360
> [   17.611773]  __x64_sys_finit_module+0x7f/0x110
> [   17.611805]  do_syscall_64+0xbe/0x470
> [   17.611844]  ? do_syscall_64+0x37/0x470
> [   17.611883]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> It boots without this problem when booting with nouveau.atomic=0
> kernel parameter.
>
> My guess is that atomic_(commit|check) operation is not present in 
> nouveau_mode_config_funcs, and commit
> 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
> atomic modesetting by default for NV50+ gpus caused
> the problem.
>
> Also, drm_helper_(commit|check) was added to nouveau_mode_config_funcs
> at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
> reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
> unreliability.
>
> I hope this problem can be fixed at one of the next releases.
>
> Thanks,
> Eric Kim
>
> #regzbot introduced: 2652aca460dc
