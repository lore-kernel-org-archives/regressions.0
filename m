Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795521439;
	b=49rq2Z1ilIDNklH2ObRBojIJzPoixhArHY6Cs3tlC/NCCxTmb4At/5i1mQAeJT62DB7k
	 I92RlDbRprqExt7KEuQIiZbD14bm8ptDzVdMgFqt3t1KGxwUk/JXVFGdSF0ipH8rYzomR
	 +GqJG+e+fiY08rA4Zy40K4+0CfHVw8Fgenk8f/e9D9CCTlXBxi533usqH08l3U/L8DEyJ
	 gK9H8NzksCf1uRtNmTOc+XrACkKlBnR4RwJSAlNOQMchOKaSMyPjSKlLU0GP8J0vgXRtl
	 grtmQdr9095ZBlpDxKlcv0Qa9balwx5jfVZJms31Toe9SZQLXc4qcP0XusOlyqSjrmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YVzILDmeFWssy2zu3ggeewF0M+JUBTSRc+ywnSHLLzM=;
	b=VHoKzspZ9hCye6sEW70hyPtxewQlXBcM98d5DD6WejOs+ROZVW9zykemtIUB1fBczPz0
	 U8VDMiNH7FpkLwag1VnMcGlR9EKA+VKgUlKQguz4vELrZVhyBA8Kf+S4H0KDFO+7EUopq
	 HtDT0l1f/kon4e9x7laRNnV+CncrhxK/N8i46BU5ABD2MaIo3yVt+Qj2BQfki5yt2bGXZ
	 IHTVkMO+jyR6QmccljqTNwyfs74bi9HLipIoC0jeXMBOq94wf2Pbf6Qo/sHu9pddkb22a
	 40Dq34ih1FVoAyWRKtQNYxfbGPPbp8agmtVmwL4ZS/h5CjHtdYqWH583KatQkHXDQ1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=G6r2OAoj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.1
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010001.outbound.protection.outlook.com [52.103.13.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A0606A31E
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 11:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=G6r2OAoj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNEDapgTtKs9ijvnmmKyOjpvPXppKY//zQAhCIQD7NhKrc/1ulIZAtmWyRfgSVAklSilLGMJrS6dwlRB8909n4H+UwV9IQ9G6Byr5joiDtMBJQ6QyH/wj2pS4fcgCKNb+mVOp4zECCxRkFlmw3YSdcn2CiY/wQXtuYGHonaVFtF9L5VjIDmAXemc0IePO47cgsvDPINxBV1ite5CnQr1flEE1Qszhy7WtCt6ZlXaXO84eLyzhRmJu+05OwL9fq/KxeqiJZaPLDhD0RxbAMrCq7lSd2G+Ve9ZrUqh3oGh7XVEIcDdhFENBuCkLxl/9VzsHUreqNux/lXrWZA5KTWTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVzILDmeFWssy2zu3ggeewF0M+JUBTSRc+ywnSHLLzM=;
 b=UA3vz+2UuqgWaX7oF+rxpzm0Q8QYP7YVY6E45pCtPZ2Ky/CtE6EUZBRodK7+BSUDoH/S8/qkX14yMSaAR6NSNRohL+TFb5h5W1dzk+w0j0Lr1rp1bVS+jorFMTbTw1p8d9RtUjMeOyW2cp8X7BVQukKfqAek3b0onvFxWzcyHKrcRmoSpzan6kqOfEY/XCNVQ/RnC6cSD1gQAmm2gYLC9ogCZTEcuvdlQQx720lRAkocPAwKA1UhtiPZnI6MirYwAeiw5QfkdpCPk5P3Fz9gMluE6u1k+PU0yMuXGUwBWp9YEPaodib1qRS6hGlJnzggDVOgmjh3Nhaq9nHio4lvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVzILDmeFWssy2zu3ggeewF0M+JUBTSRc+ywnSHLLzM=;
 b=G6r2OAojVCYIYCXBpigPFqnnhxHQe6SxA3k4a75HlYn60K6UByEaARa+2ECHEkd9obftjYkKvRN3wELVsUrTXfCUkg8J9A7mhuvZVzvuP1Yxtms11ggkeo7Pkg/SYYtxJ4WlGw5876zS2evoe4uqAeXEVTKtTf9cvarXu5o4j3a39PAOA9bUtAIPwKT54AXHHTt0Ai100cJMMl4L6XsF3Og1PWFyjFe1t8PBuyBm74EAys/T3Aox9Yju2mvzdc2hziFvN7fWTT9z44W90yK+9eOzyJY0zrJeum1147ehW8p3GUuiV7vImVRVKuneVf6Ap4shlkiKtSfPSgoFDs3DQQ==
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:29::14)
 by IA4P221MB1719.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:568::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 11:56:53 +0000
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2]) by CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:56:52 +0000
From: James Buck <jbuck2005.linux@outlook.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi <arighi@nvidia.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
   leaves busy tasks on little CPUs while big CPUs are idle
