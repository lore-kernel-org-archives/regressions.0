Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9B3A75B8;
	Tue,  7 Jul 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405838; cv=fail; b=eDRJTES4x5Iiem2L2tXywQCS9fNiIutVftKAPCXjnF5WU2ci9qKX4pdXct0Vw3EKSFwq8+7iG9a8jN0Rpr7H70AQrALYq+i4W0NWwp5Om0Ht8awtu+5wMe3ZiONEshm9bZDPuVPf0CKOYHJs/jAUoO7vEhibR2yB6AnGk7QnSyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405838; c=relaxed/simple;
	bh=y1CwSL5KVKzBT8rcJggoDG6z/ThMu3A8AGdNGjpkHbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WvQ/BQPqm3G1XpT1D68ZqKW+rV6N9q89/NI7DVnIgO+lwDX+sQz9g6hs4bukbB2sh5gcPHg9DgUaIA5YhRbhaKa7daCabwVRohNTRlHpkOGCDuOuR+QfNzw/HQscZLhWdVW7XJoeScdH0Pztlq/EKMnmCKEjivF6k/+coaRKgP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WqzGzuAv; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WqzGzuAv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+17e38ZXKYu7OHhPDpQSkmp9lk9Kg2Q7oFQWTvFvqUytg6RzudTiL1pYIxZNZIDx8/jpVARLpOt6CRLI/QdTVxJSlU9oY65UFhImCrWvzqxXWEBpX7xuQ+Zh+NM781yZGppHLUenOVARW/PtT/gYcWbBOZ5jDjwlm1xSr5MnuMwyqUFsXGCUfF2VUmQPQWQdrwgafH0eBDfVcb4KQNotNfTHF5vdwKhBWWBkhuv4I5DuBG4K01zYZEGxeqn7WVp8FHtQjjmdgi6Q+3POfGZM+cKT08lm15qSyvgOetZ/dYo3t3zowrOd8r6mFKrp0GXo28B1gWPL/hKz9PZjzTIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35zwksbQ3z23FFWrK81h1fGutMv+YmS5I2sjdfQYZiI=;
 b=YKVg5wfv9xbsnze7xjy2STjt+pne0f6p4KJ53zqAMcPm+9mzq4B+TYB3ciT0FAdmvGNFtLmxhZME2IxnkNVf7k0fFBxz9i29V60JxQHFWWAfzSDDZ5L7keUwegNgwHEExA3ASasJ4hMkWWFCgyBtbL39wJwJkgSh2KADm4Kfs8xxwpiq5dUlwg7U/lttP9T4n0M1rcnhsv0iUVG5Ex6qKJ5GienchEx1bUHxO5AePPX50Dkhz7m5tIsT/CPX0B37nl+vmra+9kq5JDJcMVs71vR9K0oFRyCLJ8Xs1+uXmD63jA6usBDnXMRGe54KYRFlH3Lqo1AMCGkJJCtTAPsBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35zwksbQ3z23FFWrK81h1fGutMv+YmS5I2sjdfQYZiI=;
 b=WqzGzuAvPzTNvl1WvdiFuuU+RN+m9Jbm9+vRx3GbwaefxqS1RLpfL0w9Oyfs1DuRQ2YG+4QDoXVS85KSeOXntj6WALWVRsWktclfMF77xraC0fmEjYURrIIHuMv0W68IXEY69TR0VRwKY4Vmjjb6dakfYvEO9azH68JemxVSN3DK+mViXv3f7gj4Av0FLBjE4HyoFAYfWjodSov5qBruR3RVys1jy2tExbili/AquLE6tR5YLK7p8Zvv93uJDmSaIh8GFT4/CzqaH+YOExgkOshQHWRuXtZtO/kHOzl0w+LDyYs9yxPyFDAjsYdbp/B5w7pv1jy8SS4LJ2sedAfPUA==
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DB9PR04MB9476.eurprd04.prod.outlook.com
 (2603:10a6:10:366::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 06:30:30 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 06:30:30 +0000
From: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Leonardo Costa
	<leoreis.costa@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "leonardo.costa@toradex.com"
	<leonardo.costa@toradex.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: RE: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Thread-Topic: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Thread-Index: AQHdB9Xqqewhn1aJKUO40yds8E4l57ZV+U4AgAuqYZA=
Date: Tue, 7 Jul 2026 06:30:30 +0000
Message-ID:
 <GV2PR04MB120194769E5F5E590155223388CF02@GV2PR04MB12019.eurprd04.prod.outlook.com>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <akLTJkNmD2rUjyw9@lizhi-Precision-Tower-5810>
In-Reply-To: <akLTJkNmD2rUjyw9@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12019:EE_|DB9PR04MB9476:EE_
x-ms-office365-filtering-correlation-id: 1afbb2db-a2c3-40ec-1f29-08dedbf13dd3
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|22082099003|18002099003|4133799003|3023799007|38070700021|6133799003|56012099006|5023799004|11063799006|4143699003;
x-microsoft-antispam-message-info:
 vXv2kt0iE3FBIn8Vikm/cmDfnLboVD6QcVMOxCdDdc8/c06bC67rpdNaV1743JUUoxo+k8B73xcY3Kw8TDCNHdo+Nx26YfKa8MeRblgJECTdsynFuadJ7qGX24fK7rjPs0arTLwBfc9DGJ/XoHJP36TKHVivN1F9lNY8Fc7JWLN700i7aSBB/1HPpVvS3v9qpjkg9O+NXP1x2HmGfw5RnGvvet15EGcTuoCVw3gcjUHefpNWv1jmk8ssqUrAUwp3O2pVRoJJXAwz03l/lmhdr3iPZyuMArLouR8CjbgMmXElVTCJAMyEwNBokX0/S1vzA/KHuy5KZzXpq9jpuOpvw/s5PQ33N4e0NTWYCWyQR44aQ6ZROf1QmfoylQrAt7eZ6Er38EwYBvO7qMQ/s66WLU/NJiaOyZDjzf1oAmmaJxJGKGgUfRpbOdx+jBj21fFtIryLNNUJwTMYV+CYVixGOvpSWNuSqWGqLVlbTw1ljD/60UcnYcgSdUzu8vI0GtAr0f35ws5MY0xN8PKAjRA8JwPRGxS5y7MTiVBQo6oDPTJtdn2ZJQD3hoNQkqxgXcf/8CSucpOXCCQMeRKH95oIZ2g+enL0bREkmPYn3DPRlyGBQkdx4oiDpk63+4jtNhLr8BwSzyvOMOSShig7zjT4liu2LeHY53vNxv3E1IojczCbmf5RjZqVP4DxDPz2a/3bjYo/87jY8vmmDB+uR801vAWxDsI1Jz8DBkhafgFOlAc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(22082099003)(18002099003)(4133799003)(3023799007)(38070700021)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OYupAny5wExmnUWwX2Kg/XFihoPli3Sp08sz5j6xzfYTc4ekIU+R3rfxiduY?=
 =?us-ascii?Q?4EVPPtF1DEGXJDSOy3HYzGUsvXgKmiT5VQjLi9INsO6KB6DjuDIRvwgGQEE+?=
 =?us-ascii?Q?4H+fHmvAt+UX3T/fX0+K3rHrE9aaqhFm5EqSKq+vF2OUUBTFKUzKrP6QJ8Ci?=
 =?us-ascii?Q?SzTRx4UIKeDSjW1DE+iKgPIT+22NZxjdsrByFz5oEwMenHKFhNHxgjUSYelt?=
 =?us-ascii?Q?bFUWyMlVQ8S/iZ+JXDUVUdk+uDnyubxdfae7oO7QiqHegwrxcUmKEh6C3BeT?=
 =?us-ascii?Q?y5NbYwqfErAsZsT4mraXrwKQyxPvMrc36oNrTNE/ZFgBLY2v4EkdUBHzYGpQ?=
 =?us-ascii?Q?EcK08gZZkPJSuPHLm2JUXox/Xce24kNccaDBm8P4J1p/Y9b+29rM9Y7vMt4B?=
 =?us-ascii?Q?5ZaWs/b/G59fhW6FLo+/mwDJBYlezhgHW8SvoUFP012CxhLWU7Hwog7/k2ON?=
 =?us-ascii?Q?m4jNqXWqJW+0gryMGfzVrMo9I37lNvkKRLqac38o8XX/lGMo3cb4R67IVBSN?=
 =?us-ascii?Q?UcRZLIMt9yBxnMTU6AVaD68dUz51vATl2exEpi3U2EueTXoEyOuMMOE3lpK5?=
 =?us-ascii?Q?HguV5V7NdSwAoBnU4uQVJ7sHCMoKptAMGU60aHifpifIk4Nb3zHemRcFrMnz?=
 =?us-ascii?Q?GmCa5G6ZrT6VOeg4+52UW+1iq6UGXjRpSuDPtA/Qi4+iie1E3kGDZ0j0OvAM?=
 =?us-ascii?Q?1syDdsvg7Wtpxn4RkAkhWdekV6NFOHxIl3Br/Os1aaJLvq7q+UODuNvVa93u?=
 =?us-ascii?Q?pHMEUCZMrGFWRsdcF8lLeNy4kcI/nUVpTUAMl3l9dLizTzNrjlo2zzz6Qgp9?=
 =?us-ascii?Q?1zXwSH9WF272xTpNg7rEH8StKYNfSPYKXpt/v+quixtRo/w2Z1SJ7hltjU6Y?=
 =?us-ascii?Q?OVTDmAl2cnVKnUARBsaC3d0UKbLY14I79BPLwwUfuluomKSzBUSWQoWZZWLx?=
 =?us-ascii?Q?koNRjuQGksO6qd1bpP3jXhfhkXpjWTc1aKXKiWXuKWs1Jo89fY/XhcSXXtKG?=
 =?us-ascii?Q?eHneWDeCwh4NPzjaN5dHmkKm1NmuR5pSPQgdPnEC9+JePOCaXt+xBSaz4e30?=
 =?us-ascii?Q?Q5VGu87Q0a1WW+mUU4qmSPoEDOG496v3uRO5iQfziX7YmQEswZzeZStZ9DIO?=
 =?us-ascii?Q?cM1Re4+gYI5Icqwm7SbrHK9jtISvNkBXSypQ8oPvrISTnWs13xDFvFbZy3BI?=
 =?us-ascii?Q?qCvZml2qdZTaYBoIbQB1B8rrGKSUIK7W/cZvFppFCjyhmu7ukkCAj/K/B36M?=
 =?us-ascii?Q?0ZtuBqpa88xGGfDTO6H9j8M1xDUKMpHbmsIsuOwnczcB7XDWQ5NHkMIylFxz?=
 =?us-ascii?Q?mUVEtPAMiGyO8en5b6gIWId4Omq0DcAEds2LYy40vn/vGaKjHz/a/50PF5bR?=
 =?us-ascii?Q?CrSVDma2FC0dyLBMhhEvjjGiKHGIn9cO9HlNfb94Bntp/p08eV45Hi/7rs/M?=
 =?us-ascii?Q?hv8cjrjt9j1z7+/4zw0ErM0xnGU4W3aXnlpDIHh1QEz7ZbxGisoMogGBtNV2?=
 =?us-ascii?Q?zi02ITpDFTj29xq2oL+nYc0/KJgWHs+rj7wb8AaYwFQsPZaTvQfiUBhzJyGZ?=
 =?us-ascii?Q?lYEaE2I3DRKK5vUQ2VU54SjvfBtPCSyOgKaML4ddwIzKtC08A/6xgOUkS171?=
 =?us-ascii?Q?zEOv01UltqoBKERKHtRa6xHTn5wDAv0b45fwz19WEVc5ksBpxeYr6qv2+kmo?=
 =?us-ascii?Q?YEMrCsXVmMY2xL0LSYLKoiXwYmss2wtc7HwAfyFmA1vYNYTCX5LObyMboF9k?=
 =?us-ascii?Q?cs32NOnYUA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afbb2db-a2c3-40ec-1f29-08dedbf13dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 06:30:30.3967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6xI6wUcRfEdGKQcxKX1pO2uagPfm112v8tyAIQqGkmkh47CR6zBsK3LiX5LgEsNpmNffJ6nu3XQ3QX6LDl53g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9476

> -----Original Message-----
> From: Frank Li <Frank.li@oss.nxp.com>
> Sent: Tuesday, June 30, 2026 4:19 AM
> To: Leonardo Costa <leoreis.costa@gmail.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Frank Li
> <frank.li@nxp.com>; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; leonardo.costa@toradex.com;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> regressions@lists.linux.dev
> Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
>=20
> On Mon, Jun 29, 2026 at 11:34:32AM -0300, Leonardo Costa wrote:
> > Hello,
> >
> > We are seeing a regression on Apalis iMX6 where the kernel doesn't
> > boot in the newest v7.2-rc1 (it was working before, in v7.1). The
> > device tree being used is the imx6q-apalis-eval.dtb. The kernel configu=
ration
> used is the one shown below:
> >
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgis=
t
> > .github.com%2Flcosta37%2F53efdb2fb6e6e0fc05437c7e53b47737&data=3D
> 05%7C02
> > %7Chongxing.zhu%40nxp.com%7Ca4fdd946d8064da8b63d08ded61bab4
> 2%7C686ea1d
> >
> 3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639183611522951306%7CU
> nknown%7CTWF
> >
> pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsI
> >
> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DyVygffYEhpLZ
> f5tpwu4
> > yVZn5sL%2BdQySGZwryUh3i0zU%3D&reserved=3D0
> >
> > The kernel logs stop almost immediately as the board starts to boot,
> > and I don't notice any difference in the logs that points to the cause.
> >
> > Is this known? We are seeing this behavior on all Apalis iMX6 modules,
> > though we don't see it on Colibri iMX6, so it is not SoC-specific.
Hi Leonardo:
Can you try this fixes commit?
https://lore.kernel.org/imx/20260707062250.GA20259@francesco-nb/T/#m06ea829=
23d53e28a234d0052596559eaa2c64987

Best Regards
Richard Zhu
>=20
> Can you help bisect to locate which commit cause this problem?
>=20
> Frank
>=20
> >
> > Logs from v7.2-rc1 (not working, printing stops after the last line
> > pasted
> > here):
> >
> >     [    0.000000] Booting Linux on physical CPU 0x0
> >     [    0.000000] Linux version 7.2.0-rc1-0.0.0-devel (oe-user@oe-host=
)
> (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1
> SMP PREEMPT Sun Jun 28 19:01:31 UTC 2026
> >     [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7),
> cr=3D10c5387d
> >     [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasi=
ng
> instruction cache
> >     [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Modul=
e
> on Apalis Evaluation Board
> >     [    0.000000] Memory policy: Data cache writealloc
> >     [    0.000000] cma: Reserved 256 MiB at 0x40000000
> >     [    0.000000] OF: reserved mem: Reserved memory: No reserved-memor=
y
> node in the DT
> >     [    0.000000] Zone ranges:
> >     [    0.000000]   Normal   [mem 0x0000000010000000-
> 0x000000003fffffff]
> >     [    0.000000]   HighMem  [mem 0x0000000040000000-
> 0x000000004fffffff]
> >     [    0.000000] Movable zone start for each node
> >     [    0.000000] Early memory node ranges
> >     [    0.000000]   node   0: [mem 0x0000000010000000-
> 0x000000004fffffff]
> >     [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-
> 0x000000004fffffff]
> >     [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564
> u61440
> >     [    0.000000] Kernel command line: root=3DPARTUUID=3Dadb2cea1-02 r=
o
> rootwait console=3Dtty1 console=3Dttymxc0,115200
> >     [    0.000000] printk: log buffer data + meta data: 131072 + 409600=
 =3D
> 540672 bytes
> >     [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 5=
24288
> bytes, linear)
> >     [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262=
144
> bytes, linear)
> >     [    0.000000] Built 1 zonelists, mobility grouping on.  Total page=
s: 262144
> >     [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap=
 free:off
> >     [    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPU=
s=3D4,
> Nodes=3D1
> >     [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> >     [    0.000000] rcu:     RCU event tracing is enabled.
> >     [    0.000000]  Trampoline variant of Tasks RCU enabled.
> >     [    0.000000]  Tracing variant of Tasks RCU enabled.
> >     [    0.000000] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10
> jiffies.
> >     [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D4.
> >     [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> >     [    0.000000] L2C-310 errata 752271 769419 enabled
> >     [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
> >     [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
> >     [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
> >
> >
> > Logs from v7.1 (working) (full logs here:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpast
> >
> e.debian.net%2Fhidden%2F0f65ae5f&data=3D05%7C02%7Chongxing.zhu%40
> nxp.com
> > %7Ca4fdd946d8064da8b63d08ded61bab42%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635
> > %7C0%7C0%7C639183611522973764%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGki
> >
> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo
> yfQ
> > %3D%3D%7C0%7C%7C%7C&sdata=3Ds3LVv01DMUor2Kwv25bOMyk8Q5oFs
> qBhUVx6Odozwp4%
> > 3D&reserved=3D0)
> >
> >     [    0.000000] Booting Linux on physical CPU 0x0
> >     [    0.000000] Linux version 7.1.0-0.0.0-devel (oe-user@oe-host) (a=
rm-
> tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP
> PREEMPT Wed Jun 24 01:36:41 UTC 2026
> >     [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7),
> cr=3D10c5387d
> >     [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasi=
ng
> instruction cache
> >     [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Modul=
e
> on Apalis Evaluation Board
> >     [    0.000000] Memory policy: Data cache writealloc
> >     [    0.000000] cma: Reserved 256 MiB at 0x40000000
> >     [    0.000000] OF: reserved mem: Reserved memory: No reserved-memor=
y
> node in the DT
> >     [    0.000000] Zone ranges:
> >     [    0.000000]   Normal   [mem 0x0000000010000000-
> 0x000000003fffffff]
> >     [    0.000000]   HighMem  [mem 0x0000000040000000-
> 0x000000004fffffff]
> >     [    0.000000] Movable zone start for each node
> >     [    0.000000] Early memory node ranges
> >     [    0.000000]   node   0: [mem 0x0000000010000000-
> 0x000000004fffffff]
> >     [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-
> 0x000000004fffffff]
> >     [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564
> u61440
> >     [    0.000000] pcpu-alloc: s28684 r8192 d24564 u61440 alloc=3D15*40=
96
> >     [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> >     [    0.000000] Kernel command line: root=3DPARTUUID=3D4ce4ba92-02 r=
o
> rootwait console=3Dtty1 console=3Dttymxc0,115200
> >     [    0.000000] printk: log buffer data + meta data: 131072 + 409600=
 =3D
> 540672 bytes
> >     [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 5=
24288
> bytes, linear)
> >     [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262=
144
> bytes, linear)
> >     [    0.000000] Built 1 zonelists, mobility grouping on.  Total page=
s: 262144
> >     [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap=
 free:off
> >     [    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPU=
s=3D4,
> Nodes=3D1
> >     [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> >     [    0.000000] rcu:     RCU event tracing is enabled.
> >     [    0.000000]  Trampoline variant of Tasks RCU enabled.
> >     [    0.000000]  Tracing variant of Tasks RCU enabled.
> >     [    0.000000] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10
> jiffies.
> >     [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D4.
> >     [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> >     [    0.000000] L2C-310 errata 752271 769419 enabled
> >     [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
> >     [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
> >     [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
> >     [    0.000000] L2C-310 dynamic clock gating enabled, standby mode
> enabled
> >     [    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
> >     [    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
> >     [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
> >     [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff,
> max_idle_ns: 19112604462750000 ns
> >     [    0.000000] Switching to timer-based delay loop, resolution 333n=
s
> >     [    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, w=
raps
> every 715827882841ns
> >     [    0.000018] clocksource: mxc_timer1: mask: 0xffffffff max_cycles=
:
> 0xffffffff, max_idle_ns: 637086815595 ns
> >     [    0.001910] Console: colour dummy device 80x30
> >     [    0.001926] printk: legacy console [tty1] enabled
> >     [    0.002519] Calibrating delay loop (skipped), value calculated u=
sing timer
> frequency.. 6.00 BogoMIPS (lpj=3D30000)
> >     [    0.002561] CPU: Testing write buffer coherency: ok
> >     [    0.002627] CPU0: Spectre v2: using BPIALL workaround
> >     [    0.002650] pid_max: default: 32768 minimum: 301
> >     [    0.002989] Mount-cache hash table entries: 2048 (order: 1, 8192
> bytes, linear)
> >     [    0.003038] Mountpoint-cache hash table entries: 2048 (order: 1,=
 8192
> bytes, linear)
> >     [    0.003430] VFS: Finished mounting rootfs on nullfs
> >     [    0.004538] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> >     [    0.006552] Setting up static identity map for 0x10100000 -
> 0x10100060
> >     [    0.006835] rcu: Hierarchical SRCU implementation.
> >     [    0.006864] rcu:     Max phase no-delay instances is 1000.
> >     [    0.007320] Timer migration: 1 hierarchy levels; 8 children per =
group; 1
> crossnode level
> >     [    0.008854] smp: Bringing up secondary CPUs ...
> >     [    0.010035] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> >     [    0.010218] CPU1: Spectre v2: using BPIALL workaround
> >     [    0.011412] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> >     [    0.011581] CPU2: Spectre v2: using BPIALL workaround
> >     [    0.012747] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> >     [    0.012917] CPU3: Spectre v2: using BPIALL workaround
> >     [    0.013109] smp: Brought up 1 node, 4 CPUs
> >     ...
> >

