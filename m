Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A51B43231C
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187062; cv=fail; b=c3x6kA8gCMsQ4X58V0siDwfU8oPXBRN6NS8ustbs0auXwCMSyZohqW+c0UGhR2nBes9GjvYN0wjFrqBLZOLhC5Vk53wGnPRSlLLp2zvLBxYX4o+10sta8S79oRRKQwNOAcy/z/9sTLXXrUo0Vm1NrdQV+9Ch7oQL/gY722QjXUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187062; c=relaxed/simple;
	bh=q6SRfZSEK2pHdgQpNp7+3r/+a4s0VGddng9R4f/7mdY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R7DWCjygBazHCwT4LdjLqyZON4rlY7gD8KwG5mky6e8LZREdKd293NGwqFcxSpBbtAJErXczCdhZ2Lpwc5i2Vpj3UQ8BKERKruGCvi8kJiMXkNPNhWSKv8bMMv/nz2OnqW2vtyWorhrlhwQNgVboOiAHexLC3mXdNg/P641cjrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKEN3NNt; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKEN3NNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187061; x=1821723061;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q6SRfZSEK2pHdgQpNp7+3r/+a4s0VGddng9R4f/7mdY=;
  b=kKEN3NNtRiBCfuvUnXgMLDLrbLoa9Ep5Nv3/PDFQTL/8mWZAb1rFZ8QV
   a6mog+1zuVb0Zb1ZjkB8/xWrNaxqFkUgCt7+j+1zbxakxtDW92Dnd+u0w
   FCdDlgL9CNd5H1u/9iepmIhE7Lzio7n2QPjYweroIzkGXzM4c3Ew3mont
   gESuea57HZBbZLoBTlyUQ2xjb5M0hz3soy3JpKLNwaHpyuP38PI3NAP0t
   vY48GetHME/cjxIS1zbsgyU5uo/wuO5D/5r4coXZ0y3N+WwPIgtRCrFup
   CRqIHyBNlgy41gVsfnlLnEEhHRfYt665KPvglHZN+FYGAqA7zUCWE8cGK
   A==;
X-CSE-ConnectionGUID: CREgBDYdTc2ttGkLh/d/2Q==
X-CSE-MsgGUID: N6ZSw9/aQd6REK2svbIKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90043384"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90043384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:00 -0700
X-CSE-ConnectionGUID: z70rgsFhQaWvfXD7x2mWpA==
X-CSE-MsgGUID: YYFG4vVnQem+f8MR9WSRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272303421"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:11:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 11:11:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uK2qV1Fti0pzoc0nKWhliWy8DH5B0+47OuvMsic3sfAACorYMq35lqoscOucnVJn3mgxH+dLsEUnoDYOe+1S1qemX1HBbm9coKFja5R/q0MK8a3L8Vi8ExoiW221g9HRnEJQEE6nWOkc7t7Ia8UaxhzA96wjNj5ncIFZ02bhJlwevqstHQ9Ieletw6+Pr6riExI7DcKEYhphhlEsOA4/BJlFNLWJxLSGjcK6Qsv3nZxPLF3ZcDNWmh4rm0wKQ89q6Jxrzm41RIavfXoh5F/Qq7dO5w/2wWO5G+vrG/xrcxyMBzSenoTf35v3aYIobtrbHVj2xHgQKcybmaA79uEj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyAHCPN+nnNmfJrfFn7j69CJYhQ/fzjoRDCVehJ009M=;
 b=DWONPdAg8AM637opWGycEJ405EqwFjV9douvxr2VJ38JcJoUEZY1xLFwgwZuOhweaxVzWRl2tP6QZNCEY3Qk4v5SyMjwEGWspsHAX6zYIDoGsp2qdormQSKgnlZ0YbrqT8sJ21VttzVT+tCz8DOXCow9w4uphO7WepxFjsW7/4mip6i13tn1h4IrOeMb1FTLV2NWOVfufA0r73bXOPSR5Q/ITdqLs5ZjT5grYOLknD78yYSU3cgeJPBE4fESSCbhjc+I/8yCORC7Up7cZaJ/LM24vJNIf7pbI+jmcE2XhVEZsL6GflPxC+NH91UrczKSpxr+SUilsIkTOQM1KcKy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:10:58 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:10:57 +0000
