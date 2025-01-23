Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4562914
	for <regressions@lists.linux.dev>; Thu, 23 Jan 2025 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737598058; cv=fail; b=qDqp50cmPtKs5p6f6YMY5tS8LiZfOKmWFsDmOiYpeq0UGOmkYamq235fMUC9khnn2ydgRw+/mGJJAKx/4n5/la3Pzb5bPRAYVgh966qamCQvMgEe3FLtRlrc9qU500niOj18DtVIrK+Jh9ITdZbOF4bdu36oneh+a0qRXCBVa6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737598058; c=relaxed/simple;
	bh=El51hESfCgFmx6fjyM87ocUl7ZyxiPmd4ff0o1QVEEA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rv99WjGlRBxCf7OalFmCNqGGCjEFu6kh3wWhAxk9VcDsYxF+x4oj1OFx9M5HeaR893ZFk//xgjVSKLX5cMq84HORbpY72Cpe1ADoZ79LKEaAZoXdB+fZITER+vgdF2VR5soo4EFdc9aLOVndyMbu3XfY5ewSFBaXENiPWjYlx3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XT/SrS4x; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XT/SrS4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737598057; x=1769134057;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=El51hESfCgFmx6fjyM87ocUl7ZyxiPmd4ff0o1QVEEA=;
  b=XT/SrS4xCvi8AaMFaSoztgs4xVKlfIhs9CPFPI23PbrxpwDqtiqEl8Nc
   ouzwdukmO8ru29lZ2bhE2W8MQwsCU4Ja6hezP88MdWuLhMNunm+iAU/3B
   ycqRNTpUnUhzb1LT3vGQjh3MHcLDeBcQE1rbEwifFP6g0OC4va/5YxP7v
   YNx2zVKuepZIyV4G630vtjLvy6b4VLgu3GKalOGKA25jdX/PhTT2FkKuL
   B38TREnmR54UrnK4KBMzpJC4i00y89uzQlcWsWyq28S1g1moOCgwkVTSc
   yAM7r4TUoOZPfE2LCuZe0wmNDM31ESMXCZzHkaoedbbaoYL0hagqKGg5e
   A==;
X-CSE-ConnectionGUID: r1Q+PbMjTiqrzyG1o2JKzw==
X-CSE-MsgGUID: GvQ/meDRToi/tGYr/UIUew==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60554629"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="60554629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 18:07:37 -0800
X-CSE-ConnectionGUID: LgqOOKenQUaI8v1m6f+2YA==
X-CSE-MsgGUID: +GJxk8IuQAW8XuWFJnQzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130618147"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2025 18:07:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 18:07:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 18:07:35 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 18:07:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGDjJFI99/C/HHE9eB7w2qu/0Fbg2y81iLO86kdIff+1/0afwngcqYSNKvHLepC/Fp6GY8enHvnJ4tYPo6cZTF24tTlhUjhUBa8AvBUWPe7s1WzusvRCS+0XZbLA+ZGQcg+wgWaszaL95krfnUmc00VlycJTDfQDrsHK21IoRhpKXEiDQLvYTd4BMUNQRRigUA1RbVVCZiTawbZT2GEIb0ldlHBK4/fsSHXxTe3u8nsxvGrxim6RnBJazwmTTbfhTbVqY2E9O+EYf27MRJSKtkq+laS+y+QrsNquidMJhA+asIbT5j5bb7+6ZH2iG/X1eTcy3XqvvtqBnAwlPJEnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFc/B1lFh1zQgnZ1xqy5/YMQnGmx7fv/pMV5VdGk55E=;
 b=qZX+4+lHPVqhO3z9eTW9sEIH+/NDRTn5flN4kzkF8HCwYjzn2S022TLh/dJiICrsS5KNGcGmkBf1hBUzF6nfPDG2S5WSi8WQMwWFAqwKmKRUyFUkb7a7AgIih3G0ocAtJJ0T4zgFrwuASRGpJU7jC4dDwyjmOSvL7mNc7zFGo2GnFw5rtsB96DT0zPC19Um9Rl0hyQF2c/XuFrWiBwre50NSdLEf5UUgnXsTD0GXNctQsYxWjB7RsTV3WpC/QQy7xoMO3RUqjEVMvRhG2PXXgp+TV86B1SpHhtvJ06AEK4Dbh0ULU6uH03uJIJy+Az2+WHeiRIT3rn2Clxmjc1GTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 02:07:29 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 02:07:29 +0000
Date: Wed, 22 Jan 2025 18:07:27 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: "zhangzekun (A)" <zhangzekun11@huawei.com>, Greg KH
	<gregkh@linuxfoundation.org>
