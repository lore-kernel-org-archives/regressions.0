Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773337D13A;
	Mon, 29 Jun 2026 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764340; cv=fail; b=oBy8S/UPU8vBmZS9EOpB0EQgrJviumgZzFjp2fqvPIr9XuXqFcH6mWPu087dgnebqVV5YfSqgJLuCzsV5bDhs+feRS/F7KxxmXkA7egbQcx/FJ7fXpMSIQ/LgyiZD7L4ay9xsuqi7gIJ4FR+6VsRTJllLM8mzCg/2WNLLEVZirE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764340; c=relaxed/simple;
	bh=w7W7+Sz0O7sUha9ZJPp0+mx57afFJVQJ6n8aEsr5PL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j6uWjNXJJ//v5ReuyFZBf/z30w6LiZNhX62kclPt3YMm1Qljf91tz+kaE5/qG/fIZY27FzzIpU4TwPJsW1kmm3SlZQl3de5Sq0/ttKTNe7px+ayL0yifwqis5HdM0xdR0tVdIYoRqt6WVDOYaHwfoz0iKX+hVUre1ZMLTgBxYc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AtZVzoNJ; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AtZVzoNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7EGw6+W9IdMGilaoTYyR1X7hrBuKONDiLn1a3PksK1eIwpiSRx4PFJ/PMhPBqIQtMu0xyk17YRgg+uhWKg3h9VyVZCn3ryLy74B+0HTxx8R4TTuRKfgf2ncNa8jzrYidnxUFFLk/sfJ4GNQCbEgfLe9YhbtmjuYsb0MT7KZEYirogQ7V0F2PcDGlPCgU4kmKDZAznU/9R2Nh35UBh78pqgfkCjZR9EahG9sTA9ROZm2X/kRJP1XVXa5S0rXU5/fPlx00N308LNs5jaymjCgj6cNrkATuXFOnAA6FWVg3dzLcmgJlwdzoB4/RfCkhBidQizWh0szKOdPBDHXgpkEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U/tqvMNO+4hi5AkpeVjOQ7FJ/NMHLcEnlIZLBAMbGg=;
 b=KPENsCOzieT/HHO2SdhlfjguBmGwzNbNVF8Qv6r872jMlOQBXzEj9JM3ZsiwCn+dxy/bBswq9EVQpv5NMpIdS7m6J1xYmsqOysChAP+ERDmknTsyfPQo0RRS2H8CnecNe7vDCftZUh78RgHkqXTwe+IFISJDLOLLR1fS+nwgjVY/LLZwPwj+sKndqUPCaJ6DAr3/wVE/hKnVQDBl4wKR5vyfduqpNCto1SUdP/9B7c12xPt12f8HBKYrioxHBaG+XP2TZJq9FhnVna/Uylpo8Ms77GTXiaJJWySz/2cXDzzhNlAnQIOdii/Qb8k84FB1SxxUyAO74Rt3oWw6dYjXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U/tqvMNO+4hi5AkpeVjOQ7FJ/NMHLcEnlIZLBAMbGg=;
 b=AtZVzoNJzpieu20XOIQeHWoV57KiWZB4Mo0hr4TTdt+mmfJ0tW50f6twTYdsY9gkNQzRFrz1VyUueOv66fLbd1nQM2mJ4986Rrqw8wjAZTViuK89Nuu4qRJPSoLFkfL0WJmnpjX70s6C04+yCZVJugxX00/ed2Xl2V0CQGtfJVu+ywhlV0W6ogTY81Fmv93ywsYaq7u97hFmlujod3Gxy9ryQkEKKViwf25Yz1ICFieVgSFs9ajTDk2gcbST5NENJzfvNpcnF7FddCQl78pWezUuMOd2Zk2VWRip7Q4p5S5Plpoc9RjnO7lUImPsOvIDeq1IVaV2oU9eGss9mHjDPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9806.eurprd04.prod.outlook.com (2603:10a6:102:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:18:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:18:54 +0000
Date: Mon, 29 Jun 2026 16:18:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, leonardo.costa@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <akLTJkNmD2rUjyw9@lizhi-Precision-Tower-5810>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629143439.361560-1-leoreis.costa@gmail.com>
X-ClientProxiedBy: SN7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: 7719b5b5-24f7-4926-5745-08ded61ba45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|7416014|23010399003|1800799024|18002099003|22082099003|11063799006|5023799004|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oOb5253rNChtP492uk0esCa5qpU51VnWArkcy6MCOaVs/SB3Ta8tn112SRjIH3xz0q05POvVlY9lUum22DzUL4dAO0eqVCHWmNinGZNoa4fBxhNP+3JcMB8jV7KmDnam0rJA+lpsNImUPtSaIvyBK+f6b8DXIxSsyYEkbyYKMAerv63Ia9qJDiRfr+b4WSVSFQWgEH1S5nAdZKLno4EHiDagAg/VfUoCdKxxlCgAy/m1WCVvdU2/DO5PswDS/xJrn5iMwtUv1jaMJpyctzfId09sIsu9i619drJg/Svb4+hgPhtZJH8Pzp9t5jXvuP83izADLsjabwi5evcDYqG5FaujwupXK/Yt1/c8vfoIodCosky8zyKRLFUSRm3PHeFVLUFb3pwY7ZzVj1GE7z+zTbRkn9FmyB30U6uX6uNcRMxlIr8/10qzNq9mZRRjVT/R2ZrOMGqE9nm65DszqdAfR9X2plcQReZLilKOUTQrUhCbYOjpcklz8WORiyCnaPZrzHtUfCPxoWXbFFpt63f3exUjHzjVzbsNlv8OaamGO890qL/aWhOVq+v50rl5J2FtzsB6gVekLO6snwJvtfeDZPRUyd/5dV/yZRVsUMPUyqIfoh5EeF34tu0kUs/vspPY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yRP2nCnwwjuwETpxj07ai4iv1Lap9fhGglkQ0PvvK9VPUUaYw2O3q0Xxo65D?=
 =?us-ascii?Q?oSve1m0cXqG0+fHxUuuOixOOKFLdlYBX/+pr/RT+cbaoaRbCvN+94+vW/qbg?=
 =?us-ascii?Q?+yt+Ag358xCGweuAjhL/JEIqiZRlwlK/mfURgoAnGof93fhPDvx9anUvo6Jg?=
 =?us-ascii?Q?kHs9cqcsQOjRiKL66Cb4CLtoP2SwxGQ2+SinwZAkn/brRjWgerYAVTnRAc95?=
 =?us-ascii?Q?h4tFhcr/pYdwa0g00PoMuSzdrQIx13tK5wV0Vj45xXoASdYH37hXOXKTdFpG?=
 =?us-ascii?Q?nGu6Mnsgmh5Crcw+yTKv/uuLeIjmcH6PajAh7wq369HM0FSiTLwpnxrcVEeK?=
 =?us-ascii?Q?9aeMVLWDxmVHbczNo8XCRjCUoiYhIzN5Bm5tyR7OvuBFFHgt8HhEVBEeNBqe?=
 =?us-ascii?Q?YFJBQMBIj1sXyWkXVmupPQKlbPXCBrao92930hJbYwB0du5SXUVhBnFA05OJ?=
 =?us-ascii?Q?OPLT8zVWI6GbDOMuzN9Xd1ETGaMm+lnqQeUs7lxG+ILaC/Bo77HwXRB6c2Ct?=
 =?us-ascii?Q?8UapTFwtTpw4zxoU49Zd2JAQLJLqT0rxvweWyZartZyf4n5/J4TZLwD3W0E0?=
 =?us-ascii?Q?qCv4DbGXpPqbN7hvvPZAoF6KYhRpZw0NxPrVxkLGOv13nrgBvJ/U09EkRBUz?=
 =?us-ascii?Q?HdUXBXEGpyReGZHZs0W7ud6l8yqOLT8jFQv7OkWfF2XYb2L9Hej5YoEfRw8J?=
 =?us-ascii?Q?ntKxi0G3I8cOsSSaIENYuuj+oy1c8oNpanm8QjpXVq6NTHoxDvXwW3Sfoa7o?=
 =?us-ascii?Q?wHp+bd3mpA33T9SGUZjOCAvEJACXfvPvxHP/T2tkfRHOSWXYBmIy7S6j48xd?=
 =?us-ascii?Q?BG9qk2io/v3Z3Qz/lDxsnAhfCtIERX+p7vM3vvLbTOg9pIsq6/lsB9yceE2Z?=
 =?us-ascii?Q?Xg13KN8aVV+pyi1c69159diahnKw/QVYwNvUbpE24if1f462L9/85fNTmcTC?=
 =?us-ascii?Q?FbS850ojLD7SwhMygUi0unCboyhBXkMHB8RQ1pjRJgd6RltGr5cSNlwmXVo/?=
 =?us-ascii?Q?DxUWYQGkhIICkZGL9mJIeKilnqQUnPKo0GL6iNDAeu1jEytnCPEXMb29nnAd?=
 =?us-ascii?Q?AnuMTFrlOp6WfFqGHDBCgrIUqe2z6uKUqZCO4fj3qUSiWsGMq2zc+DvlVVoy?=
 =?us-ascii?Q?N42s3Rwqk7bOizzOaFhqtb27cu/a1omOyUIGNSOh3WBGu7v0vj0t+5qU1w2g?=
 =?us-ascii?Q?oPsOuT1T4sHHV4ptRKgfDCSfP7ujmCJOSfXo2/SvPfLny23hQCsgkiD44+CP?=
 =?us-ascii?Q?5plYkNienQtuEn04p/6Ls7OT4qZfWwAe2CtonGyUWYzIebuJwc7uBRMmRr/y?=
 =?us-ascii?Q?MRKGEPk+BHxHP2j39Naul8b9Hlx849MYGKsyZrDjzso6BEBqfkV5stpeT/tC?=
 =?us-ascii?Q?Mt9QYYoj9MJzblprlSnisjmXbXkqq8ZDB/q+lnr4XEqxTVqLfzNW8zVYoHIB?=
 =?us-ascii?Q?3N4Yud4w7AC2Euu2jHZoB+15zycroTY2MyB+kyKjnSqVme5n+XMFWHfdRR/R?=
 =?us-ascii?Q?vVwqd5h7D9SDqAeVjBR4XNfMCubaGhT2ywBgFIRwSWnFP8Y+yGAkY6EnqAra?=
 =?us-ascii?Q?yHqQFm5gUwuH2qmGRwEhQqxHYeok4XfnuQv3MhfLiWZnxeDJJHLwNq7eFg2H?=
 =?us-ascii?Q?ujYkYa+8EGn6cs64BT9AbPN4nGvZW2pKPw/W1j8FcJA1kuaUlHhjj4lqe3eJ?=
 =?us-ascii?Q?8JHUZ5Yzao0OHpmsolrUVU4E+zrfSqQaFsZJWq74OTe/tOodbv0P9JNv6hw3?=
 =?us-ascii?Q?iN7QJPiLDxcOpkRNvQcVjivwBBJ3TzU/4ubKmitQGgfxrPgFZshv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7719b5b5-24f7-4926-5745-08ded61ba45a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:18:54.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYkcG7jsAI2c3qUB612ppyJi4b9O1i9morUw59wJA8XqeoADaI/x9/QPgNwsqa227yZOWqSmexTqY1fTUaUUlgKUyzjOj2GPyhTODM3NqZ/QsEpuoRjBK4zVh5aICKGU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9806

On Mon, Jun 29, 2026 at 11:34:32AM -0300, Leonardo Costa wrote:
> Hello,
>
> We are seeing a regression on Apalis iMX6 where the kernel doesn't boot in the
> newest v7.2-rc1 (it was working before, in v7.1). The device tree being used is the imx6q-apalis-eval.dtb. The kernel
> configuration used is the one shown below:
>
>     https://gist.github.com/lcosta37/53efdb2fb6e6e0fc05437c7e53b47737
>
> The kernel logs stop almost immediately as the board starts to boot, and I
> don't notice any difference in the logs that points to the cause.
>
> Is this known? We are seeing this behavior on all Apalis iMX6 modules, though
> we don't see it on Colibri iMX6, so it is not SoC-specific.

Can you help bisect to locate which commit cause this problem?

Frank

>
> Logs from v7.2-rc1 (not working, printing stops after the last line pasted
> here):
>
>     [    0.000000] Booting Linux on physical CPU 0x0
>     [    0.000000] Linux version 7.2.0-rc1-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Sun Jun 28 19:01:31 UTC 2026
>     [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
>     [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>     [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
>     [    0.000000] Memory policy: Data cache writealloc
>     [    0.000000] cma: Reserved 256 MiB at 0x40000000
>     [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
>     [    0.000000] Zone ranges:
>     [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
>     [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
>     [    0.000000] Movable zone start for each node
>     [    0.000000] Early memory node ranges
>     [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
>     [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
>     [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
>     [    0.000000] Kernel command line: root=PARTUUID=adb2cea1-02 ro rootwait console=tty1 console=ttymxc0,115200
>     [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
>     [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
>     [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
>     [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
>     [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
>     [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>     [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>     [    0.000000] rcu:     RCU event tracing is enabled.
>     [    0.000000]  Trampoline variant of Tasks RCU enabled.
>     [    0.000000]  Tracing variant of Tasks RCU enabled.
>     [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
>     [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
>     [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
>     [    0.000000] L2C-310 errata 752271 769419 enabled
>     [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
>     [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
>     [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
>
>
> Logs from v7.1 (working) (full logs here: https://paste.debian.net/hidden/0f65ae5f)
>
>     [    0.000000] Booting Linux on physical CPU 0x0
>     [    0.000000] Linux version 7.1.0-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Wed Jun 24 01:36:41 UTC 2026
>     [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
>     [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>     [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
>     [    0.000000] Memory policy: Data cache writealloc
>     [    0.000000] cma: Reserved 256 MiB at 0x40000000
>     [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
>     [    0.000000] Zone ranges:
>     [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
>     [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
>     [    0.000000] Movable zone start for each node
>     [    0.000000] Early memory node ranges
>     [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
>     [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
>     [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
>     [    0.000000] pcpu-alloc: s28684 r8192 d24564 u61440 alloc=15*4096
>     [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
>     [    0.000000] Kernel command line: root=PARTUUID=4ce4ba92-02 ro rootwait console=tty1 console=ttymxc0,115200
>     [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
>     [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
>     [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
>     [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
>     [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
>     [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>     [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>     [    0.000000] rcu:     RCU event tracing is enabled.
>     [    0.000000]  Trampoline variant of Tasks RCU enabled.
>     [    0.000000]  Tracing variant of Tasks RCU enabled.
>     [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
>     [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
>     [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
>     [    0.000000] L2C-310 errata 752271 769419 enabled
>     [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
>     [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
>     [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
>     [    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
>     [    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
>     [    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
>     [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
>     [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
>     [    0.000000] Switching to timer-based delay loop, resolution 333ns
>     [    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps every 715827882841ns
>     [    0.000018] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 637086815595 ns
>     [    0.001910] Console: colour dummy device 80x30
>     [    0.001926] printk: legacy console [tty1] enabled
>     [    0.002519] Calibrating delay loop (skipped), value calculated using timer frequency.. 6.00 BogoMIPS (lpj=30000)
>     [    0.002561] CPU: Testing write buffer coherency: ok
>     [    0.002627] CPU0: Spectre v2: using BPIALL workaround
>     [    0.002650] pid_max: default: 32768 minimum: 301
>     [    0.002989] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
>     [    0.003038] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
>     [    0.003430] VFS: Finished mounting rootfs on nullfs
>     [    0.004538] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
>     [    0.006552] Setting up static identity map for 0x10100000 - 0x10100060
>     [    0.006835] rcu: Hierarchical SRCU implementation.
>     [    0.006864] rcu:     Max phase no-delay instances is 1000.
>     [    0.007320] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
>     [    0.008854] smp: Bringing up secondary CPUs ...
>     [    0.010035] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
>     [    0.010218] CPU1: Spectre v2: using BPIALL workaround
>     [    0.011412] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
>     [    0.011581] CPU2: Spectre v2: using BPIALL workaround
>     [    0.012747] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
>     [    0.012917] CPU3: Spectre v2: using BPIALL workaround
>     [    0.013109] smp: Brought up 1 node, 4 CPUs
>     ...
>
