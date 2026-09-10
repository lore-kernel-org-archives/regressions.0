Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023114.outbound.protection.outlook.com [40.107.162.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E63CF21A
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029670; cv=fail; b=l8rPKG6tmjI9RdCE9ZkJZfVBoUAIkWtGhXloh0LQBXxL8PAuhgLCvcZjoQ590uxaw42VFUDkPzChRvhex/n3mcUXG9U6ynZgjyMSq7DErJSP1UV3beXCOkZQVSGEiNA1B6KLV5otswMC/OJCrrWFiIDmjNEFEVa6rIcrQVav1uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029670; c=relaxed/simple;
	bh=QM1HqEsSrP5QqyL+69Cg4Waq8XX/fxEUq5bB+f9T1rk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GnF7+x2J+7eS5H9vgQeCvHFsdpCG6MKeZbfhMPXJU40w5ajexVLffPtJNyt3c9FvGUcJUKfMXhzRvaQgNoxwMfBYf+EI9uPG2IunmuazfnOWUJg4Iqyf9mqmt0bpUbnBWvhA5zbO2sUI0bvegpEDfuDPf5lnE3NVYWujUBT6W3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=badakan.com; spf=pass smtp.mailfrom=badakan.com; dkim=pass (1024-bit key) header.d=badakan.com header.i=@badakan.com header.b=R4i0qNIq; arc=fail smtp.client-ip=40.107.162.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=badakan.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=badakan.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=badakan.com header.i=@badakan.com header.b="R4i0qNIq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l16/y0iXwg/vxt3Z89UGcd7psS3FZcalcneWvvm1JbECokOA/8no41C7ilNk7jb40lRxXH2RV32y5pjj0vTmpkpC9fYhiAIqVkYiDnuxuRA5M7j4fO5zCiPDNh53Wvs7fVP30A5PQpRCWn+gBMpC5mbt+1+ZVcEdIxn14pJYZUdWb9/RTksPra84YGP//xLRFdoAZhe2j8g6ple7DweB+rrfIvxRwzvOMwB3s5DPZYwJ8znPW48Vxu5OMTm8Br7Sc55sHVmqIRHYo6tZoFZViR7WNBrKHQRx1ENgIeZU9FKFXE0hAxzha+MPWhBFaGSZshggL60G/yDsFQEkDxgdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM1HqEsSrP5QqyL+69Cg4Waq8XX/fxEUq5bB+f9T1rk=;
 b=Q7TsggpqpX3QuUZreXEK88fjg2+webI6sA7TIAodPcWzwBWja0DAAVfDMpmBwX6zzjjc+vk3mfBlUT4c3uZN6UDMuH73kfpvm9u0xF0zzMZm1UKv5UpcwA6cB/HMeshfrSHZCGxmqEtnid8uU2GuguxSaB1/FIROySmaSRXF0ta7x1HvtUoaJkcNG5GIxPHuNB01jqEbUM+mKD8SMWg0NKkoV+KtSnpvxFYA2UpUvQ/VwObUppJgCrDQZAiDp6sju7w5ouopj3lHIt189eCuapLUG29pTpJPENDXUmW5c6y3guKEgWob6Z2zwjUwtW54VNovYX07zrbIIeu4VwYK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=badakan.com; dmarc=pass action=none header.from=badakan.com;
 dkim=pass header.d=badakan.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=badakan.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM1HqEsSrP5QqyL+69Cg4Waq8XX/fxEUq5bB+f9T1rk=;
 b=R4i0qNIqwOVsbAz9G4l1Dx5ZHyr49VGhrZKRQIlpgIz9BRF3lp2AO3a1Q3QT41G78f+MEuXd651jrvOhFYmVl0qH0ST119oenMI9uSEnTLUPZqntFGlm2Dsj7OwH3itlab7syNYzjf0Dfyw+zoFfTXrNtxjzhysswDz1LlwP0z0=
Received: from DBBPR08MB5884.eurprd08.prod.outlook.com (2603:10a6:10:1f6::11)
 by DB5PR08MB10256.eurprd08.prod.outlook.com (2603:10a6:10:4aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 08:41:02 +0000
Received: from DBBPR08MB5884.eurprd08.prod.outlook.com
 ([fe80::8812:508:4502:633f]) by DBBPR08MB5884.eurprd08.prod.outlook.com
 ([fe80::8812:508:4502:633f%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:41:02 +0000
From: Martin Jeanne <martin@badakan.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
CC: Miguel Vadillo <miguel.vadillo@intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Lixu Zhang <lixu.zhang@intel.com>
Subject: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes since
 v7.2 (CVS fallback returns the IVSC platform device)
Thread-Topic: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes
 since v7.2 (CVS fallback returns the IVSC platform device)
Thread-Index: AQHdQQAcIQOG9eb+dkyrISKXJKdqyg==
Date: Thu, 10 Sep 2026 08:41:02 +0000
Message-ID: <2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=badakan.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR08MB5884:EE_|DB5PR08MB10256:EE_
x-ms-office365-filtering-correlation-id: 600ac296-ec8e-4730-d97b-08df0f173ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10070799003|10067099003|56012099006|3023799007|18002099003|38070700021;
x-microsoft-antispam-message-info:
 GuebpoEorACIZ4v5TRwd/0P/MbQqbDVUPzZz+HjYKIzNNgrfMwcgE/CF20/UZ1X3ZIHxdc40VUc4/EKPqSL07dxxDxliZDLgseP2sQZzp5ngwvH8TsB//PG56A6ol6B7VCEJY5I5ElVxVdCuSI7sWyhnWOL4sYDFXqG+8tnC+EKx3nNIFMwD+5yyRABq5N1QbshF9hKkDCbCFbdCJ6084EqGeLhV/U1EiUpQSLQNJchLGfGjAkQuLLMA9vELhVyyXNfSNotCnfn9hIaNyQhbV+J0tsYXBQNh2awe+/CrhazVInwyVwdqnRORGSolKVnZkNLtGQVJsyw1HWcn03mzagcM+y1oqqKFOBsgC8NTciFP2U9Tnil4CsfA/4xcmZ/h0kjItLEY3+RaMUlf+q19KwDg/Mu5jFdfQxQa8uj0u4fvPok0tYOzybh3MaUimnk643xciDkuFqdoOADaB6AanuqLjg/k0pnyeEiiGB/QRBKSr+tIKJzEmsPzhy8xtgd3JYJjQqoupTezSCnDenbKMvl6ohmnqP+7aZTk2YU6wISmiGUqEKffseBl/eFJAbTeOowF1rA9IX+CNPLGCQaA66MstaJdtuR3JgQRQMefekSNXAXFvK3Qig46obqkBYdch2lRHSYMtH01KXoys3UJCn+6xSr7j99SD2dGovgC2qpaIrcHyGwdrTVIFt7qS9h30WhmC8U2bQIzoG/dHhpy1g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB5884.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(10067099003)(56012099006)(3023799007)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkZCbWl2MEVlS2lIQTJ0ODNUYjJON05weEtPRUJDdWtXTUNaaUpTMThPSmRX?=
 =?utf-8?B?UlhRYkZpU1JXY0U5bnZScWZ1Mk5jTkp5NW9EWk5CbDJNdHY5MUx0MHc2WkFL?=
 =?utf-8?B?ZUhxaTdDV1IzL2NTZllqTzhUMk1uT1hIYitTVDVrUGl0dnVmaUVqTm80TUs3?=
 =?utf-8?B?NWpwMk9rSC9teWFSb0hGenRhUjJIM3h4TmwwTGg0QXBiY1NXWjJUK3d4NWQ5?=
 =?utf-8?B?VkZZVEQ1ZzkvK2twOUhweDZGcVV2cVNYWTROMURqQVZwamZBTUh5T01RMDZX?=
 =?utf-8?B?ZUJjTEsvV004eDQrb0d3eWdEeUl4UEd4eFYvbE8wTUx6cHNtaWViWjhUQ1Y1?=
 =?utf-8?B?VTVwRnBDOUl6a21oTjVSQzk0SzlMVmdVZjk4WHlYMUdmdWw4dGw4T3lieFEx?=
 =?utf-8?B?SjlVckJxR3diUlZKbk1EUVZNVnluV1RvRTF0U0o0a1cvVnREeHovMzF2V04v?=
 =?utf-8?B?SE1aQW1oNUVmaFhvNlhoREVzMXRWSHJvaWt1b1M0R0M1M3FMQzFoenNxWjdz?=
 =?utf-8?B?Rk1vUGJ1dlozVWduNENqY3FoYXRIVktzdjBDTk9vUmM0SEtrSUxoYkY0c1Bi?=
 =?utf-8?B?Sy9aZStzMHgyMS8zUWZMZnBBdklsanNSanNVMndDaVh3SHN6RStOVCt0WWpL?=
 =?utf-8?B?T3podW9jaWQ1bUR1aDg4QXJTWkxsNGxka2d2b3FnTnBZTDVQbnBXNjBERW05?=
 =?utf-8?B?MWhTdTNVMzRtTitlcE50Y3IxOHptWGpvVUlic0hzSEwyUHJ2dU5kdklPUEF0?=
 =?utf-8?B?VGlXSTh0S0F5ZTZlQWJGOFpjV1JoSGFjcHROWUdiaU5venNnbWc3Q3JSNXhu?=
 =?utf-8?B?aHJVY3kwY1FrUTNJVW1XYmRqSmtKZjVkVmE2Q2toK3lLZmRCOFVIdzcxQ2xD?=
 =?utf-8?B?OVFmR0dUWmlsOGxRbWMxVTFrc1dTWlkyVTByaWVXVTEyUFE4dktvMU1oYnV3?=
 =?utf-8?B?SUpSUkNySkR6OUYwNlhXaUt5SkJYazF4SDUzeTI3RnU5RkdiUHJZVWNDK3Bi?=
 =?utf-8?B?cE1HdVFQN0FMOUE5SEk2blhiVlBVR21vR1YrczYvbm9PbFprMmFDQlFqUzVC?=
 =?utf-8?B?ZW1Ma3dBVk9tNUV6MUl2bk15SUJYNXBIZGFEblNhR3J5SHB3L2NkdDZPMjBE?=
 =?utf-8?B?SUlsSGZzcEJtQUw3ZjN5NW9ZSjI4bC9tTDFTeTg2TGhYTnE3bmt0NityM0FJ?=
 =?utf-8?B?WGVEdFljci8rZFhPWWlONkhvWGpyYi9GMWkzOWRVS1hpc1kxQXpNU21LTVVu?=
 =?utf-8?B?SXBYaUxjVVlnQUYvZHl4cGJGc1NXYVg4eGFkRnczU2tGeTY5ZzdKNUFVRll4?=
 =?utf-8?B?b3JmV3RKRTF5NUpkd0dQL1dHU2pjbXROd2pNb3ZYTmlTVC9Dd1hkVy9mdHIy?=
 =?utf-8?B?cStMY3VWcFdUbjUxZWVjOFFFNjZVcU1QMFBadTBhMmtVY1duQWdRQXVFMTJy?=
 =?utf-8?B?YnFQTDFha21odkRNWmJmRVdjUEhjdGJydGxRWTVRcnN0N0RUMnBDZjhGVXhx?=
 =?utf-8?B?QXZJUE5EMHhQbkN3NHFJMm5QaHFWKzV3Ky9Sb2xhUTVWQ3ZmcHF3bTBSZVVG?=
 =?utf-8?B?RG05VU1xc3BJTmRBRXpLbitSVG5BL3FzcFVRU2tmS0ZnN1VpUHdocEdpUUh1?=
 =?utf-8?B?Z1lreTB1Vkk4WEJuajFJa1QwUTNtY2I5czJNdVRyNGQ0MGdlSTFLeWdmZXU0?=
 =?utf-8?B?dnYwZG90emwxVHpjOHp4ck5wVnJNQUJtU1NaaHFubFlTaXB0dVg1UkYrcHMr?=
 =?utf-8?B?bHJaTk5qcEh6emVyV1REajltRnJubUEzNmpDWmlzTDNnczlLNVB6Rmo0Sk1C?=
 =?utf-8?B?bURzMXA2TUdhdUFOUDR6S1RxcVF1K0FPMFR0d2dvVVNVVFhUalRoVzZlbmt0?=
 =?utf-8?B?RktZS25zQk8zZjI0QnZDQ0hUSmIwZU1wenF6MVhsa0c1WkVXY3hpSmZ6WXhN?=
 =?utf-8?B?Yng5blVVQzVnN1BlSXNNbG9GSmVmaCtqcktwQXp4OUtwU20xeFdtL2k0d3hi?=
 =?utf-8?B?UHFhQUN2UDQyL2JOMDVRVnRPYmt3R0ZRb2w0RlpsMHpmRWYwTy9XQ0plS2x0?=
 =?utf-8?B?MmVNT25DK0FkRW8yaXZBSWM2c2Z3amY5RDJFTytyTHMvcllIYTFzR0tRNHBF?=
 =?utf-8?B?MEdXS2ZBQkgyRWZadGQ4WUh5MklSS2pONmxmMlFBMjB1Z3RZUnJib2pkbTlK?=
 =?utf-8?B?TXNSSHc2a3hSeEw2M1NJRDBrekd6d1FJQWFibzJuaUd0eHFOV252eGF2ckha?=
 =?utf-8?B?REJkWWtrNFhGenNSdEV0QWpRZG9NaVdZL2dRNmVnM3FkZmRpbmhKSm54TDV6?=
 =?utf-8?B?RjFtRHMwZ0owbjZBYXFVbEgwQ1JiTVUwZkJjK0t4aW1NdkdaMXJxem9sTWJa?=
 =?utf-8?Q?/0XiJNvHNr9xm/fHOcSL8BRJ8rS6JSHbbEx8F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41DA42DBC2197F42A93BA88234FA85EF@eurprd08.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 600ac296-ec8e-4730-d97b-08df0f173ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 08:41:02.2069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa7da099-f397-4aab-963d-9f75f80577ad
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bnmw6tXjKbMqtLtXUJcy1FzIQR+YKJHTM/W1vNkhmET69zM6Wiy3mY926sZAZe+kMmwqOmcGY0naVVxoEsrQLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10256

SGksDQoNClNpbmNlIHY3LjIgdGhlIGJ1aWx0LWluIGNhbWVyYSBvZiBteSBEZWxsIFhQUyAxNCA5
NDQwIChNZXRlb3IgTGFrZSwgSVBVNg0KWzgwODY6N2QxOV0sIG92MDJjMTAgc2Vuc29yIGJlaGlu
ZCBhbiBJVlNDLCBBQ1BJIElOVEMxMENGKSBpcyBubyBsb25nZXINCmRldGVjdGVkLiB2Ny4xLjkg
d29ya3MsIDcuMi4zIChBcmNoIExpbnV4IGRpc3RybyBrZXJuZWwpIGRvZXMgbm90LCBvbg0KZXZl
cnkgYm9vdC4NCg0KVGhlIG9ubHkgY2hhbmdlIHRvIHRoaXMgcGF0aCBiZXR3ZWVuIHY3LjEgYW5k
IHY3LjIgaXMNCg0KYzZiMWIzNGI1MDkwICgibWVkaWE6IHBjaTogaW50ZWw6IEFkZCBDVlMgc3Vw
cG9ydCBmb3IgSVBVIGJyaWRnZSBkcml2ZXIiKQ0KDQpCZWZvcmUgaXQsIGlwdV9icmlkZ2VfZ2V0
X2l2c2NfY3NpX2RldigpIHJldHVybmVkIE5VTEwgd2hlbiB0aGUgSVZTQw0KcGxhdGZvcm0gZGV2
aWNlIGV4aXN0ZWQgYnV0IGl0cyBNRUkgQ1NJIGNoaWxkIGhhZCBub3QgYmVlbiBlbnVtZXJhdGVk
IHlldCwNCnNvIGlwdV9icmlkZ2VfaW5pdCgpIGZhaWxlZCB3aXRoIC1FTk9ERVYgYW5kIHRoZSBJ
UFU2IGRyaXZlciBkZWZlcnJlZCBwcm9iZQ0KYW5kIHJldHJpZWQgbGF0ZXIuIHY3LjEuOSBsb2c6
DQoNCmludGVsX3ZzYyBpbnRlbF92c2M6IHNpbGljb24gc3RlcHBpbmcgdmVyc2lvbiBpcyAwOjIN
CnBjaSAwMDAwOjAwOjA1LjA6IGRlZmVycmVkIHByb2JlIHBlbmRpbmc6IGludGVsLWlwdTY6IElQ
VTYgYnJpZGdlIGluaXQgDQpmYWlsZWQNCnBjaSAwMDAwOjAwOjA1LjA6IEZvdW5kIHN1cHBvcnRl
ZCBzZW5zb3IgT1ZUSTAyQzE6MDANCm92MDJjMTAgaTJjLU9WVEkwMkMxOjAwOiBzdXBwbHkgZG92
ZGQgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3INCg0KV2l0aCB0aGUgY29tbWl0LCB0
aGF0IGNhc2Ugbm93IGZhbGxzIHRocm91Z2ggdG8gdGhlIENWUyBmYWxsYmFjazoNCg0KLyogRmFs
bGJhY2sgdG8gcGxhdGZvcm0gYnVzIGZvciBDVlMgZGV2aWNlICovDQpyZXR1cm4gYnVzX2ZpbmRf
ZGV2aWNlX2J5X2FjcGlfZGV2KCZwbGF0Zm9ybV9idXNfdHlwZSwgYWRldik7DQoNCkhlcmUgdGhl
IElWU0MgQUNQSSBkZXZpY2UgaXMgaXRzZWxmIG9uIHRoZSBwbGF0Zm9ybSBidXMNCigvc3lzL2J1
cy9wbGF0Zm9ybS9kZXZpY2VzL0lOVEMxMENGOjAwKSwgc28gdGhlIGZhbGxiYWNrIHJldHVybnMg
aXQsIHRoZQ0KYnJpZGdlIHRha2VzIGl0IGZvciB0aGUgQ1NJIGRldmljZSBhbmQgc3VjY2VlZHMg
aW1tZWRpYXRlbHksIGFuZCB0aGUNCnNvZnR3YXJlIG5vZGVzIGVuZCB1cCBvbiB0aGUgd3Jvbmcg
ZGV2aWNlLiBXaGVuIG1laV9jc2kgcHJvYmVzIHRlbiBzZWNvbmRzDQpsYXRlciBpdCBoYXMgbm8g
Zndub2RlIGFuZCBmYWlscyBoYXJkLiA3LjIuMyBsb2c6DQoNCmludGVsLWlwdTYgMDAwMDowMDow
NS4wOiBGb3VuZCBzdXBwb3J0ZWQgc2Vuc29yIE9WVEkwMkMxOjAwDQppbnRlbC1pcHU2IDAwMDA6
MDA6MDUuMDogQ29ubmVjdGVkIDEgY2FtZXJhcw0KaW50ZWxfdnNjIGludGVsX3ZzYzogc2lsaWNv
biBzdGVwcGluZyB2ZXJzaW9uIGlzIDA6Mg0KaXZzY19jc2kgaW50ZWxfdnNjLTkyMzM1ZmNmLTMy
MDMtNDQ3Mi1hZjkzLTdiNDQ1M2FjMjlkYTogbWVpLWNzaSBwcm9iZWQgDQp3aXRob3V0IGRldmlj
ZSBmd25vZGUhDQptZWkgaW50ZWxfdnNjLTVkYjc2Y2Y2LTBhNjgtNGVkNi05Yjc4LTAzNjE2MzVl
MjQ0NzogZGVmZXJyZWQgcHJvYmUgDQpwZW5kaW5nOiAocmVhc29uIHVua25vd24pDQoNCk5vIGky
Yy1PVlRJMDJDMTowMCBkZXZpY2UgaXMgY3JlYXRlZCBhbmQgbGliY2FtZXJhIHJlcG9ydHMgIk5v
IHNlbnNvciBmb3VuZA0KZm9yIC9kZXYvbWVkaWEwIi4gVGhlIGZ1bmN0aW9uIGlzIHVuY2hhbmdl
ZCBpbiBsaW51eC03LjIueSBhbmQgaW4gbWFzdGVyLg0KDQpJIHRoaW5rIHRoZSBDVlMgZmFsbGJh
Y2sgc2hvdWxkIG9ubHkgYmUgdGFrZW4gd2hlbiBubyBJVlNDIHBsYXRmb3JtIGRldmljZQ0KZXhp
c3RzIGF0IGFsbDogd2hlbiBvbmUgaXMgZm91bmQgYnV0IGl0cyBNRUkgQ1NJIGNoaWxkIGlzIG1p
c3NpbmcsIGtlZXANCnJldHVybmluZyBOVUxMIHNvIHRoZSBJUFUgZHJpdmVyIGRlZmVycyBhcyBi
ZWZvcmUuDQoNCkhhcHB5IHRvIHRlc3QgcGF0Y2hlcy4NCg0KI3JlZ3pib3QgaW50cm9kdWNlZDog
YzZiMWIzNGI1MDkwDQoNCk1hcnRpbiBKZWFubmUNCg==