CC: <dan.j.williams@intel.com>, <linux-kernel@vger.kernel.org>,
	<rafael.j.wysocki@intel.com>, <regressions@lists.linux.dev>, <tj@kernel.org>,
	<alex.williamson@redhat.com>, <chenjun102@huawei.com>
Subject: Re: Possible hungtask issue will be introduced with device_lock() in
 uevent_show()
Message-ID: <6791a45f711e2_9b922948@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
 <20241231075608.84009-1-zhangzekun11@huawei.com>
 <2024123128-monetize-outtakes-3260@gregkh>
 <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 850114c4-40c6-452b-0b56-08dd3b52b0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnJnT3p2cWdyc0pFZ3U1ankwTzV0NlhpTCswaVdqMVhtUHhwS09JbnVCbXli?=
 =?utf-8?B?c0RTcnhpWXB6dTJ0UU1sUGVucXZjQmtENC9YYTNqMnBjT0hLNjFrekozQVNp?=
 =?utf-8?B?c3hRTm5mKytRZHg0OWE2dUlsNmM4Q2NpeEJHS2JJdlpDd2RlMTJCcDJFN25K?=
 =?utf-8?B?VEJHa3Q4dWlqbHNuVUFuZlArbjlMekxja0lLRmFzTUFkSDhJOW9lZ3N3UlAx?=
 =?utf-8?B?Q2NKa1BpL3pEaHF0MHN0cWwwNC9XWmpBU1lWQUlTMXBwSldoalBuZDVzL2RP?=
 =?utf-8?B?dHkxZmdXQ2xoTDFBZUVoWlJCS0NxUWNnZmovbndRbDBKNERsNE16N3hJMG1p?=
 =?utf-8?B?cmZ4SkZTUFovMWpwRmhRcThkT0MwWkNGczgrK1JhSUhsbFZ5MFNVeFNxRTFt?=
 =?utf-8?B?NTFhU0FXRkt1WmxMTzdJbmkxZzM2MkxtK2h4a29xOVRKOE9wY0I3amJaQ1pZ?=
 =?utf-8?B?QnVLWWZuOVRRb0NWSkVWVDlMaDl5MnJjOTJLSjdmNGlMMzRiWnFvZVhOQjEv?=
 =?utf-8?B?M3Z3dWNJU093R09GR0tuUkoyYWFZTVdNSERVS2hzWXU0YzczY29rYU9yV0pp?=
 =?utf-8?B?cGxSNERqTnZZUjVOM05PNTEzaEt6bTRmc3lyNUpnT055aHBERzZDZXN3ZllP?=
 =?utf-8?B?eDhhdEh6amhZc0N1QWFFSUhHZG5KdnJPbWZEVGh5SlVZTUwrVWlCa1ZLcThy?=
 =?utf-8?B?L0JRSXB5OXVoeWF3S1FYNDdpOVk3RGs3LzV6U2lCYTRvcW0yWFpjakJqc0x5?=
 =?utf-8?B?dE10NXpESFFHRjI1ODYrTGJjSUZnbUw4S0F1TmV1ZXM5Wkk0U3hBbWppYm50?=
 =?utf-8?B?aFJsZkxOUlFHWitGVDZoL1JQMnkwMEVjcHJXRGJwSjV1YzdQSEY4dFNxUlBn?=
 =?utf-8?B?UVBQb01CYVl3N0pMazIzMEM5ZFVXWnpaRTZCNFc3QWtnRXY5WmF4cGFJY2Mx?=
 =?utf-8?B?MjdBRldNdXZWRXlUQ2FJZUUxbjdkR0F3WVZiMloyYmRDL1dzUWlPQnd5cUVl?=
 =?utf-8?B?bmFFZ3BJRzBLSzNlZW5Db2JqYkZrMmZMT1VEelp2M2ZOcjhPMkpWSmlOZTFZ?=
 =?utf-8?B?bTdORFBoRGZYQzBYM2hZbkZwT2p2Q2pCQ2drV3RuS1gyaVRscVBDUUhNd21J?=
 =?utf-8?B?T0IwQlNHdENESHIrclRtdDBxNmhUaWlhdEFzNW1CME9qWm96ZHN4T3Qwdjlk?=
 =?utf-8?B?clFrVU9vRks0MWlxWnZpUm5CZ1BsdTdSYU0yU0xFZmpxdGdJaEpVU3pGVkZu?=
 =?utf-8?B?ZWkzdGVvTGZXN0FXendNaTJ3Wm5TU1E2UkJ2dGRqWnBWWDFqbHc1ZlMxcTdP?=
 =?utf-8?B?SkN1NXRqZUUvN2s1ZTFuVzczakJmaVNKZ0tIakk0OGdSNGZCRW5GUStIS0pO?=
 =?utf-8?B?bnZRVjJoK1FBbnlTMHVSTldRc1lPMlJydFVudnFKVmxyU3FObmtNb0VjaWx1?=
 =?utf-8?B?b0w4TWcvS2FYaVVaemV3UzljTy9jeGlQZGtLbTBmYU5KVFlGWEUySHJWVUsy?=
 =?utf-8?B?UkZUamhITFJmT09RdkFRc3VhY0pLTlptWjNaUHFyYW90ZHlJMWtNaEp0b1VY?=
 =?utf-8?B?VDJaeUF5YURoNnN5cm96dmFWVlhNL2llNkNVdW5MWlV0L2hqWWM4a3E1QTQz?=
 =?utf-8?B?SXErRk5JdWdXUktPWHFiamxLZTN1aUJGSUxkeHFmQjBOQStCVnhYcDEyTGNa?=
 =?utf-8?B?ZS9BMHNXdEVsaDJPQ3B4bGI0VkRqaW9NUlk2dk5CL3VISWhFTm9MVi84bFIz?=
 =?utf-8?B?dFN5dllnK2pRSkdDUmdSVTdCRW1QTEFSQ0hqWmhlR3JXbFlrNWFzLzR5RXZ1?=
 =?utf-8?B?cE0xQjBkbEIzd3g3RWFSZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtkV3ZLc3FGaHZNL1l6VTJzdFI0K0NyeGY3aExFWjM5TkZvTnphTTc4Mnpl?=
 =?utf-8?B?NU9mWGRUSXE1VVovN241aDB2UWhhZXVhbmFVRzlkNmdPcEI1MEtKSUM3aUZu?=
 =?utf-8?B?MlZLQmJ1U0x0dGNBalZsaEhPOFYvMmU2eW5ZbjlXL2RRZmlNYVY0cTJqN1lK?=
 =?utf-8?B?bXgvaFQzS0dYVjZKYzNvRXpFZHB2Tm5iUG8rbU1uakNYUDRYSFlFaVlBTExx?=
 =?utf-8?B?RnMxYlZQbG5qRHp3L1N5QzdWQWwvRW1IakRHQXJVQ2l3YkxObkV2WHZRWEV5?=
 =?utf-8?B?OG9lczNyZUJZYXNmL1I4NkYyMS85OEhaS1lybWtDQVpCZVBZemx2TEk3K2dH?=
 =?utf-8?B?R0VHVTNxSU9DVXVDeW83ZnYrTnZHV21KZTBtSUViOXJnb2ZyNEM0RmFKYmlB?=
 =?utf-8?B?UktVVnJyWmIyZ1oxSHcxZkI2bWVrNmc1ZGdvVG9vaVRxMlcrdGRlbjVza0k4?=
 =?utf-8?B?V0g4c1ZEYVNYSSsyaFJGbFF2SUdLcmJ3UjZycHAwckdlRWZZY1FSRmF2NUUr?=
 =?utf-8?B?dnZNL1JCTE11MFVFdW5nMnVlbkxtTGwydHEwMytkMXBVMGFhQlMwVnU5R2M2?=
 =?utf-8?B?QTI3V0RBNUIzV2s2Rm14Qzh6NEFLY3BvTE9LdkdwRCtwMHpqQS9Ub3BPR0l3?=
 =?utf-8?B?ekx3SmZRV1ppbTQ5aTcvZ2Z3K3R4bHBDY0tqcWYzeU56NUVZSHlOQXlxUFVI?=
 =?utf-8?B?UFQvRlQ3ZjlYMElZMXJrcm1MSGNCbkNWQUdncHdPUnpmUW56cHV6ODg5MzhC?=
 =?utf-8?B?TmV6N3FzUVMrWm5Ua0lBU2d4c1NDaklwemtiaFR5UTY5MHNVYWg5S2R3MDQ0?=
 =?utf-8?B?OVVIY1J1cVRtLzZaMXNvT2VrbnVoZDhoS0pvdkpyeGVxV1RmeXdTd3E3QnJB?=
 =?utf-8?B?bnF0dVEybWtmeEtocEdGR0hVQ2NHT0NoYzc2a1dKMzRXRDhKczY2dWNxekx1?=
 =?utf-8?B?OTNkNVBxaXZQRDVYTnVoR3R0RkF6cGEzKzdoL3Bsc0dEUU1ibUxmK1JXZEpw?=
 =?utf-8?B?bDJyaTVsbnBRdks5Rk9lZTRUQm9sSE9ZcE9na2ZyRDMyQnBIdy9Fc1ZZRHVW?=
 =?utf-8?B?elptSTkzRG9NYy9icE9QclNFNVhTSm96S25EbHVWWHY5aTNjZVdPU3NDRVFY?=
 =?utf-8?B?NXFzL0k1dzBEbkJ3c3M5dVR4Ny9lL2cyM3BkSnZLc3V0dnNXUXBGRXZwK2U0?=
 =?utf-8?B?VGswcU5sREZINU1wREkwYTV1Z2Zna2gxQlFaQ1p3NTkwNVZtZU9HRG1HYXdn?=
 =?utf-8?B?UU12S2U4REhFbndsV283VnluV3RicXB2N1RXUDZaSFZKaEJRMTFCcHJNWkE4?=
 =?utf-8?B?eWova2xnOVBIeWV4MXFQS2hvNmw3RmlhTnFlZGRNbW5LL2owUGZPWFFmQysr?=
 =?utf-8?B?Y0pqSXJyTGRHdG1CdERhbm9CQS9ZNENJTDBPbSs3UHY0amhweGxjeU11cVJQ?=
 =?utf-8?B?TU40K2M4dWVlU2hGN1VOT2t4b2ZBMGZZNVpCMFNXRk52MTdlKzU2cWNSTzBR?=
 =?utf-8?B?N04wZEQxWVdBcFBJMVkrTWZPdmd2MVhOMHVyaWlVL1BOcDg3MGMvL1oxazZn?=
 =?utf-8?B?TUg3VnUrZElYQ1BaUGV2Z0tFVVc5R05DZTd2K3YvNTZLU0JuZUJKN1g4bGRQ?=
 =?utf-8?B?dTgzNnprZVBWemplU2xUdHdsVXJVeVJrS2l6MGFhUVkvbGgxQmZPZWJYbnBP?=
 =?utf-8?B?dG16c1ZxMGpFaC9IaExOOGcwd2dRVmNBelNHdWtBM2Z6dkxLd1NsZTZqRGdB?=
 =?utf-8?B?OTFIanVxdW1sQlVEMEY5S2RXNElKMTBvMjNOSnZxYy8yR0kzejVmd1ZnVSto?=
 =?utf-8?B?d01VQVhOQ2Q0SzZINVVFYS9DaTVxK3Y5ZC90R3p1MVUrSUp1d1V0QzBrR0Rr?=
 =?utf-8?B?am04ZnVDUXdvV1RLaXgyWkYva0JRTXBnTDNOaU5qaTNUMmJGRlBwdzgydGtY?=
 =?utf-8?B?NUhoUWtGVUdrOWFYNmQxU1RZSVBPekEzRXc1NFJnWEVuVmJKZkVLTVBWOURQ?=
 =?utf-8?B?d3J1ZWo2K1pTQTlwZ3BpdkJJZ3k2TURmUXdUL2V3SjFON2xPdy9vaThidHo0?=
 =?utf-8?B?cDBURVVSQVRFNk1MVUVteEs4NWtkZHBxWmswQ3l3QTNnWG1IRThjVm95cDZD?=
 =?utf-8?B?a1d3MjhnT1o5T3MzNkt0cVMrT1QxV0tyRm1jcFI0b25MZ2oxSHRZYi9hMzFN?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 850114c4-40c6-452b-0b56-08dd3b52b0cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 02:07:29.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sb4HYfBCc0HNDNkGqupkVibLOXigncjpuwXSJFKXVrkez/lnEljI660zDFZIaQKBIzjsQNy15r+/A/5MOROA5V3SZ4q8vCVPXVMxptKG+oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-OriginatorOrg: intel.com

