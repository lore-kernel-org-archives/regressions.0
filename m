Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52B18AE2
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481767; cv=fail; b=dPJNEkdMCb2UaLTkPj3sXaUjdlR0nx+gtE6RlxkCqN2VIFM5lhi5jNjX7z6LfrEYcQD2JGYK5uqPJH8tD+3i6UpNqpAWz9WtlOuBJMhGsB2SUpouOZb+Drz5wjn33Iij4Vg+NyhUCAMK9Dx5b2+Xlj5pyLE1CKy1u3UiJQYax+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481767; c=relaxed/simple;
	bh=wsMIHbwDrRsHqZUYutQHjshPoDDddPpJJq9VGFSY94c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gIi2cI8MBT4ulg0FW8XRKOWcuSRosyZCLXnvmd3fmfIdiD6MSkd8kObTQxnSLr1U7l05Y1vXnncI+N09/pxhc7SqUnijXgPnWP7xV36zRLuQwxEI3F7raUbentl911uYCn8xFryVLevQhUYKVE/+OA4ni5cY0qgp/3i0Es67F+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CoQnK1yl; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CoQnK1yl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4uDfBR8IItphUof5LViCTt0sTbPuitPEQNC2OlluFI1oF3sROZsAt9IBGEjsp4SYK0F+UrEHqFSLQseg1XnxkOSQxNITUkVdSwaZyu1npFqNovoOwcGoLAOg8lGS0/lEhf3Q0sO7xIQUMRCdzolx6WFpVPu7qqU+vNnK5EE+73IjM1O1EKYEbLn/v0HuMunWO4fEVUBlvJQVxXJLbC1V5Xnm9Om3yyYO/aa9A9FaV10AXO+QqQKUeZqBs/3dfnC6oxJ9ZL8ax2e9XDwqMzmXyyoYOqD3/uJka74ZYbefMNq87t2gXgCEuJXGBrwI343Aerb+xZLkImoB5Ng0d0ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+3Qup2HicWnDtUPbxBC1DlaOx3WUwL+gd5I61KgsuY=;
 b=xBV+S8ea15U9ASHyBfXsBZxab2FS93B48L8vvvNEr9mkTW2WzzWIpF7l9ybmBXILLqMg5BShzOwo8ALSfgQskGDMIzSI3+0tD0seupmG1WJh1rDw+tLv/wD2U9BIKVo5KjeXAhDT76dHfDOeYzDxAwjJyOTRpn3W0St2QYQEySj2sOYmkyqA3X1qUyxng5ecTGgzyld5VjupjY437CJqJGoBny3xdURk43cNGn3ywpnjh5wG4i8+lfZrzPdp9wLju0tWbwVNfe2Ks7iIYc5PFL4IjhG3WmnzU+LjmpmatJHCssRqGnC/qilyG9pM7jhCvxRXnHURRiKbPRwWuvRTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+3Qup2HicWnDtUPbxBC1DlaOx3WUwL+gd5I61KgsuY=;
 b=CoQnK1yli/bZQ95xuv7mseHwl2NuehsyskeYx+CZWTTY+rnDPmYzyeOZqUpjylfVZjsI7O2b5n0ZMYEr39kGn9ttRbswqofX2tvlR6X0HXZA0ZA+KOcs8/w9iwoa/IWN8VLhOCyUR9q7YSPSNXhx6XgWIGruK4cv+ud+TUoQn40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Mon, 6 Apr 2026 13:22:43 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 13:22:43 +0000
Date: Mon, 6 Apr 2026 09:22:34 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Nick Bowler <nbowler@draconx.ca>
Cc: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, x86@kernel.org,
	linux-edac@vger.kernel.org
Subject: Re: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <20260406132234.GA327112@yaz-khff2.amd.com>
References: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
 <20260321204321.GFab8C6aq2jIhIen_p@fat_crate.local>
 <fdhaj5pddf6cp7obvgrpzzxmxn46za4acyvhkvjtjy3ukofmok@hocikxl5b42x>
 <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>
 <2fgbldvzh3fahs5vipak33alxbn552otazldu6ftamr6reii4t@6syhuc665vys>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fgbldvzh3fahs5vipak33alxbn552otazldu6ftamr6reii4t@6syhuc665vys>