Thread-Topic: [REGRESSION] sched/fair: SIS_UTIL limit in
 select_idle_capacity()   leaves busy tasks on little CPUs while big CPUs are
 idle
Thread-Index: AQHdfAck+KCFXApIQE6kQJzIQrVbdw==
Date: Tue, 24 Nov 2026 11:56:52 +0000
Message-ID:
 <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5P221MB0926:EE_|IA4P221MB1719:EE_
x-ms-office365-filtering-correlation-id: f6baefd2-6a1d-48c8-c4db-08df4a2207b0
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBvhuFgLLe5qs4jWk9CHdv0AxGbJ782BIZwqmk8QkM41WZBsCPmv8+YKU2npGTGPRzdGhfmLdoA/vCZDaVcnnk8OZZfBHRqu+mrOqZmx6c7FPO0DksJms6MbIcMDRmPSjou8PyVAZj1eJXy0P+g68N5tk0h6rDmbFSJJTkvuWJ4/IEBhBdz1rBScJ/0db6GhM1h5nkOhLSUcjkX8veUIC0kBcIEDF3ck7vBruzYMEulfWjv25pkbefznQw0DyEflVYIbgkLIRFDzoZaPXzbyIfGyaI2/m2CDVAjU0SepVUJO9pSmFS3L6HxAB/G7/vogWR3nGkjpu8bOJrXVYgqis3Mww/etb3dcHzWli9hai7b/McKSelgGK3zyjnl8oSf4XvZFvrEzAbKwMMAtuHCwbCxIrCpjDaa1mlQ4jgSFUJspU6lkIboBTNXnx69tY2Fd0S508Lyy9jWDEkX97gY4+ax9/Hj6wm8MGIgCj4pVzTDXFMNpUQBzgRHKyDwUMzn8pyHxs9B2DaF0eTYxbRWhFhfCRBQby7UFsI4I+H+HCY/0QrqwlucDfu8PN7W3xKb7KdW6ztdZZzR62kJRehqtu0hFEXtRo0dVpZIN72v0s15OOtDg6Les3mmYLd5nIV48Jsl7fzWQc2a+g7zP1WQhDBD4JzRG7s0q5OIXVYd8zpToCv0I8xzt0JlgvIfN7nxj6HoQ8d7rOjZJ0YH5kvzjsBKSgB8IcAwjyy82Fu0KipeupeZL+UpqNnJ2paESyoWIk7EqIjI3zPVmFqWDBuU5af5y
x-microsoft-antispam:
 BCL:0;ARA:14566002|13031999006|25010399006|39105399006|4140399003|24021099003|31061999003|37011999003|20031999006|15030799006|15080799012|41001999006|19110799012|8060799015|8062599012|40105399003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B78ubwEY6ZfLQPKqGXLoX5UMI61/CBCFVhqzn6RQeYr0mqjy9HeOZsEJBa?=
 =?iso-8859-1?Q?1LAkVSezVffXiWR6KBTnNQRJme8jhjlHKvPTYlxItdQHfaSXLxKa1ZhGZV?=
 =?iso-8859-1?Q?k3Q953ITMOPSyJLNSoxGkACKZCVcKpxCbpqaxwPSpAf6JnZLYM8HieEIGi?=
 =?iso-8859-1?Q?0JnfJLlk573r8GMtLhCQRYEn3knuWmteIRlDnqI4U/dCsPdvyfh45/AHPS?=
 =?iso-8859-1?Q?DbacDgjAFdagP15zjl4jzUTA4bPrl0PvMVaw47YPBaGlLuT0bF009oA1Kc?=
 =?iso-8859-1?Q?L9C95oHLrbLmpW6B114sei7B7wVIFRbf2S7fhRL6hlizIT1CG60UNtO/J2?=
 =?iso-8859-1?Q?iRLaEN6oHC0AySHrWt7LOZX05geYtQuADXBuLx4yDa1yaAj652XHWxc53X?=
 =?iso-8859-1?Q?o8RBZCLmAl932SzrgB3GeeW1ZXN3HlSBXj8c8hTnoSE0KywOUDUFynQ9W3?=
 =?iso-8859-1?Q?dt2Y2nBFUFNry+LhwLfMKzQT798Lf31FUHtsU2xdA6KyJorR3xiouJBBlz?=
 =?iso-8859-1?Q?WRrbJsSiM4b8CKQpNUviV/eZrMFq5ZMDa70adfF3ELfXF5npLFMyg9hUis?=
 =?iso-8859-1?Q?AMaDzjexQW8zqTeSZ3LjYjC1KqA9RU0jwQk7XAQ8iWobkDL6rk2XgoiC5F?=
 =?iso-8859-1?Q?/qNIuMo7PfPR7x4sk+UxDDAh68c/yPoVjVzs3ZtFJQK04N5iFUPAzTcnBY?=
 =?iso-8859-1?Q?GmMjNNMIDAuZI2H4mf/5t4tMMqJ9W4ohD3EwOhcqT24MBmqGkkB+dFY4PS?=
 =?iso-8859-1?Q?tP6sV3Vrq0ynmpNveMCOCEn30dFj04+94BshYolCx12Jzmfi0M/BgCCw1/?=
 =?iso-8859-1?Q?Z8V/rZNEj0RGpjpWzhzeW9RaHHU4v9Ev5ntAOKFg7KYnsgp4n1wbbmZvPp?=
 =?iso-8859-1?Q?gMJcehO30uMUyiMt4IqG5BhROppU5+QCvq71OLewu9SppiRn+eh2VrX4YY?=
 =?iso-8859-1?Q?X4Q2pwbMjy4icPuJ8Ue7DFD+tSFYOaillIwwM0TBjlt8XYxTxjc0mp2eNd?=
 =?iso-8859-1?Q?2WHURJEdkMfDMUF3bfsCgyXMaLMQnruqcNPWGG66NRjUXxVtX0XfvAJbKZ?=
 =?iso-8859-1?Q?ew+d11hWkae3Tv+aDy3cUCUjq47vBjsosGlIQSFgFkSHGuQc9Hew4Cm8Iw?=
 =?iso-8859-1?Q?jZ9HfZMOW9jmoMkyK+60gFvOXOGQ0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HBrovQIgBCdftAlDQykyAG+8C3djoFx6EzV3W9V6FJ1ee61WcGqe9ilNMU?=
 =?iso-8859-1?Q?mPMGWa2M7BOJpEQ1atMgmigejz1fTyf4WiGVYYJ0w6BXXW/6PHo/dkYWR4?=
 =?iso-8859-1?Q?gsdxE7axLCT12QNcrBxEp1Ud9UYqSHg5TvHfJ64WVeTs09BdIXW0OW7doX?=
 =?iso-8859-1?Q?0QOiyWeW3OHYEVqDCaBX4ZDTCsdeWp/AvHiUkz7tJDZCuJqx4mAgYeTyNX?=
 =?iso-8859-1?Q?3UvenOmMPdDHBPNX6aAT5KvKzB9btL8L222ogtWcqwb6+EhgpZJoE/kSpS?=
 =?iso-8859-1?Q?SHgdie1ypU2Nq5VX5kG21GD8gXh5zF99cxTJJTj6e9vijyXxs9tXNnsJom?=
 =?iso-8859-1?Q?UnPbHnJS1YSzGkugdXtesTbytMIkuYaEVqWMjzwnSyqfA62ZnRHnuUTd4U?=
 =?iso-8859-1?Q?fr8B7wq1GRkI8wJeW3sXj1F1Y2DloRFQm9zCdwvRTCPTNVcklfJa7AflmF?=
 =?iso-8859-1?Q?0NzEOuNp8VDl1Fd68cP7QsG7dxV3En19nTjh3wH84IxpA3kdkzTx4qt9Vw?=
 =?iso-8859-1?Q?mpQEcx+ezJUTEYBw28j1s7VFqqqIwbow4oq61id9NHY+MRh4Q/18A2qxJf?=
 =?iso-8859-1?Q?cCzL8siMblKonxF4aHzpIOhk46SXrZMW2MmdTBZf7gwjuZoJouVWM3tV7m?=
 =?iso-8859-1?Q?AbeMPjciP/LvoWXGAl4pdstzgjBNVl15Gvf4mDifguQyMg4pDibB47Wbd/?=
 =?iso-8859-1?Q?1Sz1icLsCjv74LHZeIbgurxSpamxMMyGFlCdcOJcut1E4+BeXzcnA7T3Sw?=
 =?iso-8859-1?Q?TgGrd74kltV/2PiP3kSU1Hy8na+SLBo6+Opi6irq5YcZ+9KdzwV0DYlvbi?=
 =?iso-8859-1?Q?JrCI5fYoiDP3YCB/l1mbuAFYPM+JD1o755N+H/mLp5qbSe80AtXLMDy/e2?=
 =?iso-8859-1?Q?zH+0gMYy9wmHes7HyuJEcVGHN9bSwsY9hNNisef8vKQBQQYR6vn1+xrgNU?=
 =?iso-8859-1?Q?+efXrN9AANHmeASFJOpB0VhJO2zPikQqIBToxDTKxzU8JHLQL+wuYm0iMt?=
 =?iso-8859-1?Q?z2JQLSqNV7EywA1+Ir97cFYz7qryE0DP88jg7vp+YlQ+sQPtRBx5TM2JQC?=
 =?iso-8859-1?Q?Ofp/fSbOMkpqhugwcggwDKR6uBQp7mPeiTQls8Xv1HvmhZBTRTsQ2UlwHt?=
 =?iso-8859-1?Q?OGMcDSaZokaKxxe06BRgGNed9jGftKLvLAtUNiIPrH61fLMXdcel2kI10Z?=
 =?iso-8859-1?Q?cXWRv+cGiisDQbxduMcNnrF+fAwgj8aZVf5P7/jyWSNn4vyWHVD0Gkl5ik?=
 =?iso-8859-1?Q?cJmjiJtKXnpdp9cLXFsGLHPJURf26CdoBK3jI1uJrtBoIJ+3tR1405IqDY?=
 =?iso-8859-1?Q?BAuiZp9wRPcpyOedFZE6lAZeLUqKo8ZcY7OiKc0tPYzs8hWeVixN+B1mVZ?=
 =?iso-8859-1?Q?WAil9BlU/6+uX+Zt216m0y9vayjhQwygkwGMGyIH3kZ7QcUxN0NDo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f6baefd2-6a1d-48c8-c4db-08df4a2207b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 11:56:52.7890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4P221MB1719

