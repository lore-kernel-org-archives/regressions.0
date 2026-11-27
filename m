Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771507;
	b=4KuWFTznbuiNblF4OtjOBdkP2o2A17xeuRlDw+/k0xD5bRmsQW9oBnbz3VTei07ZMZzC
	 K7THHiYpGJHgrJMbM2F31bP0RxUjm0DZd+2BSUgbnkx4RI0ZzZjHQrsvuazA5tD/+QLVr
	 yp+mSxuvwHrtmtbzGiKcbiUWBIfQbl3iW1IqHBc9tsjgnjxNOg62aFpHFr7ubOr3GTFUc
	 vy8H72tyhY3Q8A9lD9zCs2Pj3Rb1euebC8zjZNpzzVe2i/Lm/gjsfck+Hd2fPBZMY8Vmw
	 SP3/Of1rNrgdbkv9v+AuLA1xMvcvK/tMePnFUUmtt605o3AH77Kpkm/v4DbyXRWJqGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771507;
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
	bh=/6Abu75pJGLOZslyMLZVz6fXFm3fTvJjns+iappCTv8=;
	b=QoE1dXYV/SNvXBdFixkTWt0bQcDiOiLlOWBwex8oQwWmSkuY+1CIqpRWxTyO1OoBr/3P
	 qy45e5Kk1GzvnKrfijW2WPW+3dDRMfpvYJe5a4JbycBtU6+3937I2fVyn9rEL/QOnN8RJ
	 ucV7y6ZGbI2KCu/Z1FZlIZSDjFeds3HUbZnY7+sHzxod6attDAXo3KQAMwdvyxuCP9FjR
	 mTDF/oOy1zxoNN5K0gJ4cYoReMZvqXSTFPWpH3ixoAHguN5OvUA8CWHFOwkTQl2O2JlOS
	 FI1bO2OF9AeduldXRGCUn/k0sA1S5p8vs1jfPHKYBaeQXJi+bHJwCXJXGzoonk7aYZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bPTB6SXH;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MXiqdzTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DAE606A323
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 09:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bPTB6SXH;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MXiqdzTa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795771506; x=1827307506;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vcmRUYcGMVUApBkwQzax6RMFGpzthrQUESM+UUj9PNQ=;
  b=bPTB6SXHg+P1J83yfxI6t0XiENqHG7ZHXkCP1J4ldqZ4j6zts5s1A5zg
   jNXvjz88ZsIJzkH2W8sduYpOPYM04JKtqiZYvlIH6tWoyJuGS1kbX7kdW
   OygK9lA1+uttblHhIiS11/i2bnYqv9LWtNj9Y0eTwDpO6ipaUXzUyVSAP
   +pyoE9VQAHuVeLeqGm+mA8fcpj4AjX+/xH69adMcfrPPtCoMEG5I1DNTc
   I9vvv6Nnrm7+43QHdCJqPpjuxO0J5HRNYgXsTIeu72k46+wVTxfGu277p
   JgI3rRtkTLo1plQb9tsq5DQO+O2QTXmdYVu0TdhwwSrErPtcycdnpNfXk
   A==;
