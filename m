Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380189;
	b=22Wye32kLJreJg0yT9B0NorM5TZpBPQ+tABFd3qf5aPRYqpnTJ7yNjpP/KGkbl+xTnFO
	 6fBSsgeDDD0PjgUaBarIDiJ5vnu36FBAC3i4s41MXVVO3KnqXtNk1L6xa69iRhTj5JM7B
	 uhbpkRuagmigYp6uB2/hYTJRsMwac/lC3Ir33+jfuVrEG2Bm1D6NWuENIvK137IxNrhoH
	 tgRTLJcRmNIZk0mlZJ3MD2TsQihluBuQ1oWv3wtZ6AVrtnLI4O/Mv/Z8OBWYnHoIe/cGa
	 h388BlJLkNiRlzhLp1YMKfG0YVcPfD4xIWqb6W0wMrUzY28X4B50vyELcp255rhwhSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IA9sYotJmbL2Yr3kpwPmqSBX/u6xE75w+0WSu2aSScI=;
	b=Oe22ZovPbEXGqy2tVK94CWOBdnpkoJRuzQ5R1g32yW3k7mucKhHc3XXkOZpF/gj9QfS4
	 pRQbJ3CHmr4UB7tjCr45y1X07BqA30ckX3J5j663mnrp9PXUMuA36UuAKWcNpVyTqG9VW
	 G2bwY2+DBra+ru47mv1SdEbcNQGU+UObFd5XDNatfbv2YEh02TveNFgWOXL+aRzsgll+Y
	 w1koyoA8JhNuL5ackkDYzPJWqrpsDuloLHt7VJbk0xWYylYveb9C/ZHEVgRYuAgQYNm18
	 5mmIhkCBxIIy4W0OSOFS72kw6Szuo/61KkNFcRP3YtIfxorCd86liRbGiUHy0AQresA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QuFGVUW7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.20
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAE606A324;
	Fri, 30 Oct 2026 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QuFGVUW7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWXUmu+pbQ2PLNfWa+1Nsjgw545M43LJ+N5pajXx2ghnR0AkccbT2E1e9hSy5dp+yIYbSdRlQWWlABBoQ9Z+VQf2lKPugmsxfU/BIVexwqhfSzKZUXssD7G/U45eKMt00uFkF5Dof0qvhnlHa5WOTDb42EF9RYfVuGtnlFXlaJDM87sNPF3WTIcoVHx737jPFenSjA7SiNg4/Jyda9+6wHzR4C3s99IqvAOFxcG2GayhEl60G+GiRw/HGQzyDc9yA7qxvPRa1fs6PyW+3bytKwjjXbeEqEExuQnHqsLyf9iCA7KQhqTr1S6IdzmlKrzq1iaNHTpgoilbU6+p+FSjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA9sYotJmbL2Yr3kpwPmqSBX/u6xE75w+0WSu2aSScI=;
 b=JpXWf19thACUqy0niQ46E8Lv85cLNC0b+NANszWH1HSAdvd41BNdTc04F9e6MII4AVVAaxZPL05M/N/ZYlT+vI8s1xCq64GM+ad2bnyZxFlcdJOALWMb9f8Y816j+xVqa+VrGBj/Jyei5r929laxJlX/U9yUI62NcCsNBnCluKIUOAbi5qThF6MCNAC7odsse9XCj9vI2fueO3iJFhedL1nKUIgRDbWSrvGiib1bhVnFrCZUZkKYOLemP0c+K0vskJ74egQC5JhWov4JjvH4k3cB4nmmNNOj0l5innFyn+XX6+R5kX4/nWtvNqhqZbOMgCn70ZqwJ7Zyd+8q2RrLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA9sYotJmbL2Yr3kpwPmqSBX/u6xE75w+0WSu2aSScI=;
 b=QuFGVUW70L4EKQJ+NZgpmxUVPqR5tYoCULSpJEn6RPYFzr183T5x25NttBDf7SnxNfxEyJakfr9r2PqO4P3tfk+nFmM47AhEcRgiyo+Q0RzDqeSMHlXaQwSGzwb4P4d89OOlm1Fo0Bhfd5k0OCtzmtMkITphGEbLsaSeCYfjsqbDiy0WXZjglitzJQwULCKoiS1LsTHsS4PysZ25Bga04KqmwhHay5B3y6wJFRhgZwNHcuvO+y/a2aKeD7zI2ENAoZny6pIuH10XZb60MCbt2ztFOjt++kuhpfAcNkqpdiunf8ZRE4DbxaltNuJaJ3IODyyeVXazb37ybWVD3B043g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PAXPR04MB9491.eurprd04.prod.outlook.com
 (2603:10a6:102:2c3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 17:09:45 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 17:09:45 +0000
Date: Fri, 30 Oct 2026 12:09:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
Message-ID: <auTPTxt5ioBJrr27@SMW015318>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PAXPR04MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: ec242082-ea46-436d-2223-08df36a8987e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|19092799006|366016|22082099003|18002099003|261026121527099003|3023799007|56012099006|11063799006|4143699003|261028144727099003|261022105027099003|10067099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	3cE22Vu1otZSM8URd+5orlsm4r3E1JF8TtDSgeIarpp6dgrL97mGNcri6/z9WBermAL14lQjTm1/nGIVAXZtiwosQ0Pk/Et24XiJoDrUrvtx8UeBvJxTo/oA0lLXsOvGxQImEeUkCwBxg/oidII63pdSGiP9ZsjgVSFWIcpoZSL/ru1F4AqTugAZ5oXZKfFm3AScbe2PnCDulilhad5jbjFHGorawgX1n9/CCmqoLuht87RNEaxtoJ6wBzn6PvUyrMFIWyy2ZIJh2qOuo75qQxMHw48y4RsZtqplz69ke/umtVy3LOOQ2xyOgC5HlQazupB1y1vBerUp1eS7TzZa/z7fDt8tVWJbXgTZh0A9tyh/QmMXmE8mPxgGbaB3mlPGXOU6GHe/qUZrPUdTjO7aF7suo/I3KACxp/+42765v2moXuV2dAQizfExSCQbf+cgHQawyAiaqQQ7GFVet4WKU1RPIXYtIFc/Dg3J456cmEvsioKXmbWQ9TwWCk9HlZ54F1akT7r4mepUHC8xT4w7USufjkPbDv8Rk9uXZYzROSnAUi64fyFokUe01Mo3NBJInVp3YtbggJdudgXA2WwEr7YxlrDsFplsbAttcl338DBf3ue0yyKoLXs0VbCvEO2OXH2m/x+kcYHAELz4kAzXOooDP2DEiv7mVWCAV3zvxcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(19092799006)(366016)(22082099003)(18002099003)(261026121527099003)(3023799007)(56012099006)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(10067099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZQvZ9qfwuKOs+uE4bcFdzYdzfqoc/5QNhhc65sLedspX4Y6qA9MhflEcfDTU?=
 =?us-ascii?Q?rJWwnilX10FS5fXeWrrDEc2rslAYUn5t6UbMWj6PI6Xqqr68ji6cB3ulylVm?=
 =?us-ascii?Q?P+UbmJ8UHWL4CgaDstsgy9MWNpm/F5Ou/EVxBbicPoi56JHcuz09wHxZHwIz?=
 =?us-ascii?Q?OSoB97wpnEmuDJjvObRZrj+yVFS/MtyrmEG7sHzD3NU947AvC+o43pOtlbP0?=
 =?us-ascii?Q?ahvMMqCZCy5+5TByijak4oSTBF56oc5MvUx6QV8L13/SXVeFIXy751SByHTd?=
 =?us-ascii?Q?rkZSgtHqOpVvN6qNEQ5EVE7L0G5w/4C0OPhFGfzFkw8JOLMzbdeh/RJhkope?=
 =?us-ascii?Q?Lg26QXSP/1IAZ+gKECzzM5Wy1Q8wE7Lzj+EHDD15shW0vdL6CEd1LHtbKwgg?=
 =?us-ascii?Q?FLdb55RLKBzEfBZpcQY0zepfyf4kTaAD1R9QU/NNWzFGhxAuyJ6o3SspPVtw?=
 =?us-ascii?Q?ZkDmFR65cbepI/ip+2fECe5fXuE0GJqsT+76jLPdQFUPUWIfVXu9ZHQ+GuBb?=
 =?us-ascii?Q?2UGQN3hx5DfulgShbJUG4Mti0H7H5q7d2UXm/PdgVXIF3iB2DpXZVMjt0xIC?=
 =?us-ascii?Q?msWzv+Xzelk3hnFK4bgkMUKP6eydTcdZn015BR3oZIvwfhaXcYI5noasvEVk?=
 =?us-ascii?Q?0wFhk10opYWdxOmLxah7KUYe4sgmzCW+Kz09HiFSlq98EYWvuDDtakfdvqTd?=
 =?us-ascii?Q?WGD+zBqCaQmaAnCaq+BljaNVWavh2wuqi/9JJ2B9JFR0eZl/O339IezYCjJD?=
 =?us-ascii?Q?l5j0DF5QMqB/C4nlZnwVE9417XnRajmXvGXYtmPML4wdQuZag45oyk+xiYNL?=
 =?us-ascii?Q?tFVyaIfpHlLdE84dYZGrfnD45K4mMpgjPEQSiDlvXsEs8MB5MOy8l/Lo00f5?=
 =?us-ascii?Q?qAQaGBfdLRV4d9cKA11JG7uUETSCsM+pkoXzQMVwSQNTMKmtWjSYx5K/CD6K?=
 =?us-ascii?Q?kx7tG/NTg8uoHnZC2l+VO5nOHuBKOlNukGNUn4XGjPwvn8nr/Wo1VLmr7Zil?=
 =?us-ascii?Q?AvJjOpt7PHGJMiDugORx2ASqlxWMHMWKGUWqLiD8uS44rIo/XA2oykMeGS1J?=
 =?us-ascii?Q?F3DmUjpP7+qpnpBJIVz2wrMlJNsIfw+hT7t3f/DY8HbYRiWkWfbq7aWC2wTH?=
 =?us-ascii?Q?6yFa8DqstTyxNRvVBt6nWlu29b9c++WCWuyQoCmVNKh6E24WrJOXp9TNO5y0?=
 =?us-ascii?Q?8pG64LXy5FE06clAtpSIjtTD0RH7GOBtf9jVYxnUmoShoWhUlr9gVOOnjgAk?=
 =?us-ascii?Q?HCckwcZohLdDMLnr/3AHT5Q50fUpuWEPsvpQTp6hL5VUKsR5fBv0hW8Mnn+3?=
 =?us-ascii?Q?7xUrFSTv/UnWoVcbo4LwaAgdBlUEcOb88VwDLP2qyZ3aeJNO875HNaKFJUu+?=
 =?us-ascii?Q?jA059sv9TYpoM7fhQiz9Uroaa6y4alyHFvrxeWn2XHKmYpzYsRyE8F4TLi9N?=
 =?us-ascii?Q?LVlQc8Us6yFmBM20z4UZhomGoNfotwkBYlI18dFoev6gT/NfJke7q5n1Roxd?=
 =?us-ascii?Q?xJAmwl9TE8m+vSRB36SaJ8KtowS6g3EFYh8wIwQvEMo1bq9IRrAj55ZFJC0k?=
 =?us-ascii?Q?Hmf9fZxGie9sP+NwsfPkWEbvqZJpWcOWz7IMx9kEzihtfnwbWShBHJf97pGC?=
 =?us-ascii?Q?57dwSeOGaYgzhG4cK2cRQjlUVkpBNXQ067Q27TGaDbONFqoXg4VlrpE8ddSj?=
 =?us-ascii?Q?U5xZeSBnnOcbHb4BmVGU7gTQ9nLEYsyVRnHFX6+7RzlS6Jt8PYrDpYdjpi+c?=
 =?us-ascii?Q?jyI586D/IPDDtU5cJ4QQwEMUUly0mbkNoO9Vow4lrfumJ69YAcX0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec242082-ea46-436d-2223-08df36a8987e
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:09:45.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD22XNmN0ZeghO0KlB9arAv6x8eX0R0qoIMw6ApxCRtysd6hppauFb/APWBq4sv2t5fV+z1TDgvdUc6Llyfnd5bgsUdM1Hlch0IHWSf8tob3hfZe2+iY6WlCa0r32Mps
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491

On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>
>
> On 10/28/26 22:05, Frank Li wrote:
> > Does it only impact superspeed? High speed work?
>
> No, it's not even enumerated, on the Dev board.
>
> >
> > Thank you report this problem. Suppose below patch should fix this problem.
> >
> > I have not time to test it today.
> >
> >
> > Frank
>
> Tested, it doesn't help.
>
> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
> of_dma_configure() and the new code in of_iommu_configure() is never
> reached.

Finially, it is hack at uboot.

592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
620:                                          "power-domains", ...
578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);


Need combine power-domains with iommus.

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index 176e2e332f87c..cc2b9a212780f 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
                        phys = <&usb3_phy>;
                        phy-names = "cdns3,usb3-phy";
                        cdns,on-chip-buff-size = /bits/ 16 <18>;
+                       power-domains = <&pd IMX_SC_R_USB_2>;
                        status = "disabled";
                };
        };

Frank

>
> Emanuele
