Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526167;
	b=kqP+zKiSPxaYPGeeuop27FMHZGAuQ8Ln6rHbN6Vq0n2uOoYMbFtREE9EMhWC8UDFrPo1
	 0Ao94+6WHfjdvoiULpSEqAZt+nMb0ZPLYpVXvWIzXwynX41YlRZh6OvyiSPz6lk3KMP0S
	 AZL/nqaznNTKSYekHnn0LVcKV5DE0nFAWlSJvRSvOR5r5eL/a7Bme4aAZBbqEQb05mufk
	 pFtSETO3DcLb8ugATzwoTzWIaymVEe67zapeU25c2DlKJPPBHrFSKX9WPjNKdePM9M/nO
	 25HtV9ztV1cfETeKZ0QnL2dxUtJpVmDtv13H26ZAg8qnFWpX7lnruxWBoON5WTrIVQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526167;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vt55SJKI/40vq/cY7XutIQhe47Cfg/+n7FlNGGghpJc=;
	b=g5P3LgppGgZ5f7XEtDNHMfesDEEWyLedaWVSQ/6jewIvN4lI3Lv3MHNn2t3QOa2BBprr
	 l8SWbUbzMWQqI2yjDY2CbRdaVDMnD6wL+SJmYdyGfXbClCuDPEpB+ZJ3XfAcR51ekzWMA
	 RZ8Ygzq6mzhHLtLlgv3flTJs9nTRPvpo+gcqi2948LiO+RP6Jh/kMQU8BCPt4VvHI9hGy
	 ccepc4VRVp8Ga9S9Ncjo3uDi6Q3dJIGZUcVCBFQjAKzH6A8+3xaIyZqffwM+OWHm9vQCo
	 5PV5ONufeBzbuPkHOHwbFKplAJ3+cHake9ADl4XgjsHLV9rplPBsJVssFA347w6Kskg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q5BlMuHd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.61
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C25B606A331
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 13:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C25B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q5BlMuHd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/kaP24N6MwaCCwYj+Tnl+w5PjNs/kY0LdxMWeoXS1wKwinNZjtcJkOnvYMM6WJPMyAaBDeQBjv+tkE5YMWdADSWmr2AJ7aKTT20dI0SGNpeq1T73wB8KSntPfNmRMjCa84h+Bnc7ZNKn8pthn/Rpv8HJGeup6/eqoQdA8DiBa0OcSFV7D7mBkQHD9sxvBzPI99eqvKY2n7Xzp9JyELjySpzpxOU+vf872xMnir0LSssP5naD4vkm92R3r7ckzRoLAefpJlxInlw0ehm269n84fMSAFk7STu5TeRE0Ip6pcJCEo5au27K1A1d6zw8Zete/CyGDNznn6qnjW8wHAnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt55SJKI/40vq/cY7XutIQhe47Cfg/+n7FlNGGghpJc=;
 b=ULOIDwej9Z3831BuFNXGuPuozU6lbo4ebEZtGtU87xPPxmOAh5exyLZrRLaxtwxYpg1945g1tN3ruz58KYLKyQbH9VsJotyMeQspDmcGf2DhaiAErFvOeG7MxklQusk0WHSNdvAd79BIZvx4sXywk01NtK2pAceQg+SQyt6UAav7lzltZT4Y92KhIpn2C5xuxbuCC/UqRC1aZX3mC3Elrw1oIs+l+g+crpmk0dE0XUTcuLReOAH7JEeV9YceUGT3elmSU8D3GI36tgNe2H1L32QvDQYyPYT33hVeXju3csP3F6GmUy8+k3Pn2xN3zvLdO8OShjwz17QD3i8ph+fyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt55SJKI/40vq/cY7XutIQhe47Cfg/+n7FlNGGghpJc=;
 b=Q5BlMuHdirBnBdHb3fUsCHQg7On+L3GBNnL0tzE50pyRtWyztkRI2GGB/BD//8DoRU7RdDEs71go5yXH1x4OxJOtDCXCbrZ+iHNJZ+nB6mPQIHf9RhkHXQTjMm62wKXIXyq0uQVY2/yUGx0zSHx5cBwuNXnazYMbrgIPksTynzyaygkqpf2K84PIEBvMPpXv2xEdrAgKFcosuA0JpqDvhy4eKTYxsdijXBwZaQozNLLLzHGskiNA5WjDt5nvi2HuvFxX3sPMFNpm9e25HgHJ3ytFG48NXi9gbYLQuYbf9F3FLydZrEk0xvYjTlzG8TRWDwEiVJ8UiAu7JaXE9oArTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 by SA6PPF9E25DF663.namprd12.prod.outlook.com (2603:10b6:80f:fc04::fc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 13:16:02 +0000
