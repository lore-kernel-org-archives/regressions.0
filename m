Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603107;
	b=fcshSqqRswVx+JIFry4C9Hoc3Be1wpLub6CLnIg1kDLzDsw37zOfWjU/49AJVz6eDLcx
	 ssbuvuzamChZKzrjfHOiIAEQW9kfn90kByDUrG22fHWZpTD0s+n5ktO2ucMHb62C5IgZy
	 2nMzDuxh8LdzOre6EDNh0GLFOLPvzRdxi1ea0GSLm1znVrRUz/3wuLG1rbNyXtN/5uGTY
	 Hd5kfdA8YA0nerX5oJNE0vDgWJhf0PuFc4q2HSJTdOzv8eZcVREdTHPX1g5hhJkDPG1KL
	 2LWUT2S+ATq0q6+Ct8swLiwDNap1vqPlN/LMv7MTwP7vAxieLki4uqBoy3XuohckqPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603107;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Rs/Z5dcp71d+ahIoEXG0peF7ibJ+gpTyydnEAsbpnBI=;
	b=SlZauKaFXhlKPKaErCIcfj9WBxUzDBAWmKAT6cC8591qEwC/vuEZiqVJSFHgOuz+m8bM
	 H1lxEFbVeJwgZvckzyDV7uNRX12q7ZayLjNdOz8YT52KkglXvO81huyoaCBC66dSOWq3C
	 ECa4rnRs7IK8aTqkAB9onc8yraI7HSOMm6nhEfCZgox5QmxT3aQeIiX6cn1Jbw6M+nfWF
	 6y/+/Els2VNROTpm7Y+JMiBpZTiByNESYoWj0FlsYda3hfq265zCUjNWQspX8VjGKx5Th
	 eeNsFjnz3uagEAkk7aIlobfkJ37s8wDsoHJBvKPBbKakt4Th2hcXrEmFZTlmRK/BnFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N6b1bSIG;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NfisUKwj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE4606A31E
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 10:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N6b1bSIG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NfisUKwj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795603106; x=1827139106;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S5oVGmsn4ku7D6Zt3ZebfMQsx+JhXX8pOgQkX6NFOq4=;
  b=N6b1bSIGS5c0zdx3/bF2IDUymKXcCcnbToyuNskMzEOxk5W3wbQ+5mKv
   AOfQu8JB2E0XYggOjIuZDqBHYakQC6YqBkRarsXc6CPkYmMe5gBHgCvyx
   YkKVjc3YT5+UnkfnCRMj0rbLBNuKXdrAqhYRJoetMKDXO+njBKQTHRWhJ
   lS+dU/oa5qiUGMYeKJ7zsYItupdE3aRkO5X+poklucHsKvFLNeaNSiWGR
   aE7gKRrfMrTTmZEehAzsK6bNEu/YmnsJdlT4+pU7b3jLR6DZJtJxr3INC
   wqO6EQrFn4rfQv3e3YbFW/LLChrSx1Fu8F8M+xbbeb3L4rL1lfxfgjrMd
   A==;
X-CSE-ConnectionGUID: bnrEZPzcRsSckJGkI+wEzQ==
X-CSE-MsgGUID: aPne5PD6TNCltiwhtoSl/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4396261"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4396261"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:38:25 -0800
X-CSE-ConnectionGUID: e2yOzAZDQFKxGdlo44VkKA==
X-CSE-MsgGUID: J/iz0dQ5TMS9IbG3sduyNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12263149"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:38:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:38:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 02:38:24 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pp+u/rnJAuV7cEtWlLnSwbVjbpvrD0Q3xuIjJatQXByJ45mO+l4ciUeJBIQlu86rcaHUAFI8vAfAR/jkCKFimujJeTeNRvksRDU5xu52cKGxcktwWK7FTojQSjWA0djAnAVg8so5rDUIBYAxaZe3par1+bIMCfOEXMZ39oz5UexNz/sL0m15qH2a+swDeXaAY4h1PLxVZmX+9bR7qhUz0g5xQvPj6QKNvYf7pc2Q555EQAfvk7AseijPMKVWxY1ZdcKfUinzmSdd3o7AQkzXU8HaNskvhXXjRscNuxtIV9ijdGZWQXSA9SxzX/rC7n1M8Up9rtmqzTg4tjeasFP4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs/Z5dcp71d+ahIoEXG0peF7ibJ+gpTyydnEAsbpnBI=;
 b=kK8rGJhijtfO3mAzzXcMhZjcP2GcOvhf3KqxlX3RzCLai7TAUsxesV9VUfHYwZ+1YjCVp9/JlEQukEIHD7O4BuYtFEP1mLU3yQE9yDa9AquAOSzDkSRr+c72T1xZ5StHBhq4zvKvhlbCGEBlPp/EAl0OlyxCzsrcvvG4gMaaPYpDIyt2d1ASaCbnc3iyLfbZzXvTn01nG1rZul9iaJB9hMdtbSBVUKqLL4PFpDG2vrBW4UNBbD56e5W9Qav0L7k/sNM1vjsoRqqENXvHoriKYxq4AXVnMjosKjg9gvNk5yjVS5PfcL6muCgI7OQRE/xvUBJmMvWJIKxJjVvkYsUBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs/Z5dcp71d+ahIoEXG0peF7ibJ+gpTyydnEAsbpnBI=;
 b=NfisUKwjWU1f2zQc1/rnM5I4Fs2xXbPrGxQLBW7Pr7XiVS0nAb0PZRFM5KtgMVexrQPsq+r2DsEw+bOzc2nELe+RN6FBeGwAEfP/tTaCl9cl4P0TQGyuxL7GZ+bG6FxVR2FMkJSUXukKXA9kgXkhVKfJb6rU8/O5HeHpvQRAUlY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Wed, 25 Nov 2026 10:38:18 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:38:11 +0000