X-CSE-ConnectionGUID: wUxDHfwYR+KqFP75NdKebg==
X-CSE-MsgGUID: 7pMqrHbmTcu3bvFmvCP4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4749535"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4749535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 01:25:05 -0800
X-CSE-ConnectionGUID: lh5r4EKEQsqIOPGCRqdq4w==
X-CSE-MsgGUID: aU931PerR0G/cd5k0rKL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12663197"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 01:25:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:25:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 01:25:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3Qybm2gArG4ovunLvNEcMuN+YTRpKeZtiTRhhF3RFXJ8enyMqQyEbiRZGismyy4RvnM2y23kgSnxBM+TzWwevGkuFsblfLSEZNpmMjBCQ9Y24rppw9hsqFntRTjoBwH4dkHJyDPShgO/cS2UYeDfrMjZpy+o/8STD8UhWvOFt6PA/Nd0WE+EGZyymZMlmmQ8IHR8fokXMIgNcJE29jdLvmuHBsoVo8MR/j9QVvqMdgSZwwlQhahdtRhjoCBjFmI3s3jPa4H879AfN1YNGcUmsIklQkVW8TSIfDC/mrtk9YM4Y5I1+zs/NIXlX9NG7L+iHyFo1vajJ+7+DQAfW7NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Abu75pJGLOZslyMLZVz6fXFm3fTvJjns+iappCTv8=;
 b=TRfQgHnOwHPS7/IYJ0SG/Q4vZ4/gk5mi9yh5DYSsYraVoPcz7IGfeqrAMedNhxwc7IQXumhIlWQq+nYNwDMBIJv0UjlnO8l/W0xuhjMdvDix6PMzEAPIevGdEKhee1Rl8FoQqW3P8h4nCABazhnIC1BVa48DUcqnSNBidHkuY3dK1+pUgKRroK3wnLgivLV9qndWjY+WuscOW1bBtH4DAeHyUlkY4iiteIa1wqxZVD7m8HXQpoif9Wk2RUEwo9tZcHRdpdct1py2Is8nNdOzgoQ4lHxqBgzizHbL3jznQ050bjX+fnMqkzTai2HRzHI/5ton+7Mnq2PVG2wZZcYqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6Abu75pJGLOZslyMLZVz6fXFm3fTvJjns+iappCTv8=;
 b=MXiqdzTa+zsCGnVr3nHmLB0/z3gZOvFZ7Jd6lvEG5RACo9hmPRnZCDe+Xl8B3cDtuS+wvIyz2bTsxu4LaEZ3GzUSCehJ1UuyOKBKmHSz49A0oQakqwK56+40xiCmw1faaITHFjPntPB2KOiq5VNf6W8+BeiauerOoAp5oYduOxI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS6PR11MB098499.namprd11.prod.outlook.com (2603:10b6:8:498::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 09:25:01 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:25:01 +0000
Date: Fri, 27 Nov 2026 17:14:00 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, James Buck
	<jbuck2005.linux@outlook.com>
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
Message-ID: <awlJ2Fp94knZQDxS@chenyu-dev>
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4>
 <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
 <awa3/FFd4hAnvtxK@chenyu-dev>
 <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
X-ClientProxiedBy: SI3PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:4:297::14) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS6PR11MB098499:EE_
X-MS-Office365-Filtering-Correlation-Id: 242034ab-f05e-4cad-6fca-08df4c684ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|11063799006|4143699003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: RASKIJCrFEXCByIHH2ZvqLAtVdi5oJh7xI/9zlhhoX4vg+rmdfHLrhtJfUSy1wWgm8yxC1PNcnNAiQSf/gvfetzyo3ZK0MoxPUjyiKr2rZS2sOw1/nbhFxhAepvPxbTbVnYqRkK4IF/LIPot7FpG/dvesG8PoTGLnfWklfTA67ED8eUowGg/dqgwCwvk/bUPMeAMAjBi8+rmV9VLllln8Ws3V24psg5/zYbfh5wFCVVhy+u3/Xxj5kBhZZyxJMNdN7cO0ZBizPncj0uQyEb4xLAhl+1bvn7X6H+pcS2nd7R/barsPGN4eaqLGNduNLSIPqk7jVWNCEGFDxr//SpeYjSas9xAkHUr/AaBhOcMEZ116FjRJ6vhhHnBasxtVea6ed2KwdBJKJ3XYQU2lkAAtDAIpRIhLRFXU6mYtHZzSjo4SezOIzyPvRn2jD0ob83xryTATESO9wzjgfhITTasCpKm22KVyh8anTgaBuUL3WWPDOWOeocUvhjfvrG/241DyrQKQYHs9HdFoj8V+leDIyU7iHTEuXuN0ThE3DbrTNzQr1QY5Kb/8fuvsWVTZtE35u4swOfvkrsUMAAy3ukrecHJa6N378MqsxhxpiogBiwEN7mDJWJhApdruruX9s4Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(11063799006)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tKWnYRPhcGy9WxED0cb7BDOeT6wW5TnvqzVNiPludKivDwzVz0R5zyDEm1Yz?=
 =?us-ascii?Q?dIZkbqmlfvVEXG2gGQPQxUz2exi/jvFYkTpImvG4EOfu0G+SyxRa0Jp9sje0?=
 =?us-ascii?Q?nzym5SRgvOO9UcqCGyzOAD1Wly4xxR96zY7v+fQx1rsTFKwgv4h0jxcrkzhT?=
 =?us-ascii?Q?W1iR2bgePRFkQs5I1hSYzLyO6AHY0mPtYybdciCsa77CE7L0ElOtjWjuBc0s?=
 =?us-ascii?Q?c4L2Y7nQwlpdPKp87hDWhitS0qNr3Mqz2p8g9XX16z0eYBsfRPaBfYSrxc9j?=
 =?us-ascii?Q?+RpmQFzeOz2Gi6CydhesyA8O5SyYd+4vNQiziibrt4LJ53lnKQHkLbmGpdL0?=
 =?us-ascii?Q?2INAaG3TQZERChyJoTv576VF5p6SnuXeZxlXgtU90WjPeNoIszaxfy4OPcv2?=
 =?us-ascii?Q?h4HQ+NJ5YWj3SdFqva9nT+qQ83uxBI1VPoEn2RGtfEypqleKELFk/mWsFgD2?=
 =?us-ascii?Q?kp4MTZ0YPcTODEenfi8dB6LijRAo3yq7u0Pl4o4LeecA7mgWIS0PuWEjZaRz?=
 =?us-ascii?Q?RThcg5zYIo/h9h6JBUQujzplVpEAkATy6WtJNx9umCIcP9vN50MGAqSlAs4x?=
 =?us-ascii?Q?7kSvxD5haEhJx4xLBh7Or4L5p+9pkVA2/OeB87UzBoF6p6YljEe0NhZeQA3g?=
 =?us-ascii?Q?tizoIi/zKm/OY//nM+cPGUKTkyywKvzXUWWah1/qIHzc17g1IiFDQcugnTqm?=
 =?us-ascii?Q?U+N22ktt2xq5F8dqomWyxCwCzPEXaXNeVtsb72IjA1qqditBl8nIB8bliD6Q?=
 =?us-ascii?Q?qD3SllDPAOPIjyFdif006k/3CRMKYp1t5ggetY6B208a8DsgVJP3Q7HFI5Eq?=
 =?us-ascii?Q?W9oBhtxmmUBU5jmFQMkuONhSvJxqNs7Q+jnnU2ezTJH7cj0JeU8rbfB2d8sa?=
 =?us-ascii?Q?G+Yt7KS1eC96i+KNC+EWOJmLajmdHOtbx3t1nOVb0YkQAVtRAIXqfMQbP8I0?=
 =?us-ascii?Q?HaN2S7ZysoLd1aYNBu1eUvMizatFOZ4B89kK56Z4CgIcENF7CX8N+1rJto7N?=
 =?us-ascii?Q?NL6TTP5yMU3R4h9XnM2h6AylzI372VXFjAYP5OstS/aNMPP4qCcSf3O+PGHs?=
 =?us-ascii?Q?J4pxAUnhSLfIBsL5flHEaNh5r5tUTy6HqVPuCEIhNxFntc9YMQyaRz6XH4fi?=
 =?us-ascii?Q?wKi+ledJ/CDf1wuDbnQe1NXTmv+s6daNDJ5iyec7gek6IAPXej+QMyA/xTMB?=
 =?us-ascii?Q?wD8bfiaIcie+mSsd6tDlenAnuCGDHnr/UoT1ZzvAuc/JMOXxqdofPBPixLdL?=
 =?us-ascii?Q?kGOE6QWUbarw9HPfuSeE/DIFvR/avyc2/+/jlOn8twFb2eRqBfojaKajjWPa?=
 =?us-ascii?Q?PgOv8DwHVWy6t+7StrXgQaI+Opuu6cDKN+Y3XwdpCF0Vav71iiNrf8xFbeC1?=
 =?us-ascii?Q?2rZ2wDIGkEU4dn7fW30pvNQ6034hdCMgnNYbaK3jS6sB1MksG7T1t0pT7xbz?=
 =?us-ascii?Q?bfvU4rUVXrmiIE4O27M/UxNB4k/Fa/YOP0htb/jR5megjpFPW569Sar4KEO9?=
 =?us-ascii?Q?9hrEg9Fj+ifPMmUE3NXCj9sM5v4p8fsQLA6aczk9RdTsp9x8Dee3YNkPEMy3?=
 =?us-ascii?Q?usEzqBrFI0y5bokOXtgyipCFYOQjo+q5OUinGRVoyYAcGd49OzZI9nqtpH1k?=
 =?us-ascii?Q?iwMSn4fXvzy51a3dFJkLXJpcgyuue4mCgIMTs2dTwfvZysz9EBZpTX+lspBN?=
 =?us-ascii?Q?Osf4GeJBS/4HHlrgq0V6IN9OpxhmFhl8RPBZ4jfu+RW2uht4X7+JlyiRN0BI?=
 =?us-ascii?Q?m2m70v8s3A=3D=3D?=