zhangzekun (A) wrote:
> 
> 
> 在 2024/12/31 16:26, Greg KH 写道:
> > On Tue, Dec 31, 2024 at 03:56:08PM +0800, Zhang Zekun wrote:
> >> Hi, Dan, Greg,
> >>
> >> We have found a potential tungtask issue has been introduce by commit 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach race""), which revert the rcu in device_uevent but reintroduce the device_lock() in uevent_show(). The reproduce procedure is quite simple:
> > 
> > The revert just puts the original logic back in place, so this is not
> > anything new that has been introduced, right?  It's just that the
> > attempted fix didn't work, so a different fix needs to happen.
> Hi, Greg,
> 
> Yes, there is nothing new introduced here. We have been testing the rcu 
> fix (commit 15fffc6a5624 ("driver core: Fix uevent_show() vs driver 
> detach race")) for monthes but has not obersved problems.

Hi Zekun,

If you have some cycles to help investigate the replacement fix that
would be much appreciated.

So far I came up with this:

http://lore.kernel.org/172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com

...but have not had time to debug the 0day report.

My worry is still that Linux has long since shipped the expectation that
reading 'uevent' bounces the device_lock() which, among other things,
makes sure that any in-flight driver probing has completed.

The report of USB devices disappearing is consistent with a udev
operation failing due to the driver not being done attaching, or
something similar.

So even though you have not seen any issues, I suspect small differences
in the devices on your system and the reporter's system, or udev rule
differences could result in a failure to trigger the regression.
