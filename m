Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794950264;
	b=Wj5Kf7ZV9h/IaDt/XzegTQSBxDofrmvGSxaq/yEYjH7Ab2xW2iZPbT2b1uN3HPO4PGVS
	 yGyUancslZlyZjvGckkP5Ih71uyXAX7Li3v+VEV1/fQHxpLUMSBukjCLTeCXJJVNJR+kN
	 0v+ijiWt5EOtTUrAwtgcmMBVk6NUBa1Vdl2TGyda0u/BQSj/0Hti1KDm2KnwBH7bRb22L
	 vsxwukV78yOjuStr2NMXJh0t6JlYs5sA5+thmxFMRY0g2M2gEk3/1vgAY2SVRr5wq7qgc
	 Xb6i4i/gkaI6yPylnYZQLGOGa+7MktO7ZAaIlAQ4czWJvbMeaPBf+1DgkOKP7JhPa8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950264;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
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
	bh=8MuQzzEWYrbY1XLHeLhTp4ulOuRp62sgRwL5vQf4PAg=;
	b=Y3uduemSzSwVgzIxeEKhVu7h5Nop+knlBuB2VwwSuoW1wl3dzSfqdzG0MGIgGLFlNq0f
	 jBrFXBk3/IdaZ+pNY2+0sK1P9uo66fCQX3cqZnvsoGYYgBowjIE99NK4w+jk4sPWbfCMi
	 gBdfhhShexKc1wtfi8HN51GINCwpsGQj4zpGkdjK9P0jAkvItiITFQHNQzaUyj2DmIZff
	 OlHeAfpuJ8qISEM2Gai8I0+APzdPGFZLxTpewHdkOqwh9cumeUpVJe86oD7qOvw7c2Yqz
	 /0W+/p05GIsDPNmw0m7s8DcZuhVwYmoZcRsCSjZnrAebuCyuO4S0PToxg5PVj2e/Z6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.com;
	spf=pass smtp.mailfrom=live.com;
	dkim=pass header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=fwdMByN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.11
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012011.outbound.protection.outlook.com [52.103.14.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9874606A32A
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9874606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=fwdMByN0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dESsGN+JSKxZg39UBWDzH5JggMpAdvtC37LBWOmggirnWoBFG4Y2d5c1lykpLkXgurAoG3QGVIpB4hIwsL0cahTAhrX9f5Kxb7AZ3l1A/upNvflRP1hyJ52IRiwR4Nwwfep923nXlaO6rPhVCEEX7m96zDyJ44CYiJG6hw4nJD09bPDripuMz1omGBFMKg5hvN7piEMbwIJguavjmGTuN8tkNLteRF/7D85nwsH9WBMj04QDMt/cqIveMGFUtvKAFetjhbQPo006WLG0yQOrnhLBqdS0rp7pcB0EO3G7gyNe+9CRymlI5Xtwm5z8b8DQXUCoQE6/zXoPZk4AAQ8Paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MuQzzEWYrbY1XLHeLhTp4ulOuRp62sgRwL5vQf4PAg=;
 b=nSabE3g6tTbFmxEbgwqgqANqLE7yvX7KzOvB4Bk1vHQh0ikmC9aKPaq7zRmbGHnUiTChV4zClj9xVfFudEunP/+HvTbTAJVAnJVSydBWVXjC4SbZGL4wxAgWVYzOvvsHn4YE2QHds3IUWTp7AEJS79fCporzej93kcRxVKvT6PBhJZPibV3Titl5GCRuajitrIw1cHIHmexVfZcPDJKxBR5Z4ga0169Z0S9Q2XRao9vPkwapPtTw3IfaoZtcvw3qx7DccAZ6Jxqg6Wo90vmLCETj+qoUDOjNTiVHsQjimdtebbAXIMS+lJb0dFiSiv0/k0FK4SAas0Vq+1iUDQmv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MuQzzEWYrbY1XLHeLhTp4ulOuRp62sgRwL5vQf4PAg=;
 b=fwdMByN0zbVpeyh7HosRILv4J9+/L/XxuJv+RPEcQgcJ5CzdJB16EJ+iaj3qN0GMxWWGEVZhUp9npMyiOZxpSIjGbX/WpbIUAofhERCktWk8bZoVQDIdgt6803g+7UmmbBA15kpD69kge2MA7/ug6xVMaY489crDkcYS16GS9lra/S9UqV1PH2hQmVLwYAEdA8eDknAyRLbgbucBbn7NJr73py/XpJr1En4d27tw3gbjjzxd93qvVz1YvyiIrYv2rLc6j8ZaHmHTAdpyGSgnstChizQ5UGENFFhTKPs8EwqCKJ+UhpUvWXE/GvOKMqtI08aRiQWfWX4+sbm1hAsy8w==
Received: from SA3PR11MB870554.namprd11.prod.outlook.com
 (2603:10b6:806:510::10) by SN7PR11MB8041.namprd11.prod.outlook.com
 (2603:10b6:806:2ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 21:17:41 +0000
Received: from SA3PR11MB870554.namprd11.prod.outlook.com
 ([fe80::57fc:ce0e:773f:1c2d]) by SA3PR11MB870554.namprd11.prod.outlook.com
 ([fe80::57fc:ce0e:773f:1c2d%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:17:41 +0000
From: Lucas Cota <lucasbrunocota@live.com>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Logitech G733 USB audio volume issue since Linux 7.3
Thread-Topic: [REGRESSION] Logitech G733 USB audio volume issue since Linux
 7.3
Thread-Index: AQHddsxv6e8Y3c73YEaHT6/bZ99EqbcyxAMe
Date: Tue, 17 Nov 2026 21:17:40 +0000
Message-ID:
 <SA3PR11MB870554D0B14BDBE05EC72B8B59B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
References:
 <SA3PR11MB87055423D68E21680C47BB55B4B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
In-Reply-To:
 <SA3PR11MB87055423D68E21680C47BB55B4B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
Accept-Language: en-US, pt-BR
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB870554:EE_|SN7PR11MB8041:EE_
x-ms-office365-filtering-correlation-id: ed5e3dde-ca49-4cf0-3211-08df44f036af
x-ms-exchange-slblob-mailprops:
 9qw5+ftluCBM04rZffbgGeDNXPMguI7e/8TmI6uxpXVOdxRwoDgvX6uC7YAjcLtQMyF4C4gK3e28HncvRK4VHYI5UYepzcuwCCV5yOGFejasjabmHJMUODQprVbdVaUT7m++u5YznzxiFHZnHbyATzWIdXHdW31PhaPjZz2tjUJNwZeATYVUKoxNq9D8xIB5T8B6byhCU0Hg0Af8fgycasT8U/pfvvyyFCwPBsgWRMqIXkEINjYrzNhOloRsJtuSe3w8gsw9vzo0d11gXxdNMBh9R5rgeirGfqXAm/42VxCA5zeNZtXkHNiaNVAe8wBTzU8mqHj32NhNVGPGLiV5M0vxGpLRV7VO/411AN+qCI9SV3t3eAeH81yCze9e3oKV0FvdigcW83R9tT2yPJXBD6qKn3ViCtDkSEVxxYOUvG2TIkrILrfCCzwI2ZohqC5U/GwpYGJPdd7fwGFQt+/Ot9OHPLjUX+qAcR5m9rK6bz6m4X+kg2GZOwT+n1BDHRrNF2E/8kxpcSp/n+/Mkgzv+s2jW3UWcXIdJECp6acV8W+y1gZQ+Tcq1/lQG1thKtz9aQ326O6Q/RwL7Y5AtwdRXoHIrmB8u3vPYPz0fDpKmIEVAd1V+zy5zpszW1VFLcgqgKcgH7seif/IBmO0jzUm8ZwvTVZbQAr5XA/Eef33OdcrInqkAXjZJ41tITTOv5TiUxiM4A5vJjE=
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|19110799012|8060799015|8062599012|24021099003|15080799012|15030799006|31061999003|25010399006|12091999003|40105399003|440099028|102099032|3412199025;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fF1JKHwYG3TRf5TnFv0vlh2T/nKKdv+rzOyBiX8WtmQb5UHHY6RtVMcGc5?=
 =?iso-8859-1?Q?yKQHCYIIK1avDZ0w/O/d/YswysmM65IW97BBtMybO2HPCUiEuGJY31ix/5?=
 =?iso-8859-1?Q?e191JkslhzrKiHfypHJGc1OJe1sRu6bkci2JAZ/YGyO+eY3TyUDmBzjmA2?=
 =?iso-8859-1?Q?2d22olw126kBdRq8SfjzIDs/AABWmM64c9WEw2R4S7rCvRuPtjRZlr9XWv?=
 =?iso-8859-1?Q?K+z69l43pvfZVRuAeI1xLLt85Ji9JwxMjrWlYhoOmzln4QtNRnH2eukRid?=
 =?iso-8859-1?Q?53mGYe/dwAp0U11AG+n4qYdUy3qDD921POBxnZ8P7j+CF6SFchyQtJakaI?=
 =?iso-8859-1?Q?ZvDrpmieY4IpU8eQ+DDv/4oAjfV4+27PA8kG9DZAcmDSvJl6iHaVfr+Zyf?=
 =?iso-8859-1?Q?GNFs/We0zNpvimQZcd0ylV9wT+nGBJslL8b/Lf/m/UO2p+wIx7gMEuknos?=
 =?iso-8859-1?Q?q2/y4m8y1a3tohXdpwS4kOeANx/0iGJOPFdE681+FuoNuw8E3PnOw3cSUy?=
 =?iso-8859-1?Q?jFqTXHtN5RnMQP0lSW0R1Qmntu9a+j81XxRQS+bhPoibaOJM8rPcW6En2M?=
 =?iso-8859-1?Q?tafWohDi+jdZESAIqzZyHc/e8j/Ul63owPqJSErwAodptGT4rZeVAnfW1u?=
 =?iso-8859-1?Q?2OUxT+/6od++1gskPSx8w2SByNfKaTyrRLHbOz3qsXHT0rwLxgRpPhtq8W?=
 =?iso-8859-1?Q?KPmInL2KWgTuqsRJ3WNDy01DReNqs4DXoCsGrFesxuzxkJvQjis9gJsJD4?=
 =?iso-8859-1?Q?ap205Xfg7KtTo7MCQSWVRUP3oi4cgchWFk2xbPC8WznKaBUaL5FaK54Hi5?=
 =?iso-8859-1?Q?MEF144CnAwLvZnDNddgB42kVlXQ8+KyEpjdL99pgvEDpD6oyxwuZFlfk8p?=
 =?iso-8859-1?Q?ghGH1IESPYaZCtHDMmnj1ZVAfpZjVw+ZLmLSzGGpkLgAQ9fr0ILtUUAL1Q?=
 =?iso-8859-1?Q?EuLYihIulaxOuu6ngaq9kSMt67itcMsfo6h2BvwupJkKnxKYdhQCWh0Fjc?=
 =?iso-8859-1?Q?+cYTy4ApMP9znhGOSMzf/QhmJlyhext/afBncf?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pkd6BJw9s+MwTaEXjTB3GhWm/EKhbQrw5ZpvjkmfzlFXwx19noDLXT+mJW?=
 =?iso-8859-1?Q?+ryRTwDMR8/ZLEIEecUKVVoGNmUM2qYTx8PayPvABOlaz/9TBzL1n6n+OQ?=
 =?iso-8859-1?Q?nc+mvPvX2Q5VwIwafX4BPFYrR/QPFzirZsAQcuOl61ExDgos0exE24lmJj?=
 =?iso-8859-1?Q?P9YiPaUU4ihOL2QFNeINueg4XhBZlGyfmbMxPSN/gEHG30Fb9HwsFrmEJS?=
 =?iso-8859-1?Q?yQbxX3/IUy8JNZuHtIlLXEn/1QC6pxHzcjbZgkXes/21T01cvsRjR7e2Hw?=
 =?iso-8859-1?Q?kUlDHphCxQvxLUQj5c2kpfLMi9zb1Z8hd8jDhpBcLoumU5+hrXLc6G06Jk?=
 =?iso-8859-1?Q?muRP0cWPIgB4TefjdNvNlNb/1hq45cE/I4w62G4sGLdFiFnb3SWvFkq8ly?=
 =?iso-8859-1?Q?4gWbLx0/2dqKQHwRjmbgzfxNdYktAMUOA5/5L9D4r8SUXU3k8ZqucEs3Uc?=
 =?iso-8859-1?Q?NiLyPPQX60iPDWbYb2euBuuz67hUjX1BYV9LEYWXGkMkS07Ac3srmMz4xk?=
 =?iso-8859-1?Q?Ta6z7QZXbtFSZPHx/uywCdDJhzB270KkiZRifXjd6QSESNnMCmIK6R3yM2?=
 =?iso-8859-1?Q?AEeMQFU2FvWzEfALlvXKFxonfCckR5hty8zATzdVluUHt2xy4O/kWUeVu8?=
 =?iso-8859-1?Q?EAsgkE4Z/nKxDUb8ABsQKhVdLJYZOX7r/9s1uw47RwGMQ7EKERj6Soxyi/?=
 =?iso-8859-1?Q?lIosoQ3FQaofkV2ZhViunNPpJ9kSkBoU0vZVRFer3WaH/uQA+22+g86YOm?=
 =?iso-8859-1?Q?pTb6HthsuQ3/ulhZ5fG9lgcc9BMGRnmbyPZX+oObYEaICvM9/ZVSOpMJZy?=
 =?iso-8859-1?Q?kNIomz7c+9OXmRzdDp1Hqt6zEFCG3qhZrxKE3mEj9TE8/t4Bfyf7qySyZ1?=
 =?iso-8859-1?Q?TRq+VQbWQHGjNQ+HvjWilTdEMrpkNuNDgFhPirHqe4B0aWHykbaFcNe5Rn?=
 =?iso-8859-1?Q?TXTM2r4d8k63HRXkJ81mGu26yTmG00dxR+NJJF6sXd8cw+DSdTkNPkLMG/?=
 =?iso-8859-1?Q?yTZ+9sT6l8oO3QbtD9nATP1/4hSubnxbYFagMll3CvvMOpgaBBxJ05EKlW?=
 =?iso-8859-1?Q?s/VFLTgklWDH9ojzR8griRju8iay4eAhU98eCW6OMQvO5aFcZ0AbDVwgI+?=
 =?iso-8859-1?Q?vnK/XTUA+NlDwmoYV7382XLfQ8c8npjMSbJciwWwR4ETjBOG5kxq2fbNLo?=
 =?iso-8859-1?Q?CPZpEeMl/iZzKedFEugTnoM5LTtVtMLxKR5vgRw8H4BPTTbd58wTrD3DrE?=
 =?iso-8859-1?Q?9eigjNBg18jLD5UuGJCgGAFJlof+FFgsFnrQPl77iLRAccg7W7nA4YlX/y?=
 =?iso-8859-1?Q?6fRVmYb4dPMuKcGEnGc6RNx0MSso6/fx0paJxBaczwq0zM7mvEFEFdLUmA?=
 =?iso-8859-1?Q?GyvB1nyJcP5ny4NzT4NvvBnwCK2BdyiPa8cjENW3Pyh03kBuR2QkTWOXm0?=
 =?iso-8859-1?Q?2MRcJmQ63+6ag/iIavoe0x3kN53v4XH8xACkW2ffWKbPuAqNFirgddlw26?=
 =?iso-8859-1?Q?UmpWikUQPw5sWF2BXfCqlS?=
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
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a6b68.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB870554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e3dde-ca49-4cf0-3211-08df44f036af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 21:17:40.9809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041

Hi,=0A=
=0A=
I have some additional findings regarding the Logitech G733=0A=
(USB ID 046d:0b1f) volume issue.=0A=
=0A=
I confirmed that the physical volume wheel can also cause abnormal=0A=
volume attenuation on Linux 7.2.15, so the issue is not exclusive=0A=
to Linux 7.3.=0A=
=0A=
On Linux 7.3.x, the hardware PCM mixer sometimes initializes at=0A=
51/74 (-23 dB), even though ALSA has 74/74 saved in asound.state.=0A=
=0A=
I found two workarounds that together resolve the issue:=0A=
=0A=
1. Enable "api.alsa.soft-mixer =3D true" for the G733 in WirePlumber.=0A=
   This prevents the physical volume wheel from causing excessive=0A=
   attenuation or loss of audio.=0A=
=0A=
2. At session startup, explicitly change the hardware PCM volume=0A=
   from 38/74 to 74/74 using:=0A=
=0A=
   amixer -c Headset cset 'name=3DPCM Playback Volume' 38,38=0A=
   amixer -c Headset cset 'name=3DPCM Playback Volume' 74,74=0A=
=0A=
   Setting 74/74 directly is not always sufficient. Forcing an=0A=
   actual volume transition restores the expected hardware gain.=0A=
=0A=
I currently apply the second workaround using a systemd user=0A=
oneshot service after WirePlumber starts.=0A=
=0A=
Both workarounds have been tested successfully after reboot on=0A=
Fedora 45 with Linux 7.3.x. The headset now starts at the expected=0A=
volume, and the physical volume wheel works without abnormal=0A=
attenuation.=0A=
=0A=
The root cause remains unclear, but the findings suggest an=0A=
interaction with the USB audio hardware mixer controls.=0A=
=0A=
Best regards,=0A=
Lucas=0A=
________________________________________=0A=
From: Lucas Cota <lucasbrunocota@live.com>=0A=
Sent: Tuesday, November 17, 2026 16:47=0A=
To: linux-sound@vger.kernel.org <linux-sound@vger.kernel.org>=0A=
Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>=0A=
Subject: [REGRESSION] Logitech G733 USB audio volume issue since Linux 7.3=
=0A=
=A0=0A=
Hi,=0A=
=0A=
I'm experiencing an audio volume regression with my Logitech G733 wireless =
headset (USB ID 046d:0b1f) on Fedora 45.=0A=
=0A=
Kernels tested:=0A=
- 7.2.15: Everything works normally, including the physical volume wheel, w=
ithout any custom ALSA or WirePlumber configuration.=0A=
- 7.3.3 and 7.3.4: Audio volume is significantly lower, and using the physi=
cal volume wheel causes further issues.=0A=
=0A=
On 7.2.15, the kernel reports:=0A=
sticky mixer values (...), disabling=0A=
=0A=
On 7.3.x, it reports:=0A=
broken mixer GET_CUR=0A=
=0A=
Unlike 7.2.15, the newer kernels expose a hardware PCM volume control (0-74=
).=0A=
=0A=
I can temporarily restore the expected volume using:=0A=
=0A=
amixer -c Headset cset name=3D'PCM Playback Volume' 38,38=0A=
amixer -c Headset cset name=3D'PCM Playback Volume' 74,74=0A=
=0A=
However, turning the headset's physical volume wheel makes the audio quiet =
again, even though ALSA still reports PCM at 74/74.=0A=
=0A=
Enabling WirePlumber's api.alsa.soft-mixer =3D true helps with software vol=
ume control but doesn't fix the physical wheel issue.=0A=
=0A=
This seems related to the USB mixer behavior change between Linux 7.2 and 7=
.3.=0A=
=0A=
Could you please investigate whether the G733 needs a device-specific fix?=
=0A=
=0A=
Thanks!=