Message-ID: <c1046170-b820-4767-804a-55d95421f6e2@intel.com>
Date: Wed, 23 Sep 2026 11:10:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: Thorsten Leemhuis <regressions@leemhuis.info>, Junjie Cao
	<junjie.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Manuel
 Knitza" <manuel.knitza@googlemail.com>, Antti Laakso
	<antti.laakso@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	<regressions@lists.linux.dev>
References: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd98107-0403-4e86-a418-08df199e0420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5K3qtW5eiC6Bw39u8bxDxIpmzlT6sAKoI5vsKwSx8H0aOD3aOzb9tDMhK8hC0tYxh3SYZXYV8817mFAeUkEAbo2n0ZAgf34tWxgc/CpX6QlIuArIoCnr4NQK9lDi8gXL5+bfBu74jMYBCAAxguWqrPiE/XezKobaAh+UAA8L5t5Y2AidYChhZ2rMxvvUtKCSCVYwzW3JUodoJSGm1BudkzHVV6XltdSftxwuPs9OekN1gSe9pUHW78XIDm5y5nhHevxf1YYSOTEDOidHx/1t2wItuGfo7z5s6PFZz7+Ak4+4J+8TtAg6SDmPf2Kear0IWOPAaZpPJodxlolx8RPQqGM4hWeZXtYhaihqXVnVrgv6rETXjXyw8ZsGrXgY3Nh/k44XsXUYZREc9boKPVod1bhNhdxdR27tF+gm8FpZ50AWudsUCA+70wgNDMaQn6sXJhthrdR93bjtwV/ahBa/D+WMLJURbKViwYewMcS3yqHDmOHVmurrPYTBd9NtM7UyTN+K/IOnoEBGXWRyOphGoqUx9/GgiPBdIYyhCFQFdoa9LjP8+v3KdHMn4InubTaa7TCOuHs/jLYzgm2FbaS1dJ27a5J99dy+kk0K5r/DN+sq+wcjyATewhFGlrY8l6uHjpxnnZJN2K9ad4pe7Abjs6fWj0ZVjF+jRyAUwsLP2zs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tCYUVLQnBwL0J0VDhPa1Bob0dheVZmUkxpM2tvYld6RGNmMzViaGp6VVNY?=
 =?utf-8?B?MTg3OTIyUjNjcDFxWmxqQzY3WWZkWGNoNTlrbXNWK0xucjJ0SlU4NG4yN0dV?=
 =?utf-8?B?dFFvWnVKTEpCRE1UMld1U2ZFUnlMdEt0L0x1c0ZkaC9RQXduMm9YM2dsRnZH?=
 =?utf-8?B?azlWTHV6VTI3cHBsTGI4ZHhwbTRmRVpwWkdMeWllb0hHdENnSmp4a0xCbHNz?=
 =?utf-8?B?c3UyWGdGRFIvMDZhNFc4UzBMWnEreTEwdFFiSEpMRFVHL3J5K1l5S3pLZlAr?=
 =?utf-8?B?WjBYdEVmUFczUU1PZ1hDM3IxU1IyOStTWG5CZFpCRFpzMzBKcy9UNGVvVU1F?=
 =?utf-8?B?emMwYlZKZHZwVDFOWFZZV2JlZTdDbWFQUUsyVEt3M2VhdzlSZ1ZNdkxidHBI?=
 =?utf-8?B?NUU4SU93bVg5TVNGdW0xcVZMb0swS1B4ZFhwd2NUdC9tUkxmVzFqZlBtS2Z3?=
 =?utf-8?B?RHNtdHg5TGVIUTlXTXVmbi9oVHZFclFYUWE3NGYxbHBtbUY3OExnNHJmaWJw?=
 =?utf-8?B?c1dsSnBEZzE3VlJ2ZkVMeEVadHQ3U21URXdyNXR5bzFlbHVGSERpWmVMeG8w?=
 =?utf-8?B?b3pLcUE4K1lwVENkMWx5UExZQi9YVEgvK0RaMWdEMFFBbzRWRUNCL2x6clRL?=
 =?utf-8?B?NnBXVWRFVCtYREFXaFZlYjN0Q3pXWG9KalBzZFVBb01yS21hSDlIZXI0L3lF?=
 =?utf-8?B?UFhWT1VqOUFUdWhtdmxWZlVReHZzWEJINzBlTTlKOWxlMCtDbHVTTWt2YytE?=
 =?utf-8?B?VGIwWURKaGZvK1dkUlJ2QzI3Ym5WM2VhckE3NmthMFBsVDc1WGUycHJDNmR3?=
 =?utf-8?B?Z3VJS2RDNlVSOUJ2NnlyZ2JNa0N5YVRrdW5TMzlxbEIwSy8ySGtPMlNHSnh2?=
 =?utf-8?B?cldSZU02Y1JRUklwdTFIZWcxWWd3cmtRNENqSGVoUXpWdXpuQmN6MTdOZjJK?=
 =?utf-8?B?VzdWbFl2MUxSRkdiSGpNUDFwOXlOOHp1cGhZRWFxczVLVHdNQ2tpc0dZZVlN?=
 =?utf-8?B?Y3gwRDdyTGtnMDNXNjV5cnJPcXZ4M1FGWFpPT09HU25HTGpSaTZ6cExiaVNZ?=
 =?utf-8?B?dTUrdHdaemlSUm9KRG04R0hiOTVHTG9LY2JFN2pZUzhieWF4VVRGTDY4eHc1?=
 =?utf-8?B?KzhsNGpLQmxjWmFzd3Ird0tzNUFZRktVYWdzZ1ZIY0ZKeWwxR3RLd1B1aExL?=
 =?utf-8?B?U29LcG9BeWlpN2g5WFZLVE5MSm5hb2RlQkJsUFJ0VFZMcUREcjJrRDdaWjZi?=
 =?utf-8?B?c0N4RUlEZ21DRGhvRWgvTFRCMFFOdE1Bd2E1bDZsYkNzVWY0bDcxMTA4VDA2?=
 =?utf-8?B?TUJLMUZWUm00RzYzTE5wRTdWeVRITkdEbnhseTVyYzV1aWZoYzBmSkI5R1Fp?=
 =?utf-8?B?QWFxSlFLUHFFTzI4RW42a2Vwbk5QQWxJNUpQS3orVWYyeFpEdjdOTnhHOC8w?=
 =?utf-8?B?dnFXVG5ib05DS2JlZG5yeUNkSHdnQ3NDVDgwaThxYkpkcUpqNGN6N2drZUVz?=
 =?utf-8?B?Q2VXSzY3eWNMT2ZGK3pUQVVlS0M5L2VlaE9HaWxJYlN5bERaQ0RBUHRCdllD?=
 =?utf-8?B?SWxwZVJlcEE2bnEwRzR1ancrSjhadU1IUDZndnpwcUlKc1greHYveCtVRDg5?=
 =?utf-8?B?Vk4raHJTT3RycEp4elZmQzRaYm54WE9kaDlxaGtXR3ZQdUNjdUJpaDBBb3dJ?=
 =?utf-8?B?czJnVUpSQ2p5dXlIOTU0Y1hBN2YrMGo5cWp3TGxGdUhKY04yTnQ4WVZTVWg1?=
 =?utf-8?B?OUlTQjN4dWRWRU9XZFpYWC94Z0J3REZyckxZQVJoUzlieUN1WmZyMWpEcFVu?=
 =?utf-8?B?UU80ZEJKazZsQ0N1YzhaNFc0L3lYT3p1RG40bHg3MFFRZFI0elN5bU9pTlFY?=
 =?utf-8?B?SDluREFrMi80VnBhbGUxN1orQXVTS2VoS1VyOWxDazVNekNLRHhKRm5lT3Bt?=
 =?utf-8?B?MnExL0k3UkE1bUpIWHpHdFZ0YWxaODBac2ZNdHQ5a3ExTEJ0N2szcVY2TWh4?=
 =?utf-8?B?TzRhYjAvekRoSU9VVDJUdHBoQUg2cGJZNGptcTRla2RucmlSRmdnbWJWWUhZ?=
 =?utf-8?B?eUZPNllJVFc4cnh1S3RCUCtXaVhJN0pBSWhHaUg3UDZRa3NFSGtyQUoxbDZq?=
 =?utf-8?B?MW5kWGo1aE92M1pmeS9JM2J4TllzTi9sVkVjdGdYa1E5ejJDSGpYR2dqMU53?=
 =?utf-8?B?aCtCb21WbWNBcWRLVjU4ZVRQR2ova0w5ZS80RGlmYzdoV3F4UlJCQyt4ZnFq?=
 =?utf-8?B?YzdaZlZXdmk1cDZFSEdZbzJGWW1uTTVFZXJjK1J0eEJVbUNIZ1lHK2dYZWU2?=
 =?utf-8?B?d2syaW5YYmxaOTgvUTNsS3ozU3BqeWxqbkR4d1RIN2duNDgxM2Viakw3UzMw?=
 =?utf-8?Q?BUP1kEthjwJjgyjk=3D?=
