Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793221537;
	b=JrRrrb8H4B6jhMTMgOBJg1rr+Rq8oxqema3PZuKISaMEbj5JTYb/4df/LngDiEUOX98b
	 J1BzzA/1z5JnZpkBwU+0wFkm9qaPjTYCDxPNekB7E+DfHXayr+5bTgSXEoPEwb510H2Fr
	 I3L2vSXM8eHGFbX4a8Juu+GjTv3mYgqQT64fIHaDJo09YsgZ1w99ZGQUz0u83Zz/5lL3Q
	 5tlY5n+LJBULnEgfshQ0PECwU6wWilPJ3Pcaa3xUuFDE/J/NWYbkVQ3EZTrvvWJVHd16K
	 hJgiBLYQfZUadzY+r+1db9EekW76H2Faq+xf9e2pPD28BAIh4svo3YaNTyr9Cg+/0Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221537;
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
	bh=Ww2ZNyz6/Q6lqXl7lEdZzBhZk0T1lIbI46t8Jvo0uGw=;
	b=UfetZBnTS9TjcQsVTivN+Z5yY/Wn2eZmy9MZlCc5Xr6fsDDpSLmVIBeBL0Nz4mPcL3qK
	 9YYluPRx+DUqOjz9WnJqoAmaOCdWrTQnEWmnp838mSNAD+nsJuvuagV4j7ooTrbAa5Sca
	 uTJWsXnnZ1VUs1o825fshjYOvuAePfUZz0yAISNmq3/F/hD2JxyC9vNWDeQov7NkWpM4G
	 Rn2hOamdy6QEzgVKExToB5k8ZdyEkt6IZoWDoUY1EodWBgUwJBv87CQdljaWr6hOBGMCo
	 vKGtaO3JLGyPtopFp2qyF9Z/YOfdPApk3J1GCSRkJ9vGKxWzVjhDMTI44tWhv0AgV5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VGx6MjSv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB9606A31C;
	Wed, 28 Oct 2026 21:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3EB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VGx6MjSv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw+i70vaOGyfac234r9L2jGRlFiVrzAMMYP2RYJ62f47ZNV+U4dObL71bL2WDivCUqIgTQON/h+xQOiatuwsxWEixXd/9pvlOXpiT639Mh4g3Vz7rlTBDsJ5JvyguB6+Jra1geEQ4TwwIjWbZ8Mo88VqeGM3z2rCEsCT8C09jCo8uYUMtuTB6ZfrLfuXeKBUGs7BJU8pb0h5RCw3pSfUQLvOoqvOt/P5qOKu2WoIcUn9dQHlGMORcYI9AjzlH+M0n4Zncx8ls4tQqnizwAMxXjBsfvD+SxETIJFTymuusH1eiVtMNbZdzWL02cexVDPxz12K7TF92JjEo3q1iYMbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww2ZNyz6/Q6lqXl7lEdZzBhZk0T1lIbI46t8Jvo0uGw=;
 b=SKW1Cn5kXcoJXJlzWo05TmfkVxAjYJ+jOIySYLiV7Tw0Y6FrBXjb2vblZb04eCaNhyy4IQ54IzHk1lIkLfhCwax31sd2iMlShtQO/oTcAzpC6DwiQAK4Qqbh5Gy29KReridILS/g604g6+tAFdmeSf4gnURSXA8jw3AMi0YwxF9HhW0cllDrzlsw8AVPUi+VCB3R7r239sn06cvPCxBlfHPocmfiWEPRbAF/jFOHnSVdc2rUMFbTbkcp8b0of4h3mkyZowA7p/imxuseorJWaASGhSIYiWLNBcuKvbd/Gn+3/NeXSH+P8SbpuEBSswY7CYBeTMkjXwW/JiCmevJyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww2ZNyz6/Q6lqXl7lEdZzBhZk0T1lIbI46t8Jvo0uGw=;
 b=VGx6MjSvITvmpmVpoZzjF9E2bXSD4LBMRATJN9oKcbj7vmDYAf981j1wiFsBVuWILtFq/fM8JjxKssU5sYXAsIelKsxNnNYphE2Lsx7lRwBWRU+OMGbk9Y2M3bClJ3PjcBVd0Q+AxFzehn5LaEkU9umfo0Oa4ffEKCoi2hWLQboFJIwtAe1eRiUzYHmOo1ga9O5McHmZsJfVvI0XnkYxrcLq3S2ZldV4GDIPFM09p1ihXSH5H194eM82oiuI3RFDT5L5FNTNqOwET1FLmskcD2+cJTFzqwsIIUUawFRpdvSsefvDVuihOb5vTeEJWBNKbAeoWZaqY583a23veE1qFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 21:05:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 21:05:34 +0000
