Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F323EAB3
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 00:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787533151; cv=fail; b=sLsKybI/DKWGthz1xmT2y5VIsFeHWlPrKIH4nUJKKzL/Ryiu8uuGbe1agYGNKhxi2qmkV0FvMbFQTZT5uwyyyP+YaUnDSd+T1QubJRfR9C9iYGp1JTtR9MGLfspOjon5qpkZBqet2x9/HBVVkYl/IG3xqIMfhO3rhD8a6ljhBTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787533151; c=relaxed/simple;
	bh=y/HrTk6Yuz3nWsHApueRFUU73UQZzSjvws22kgpuVGI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s+AtlZjyrv9rv1XeFSfMDjaSKS/+HcVZz/7ZPqEIr6a83tbJoz5ufY49Yh/pDLTS/eTNJliamqr7d0MMg6pkSHu6XgDg51bBCRmUejuU4MRykfm+EW1UdYZJvLgC0kmvOnBqyCF0N87CpClgF5CstyYIR0jZCQE53q4dB9JqJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=IZmKWD42; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="IZmKWD42"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M28F1g5cuYyTM1FGWcAa64AX3oETEGuQv0tPrd5Q2+ZTRJ5gK4EmZPM3R2fUCA2QXtk8GvTCl5X/1wUi63UEoRHjmx6hfYmEgGEY4qRCXUDEX5NmNa0pqAfWng4c2nZa+jjufhRcuzDwi+DeP+wv/F/pAncr8UfU18ynnS8vgYBY9DZ/D99OrRaYC0LBTdnynAZFvAkryWhG53zoUAOtpsx9SKtZYpRB+96zvey9IuNCgjCYL+cgrkuJPO4VXyUIPkWHxW/wVo9wMDgb9+UcBVW6UOVo2PUp1c1fUc/uraHV+pP49GZrWDywZyItgXGdJyKdg25AvX9EqNdy9Dg61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/HrTk6Yuz3nWsHApueRFUU73UQZzSjvws22kgpuVGI=;
 b=upV0YoNP3DHbKPDFPfIthTzgPYeM1qC4pzv6mNssslrMVd8O00miMYfFfLQTUmCurRhjN2bo6298v/JXWVByAKDevfTc+5MGBbjqDwOXIUaOa3T1ZhDn1PCrzxtKCiKtJJqx9oXi/mW96rvGWRna78z1Wy/B7FdYOfUeJ7iqT551dr5Vn9/FRuLDGDeEvxxJSABngyP6zb5VZxvJ9u/u/ovIxhptIXc4lsRwq5TuuT1Lot9qeKBAd/29xz5ILi9mB6Unuml6cwRkNYwtiDIZIYRbidbpqzzDP8Na0LLnZaght1FFhmGrampKcXkyt+F3JVpxoMSNysDKBDgrOgQGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/HrTk6Yuz3nWsHApueRFUU73UQZzSjvws22kgpuVGI=;
 b=IZmKWD42pYkgKOhTJWG1QlKN3LaH0YI4fSUTp3GzW394JuZGf3s6MnjCxiTsv/gTaoZsw4drtD7/e25MXL7hMV6adE3hROtYJH6E8klmJd6KhpGCiKIYVtHHo860IH2w34Up3j+655GMYrc11u+4TdXeiPK+DYnEUxwwzCjsNjr1NhdDrlJ0i/meBx2TwAelD+Gv6FghZ0L3Yvk6h3OD7nHyfw6OFVogFYvOlgCyoDnwxALEN1jV7I2u1tcvU9PqxYhhNfIeBYX3G1AQ83f50gK95xVrdsMeZwB5eOrMLgbe9NYC2+/mmJb+2pIACNXXha5vMIhKhmcEolrFK0V5MA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by PUZPR06MB5747.apcprd06.prod.outlook.com (2603:1096:301:f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 00:59:03 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2%4]) with mapi id 15.21.0339.007; Mon, 24 Aug 2026
 00:59:03 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Thomas Gleixner
	<tglx@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: RE: [PATCH] ARM: Restore get_cycles() return value
