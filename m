Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.63.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210635;
	b=txCRLzdj+gDhb0MKUkutILaw5RtJ80zCBOno7mQ80ebxc8H9V8PjwZpjyrE8qTJDhm4B
	 PnhCX254hYzk6+uMVjcdVJdljKnSZUGqD3h3fUJtqWOjNaJ94feE8t4YUbJmE3MfLNZSI
	 RaD6rIbhKtM1Sd/1j44NqTe/K9R/IACtw6YCtbR0ErNMD+HDKy4l0s+5GyNT63JMPGhaQ
	 Ohk6lkPZaIuRy6Mt3XnaXKZvf/h2YslSdh9y4xIfv0Ewnc8gSV8S1r+923+o2WhvIP0c4
	 tlO2qJ/BHX5dKiJFIhNxzVMBhUMh/gfT8hR6VAirz4NRZcLvDg6mk0j4Vxr2mDb8G8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210635;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-fermilab-ob:
	 x-fermilab-sender-location:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=z9nhg3GGyjpGDFqfbr3Sqs+FgLCFblxI4WDkrwgYWZg=;
	b=Ki+7pWAc3TcfWky0ceE/B1mhd3P3B6l5igkuxzzJwybY2HlWmfurvaI1aM7E2m4EqXWu
	 KkX4jX/2+XUCO8nE13NDpjJah7dxGGnCGLeYnzQfftZLEQ0CfczUB8YiAxnpgZfRfF/jq
	 Zo4C6dYkcRAc68sF59ElqM2nTgEAWGjUVVv8P9vnKexH5ickkXiC/kyMx+bAhJBodlW6/
	 j1jjHFHoN9L5dPcODo1SW890/wdLiHUnAzULsOfGRu5wChy9+OIRAXI3qTlTkm1iXVEFJ
	 x5topzEy3OoWDDGdx7bE/DRQhF8iJIrcBypWbu2fSuhwAGqDhjc/hWSBZGEjqKwb+8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fnal.gov;
	spf=pass smtp.mailfrom=fnal.gov;
	dkim=pass header.d=fnal.gov header.i=@fnal.gov header.a=rsa-sha256 header.s=selector2 header.b=XdgM50ye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.63.51
