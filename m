Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A46168
	for <regressions@lists.linux.dev>; Wed, 22 Dec 2021 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1640198115; x=1671734115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qZ+qyXg+YACQkfbn2IvCbfkOcIx1ruaFx0iFkJPWV8U=;
  b=1qgy59Goh102ys3eyAOKXmOoIEupu8p0WVQFK8Fiphznswt1UJYLaIKF
   YOP0tvkVJYirX/quK+TcjlLvkfFndsmNZTc0wxCLP1vK5e0AotxScZXEn
   prt1If1wKemow4d7G/u3ZcHKtRA74hqUyADaz/kIX/cZy57MGyIxNPSrk
   CmGJwCr5Un9LDa8fmGKs5nhwpbhPYzkyP6Uhry/7pF/3CgyJCC/0Hnzk8
   abFiHEffsgpnnPNa6EakI3iNZYt04LmuXjm4/eACefYyA7u8LrNsnarrv
   LI6jo9steiVvNmDEvKe4ARVnorWk2FTPokyaOh6GtuKW35+D4DNEDZ3DL
   g==;
IronPort-SDR: ZF/GEQ0xJMndzjA+xm95wA2e+zoFBQBboYMstM0RLi5FZiZg38jfmk2vgygLiye4XJmpeunX64
 9qvMzU3WobgdG1CWqL+lz/dSy/XKvLwlCjmeDpQHNF9InaYAGMCSZvsLLb4m/5Dt+j/kuIiM8J
 DJArXduZtSnWI9vQDBxmJ1hqqynjq+dv3/VkcXE2JDFIwoyDxu+IsJRgOh6RqEFpWkY/oCqiAt
 568oilZObXt6kkXvI3x5icqZU1SiWjBWgJmRGUO/YzBN4VqS9pj1/zAwDDKkc7z/mVciNxi19p
 sM5mz+vXqgPywuoQyf52ij5n
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="140625107"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Dec 2021 11:34:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 11:34:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 22 Dec 2021 11:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgFtDJThZFBQEFyWeKxOzsGxi50hmr2p71z8LZJiXiFDRJg+diLd4hvs90jdTEWFmPbBfhqorcTuJsQiVlYxHKOWktnjK+8pipoLOYdDvjC+79NTHoYg+uGOolvvfbVKc+CN6un3S8PxV42v3c56AMS479mQrMTuj4Kr8Jo51RDzZOEOJPsaOzS4S4u6hgvBVtvZb2JVL8124TD8lQI0CHJzbLplMqFpZ6mC/tsAXanK//hqZ0WiTOmbij0bz5WSP61dZjyglEoiHRry13lMPRN77JyTMPxQjBHaibwPvqz2xht6K8KCuBm/560xXpBYHeLgqrXJM5Ot9oGiiLKAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ+qyXg+YACQkfbn2IvCbfkOcIx1ruaFx0iFkJPWV8U=;
 b=DW3LlHQSdECIaRn/WYN8LeB5Se1DsYdNFd1s7XOw3QWyMYubzKaofYVY6YM94ZQDsQMBvR5c/pePraTByowbWCKwZ25k6s9+bJMqSoHXVXKqd4tEr7LVU8zs9ra8QwI+Onzf+2UPy35uVBlxzbiXDxLUCbJezs451U5W0GLTn2RO/+JcAJmOOIf1qmPNdBqQcKUGm8dt2sawTHEJhxKpiJyKDpHAAennvAD76L5MloHEusNt3zEra2Edki9pytlTMqMuCX+GFGDLT8sRyqYe6AZd4FWx9Y9v7HWuztW+I/k4cypOprMZE8oxR0+mTQWtxaL0xt2NyWH2OfBtCAO68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ+qyXg+YACQkfbn2IvCbfkOcIx1ruaFx0iFkJPWV8U=;
 b=Y/BH2iSY7RMnDu0gp4YZ5e6d+IyE4qoXHQI0wKFVdIGUi8Ru7RU1qWcQFpVO/qu7clusTgMOLb3Vut5Ww31Njszg9aahtuqupmCcNZvM0iN5Lg4eAd80BMGAmhANUMOa+SOlasLfrwW2LlepSM9B2cRvPVaUq9gQieRPDcagBfM=