X-Exchange-RoutingPolicyChecked: VvNSszMXNkFFjDj5+5PZtQUgGFmjzwlGWGVLjB2LHjFpArQo3gygxdQftc1GZa31Ov4rMvillQ7GAb1dUcATow6WS+Vd3cDnWBMz+wv2OpubOMQ63LDc1wabDCY06Y91JI/jbISqTkrSYTVOj3h1wIfN2q7UMGKfZtHODLMpXKU2QfR9YzTzkBN+XJ8HqbMGQgFrlQejMEunp9kQVxkpD/tlbKdQt/6Y1u3R2aSyvENaHZ+6bbFxTefXFdo3IoFJwFkrwhO/6EMw7s/ykmybl69d5PFbOL9YPqk6nehX4eAZeyxBswocBr/V0FESnSYOqq2FWBZkfz0Pa3KkJjb7Aw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 242034ab-f05e-4cad-6fca-08df4c684ff2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:25:01.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKNXKrSUcS+T+SnunY74KMTUzh65Xi+0D4jJEuKkpVpakKLipP+HzSxy9kjXCsLBH12BXnXxelof+kTWs5CGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB098499
X-OriginatorOrg: intel.com

On Wed, Nov 25, 2026 at 03:27:46PM +0100, Vincent Guittot wrote:
> On Wed, 25 Nov 2026 at 11:38, Chen Yu <yu.c.chen@intel.com> wrote:
> >
> > On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> > > On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> > > >
> > > > Hello Andrea,
> > > >
> > > > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > > > Hi James,
> > > > >
> > > > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > > > >> Hi,
> > > > >>
> > > > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking threads are placed on idle little CPUs while idle big CPUs are never looked at.
> > > > >>
> > > > >> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainline to behave the same.
> > > > >
> > > > > A related regression from the same commit was reported by Usama here:
> > > > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev/
> > > > >
> > > > > On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
> > > > > being idle. Your case shows that a nonzero budget can stop the scan
> > > > > before reaching an idle big CPU.
> > > > >
> > > > > We've discussed a minimum scan budget and accounting for idle CPU
> > > > > availability, though a small minimum alone may not fix your case.
> > > >
> > > > This had problems in the past when Chenyu was iterating on SIS_UTIL
> > > > where the search opportunity at higher utilization is actually very
> > > > low and cutting off search for !idle core was beneficial for SMT
> > > > systems.
> > > >
> > > > Now, for systems without SMT, it has its benefits too but a system
> > > > without SMT should be equivalent to a SMT one where test_idle_core()
> > > > returns true always if an idle CPU is present.
> > > >
> > > > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > > > to act like a gating indicator to say if an idle core exists or
> > > > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > > > gate for newidle balance - it can be flipped to true when a CPU
> > > > goes idle or if load balancer sees an idle CPU. Thoughts?
> > >
> > > I tested idle_cores tracking for !SMT and EAS months ago [1]
> > > [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guittot@linaro.org/
> > >
> > > >
> > > > > Given both reports, reverting the commit seems the safest thing to do
> > > > > for now. That would restore the previous asym search behavior and we can
> > > > > revisit a better consistent strategy to cover both sym and asym CPU
> > > > > selection later.
> > > > >
> > > > > Prateek, Vincent, what do you think?
> > > >
> > > > IMO it still makes sense for SMT systems since capacity on systems
> > > > with SMT only makes sense if the entire core is idle and then it is
> > > > just a best effort thing right?
> > > >
> > > > set_idle_cores(), would flip the flag as soon as an idle core is
> > > > available and after that SIS_UTIL is bypassed. I don't think the
> > > > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> > > > sense given misfit penalty is much higher.
> > >
> > > In fact that depends on the number of CPUs in your LLC.
> > > The current SIS_UTIL is unfair for small system because you skip the
> > > loop with "low" utilization:
> > > - with 12 cores per LLC, you skip the loop if the avg utilization per
> > > cpu is above 839 whereas it also means that you have the compute
> > > capacity of more than 2 CPUs that is not used and util_est can worse
> > > the situation
> > > - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> > > utilization per CPU
> > > - and with 12864 cores LLC, it's 10 CPUs
> > >
> > >
> >
> > As you suggested in [1], maybe we can give a floor value of 3 when has_idle_core
> > is true both for SMT and !SMT case(mainly for nr_scan = 0 case). Besides, we can
> > scale up the number of CPUs to be scanned by their llc_weight, to fake
> > a 32 CPUs LLC for the small LLC system, this should mitigate
> > the issue of current report and the issue reported at [1].
> 
> This fixes the regression on my radxa O6 by keeping nr_idle_scan full
> for llc smaller than 32 CPUs while the avg utilization per CPU is
> below ~550
>

Thanks Vincent, James for testing.
Let me post this as a formal patch with some test data, mainly with
the AMD server's data, because I only have some Intel servers and one
AMD server, and this patch might impact AMD more than Intel.

Besides, for Usama's 72-CPU NVIDIA Grace arm64 server, it seems that
the above patch cannot deal with it, as we only cure the system with
<= 32 CPUs per LLC. Inspired by Andrea, I wonder if we can
leverage the number of idle CPUs together with SIS_UTIL to decide the
search depth. In summary, the more idle CPUs there are, the more we
should try to scan. Given a fixed lower limit 3 or 4 might not fully recover
the performance on Grace I'm afraid, because there are up to 72 CPUs in a LLC.

This can be seen as an extension of has_idle_cores to non-SMT systems.
Unlike has_idle_cores, which makes the wakeup path ignore the SIS_UTIL
hint entirely, the number of idle CPUs is only used as a floor of the
scan depth, so the SIS_UTIL hint is still respected in general, which
is a trade-off to not break other platform/workloads.

I'm also wondering if the system supports the cluster domain, the
has_idle_cores calculation can be extended to the cluster level, so that
a fully idle cluster lets the wakeup path ignore the SIS_UTIL hint for better
work conservation.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c0e2ac7751d..079d1fc06344 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12874,8 +12874,11 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	return idlest;
 }
 