Hi,=0A=
=0A=
Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle=
_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTL=
E arm64 board runs 12-19% slower than on v7.1 and earlier, because waking t=
hreads are placed on idle little CPUs while idle big CPUs are never looked =
at.=0A=
=0A=
Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacit=
y() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainl=
ine to behave the same.=0A=
=0A=
#regzbot introduced: 61ea17a63719=0A=
=0A=
System=0A=
------=0A=
Orange Pi 6 (CIX CD8180 "Sky1"), 12 CPUs in five clusters, ACPI boot, no SM=
T:=0A=
  =0A=
CPUs     capacity=0A=
0-1       1024  =0A=
2-5         279   (little)=0A=
6-7         905=0A=
8-9         866=0A=
10-11     984=0A=
=0A=
The firmware's PPTT gives one MC domain over all 12 CPUs. It has SD_ASYM_CP=
UCAPACITY(_FULL) and SD_SHARE_LLC, with a CLS domain per cluster below it. =
The kernel is v7.3.5 plus the out-of-tree Sky1 SoC=0A=
driver patches the board needs to boot. None of them touch kernel/sched/; t=
he only one in drivers/base/arch_topology.c adds a helper that updates capa=
city_freq_ref when boost is toggled.=0A=
=0A=
Workload=0A=
--------=0A=
llama.cpp llama-bench, Qwen2.5 1.5B Instruct Q4_K_M, CPU only, 8 threads, p=
p512 / tg128, tokens/s:=0A=
  =0A=