X-Exchange-RoutingPolicyChecked: NhNpCFhy1X3G4TCQ1HQNjvmlbimTquu3rmtBd5HyqF1h24g9JoDjS8gjfvN/2n+SNLeajIVAues2H9T7k+WLD6TB8Yx8CgeoM//+iofKJ3ZXNI4GtFVdweREb1kBC4zEv19gHOygbB+JU81+FZQ6vtnYjPSCe+NH49fjkDGrvSMQ1KtMqn7ixbFgHZQ1wFEPOJalH8q723zp//cCcJPafykYuvzGjUnJ/wudDhM9VN6vdNSCzTyoGVZi0AC7+nmUZ4w1Gouu/LlwfHRsS+SlIDQBoekOuXldv95ZnWnKiWT3YEHYNt9ck6mWELEeQBL+6IPaLTps4zLcLc0WUtvBqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd98107-0403-4e86-a418-08df199e0420
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:10:57.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOeH/AX+LmVHzgnPUKB+S9KtlIUMqng9LS2c7KPe0UpNaB3tTvX5XU9QikBpuHStKwR6sTLZTIZHc0pIIGjKcoFep1D+4bWQ9nWjCgx/16U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com

Hi Sakari,

On 9/21/26 11:40 PM, Sakari Ailus wrote:
> The cvs driver is only usable with the Intel ipu6 driver and is commonly
> required for the ipu6 driver to function. Make the default of the cvs
> driver the same as what was selected for the ipu6 driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/i2c/cvs/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/cvs/Kconfig b/drivers/media/i2c/cvs/Kconfig
> index 4309d20dd726..f482f1ccc38a 100644
> --- a/drivers/media/i2c/cvs/Kconfig
> +++ b/drivers/media/i2c/cvs/Kconfig
> @@ -4,6 +4,7 @@ config VIDEO_INTEL_CVS
>   	tristate "Intel CVS CSI-2 bridge support"
>   	depends on I2C && ACPI && VIDEO_DEV
>   	depends on IPU_BRIDGE || !IPU_BRIDGE
> +	default VIDEO_INTEL_IPU6

Would this be affected once the IPU6 and 7 are somehow merged?

--
regards,
Miguel>   	select MEDIA_CONTROLLER
>   	select VIDEO_V4L2_SUBDEV_API
>   	select V4L2_FWNODE
> 
> base-commit: 508a3559448684c4c0110a0c1614deaface399c4