Received: from BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 by BL1PR11MB5542.namprd11.prod.outlook.com (2603:10b6:208:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 18:33:52 +0000
Received: from BL1PR11MB5272.namprd11.prod.outlook.com
 ([fe80::fd71:366e:3a:39c1]) by BL1PR11MB5272.namprd11.prod.outlook.com
 ([fe80::fd71:366e:3a:39c1%4]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:33:52 +0000
From: <Cristian.Birsan@microchip.com>
To: <gregkh@linuxfoundation.org>, <marcelo.jimenez@gmail.com>
CC: <jonas@norrbonn.se>, <regressions@lists.linux.dev>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Ludovic.Desroches@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-usb@vger.kernel.org>, <balbi@kernel.org>, <tanzilli@acmesystems.it>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Thread-Topic: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Thread-Index: AQHX7r4jEjB54Iz3sEKmrv7KOit06qwwM6WAgABLFACAAwxRAIAAL6eAgAfJnICAA2MlgA==
Date: Wed, 22 Dec 2021 18:33:52 +0000
Message-ID: <979bdf8e-60ff-504f-f70b-b895e354bf0e@microchip.com>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se>
 <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
 <42f2afc6-f1a0-dc33-830e-0fcc5382ed1d@microchip.com>
 <CACjc_5qZjXbE1CwQCpc4+vzbsobfn5YKpU=UCVJpMGG1ROEfTg@mail.gmail.com>
 <YcCYJeGTFIhxK62s@kroah.com>
In-Reply-To: <YcCYJeGTFIhxK62s@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a836550e-c7da-4e6f-a35d-08d9c5799a7a
x-ms-traffictypediagnostic: BL1PR11MB5542:EE_
x-microsoft-antispam-prvs: <BL1PR11MB5542816D931D61809189355DEF7D9@BL1PR11MB5542.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FQ1sgB6GSKnjkgYAggsAqRDpfZ4rIIffOUByNNy3l7BR4qiGaIEvDLkPbCd02Gq4LOalXb5IIPXovn/yQ3j9Hw/6nhF6+lUwDemgr4Yg10PMto0WpGdcbyHnMMIJ1gmNytpAj9MvV2omnCk5lh7Q2DC1PsvMQeHyccm9G/l8iBeKA70vUezutCNH56y3wPERkjZhGDyQkmnIgUVBCLdpkPhNqQj9YUEuG26JjkY1WV+cJre8Z5TnTrMtujdLfp7rHx9zuUV1NPebaUCF5bL8RBSUFVEw4L0I8oBrMTESkJWmPgjt82RDgCNpbbwmSkpgeX99vtgMKRfMAVoZevFTZTdZWfy8PRp/OmhKnUh6qZNHwlgkAZoLU4dZVo9AwTBrbUW1/nAhS5WVUZBtpJ35steBq1EnIT82cGOf46vYtMpJVgXwDkuLlVPGRsYkdnKkN3cAHWytXN9EJa1jtq2W5trqtpuj591tdlgY6HkJvtWYU2+WbXVAQE6bom4ob+uRdbqUs1WOrhVN/sk2gawSEY1cyZjS1vBQX3a8yl6gInsDjQbzdezaO7foZFW4RIp/rpfZ9v181o4XpXGVxZ21pPe0rUYW65MSGHj9jzU9DCbxF7q1h2/7npzlorR73rv9yrxuQanPxKxisQUpvS9E7p2L75HRYiB6g1/kX8RWxJJ0zSzxVCTsPMlHLiEmGCh9MZeogTfd38eYWjlPkXHzlUZbi+ki0mNWs4uu3/M6mDO+zaf79LMUICnQ6RJejw4CKfILLFtTXxHVYIvm89KnEFuLfdsBoQUiPntZZL7oH4kkfTBp1OLBwzwQygijLf5gijuUrQjx4vE7mFL54cM0wN04qK575f4eE/u3UgIZVsnEoetAxBR6QchM0GxFylHeKB9EoyHmcyU4PWJ+QhWRjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5272.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(508600001)(71200400001)(66556008)(38100700002)(31696002)(122000001)(66476007)(76116006)(6506007)(66946007)(64756008)(53546011)(4326008)(86362001)(5660300002)(66446008)(38070700005)(6512007)(83380400001)(31686004)(6486002)(110136005)(2906002)(54906003)(36756003)(186003)(91956017)(8676002)(966005)(8936002)(316002)(43740500002)(45980500001)(10090945008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVFySTF6UFN0WGF5VlRnS2lXQkl3d1VLbW0zUFhoaXlEcVZkUlkwQk5WTTBt?=
 =?utf-8?B?MlJPUWY0WDJEaXBmUWtvRGgyNktVb0s4bXlHWXJRWXlpUktlWG1KMmFEeVdr?=
 =?utf-8?B?Z0I0ZW5HN3R1U2t4NEYxYVNwdjZSWUxlVDhTM09xbUdUYjRIOXZwZmI5Zms3?=
 =?utf-8?B?b1RXcDdJcmc4MVhvRytEbVQrUWFldjJVZnJGS1diQ0NkNW9Odm9WTklLS2cv?=
 =?utf-8?B?NHVJV2xML04xWU1tb2Q1NjhNT3lVQ0tVMDNteUJOZ256WThlaWNLd3p2d0R5?=
 =?utf-8?B?cFZ0QUpwYk1ZNTBadS9MR0d3bk9xdWVqWWRSRFU5ZDBhRzRHWk44QnRUQ05h?=
 =?utf-8?B?Y2pmQVNmSFVtdE1ZOEdFbCtjQ1dacmY1a0xMQWd0K1ViTytHNUYvaDREc2hL?=
 =?utf-8?B?NXpoSmVOZGI3NGlxcE5GYzZMUzBXMEVzejZqZ1ozSTUrOVArankwL2xDSFo3?=
 =?utf-8?B?NTRWMWxNZTF0WVkrNTI1MFlIa0NEQ1NHaTU5Q3djdVFpbEMyOVV2V2U2QXA5?=
 =?utf-8?B?UEQ2bWR1cTFCSGZCM1p4c1F2QzFrajBFalZ2eFMyaVVpTzdVVHZRZVBHVXpD?=
 =?utf-8?B?TXN6STMwNTNyK3RNUHQ0TXZHeURVK2VubGQ1L0xaNkhiYVdmUGtoRFUzS0J1?=
 =?utf-8?B?eGxGaWdKYnVWY3R0REtWMDBjUGxTTlhncXNPMCsxV1NObkRVaEhoc1lBNlZv?=
 =?utf-8?B?YkdHRGRHTkRlZURpUWpDeVJEbVJ0MnZ0dlJvNkg4bVBmSDVXZVFoZm5ucVRU?=
 =?utf-8?B?cUdYYm11RWF0RzFraWdSQmpSc29VbWM2TVlxOUlXSEFESnBOemFNRlQzWHNt?=
 =?utf-8?B?Nmd4Vy9tU1dtcDUvdVp1MjZsQnBSODNNVUJoS0QvWUhTazMxQkNoNGFOK2JB?=
 =?utf-8?B?Y0RVc1N6SGY4aEZaemFPSXNUNTArWlhjR29CUTJ0UVNmVHFvUUlHNHcvcHBt?=
 =?utf-8?B?M2ZyVEVZNTFPZE9wMWF2OStYSTc2UjFpZ3dCOWh2WUJtajBYdURNTWE2VjRT?=
 =?utf-8?B?UmlZY2RUZWhVNlQydnBxTjFkVC83YSthdVVNUlRVVVJGeGxYQnpBSlBRYTFE?=
 =?utf-8?B?TVNQcU1nQVNET2NTdVpCdjdoN2pBdFZPTFR6bTVxa0ZzWEpPaURGVHkzaXRJ?=
 =?utf-8?B?V0wrVld3bVNqdHJOS28zUnN1N0I2TUgzelNNNkVGdC9NS0hWaDErdnJKMzRH?=
 =?utf-8?B?eldFRXdiOGZ4QTR4a2FIWGlaODczNnR0T1h5MERra0VjczNrMTVpRFN2Nys0?=
 =?utf-8?B?dWV6TmQxYTlJKzhhYWFpMzNrRVhJSE9ya1VTNE1GSjdXNnFlKzU0QzRPcVpG?=
 =?utf-8?B?eGZOaFFNcklYR3N5bUhxUXo2R3dtNzkwdDZvdC9VUSs4bVk4Y3pINnZsSER3?=
 =?utf-8?B?dTJ6NktaUVlpcHpxMXpYZ1hDNkVYSk5UVlVqcjJUU21rUjUyOHRMdjRvYnZV?=
 =?utf-8?B?SVVQcjU4RE5VcnE5QzlISTRucDFqNkg3K3JOU0pmWmpld3ZKOUMzN3BrdXFY?=
 =?utf-8?B?NDlVdDEwb3NtMVZWdDVjdzV4MTNKQVF6Q3Zlc0l2YVg5TTZzcDdMZkFMWW5a?=
 =?utf-8?B?VkpxSWxIdEpTWHFESW03eDN6RWpMcnVPaXBuZGwrVkkrSzdxMEVxa3BXaUFm?=
 =?utf-8?B?azI5eHlpalpxNTFKWFdwT2tsNmx0QlRoYmdkR2p5SG1DV0YrM2dFeVNGL1RU?=
 =?utf-8?B?bGtKSWtQUkRpMHlEUmJiTFcvc3dueFNEUExrUnRRczFRK2p4RDFSNDB1MkRI?=
 =?utf-8?B?czZOWDVNbGprTnBla2szZHJsQStieEl5YllkVFRxU2loekFEMFluYVBRaW9R?=
 =?utf-8?B?OXY3aTVYejJoYkUraExpUi9mUFdVODBnMWZqSDIrdU1iNTVjWTd0UUJBL1BD?=
 =?utf-8?B?Mm1qVGZPTnFGZGtSZWo1L25CWUdCSlZEa2kxazd5bGtmQVVYcVFEL2REZStk?=
 =?utf-8?B?K29IcHhWbG9wY01qL3MxSTQ4OVZ0cjArOUkyVkFLNjNjRGVBaExvajdJYTNp?=
 =?utf-8?B?UGh4VnEwbWtmejVkUHQ4Q3ZGakNpdmhCM0FvTnBQTVlleGgxYTFGS0VWOHFQ?=
 =?utf-8?B?N1lCNG81c2dFK0xKUDl5UDFxQlNCRjNyTzJsSGtqWldIM3Z5V0JZcE5qY2FD?=
 =?utf-8?B?ZkppVmdvWmdHYWZiWjZROHlIRXdaWWJ6aXNER3BEekMvaFd5THlUVG5tZVlS?=
 =?utf-8?B?SUhTQXVBQXJCYzdxSlJLdTdMcm5EWHpYblk0TTh5ZjNkd24rTXd6STZMOG5L?=
 =?utf-8?B?YVo4NzZNMFBtaDhwZkFCKytBZnJPcnhIOWxoekNWbWpkaWxCL3cwaXA3dTF3?=
 =?utf-8?B?RVNlSllYdHdNekhoMC9mTWYvMTB0T003VTRLUTg0WjdXemFoTm5Cdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B711B2D8F7020743BD4A96E5EAAB79B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5272.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a836550e-c7da-4e6f-a35d-08d9c5799a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 18:33:52.1829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJM/7bCEmxL4VFZ2wQfmEH/mbfvXBT7pf7/JagRc/8I7xZuYdY423jsOmiDQGwHGSMsCflmCdEK1D6Mr5nZ34bsjF0+26MD4NoVipInyjGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5542

SGksDQoNCk9uIDEyLzIwLzIxIDQ6NTAgUE0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4g
DQo+IE9uIFdlZCwgRGVjIDE1LCAyMDIxIGF0IDEyOjU0OjQ5UE0gLTAzMDAsIE1hcmNlbG8gUm9i
ZXJ0byBKaW1lbmV6IHdyb3RlOg0KPj4gSGkgQ3Jpc3RpYW4sDQo+Pg0KPj4gT24gV2VkLCBEZWMg
MTUsIDIwMjEgYXQgMTA6MDQgQU0gPENyaXN0aWFuLkJpcnNhbkBtaWNyb2NoaXAuY29tPiB3cm90
ZToNCj4+Pg0KPj4+IEhpIE1hcmNlbG8sIEpvbmFzLA0KPj4+DQo+Pj4gT24gMTIvMTMvMjEgNDoz
MSBQTSwgTWFyY2VsbyBSb2JlcnRvIEppbWVuZXogd3JvdGU6DQo+Pj4+DQo+Pj4+IFNvbWUgcGVv
cGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
bWFyY2Vsby5qaW1lbmV6QGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IDxo
dHRwOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbj4NCj4+DQo+PiBIdW0s
IHNoYW1lIG9uIG1lLg0KPj4NCj4+Pj4gSGkgSm9uYXMsDQo+Pj4+DQo+Pj4+IFRoYW5rIHlvdSBm
b3IgdGhlIHF1aWNrIHJlc3BvbnNlLCBJIHJlYWxseSBhcHByZWNpYXRlIGl0Lg0KPj4+Pg0KPj4+
PiBPbiBNb24sIERlYyAxMywgMjAyMSBhdCA3OjAyIEFNIEpvbmFzIEJvbm4gPGpvbmFzQG5vcnJi
b25uLnNlIDxtYWlsdG86am9uYXNAbm9ycmJvbm4uc2U+PiB3cm90ZToNCj4+Pj4NCj4+Pj4NCj4+
Pj4gICAgIEdpdmVuIHRoYXQgdGhlIHBhdGNoIHRoYXQgeW91IHdhbnQgdG8gcmV2ZXJ0IGlzIGFs
bW9zdCAzIHllYXJzIG9sZCwgaXQncw0KPj4+PiAgICAgYSBiaXQgb2YgYSBzdHJldGNoIHRvIGNh
bGwgdGhpcyBhIHJlZ3Jlc3Npb24uICBJIHN1c3BlY3QgdGhhdCBhIGNsZWFuZXINCj4+Pj4gICAg
IHdheSBmb3J3YXJkIGlzIHRvIGludHJvZHVjZSBzb21lIGtpbmQgb2YgcXVpcmsgZm9yIHlvdXIg
Ym9hcmQuDQo+Pj4+DQo+Pj4+DQo+Pj4+IFdlbGwsIHRoZSBib2FyZCBpcyBiYXNpY2FsbHkgdGhl
IE1QVSwgc28gaWYgdGhlcmUgaXMgYSBoYXJkd2FyZSBwcm9ibGVtIGl0IHdvdWxkIG1lYW4gdGhh
dCBpdCBpcyBhIHByb2JsZW0gd2l0aCB0aGUgb24gY2hpcCBwZXJpcGhlcmFsLg0KPj4+Pg0KPj4+
Pg0KPj4+PiAgICAgSSBoYXZlIGEgc2VsZi1wb3dlcmVkIGJvYXJkIHdoZXJlIHRoZSBVU0Igc3Vz
cGVuZCBzZXF1ZW5jZSB3b3JrcyBhbmQNCj4+Pj4gICAgIGRldmljZSBhZGQvcmVtb3ZlIHdvcmtz
IGZpbmUuICBTbyBmdW5kYW1lbnRhbGx5LCBJIHN1c3BlY3QgdGhhdCB0aGUNCj4+Pj4gICAgIGRy
aXZlciBpcyBvay4NCj4+Pj4NCj4+Pj4NCj4+Pj4gTWF5YmUgeW91IGhhdmUgVkJVUyBzZW5zaW5n
IGVuYWJsZWQgaW4geW91ciBib2FyZC4gQXMgSSByZXBvcnRlZCBiZWZvcmUsIHRoZSBWQlVTIHNl
bnNpbmcgaXMgbm90IGFuIG9wdGlvbiBpbiB0aGlzIGJvYXJkLiBOb25ldGhlbGVzcywgdGhlIGNv
ZGUgaW4gdGhlIGtlcm5lbCBzdWdnZXN0cyB0aGF0IFZCVVMgc2Vuc2luZyBpcyBvcHRpb25hbCwg
c2luY2UgdGhlIHByZXNlbmNlIG9mIGEgVkJVUyBzZW5zaW5nIHBpbiBpcyBleHBsaWNpdGx5IHRl
c3RlZCBpbiBpdC4NCj4+Pg0KPj4+IElzIGl0IHBvc3NpYmxlIHRvIGFkZCBhIHdpcmUgdGhhdCBj
b25uZWN0cyBWQlVTIHRvIHRoZSByaWdodCBwaW4gb24gdGhlIE1QVSA/IEp1c3QgdG8gc2VlIGlm
IHRoaXMgaGFzIGFuIGltcGFjdCBvciBub3QgPw0KPj4NCj4+IFllcy4gTWF5YmUgSSB3YXMgbm90
IGNsZWFyIGFib3V0IHRoYXQgaXNzdWUsIHNvIGxldCBtZSB0cnkgdG8gY2xhcmlmeS4NCj4+IFRo
ZSBib2FyZCBfc2VlbXNfIHRvIGhhdmUgYSBwcm92aXNpb24gZm9yIFZCVVMgc2Vuc2luZywgYnV0
IGl0IGlzIG5vdA0KPj4gd29ya2luZy4gSSB3YXMgbm90IGludm9sdmVkIGluIHRoaXMgYm9hcmQn
cyBwcm9qZWN0IGFuZCBJIGZvdW5kIG5vDQo+PiBvdGhlciBkb2N1bWVudGF0aW9uIG9uIHRoZSBB
Q01FIFN5c3RlbXMgc2l0ZSwgYWxsIEkgYW0gc2F5aW5nIGhlcmUgaXMNCj4+IGZyb20gcmVhZGlu
ZyB0aGUgY2lyY3VpdCBkaWFncmFtLCBzbyBpdCBpcyBhbGwgbXkgcGVyc29uYWwNCj4+IGludGVy
cHJldGF0aW9uLiBGb3IgaGFyZHdhcmUgcmVhc29ucywgdGhlIGFmb3JlbWVudGlvbmVkIFZCVVMg
c2Vuc2luZw0KPj4gcGluIGRvZXMgbm90IHJlYWNoIHplcm8gdm9sdHMgd2hlbiB0aGUgVVNCIGNv
bm5lY3RvciBpcyByZW1vdmVkLCB3aGljaA0KPj4gbWFrZXMgVkJVUyBzZW5zaW5nIGluZWZmZWN0
aXZlLiBCdXQgSSBoYXZlIHRlc3RlZCBpdCBhbnl3YXkgYW5kIHRvDQo+PiBtYWtlIGl0IHdvcmss
IHRoZSBmaXJzdCBzdGVwIGlzIHRvIHByZXBhcmUgdGhlIGJvYXJkIGFzIHNwZWNpZmllZCBoZXJl
DQo+PiBodHRwczovL3d3dy5hY21lc3lzdGVtcy5pdC9hcmlldHRhX3Bvd2VyX3N1cHBseSBpbiB0
aGUgc2VjdGlvbiAiU3VwcGx5DQo+PiBwb3dlciBhdCAzLjMgdm9sdCIuIFRoZSBrZXkgaGVyZSBp
cyB0byByZW1vdmUgdGhlIFIzNiByZXNpc3Rvciwgc28NCj4+IHRoYXQgdGhlIGJvYXJkIGNhbiBi
ZSBmZWQgYnkgYW4gZXh0ZXJuYWwgMy4zViB2b2x0YWdlIGFuZCBiZWNvbWUgc2VsZg0KPj4gcG93
ZXJlZC4gVGhlbiwgeW91IGFkZCBhIGxpbmUgImF0bWVsLHZidXMtZ3BpbyA9IDwmcGlvQiAxNiAw
PjsiIGJlbG93DQo+PiB0aGUgInVzYjI6IiBsaW5lIGluIHRoZSBBcmlldHRhIERURC4gQWZ0ZXIg
cmVjb21waWxpbmcgdGhlIGtlcm5lbCBhbmQNCj4+IGluc3RhbGxpbmcsIGl0IHN0aWxsIGRvZXMg
bm90IHdvcmsgYnkganVzdCB1bnBsdWdnaW5nIHRoZSBVU0IgY2FibGUuDQo+PiBZb3UgbmVlZCB0
byBtYW51YWxseSBhbmQgY2FyZWZ1bGx5ICghKSBzaG9ydCBjaXJjdWl0IHRoZSArNSBVU0IgbGlu
ZQ0KPj4gdG8gdGhlIGdyb3VuZCB3aGVuIHRoZSBjYWJsZSBpcyBub3QgY29ubmVjdGVkLiBPbmx5
IHRoZW4gVkJVUyBzZW5zaW5nDQo+PiB3aWxsIHdvcmsgYW5kIHRoZSBkZXZpY2Ugd2lsbCBhY2Nl
cHQgZW51bWVyYXRpb24gYWdhaW4uDQo+Pg0KPj4gSW4gc2hvcnQsIHRoZSBWQlVTIHNlbnNpbmcg
Y29kZSBpbiB0aGUga2VybmVsIGlzIG9rLiBCdXQgdGhhdCBpcyBub3QNCj4+IG15IHBvaW50LiBN
eSBwb2ludCBpcyB0aGF0IHRoZSBrZXJuZWwgY29kZSBpbXBsaWVzIHRoYXQgaXQgaXMgcG9zc2li
bGUNCj4+IHRvIGRvIHdpdGhvdXQgYSBWQlVTIHNlbnNpbmcgcGluLiBUaGUgZmlsZQ0KPj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9hdG1lbC11c2IudHh0IHN0YXRlcyB0
aGF0DQo+PiAiYXRtZWwsdmJ1cy1ncGlvIiBpcyBhbiBvcHRpb25hbCBwcm9wZXJ0eS4gU28sIGl0
IHNlZW1zIHRvIG1lIGxpa2UgdGhlDQo+PiBjb2RlIHNob3VsZCB3b3JrIHdpdGhvdXQgaXQsIGFu
ZCBpbmRlZWQgaXQgd29ya2VkLiBUaGF0IGlzIHdoeSBJIGhhdmUNCj4+IGNhbGxlZCB0aGlzIGEg
cmVncmVzc2lvbi4NCg0KSW4gVVNCIDIuMCBzcGVjaWZpY2F0aW9uIChDaGFwdGVyIDkuMS4xLjIg
UG93ZXJlZCkgdGhlcmUgaXMgdGhlIGZvbGxvd2luZw0Kc2VudGVuY2U6IOKAnEFsdGhvdWdoIHNl
bGYtcG93ZXJlZCBkZXZpY2VzIG1heSBhbHJlYWR5IGJlIHBvd2VyZWQgYmVmb3JlIHRoZXkNCmFy
ZSBhdHRhY2hlZCB0byB0aGUgVVNCLCB0aGV5IGFyZSBub3QgY29uc2lkZXJlZCB0byBiZSBpbiB0
aGUgUG93ZXJlZCBzdGF0ZQ0KdW50aWwgdGhleSBhcmUgYXR0YWNoZWQgdG8gdGhlIFVTQiBhbmQg
VkJVUyBpcyBhcHBsaWVkIHRvIHRoZSBkZXZpY2Uu4oCdIFRoaXMNCm1ha2VzIFZCVVMgc2Vuc2lu
ZyBtYW5kYXRvcnkgZm9yIHNlbGYtcG93ZXJlZCBkZXZpY2VzIGFuZCBub24gbWFuZGF0b3J5IGZv
cg0KYnVzLXBvd2VyZWQgZGV2aWNlcy4gVGhpcyBpcyBob3csIGluIG15IG9waW5pb24sIOKAnGF0
bWVsLHZidXMtZ3Bpb+KAnSBzaG91bGQNCmJlIHVzZWQgKG9wdGlvbmFsIGZvciBidXMtcG93ZXJl
ZCBkZXZpY2VzIG9ubHkpLg0KDQpZZXN0ZXJkYXkgSSByZW1vdmVkIHRoZSDigJxhdG1lbCx2YnVz
LWdwaW/igJ0gIGZyb20gU0FNOXg2MC1FSyBkZXZpY2UgdHJlZSB0bw0KY3JlYXRlIGEgc2V0dXAg
Y2xvc2UgdG8gdGhlIG9uZSB1c2VkIGJ5IE1hcmNlbG8gYW5kIHBlcmZvcm1lZCBhIHRlc3QuIEFm
dGVyDQpwbHVnZ2luZyAvIHVucGx1Z2dpbmcgdGhlIHVzYiBkZXZpY2UgY2FibGUgdGhlIEV0aGVy
bmV0IGdhZGdldCBpcyBhYmxlIHRvDQpyZS1lbnVtZXJhdGUuIFRoaXMgbWFrZXMgbWUgdGhpbmsg
dGhlIGlzc3VlIGlzIHNwZWNpZmljIHRvIEFyaWV0dGEgYm9hcmQgb3INCnRvIFNBTTlHMjUgU29D
LiBJIHJldHJpZXZlZCBhIFNBTTl4NSBmcm9tIG9mZmljZSBhbmQgSSBuZWVkIHRvIHByZXBhcmUg
aXQNCmJlZm9yZSBJ4oCZbSBhYmxlIHRvIHJ1biBzb21lIHRlc3RzIG9uIGl0LiBUaGlzIGNhbiB0
ZWxsIHVzIGlmIHRoZSBpc3N1ZSBpcw0KYm9hcmQgb3IgU29DIHJlbGF0ZWQuDQoNCkJ5IHJldmVy
dGluZyB0aGlzIHBhdGNoIEnigJltIGFmcmFpZCB3ZSBlbmNvdXJhZ2UgYm9hcmQgZGVzaWduZXJz
IHRvIG5vdA0KaW1wbGVtZW50IFZCVVMgZGV0ZWN0aW9uIGJlY2F1c2UgdGhlIGRyaXZlciB1c2Vk
IHRvIGp1c3Qgd29yayB3aXRob3V0IGl0DQphbmQgSSB0aGluayBpcyBub3QgY29ycmVjdC4NCg0K
Q3VycmVudGx5IEnigJltIG5vdCBhYmxlIHRvIHJlcGxpY2F0ZWQgdGhlIGlzc3VlIHRvIGRlYnVn
IGl0LiBJ4oCZbSB3aWxsaW5nIHRvDQpjb250aW51ZSB0byBpbnZlc3RpZ2F0ZSB0aGlzIGFuZCBw
cm9wb3NlIGEgcGF0Y2ggYnV0IHdpbGwgbmVlZCBzb21lIGhlbHAgaW4NCnJlcHJvZHVjaW5nIGl0
IG9uIG9uZSBvZiBvdXIgYm9hcmRzLiBBbm90aGVyIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGVu
YWJsZQ0KZGVidWcgaW5mb3JtYXRpb24gaW4gdGhlIGRyaXZlciBvbiBBcmlldHRhIGJvYXJkIA0K
KGJ5IHVzaW5nICNkZWZpbmUgREVCVUdfTEVWRUwgREJHX0FMTCBpbiBhdG1lbF91c2JhX3VkYy5o
KSBhbmQgc2VuZCB0aGUgbG9ncw0KdG8gbXkgZW1haWwuDQoNClJlZ2FyZHMsDQpDcmlzdGlhbg0K
DQo+IA0KPiBZZXMsIGhhcmR3YXJlIHRoYXQgdXNlZCB0byB3b3JrLCBhbmQgbm93IGRvZXMgbm90
LCBpcyBhIHJlZ3Jlc3Npb24uDQo+IA0KPiBTbywgc2hvdWxkIEkgcmV2ZXJ0IHRoZSBvZmZlbmRp
bmcgcGF0Y2ggaGVyZT8gIEFkZGluZyBuZXcgZmVhdHVyZXMgaXMNCj4gbm90IGEgZ29vZCByZWFz
b24gdG8ga2VlcCB0aGluZ3MgdGhhdCBicmVhayBzeXN0ZW1zLiAgT3IgaXMgdGhlcmUgYQ0KPiBw
b3RlbnRpYWwgZml4IGluIHRoaXMgdGhyZWFkIHRoYXQgSSBtaXNzZWQ/DQo+IA0KPiB0aGFua3Ms
DQo+IA0KPiBncmVnIGstaA0KPiANCg==