Thread-Topic: [PATCH] ARM: Restore get_cycles() return value
Thread-Index: AQHdMIPMkJbROwj+zUK+8D2wbssZ47arlr2AgADPoZA=
Date: Mon, 24 Aug 2026 00:59:03 +0000
Message-ID:
 <TY2PPF5CB9A1BE63A0BE5986D8BBFB42D91F2A02@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
 <092cc12c-0b64-4352-89ad-7afc824552b1@leemhuis.info>
In-Reply-To: <092cc12c-0b64-4352-89ad-7afc824552b1@leemhuis.info>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|PUZPR06MB5747:EE_
x-ms-office365-filtering-correlation-id: 2ef6b8e1-920e-44d0-742f-08df017ae40e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 OKJ5ACI0i5JPB54ZZekBYN0McOBl/DWg8pnK98QwoIC3flgrLF5A8H6nIKvDQwJF5MnPmFN3A8vNhKMzXBEDZGuQV7YFWNyJr/Gfia3pmWykyeg7hAA5zczOQ1U13Wn4Obve9R11TmOEdDOkDUCevWe1YmtNQpbmVmGz/rArVJmWB3P2IKLaR+0a5FOHelb2JkJotG47wGZ+GtscLWtTcq8R3JB15CsH4Ivj4eS1ghNToH6ejDASETGilRwj4NqT8fzNeuRrFQCaKigx8S5BEUalFbrtOpgRQJSUqpQKTw5ExGgjiQnLLhUQBtkVDVoy5DoldHlw7cnGCIgchDeGHtJY3NaCZZ8nIJHTIca1WGDGw5mcAYTY1paJIMd/srKXWNVr7I++tjYKvU+2g6P7MiNxyi+rYj2xQ/Qwcb3HwNI+e/ywYeidkR4FO8OefcwRvwAF1Wa77d6coMyMAiOPIZ+5tVxsarIJPHwhOsf9KvgeXL6y3YuSV0MoCfnQCOFU/j8+8dbxFNEuUyUDc7/ekLhanL6UwS8+8YGSpYo9L7RDCt1a/i7nKK7NRdCYd9CZrF3L/FQUlZZW4yrGwB6nAngPAxJtj77OBTP8c4rGZ1cp8MQTtX+NqOm3ppZOzYw20FGaNeXyQIPjqbL90atNgf6O0n9HZ/QcMQ5wBs0saEKbQKElsI8SPQ32vgBl+V5xHDgCFXwDyumTtdxqb0hIAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmNQV1VIMFRmTmtIUitaYkR1UjdPeFBYT3B3UzlHUUMvZmozVFNoeDd3djVE?=
 =?utf-8?B?N0dRUXYvOVByYTdWNUFkeGIwK0NQUy9QYkFKdHFnRkVBQUNEdTZjL0tLWXJT?=
 =?utf-8?B?TGNrRHQwdkdvTi9ZM2ZxOFlRK1lHbUJhMlM2bVlhVytsRDBETnBFKzBRZUZy?=
 =?utf-8?B?Wkt2OFdJZlRoblZ2NzE0SEJkV0w4UnJkbVYweFpCbjJjQmF0bElmaXFIcnAw?=
 =?utf-8?B?cG1IYzk0eVd6eUJsRjh3TEZ3OXg1YXg3aFFadlFLRWJ0MVZSOFdhcXdYdDBL?=
 =?utf-8?B?biszNEQzU1Arc0twWTZoeGhnTncxQ0tDZ3JsM25mVDArNHZRMHZxQmlYVGlk?=
 =?utf-8?B?NDVlak0zNnVKRGUwN252UmpwSGYwbXA5Y3JqZ3B3V1hMUjByY0ZtMUFZcTQ0?=
 =?utf-8?B?cEt2OVJ2NlJLNFJkYy9PNERKWEtQZ1RKZGZLV21yeUJLcTR0T25rZEFaOGNM?=
 =?utf-8?B?WEZBRFVCRlh1b2k5V0YrZDF0WjZuNk9CZmhNdnBlVzltSUpvYUNISXpMU004?=
 =?utf-8?B?NFFuTG84OW5XN2hqT0FKam1PeDEvbHhjekR6QlE0dWl4dnFkdG8zQkd3TWh6?=
 =?utf-8?B?ckQ5WW1BeXdOSU5lenBkMnBZaGpndjFGRmg1a2VEL0Y1M0paaDU0MkxUSUVM?=
 =?utf-8?B?QTR3VnI2K2c5dmdWdEpPOC9uYW9hVDl2QVl6Z1JXS29UMVlZRjZEa3NEd2hH?=
 =?utf-8?B?dDM2eUYrS1EvNkNRSXkwd3JNTVI5UWNoNFkrMmRuS3pId2JIemtRR0ExUmFP?=
 =?utf-8?B?RXJOT01Nc1NVUzFqZTNwenIxUGxZcHE1Szgxb3ZRd1pJa09WMzdiQ1Y0NnJx?=
 =?utf-8?B?QWdERXZ3YUNGUjF6Lzh1WkJSTnRTdnhEY2piZTNPY2NDTGo3MmRhbzBVOHNC?=
 =?utf-8?B?NnE0R3lXbU1UNzkrRG9VS2o5T3dHbW9iUnBHZjFaRHpTQWJ4SzBWbnNxK3Bh?=
 =?utf-8?B?TXA5UHoybmJDRS9XYllsSjBRQW5udFBzbXlYU3dhVUhRSk5SU0d0Wk44Z3pi?=
 =?utf-8?B?ZlJoTXZOYzZBSUoydmcxS3hvQmxyeUQzTDU2WlhaQ3F4T1gyaG5XUDBXYlZB?=
 =?utf-8?B?RGpGWHhmWlpIVjI5QkpvS2IzaUNCTWd6R29vWFNjQWdreFFUbnE0LzVkcEdY?=
 =?utf-8?B?YmZWblVuVXpodkpIM21SakxsdXg5dGFNekZLUUM1SUJHM3I3UGZUaittWkNH?=
 =?utf-8?B?WmRmYWV4TDIyZDZtYXp6V1dvbnR0bnlNQlZmUzY3WUNxVndFZXhtdjVscVN0?=
 =?utf-8?B?MHBadUsrRDRZOTJYLzFsTmVXWTI3TVhvSzBaa05EcVZyM0RGK3RNWGhGTDVF?=
 =?utf-8?B?Ym1SeUdpSWg2blFUd3grVU5sNkd1dkJmUnhGVHpxRTQ3QmNhMU1QdzJpcW05?=
 =?utf-8?B?bGZRc1lHTXJZb3dNaW1wZ211TG5OWmZ5TDZsMnhWSk9LS1FDRzJqaldMU2Rh?=
 =?utf-8?B?bThGdHhRR1ozV09icFYzb1RZd3prcDUrTEFmeFNDVE9aMm0vY0ZkbGRuZGc2?=
 =?utf-8?B?TmdPUGlQVE4rcXNVTmVic1ljQ2pkbDdHVHowM0F1Y3d1WnBrNnpoSnd1dWQ5?=
 =?utf-8?B?SVkwQXZJc0VVMCtQWSt6bk8vcThjZTlmWTRSU0lXVHhTcGJ2N3BmNzZiQTlK?=
 =?utf-8?B?NHNZaElscThjcmpZTG55RUl4aFN0OVA2VDB6SUtBMERFTzJ6L1RkVEduS2Vs?=
 =?utf-8?B?ODJnRmRLM2s2bTkwdytlbGM4MFdvNXlITDQya0V2TVljd3VzM3V5MEMyOCtu?=
 =?utf-8?B?ZVBKLzN6Mk9uY0JJL3Z6WGE0SmozcGRZNW1QazhUdTdCK3cxRkM0WWwvbG5m?=
 =?utf-8?B?dGZtM3hpZHp1R29iak5sQTJNSis0UWZXUVJlWmJ6Z3JGS0ZtUWdwOHRseWVj?=
 =?utf-8?B?dmJUVDl3UWRkbXJSVGs4NGtEV2g3VEQzcjFiQWtBbi9FUldOOHVHRElrMVpM?=
 =?utf-8?B?d0hVUVNlSmxBRTNoZDFlWGJGRk1xWXFoRy9XbFR4RTd6TWhnWXd0OFdMRDBH?=
 =?utf-8?B?bEtrNVppZ3VvVHBlNXZSOUZwME5PR3A4UHB4OWF0cGg0ZkM5YUdOOXhRMDgx?=
 =?utf-8?B?MnI0RTA4d3JVVE1NY1hkUGE1MFBjM0tRbTk3NndYbTg1ZDY0NktiUWM5UTNs?=
 =?utf-8?B?eEgwcTlXdmV0Z0JGWWVtQ1hleXJnUUcwTjBJcytidFk1azRvWTJYT3F6RC9w?=
 =?utf-8?B?ZGRsa2pyUytna1hEbFUrMVdudjBOTHZjQ1hLa2Jod3RSRkRuU3JyMWdyV2xY?=
 =?utf-8?B?S01CSkNCUm55NDNYZ1ZDVFNXdjYrWnJINHR6UDNXeEtWa0VRSWNUbW1jTmNI?=
 =?utf-8?B?MEljS0pMTlFwQmVnaDczc2R3ZC9wb0JtamEvSVA1Y3RsalJ6YmhWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef6b8e1-920e-44d0-742f-08df017ae40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 00:59:03.3498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GXAFmDCNmuGObfWJFBeQTJ5sgL5nR2KXlBwG0e+U7iLy1yp646m2ZCz4xAsPfQs1+K3fWdv51n47isy8q3FcpK+/NDg2A0Gur0snGJIhxB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5747

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBBUk06IFJlc3RvcmUgZ2V0X2N5Y2xlcygpIHJldHVybiB2
YWx1ZQ0KPiANCj4gT24gOC8yMC8yNiAxMToxMCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IHJlYWRf
Y3VycmVudF90aW1lcigpIHJldHVybmVkIDAgb24gc3VjY2Vzcywgc28gdGhlIGdldF9jeWNsZXMo
KQ0KPiA+IHRlcm5hcnkgeWllbGRlZCB0aGUgY3ljbGUgY291bnQgb24gc3VjY2VzcyBhbmQgMCBv
biBmYWlsdXJlLg0KPiA+IGRlbGF5X3JlYWRfdGltZXIoKSByZXR1cm5zIHRydWUgb24gc3VjY2Vz
cywgYnV0IHRoZSB0ZXJuYXJ5IHdhcyBsZWZ0DQo+ID4gYWxvbmUsIHNvIGdldF9jeWNsZXMoKSBu
b3cgeWllbGRzIDAgb24gc3VjY2VzcyBhbmQgYW4gdW5pbml0aWFsaXNlZCB2YXJpYWJsZQ0KPiBv
biBmYWlsdXJlLg0KPiANCj4gRm9yIHRoZSByZWNvcmQgYW5kIHRob3NlIHRoYXQgaGF2ZW4ndCBz
ZWVuIHRoaXMgeWV0OiB0aGlzIGFmYWljcyB3YXMgZGlzY3Vzc2VkDQo+IGVhcmxpZXIgYWxyZWFk
eSBhbmQgZml4ZWQgdXBzdHJlYW0gYnkgZTFlM2EwYWI2OWM2NGUgKCJBUk06DQo+IEZpeCBnZXRf
Y3ljbGVzKCkgYWZ0ZXIgZGVsYXlfcmVhZF90aW1lcigpIGNvbnZlcnNpb24iKS4NCj4gDQo+IENp
YW8sIFRob3JzdGVuDQpUaGFua3MgdGhlIGluZm9ybWF0aW9uLg0KDQpSeWFuLiANCg==