Date: Wed, 28 Oct 2026 17:05:25 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
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
Message-ID: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DS7PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:5:3af::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 5384cb8c-963a-4393-4ee9-08df35373513
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|261028144727099003|261021121427099003|56012099006|4143699003|11063799006|261022105027099003|261009223027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pjgjQ2Scum3nhAw9Qd7jy+H+IgvjocC3fux9GhAGu8Jcvbd5O3yg0fT7M4vLzQSSw11ggJScSG7nuuyqEcvvI7cQuGwphfhMMXcXEhqHDqZotudfAyEW63xMruuYGr4XTx6jbY/hpj6B4Xsr1pN1uPUlnXkr95vatCkWAYP45Umy4WLDVDb9PpLpriV3fv4ecstIn/SVzOb9Q+QNLtlzB7eNGbelLxNq5vyDE+yQjFNjhNHFosVjwzp5xWfVfjqWk+MaVLi6wIi0xq6jQQWe8+MjbAyr3Y/u+59Eyqy/PMkTLegNo5befx8J2NWxVqfGpilJ2KSVbcfM8Y1Uyyb6rUhiSQQ60Jx1Sx7PEp9R5WZl8tMAJo9G9e56h6X8bT/mRGTfaM10PZrS9Li44BhLff8jH5e8IqgRnCEcvIsXgsKsw5P8kyDOW2fC6EoQlbTfZf0jL0h7AnVYVuaO4PCXn894nihZazI5KD9fzCiMESc6XZztfv33W9xbC8CogHYs32ard3WnEUgCXGKYGif/w27XFOVa6+juesZ54LPt4NvXrq3RfWVszx6/8UoVCYf9xNUJAcqMXfwfJL/sODqWxNIFvJwPT2UHSJ8cWSXCDLoM6OUk1/E+YV/Mr5ScW+IVhqNwC8IImjT29XgJ9vZiFXnj9DXo3+07Ec5iGeDiXrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(261028144727099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261009223027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N7CQN7jo788P49NYdZ44sF7xgW8mhttU0P/hQVIKvefh5zzpozp+9eKovIA1?=
 =?us-ascii?Q?cKzTNEZ8X9+WIjL2dpqq59ZwmP/fsDBbiGYNO6BvDsWFjq0Gf5DTNLtpEqm9?=
 =?us-ascii?Q?R5RUNXl/Jdqux56SCtRE6ugFH3O9Dv/w1blOhU3PFpq8ETlgAOf/MGwI10/A?=
 =?us-ascii?Q?g8wysLJIlYunRmF2Q/f/tGP3CqXdk9iQ3pIhECsmCA/lPcwnPRd2+RECOw2j?=
 =?us-ascii?Q?Tll7Nw3NDocFZ05ovCPgquOsATlfUUwaQFtuIUVA6DmfWh9xSfbl2aSp3gNN?=
 =?us-ascii?Q?XHHspK9ePQrZAB8/yNvmY6cfI92so7QubtOO5bNVbBJgIA/mM+pq1nluCf+Z?=
 =?us-ascii?Q?386W55X8aDXJkH7ZDoEpLUTHbWpnOo5Yrk0I1NGmGjZiqxB7v4gMAFuCCD9i?=
 =?us-ascii?Q?utKM7948qorBukz4ryvA079Lj29ML+1NtUlJ/rq3lJ4M4gvgGvyX2/v/rVp6?=
 =?us-ascii?Q?qs0excXFbT544tiKMlU9kqVJWfiNZvTfWgTgvCCMROGMCydTWGvvlsRmIMn/?=
 =?us-ascii?Q?WHVHqF+fs4U8JlhhT/AnOck5LhV9AkSd9UZBOOkUBL/HNUP8rkZ8jgMTGUze?=
 =?us-ascii?Q?trJHoVnh6+omgARXp5GYv0fb6cEAytBZtpM7/4QNxwbyImkuaCv4JqcgRTGD?=
 =?us-ascii?Q?ZBGJ5ftgRoXbg6FQkjJFtTUl9XXIhTEh4v4kwE185Ly9rWZHfoc4Rxhz8DQP?=
 =?us-ascii?Q?aLgmcaYTxTTl73mQTiaOyHcxXxgUlHyXajVUfI+yS2DnKKw5ACu/82utdIH7?=
 =?us-ascii?Q?ADZHrs7y/tw1/gGJgNADmJofe12YOjRDQ9TOlm8Qp5pv4V1axhgF6wL//Pf0?=
 =?us-ascii?Q?BABSOzlQfuMY4gSp4U5DCxdmPU9lPOA9sjtr7x1fdZcKm5+FZkfDRYpYIwf+?=
 =?us-ascii?Q?4WLyc8CExfQs91F/ByZp35wXGSHTinkdfOWM31tC7X0v+B725et6z/OQDqJd?=
 =?us-ascii?Q?UjubksmcwChfX6EunL53LQkKIayGIqWXSNtNhDVCNxPJ1R5pqQYf8AJnSF9E?=
 =?us-ascii?Q?gtBUX5AHY0E0kmEdxgVK09PNR17GlVQnAY2OXkpHA0bIiSW9wvjU93YXSauC?=
 =?us-ascii?Q?qujmr5u7MedOG/Yk3Sz6CDrx6BI2mG0fNi8PRXRsLKXa/WFYzC9bqJfxrdP5?=
 =?us-ascii?Q?PcSkFwc64d8Elnfth1tFn2oB+MszEk9xIVkp0sp0ThNmGCCr1DQZQAq1Pmfk?=
 =?us-ascii?Q?lGhWcGh/6IUnopXkiWidP1+k76z0mzOeU7Rrub9lW8+EFLJc1UWpfFc2rsis?=
 =?us-ascii?Q?c8ZA4CS7BDVSCqI7e1diJaX51cyUygnISD3cu3OdQm2kUXDcnBotT0hw7C+Q?=
 =?us-ascii?Q?UBYFipcP4EM6smPse0oSkQfJClmOsdcg1Bc7a/iAIKujYopnlKkwzSN2wo5a?=
 =?us-ascii?Q?2Z+aM8oRSRGj7DAwcD18QEu8pjxVz73fBLK77JFG+pmYwjQbFzbQnQOjEw1G?=
 =?us-ascii?Q?s0++Fy+zJqYiG6MMXYSeqi5BmsmW7SLZEBLKj6asrqHhIbe68zLRWCl1oHN8?=
 =?us-ascii?Q?4vKhAmsFb6SeGOHFwXCdq4GndbVru/GkAQWNWB/MSJnB8VljESrv85hs1sLD?=
 =?us-ascii?Q?h8f/RvMYNl7jIdA7uRfjt6MTPwyKfamJLc7l+DOh/+I2ZlbxHeh1QyG8GI5v?=
 =?us-ascii?Q?XMxUPk6dTrH+7Xpu2nJCR2EWodRT18OdbwlXqq/MzqdFwUvzPP9ehAys/uGR?=
 =?us-ascii?Q?VFZgLvIETJm//JJ2RR+BBdwqm5YZad3013jcQkiIll4L9YmXgLlEgSmM8ftV?=
 =?us-ascii?Q?gOvCJVR4SLV69hXdMrVP32q/LAx0Dt2rPXVuBC5beWes7dYH8ngy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5384cb8c-963a-4393-4ee9-08df35373513
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 21:05:34.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDtbCoDJX/ZAYEBE4u9eYoYW2PlTiq1vV4Y17O7PJ4J3wm4dHZvRWZ24osX4C75BehC6UR04czXeFnkWQel40bqymmLzke5WB9v1Pz99qgPKK3XXajZhZelgY8pG3dDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079

On Wed, Oct 28, 2026 at 04:08:03PM -0400, Frank Li wrote:
> On Wed, Oct 28, 2026 at 08:44:21PM +0100, Emanuele Ghidoli wrote:
> >
> >
> > On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Add usbotg3 iommu information.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > > index ccf9f510e0f88..1370a571153a5 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > > @@ -32,3 +32,7 @@ &usdhc3 {
> > >  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > >  	iommus = <&smmu 0x11 0x7f80>;
> > >  };
> > > +
> > > +&usbotg3_cdns3 {
> > > +	iommus = <&smmu 0x4 0x7f80>;
> > > +};
> > >
> >
> > Hello Frank,
> >
> > this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
> > (both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:
> >
> >   xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
> >   xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
> >   ...
> >   xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
> >   xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
> >
> > SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
> > Reverting only this commit on top of current master fixes it. The other commit
> > seems fine.
>
> Does it only impact superspeed? High speed work?

Thank you report this problem. Suppose below patch should fix this problem.

I have not time to test it today.

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3df..7d485f5494ed8 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -117,6 +117,28 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
        bool dev_iommu_present;
        int err;

+       /*
+        * If the device has no of_node (e.g. a synthetic platform device
+        * created by platform_device_alloc() such as xhci-hcd), walk up
+        * the parent device chain to find the nearest ancestor that has an
+        * of_node with an "iommus" property and use that node to configure
+        * the IOMMU for this device.  This allows child devices that share
+        * the same IOMMU stream ID as their parent to be configured correctly
+        * even when they have no DT node of their own.
+        */
+       if (!master_np) {
+               struct device *parent = dev->parent;
+
+               while (parent) {
+                       if (parent->of_node &&
+                           of_property_present(parent->of_node, "iommus")) {
+                               master_np = parent->of_node;
+                               break;
+                       }
+                       parent = parent->parent;
+               }
+       }
+
        if (!master_np)
                return -ENODEV;

Frank

>
> Frank
> >
> > Adding the same property to the parent as well, like the NXP downstream tree
> > does, also fixes it:
> >
> > &usbotg3 {
> > 	iommus = <&smmu 0x4 0x7f80>;
> > };
> >
> > With that, SuperSpeed devices enumerate again.
> >
> > Could you please take care of a fix? Otherwise I think we should revert this
> > patch.
> >
> > #regzbot introduced: 73c3b40e536d
> >
> > Thanks,
> > Emanuele
