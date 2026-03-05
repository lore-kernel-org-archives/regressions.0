Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA935DA70;
	Thu,  5 Mar 2026 22:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772751097; cv=fail; b=p0kcLL9ePojcV6ElR0uTLwYq9qME68oc/2RMJw07VnUTeCyfjMTLJtxHYpNGaMv62rK/jwpvkx7g8sJhVkNeJ6syEmG1fjI0TW7NtcNcZFlk8qjGS4c3rApStxMHtV9F3hnQDtu/wOasdd2emWEPwPtT0OLIecTYc0ezdN4HkgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772751097; c=relaxed/simple;
	bh=DidVWHzCb1gEkiJkltegde4LoKqkC+O6TURcUCd9wZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B6DLBiFTbJa1nf0FSOfK9N2FBpy5J6MHhBK856DbpI8bhe4+Qh+Ni++zHqgKpsLPq4/tjoC2fe0NGcAp8AxWM1De04a1EzHGFmwrsFlPRBDz7iJMHfh1E9L6VXpW4Wqxlcrja2uPd5wJzd0H4mfg6ex/CCD6p0VXjEMTTn3qsgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gsz7h2jM; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gsz7h2jM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGiIwAqAf1bkdZcE5k1z79SPtjPKUiN5PuCEBSByt9StQfDlZlJRp0VV9kHDF4ZNM7ffoEAdLwwXfDRwvYM6KVw66J9XJTCgK2H2qQIcPBLzw0UzSZIzHajoQJlT4szfjxTQSHf6eU6u0sSCBBMt+VR5rX2M5xRwJAU4bB8goNCslUa9JCHNwwEXP9C6G0gvcKxq+pXrzt6UXwj03vbo9BUXD6kcTbfrZs3aZp/LFUnsCB5mTunW0/ppodNqoWeyDAQGv9nIsEfSZzM/jyT9Bmhw6wwKcP2Pu3hMP6gO6CuEm+/zlVrwOH2Ft/gCwvKF8tABOzwSHQELh0IofZ6R3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLu3L9sDscDr8sVN3E/3rdDak0q8SMyvy13GXCPLAgw=;
 b=IEwmzKLGZxGEwbm0MWaR4cIB9JyEcl8bkRgCBHH8AthhI4TWypabFUi8aCmY7tplS3oOL1NtRfs7nd+viGsW9YPdYTAVjogyU/3NYOOLActylKZhwLVvixMOy8PNQy98+r4xf9RzvkDJqPxwGN0pRjiBDx5LVrtKHZT08ixAWk8cQj2rF3tDwq6rhp3XD7iMtfIMZp2zzuGPwfzkLH5C7qEw97L3OpwGUnRwkf+QjFKPkRkntcfHuSBuOKVVpF0c1Hxem+6siaxkF7DUbCPl6dunDPtp5e2JXwOZwli3UaYitCVRO9IWRVPbZ8z70hdLOx+Lzc5nRg4NgcGASTQYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLu3L9sDscDr8sVN3E/3rdDak0q8SMyvy13GXCPLAgw=;
 b=Gsz7h2jMJ/aBrd5aV1t1Kig15Y3x9wD0/AguZGvhAiziP1K+nMQHNx3jUIvcXDnrhyee8EskZLnGyfgmuEbUZAZl4+sxf62jJjMz2BGWC7R1+Dta6ynarvtir15KIxiecnRe7Rks5cYF5+RczZNOkguVryirt8CXK/u23sIqh0l4w7KYAMQtB1bQO/W0uXePv9vK38uSV4/tUvabZFnfy0AlT12WO7qasfkLjgijGh5+CKb0+DyVJF3UoSyl2iSbcgEYJOs52rLtLcQPLUmxSqGEbctrp85kmar6/QveBV++Z8WbiT+Du7ELYVNNz8M6jscnndxOOlgZi7pqiqI1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB7032.eurprd04.prod.outlook.com (2603:10a6:20b:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:51:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 22:51:33 +0000
Date: Thu, 5 Mar 2026 17:51:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: max.krummenacher@gmx.de,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aaoI7TqtClwSKTLg@lizhi-Precision-Tower-5810>
References: <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
 <aaBA65_zLu8S6WMS@toolbox>
 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
 <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
 <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
 <aaniGuauaieO3p36@lizhi-Precision-Tower-5810>
 <39ef5c99-ba8e-40c1-bf93-359db7297d55@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39ef5c99-ba8e-40c1-bf93-359db7297d55@kernel.org>
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e060f95-902f-4a82-3245-08de7b09bf94
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 QAKB8KMZF2KoEqo6QRwyt8vbXrOO/wEP5fpoWAcAhgg/P2PV7CxpjIYYDTXCqU9JxRmhnEpx7wGmjyQlSUDqzkbeyESvUNB/U700y8sU/ltDZpWWtJxBQlkWa8x6dau0oZmJi7XnLL9sfaqNEYKWkOTbqj90CGHdsy6WwcPclxNHsI2+fCWVIBmpu4GKauoOVSOusOlR+y+MnsHvYm4bgKI3jXJF6EilVllft4veUh2kewcSAZnIt8uuiuUsYDKSKCnZyZhK6MB6Ywu2QsAeI+Hvwbrxeie0Qekb0zy10qOCFksCBQt/Ib2y15Yho2rrJbEX2Nt89EMdjMWg4fWx1l/6aGCSJaMhdd3H5XD3Ld2/t+EoHG2tfIT6AHd37mhz6iA4S5PI56a2B7EREuXPuows0yhWbtV6AV1OPltQLSIeBi7AE2Blrm+nU5eJNvoxmLVvZimVgf8Ow4FxAu3a1MfdqULQP1IgLi5854caIWBSD7ku/RDN/U+RY6f4TlzpnXUCSqAk7uZco7rUbUUspmJ1DFnE3ma7g3+s2oL1JA4gl4irWHw3d45oVwYFGl7mlKhfrMoX2vai3l7SjABNuP+OTy4ZNd+FUPV7SfXPSVEj9Q3gtlj49dq7OISqh4fJ0Ty6343129H6lfRdehiGxVQgYcUtIXtMHqVHe5jzKlLFlViSiz7rWTqZJSjWKVx8BR00LXscOqkHKqjJYuRjLztv7NYPRNugVkHjkadDzmw4kv8oTC3pTyy6u3T8lwvS2N/e69/NzDCME0G4sw8IFT/juyoVtypUjvw4fMb4/Ok=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?glEyGra1aMjBPDZCaZZdl3jifee/w3LMzyGfMKeOwuncMUKwYZolvUMRv7/h?=
 =?us-ascii?Q?iFXGOw/w5SfIkGZ0nMQ6iJ4XxThPrJ7H0RBNOGpHUGPq7BfUIBKZZdLbc8D4?=
 =?us-ascii?Q?2Gc1qrwUO8k2YcMoYWxIbNAXMjVIfF3fbl2m6SYa/mbzJLlreMD77Rrvq4if?=
 =?us-ascii?Q?ruwgWsxowQIrKSf7BrGSaOpY8gbILDUZrA3saZHVpwIPWmZGfAJIPGzrwClC?=
 =?us-ascii?Q?Y1JMoGQMmOcs1evdkZHbZ6yV6kFvHAY9y55GGpSfHticToBkJ1LOFG5wsfwO?=
 =?us-ascii?Q?QJznGwd3HfksvFJsVXZPJPehef9LCnvZ/gBNlLo0fH+5X/Y3QXj6n2xbIIts?=
 =?us-ascii?Q?00Q3qhfcLoTcYAhNg4sSiEPyKAK71biZWpE41CkDQQdG5y+yMOjRLVVusxvD?=
 =?us-ascii?Q?uFjNuO5OXHnuyl+hUaekyjxE6pnEyoYybQXEeWBcAx1W5mgWRcPKFnTGtrjs?=
 =?us-ascii?Q?yzVX2FEvNb0E4O75TpbV9dL6lRAbfFsjxaQhkX6/IEWct9VvlOsBRvX0ZajD?=
 =?us-ascii?Q?5xemxjgDOfk9C1z2yypPjuJR4Rztg8betsr2Ci2cdTrzriNIL7r8/vJvgHz4?=
 =?us-ascii?Q?0uonCack+3eh6GVfIHj1S+GnKw2tkgNuCpjj+jezpcuWECsP7ITRcqDSzLaL?=
 =?us-ascii?Q?5QQA1oDeWKSKCgW59GOtQs73R241uIcyRYlimLCR3JD2hQEReOMrydDQXThf?=
 =?us-ascii?Q?Kh5Va/YWOQ3oTk1iBW0NhhoESHBIezkrvekRg7uTykw/pBLVus3MgQ5CVGpC?=
 =?us-ascii?Q?79Iww3rqUl/HWSIVAWrkljocsBHVjo3k57EEbR41MfUKDmpb92MwkKEknL7N?=
 =?us-ascii?Q?eiNPUuU7G4jKh5QYnHQyYtD+K6Jb1gSQY99sqLFf64a4OpOi64G44/iP3wBe?=
 =?us-ascii?Q?FBRrqpvCCCudJXq22CmPtJMkZnENV999QiDDKHqeZ4sYd0JEfz949bx62v78?=
 =?us-ascii?Q?UbiYfplOTbfm28zKD9vz/TaDDglAVL0iUeFmLPcb+1nUtnQ0F6JmTs24p1Kd?=
 =?us-ascii?Q?GcIJZcQwd/gDbJj/WTiHD8KGbKmgq9hQ7jykPD5dwZ1ZZTDki4lUHzYS3/Ok?=
 =?us-ascii?Q?U9c6D+XiOzWfqP7VnbtvzpPZ5dWcWpdvsrLhBFhZvIdMUpe/21fEmQ8/Q8jJ?=
 =?us-ascii?Q?UjJN7H6F+7dFEzZ6czUAMVBK7IvW2YahOOpCUQGSGUZ7l6gtvev/nmTqKtPa?=
 =?us-ascii?Q?9gEPtFXIsu+1dRS9mfl6wvo3/lhaB32v8yVEi8DzfhUAqrbOGqPAfzWyNV3G?=
 =?us-ascii?Q?IBaW+clYF+LMi1hcEWsH8eV5eXuu+MZnDBz7FqlWDJBh6exPVQ8runQb5fS/?=
 =?us-ascii?Q?mopazDR317xHpsQXt4C6xtxeqj62BJSsHiaa8AJ9T5A9s5093+wGgRniOEbs?=
 =?us-ascii?Q?DXwnPA2nBXcIe1HPa7ZYl/LJXBlNZdTgK8c6SqL3J1C0DGFSWpMjy6jCYIYj?=
 =?us-ascii?Q?ohqNlupLl9XgJygH8NzN8r6IdFeZRoaJECZfD5owHzAZ0BcEYNusK+n52kPN?=
 =?us-ascii?Q?I2tWo2bFDoWqnYTx9jS8UO1p8Xe+Li1wDDUBGUXLfJ7eDtsC+MA5ucgwXg0K?=
 =?us-ascii?Q?sLQMQOlDI4fwnv/kzV4dmpAtvAgv2P1jX6/DjPqODMLMAi5PgHUkLy7xh+2j?=
 =?us-ascii?Q?8WvOm2bgyn3Z1cIfzdfa+i+2aQGG4HACtIVMV0qWESwXBrjSQPWmEFMT0OFl?=
 =?us-ascii?Q?tAO1NPbDcALQIiz/+jNRJTT7Hykc9ccqqa1v18VU7STDff2EO6PuOEiX4pbK?=
 =?us-ascii?Q?SS10CZkkeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e060f95-902f-4a82-3245-08de7b09bf94
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:51:33.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TE1Q4k5F4BYKmjSRky7DXnjsauDtTGvRdomfHMzR/dVMDSFGmv84RsG1Hgn27OY+2lA/eyhSj+CJDwz7EFusBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7032

On Thu, Mar 05, 2026 at 09:37:26PM +0100, Krzysztof Kozlowski wrote:
> On 05/03/2026 21:05, Frank Li wrote:
> > On Mon, Mar 02, 2026 at 10:49:28AM -0500, Frank Li wrote:
> >> On Mon, Mar 02, 2026 at 11:53:00AM +0100, Max Krummenacher wrote:
> >>> for our NAND-based modules, and our CI no longer produces any useful
> >>> results as a consequence.
> >>>
> >>> I strongly believe that, as an immediate first step, the commit
> >>> that moved the DT NAND chip configuration into its subnode should
> >>> be reverted.
> >>
> >> As my previous said, can do partial revert? Just add back property under
> >> gpmi and keep nand@0 node.
> >>
> >> For example
> >>
> >> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> >> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> >> @@ -260,14 +260,10 @@ fixed-link {
> >> &gpmi {
> >>   	pinctrl-names = "default";
> >>   	pinctrl-0 = <&pinctrl_gpmi_nand>;
> >> +	nand-on-flash-bbt;
> >>   	#address-cells = <1>;
> >>  	#size-cells = <0>;
> >>   	status = "okay";
> >>
> >> Remove "- nand@0" part.  You can use "git add -p" to do that.
> >
> > Do you plan rework this patch as what I said?
>
> Issue and revert were posted two weeks ago. That's maximum time to
> handle regression.

Any docuement said these maxium times, I also want to know other maximum
time, such as
	what's max time maintainer need reply? Many patch is not any
reponse for long time.

Frank
