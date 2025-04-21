Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B11EB3E
	for <regressions@lists.linux.dev>; Mon, 21 Apr 2025 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199119; cv=fail; b=Bpj1hf0ER+Uiw9PrGBeWoJ/C3+dgcz1tyzyVzZ5cOYWD8jD8h5VJmM1nZ+pjALcsqRxQVnxtKpZ1V9GKC6G5uRQZylJyRoSHS3+wY8Dj6f7n306Afy0XDsKUwI6tlfD+GTiHjo6Y9CFhZd+dg8sEY0C3NC568VWWsNt0xt4Nxkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199119; c=relaxed/simple;
	bh=OUnMybfE0cr+7WkkmcXGRJm2iYB+gkpKIVP67+vS6+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RFSXUo26L/ekuiIDHN+B7MfcVDmD02RCFfRiq4DmnHJu7nEctFUMkO0MG2mN1T5SK1w0/M4PPPWEpgRVC10I88RpuvLt4hvh1QmjG4ayFiN99k0dLxsed399Nu9ddrAoVRhJqlVuWJu9U5s7UO0+uf9ix3ok4Z6E0v8QrpR/U2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=frhRGOeV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gLlPksNn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="frhRGOeV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gLlPksNn"
X-UUID: 61fed41a1e5011f09b6713c7f6bde12e-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OUnMybfE0cr+7WkkmcXGRJm2iYB+gkpKIVP67+vS6+A=;
	b=frhRGOeVFADm1wGB+jjx6k7hop5IA8eqVKYkA1AkSQpp/qZQvLmqbYdv3HD27GetNB2txartxbeCJMhsS+CS72Bee4VU1q0hl6sP3P4PkrfQFJo7PCr6KJofjVUqOgA9nucyxIIhroix7WCxSpNj2Odl8ratXJnj0RAK8XPNIVE=;
X-CID-CACHE: Type:Local,Time:202504210907+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5af1139c-a98f-40a8-a3a1-bab450bd9f91,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:eea44ca6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 61fed41a1e5011f09b6713c7f6bde12e-20250421
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1535165829; Mon, 21 Apr 2025 09:31:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 09:31:43 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 09:31:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a44Y9j2+z7TQZkbVZVo9Xd8Yo3FKUIWzUuVzt/nS4Xydx5J+f8ahg8XYYAJ6fROyqM9ssb7gbeA4bzZwlBHyYuicZFPhWG7MxZx2kNV6mlrrJ42jhhd96GZae8wmRjB6FivHMOKkRdt0bDA6w7LY8VSgcFh9vuB/2OXBlk3PoBs0BREm/LEnrUtjUQUYGDivao262umAC7edTA4xqs1dTV84fDUERWxzkU4ulEqDCyLnZxw9vkpVFtMrnUFVldgrp1LMYcQC9SdK+ooZmkX1iVvd46fN8IJhiOKMi3gcaiPBvypP830/xJG7N27hNZpuDyT1jqpnJiuSCgpYlCUHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUnMybfE0cr+7WkkmcXGRJm2iYB+gkpKIVP67+vS6+A=;
 b=HL3QpqghGroMRSkGYqGy9q6PFj8nKZFARpVOR89J0ySFElY+9fHPrSPP9zdOnVOVTdmlQZDGSotU6XMZzWFOwgJwN0Ia+cxEGSGWzVKHnzBvsiLJvyJ5z59v3Q1LNQMIVi2v/6dkES1Rcp3ejQFCq5ZILK0x1MEOUzaqi9/TqCpGhE5+3b9UpN2ej+l4OKi6/fuWO+vKUl83rPKPO9mzScZomgF3xFViY5gZWeAFZ4dDOlUUT+BJjOx2AIPl8g5gfKz0YSok/NGfrBUO2kr5zC1xO6jYG/0sS3wKVVIJ13HfqxkiQan2HmNK5gzKGua7vY362DZ+wwrS9vZmzHFslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUnMybfE0cr+7WkkmcXGRJm2iYB+gkpKIVP67+vS6+A=;
 b=gLlPksNn+pJe5w/zs4Ng/MtnfQO7W/2dJR4cKJlExz25bzs5tnfdRA3o0+WP/s+DHgOmKLl4zOYkishuhQIdcrRs8HqXCLU2qE4wooBI4vwM7HpjQ3y0Ph4kltQNKWoQHVT0APgqf8Ht3vPVJ1V7xQj+qJNcabJjjnIp9eGOnpk=