6.18.64                           123.5 / 36.5=0A=
7.3.5                               109.0 / 29.5=0A=
  =0A=
7.3.5, taskset to the 8 big CPUs   121.4 / 34.7=0A=
7.3.5, NO_SIS_UTIL at runtime     122.1 / 35.9=0A=
7.3.5, patch below                       121.7 / 35.7=0A=
=0A=
Sampling each worker thread's CPU every 5 s on stock 7.3.5 showed one to fo=
ur of the 8 threads on cpu2-5 in every sample, with big CPUs idle. With NO_=
SIS_UTIL, or with the patch below, threads only make brief visits to the li=
ttle CPUs. That costs nothing measurable, and 6.18 does the same. llama.cpp=
 syncs all threads at a barrier after every operation, so one thread on a 2=
79-capacity CPU holds up the other seven.=0A=
=0A=
Other things I ruled out with runtime toggles or test builds: EAS off, llc_=
balancing off, the performance governor, NI_RATE/NI_RANDOM, the 6.18 misfit=
 logic, and restoring the old sd_init() rule that cleared SD_PREFER_SIBLING=
 on the child of an asymmetric domain. None of them changed the result. The=
 slowdown only shows when prompt processing is part of the run, where the w=
orkers block and wake far more often than during generation, which points a=
t the wakeup path.=0A=
=0A=
What I think happens=0A=
--------------------=0A=
The workers' util is about 850-1018, so they fit no CPU, not even a 1024 on=
e (the limit there is about 819). select_idle_capacity() therefore never re=
turns early. It returns the highest-capacity idle CPU among those it scanne=
d. =0A=
=0A=
With 8 of 12 CPUs busy, nr_idle_scan comes out at about 6:=0A=
  =0A=
