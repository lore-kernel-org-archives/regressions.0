Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F78722D7A1;
	Thu, 28 May 2026 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986885; cv=fail; b=egTammnOzNtg+Fwnj8HoCU5hAUR3cvz9YaBik3qDxfmHeRr4zn60d1+lLafG0lflHGjHiI+4eFBEwgSvEh6YKES+ZtyZqSZpeHsIdapzKZHH0AU2GjAEfzscCd6hKdx40uGGeG/RBgm31CxupaFfa3GLT1ZotufQBce4nHdftHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986885; c=relaxed/simple;
	bh=76iEfQpupmvSivHm88c/dxk95DJW6MP4i8ESmPii5p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TU+wNlvxoU1r3mpz6VE1fKePWXm25HMsZiCD/BwSONgC2vAxtMQIIJre3KXPiwB2RdpM/sHgoIN5XkbCwVfNOzA4TbhT8EwyrUC8DFICbZdX/m4p34EkITy19VrWrrtYp5LxEjdcGu2Y2YS/Xl/hyVhJ6UxoFKr1MolztccZ0q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SD/er8uJ; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SD/er8uJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBWv7hnQWZnGfF0jR03RS8SLwdUHllR6iGr9ZCh58ZlJOogMGKo4JHmtqAIDMVAOwDj6k8LYLxOwCSajTJjRKNo+6QWMWjUovWXjZnvzdWz9lMaP9WVst3t0DgVTBeFF9Z4hp+Bc65LoijXtPjetoKHNmpHnYSgcV7CTpv6IBc2Pia3HR7Zf4KndIn+L79naPCQp1KDo7X6sUXe6NIOlhGjKyZvun2yTATUiL2XXZNr92Il/eT6JSOyCak2Jv1Q3IwDgnipvxmxV6KmkPIdEz8Njq+AcyS+GoNDFtzLl6c0BgI8HZucQQVyZjfbRyARqlrMdx2sbM9dukSazTQDpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7kuEma4W81oHAHAiB4h5hXLGdkxTRcszUrM2yzn+Rc=;
 b=Q7AYxZiZz29fA8pyBZWAk6oqx2O2kINr/uebT/JyfCdf9ygVFPWjlBn7UA7VDdL1DlxHNBNZgvqE/dZQbxIqlFeH5kf3vdX1rC4felsyXRkyke03qIT7GXFbnJ3R+7Ti0kMEC6++QolhjhrG2JGBuiKla5UoPvSztTBTLMYVBG/lNMm7jncgVp8s++CQfEUslGHDrH/Ux5ldn28Qst9zCJ7YnRl3FD4/t9nyQTeH4vTdSKrs16FHKebAPI4q29X8lmm4vTIP8hLdyJPf9CYDHToCvNQdHqlyYq+AkllN3HtwXbOImudIImoTQXFgFgt7NaBchFcFsgd3cPCrlHO91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7kuEma4W81oHAHAiB4h5hXLGdkxTRcszUrM2yzn+Rc=;
 b=SD/er8uJZN9/VomYMlzsbVW1OavVCWMKKE1D/3zUobxgGXRF/td7eEUG0kTsUY1e9z76ZeICcO9qPVHJdhh31rS8HiuMlRDS8nBTnFo1SqMGY8qvExAuwkMh9JuUu+qSbT+Rnl5qwITM0r/C6DBQgXrCc/z0Mvnhr0pXr8rwOdH7YRMvDokSJkFqfgUIvpWIJ9D6nE9Cikk5BsCN5YCI6IdEgVxFTHP0+yFP7vLTfTDkTwX8/xibPLJDBi+4dYEcIXY1zScglwAUb828npR4aFH7hN38R26g0RvBXG+BN43gwcRLXyUSid9Ej+HqMDAtTtFZcyA9o0RqiLQY0UVs5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11740.eurprd04.prod.outlook.com (2603:10a6:150:2cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 16:47:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 16:47:58 +0000
Date: Thu, 28 May 2026 12:47:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
Message-ID: <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
 <177816879666.299775.3947960528231798400.b4-ty@nxp.com>
 <3cc57464-a10f-4b8c-9080-8d6f65a0d42f@leemhuis.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc57464-a10f-4b8c-9080-8d6f65a0d42f@leemhuis.info>
X-ClientProxiedBy: SA9PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:806:a7::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11740:EE_
X-MS-Office365-Filtering-Correlation-Id: 18de5d5d-a4fc-4148-eeb3-08debcd8dfc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|22082099003|18002099003|38350700014|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9iGT5DdbWO5OQI0Bcv2Ms3fB88KQyWV7RXgMiGFCbADbQITCELYaV8jYjv20uwPbMqGRG94xY8qU/Vnnwomp71Q5p5SC2nQ25n1yUBCRpw56cz5bgGrmr1rO7/CZZefWDn5qcIsI3p2+o/YuBKE6odv/fXynx9E1YqWmPoqhwjIHYmAifElX8LzOEuWwDQtCSSzNWsZ90NTE/BHtKi0ClGsXFLGLPSfKuiz/H5rfxGieXJJ6N0eSnur6Pom1klYjKK50imRBggP+YR3laig8POE/wtkIrZ41zsyPKh7Ea7WsCsOYsvAwFD+Ri2PJhXjtSscNntaj9YvfE5G1Prz4wyDf8eOh7k5tuV+9hqP8Y/4BIU0HvIpARn9RWKkQgrUZGfmDYEYlyddc0Rycs15bsAeuESTRqGmrxG4m3NPPHaoPBRerLwsuBx4uVcFnDi5ncZFxU620wGp20PxSqZytmmenUrAoAZVRCoA9CZMct2pk+LzZCZlZ9nfq9PLriD8yV0wXp7E1W4Pm4KZtHI4XgAA52gOGjoBVYAMMPO6m7haYwDV/ldZEn6nVedsvo3ddKDd6skSwKDLUmQ7KwPyUvqLuJRBJGBWdvHL0haQ2NuyVye8VPGRBlAYB5yUzYKOe5dI5HUKy1Cp1Db0tJWX+9RdoQtPGO1MXEuL8I7jk2DEU4qyHHrXAlF8JXj78b2FMoFrQpm6tgNOCYqoVReYPK9ew5hsbANZhWwchSJdw7uj8WvBJt+r2fYwmYR2EN71w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(22082099003)(18002099003)(38350700014)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OPAKcnqp2unjDRAakbWm8qhYr2Y3Vm3k9vj/fQ9xy80EwBh+x4KC+pPV/akd?=
 =?us-ascii?Q?2h2eNHHMGKqtwU74DwEvDiqcsQhptl8XhlxSPc8+JpVHkQpxf+T2QZ8XugVY?=
 =?us-ascii?Q?cdesPEhMxjIeotZ5M6KF8naXZgHsWMDOXY/gPfb2A+pXwqIbJNXwsud9yNjt?=
 =?us-ascii?Q?a3SlOTawyw/doVpibV6S0QgwPPKV+08PYQe5+O4mK5j4uCzojgKuubQOEqOs?=
 =?us-ascii?Q?l8uDYUAQhCn8L6kY+xeZym/Q8LaxiC+73Ouxeg+sdnG/IudDb3T/6O/O//tL?=
 =?us-ascii?Q?xBQgwva7LrgLVm80X9SNoE/V8kqnP/WOz0SCDSKpZNwEIsf9iWlSvY/SIP6r?=
 =?us-ascii?Q?AXqV9FzM9gx0EFK1DhJBnktkP27xYYj1aSo2ma3Fb15en18UDabTE/t37/GO?=
 =?us-ascii?Q?PIHzZi7UlCXTZkG3vs5ITBwD3w+tcuryGygGWXq2458Rr8gnGxXzSHwiiUER?=
 =?us-ascii?Q?KerNtEmRYbkDZj4at9FOpNHtmrdBfHfr6KeTv3PYBVEllV6G/T98ilfmrFTu?=
 =?us-ascii?Q?/uvUl1clf1YjKqH23wR99eLKCvl0I0Hu5ECfdrAneNqzaVsV2+Bi+dZ1jCpL?=
 =?us-ascii?Q?f9Yw9RIw7peTnvO/4dj45PCqsO2ofXYtm+0mK9dzxJLdywFSc+GzINl6ExmJ?=
 =?us-ascii?Q?trfcaioxSe/mqFZ4G6TwReVPXXI7XLX1I+7f4joiIKawFjpD8YtwaAoObDwT?=
 =?us-ascii?Q?QUocsjjyTfuvGu28ga2ZRjq5i3TbFD7s9COYuFDk8rWCGF3wuqIwLY+1d0kB?=
 =?us-ascii?Q?5u9XelcLVYR++Q5LA4ECt1WJHHvHUg0DfcMzkwFaPh7PvmGVusPkM06SVvxU?=
 =?us-ascii?Q?N5FA0OPjy3bRMcbvBs54Zz3gYxqmu1MLcFbOtmVoei8ZyyoTk+sDq5rUEC03?=
 =?us-ascii?Q?ZkZ+y7SzSKVvnf59qCzdwk40rSMKKsKWHJg7VGuMRbilmQR1Vx2M+rKaeAvH?=
 =?us-ascii?Q?sJ4hY/ioQl3ghOmeYQ4Ll4JI05s3Gvx269h6LuZOZZR0atMbBopVeIamHM3+?=
 =?us-ascii?Q?lbWLJ/3l7fNv1W832mPGanDFSweO22ybB0NwLL7TnSyEYNzWGGUmnan1qaO6?=
 =?us-ascii?Q?D9D0tVxAQJVFP1kzAxiSR9l0miKvcsgptORPMyPo9UAcOhak0QkdlNiN1EXl?=
 =?us-ascii?Q?yrQpbmJVTsfHsvx+HJywRB0xqHIxGzZPage6iqf8L82KyEpJmu3r+SY4InGs?=
 =?us-ascii?Q?Mzee8HPP3VvBrkknfieDhYuWooxVGo0j3y9VNKL4+d0QCsQ5HmIu61XjvjBF?=
 =?us-ascii?Q?8hyC/P4BHROtLw//N/ozbz/tIfmWtF6iPXrbBTecP9SGMLqMlg4rGTGSLTWA?=
 =?us-ascii?Q?WT1Wi48o5KjD5WOQX/2eVmyriCdvH4kf9eUEeecF4xu3BvoE0SSvwKiQu3FO?=
 =?us-ascii?Q?OHJeEBzCF0Keo4WEzcT7/IFI8bktbDP1a/igeqLRmJH3yqUs9u4kPl4HFMJC?=
 =?us-ascii?Q?nlzgQlpyjFlliAqUW2C5KKCHshMy3YC5iruJFSAJBTK0WkWVWjYW+/AJnnYh?=
 =?us-ascii?Q?3apWJzwXdhGCvr/9P5XQyAvS4Ba/SQAfaRCiyQ1iYCqtV54cOSmCvqsL0GSp?=
 =?us-ascii?Q?cdcQtAIk3yhXoxYxxwxEVBrLmhVG0nAwJImnEzC3hD/zRPKEzl3IVk3thT0C?=
 =?us-ascii?Q?LVRSi5YMCbVbRGRmwBb+AQYHvSJHcl7uGl44jUpkhj3cqw7FqJqcvIZGVgZQ?=
 =?us-ascii?Q?GrAeKVgw+mPh9HSvO4WdMzt7A3y0g/w5z6OZfLRabpr//WSA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18de5d5d-a4fc-4148-eeb3-08debcd8dfc4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 16:47:58.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1R3Pk25Gj/3/45/2bG9pA+D9h1TRahF2ROfY4HohvS82/BnoDvUg3GlENqKu1vMpqrEG/XFp7BwjYfeQjwLog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11740

On Thu, May 28, 2026 at 12:55:34PM +0200, Thorsten Leemhuis wrote:
> On 5/7/26 17:46, Frank Li wrote:
> >
> > On Mon, 27 Apr 2026 09:01:48 +0800, Peng Fan (OSS) wrote:
> >> The i.MX8M soc device is registered via platform_device_register_simple(),
> >> so it is not associated with a Device Tree node and the imx8m_soc_driver
> >> has no of_match_table.
> >>
> >> As a result, device_get_match_data() always returns NULL when probing
> >> the soc device.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] soc: imx8m: Fix match data lookup for soc device
> >       commit: 2c6821657ce3b3c85f92719ea81ec9f9ff27df11
>
> Just wondering: are you planning to sent this towards mainline this
> cycle? The regression this fixes was introduced this cycle, so I guess
> it's something that should be merged before -rc6, as that's when Linus
> wants all known regression ideally fixed. But from the name of the
> branch it sounds more like this is scheduled to be merged in the next
> merge window (but I might easily mistaken there -- if I am: sorry!)

Thanks reminders. I intent to send for 7.1. But second look, not sure any
big impact although it is regression.

commmit message have not show what impact. I checked code, look like only
missed some soc informaiton. Let me know if I am wrong.

Frank
>
> Ciao, Thorsten
