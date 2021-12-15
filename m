Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EDD2C9E
	for <regressions@lists.linux.dev>; Wed, 15 Dec 2021 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639573531; x=1671109531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SW1Cmfjqu/FeUb68Y5wWHq47O29FpfCdhubIDCl5p9Q=;
  b=FGrsI6DBWMFwHthjg3HX4pwL3Wh65AKInre2pNAICqzVvbTK9PDnFyjR
   mrFWr5jLh5/hrxU9CesdXROrjK65qWGlRvIE7fyQgTDTYarwg4RPZLmFO
   lk5G+tyZ3BSS0kyS4Zblw7UHC8heBC9FQvv0jQADbnr4OVJyTINUkaGaL
   QPqFgCrWa5h4nppw3Hatt0HwFeWzLWHH2k2pEgIXobXHTdBOyMW4xTlWj
   7Hr03XiLtYPfNBhYBZmpI6k09O85dBdTePF0gI5q6EBTPfvkOfdxN9m/e
   S9mC+FfZfHFZXleQZmDa5WsNkkSClepcpE+G2tBg5A2Fgau2VdfPdOl/5
   w==;
IronPort-SDR: 9XQQS8iPgq7azY5SK5bfGCAsWOY4fij4t4X7KAJR1JwWnZAFrLuwIdav/jILgt3oXYMRqWkhxR
 X9QN/zd0oQonD1z7TlDOWw/3Pf3or7pMn0TM6gIawHBcfIXaslL+dYYXejuL+VA3KiobFh5dWK
 8zYrRwgrb7kSBs/ANndhI916TlRQ9RXdZzzIIxZdDoZuG04O4DYjbEdOWvJFJ8d39GnF9SDTsf
 sUVVrKVriZc1zGEQodzwCNI1GNuqQxrV3Q8yESybIFqdJCoabr604M6b+6ByDPgTruTsSKGeTE
 12yroJ5R1qY803TJMVaIkQl6
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="139852604"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Dec 2021 06:04:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Dec 2021 06:04:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Dec 2021 06:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qdh6nWlAQnKiLQyWSdujlEIc7HUddzf5LfCdiJU3YKIJZesL5mJGk+RuluGuHA7cUZAHOhopqm1bKfm2P3xGCiydLu/VFOQxS9xnjtGfjPDoeKy6uopFZjoGVRVzZl0U2CHWqFobhT4pJZJqzB8pO2wLLcKZJ443td0bU2d6FzG3GwEYYt4Ct34g8/knS2MvKJSgzGYIxSsCuPOhC2yiNbk78nfT12FPESFQytjUZtWGtxgf99sl/3y0mSI1NfVgTRmkQCtN/fYYIMi9qCi2SKS/CM+q1ppEOuXwyIwXLaEhRIzRSPiVxJRRle5tU4LPLq7FFhn1555xoQKRH/wcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW1Cmfjqu/FeUb68Y5wWHq47O29FpfCdhubIDCl5p9Q=;
 b=IfWI/y2u+qV47EKiqjYxwAZOu37Yj5leCV0PUi/E9YzeyTHqYWe1rmFHQPK3K6hXLyi5n+LTfKZve3JQTSpAnwkAw86X9BSY3zemvHVWWjIA45MhoiFGjyFzfjSFOt/hkk49YIyDSdFJJb5a48FU5jfzw/UJDEjtIfu7kxqyecEUKjDohwWhQIn0KlgpaaRSwQ3vuv9DfqssaOMMF7YGOuHSMdRUeDl8fucbjs0/IYyyclHMJvYYn+axTfe0u9Pq+aN0e1Y0n1bNldqf6bkH+phyWyX9G5jUl+JU9MkXbzxHwOEidMOzvhUWLJUhuJuESlve9KDbUxZK2CvWAixUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW1Cmfjqu/FeUb68Y5wWHq47O29FpfCdhubIDCl5p9Q=;
 b=f9sGKUAMbU9XzWDjb1my9j8rYeX88aTx4WBHZWKQ+VNgMwtQkljDTY9IpfFH87B4fxiYnFzIw//SGaf3H3Puk9YyEksO+ljek1QgO2xDrtNBMphO8mYia3s0GNtMRiIT0UvIZfjmrKmomsYKg/W1hFw3nl8Yo1MCF0qtDgdSY1M=