Received: from DM4PR09CU001.outbound.protection.outlook.com (mail-centralusazon11012051.outbound.protection.outlook.com [52.101.63.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DA606A69C
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 21:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1DA606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fnal.gov
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnal.gov
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fnal.gov header.i=@fnal.gov header.a=rsa-sha256 header.s=selector2 header.b=XdgM50ye
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzVin1slM/WPuColki8PHLza4c6Zg2+GD8FiE+80tlJJDnpDNSAnPdyD6ZSgRX0ZIlXeq55+C+CE6yJw5+2OMnNQC4q31DAL0R19RfZv/Gh1Kq1EVmrkyS0/YNTh6F6/74FT12KpHbIcdgM2g2IWygMtfZA8bAGajtMIxFzxrS3i211nGVCVCQhh335dSsbZsX1YshFYQuyEP3DOYGOvigjCX9bB5NITM1UOFqYwCU8oPYkPpBL5R6292CbvAmbiXOzzQ4KwFz+h1W8I+Buo7eseVhW66erSUzJKOhBV0Zw08T5DcmBsX2AwaG18m5dlU+2DjLIcPLYFtaYT6N2/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9nhg3GGyjpGDFqfbr3Sqs+FgLCFblxI4WDkrwgYWZg=;
 b=EyWOPIkdiEKbwduJ4TrI2x0VQpPse5BaqpW7+/JXjLHKR5SWb6RNLosPIo6dIW7iYQDTS0NKQdsYWU4v8QakaStVVScub6ixoHuwHdUn29prbtLlpAk1dZBQHMsrl3d1RyfXtlbcSF4DvqTcTiEx3/c90ChRsCM9h3Y3BMpq5cRGnKBvLBd/ifMnBAmmgkRgq8+vPgKhqCUDWosZJP0cj+8WOqjgKXVe4q4zd4qieurN4QAmAP6QssgflvKjcwgiR8MPha1qwa21a66+EY9TLn80tqLeAuetlSIdbjmo2BO35DaidsSpN6D7jJTFt/IZbCwckL1JestIkZIVBWPToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fnal.gov; dmarc=pass action=none header.from=fnal.gov;
 dkim=pass header.d=fnal.gov; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fnal.gov; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9nhg3GGyjpGDFqfbr3Sqs+FgLCFblxI4WDkrwgYWZg=;
 b=XdgM50yeRQS3UzjVkGGjwxRI/hQMS88lbzD1Mq7CxtH5tLL3jWL+5P1QSXylQJrPiIMxM4F3LWuu2oz+2zv58Kn5HrGQh7RC/2PkaYxEhTSqG9NjJCtrTEXZ1++v3lguR3trQ2EYw+/jeeOBAl9lgFlEr/OfD+3iRW/pOwPozOO2EgSACe/ZLVKQ2ik0HUS9lKGQrhmkt2EsQMQrwkH3AJP7/JJPGmNUFSP2kpaC4Y8wHiUh0koUABZIe3uV6TqGmIUWMbt0YB5THQKn5g+z5csKn62RgdPAwgAJNlaJYOjk7GCFTjo0oxGPgn1xw3iyKeCic+CBZcWYRkK939W+HA==
Received: from DS5PR09MB13532.namprd09.prod.outlook.com (2603:10b6:8:47a::5)
 by PH8PR09MB9214.namprd09.prod.outlook.com (2603:10b6:510:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 21:37:10 +0000
Received: from DS5PR09MB13532.namprd09.prod.outlook.com
 ([fe80::21dd:6f53:4c7c:1611]) by DS5PR09MB13532.namprd09.prod.outlook.com
 ([fe80::21dd:6f53:4c7c:1611%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 21:37:09 +0000
From: Ronald Rechenmacher <ron@fnal.gov>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20 in BW
 allocation mode for HBR3-only DP OUT, external monitors stay black (v7.2 ->
 v7.3)
Thread-Topic: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20
 in BW allocation mode for HBR3-only DP OUT, external monitors stay black
 (v7.2 -> v7.3)
Thread-Index: AQHdeST1dAec1YnCd0qQ5BmHrAikIg==
Date: Fri, 20 Nov 2026 21:37:09 +0000
Message-ID:
 <DS5PR09MB1353250098A5804464BB8BAE6DC782@DS5PR09MB13532.namprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fnal.gov;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS5PR09MB13532:EE_|PH8PR09MB9214:EE_
x-ms-office365-filtering-correlation-id: a66a50f0-68c2-4bad-16fd-08df474e6ea5
x-fermilab-ob: 1
x-fermilab-sender-location: inside
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|10067099003|38070700021|261026121527099003|56012099006|261022113327099003|261026140227099003|261009223027099003|261021135927099003|261102130727099003|261102123227099003|261026130827099003|261021123027099003|261028144727099003|261022115727099003|261022075727099003|261022105027099003|261026135527099003|261021121427099003|261021133027099003|261021130227099003|6133799003|18002099003|3023799007|4133799003;
x-microsoft-antispam-message-info:
 vMudLgX94cqzPZ3I5/oQsTrki3DAlTdUr7H9SNPbVKq3fmsu2NZjRf6U17zR0trmFjmZsP8Bgkia2MRE9qpDlNmyfg5Msu30ibiKh3yVr6I79umeI7r7BUXwwjQc0ehwm19Z4C1oEHkdgYg141p30HywYsvBMrniM7ftNGPPgHk9ifY4BitHHfvCt4rNhbgI85ajNWj9Jz56Iz+AtFuAA0+QOf8s8X2Z41N0x8V2w1JUijwZtQ3/DbjDExUeSpU+Ee7NQHmuuaFiRBMFjdI7nhtewlFpFCd4EPJmRQU5d/86ZYGqKL6lZ5Pkp86008QYDa0+t2v5yKJ/pe/O73yoQSFqxTP7JPZn6KpUI/3ChyzkF9CpIbhx5Uy9B7sXhm7FcAs6IGrnP/Vm3ObVjkP8lqHETQprgtPiSC1MoeBa5ztJlxSEcSwPgIkb7ZxJMdV855xQ0BgyIIPd2QkURAoOZFtvPqnCmnmOyJ1gBXTb2YYpPNgOMs7vHHoc+qTv8WUHyL6CoCs7FqO/tq/vhU/8RtGhIn9+DDPrCYphPRpysfARsKfiFudTlJNDJLCgzCacXhIbCylpXKXHmIAV6ouYQX04W5A4YUr8t0/Ww/Jn3Vk4xaip/q4GQniuANVxgjzJLc134ebBKOiA6NrQpVq6I+9pyclsf9n54PHIl6as1f4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR09MB13532.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10067099003)(38070700021)(261026121527099003)(56012099006)(261022113327099003)(261026140227099003)(261009223027099003)(261021135927099003)(261102130727099003)(261102123227099003)(261026130827099003)(261021123027099003)(261028144727099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026135527099003)(261021121427099003)(261021133027099003)(261021130227099003)(6133799003)(18002099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZGUHSQ6wHS8B9j4FYA7IKwdLkCK0v9/x/5V3SG7bFLN9dTZl8Ms0QDHexf?=
 =?iso-8859-1?Q?tWQ/ynuTt43QEXqdmJt8U2FR4MyYreY/vUBWUi+kc5U++O3ufyiHQuCyIT?=
 =?iso-8859-1?Q?BcDeVutohIhZJHQrrTziF5M2wPhGYk71UW97bLEkmkDwX7oIpFPe8YAO8x?=
 =?iso-8859-1?Q?oBbaVyI3/RskDI9juMkgjXTyN5eOynNgV/fWJyAiXSrhYRs8RqgW0Iz2kd?=
 =?iso-8859-1?Q?+k+bswJUqRogoLQEWpWyrfvntZhOrpxKrD6cmmv5D43JIqKbZWbEGL7rJl?=
 =?iso-8859-1?Q?2jG6jFBu4+HT/2a5IhKEezz4XJdBQ75QYRPmZZM6B96aeajZTBjh7JAKse?=
 =?iso-8859-1?Q?mmNCmPEbJFY5uKb/UZMQkz19MvcD/Lh9yq68M0So6S1Fz2OM28lW+xJmCB?=
 =?iso-8859-1?Q?L2hZNt2rJx6y0+yL0PewMrYSqRiLRSj7xeC/PZ3gWWctca934TG8nwMoKK?=
 =?iso-8859-1?Q?gNx+p0u21Qc7W5X98vH8cIYHxdOa6Dl8EEirA8pgnFcQtswS8WSE7rIpOU?=
 =?iso-8859-1?Q?07ln6OKQOl4NC8BNEw8lDT0UL/8viUfguqWDReEbhkF9geLjRS+ANDzjD/?=
 =?iso-8859-1?Q?UDxGYRYqiqH7keCWLlBUwIbm/Vs2/xZVEW56N8Y3Mp8nYOdUDiPqQKlnY7?=
 =?iso-8859-1?Q?Sqh5Alj1lr8mEdensbvkWDKGgoCUs6HJqrUk4nyYGH9rp+W/eTJ9cDo6Lw?=
 =?iso-8859-1?Q?ywYzEkaRb/vJOISeEUFqQ8Rv0Et+0WpqPiSwiX8BncK4tUjRjxcYvDZmvz?=
 =?iso-8859-1?Q?O94S1PWwX9mWLYDeBlBdbmVQvhcRTvhQc/isDZlJ0+n7qQY3hkTU7SQmRW?=
 =?iso-8859-1?Q?geOM/+Zots/vAiUnfs224Zc03L+I7ZDDnByZtXdzm7QHtbdRW/6BbccP1z?=
 =?iso-8859-1?Q?AAaSYwLisw7AIPW0nl3Jb1T+R3mUpieS62z2AC+zReA0Gb3nqYjWuouguI?=
 =?iso-8859-1?Q?MWR8pl9NTD2m2UNy2Khi9NjN77yAGsaOwyAaIwPan3ISV9g5LBYuxbfQ0O?=
 =?iso-8859-1?Q?bnomLVN/Y1SCPfV2S5jZs3rzQ0SiIjux37WqI2j05peJS7xYPJp8Qye3lv?=
 =?iso-8859-1?Q?FG1jX9QKRxeedU8sMrZFjYWLTFhSG0eCkPv5D0HwrbZyL7vQdx6UWxld/6?=
 =?iso-8859-1?Q?SA9seIDSIrtBbgOQ/ogIvSpGLDgIgX9+wrxyocp2cgjnsKg7HmVr81pkrO?=
 =?iso-8859-1?Q?TZrpp1PJI/g304sloKHqPLXtW0Dh3pPbg0sJp8dEm0fwmgImZl9444Mx4d?=
 =?iso-8859-1?Q?sT3Ss68XBPFyhiaAwdxIIrG8s+kM6WYvKhsUv4QdY49wQSNLUaq2e3/i7W?=
 =?iso-8859-1?Q?CoB89H30SjNYvoC2tXvrMMnVWGAQEKX3T6mTwDOuJBj7P3tli6/xX03ZDw?=
 =?iso-8859-1?Q?80VeM26NmrxuwV7bdOPzu9ZgXGEcnsu4DLqQwKFYzAQ1oT61M4Vuz3Xvvs?=
 =?iso-8859-1?Q?yrpU0kIckX4Ly33W00DbUuSQnJsCAjjmM3F4Q0nXdlGmn9yg2MBlDz9yug?=
 =?iso-8859-1?Q?6HTvwok63IZGHCquJ1bgGbNksS4febA3XUyC7ITqvJkhl9UoZmlh55LzPm?=
 =?iso-8859-1?Q?kTrZxyfyKI/qiI1OTeAdPp0PyDZr5qDq15sqXR2jOBQYa0RMNnD1E6kSuP?=
 =?iso-8859-1?Q?6gE82CjDgFw4JPR+egnhcpsLYxZBsal+8Vo6TF3gohcTX3nIEcgkLehbT/?=
 =?iso-8859-1?Q?gnHgmBDIM2bTXj+1PPKDgT3PhsdXwOpow6zOj+k1XX3CRpGOaOICkhV0lb?=
 =?iso-8859-1?Q?qQuN00XUdbCZv+dTwsZfL2JHK5fI4AwFV/4n2EpzVShb5laGNRQ/fUMl85?=
 =?iso-8859-1?Q?fj3t7UdyHA=3D=3D?=
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
X-OriginatorOrg: fnal.gov
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS5PR09MB13532.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66a50f0-68c2-4bad-16fd-08df474e6ea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 21:37:09.8822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d5f83d3-d338-4fd3-b1c9-b7d94d70255a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR09MB9214

Subject: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20 in=
 BW allocation mode for HBR3-only DP OUT, external monitors stay black (v7.=
2 -> v7.3)=0A=
=0A=
To: Thunderbolt/USB4 maintainers, linux-usb=0A=
Cc: i915/DP tunnel developers, intel-gfx, regressions=0A=
=0A=
Hi,=0A=
=0A=
Since moving from 7.2 to 7.3, the external monitors behind a Thunderbolt 5=
=0A=
dock stay black. They are detected, read EDID, and show up in the desktop's=
=0A=
display settings, but no picture appears. Booting with=0A=
thunderbolt.bw_alloc_mode=3D0 fixes it completely.=0A=
=0A=
#regzbot introduced: v7.2..v7.3=0A=
=0A=
Hardware=0A=
--------=0A=
- Laptop: Dell Pro Max 18 Plus MB18250, BIOS 3.5.2 (10/15/2026)=0A=
- CPU/display: Arrow Lake-HX, i915 (MTL display version 14.00, PCI 8086:7d6=
7)=0A=
- Host router: Barlow Ridge JHL9580 (8086:5780/5781), NVM 64.81; the=0A=
  i915 DDI TC3 port is wired to the router's DP IN (TC port mode "legacy")=
=0A=
- Dock: Dell Pro TBT5 Dock WD25TB5 (Barlow Ridge hub JHL9480), NVM 69.81,=
=0A=
  internal Synaptics MST branch (DPCD 1.4, max HBR3 x4)=0A=
- 3 monitors on the MST hub: 2x 3840x2160@60 (one uses DSC), 1x 1920x1080@6=
0=0A=
- USB4 link to the dock comes up asymmetric (3 RX / 1 TX, 40 Gb/s lanes)=0A=
=0A=
Kernels=0A=
-------=0A=
- Good: 7.2.15 (Fedora 7.2.15-200.fc44)=0A=
- Bad:  7.3.3  (Fedora 7.3.3-300.fc45)=0A=
- The 7.3.4 stable changelog has no i915, drm display, or thunderbolt=0A=
  changes, so I expect 7.3.4 to be affected too (not tested).=0A=
=0A=
What happens=0A=
------------=0A=
Both tunnel adapters report HBR3 x4 as their maximum. With bandwidth=0A=
allocation mode enabled, though, the tunnel's maximum is reported as=0A=
UHBR20 x4, and i915 picks that up as the DPRX rate:=0A=
=0A=
  thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP IN maximum supported ban=
dwidth 8100 Mb/s x4 =3D 25920 Mb/s=0A=
  thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP OUT maximum supported ba=
ndwidth 8100 Mb/s x4 =3D 25920 Mb/s=0A=
  thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): non-reduced bandwidth 8100 =
Mb/s x4 =3D 25920 Mb/s=0A=
  thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): maximum bandwidth through a=
llocation mode 20000 Mb/s x4 =3D 77575 Mb/s=0A=
  thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation mode e=
nabled=0A=
  i915 0000:00:02.0: [drm:drm_dp_tunnel_enable_bw_alloc] [DPTUN 1:1:13][AUX=
 USBC3/DDI TC3/PHY TC3] Enabling BW alloc mode: DPRX:20000x4 Group alloc:0/=
103500 Mb/s (Ok)=0A=
=0A=
The LTTPR (LTTPR 1) PHY capabilities read by i915 also flip between=0A=
"04 03 00" and "04 00 00" around this point, i.e. its 128b/132b UHBR10/20=
=0A=
bits come and go.=0A=
=0A=
i915 then tries 128b/132b, which always fails:=0A=
=0A=
  i915 [CONNECTOR:543:DP-3][ENCODER:542:DDI TC3/PHY TC3][DPRX] Max loop cou=
nt reached=0A=
  i915 ... [DPRX] 128b/132b Link Training failed at link rate =3D 2000000, =
lane count =3D 4=0A=
  i915 ... [DPRX] 128b/132b Link Training failed at link rate =3D 2000000, =
lane count =3D 4=0A=
  i915 ... [DPRX] Reducing link parameters from 4x2000000 to 4x1000000=0A=
=0A=
Two observed outcomes:=0A=
=0A=
1. Cold boot with the dock attached: UHBR20 and UHBR10 fail, then i915 fall=
s=0A=
   back to HBR3, and 8b/10b training passes for both the LTTPR and the DPRX=
.=0A=
   The monitors still stay black.=0A=
2. Dock hotplug: the fallback state is reset, and UHBR20 fails twice. The=
=0A=
   limit drops to UHBR10, but there is no further training attempt, and=0A=
   i915_display_info still shows port_clock=3D2000000 on all MST pipes. The=
=0A=
   monitors stay black. On the hotplug path i915's modeset retry also hit a=
=0A=
   WARN in snd_hda_spdif_ctls_unassign (from=0A=
   intel_connector_modeset_retry_work_fn -> intel_audio_codec_disable).=0A=
=0A=
In about 12 boot/hotplug attempts on 7.3.3, the monitors came up once or tw=
ice.=0A=
=0A=
Workarounds that work on 7.3.3=0A=
------------------------------=0A=
a) thunderbolt.bw_alloc_mode=3D0 on the kernel command line: no UHBR attemp=
ts,=0A=
   training passes at HBR3 x4 on the first try at boot and after hotplug,=
=0A=
   all monitors work, no i915 errors.=0A=
b) With BW allocation mode left enabled, forcing HBR3 before any UHBR attem=
pt=0A=
   on the new link also works, and the forced rate survives later hotplugs:=
=0A=
     echo 810000 > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_li=
nk_rate=0A=
     echo 1      > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_li=
nk_retrain=0A=
   Forcing 540000 the same way trained successfully but stayed black (needs=
=0A=
   DSC at ~13 bpp for this monitor setup).=0A=
=0A=
So falling back to HBR3 after a failed UHBR attempt is not enough; HBR3 onl=
y=0A=
works when UHBR is never attempted. My guess is that the failed 128b/132b=
=0A=
training leaves the Barlow Ridge DP IN/OUT path or the dock's branch device=
 in=0A=
a state that 8b/10b retraining does not recover, but I can't verify that.=
=0A=
=0A=
On 7.2.15, i915 always reports i915_dp_max_link_rate=3D810000 for this=0A=
connector and never logs a 128b/132b attempt or a link training error. I=0A=
don't have drm.debug/thunderbolt dyndbg logs from 7.2, so I can't say wheth=
er=0A=
7.2 enabled BW allocation mode on this tunnel.=0A=
=0A=
Questions=0A=
---------=0A=
- Should the tunnel's "maximum bandwidth through allocation mode" be capped=
=0A=
  by the DP OUT adapter's maximum (HBR3 x4 here)?=0A=
- Should i915 handle a failed UHBR attempt on this path differently, keepin=
g=0A=
  the fallback across hotplug and recovering after the 8b/10b fallback?=0A=
=0A=
I have full logs (drm.debug=3D0x10e thunderbolt.dyndbg=3D+p) for the bad bo=
ot,=0A=
covering a cold boot, a hotplug, and both debugfs experiments, plus=0A=
i915_display_info, i915_dp_mst_info and connector debugfs snapshots from 7.=
2.15=0A=
and 7.3.3. I can test patches or a mainline build, and can bisect v7.2..v7.=
3=0A=
if that helps.=0A=
Download URL: https://drive.google.com/uc?export=3Ddownload&id=3D1ZE5GYE69I=
gIpT6fWs5XHmMpseIurGgK8=0A=
=0A=
Thanks,=0A=
Ron Rechenmacher=