Received: from KL1PR03MB6170.apcprd03.prod.outlook.com (2603:1096:820:91::12)
 by JH0PR03MB8841.apcprd03.prod.outlook.com (2603:1096:990:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 01:31:41 +0000
Received: from KL1PR03MB6170.apcprd03.prod.outlook.com
 ([fe80::7b0c:45ca:7525:93bf]) by KL1PR03MB6170.apcprd03.prod.outlook.com
 ([fe80::7b0c:45ca:7525:93bf%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 01:31:40 +0000
From: =?utf-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>
To: "patricknicolas@laposte.net" <patricknicolas@laposte.net>
CC: =?utf-8?B?SGFvIFpoYW5nICjlvKDmtakp?= <hao.zhang@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, =?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?=
	<Leon.Yen@mediatek.com>, =?utf-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
	<Mingyen.Hsieh@mediatek.com>, "sean.wang@kernel.org" <sean.wang@kernel.org>
Subject: Re: [REGRESSION][BISECTED] mt7925e fails to reconnect after suspend
 on 6.14.x
Thread-Topic: [REGRESSION][BISECTED] mt7925e fails to reconnect after suspend
 on 6.14.x
Thread-Index: AQHbqsOY2QPgyIhrRUiV1EChzWEQ6LOicgiAgABPPACACqN3AA==
Date: Mon, 21 Apr 2025 01:31:40 +0000
Message-ID: <1d6942ddf33bddad31b446cc0e20f2dc8f75f64d.camel@mediatek.com>
References: <f23b88ef59b3967429c3993bf5715577f8c30407.camel@laposte.net>
	 <629a6ffecd7f6f402d0e4ccaddb9a48021ec5636.camel@mediatek.com>
	 <6081cd512fbdeca5e8af5884bacb9ad9954aba26.camel@mediatek.com>
In-Reply-To: <6081cd512fbdeca5e8af5884bacb9ad9954aba26.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6170:EE_|JH0PR03MB8841:EE_
x-ms-office365-filtering-correlation-id: 5420a453-8e1e-4bf6-cfe1-08dd80744471
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?anNsRmxJNW51c2p0Y1JIMzNveVlOY3FrajgyVGdyMTF1MW8zR3BHZWlWM1Ix?=
 =?utf-8?B?cnBpS3dOV0JNemFBKzBOZm5wTVNvaEJOVkpmdnFlQk42WkF6c0ZQODRIM1l1?=
 =?utf-8?B?bkE5S05zOGlMQmRJcnVUL3AvdnpzYmpDVXVVNU5HRXh2TUJyZmxUNU5sSCtM?=
 =?utf-8?B?L29YenZ1bENmVmF4dFlUNUxVSHYrOEJEZlUvNTdNa1VBN1VNQzhCdDYrMkJG?=
 =?utf-8?B?c2IvVGZnZjlwWEp5ZU04Mzl5QzkxTTBCU3oySXAxV0szc3dQRVFOdEhDRjU2?=
 =?utf-8?B?ZTVRUVdndmtkdUFjcy92ZTRzWkNMZ0NHUVBuRngxZ3dhdUNCZlVBd1o1Y0tL?=
 =?utf-8?B?Rzk3bzlZNUdFQ250bjFXZTZSaXdHd2wrT3NLbnA3amVleTFyaUYwVS9vSHFK?=
 =?utf-8?B?RThaU2VZcWFubHE5NmxQSlVjUlErcGZhMEVvVm9XNnVJR2VOdWQrOG1QdjY2?=
 =?utf-8?B?bG9FWW5TQWNnK1VVeW1KalNrSythOEF4d2tFTTdCdUR3R3l6aTkvdW1DSWM5?=
 =?utf-8?B?Sy9oUmp4b09rSFc3Q0JadXp4MnhVT2pPUndQbWl6OHFNMjJmb2NxWFB6KzhO?=
 =?utf-8?B?cWQxY0ZUdlNLdWkyRmFETTRJeGRFb1VRbnhYa0lmL2FOaldJRFBOQStCQkdB?=
 =?utf-8?B?NThpenJwVDdmbUloMGd1TkxPTmN5M2czQTlWZ1ZJUTEyYi83SjluNDRuYXNV?=
 =?utf-8?B?RCtWVm9UbW9xOWZZb3BJMEc5enNBTG9KdHBnUVhQaTFXaTNER0xRTVYzTE5q?=
 =?utf-8?B?V3NaalBQSzlqeWdCYmdjWlRvUVJlRGR4SDBzNlVhd1QvS1NIaktSdWZtVFdx?=
 =?utf-8?B?K05pWGJaajJFYlBRbXd0V0FOOVRtUE1TNlBEZnp3WVdBVnZSK3VWeGNIbzNM?=
 =?utf-8?B?WStFWml5Qk9jSHpqdWpiNjJxK2RjOFcrbkcxMVVrZlBYRFg4cWw3Zjk4TlBK?=
 =?utf-8?B?cTd4eERNMnlMdlU4WFBtdkg5a2p2SlI1QUpjYVpUcGw4NWliUmRNVlB1K2dz?=
 =?utf-8?B?QlQ0SzZXbGNCaXo2cko4TmlpUXNaMnFlMWxpY2xvNkUrdGlrcWVUOTBGT3hO?=
 =?utf-8?B?TXMwUFVzVW53d25vWXVzTC9BblZXTGIvNjZtTWkwUGxLSGIrdzFEWmtnVHZy?=
 =?utf-8?B?Mmg2YW4zeFlPVlVIbnRibFUzVm1IS3k3SHNieGllSjU2UmlKWnMzZ2RZa25s?=
 =?utf-8?B?UER5cEdZZDZabWZSVCtaN0svOXFoK2F6MmJLbC8wZC9leFdDVXpOeWZrMWR0?=
 =?utf-8?B?Wk1sRmhsbFBkaFZzemhWZG1PNmFXdDliNnRUNkRhQTIxeXNwanNiSk5IY1Vt?=
 =?utf-8?B?L2EzQXpBbXo0K2dVV0hhSkg2elN4NmtTNXd1NXM5YXhkMTJNMjIrT2xkVjRU?=
 =?utf-8?B?VkYzWWRyVjhvZEc4Y25wNVNiMEJMaVc1Z3JWL3JtQmFYU3lndjc0RkZKNmRn?=
 =?utf-8?B?a2QyTDFLS2U0YS92amdrOTJsMzcvSTZmdGg5ZlgvS3dteG9mVXNzV0QyM2Rh?=
 =?utf-8?B?a2VtNWRKNnBXdnorWlFlNFJoc29EQ0xDUWF1Q05EOHU3QWhWak1qQVRxckJN?=
 =?utf-8?B?RW1JazA0UWNZU1FGalhEQmllUEJRVHNKMTZoL1NYbUx0ZkRLNFRBRDhpNXNV?=
 =?utf-8?B?NTg4aFRiU2xNc1liL1ZTcjd2aythRklnd2lDQnpTd0tRNkRkTWNNZyt3d3R4?=
 =?utf-8?B?VVFaSWs5Vjdua0RiTDJ6Nm1lTWpCVzN5VjFjUE5UY1FMOXdTaHFxdm14TU5V?=
 =?utf-8?B?bi9MN2I4SXVpZ1lNU3dKWnN1eE5PbHVPR0Ric2lMN1ZlTi82OFVPUkhqS1lq?=
 =?utf-8?B?MWR2MklSUXpLR0pUQUpja0VTV2hqSkxwTEd6cHFKYlNsNytQWkJEYkhZYUJ1?=
 =?utf-8?B?L3FRL0RETjdZQ3JMWktmaFRkNVJ6UDd3ZHh2NWh1RVpwL2RUUkFrdEFzRjhZ?=
 =?utf-8?B?WklxZnhENUptbW9qbkNBOHg0cThaYjNVM0llWGl4TldFVThteDZsSnVlTll3?=
 =?utf-8?Q?bVqKcP3vhrViwrxowfqUihgWKpnh5I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6170.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzZZNSsvQ0YrRmJZdWdSTG13Z2V6bGk1b2RYakRlb3RnUkRndFNRa3BRaTla?=
 =?utf-8?B?YjA1Y1M4T0RYVUVnQVNTVjZiSk44MURHdkYvTGN5cGJZM1gvMm5WcVpEUnhx?=
 =?utf-8?B?RVUrZm9rVVNLbjh5WWlRaithODcyR0E4R0VzcVk4cHJHOGI2amVPeUQ4dWNW?=
 =?utf-8?B?QnZjcUswT0c0alVQNm80V243TFhxTWtxUWVtTkpKK21MckltT2g3UUZhdUMv?=
 =?utf-8?B?Q0pYVHA2TFA4TndRcXhJSzZNbTJCdTBQa0x0b0hXWmJEZWRZazJQNkh3UzN5?=
 =?utf-8?B?WDEzcDdnSWtiYUdVQzBPZGxWNFl4Z3VDVjZKU3g4N012OXFwM1J3ZXNKcHRD?=
 =?utf-8?B?QUZGT1FsMExqYVYyTUZsMG9CbWJCTDlybFpmQkw4MzdURUg0OW1lYlB3OE9T?=
 =?utf-8?B?WERIckJNVXEydWdhRThXY0E3RVdiaHdIY3JWZjVsQWJpRVgzTktWK3haMWx1?=
 =?utf-8?B?U05NUm01cTEva3ZvZk9oTGV4ams5anVTa1E5WThIS2djM3lRT3Z3MnhyTWN6?=
 =?utf-8?B?VzhuclZ6b3FneGZDekJVQ0J5bDZ0dUFYYW5xNTJna3Q0a0tlclF2Vi9DMkU2?=
 =?utf-8?B?UHRnekdqR0lEenBaQzFtazNSRXZtd0F1c3dTTDN5cWtuMXNWNzcxeHY2VFZz?=
 =?utf-8?B?Mm54cE04OFRxV2JhcUVjTTBwUWl5N1pTbk9OMnpmSXBpRVZZNW9xOC9mVUtO?=
 =?utf-8?B?N1RjaVAwRTFYTGVUSlpOeU5VbmpHTTZINnY2NzEzemZpbU9YLzZKbVZ0QytC?=
 =?utf-8?B?b2o2aHFqNEp5cDFmMTM2ZSt4SkJRZ3oyc0NXLzN6OUNObWQrY2NOdDdFV2FB?=
 =?utf-8?B?NmU0NHh6cEtDdjVpSFlSN2ZaWk55NzM1VkozRHFCN1JkSTNnbHdvMGY4OHQv?=
 =?utf-8?B?Mzh5YnFicnhneVVScFJ6cGI1UGdISG1IUVc1UTRLZmo0cFIwVy8vUWNRcXd5?=
 =?utf-8?B?aWdHVk55b3g1TVJrMEUvY3dGWGZEV0MyU1pjRHk2MVBKOHNJVUxxUERMWEth?=
 =?utf-8?B?MWVlSnVmYTBGakhKNExiSnl2c3pZRVl4R0RlWDIxSElxcUhjU1d3K05JM25h?=
 =?utf-8?B?SjRvTDJVeDkwZmhjT0N0RHlGcFZVSURJREx6U0pVaWd4SWtHeGVLV3VYYUFp?=
 =?utf-8?B?aWYvWTZaUll1QkpOeUJKYW8vcy9YOHlLVFZkanQxUXJqKzVOdk9UM1dVMU1t?=
 =?utf-8?B?ZWxHeVJnWmIrZ2tIN2Fxc0VXWURiYXpDQmJuVU90K0RVNkc0aEdWMS9vU0NM?=
 =?utf-8?B?V0QxZjFzMjUrYXp6UXNBamJkSkZ1L29uYkVvNTZjazlUalN6WlFETGEvY1JD?=
 =?utf-8?B?elBQSUFlQnlNZjNpSHEyZGh2M3piWFlKdkJER2R2ZGR5Z2FKaGE3VG5vVGUv?=
 =?utf-8?B?NFVJeDdVOVB5UExBTW1vL0ljZzNpUE5tQVpJVkk4dE9RV0hSUXVHZkN1akR2?=
 =?utf-8?B?d2xrUlNlUHRRR2dqVWxhUjNpaklCVC9ZdzhSOXdJWkY5eWVJY0RCRVBrckJU?=
 =?utf-8?B?QUNuVEFFMWxneFZjNkZPcmlEc1MyVW1reXpiL2xkNDV2RjZXN0ZFZUJHN2ti?=
 =?utf-8?B?TGx4R0J6T3N6bEVPL0R5eTdJcVZ1REhERUtDRFVmb0pRNnIzTWFMdEJlQlN6?=
 =?utf-8?B?TmZBM3B5WldDYlZnMXcycVNoUUExOXp0dlVOazFUZWsreS9wYXVTWEJJSi9q?=
 =?utf-8?B?K3puTThvVGs4Z2NCa3FtSStUR3k1TFNiVFFlMXNrUnpkVE1RQklMWGJBZVZk?=
 =?utf-8?B?aUFKZUluUXNlVjlPUFZEZHFMNWxsRkNSNFQ0QjMyb1pvRU9KZlBQdUZyZlNa?=
 =?utf-8?B?TWJEbUVzN3BCQkRJYldpc1VGTjd5bTZPbDJUUmNqUEMrWW9COFNDbXBycC80?=
 =?utf-8?B?NWx1M0Fzdlh6Z0RRNk5yR3VhZ294bkhWOElxTGFiQUxGL21pOUJsVEdQM05y?=
 =?utf-8?B?UW5BSUF3d2pMYk1YSXFWY3RnR2FRS0FoWVM4L2RSQ1NzVUZnSTFZVXJ6UEJm?=
 =?utf-8?B?aGIydUJReFJ3eUZJZ1dnV2VpS1lvR3dGMElsOUlzUjRTQVhsU0UvQ3ZUNXBW?=
 =?utf-8?B?RHhzaEV0NWxneFpYbGh3UEZSWWVKY3huOE02ZTRPZ1BrdmYwckthVlRZemZF?=
 =?utf-8?B?dHdldXRWQWZoNGgrL0NNUFhsdWEvNkx1YklnSFlLc3lnYmdHc0lzNXF6S0Zn?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DE226FD1A3E7F4C952C94DA07E8647B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6170.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5420a453-8e1e-4bf6-cfe1-08dd80744471
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 01:31:40.9197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUG1AMW7ta+sxEqKuIZo7zd7ExwIPLBmL9LoHAZS8JjhBBxaTGEM3uQFq/ccHMiNiIVnoIvY7olsriGVmqJylg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8841

cmUtc2VuZCB0byByZW1vdmUgSFRNTCBjb250ZW50IGZvciByZWdyZXNzaW9uc0BsaXN0cy5saW51
eC5kZXYNCg0KT24gTW9uLCAyMDI1LTA0LTE0IGF0IDE1OjA0ICswODAwLCBhbGxhbi53YW5nIHdy
b3RlOg0KPiByZS1zZW5kIHRvIHJlbW92ZSBIVE1MIGNvbnRlbnQNCj4gDQo+IE9uIE1vbiwgMjAy
NS0wNC0xNCBhdCAxMDoyMCArMDgwMCwgYWxsYW4ud2FuZyB3cm90ZToNCj4gPiBIaSBQYXRyaWNr
LA0KPiA+IA0KPiA+IA0KPiA+IFJlbGF0ZWQgcGF0Y2ggdG8gZml4IHRoZSBpbnRlcmZlcmVuY2Ug
YmV0d2VlbiBTVEEgYW5kIFAyUCBpcyBub3cgaW4NCj4gPiA2LjE1LXJjMS4gUGxlYXNlIGFkb3B0
IGl0IGZvciB0aGlzIHNjZW5hcmlvLg0KPiA+IA0KPiA+IEFsbGFuDQo+ID4gDQo+ID4gDQo+ID4g
T24gRnJpLCAyMDI1LTA0LTExIGF0IDExOjI0ICswMjAwLCBQYXRyaWNrIE5pY29sYXMgd3JvdGU6
DQo+ID4gPiANCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBTdGFy
dGluZyB3aXRoIDZkMThiNjY4MzAxZTBhN2Q5MjRhNmM4MjFiODQ1MTZiYzA4YmRhZmUNCj4gPiA+
IHdpZmk6IG10NzY6IGludHJvZHVjZSBtdDc5MnhfY29uZmlnX21hY19hZGRyX2xpc3Qgcm91dGlu
ZQ0KPiA+ID4gDQo+ID4gPiBXaGVuIHJlc3VtaW5nIGZyb20gc3VzcGVuZCwgV2lGaSBmYWlscyB0
byBjb25uZWN0IHRvIG15IDVHSHoNCj4gPiA+IG5ldHdvcmsNCj4gPiA+IHVzaW5nDQo+ID4gPiBO
ZXR3b3JrTWFuYWdlci9pd2QNCj4gPiA+IA0KPiA+ID4gam91cm5hbGN0bCBsb2dzIGFmdGVyIHN1
c3BlbmQ6DQo+ID4gPiBhdnJpbCAxMSAxMDo1MToyMCBSdXRoZXJmb3JkIHN5c3RlbWQtbG9naW5k
WzY2N106IE9wZXJhdGlvbg0KPiA+ID4gJ3N1c3BlbmQnDQo+ID4gPiBmaW5pc2hlZC4NCj4gPiA+
IGF2cmlsIDExIDEwOjUxOjIwIFJ1dGhlcmZvcmQgc3lzdGVtZFsxXTogU3RvcHBlZCB0YXJnZXQg
U3VzcGVuZC4NCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIwIFJ1dGhlcmZvcmQgc3lzdGVtZC1yZXNv
bHZlZFs0MTFdOiBDbG9zaW5nIGFsbA0KPiA+ID4gcmVtYWluaW5nIFRDUA0KPiA+ID4gY29ubmVj
dGlvbnMuDQo+ID4gPiBhdnJpbCAxMSAxMDo1MToyMCBSdXRoZXJmb3JkIHN5c3RlbWQtcmVzb2x2
ZWRbNDExXTogUmVzZXR0aW5nDQo+ID4gPiBsZWFybnQNCj4gPiA+IGZlYXR1cmUNCj4gPiA+IGxl
dmVscyBvbiBhbGwgc2VydmVycy4NCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIwIFJ1dGhlcmZvcmQg
TmV0d29ya01hbmFnZXJbNjg0XTogPGluZm8+wqANCj4gPiA+IFsxNzQ0MzYxNDgwLjEyOTJdDQo+
ID4gPiBtYW5hZ2VyOiBzbGVlcDogd2FrZSByZXF1ZXN0ZWQgKHNsZWVwaW5nOiB5ZXPCoCBlbmFi
bGVkOiB5ZXMpDQo+ID4gPiBhdnJpbCAxMSAxMDo1MToyMCBSdXRoZXJmb3JkIE5ldHdvcmtNYW5h
Z2VyWzY4NF06IDxpbmZvPsKgDQo+ID4gPiBbMTc0NDM2MTQ4MC4xMjkzXQ0KPiA+ID4gZGV2aWNl
ICgvbmV0L2Nvbm5tYW4vaXdkLzApOiBzdGF0ZSBjaGFuZ2U6IHVubWFuYWdlZCAtPg0KPiA+ID4g
dW5hdmFpbGFibGUNCj4gPiA+IChyZWFzb24NCj4gPiA+ICdtYW5hZ2VkJywgc3lzLWlmYWNlLXN0
YXRlOiAnZXh0ZXJuYWwnKQ0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjAgUnV0aGVyZm9yZCBOZXR3
b3JrTWFuYWdlcls2ODRdOiA8aW5mbz7CoA0KPiA+ID4gWzE3NDQzNjE0ODAuMTI5NF0NCj4gPiA+
IGRldmljZSAod2xhbjApOiBzdGF0ZSBjaGFuZ2U6IHVubWFuYWdlZCAtPiB1bmF2YWlsYWJsZSAo
cmVhc29uDQo+ID4gPiAnbWFuYWdlZCcsIHN5cy0NCj4gPiA+IGlmYWNlLXN0YXRlOiAnZXh0ZXJu
YWwnKQ0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjAgUnV0aGVyZm9yZCBkaW5vWzE2OTVdOiBzdHJl
YW1fY29ubmVjdC52YWxhOjc2Og0KPiA+ID4gQ291bGQgbm90DQo+ID4gPiBlc3RhYmxpc2ggWE1Q
UCBzZXNzaW9uIHdpdGggbWV1bWV1Lm9yZzo1MjIyOiBGYWlsZWQgY29ubmVjdGluZyB0bw0KPiA+
ID4gbWV1bWV1Lm9yZzo1MjIyIChzdGFydHRscyk6IEVycmV1ciBkZSByw6lzb2x1dGlvbiBkZSDC
qyBtZXVtZXUub3JnDQo+ID4gPiDCuw0KPiA+ID4gOg0KPiA+ID4gTm9tIG91DQo+ID4gPiBzZXJ2
aWNlIGluY29ubnUNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIwIFJ1dGhlcmZvcmQgZ25vbWUtc2hl
bGxbMTUzMV06IEZhaWxlZCB0byBtYWtlDQo+ID4gPiB0aHJlYWQNCj4gPiA+ICdLTVMNCj4gPiA+
IHRocmVhZCcgaGlnaCBwcmlvcml0eSBzY2hlZHVsZWQ6DQo+ID4gPiBHREJ1cy5FcnJvcjpvcmcu
ZnJlZWRlc2t0b3AuREJ1cy5FcnJvci5OYW1lSGFzTm9Pd25lcjogTmFtZQ0KPiA+ID4gIm9yZy5m
cmVlZGVza3RvcC5SZWFsdGltZUtpdDEiIGRvZXMgbm90IGV4aXN0DQo+ID4gPiBhdnJpbCAxMSAx
MDo1MToyMCBSdXRoZXJmb3JkIGdub21lLXNoZWxsWzE1MzFdOiBGYWlsZWQgdG8gbWFrZQ0KPiA+
ID4gdGhyZWFkDQo+ID4gPiAnS01TDQo+ID4gPiB0aHJlYWQnIGhpZ2ggcHJpb3JpdHkgc2NoZWR1
bGVkOg0KPiA+ID4gR0RCdXMuRXJyb3I6b3JnLmZyZWVkZXNrdG9wLkRCdXMuRXJyb3IuTmFtZUhh
c05vT3duZXI6IE5hbWUNCj4gPiA+ICJvcmcuZnJlZWRlc2t0b3AuUmVhbHRpbWVLaXQxIiBkb2Vz
IG5vdCBleGlzdA0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjAgUnV0aGVyZm9yZCBnbm9tZS1zaGVs
bFsxNTMxXTogRmFpbGVkIHRvIG1ha2UNCj4gPiA+IHRocmVhZA0KPiA+ID4gJ0tNUw0KPiA+ID4g
dGhyZWFkJyBoaWdoIHByaW9yaXR5IHNjaGVkdWxlZDoNCj4gPiA+IEdEQnVzLkVycm9yOm9yZy5m
cmVlZGVza3RvcC5EQnVzLkVycm9yLk5hbWVIYXNOb093bmVyOiBOYW1lDQo+ID4gPiAib3JnLmZy
ZWVkZXNrdG9wLlJlYWx0aW1lS2l0MSIgZG9lcyBub3QgZXhpc3QNCj4gPiA+IGF2cmlsIDExIDEw
OjUxOjIwIFJ1dGhlcmZvcmQga2VybmVsOiBtdDc5MjVlIDAwMDA6YzI6MDAuMDogSFcvU1cNCj4g
PiA+IFZlcnNpb246DQo+ID4gPiAweDhhMTA4YTEwLCBCdWlsZCBUaW1lOiAyMDI1MDMwNTEzMjkw
OGENCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIwIFJ1dGhlcmZvcmQgZ25vbWUtc2hlbGxbMTUzMV06
IEZhaWxlZCB0byBtYWtlDQo+ID4gPiB0aHJlYWQNCj4gPiA+ICdLTVMNCj4gPiA+IHRocmVhZCcg
aGlnaCBwcmlvcml0eSBzY2hlZHVsZWQ6DQo+ID4gPiBHREJ1cy5FcnJvcjpvcmcuZnJlZWRlc2t0
b3AuREJ1cy5FcnJvci5OYW1lSGFzTm9Pd25lcjogTmFtZQ0KPiA+ID4gIm9yZy5mcmVlZGVza3Rv
cC5SZWFsdGltZUtpdDEiIGRvZXMgbm90IGV4aXN0DQo+ID4gPiBhdnJpbCAxMSAxMDo1MToyMCBS
dXRoZXJmb3JkIGtlcm5lbDogbXQ3OTI1ZSAwMDAwOmMyOjAwLjA6IFdNDQo+ID4gPiBGaXJtd2Fy
ZSBWZXJzaW9uOg0KPiA+ID4gX19fXzAwMDAwMCwgQnVpbGQgVGltZTogMjAyNTAzMDUxMzMwMTMN
Cj4gPiA+IGF2cmlsIDExIDEwOjUxOjIxIFJ1dGhlcmZvcmQgaXdkWzcyN106IGV2ZW50OiBzdGF0
ZSwgb2xkOg0KPiA+ID4gZGlzY29ubmVjdGVkLCBuZXc6DQo+ID4gPiBhdXRvY29ubmVjdF9xdWlj
aw0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjEgUnV0aGVyZm9yZCBOZXR3b3JrTWFuYWdlcls2ODRd
OiA8aW5mbz7CoA0KPiA+ID4gWzE3NDQzNjE0ODEuMzA1MV0NCj4gPiA+IG1hbmFnZXI6IE5ldHdv
cmtNYW5hZ2VyIHN0YXRlIGlzIG5vdyBESVNDT05ORUNURUQNCj4gPiA+IGF2cmlsIDExIDEwOjUx
OjIxIFJ1dGhlcmZvcmQgTmV0d29ya01hbmFnZXJbNjg0XTogPGluZm8+wqANCj4gPiA+IFsxNzQ0
MzYxNDgxLjMwNTNdDQo+ID4gPiBkZXZpY2UgKC9uZXQvY29ubm1hbi9pd2QvMCk6IHN0YXRlIGNo
YW5nZTogdW5hdmFpbGFibGUgLT4NCj4gPiA+IGRpc2Nvbm5lY3RlZCAocmVhc29uDQo+ID4gPiAn
bm9uZScsIHN5cy1pZmFjZS1zdGF0ZTogJ21hbmFnZWQnKQ0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6
MjEgUnV0aGVyZm9yZCBrZXJuZWw6IG10NzkyNWUgMDAwMDpjMjowMC4wOiBIVy9TVw0KPiA+ID4g
VmVyc2lvbjoNCj4gPiA+IDB4OGExMDhhMTAsIEJ1aWxkIFRpbWU6IDIwMjUwMzA1MTMyOTA4YQ0K
PiA+ID4gYXZyaWwgMTEgMTA6NTE6MjEgUnV0aGVyZm9yZCBrZXJuZWw6IG10NzkyNWUgMDAwMDpj
MjowMC4wOiBXTQ0KPiA+ID4gRmlybXdhcmUgVmVyc2lvbjoNCj4gPiA+IF9fX18wMDAwMDAsIEJ1
aWxkIFRpbWU6IDIwMjUwMzA1MTMzMDEzDQo+ID4gPiBhdnJpbCAxMSAxMDo1MToyMiBSdXRoZXJm
b3JkIGdkbS1wYXNzd29yZF1bMjk1MV06IGdrci1wYW06DQo+ID4gPiBrZXlyaW5nDQo+ID4gPiBp
cw0KPiA+ID4gdW5sb2NrZWQNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhlcmZvcmQga2Vy
bmVsOiB3bGFuMDogRHJpdmVyIHJlcXVlc3RlZA0KPiA+ID4gZGlzY29ubmVjdGlvbiBmcm9tDQo+
ID4gPiBBUCAwMDowMDowMDowMDowMDowMA0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjIgUnV0aGVy
Zm9yZCBOZXR3b3JrTWFuYWdlcls2ODRdOiA8aW5mbz7CoA0KPiA+ID4gWzE3NDQzNjE0ODIuNDQ5
NV0NCj4gPiA+IGRldmljZSAod2xhbjApOiBuZXcgSVdEIGRldmljZSBzdGF0ZSBpcyBkaXNjb25u
ZWN0ZWQNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhlcmZvcmQgTmV0d29ya01hbmFnZXJb
Njg0XTogPGluZm8+wqANCj4gPiA+IFsxNzQ0MzYxNDgyLjQ0OTddDQo+ID4gPiBkZXZpY2UgKHds
YW4wKTogc3RhdGUgY2hhbmdlOiB1bmF2YWlsYWJsZSAtPiBkaXNjb25uZWN0ZWQgKHJlYXNvbg0K
PiA+ID4gJ3N1cHBsaWNhbnQtDQo+ID4gPiBhdmFpbGFibGUnLCBzeXMtaWZhY2Utc3RhdGU6ICdt
YW5hZ2VkJykNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhlcmZvcmQgaXdkWzcyN106IGV2
ZW50OiBjb25uZWN0LWluZm8sIHNzaWQ6DQo+ID4gPiBQcmluY2lwaWENCj4gPiA+IDVHSHosIGJz
czogMjI6NjY6Y2Y6ZDU6ZTk6NjAsIHNpZ25hbDogLTMzLCBsb2FkOiAyLzI1NQ0KPiA+ID4gYXZy
aWwgMTEgMTA6NTE6MjIgUnV0aGVyZm9yZCBpd2RbNzI3XTogZXZlbnQ6IHN0YXRlLCBvbGQ6DQo+
ID4gPiBhdXRvY29ubmVjdF9xdWljaywNCj4gPiA+IG5ldzogY29ubmVjdGluZyAoYXV0bykNCj4g
PiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhlcmZvcmQgTmV0d29ya01hbmFnZXJbNjg0XTogPGlu
Zm8+wqANCj4gPiA+IFsxNzQ0MzYxNDgyLjcxMzFdDQo+ID4gPiBkZXZpY2UgKHdsYW4wKTogbmV3
IElXRCBkZXZpY2Ugc3RhdGUgaXMgY29ubmVjdGluZw0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjIg
UnV0aGVyZm9yZCBOZXR3b3JrTWFuYWdlcls2ODRdOiA8aW5mbz7CoA0KPiA+ID4gWzE3NDQzNjE0
ODIuNzEzNl0NCj4gPiA+IGRldmljZSAod2xhbjApOiBBY3RpdmF0aW9uOiBzdGFydGluZyBjb25u
ZWN0aW9uICdQcmluY2lwaWEgNUdIeicNCj4gPiA+IChkNmY2MjkxNy04NjY0LQ0KPiA+ID4gNDZm
My04NjY2LTQxYTgyNDg0NmFmYykNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhlcmZvcmQg
TmV0d29ya01hbmFnZXJbNjg0XTogPGluZm8+wqANCj4gPiA+IFsxNzQ0MzYxNDgyLjcxMzddDQo+
ID4gPiBkZXZpY2UgKHdsYW4wKTogc3RhdGUgY2hhbmdlOiBkaXNjb25uZWN0ZWQgLT4gcHJlcGFy
ZSAocmVhc29uDQo+ID4gPiAnbm9uZScsDQo+ID4gPiBzeXMtaWZhY2UtDQo+ID4gPiBzdGF0ZTog
J21hbmFnZWQnKQ0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjIgUnV0aGVyZm9yZCBOZXR3b3JrTWFu
YWdlcls2ODRdOiA8aW5mbz7CoA0KPiA+ID4gWzE3NDQzNjE0ODIuNzEzOF0NCj4gPiA+IG1hbmFn
ZXI6IE5ldHdvcmtNYW5hZ2VyIHN0YXRlIGlzIG5vdyBDT05ORUNUSU5HDQo+ID4gPiBhdnJpbCAx
MSAxMDo1MToyMiBSdXRoZXJmb3JkIE5ldHdvcmtNYW5hZ2VyWzY4NF06IDxpbmZvPsKgDQo+ID4g
PiBbMTc0NDM2MTQ4Mi43MTM5XQ0KPiA+ID4gZGV2aWNlICh3bGFuMCk6IHN0YXRlIGNoYW5nZTog
cHJlcGFyZSAtPiBjb25maWcgKHJlYXNvbiAnbm9uZScsDQo+ID4gPiBzeXMtDQo+ID4gPiBpZmFj
ZS1zdGF0ZToNCj4gPiA+ICdtYW5hZ2VkJykNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIyIFJ1dGhl
cmZvcmQga2VybmVsOiB3bGFuMDogYXV0aGVudGljYXRlIHdpdGgNCj4gPiA+IDIyOjY2OmNmOmQ1
OmU5OjYwDQo+ID4gPiAobG9jYWwgYWRkcmVzcz1hODplMjo5MTo1Mjo1MzozZSkNCj4gPiA+IGF2
cmlsIDExIDEwOjUxOjIzIFJ1dGhlcmZvcmQga2VybmVsOiB3bGFuMDogc2VuZCBhdXRoIHRvDQo+
ID4gPiAyMjo2NjpjZjpkNTplOTo2MCAodHJ5DQo+ID4gPiAxLzMpDQo+ID4gPiBhdnJpbCAxMSAx
MDo1MToyMyBSdXRoZXJmb3JkIGtlcm5lbDogd2xhbjA6IHNlbmQgYXV0aCB0bw0KPiA+ID4gMjI6
NjY6Y2Y6ZDU6ZTk6NjAgKHRyeQ0KPiA+ID4gMi8zKQ0KPiA+ID4gYXZyaWwgMTEgMTA6NTE6MjMg
UnV0aGVyZm9yZCBrZXJuZWw6IHdsYW4wOiBzZW5kIGF1dGggdG8NCj4gPiA+IDIyOjY2OmNmOmQ1
OmU5OjYwICh0cnkNCj4gPiA+IDMvMykNCj4gPiA+IGF2cmlsIDExIDEwOjUxOjIzIFJ1dGhlcmZv
cmQga2VybmVsOiB3bGFuMDogYXV0aGVudGljYXRpb24gd2l0aA0KPiA+ID4gMjI6NjY6Y2Y6ZDU6
ZTk6NjAgdGltZWQgb3V0DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gbHNwY2kgLXYgLWQgMTRjMzo3
OTI1DQo+ID4gPiBjMjowMC4wIE5ldHdvcmsgY29udHJvbGxlcjogTUVESUFURUsgQ29ycC4gRGV2
aWNlIDc5MjUNCj4gPiA+IMKgwqDCoMKgwqDCoMKgIFN1YnN5c3RlbTogQXp1cmVXYXZlIERldmlj
ZSA2MzcwDQo+ID4gPiDCoMKgwqDCoMKgwqDCoCBGbGFnczogYnVzIG1hc3RlciwgZmFzdCBkZXZz
ZWwsIGxhdGVuY3kgMCwgSVJRIDE1MSwgSU9NTVUNCj4gPiA+IGdyb3VwIDE3DQo+ID4gPiDCoMKg
wqDCoMKgwqDCoCBNZW1vcnkgYXQgZGM4MDAwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkg
W3NpemU9Mk1dDQo+ID4gPiDCoMKgwqDCoMKgwqDCoCBNZW1vcnkgYXQgZGNhMDAwMDAgKDY0LWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MzJLXQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqAgQ2Fw
YWJpbGl0aWVzOiBbODBdIEV4cHJlc3MgRW5kcG9pbnQsIEludE1zZ051bSAwDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoCBDYXBhYmlsaXRpZXM6IFtlMF0gTVNJOiBFbmFibGUrIENvdW50PTEvMzIgTWFz
a2FibGUrDQo+ID4gPiA2NGJpdCsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgIENhcGFiaWxpdGllczog
W2Y4XSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMw0KPiA+ID4gwqDCoMKgwqDCoMKgwqAgQ2Fw
YWJpbGl0aWVzOiBbMTAwXSBWZW5kb3IgU3BlY2lmaWMgSW5mb3JtYXRpb246IElEPTE1NTYNCj4g
PiA+IFJldj0xIExlbj0wMDgNCj4gPiA+IDw/Pg0KPiA+ID4gwqDCoMKgwqDCoMKgwqAgQ2FwYWJp
bGl0aWVzOiBbMTA4XSBMYXRlbmN5IFRvbGVyYW5jZSBSZXBvcnRpbmcNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgIENhcGFiaWxpdGllczogWzExMF0gTDEgUE0gU3Vic3RhdGVzDQo+ID4gPiDCoMKgwqDC
oMKgwqDCoCBDYXBhYmlsaXRpZXM6IFsyMDBdIEFkdmFuY2VkIEVycm9yIFJlcG9ydGluZw0KPiA+
ID4gwqDCoMKgwqDCoMKgwqAgS2VybmVsIGRyaXZlciBpbiB1c2U6IG10NzkyNWUNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgIEtlcm5lbCBtb2R1bGVzOiBtdDc5MjVlDQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gUmV2ZXJ0aW5nIHRoZSBjb21taXQgb24gdG9wIG9mIDYuMTQuMiBmaXhlcyB0aGUgaXNzdWUu
DQo+ID4gPiANCj4gPiANCj4gDQoNCg==
