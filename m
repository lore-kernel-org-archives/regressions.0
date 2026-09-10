Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021129.outbound.protection.outlook.com [52.101.70.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A563DCD83
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033337; cv=fail; b=Ffdth51Ijw8bgGmtEmWzTOVbl9cwxnlhrvHYDBWPneFZr18KmFtPBv3VkrmwcA7C0t58jd6/f3iUX7zPDIR/yzYZftRI869ysEKnVXb1ntQteLfx3k9MtBQzJYYWJDcs+nyRw3tkWhsIfIXsa2RhqilWpGjDrTMDNw2RMaX/Rx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033337; c=relaxed/simple;
	bh=4bB2UVZNW/W1YXbC3x3P+GmRp8ukjad3x9VcBsbrbzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m72iIus52APeZH4tUMNOxBzbdEO6HzrNeCn9SEuDiT9LMy1DBl9pODYC0sPsQxMCmqkwTPwUigNNdOGdAb6WIsZivkIAXfQ/b1h1YC5bYB6PXfmLwfeoMu5ipfCFx8/uVaE8AN+x/ATFoCNrpd0eSuAH8Vf0TLGTE60KUt1lJ54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=badakan.com; spf=pass smtp.mailfrom=badakan.com; dkim=pass (1024-bit key) header.d=badakan.com header.i=@badakan.com header.b=B1O5pIOm; arc=fail smtp.client-ip=52.101.70.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=badakan.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=badakan.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=badakan.com header.i=@badakan.com header.b="B1O5pIOm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D647SOLB54rCwZfwXUBKaWGfEk+mQzc7cUAyUDFDlaPRFXW7jBSsEVYw7GBk+Cg2PRa8sULJLDt7yRo4iwJ8V7yTPOUWYC6J2+Lfp2NgM8oKHNl1nWb/4Vv+YUnu0mOMndxayfkk9XOov4dZal5YAP2n0TgY4KmQnuBuicrtlPpoGF3oL4bt87KI1CpHVCQTbq0utGFyJW6zel81qimfyAZQR1yJ+NtTyx5N1qPO7UEv5H5DEGoQzTiJzF+7hY/Q7+CvQUvE0H9GHuO1+N1IRrt5V6h2IkEbKyaZBrmn2tjmnssJYAn/cizv4J0Q3q6aufCiL8PMQN90D0T8SF1CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bB2UVZNW/W1YXbC3x3P+GmRp8ukjad3x9VcBsbrbzU=;
 b=QMnkvGhMohK339e1XZ+LJoinDBAMYjY0qfTv7B2m3oSUT+5pHlHBGTdtLOsDHfTaiZrPjSWRCDCvEPWEgNcNRIV0pz1p2zsvieO/NTngkDGTP5AK9QirlFY6Kua5qeBolEORpWZWZH5ob309opY9JSbAGGOuKNyE7G5Uk7LBYUUFaP+Jjwgwew0z8MnSNdjRLGE6wmSxxpccyaMaoeFoeVBn37WyWmmJkkCBF8Uw7Uc4XPaRhBFpxmhRsJ29iJJdFxk1pDrSKwADEYNNqg1tWyrYaLIZcpdm2zfHgHpKmzRvh+pk1tmBvXXGV/DnnaLJtLa1P18bqDviIHyFKSw9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=badakan.com; dmarc=pass action=none header.from=badakan.com;
 dkim=pass header.d=badakan.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=badakan.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bB2UVZNW/W1YXbC3x3P+GmRp8ukjad3x9VcBsbrbzU=;
 b=B1O5pIOmXPvT8IRmu6rMz0WJZz8CY/lehNO+4uHkT+06Sq0Ev9cxj1dvqLGDwPcgKaxm3YClJyLFzTRe4RxE9duIgAt6mKBQ2NU0fJB1u0oN45jKCjLoYs1FWbGbaF7/Pm7u6E1Gp1sOEZ1OlvAEGSDa7BHe0Fk9Cy9W+GSESe8=
Received: from DBBPR08MB5884.eurprd08.prod.outlook.com (2603:10a6:10:1f6::11)
 by VI0PR08MB11566.eurprd08.prod.outlook.com (2603:10a6:800:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 09:42:11 +0000
Received: from DBBPR08MB5884.eurprd08.prod.outlook.com
 ([fe80::8812:508:4502:633f]) by DBBPR08MB5884.eurprd08.prod.outlook.com
 ([fe80::8812:508:4502:633f%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 09:42:10 +0000
From: Martin Jeanne <martin@badakan.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
CC: Miguel Vadillo <miguel.vadillo@intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Lixu Zhang <lixu.zhang@intel.com>
Subject: Re: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes
 since v7.2 (CVS fallback returns the IVSC platform device)
Thread-Topic: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes
 since v7.2 (CVS fallback returns the IVSC platform device)
Thread-Index: AQHdQQAcCojNpfgiiE6mvXg7jbh2CrbHgoaAgAAMxgA=
Date: Thu, 10 Sep 2026 09:42:10 +0000
Message-ID: <7646b50e-391e-49cb-a82c-3f82be7c2273@badakan.com>
References: <2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com>
 <e8fd955b-fadc-497a-899b-a13502f0d7f0@leemhuis.info>
In-Reply-To: <e8fd955b-fadc-497a-899b-a13502f0d7f0@leemhuis.info>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=badakan.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR08MB5884:EE_|VI0PR08MB11566:EE_
x-ms-office365-filtering-correlation-id: 24a58d25-3a93-4928-8437-08df0f1fc981
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 3R+iyqZJrqjvoBtwjnrcVzDyztdoDvJRCJyimG/tdiuTiFNW1lXIIbtAPdtToTnNyM6yuFMTUowkDp3Ht8V0i3FAoEdkq1LTLudKlkRwdxQ05J8Bf4x+VD9SEngt35AzpeXCSizuSLB/uPTBDLgWI2OpLcJpUQ9nlGtXP4FOQADkhmT+kn+JA70LE/pqdjHyxnK715xPnwnW20lvisnGpT7Q3bqwFUrGu4X+yjvDBZ5jHNkBNDo0CsY/toY9z8GIEPZAgofUCtghQyK1h3zE3SeSOCxw8LAz76psshPQl/uCUoZ7OpzFQrg8HdGcLljWSaiPpYPdkjl1Lkw0ja5kwnJFRKGi1lRAbsw5PSbMcSJxozBKiZQPLYEmr5nBhhIHGJDoCPVSH7jBCB45wHoV4plJ1sk42uokly/ER16pidrOm9/glsQvbmz3DIZzW33ielTjcu9td2UGyYQKF9tZ00Bg5SbEnPuF9PqkiZWbzBJqGZ/w6grQARs286CASh6Sg5Ykm0r/XQGER/zYOEhOxbjuLJ5SLIpjff6/ZbsF76X/FPZnwz6gYPrKPWm8CU/btS0EQbdHD6MROLw2yWeRBeILonJUS+71X8O/7Om1Le/N+4g5zrQshVs7z8+WFTq8J3yOjE1645Eze3MmDsAAbBFc+436g18kCnFUsSX2PMPBRo8bkgr52N0tSl9jeBeVFnunFUUUtGoU7b4c5CwXSrd334qrg1h2nrOxIBjfbhc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB5884.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFQ0QkQwUTNBNWdYMHZTS0EvTGt0NUVVNkNHaTF6QkErTGlXTzRRRTNTb3dh?=
 =?utf-8?B?TkJrOElCWWJnMFViYzBadFRkaTZjemQrUVJxZS82UCtRODhFcGxIV2V5TUdG?=
 =?utf-8?B?TFlkOUdmNTRDeWo3cCsvemZpRnAwWWltam4vazZSRHl0Q0tSNW9rclJzUHhl?=
 =?utf-8?B?WjU5NDU1bVdubTJRMnNGZXFySXd3Nk1NTUJFWVBCc3hwblY5alBVSEdaUk4r?=
 =?utf-8?B?OEFQbkF6NW1GZUgzazYzUE1jTXdWZGJtemRyejFTV1JNZnhmcENYYjVwYXUv?=
 =?utf-8?B?amlVNkE4Q2l2UlBUenRGL0hnWXhyUDFFSVdmSGdoTC9DWTFUWTMzbXBVYk12?=
 =?utf-8?B?ME1hZzRzQW5qaklyL3IzdC9kcS9PVExFMXZhYVQvZW83WWI5OXo2ckU4cnFB?=
 =?utf-8?B?bzNpSnFMT0RYdE5HdFRGQ2Z6dDhmakJVN0ZHMitLaldEajBHc1JKZGZ3Nkoz?=
 =?utf-8?B?T1lFelU3eHc4SmhOQlRFTGgwQ3BGbHVPWC85MFJXOXlIbFM1UngwL3BFZy9j?=
 =?utf-8?B?VW96TjFIS1JPS2JDMmhxUmE5Yi9ScEVrOHBoYmwvV2o5SG1ZYXhsaU5OMFdN?=
 =?utf-8?B?Y09PN2hlZmVYQUJVeDE4c2o0cytoQkRSMGVMNFRLSkNCaU1zRVYrUVlMV1Vs?=
 =?utf-8?B?WUgzSkFqVHh1WFUxTFppcEZza1JHdElEM2ZUcjdpdFR0TU1EbzQrc3k2bW10?=
 =?utf-8?B?OG9vVERpK1BvcGlUeG9ZN2RnM3c5SXlOYU8reU93ckF2WHFnSDVtd3EvMERR?=
 =?utf-8?B?Z0NkckpDaG5iMnlJUDBCenRaVkVZbzE0N2oxakxKTEExU2Q5MC81NU1FS0VC?=
 =?utf-8?B?YXF1VE5CZ2NIU1NLZHhheXhWVHNqT1k4SFlLOW53cWxwVTVIK3ZDNzYwTlFx?=
 =?utf-8?B?bWdEMmxNRHQvbFBsZjFtKzhlWEhyYnlnZy9QV3p4cnNUaTVaMXRkck92NGtm?=
 =?utf-8?B?a29ncDdFOXVOMTZndk9yME96SkRXc1plbGk1NGhDZDlyZHFJdEpId1YrcEZ0?=
 =?utf-8?B?WHhFZ1lTYVExQnpocG4rdjJRNHVISHk5bmNDZXFjRVB5R0hEY0VxWENNVklS?=
 =?utf-8?B?OEhQVEJTZEgrMldSbUlocXU3TlBWNmZOMUFRTmVyQ0hOYllvaGRnR2RYYkNk?=
 =?utf-8?B?K2V1TUIrMDREQjhqbDMvdE1UdElETjlQdndlazloNis2U0pxM1ZLbkllaDhH?=
 =?utf-8?B?WWFZQmZzZ3FrTmJsYnZSYU9PL2Z3eVdpU2svS2M5U0RtOG5PQ0pvc2FCdUJL?=
 =?utf-8?B?ajZHYlBNZUF6SGdueUFNNlNMZFRMR01TSlI0M1A3cnZGVFIyQUJpWkdrQ09M?=
 =?utf-8?B?YjUyemttN01GbEdOZnhIeWpzSHQxQTBxT1RJTmc0UHVZUXQ3NXJQYjdyWmFt?=
 =?utf-8?B?U0FySjdtc2RoWk9Kd0NPclBRcmtGdFVNaFdCcmhjTjd6ZGVKdTV4RlYrOWUy?=
 =?utf-8?B?Sk9KMHo1WEQxTktlQkl1Q2ZYSkxyYlovQkw1QWVHQU9qOXZlaCsxMUtFTFMv?=
 =?utf-8?B?MDlyN1NvZ1BNY1VKV04wRjFXaHNtREllcm85NVlDajA1MWlFdm91alFyMDZp?=
 =?utf-8?B?TzZFc0RMR3djcDVaOEZ1YnVCaHVWS2x3VlZnTXRQRlVBZVNWa0hJZU1GU0o4?=
 =?utf-8?B?YXlYRkJlS0E3OUFhZHB6WFdVYUwvd20wd2ZsakZSeW1JSDltM0VjZFdhUzk1?=
 =?utf-8?B?Vm4xcjRvY2FRb0Jwc2t5Z1FpaGRML3ZZNWJVVWFiRVFwZzF6Q1Zha0FzQ2N6?=
 =?utf-8?B?ZFFQUjJOcVoyRXdVM0lwWkFjaWZ1V2VDUUZGcElQb0pPYm5MMGRKcDZxb1dO?=
 =?utf-8?B?TnFXcmtydmVhUy84cjZ5cEZpQVV3TitFSGcvdmI5KzVpSkNCejNHTXlSb0Vi?=
 =?utf-8?B?NDc5dVl6MUdhRC93V1U3ZUZmVElJYk9iVWk2aW1oQ0FtQ0x0cXFEWlFZV0Rs?=
 =?utf-8?B?SHIzbUcvdXdqbWRLSFBjb2pIUjhBTlI4RHNCRDgxSi95QUZleDlhTlcrQlVX?=
 =?utf-8?B?ZUR5YjhZc2hXNFhxdk9UWXVnWEQrQy9GZkYvZnpaOWxiM0tsOE1sOTdXVk9D?=
 =?utf-8?B?eEU0MDNORnBVemEyaXR1bVFlS1BLWTg3dFhrWVBQeEtHQnV2cVRFbWdnNnV5?=
 =?utf-8?B?Ymd4Z0p4cG43MkdUb2JaempGV2Zza1FadHZnUHo4WS93aVB0YkR1N093R0Qv?=
 =?utf-8?B?bDFzQlltVGxmUkRtQ2h4bjYxVUY0V3dvVVZJam9aeE5yVnBRbTZHdldKbzEx?=
 =?utf-8?B?dUpPbFdIbTBybEREd3R0alo4QXZMOEw0UVZ1SnFGNElzYTJ0SE4yb2RDdW1n?=
 =?utf-8?B?RHdlNWNXOFNZdnF0aW4yUlhGOElMTnBrNkNRM1pncHdKVW12dmUvSTlQZnJW?=
 =?utf-8?Q?rBdjHluT81DZO3Jq1OVFZz82ChtfFdWcKX1Ha?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF41CCDE5C30BE43B7DC2DEBDE6CBA6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: badakan.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB5884.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a58d25-3a93-4928-8437-08df0f1fc981
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 09:42:10.8602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa7da099-f397-4aab-963d-9f75f80577ad
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: po4E4t8vTDfAAACwvjAyGOnf+sSsHO51xjI4779h3ntDq5pt4QPrbj92i/uxzw/q97eCTvli1S0nNkULV8eDPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11566

T24gOS8xMC8yNiAxMDo1NiBBTSwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6DQo+IFRoYW5rcyBm
b3IgdGhlIHJlcG9ydC4gSGF2ZSB5b3Ugc2VlbiBvciBtYXliZSBldmVuIHRyaWVkIGFwcGx5aW5n
DQo+ICJtZWRpYTogaXB1LWJyaWRnZTogZG8gbm90IHVzZSB0aGUgQ1ZTIGRldmljZSBsb29rdXAg
Zm9yIElWU0MiLCB3aGljaA0KPiBmaXhlcyBhIHByb2JsZW0gd2l0aCB0aGUgY29tbWl0IHlvdSBt
ZW50aW9uZWQgYW5kIHNvdW5kcyBzb21ld2hhdA0KPiByZWxhdGVkIHRvIG15IChidXQgSSBvbmx5
IGxvb2tlZCBicmllZmx5KToNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTAy
MjExNTI0LjU1NzItMS1ndm96ZG9kZXJAZ21haWwuY29tLw0KPg0KPiBDaWFvLCBUaG9yc3Rlbg0K
DQpIaSBUaG9yc3RlbiwNCg0KTm8sIEkgaGFkIG1pc3NlZCBpdCwgdGhhbmtzLiBTZXJnZXkncyBh
bmFseXNpcyBtYXRjaGVzIG1pbmUgYW5kIGhpcw0KbWFjaGluZSBoYXMgdGhlIHNhbWUgSVZTQyAo
SU5UQzEwQ0YpIGFuZCBzZW5zb3IgKG92MDJjMTApLCBzbyBteSByZXBvcnQNCmlzIGEgZHVwbGlj
YXRlIG9mIGhpcy4gSWYgYSBUZXN0ZWQtYnkgb24gYSBzZWNvbmQgbWFjaGluZSBoZWxwcywgSSBj
YW4NCnRyeSB2MyBvbiBteSBYUFMgMTQgOTQ0MC4NCg0KTWFydGluDQo=