X-ClientProxiedBy: CH0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:610:e4::21) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0e8111-d421-47e3-a9aa-08de93df958d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PrzmZdw97iHfXYJbTcx7l2fqsm4wlZqvc19k2SUjsCgteq9z5sOXkui0vV7XChHqv62N2G5mJ452F+APlnXLxmvbuUsA4bW5keMe8kfB1vdRYePDX+P5/UGJLw/9zM/0X4oRn4VcJqOggCIq1IW7juO7ZOPWg9hUZ0kx4cjCCHgBlycBrhQwX5n4E20iZx7b3VDsm9ARMxgq5qopcv4ZA3j3Kacu4w1eEA+CbEB5GzSaYDlSBKkdFS58HJHXeggIsOpJtMh2xKc+0NA1pxeV6YiwNmO8Cyi30Ujy90Oo9vezpx7Ag/ztXU7gQQQe5OySGNIgTDXn0Xk/unFcMmbG5jsr/Vdh8d2Czo23JbsiEYcVJXWcrwv3CwMa9yZWxH5ZYisRgwg2e89+H5XsrxCLCOXzr/6JRhYLgQANi7JjeXhNbjfMv+6RtkEIvmrzMabuWYy6Rwer5gW/v+07oZgxgB/eCmX4+fvDA5LrSqL927POTEQ69QsRmdpUhDl5Msedg0i1qxVuiaUv+FUEZXg8QSvy+fYf92ptAdjvNYLICvaY2TmhUF52ROnpyIkMLgYak7u828jsj8XyD3WsTtK/XixSi2RLG6aj+ldNwdWUhpuCPJ+0DZX4pxAJT2diJXHJ/5odK0xPYJAzdhbdRYoMeq0RW1NG/CCPgoKy8wXqR3paD7YzoYNLxTOdDM4cJVvie0izrFzf7GhifW0OafeghHjaNcDmZiwT7qjlGFhDfVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OsZLb78KDLUEpXzZPJIt4pE+mZGaUgesw7VpPQ/LXs4svEFa5hszJ5I6v4L0?=
 =?us-ascii?Q?1PKLO3ZdaVjcyLUF+gv/lt562SkD2pdNTGS+UHwm7dKz4RvY4ITHmlCkGh0j?=
 =?us-ascii?Q?j9D988VXUHT9nKKTtFvKutA89EmX+oRHJ2BmxUnyk7O/s5A0p12pHnSy4yNQ?=
 =?us-ascii?Q?MVxtU+QS/18TKsv+RdHvhXdqebbiW9f1eVNRsqUcHmisMdZvPBd/gqt/e95z?=
 =?us-ascii?Q?k7/CJJEjUZu5G0lSs/483W5VlbHOJJT0HMCurULT1jHp80sXrR1meQC0VDS6?=
 =?us-ascii?Q?DQOKEjhS4dQlO3XyoVKXh8HfPV5U8FxyP5wgu7nchCMryLAwOHmJuH1+aO1C?=
 =?us-ascii?Q?TOfAy3LX2PFH2b7RxOACOmo7iJTaj1ki1uVJVyui/YhweaB4JuLd9wqzpHQ2?=
 =?us-ascii?Q?ahMwR0CRi2qjHu+RKymvDzDwSlgnPLMMlIHAdnP/1onfHRNJNVej8Yu9VKQ0?=
 =?us-ascii?Q?lSYvsO7+850BBdNt2Rqcjyat9oPS1ev4/DOhbFUycfZBWc+ptL70p+QL83b1?=
 =?us-ascii?Q?3CR6NZ2oPXO8F33iVWWE5eI2f/KI4bI970SQF4lv4QR0XExP6ifh9byU9vd4?=
 =?us-ascii?Q?dibLIsdR7BCKd+lsyN0QBSf8l0Wv8sFHy2SGIpSoW5IvUPWq5/z9Obo+hcMz?=
 =?us-ascii?Q?k1XEK5623LqrvXCjgECyfgvJRfg3eVsVNr2tM3uT1xtYPUg6bKCQdw6vnL6H?=
 =?us-ascii?Q?vBUkfSFjy57Zz5fFhD3TLixbodXFKgACe6BRN6XJUJsdqCuu2O6n5teyxYcv?=
 =?us-ascii?Q?DHncTWrf7hmrcGxa8kZD5RYHuDQ5sipf4XLlR/Ry+Hz+Qn2UbbaREFS7vbKw?=
 =?us-ascii?Q?+CjBO53kBUcTd/tCpHm2KGpR6iebdbH3SmTOA7OISZf+WOy6+yuNE5cNr4Qg?=
 =?us-ascii?Q?uE/PMfKBgcvUIP+yAikfksJueA+MyRA7Pibp1WWgnPjv418F0jL1Ab/i3hZ+?=
 =?us-ascii?Q?oG0uOQ8T2DRZp4TCbdsP9po9qc7KFOCdwsDP071txGSeYsSQi5Q67+8WhGXR?=
 =?us-ascii?Q?dRLJFfS+h+yQ/O4Sr9taah6ysEtRLIvwl/E+eQIG/OSDzqaRgorFUF/tgAOr?=
 =?us-ascii?Q?sYMSvDRAioBOijBT0UuWLsnVDvK1JCQgIUm3/2uaK+uQY8KqUrKuBuRKtrmN?=
 =?us-ascii?Q?WMaWbQsfWHPkJuJKHKpXH5lfeb1sQ2RoNxzfKE6dja0D7d+YP9YDqQJrisPc?=
 =?us-ascii?Q?Q40r27J6SygEOazoU9LT1CVgouMEnNbPjZ/8oPbHJHjLOskOGGU6Z4YXIVVx?=
 =?us-ascii?Q?g+lx8E5lIanDw7/CPY0gP2N73RhcTlklTUziXpBRRc3o72YwXlHEmXO+Qzqh?=
 =?us-ascii?Q?sWtH75yeIoopqQ4LQO1qTOiThF9K2ZP6HbAu/0YZPgdRjySUbeeW5fHgZRTS?=
 =?us-ascii?Q?M6Ois9ofacUi6onwViNh4Slqv/OAplJFmmrD4+0SsGUMtL7qTm3UaRR4A6aW?=
 =?us-ascii?Q?L8P1jn04EmwssMN+cCPWsP41DGVQaJmB0zMxPs9UZyxV332TiyowcXpJkdwH?=
 =?us-ascii?Q?Cm56YTqS/IOsq+6w7Kx9034X8mCk7VCR8B7jU6mOtBPjHWuliumEq4y5+Zj7?=
 =?us-ascii?Q?od3GVHzhfXJeNy+pVYHieSJMFfFbGxtXzSpxhvunrAxRrp1iIn4hDSrFnRzq?=
 =?us-ascii?Q?pvlV3ZHAfTlBGiGcG+O6fiXNxOLap/0ktWge1mhux0hlRVEa5vhkUCvhOljY?=
 =?us-ascii?Q?zOIlW44UwBavAbWmRxRkfSfshl+qZ4J1MuKGZMAJYwaFYm1z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0e8111-d421-47e3-a9aa-08de93df958d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 13:22:43.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8//bHTyrQQwO74/SDLRB/u2mq9/q40soPmSpYaUTi9oo+tTX8FSl9eTRuoEn6FM53Bpi5/hGlPyhP5zj84V7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270