Date: Wed, 25 Nov 2026 18:27:08 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi
	<arighi@nvidia.com>, James Buck <jbuck2005.linux@outlook.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, Usama Arif <usama.arif@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in
 select_idle_capacity() leaves busy tasks on little CPUs while big CPUs are
 idle
Message-ID: <awa3/FFd4hAnvtxK@chenyu-dev>
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4>
 <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 548a2e57-1026-4c53-c594-08df4ae033c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|261026140227099003|261022075727099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|10067099003|4143699003|11063799006|56012099006|261021121427099003|22082099003|261009223027099003|18002099003|4133799003;
X-Microsoft-Antispam-Message-Info: V5mpDTL9A+Bd1GhQ2gOroxEuVPMzzohws2P4P39moMWoABTTEuLBJ94LZVg2ojvutjfM4xLxqJvRkYxC4m4DciNJPZrArekj0b83MrFETIRZdn/5bBaUAh7GtrxMUaa6yGMAqRDfCABc6S6DdjdxdaOkhrUt4EqBwciSaWxSFBmVwhAN1rqE6O/qlUSCOmpbggWWwgE/4z9YW5GLk0RRzW+SRtF9O/LZ3r/taEeG316hJ+HG9BAyCR0mYrERai0KCEaQ9lgHSjwxi04dyrkbJIETtsfc4m/mVS85VVwiGMZoefgBW9ndBBoEsJBFLZCy32nr0rTnbDwwRnQ8oYD2g6QaOnRAHiQaVyqEJP5yj4hsqRAaNmjpAC/Fsrn0M3XgU8GRGNhoMmFs/J/3GJUYXGi0KtId4e4RwbR7Q7pk1XoOIVRmJtMbRwx3w95MSSOjiQe3pBPP8HSPDc4CzU+SFYYuTCGFQwIuBds2CwQNeO4dmjRJtg2zGBXXsL5OTKzpcvtD2BHlD4lQy+MXw93maKWuxW3vwTImqkyq64ei/GmaLs04vcy7nfW/+T79XeaxY1chKTaPzOXwdXvLG5sAY3YnHRU61WVCGFwutCN9KBDjRzGyS6zRZu1tUlYEKW5P
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(261026140227099003)(261022075727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(22082099003)(261009223027099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i1j38/RUTfz2ZM0GAVRDgfc2YjTFuN724qoNo35r5a2vWmSFjuCtdslvends?=
 =?us-ascii?Q?lev6PolEYa6d2DBHzHGLpxr84WcSnXvGFLZ6c6y/CMkevsBJWMJfdZSbOSIa?=
 =?us-ascii?Q?E0SgNm87A02O5iO78+fQCwsA+EgshfXDqzPVdgZ9CJ7feD3u95lGuVZbQpbc?=
 =?us-ascii?Q?N0wUn28I0X5XQf+PEzqVlAc9EdqKN6uUS1PQZAUwvlF01mwiutGkjK63xgtQ?=
 =?us-ascii?Q?k1XM0kO3PeIRRpxdktgbgd2sN/5Mp6jAUG1/GWDPdlp7FzmKmMd6yuWbRe9X?=
 =?us-ascii?Q?/b9/JMh+u4P2wtfESz9Lr2fMmtCHkDY9zQ2KP8C+Ku6U4BtKjhNEtJwf+CT8?=
 =?us-ascii?Q?9cMmFo+hzQdu2q8d5ceLIBIxGfXErNy6RYlyJ/QIRSrEfwHqaaehHqPHsMCs?=
 =?us-ascii?Q?9IMWeMLNSQnEz+QmULXheR31vHHo+nSvxncsywQG5ksufy49WNCBn6yJT5Zt?=
 =?us-ascii?Q?aOxbJRW72W77dXzRTzfIxYnTCOCf/YNVo6WrpdvxqQiLpoOYxNnaEBfH3WcN?=
 =?us-ascii?Q?aBfQ934Ylt5C21pkY77QEbQtS2/poMmW2kk+E+6J1MA/9qzfCfdRM0n4mh79?=
 =?us-ascii?Q?TFbToiFU6ZxD2xHGtIHh2hclhtHucSFhugJrnsg4prOfj7NCQ8nDcNeDAQt9?=
 =?us-ascii?Q?vmd5Hyam0Kz4pFNmdTvF7PI0Y0Lwy9VWsSB+GpmXo5IRjt8N4R5H1d1PHaKg?=
 =?us-ascii?Q?mHFc5F/f5tSEhAZen8GO0PvAzVx8Af54QLhSuWvvVw3bIvXLLpEYex8UAD4u?=
 =?us-ascii?Q?OmF4Vs5VPhGQ+8vaSIHzeAf1n+yPjB6shvWN6dERxNaSjZzVfVtykddqlVM9?=
 =?us-ascii?Q?+7iM9/f+dD7a/jz/jXFS+IgpR8JFrq3fQL4GaCKqfGMALkXQ7JyiOrPp7rjP?=
 =?us-ascii?Q?mj4BcsbPsAEtPojlDOkkurVpbbf7MOU0/NyuYVa22FaX4R5PoDXjjlSmjwK5?=
 =?us-ascii?Q?D4gJtnbHJC3d86Fw3cwWKK/8DSsD84hkUuOsv4BRU8cqh1Zcx8TjCsyJur7p?=
 =?us-ascii?Q?XcC1eCkxPyq9aMFXtSSLWrSmfdD14z7Z2bwRRPxjTboEO0APRn0tdUAHzBXI?=
 =?us-ascii?Q?12kHfePfFW8ohARE/sgJIjfwsul9iy7qdyg5W8wuLzlW3TzsT8zGWIeLKaQH?=
 =?us-ascii?Q?/KcF6VQydgFQ30XeXDD5k2izl6m+4Er6O6H7/Yz4mpjN+b4NqPHkSQf58JwD?=
 =?us-ascii?Q?CvLLxdTLNQQeOsdx5UuhdkSY+azH0kBtOOI5piEsNIBuAeXP4G+tt9bbtYsM?=
 =?us-ascii?Q?JGS9f2OMqn19rlnSAthLxxoCGIYfSAd/a9RsRi9nRehdIf9JoNCeZr1HuIzf?=
 =?us-ascii?Q?kTUV6UOtdQeDVuY7tyVgS5EdFRM4gfPh/hZexNGQcxAp+4A4ihobxijddUg0?=
 =?us-ascii?Q?UiNEuaUATW6P19biJoMAIC2zd+O+j0TD3AUbFw0EJU7TXpXI317M9V9y8vL4?=
 =?us-ascii?Q?etLQCadxfOXYY7t7lGZINUtO/ci4nd15hOft3J0sHeUPOSMfpfeRejQ8TYno?=
 =?us-ascii?Q?wNvJ/gxtpRJo5gyXFTm8NcNOXagA0p2tTzr/WGKTgQdo9QDQxxyJ4gFC/Yea?=
 =?us-ascii?Q?G3EGZnZ7jy1HdyXO/IqwDtFtbCJlAy9WzWGJ2sLR7C5slfxIBUBa0WX98zbN?=
 =?us-ascii?Q?kV150IqcqtQ4tBcpaZCa3026F/ZTY7Hp8qnpHyzqGd1XkeSLxMoNQJwFh80U?=
 =?us-ascii?Q?n1pdltEucr1Cd1IQzCJYwot2/jB3HpYW6uyAZeKax+rIL9gGLC/YGsORvKWi?=
 =?us-ascii?Q?YJLNK4NrfA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UTk6fEZnWWeXdJNrVrmeuTY3HTDO/riXe0dgctRi2lpRzRKLzHFX3X1YzUQxVDdnu5MBVn/2uMH+ktM/HmlT7kYC166cOy7pMVnBznFbg319oMjAu1Fs3MwiU8MUMewl1dVS9y7cZJWAO4mb93hWOn9VbFaisEhEuqMKNlvrtKCACePSTncr3ESnsbjKoFi0Y3ecPWyda6T3pBVMzoHHdw8OlKvhS2gnTWHYablVau80Dlm40n6U0cPUi2XHn78NvPvN3aTDcb7Dj1nUqzfFpILM8/D+/TjE0kOomvtPFH49RskfpYJLEIW2rKn83SsjxzU9JvdTJK2QwqXVo3lOFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 548a2e57-1026-4c53-c594-08df4ae033c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:38:11.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRtUuCQm/7mS2/u3gb+wUx/jmqTiItacboyErl+oHbfXLey5HzMwC6rcb9xdmQtABdhU8sxbQjLikvBmZJqecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
X-OriginatorOrg: intel.com

On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >
> > Hello Andrea,
> >
> > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > Hi James,
> > >
> > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > >> Hi,
> > >>
> > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking threads are placed on idle little CPUs while idle big CPUs are never looked at.
> > >>
> > >> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainline to behave the same.
> > >
> > > A related regression from the same commit was reported by Usama here:
> > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev/
> > >
> > > On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
> > > being idle. Your case shows that a nonzero budget can stop the scan
> > > before reaching an idle big CPU.
> > >
> > > We've discussed a minimum scan budget and accounting for idle CPU
> > > availability, though a small minimum alone may not fix your case.
> >
> > This had problems in the past when Chenyu was iterating on SIS_UTIL
> > where the search opportunity at higher utilization is actually very
> > low and cutting off search for !idle core was beneficial for SMT
> > systems.
> >
> > Now, for systems without SMT, it has its benefits too but a system
> > without SMT should be equivalent to a SMT one where test_idle_core()
> > returns true always if an idle CPU is present.
> >
> > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > to act like a gating indicator to say if an idle core exists or
> > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > gate for newidle balance - it can be flipped to true when a CPU
> > goes idle or if load balancer sees an idle CPU. Thoughts?
> 
> I tested idle_cores tracking for !SMT and EAS months ago [1]
> [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guittot@linaro.org/
> 
> >
> > > Given both reports, reverting the commit seems the safest thing to do
> > > for now. That would restore the previous asym search behavior and we can
> > > revisit a better consistent strategy to cover both sym and asym CPU
> > > selection later.
> > >
> > > Prateek, Vincent, what do you think?
> >
> > IMO it still makes sense for SMT systems since capacity on systems
> > with SMT only makes sense if the entire core is idle and then it is
> > just a best effort thing right?
> >
> > set_idle_cores(), would flip the flag as soon as an idle core is
> > available and after that SIS_UTIL is bypassed. I don't think the
> > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> > sense given misfit penalty is much higher.
> 
> In fact that depends on the number of CPUs in your LLC.
> The current SIS_UTIL is unfair for small system because you skip the
> loop with "low" utilization:
> - with 12 cores per LLC, you skip the loop if the avg utilization per
> cpu is above 839 whereas it also means that you have the compute
> capacity of more than 2 CPUs that is not used and util_est can worse
> the situation
> - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> utilization per CPU
> - and with 12864 cores LLC, it's 10 CPUs
> 
>

As you suggested in [1], maybe we can give a floor value of 3 when has_idle_core
is true both for SMT and !SMT case(mainly for nr_scan = 0 case). Besides, we can
scale up the number of CPUs to be scanned by their llc_weight, to fake
a 32 CPUs LLC for the small LLC system, this should mitigate
the issue of current report and the issue reported at [1]. 

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..1c0e2ac7751d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *env,
 	y = SCHED_CAPACITY_SCALE - tmp;
 
 	/* equation [2] */
-	y *= llc_weight;
+	y *= max(llc_weight, 32);
 	do_div(y, SCHED_CAPACITY_SCALE);
+	y = min_t(u64, y, llc_weight);
 	if ((int)y != sd_share->nr_idle_scan)
 		WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
 }
-- 
2.25.1

[1] https://lore.kernel.org/all/CAKfTPtDVqKyQ491MdUr2RbGmJ9ivofiiX7D7Xd-Sh2F0NLFmRw@mail.gmail.com/
> >
> > --
> > Thanks and Regards,
> > Prateek
> >