Received: from BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 by MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 13:04:16 +0000
Received: from BL1PR11MB5272.namprd11.prod.outlook.com
 ([fe80::fd71:366e:3a:39c1]) by BL1PR11MB5272.namprd11.prod.outlook.com
 ([fe80::fd71:366e:3a:39c1%5]) with mapi id 15.20.4778.017; Wed, 15 Dec 2021
 13:04:16 +0000
From: <Cristian.Birsan@microchip.com>
To: <marcelo.jimenez@gmail.com>, <jonas@norrbonn.se>
CC: <regressions@lists.linux.dev>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <balbi@kernel.org>, <tanzilli@acmesystems.it>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Thread-Topic: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Thread-Index: AQHX7r4jEjB54Iz3sEKmrv7KOit06qwwM6WAgABLFACAAwxRAA==
Date: Wed, 15 Dec 2021 13:04:16 +0000
Message-ID: <42f2afc6-f1a0-dc33-830e-0fcc5382ed1d@microchip.com>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se>
 <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
In-Reply-To: <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e7e064c-ea3d-4be4-e04a-08d9bfcb666a
x-ms-traffictypediagnostic: MN2PR11MB3919:EE_
x-microsoft-antispam-prvs: <MN2PR11MB39192C1BDA4C7245A6D3E006EF769@MN2PR11MB3919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJTACE9sw1da0jPq0Z/qAjSNcyi5xPCvXYQgSBAvTEos137m8XTgLbadySRerudsSEwUWq3XXYWobY+tzrjHkEC66ZuJrJD1aza666/52bGLF/NaSGjo2IQjHjQKHa1cL0atumbKNNEoNHvTQOYgDaPvDBliHjILQ98oyBMVMY7713it+YQ2udzz+m5/3i3q4XdENdzZJLBdx9MLmJD8y85Kvez30gtoPbTuvCQ63lYBwr3Vf8Z3Jh99Q4DZ1+AecMXEMjyibokCzIOSQKW6pziK1wNXRFKYK4PU1dZDF3tUZR0tNGem0YU+Uof1PipdupVKFjbwao8yof4+Mg27VgLHE9MZfZJyBG/cmLqHG3Mus7ZdMm6P802zwpnSHOPhxDcASmy2ZNHLWDrxq40zuZqxzxMbkzWTH/5tRwEoEPDB9cym7iPdTftLuth9mxPZfQqujWGIGfu/p82Ebrakp/RawK7b50/7bUh8WVsKZRdJfLroNhBCWt9EIdmOjcu1HMkQRblalVtqni8c/0YIDwLat+DfbipNVch81eBYOXP7KBu4JBSuhTcF8b2ved+1Z0er+ekQMzV/w7hC3sbX12i6fiI7fc6tW5EUxpIn86uWdnMzVVXG2/Q7HnluVCODDsBJDxyKNIv5REkm9w3hQFmD8kxHn7oaHFNUIn/byOkYbLjLGD51GRWvvhn846Vur1p30umAjsFY08dBI1aJQBRfqIDFXIBNyalHhxiuEljfyD1Odrlr5FSg4OBs6C0U80sgZwZWtiEL5Xhpx4k1Q4z6/5nsugnMSbfM11NX8nN3q0j9KsbgOm5Gkcf88lRv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5272.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(38100700002)(91956017)(31696002)(76116006)(66446008)(64756008)(186003)(66556008)(83380400001)(316002)(8936002)(110136005)(2616005)(8676002)(4326008)(122000001)(86362001)(36756003)(2906002)(38070700005)(6512007)(31686004)(71200400001)(6486002)(54906003)(5660300002)(508600001)(6506007)(53546011)(45980500001)(43740500002)(10090945008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUE3VWVhVjNWVDVOb0NDemk4cTRZSG5yaTFKSlI1Q1A1dUFBaGc1engvNzJq?=
 =?utf-8?B?c1pUR1lvWEoxTkkwRWdJQTZpRUZmcFVlSWpnVjNWMDlHd2FUSE5NbWtkZkVw?=
 =?utf-8?B?eFlvZXNhQTZ2WUpyYXdUMVp5bkVYS0pkNVFrZ29hTFlIU0E0RXRIeld0amda?=
 =?utf-8?B?Nmt6S2pkUXRjU244MG5YMm1pUTB6UG5nT2lMSnJIUmRsNzMwb2poY3QzcFYv?=
 =?utf-8?B?NGhIVUJHVHMxNWd0VDN1OXZkc1NZcGlSZGlyU0FpbHBEeElGVFJYaW0zVU1U?=
 =?utf-8?B?SzdpV3JoQzNzSlo0NzZtTExKazNxc3BTUXk4QUFUNE1PV2RVRUhFWlNKZ2Fq?=
 =?utf-8?B?ZlBaUkk2bElrTG9tV1dqN1hLS050OVJqcTNaVzR2aXVqYStSNy9aY3BwNnZ2?=
 =?utf-8?B?UWIxSDIyUWNsWnovUDNNUUJKTkVXOTRzNG0zcFlENlh5MkN2dzRPT2JBbk9O?=
 =?utf-8?B?cUliUWpEOWNieks1U09QY1YxVnBnd0hvZm05VG5iS3VuRC9IMzVYS3VOUWZj?=
 =?utf-8?B?d0Z3bFhhMTZDNXpLOUE4Qmduekp2RFQwUjMzbFlzZzdQaS9zWi93ZkhKQlZp?=
 =?utf-8?B?cXFDa2o4bzhzSko3dWlOYXFqeWtXZTdTSnNnZjJsNHlUYjgwWGVRcW5oNC9D?=
 =?utf-8?B?ZmJ0NFgyZGUwOGxmSmNqV2RSZlRjQVNuUTI5MGlldmkyVG5FcW90Um1KS3JG?=
 =?utf-8?B?blJhNklJd0FXVHAxWG4yMU8rVUwrTkgxbEtKSVNtRnkxSGx5N3dpNzdtTmdk?=
 =?utf-8?B?Nm5oUlh1eWxiTGFSTmV0ZnIxS1JiZ1V6Njk2ZmhNRXpzZ1E0SVFVMUVLT3F0?=
 =?utf-8?B?bURwUFMzYlVNSUppTFBlK0xpTCtEUDBRaVliZUErZTFTcEJlbUxSLy90NFVM?=
 =?utf-8?B?cXZlMzUxSkptQUJsdGdRSTZUbXBMcy9YSExLTk5sTVk0VGdPTEEybktUM3hj?=
 =?utf-8?B?U01kaDlnMjF3Y25KNnJCUC9oaGFncm1SdXpQSnVpRTZPMldMaVprWGRoQmw0?=
 =?utf-8?B?UXdFbWJKa2V3M1BEdWdtWFBuTzZwN0RpQk5TMDdWZUMzU3ZmWnZJOXVLY2pt?=
 =?utf-8?B?WDZDclU0VXB2c0MyRU9NZ3dkdDUrTVVodVgwNitJTUp5bHBBd2plT1N2Wktl?=
 =?utf-8?B?aXFFY3Q0S0ZpcnFXRlN6MkpGa0txOStiS1grTGdqY3ZJb1U4WkJjN3lWZUc1?=
 =?utf-8?B?S2FjQTFMQkZsdTZHam0yOGhpbjEvUUI4dG9GeDdicmZKZndOemViZzBXVkNJ?=
 =?utf-8?B?dGp5MkJab0YyaHJJSkhrSEdqOTR5czI4NmNTTWFuODlMV2ZKUU10c0ptNS92?=
 =?utf-8?B?aHhJZEhrcjl6UExFeXNMd2FoWlpmbFM3RUNlTlpuOHFteCszVDU2QnZFaFBV?=
 =?utf-8?B?R25ndytua3VaVzh6b05aYW4rOFhDVzBYMnc2Zkd1OHJqOXdSTWFPT253VGZu?=
 =?utf-8?B?eDVCSkJIc3lvSE5XU3hIQ0lXYU9xbDhaV1VWRVdxcDUrSUU3ZEJrV2xXMkd1?=
 =?utf-8?B?ZnZlWVk4LzVpZERsaG9pdkVsRzdMZVE3TnBaVWxzYkdFeVNzaitOMTFUNGNm?=
 =?utf-8?B?YVZMem1sVXR5N2lyeWVIelpvT1JQZlJBZXNEa2ZOQklJZ0RTSnVOUml4Mi9D?=
 =?utf-8?B?K1pjd2krdXp5QmRYb09zR1pWTXh5UWlKYWx1NEx4MU9kZndLemU4QjZOMm9h?=
 =?utf-8?B?cnN6bnVBbEdtZVUrY1NTejNQYlhVc29UcDhoQmpJOFdSRTNhUXhiSGN4Y2sw?=
 =?utf-8?B?OFc5YTY2eFBXMW8zUSsxVk1QOEUxSDBST05zWHZaWlVSc2xNbnByT3MxMnEr?=
 =?utf-8?B?Smh4WDZUUS85R3hvakVTTzZtTlBWYTF1cUdjYzdHUDNnN05DaE1GSDF0dnls?=
 =?utf-8?B?R2s2WFVjMmNWZnB6KzRBV21rM3pINHRPNFVKcjZCWEEyczA2V2gxcit5aElD?=
 =?utf-8?B?R2NLU25EVVZGRnFtRTl0aCtZSEl6VjFhbFd3TUhRbXVzRGk5MWRDamc5UEdz?=
 =?utf-8?B?T1Zia1UvS0dTeHFIWkI2Qk9wS2ZFdUl1dnBHQ3B5N2xWaW9WaURxdDBNeEg3?=
 =?utf-8?B?VWRvbE5SajhGY0hiRmsxUHU3WGdyNmI2ZGN1RWRjT054ZDR2K2tVUjVLVjV4?=
 =?utf-8?B?cER0ZDBvVkZZek5jWWtYWVR6dTNEUG9ZS3JpeEhZY2JqVlBLVitsZDNVck5j?=
 =?utf-8?B?c0pOQnl4Y2FzSkk0SXFqanhjMjdGSlUvTGhSMlI3RUwyL3JnS240WmxMekJI?=
 =?utf-8?B?OHoxcFhNTGp4VGdCaCtZdjJ4SEdwRUhSNlFxdnRjc3llOVJtTjlKT0RrT3RQ?=
 =?utf-8?B?T2ZvbjZZRTY3YXdVOHdvK2JtcDhlZDliQUZ1RGs5L3dBc3pJYjMyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DA4CCEC89C66240A6F7EEB010B214AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5272.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7e064c-ea3d-4be4-e04a-08d9bfcb666a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 13:04:16.6245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iagfj5B7S0YoRG/rwP6mZFkLYd3qIj0HXeFkg6yk0PIBT3kOsBdjCFTgX+bGpqddqflkLaiLl12bKCZyJipCRMS9HiVY/vidg+Ui/eCKZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3919

SGkgTWFyY2VsbywgSm9uYXMsDQoNCk9uIDEyLzEzLzIxIDQ6MzEgUE0sIE1hcmNlbG8gUm9iZXJ0
byBKaW1lbmV6IHdyb3RlOg0KPiAJDQo+IFNvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1l
c3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbWFyY2Vsby5qaW1lbmV6QGdtYWlsLmNv
bS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IDxodHRwOi8vYWthLm1zL0xlYXJuQWJvdXRT
ZW5kZXJJZGVudGlmaWNhdGlvbj4NCj4gCQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+IEhpIEpvbmFzLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcXVpY2sgcmVz
cG9uc2UsIEkgcmVhbGx5IGFwcHJlY2lhdGUgaXQuDQo+IA0KPiBPbiBNb24sIERlYyAxMywgMjAy
MSBhdCA3OjAyIEFNIEpvbmFzIEJvbm4gPGpvbmFzQG5vcnJib25uLnNlIDxtYWlsdG86am9uYXNA
bm9ycmJvbm4uc2U+PiB3cm90ZToNCj4gDQo+IA0KPiAgICAgR2l2ZW4gdGhhdCB0aGUgcGF0Y2gg
dGhhdCB5b3Ugd2FudCB0byByZXZlcnQgaXMgYWxtb3N0IDMgeWVhcnMgb2xkLCBpdCdzDQo+ICAg
ICBhIGJpdCBvZiBhIHN0cmV0Y2ggdG8gY2FsbCB0aGlzIGEgcmVncmVzc2lvbi7CoCBJIHN1c3Bl
Y3QgdGhhdCBhIGNsZWFuZXINCj4gICAgIHdheSBmb3J3YXJkIGlzIHRvIGludHJvZHVjZSBzb21l
IGtpbmQgb2YgcXVpcmsgZm9yIHlvdXIgYm9hcmQuDQo+IA0KPiANCj4gV2VsbCwgdGhlIGJvYXJk
IGlzIGJhc2ljYWxseSB0aGUgTVBVLCBzbyBpZiB0aGVyZSBpcyBhIGhhcmR3YXJlIHByb2JsZW0g
aXQgd291bGQgbWVhbiB0aGF0IGl0IGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBvbiBjaGlwIHBlcmlw
aGVyYWwuDQo+IMKgDQo+IA0KPiAgICAgSSBoYXZlIGEgc2VsZi1wb3dlcmVkIGJvYXJkIHdoZXJl
IHRoZSBVU0Igc3VzcGVuZCBzZXF1ZW5jZSB3b3JrcyBhbmQNCj4gICAgIGRldmljZSBhZGQvcmVt
b3ZlIHdvcmtzIGZpbmUuwqAgU28gZnVuZGFtZW50YWxseSwgSSBzdXNwZWN0IHRoYXQgdGhlDQo+
ICAgICBkcml2ZXIgaXMgb2suDQo+IA0KPiANCj4gTWF5YmUgeW91IGhhdmUgVkJVUyBzZW5zaW5n
IGVuYWJsZWQgaW4geW91ciBib2FyZC4gQXMgSSByZXBvcnRlZCBiZWZvcmUsIHRoZSBWQlVTIHNl
bnNpbmcgaXMgbm90IGFuIG9wdGlvbiBpbiB0aGlzIGJvYXJkLiBOb25ldGhlbGVzcywgdGhlIGNv
ZGUgaW4gdGhlIGtlcm5lbCBzdWdnZXN0cyB0aGF0IFZCVVMgc2Vuc2luZyBpcyBvcHRpb25hbCwg
c2luY2UgdGhlIHByZXNlbmNlIG9mIGEgVkJVUyBzZW5zaW5nIHBpbiBpcyBleHBsaWNpdGx5IHRl
c3RlZCBpbiBpdC4NCg0KSXMgaXQgcG9zc2libGUgdG8gYWRkIGEgd2lyZSB0aGF0IGNvbm5lY3Rz
IFZCVVMgdG8gdGhlIHJpZ2h0IHBpbiBvbiB0aGUgTVBVID8gSnVzdCB0byBzZWUgaWYgdGhpcyBo
YXMgYW4gaW1wYWN0IG9yIG5vdCA/DQoNCj4gDQo+IEkgaGF2ZSBub3QgcmVhZCB0aGUgZnVsbCBV
U0Igc3BlYywgYnV0IGlmIHRoaXMgaXMgYSBmdW5kYW1lbnRhbGx5IG5vdCByZXNvbHZhYmxlIHBy
b2JsZW0sIG1heWJlIHdlIGNvdWxkIGhhdmUgYSBjb25maWd1cmF0aW9uIG9wdGlvbiwgcnVudGlt
ZSBvciBjb21waWxlIHRpbWUsIHRvIGVuYWJsZSBvciBkaXNhYmxlIFNVU1BFTkQgc3RhdGUsIGFz
c3VtaW5nIHRoYXQgdGhlcmUgaXMgbm8gcHJvYmxlbSB3aXRoIHRoZSBvcmlnaW5hbCBwYXRjaC4N
Cj4gDQo+IEluIG15IHBhcnRpY3VsYXIgYXBwbGljYXRpb24sIGl0IGlzIG1vcmUgaW1wb3J0YW50
IHRvIGRldGVjdCB0aGUgZGlzY29ubmVjdGlvbiwgc28gdGhhdCB3ZSBjYW4gcmVjb25uZWN0LCB0
aGFuIHRvIGVudGVyIFNVU1BFTkQuIFdoZW5ldmVyIFVTQiBpcyBub3QgbmVjZXNzYXJ5LCBpdCB3
aWxsIG5vdCBiZSBjb25uZWN0ZWQsIHNvIHRoZSBlbmVyZ3kgc2F2ZWQgd2lsbCBiZSB2ZXJ5IGxp
dHRsZSBpbiBteSBjYXNlLg0KPiANCj4gTXkgaW50ZW50aW9uIHdpdGggdGhpcyBwYXRjaCBpcyBh
bHNvIHRvIHByb3ZpZGUgYSBxdWljayBmaXggZm9yIGFueW9uZSBmYWNpbmcgdGhpcyBwcm9ibGVt
LCByZXZlcnRpbmcgaXMgbm90IG5lY2Vzc2FyaWx5IHRoZSBiZXN0IGxvbmcgdGVybSBzb2x1dGlv
biwgZXNwZWNpYWxseSBpZiB0aGUgY29kZSBpcyBmb3VuZCB0byBiZSBjb3JyZWN0LiBCdXQgYXNz
dW1pbmcgdGhlIGNoaXAgVVNCIGNvbnRyb2xsZXIgaGFzIG5vIGRlc2lnbiBmbGF3cywgYW5kIGFz
c3VtaW5nIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkbyB3aXRob3V0IFZCVVMgc2Vuc2luZywg
dGhlbiB0aGUgcHJlc2VudCBjb2RlIHNob3VsZCBiZSBtaXNzaW5nIHNvbWUgZGV0YWlsLg0KPiDC
oA0KDQpJIHdvdWxkIHByZWZlciB0byBoYXZlIGEgY2xlYXIgdW5kZXJzdGFuZGluZyBvZiB3aGF0
IGlzIGNhdXNpbmcgdGhlIGlzc3VlIGJlZm9yZSBtYWtpbmcgYW55IGNoYW5nZXMgdG8gdGhlIHBh
dGNoIHNlbnQgYnkgSm9uYXMgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbC4NCk1hcmNlbG8sIGNhbiB5
b3UgcG9pbnQgd2hlcmUgdGhlIGRyaXZlciBoYW5ncyA/IE9uZSBjYW4gZW5hYmxlIGRlYnVnIG1l
c3NhZ2VzIGluIHRoZSBkcml2ZXIgYnkgdXNpbmcgI2RlZmluZSBERUJVR19MRVZFTCBEQkdfQUxM
IGluIGF0bWVsX3VzYmFfdWRjLmguDQoNCj4gDQo+ICAgICBXaXRoIGFsbCB0aGF0IHNhaWQsIEkn
bSBub3QgaW1tZWRpYXRlbHkgaW4gYSBwb3NpdGlvbiB0byBydW4gdGVzdHMgb24gbXkNCj4gICAg
IFNBTUE1RDIgYm9hcmQgcmlnaHQgbm93IGFuZCB0aGUga2VybmVsIG9uIHRoYXQgYm9hcmQgaXMg
NS4yLsKgIEknbSBub3QNCj4gICAgIHN1cmUgd2hlbiB3ZSB3ZSB3b3VsZCBub3RpY2UgdGhhdCBV
U0Igc3VzcGVuZCBzdG9wcGVkIHdvcmtpbmcgYmVjYXVzZQ0KPiAgICAgdGhlcmUgaXMgbm8ga2Vy
bmVsIG1haW50ZW5hbmNlIHBsYW5uZWQgZm9yIHRoYXQgYm9hcmQsIGFzIGZhciBhcyBJIGtub3c7
DQo+ICAgICBzb21lZGF5LCBob3dldmVyLCB0aGF0IHdvcmsgbWlnaHQgaGFwcGVuIGFuZCB0aGUg
bGFjayBvZiB3b3JraW5nIFVTQg0KPiAgICAgc3VzcGVuZCB3aWxsIGJlIGEgcmVncmVzc2lvbiBp
biBhbmQgb2YgaXRzZWxmLg0KDQo+IA0KPiANCj4gSSBjYW4gdGVzdCBpdCB3aXRoIHRoZSBBVDkx
U0FNOUcyNSBwcm9jZXNzb3IgYW5kIEkgY2FuIGFsc28gZ2V0IGEgU0FNQTVEMjcgYm9hcmQgdG8g
dGVzdCB3aXRoLg0KDQpJIHdhcyBhYmxlIHRvIHJ1biB0aGUgdGVzdHMgb24gdGhlIGtlcm5lbCB2
ZXJzaW9uIHBvaW50ZWQgYnkgTWFyY2VsbyAoNS4xMCkgb24gU0FNQTVEMiBYcGxhaW5lZCBhbmQg
b24gU0FNOXg2MC1FSyAodGhlIFVTQiBJUCB2ZXJzaW9uIG9uIHRoaXMgb25lIHNob3VsZCBiZSBj
bG9zZXIgdG8gQVQ5MVNBTTlHMjUpLg0KSXQgd29ya3Mgb24gYm90aCBib2FyZHMgd2l0aCBubyBp
c3N1ZXMuIEJvdGggb3VyIGJvYXJkcyB1c2UgVkJVUyBzZW5zaW5nLiAgVW5mb3J0dW5hdGVseSwg
Y3VycmVudGx5IEkgZG8gbm90IGhhdmUgYWNjZXNzIHRvIGEgYm9hcmQgd2l0aCBBVDkxU0FNOUcy
NSBvciB0byBBQ01FIEFyaWV0dGEgdG8gY2hlY2sgLyBkZWJ1ZyBvbiBpdC4NCg0KPiDCoA0KPiAN
Cj4gICAgIFRoYW5rcywNCj4gICAgIEpvbmFzDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBN
YXJjZWxvLg0KPg0KDQpSZWdhcmRzLA0KQ3Jpc3RpYW4NCg==