On Sun, Mar 22, 2026 at 11:10:45AM -0400, Nick Bowler wrote:
> On Sat, Mar 21, 2026 at 10:52:24PM +0100, Borislav Petkov wrote:
> > Anyway, since you're partially reverting, can you pls try reverting the
> > Intel-relevant hunks and narrow it down, if possible.
> >
> > From the looks of it, I'm thinking:
> > 
> > * comment out the intel_apply_cpu_quirks() call
> > 
> > * comment out this hunk
> > 
> >         /*
> >          * There are also broken BIOSes on some Pentium M and
> >          * earlier systems:
> >          */
> >         if (c->x86_vfm < INTEL_CORE_YONAH && mca_cfg.bootlog < 0)
> >                 mca_cfg.bootlog = 0;
> 
> Making these changes does not appear to have any effect.
> 
> I whittled down the revert to the following patch, and this is
> sufficient to get the machine booting again:
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 8dd424ac5de8..83eb037d4d46 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -2284,6 +2284,12 @@ void mcheck_cpu_init(struct cpuinfo_x86 *c)
>  
>  	__mcheck_cpu_cap_init();
>  
> +	{
> +	struct mce_bank *mce_banks = this_cpu_ptr(mce_banks_array);
> +	if (c->x86_vfm < INTEL_NEHALEM_EP && this_cpu_read(mce_num_banks))
> +		mce_banks[0].init = false;
> +	}
> +

Hi Nick,

Can you please test after enabling CONFIG_X86_MCE_INTEL?

Without this, the Intel-specific code, including this quirk, will not be
built.

Thanks,
Yazen