Received: from BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9]) by BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 13:16:02 +0000
Date: Tue, 24 Nov 2026 14:15:53 +0100
From: Andrea Righi <arighi@nvidia.com>
To: James Buck <jbuck2005.linux@outlook.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Usama Arif <usama.arif@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in
 select_idle_capacity() leaves busy tasks on little CPUs while big CPUs are
 idle
Message-ID: <awWOCejxtjP12xFX@gpd4>
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
X-ClientProxiedBy: MI3PEPF00007541.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4d3) To BL1PR12MB5174.namprd12.prod.outlook.com
 (2603:10b6:208:31c::19)
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_|SA6PPF9E25DF663:EE_
X-MS-Office365-Filtering-Correlation-Id: 117b92a8-383c-48f9-186d-08df4a2d161e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|5023799004|11063799006|56012099006|261021123027099003|261022105027099003|261022115727099003|261022075727099003|261022113327099003|261021121427099003|261021130227099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	p1yLqAaQsL2wWQ16VZC13QR6+XBXqciQoZYqTW/f/r0ODfZt7McRct+LkYaQV7i+hTFyNHURc173ALm57upIV4hkI5/NHovDUhk1C3w69zJbrCigs27idvezCH0WXh1He9eXl7Bjda5pbYzu3Uz669Asxa4VyZPOZEk4m27DWVDOFQP/N4EOYCAriiEmOWjec6vzfzmci15gQxUoNwrfPxj98wcKY0aO5cm0Tvcq62SZPRv2SaAmxljDjVpyYo9+z1X93dpI5E+fn0gRmS7qz8uvZTrCkP/fDSofQkdJmseXLLdK1Pweeum5lUWGdm+WyJ9TWkoBSvxT1k8NpMgydDC9/SJvu9VsrDGJYgw5/kzjDjC6dtH5y8osupLF9yF9DfYhSjt1typJWpxu14Gg0NxBPNiOIhMRZ277qTdqKZyDD3YBYrTvChPmAYXGqiS2TwbEMaAGAqljyN1RjRldTc6Bjsh60OycVKxIDR8uQ+4Zau0Pw705Jq/s6WBEaD7ve85qV8DNvOBopWUNrA5DtCq7V5z4PI9sSuwJ/5jFe9x4M15LAvndb/LmFabjkThvdVvermu+yb5tS9E8YTMixvgZbcYuqISzjRkUtMJmU6mlK/YlejpB/BaUEEXVxjS7Oy9UBuqiO+PSZB2X7y8Bhi7oUNfQtdq1/uFqSWeMcT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261022115727099003)(261022075727099003)(261022113327099003)(261021121427099003)(261021130227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ay+4/5kAv19ICVrlnPgzyX7RA3BHcjc9HURHFgNPKgjwtsxf38Svsu6Sfu3z?=
 =?us-ascii?Q?fk7DBOKQYylW04KUIUr1jmhwTi9mUwQwGtcdG3/tl95JTLgrEXD+H5O6HApe?=
 =?us-ascii?Q?+AK869oBSeXAjzyQclS8Q56acKqKLcQfeDtqBlxl4eld/7zbuOU0rI6+k/vi?=
 =?us-ascii?Q?zSb2BeGlbO0WRPhxcXav4YplwU0P9gSLWdGR8SM7wrCE7KKb2eUwPweOtgRw?=
 =?us-ascii?Q?Yizy4nFpQh8Ws/WikU45d18i+LXqPWC6FrrG7cd9B4+76EKC3CKAZ0jAfhCg?=
 =?us-ascii?Q?dGKL7yKVRdaZUhYnvZflH724+BK5XVwEWhtXQQ0VFVsOdXup1CeKZpAdU3gv?=
 =?us-ascii?Q?XGJYt9z76pRtAi1cfx/DzmCxYhch0EMYAwtyARONubqbnJbRagJZ4EiJ1k65?=
 =?us-ascii?Q?e9LqToy/J7jOmrW5WogBFj40azwQI7HsDW718T3veRYMXKoskWF+j8iWK0IE?=
 =?us-ascii?Q?+WYCVdCRSo1VaMGre0zsCBj2gAcEgeMsyDo77jLvY/M2KzwnMwrsWQjS6OEW?=
 =?us-ascii?Q?cqeaXuKH/L12KppNz9gz2TkSe4w9bWZGZ2oQy+zPTmxFJrY+T6IAcIdxraOH?=
 =?us-ascii?Q?GCmMFSrNHfInM2lIpoCj37Pglv5+0SqMd229kfGVc9TiTFUL+J8amanrP7SA?=
 =?us-ascii?Q?h1lB1vtpy0YY1IwOFvOHKTIZW4cXQxjySB6v3u6+Hk0hWlyTfCFM8V0oabS+?=
 =?us-ascii?Q?oMqZfT9HUbrr8w27CqfQuF2Zc5YFIYFLRTX82Ncv5AfxJhUVKCzmC9H/l7RU?=
 =?us-ascii?Q?zjX1OWdfk+cw2FzBT398Se6h70r4d3UWMec6LabTDvhEGDLWphIa1T5Sx+Ow?=
 =?us-ascii?Q?19ZbDyn4KMEBr1/xlVVMTKq7/Q5KoihSGtYj+nhieteuH+KkMWi+VdV8Ex/z?=
 =?us-ascii?Q?da4fE8TjunuOoCuE7DdhT2Zc4aU1jpMnhQUvYk6QchjTY+G9M0LKS1MZvZAr?=
 =?us-ascii?Q?VGofSuxzsWPZ4amhpVY+tvyYPhGIGUwVuZKKDE33tQrxTsE9uGuLlZQ4/Syj?=
 =?us-ascii?Q?MfOrzbVIBRuOrwJ4WUCZierzPg1FlwIoWRQ4gpOx9jzWgewMkDwVH2DUv6dw?=
 =?us-ascii?Q?XO00Zw3UsrvQrWAiefDA/cwQgOHq9YMpqe54ulFYROi5FtioUlbNUCRlqLU2?=
 =?us-ascii?Q?JKMc9cP1tCxyZ70RpMftB3ly/5xLg2f4tKMfjmEvwa1lRtlWPkQqRBwrGEgF?=
 =?us-ascii?Q?+Wk6vQ/kV1/EKaBxj3j/twXCS+EoEhoE/LgVkYtcTC9/Zel0fOEaywDpHvdB?=
 =?us-ascii?Q?EXck2MGO5QoDiGfngtfLoLvPvmWwoI338wEZJU6VdIESyeuUzHkwJcBMtuoo?=
 =?us-ascii?Q?CVrXsmEnhYc03fZzOEPzWINP6Oknx1SglL70FpjkSZUHQPH/CN7LaFoQ48pm?=
 =?us-ascii?Q?bC287bzeavlfCm4qmcXNE8J2LmL2luozJPsdYxU0uenaWUjrEQ0kRhrhdT81?=
 =?us-ascii?Q?Kf2FVbf8j1CuguXGZMbAWG8j9QAdicszUlgh1Jmp23tIl4tPW5GyycAkkuDl?=
 =?us-ascii?Q?dHHweEi3oXXIOoiGuJpJjuMNlnCpAcK+RkRtsrzxv0jE0MXu44GnpEYavXHT?=
 =?us-ascii?Q?+rHb6lnAadIwAXcRZTPEprDN69bUZOoGqon+SWkkZ0nyfivxIiaifV/UawZM?=
 =?us-ascii?Q?YwT6YEV4T7ViG7fo2hTxBlQk0ZH3+fJsIeSLANpiBQ7u6Vu5S9jj5Zolukdp?=
 =?us-ascii?Q?Zj2JF3cMA/PbZs+sNmhzufcKiGIJtHKGqtYv7NQTldqExTrI/sXmAJ27eCDR?=
 =?us-ascii?Q?nqsytPyj3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117b92a8-383c-48f9-186d-08df4a2d161e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:16:02.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjmTfg3V/00P0wUACVltybvIuZwA8cDsk4BKF7dPXnEYnw8koRdsUQAeAr5exPbyx3XRNPz2azKvhk8HS3GrIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PPF9E25DF663

Hi James,

On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> Hi,
> 
> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking threads are placed on idle little CPUs while idle big CPUs are never looked at.
> 
> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainline to behave the same.

A related regression from the same commit was reported by Usama here:
https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev/

On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
being idle. Your case shows that a nonzero budget can stop the scan
before reaching an idle big CPU.

We've discussed a minimum scan budget and accounting for idle CPU
availability, though a small minimum alone may not fix your case.

Given both reports, reverting the commit seems the safest thing to do
for now. That would restore the previous asym search behavior and we can
revisit a better consistent strategy to cover both sym and asym CPU
selection later.

Prateek, Vincent, what do you think?

Thanks,
-Andrea

> 
> #regzbot introduced: 61ea17a63719
> 
> System
> ------
> Orange Pi 6 (CIX CD8180 "Sky1"), 12 CPUs in five clusters, ACPI boot, no SMT:
>   
> CPUs     capacity
> 0-1       1024  
> 2-5         279   (little)
> 6-7         905
> 8-9         866
> 10-11     984
> 
> The firmware's PPTT gives one MC domain over all 12 CPUs. It has SD_ASYM_CPUCAPACITY(_FULL) and SD_SHARE_LLC, with a CLS domain per cluster below it. The kernel is v7.3.5 plus the out-of-tree Sky1 SoC
> driver patches the board needs to boot. None of them touch kernel/sched/; the only one in drivers/base/arch_topology.c adds a helper that updates capacity_freq_ref when boost is toggled.
> 
> Workload
> --------
> llama.cpp llama-bench, Qwen2.5 1.5B Instruct Q4_K_M, CPU only, 8 threads, pp512 / tg128, tokens/s:
>   
> 6.18.64                           123.5 / 36.5
> 7.3.5                               109.0 / 29.5
>   
> 7.3.5, taskset to the 8 big CPUs   121.4 / 34.7
> 7.3.5, NO_SIS_UTIL at runtime     122.1 / 35.9
> 7.3.5, patch below                       121.7 / 35.7
> 
> Sampling each worker thread's CPU every 5 s on stock 7.3.5 showed one to four of the 8 threads on cpu2-5 in every sample, with big CPUs idle. With NO_SIS_UTIL, or with the patch below, threads only make brief visits to the little CPUs. That costs nothing measurable, and 6.18 does the same. llama.cpp syncs all threads at a barrier after every operation, so one thread on a 279-capacity CPU holds up the other seven.
> 
> Other things I ruled out with runtime toggles or test builds: EAS off, llc_balancing off, the performance governor, NI_RATE/NI_RANDOM, the 6.18 misfit logic, and restoring the old sd_init() rule that cleared SD_PREFER_SIBLING on the child of an asymmetric domain. None of them changed the result. The slowdown only shows when prompt processing is part of the run, where the workers block and wake far more often than during generation, which points at the wakeup path.
> 
> What I think happens
> --------------------
> The workers' util is about 850-1018, so they fit no CPU, not even a 1024 one (the limit there is about 819). select_idle_capacity() therefore never returns early. It returns the highest-capacity idle CPU among those it scanned. 
> 
> With 8 of 12 CPUs busy, nr_idle_scan comes out at about 6:
>   
> x = 7200 / 12 = 600
> y = 1024 - 600^2 * 117^2 / (10000 * 1024) = ~543
> 
> nr = 12 * 543 / 1024 = ~6
> 
> So the scan stops after six CPUs counted from target. From cpu0 that is cpu0-5. With cpu0 and cpu1 busy, the best idle CPU it can see is a little one, and the idle cpu6-11 are never checked. From cpu10 the scan covers 10, 11, 0, 1, 2 and 3, with the same result. Once a thread is on a little CPU, its next scan starts there, so it tends to stay.
> Above about 85% load nr drops to 1 and the function returns -1 at once.
> 
> The CPU numbering here (littles between two groups of bigs) makes it easy to hit. But the effect looks general: for a task that fits no CPU, a scan cut short by nr returns the best of a partial set. On a system with the littles at 0-3 and the bigs at 4-7, a wakeup with target on a little CPU and nr <= 4 sees only little CPUs.
> 
> The patch below (drop the limit from select_idle_capacity() only; select_idle_cpu() keeps SIS_UTIL) is what I run now.
> 
> I'm not proposing it as the fix, since it gives up what the commit wanted on large asymmetric domains.
> 
> One option might be to keep scanning past nr while nothing has been found that fits. I'm happy to test anything on this board, and I can send the topology and sched domain dumps, /proc/schedstat, or traces if they help.
> 
> Thanks,
> James
> 
> 
> 
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9049,7 +9049,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>  	int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
>  	int cpu, best_cpu = -1;
>  	struct cpumask *cpus;
> -	int nr = INT_MAX;
>  
>  	cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
>  	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> @@ -9058,28 +9057,17 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>  	util_min = uclamp_eff_value(p, UCLAMP_MIN);
>  	util_max = uclamp_eff_value(p, UCLAMP_MAX);
>  
> -	if (sched_feat(SIS_UTIL) && sd->shared) {
> -		/*
> -		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> -		 * the scan when not preferring an idle core.
> -		 */
> -		nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> -		/* overloaded domain is unlikely to have idle cpu/core */
> -		if (nr == 1)
> -			return -1;
> -	}
> -
> +	/*
> +	 * Scan the whole domain, as 6.18 did. Do not cut the scan short with
> +	 * the SIS_UTIL nr_idle_scan hint: on a busy system the hint drops to a
> +	 * few CPUs, the scan then stops at whatever idle CPU it met first, and
> +	 * a task that fits no CPU (util above every capacity margin) lands on
> +	 * an idle little core while an idle big core is never looked at.
> +	 */
>  	for_each_cpu_wrap(cpu, cpus, target) {
>  		bool preferred_core = !has_idle_core || is_core_idle(cpu);
>  		unsigned long cpu_cap = capacity_of(cpu);
>  
> -		/*
> -		 * Stop when the nr_idle_scan is exhausted (mirrors
> -		 * select_idle_cpu() logic).
> -		 */
> -		if (!has_idle_core && --nr <= 0)
> -			return best_cpu;
> -
>  		if (!choose_idle_cpu(cpu, p))
>  			continue;