+#define SIS_UTIL_IDLE_MIN	2
+
 static void update_idle_cpu_scan(struct lb_env *env,
-				 unsigned long sum_util)
+				 unsigned long sum_util,
+				 unsigned int nr_idle)
 {
 	struct sched_domain_shared *sd_share;
 	struct sched_domain *sd = env->sd;
@@ -12940,6 +12943,10 @@ static void update_idle_cpu_scan(struct lb_env *env,
 	y *= max(llc_weight, 32);
 	do_div(y, SCHED_CAPACITY_SCALE);
 	y = min_t(u64, y, llc_weight);
+
+	if (nr_idle > SIS_UTIL_IDLE_MIN)
+		y = max_t(u64, y, nr_idle);
+
 	if ((int)y != sd_share->nr_idle_scan)
 		WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
 }
@@ -12956,6 +12963,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 	struct sg_lb_stats *local = &sds->local_stat;
 	struct sg_lb_stats tmp_sgs;
 	unsigned long sum_util = 0;
+	unsigned int nr_idle = 0;
 	bool sg_overloaded = 0, sg_overutilized = 0;
 
 	env->dst_core_idle = !sched_smt_active() || is_core_idle(env->dst_cpu);
@@ -12988,6 +12996,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		sds->total_capacity += sgs->group_capacity;
 
 		sum_util += sgs->group_util;
+		nr_idle += sgs->idle_cpus;
 		sg = sg->next;
 	} while (sg != env->sd->groups);
 
@@ -13013,7 +13022,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
 	}
 
-	update_idle_cpu_scan(env, sum_util);
+	update_idle_cpu_scan(env, sum_util, nr_idle);
 }
 
 /**
-- 
2.25.1