x =3D 7200 / 12 =3D 600=0A=
y =3D 1024 - 600^2 * 117^2 / (10000 * 1024) =3D ~543=0A=
=0A=
nr =3D 12 * 543 / 1024 =3D ~6=0A=
=0A=
So the scan stops after six CPUs counted from target. From cpu0 that is cpu=
0-5. With cpu0 and cpu1 busy, the best idle CPU it can see is a little one,=
 and the idle cpu6-11 are never checked. From cpu10 the scan covers 10, 11,=
 0, 1, 2 and 3, with the same result. Once a thread is on a little CPU, its=
 next scan starts there, so it tends to stay.=0A=
Above about 85% load nr drops to 1 and the function returns -1 at once.=0A=
=0A=
The CPU numbering here (littles between two groups of bigs) makes it easy t=
o hit. But the effect looks general: for a task that fits no CPU, a scan cu=
t short by nr returns the best of a partial set. On a system with the littl=
es at 0-3 and the bigs at 4-7, a wakeup with target on a little CPU and nr =
<=3D 4 sees only little CPUs.=0A=
=0A=
The patch below (drop the limit from select_idle_capacity() only; select_id=
le_cpu() keeps SIS_UTIL) is what I run now.=0A=
=0A=
I'm not proposing it as the fix, since it gives up what the commit wanted o=
n large asymmetric domains.=0A=
=0A=
One option might be to keep scanning past nr while nothing has been found t=
hat fits. I'm happy to test anything on this board, and I can send the topo=
logy and sched domain dumps, /proc/schedstat, or traces if they help.=0A=
=0A=
Thanks,=0A=
James=0A=
=0A=
=0A=
=0A=
--- a/kernel/sched/fair.c=0A=
+++ b/kernel/sched/fair.c=0A=
@@ -9049,7 +9049,6 @@ select_idle_capacity(struct task_struct *p, struct sc=
hed_domain *sd, int target)=0A=
 	int fits, best_fits =3D ASYM_IDLE_THREAD_MISFIT;=0A=
 	int cpu, best_cpu =3D -1;=0A=
 	struct cpumask *cpus;=0A=
-	int nr =3D INT_MAX;=0A=
 =0A=
 	cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask);=0A=
 	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);=0A=
@@ -9058,28 +9057,17 @@ select_idle_capacity(struct task_struct *p, struct =
sched_domain *sd, int target)=0A=
 	util_min =3D uclamp_eff_value(p, UCLAMP_MIN);=0A=
 	util_max =3D uclamp_eff_value(p, UCLAMP_MAX);=0A=
 =0A=
-	if (sched_feat(SIS_UTIL) && sd->shared) {=0A=
-		/*=0A=
-		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits=0A=
-		 * the scan when not preferring an idle core.=0A=
-		 */=0A=
-		nr =3D READ_ONCE(sd->shared->nr_idle_scan) + 1;=0A=
-		/* overloaded domain is unlikely to have idle cpu/core */=0A=
-		if (nr =3D=3D 1)=0A=
-			return -1;=0A=
-	}=0A=
-=0A=
+	/*=0A=
+	 * Scan the whole domain, as 6.18 did. Do not cut the scan short with=0A=
+	 * the SIS_UTIL nr_idle_scan hint: on a busy system the hint drops to a=
=0A=
+	 * few CPUs, the scan then stops at whatever idle CPU it met first, and=
=0A=
+	 * a task that fits no CPU (util above every capacity margin) lands on=0A=
+	 * an idle little core while an idle big core is never looked at.=0A=
+	 */=0A=
 	for_each_cpu_wrap(cpu, cpus, target) {=0A=
 		bool preferred_core =3D !has_idle_core || is_core_idle(cpu);=0A=
 		unsigned long cpu_cap =3D capacity_of(cpu);=0A=
 =0A=
-		/*=0A=
-		 * Stop when the nr_idle_scan is exhausted (mirrors=0A=
-		 * select_idle_cpu() logic).=0A=
-		 */=0A=
-		if (!has_idle_core && --nr <=3D 0)=0A=
-			return best_cpu;=0A=
-=0A=
 		if (!choose_idle_cpu(cpu, p))=0A=
 			continue;=
