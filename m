Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3E34AB03
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778098424; cv=fail; b=H4X9d+EN0o6rL9QXBcpGSewkQPQMYoFkinUkLbwJnr08TGyhhHkcZ0gbC9bsjUSNJIvQD85gLsWi2oUlZO+9MoyDBv+ENFaXCfYGGAy4dGKaGO1r97tRO00dq9ebAZ4MMsSh4XmFlBzi85FOYIQ4uLNbSJGp+ifodkURhHqRJsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778098424; c=relaxed/simple;
	bh=aIIqNlLAP2AxihKSHlNCd2lHZlLq0Zs41+skwJcANHg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dlXsviMQBUAaVWvHEQJmr8CWROUeiWfYx3sIYy/wbmpsx89uMR1i9fHFUA3TEndQvl43JxTFwhpIBKPxG1xjIs9ddcEfylUtHC1ZswS2uJmuipYaQUIUyYPcUjbQ5n08IPJy0Fj386GRx4DI219AELAtFGGCgzjF8T7WxAmrHlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYsoFYEt; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYsoFYEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778098423; x=1809634423;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aIIqNlLAP2AxihKSHlNCd2lHZlLq0Zs41+skwJcANHg=;
  b=XYsoFYEtFD9oxBUvMlvLS3UKJE0K59RobGI8hZz4qOaYY//tftdmjO1E
   8S6TRUP7lp2HvzpUYxkD37O7mLN4hXKRL4X2fzMCrQlbbzzyXao+p75IR
   iyMcgo1b/mPV0RG2l3fsIt/FJrmw3FHK9pRqGATz+oNkShlOkzvIUtZuN
   8M10JbmM4X9QqyIuvzOnS692zZHdOxtU1ukk7tJCVsO3xBJPrUuoNFrby
   yK5nrcFgvZPNPoLsoGN9IQq+KCX4N19Wpp3FI1k1ckII8oZcTZC3Iwitm
   2YpiyaIPWEcyC115mu99aiuBcmKeyDTY9S49zxK1goykdiQxoan4bhOIS
   w==;
X-CSE-ConnectionGUID: G9qCOJfBS7iarot2XeVgUg==
X-CSE-MsgGUID: tb8WZkmYSQK4uQt4C6FSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78975854"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="78975854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 13:13:43 -0700
X-CSE-ConnectionGUID: VuWyAVICS02tcVa3VnEr+A==
X-CSE-MsgGUID: hAvqRqLzSBeHrf+BrgXBCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="233140831"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 13:13:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 13:13:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 13:13:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 13:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LddH+l7FstQJp1kkLqffGUt5GhTx62eDvYnsumezjRzCgzN00WPHvHVI2udkWu0c7QpyOpYJ/1YBWv7LvMUkGNIKB2yhLI4ZLaX3E8Gj1EBVTe/D5JaLRF/TC8WKRO/O/VglhbyNU/dz8EEoq4m7Es+3EgNj/qxsiu0mxrISrAQF7pPvgRw6/QbGgUUGKw8AcqrMacztmwsPEaqBMc90FXZqpTdZn53c4b9uhL+0HHXuvQcZ3U4/cTyCyi+MC9lVXuZYgoGApKVzZ3iH9gPoGl62li64AYGBWM5FRiVNW2+1PUHNsun6/bdR8uSAWhn/Ql4tMc8vJIUamREtZCYTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj6wpVxJbXSSTMghaCwK4PU3+NRflPe7NST2umUPqDU=;
 b=ixBqUvNIMnrdmBryD6HS8x5A8qli1NktEuM+mj/CjwDOECGHNDnWbdxpGb0N5rFJ04ab5zee9jPt4KRgW6AOkps7bZ+CGgkYyHWQ0QsfYY4pZRSOu/KRNyWJ5bPrw2mXeIZw5rZ6WnV5MjuKZ317TxFvhOEBk3MA/3/rIhXKdD4M0l4+4w7HI11Wuzn9jWEs43VvshdAcO2fIldek1ybgrw83gmusb5FnltLIUwzveGcLyDDnocw9M/0Ni97cjaWyVZ3nKYS5d25QcURJ6qRfxCnRNPW7UPlE1Jv0GyF6FSJ6uiVwYXOYI8qllZscxzJ80RpDtWE4RryXgUthq82sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 20:13:39 +0000
Received: from SN7PR11MB7592.namprd11.prod.outlook.com
 ([fe80::3e09:8700:df72:37b6]) by SN7PR11MB7592.namprd11.prod.outlook.com
 ([fe80::3e09:8700:df72:37b6%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 20:13:39 +0000
Message-ID: <56f5f3da-31b8-4847-b274-ce140bf39617@intel.com>
Date: Wed, 6 May 2026 13:13:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v3] e1000e: Reconfigure PLL
 clock gate timeout and re-enable K1 on Meteor Lake
To: Thorsten Leemhuis <regressions@leemhuis.info>, Dima Ruinskiy
	<dima.ruinskiy@intel.com>, <intel-wired-lan@lists.osuosl.org>
CC: <anthony.l.nguyen@intel.com>, Linux kernel regressions list
	<regressions@lists.linux.dev>
References: <20260417104330.3031987-1-dima.ruinskiy@intel.com>
 <b60a7ab8-dbab-4684-abf4-4dd2a9024f8d@leemhuis.info>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <b60a7ab8-dbab-4684-abf4-4dd2a9024f8d@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0086.namprd04.prod.outlook.com
 (2603:10b6:303:6b::31) To SN7PR11MB7592.namprd11.prod.outlook.com
 (2603:10b6:806:343::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7592:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b4abe3-9e6a-48ad-35d1-08deababf649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3pFnqhfpgdAvZ1zOAC3QbW2jEMgVSsDOiWp1ElAYsngZiDI6TpY8HppG6wie9dTRk8wQYjktWNmaazWcn7dBTE6VQDhebzOYUZbZvQswoO09rbnE2TIROhyzsPvf24pqFn022Hz5oWyqg0wOVf68JHb/PbafrbM9NIziWcp1HxMkYvi0EJ1lV1Wf9jEHbm0pKKUTjwLBIoC83tWx2NYBwKi7S3TkdkjOstZl7id4nHTu7vYOn20RwUCxog+hqQEm850lhqq17l7F+Zl6I1ljmXzdKpmbW29ap29jr6IaHmJWKCO6RqxTt3oyOTN/IQXnzkN7Q2QhsSAntpSXY7RQD6Z+EGCNLSJst5eLATcBaNsTI7DWtt2ZiuU8L9yifNa/bsiPy3eirR8xhazUZSyXwuDIHuum+6wAUuA9JbBXVUi7zKZnTQ3TUqvmRpkPUfK6cQArO0tNNgNd7U847zT8/vxj+3dWvqDU4WO/49C7PygG1uXWth+12/wFSISxyXzSsVawS0hJKehdRywyON+I27L7zbeRVaqlXby1d70AymDRuE/FPXtUi/JOhEYE0ECFQ+rsSPZOZ4HJzofT1uzABajCda8tD6nkOKnHVpCsv4nLSbBOSccUFtYu9ONechl9dPDFhly0OFqK24uQLgwk5t+pVMz4I/MdE41ut0ihIDm2gUc6w3+YqWINlNlYZW0J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZBdXZTbkVVQlJvUitHU0JRN2J1Wk9PKzh1dFFvRnErZFR1V1Z0VnVNd1BF?=
 =?utf-8?B?MWpnZUlnQm52eVRCRjZHeFl1RHdVc3llWEd0azg5WUkxbkpEb3I2VXpJOWFW?=
 =?utf-8?B?NVJHL3phd0ZPUXM0RDE5TUJxbTAxQlR6Ri9hRk4xZVZYb0YzdTRoSGtFWWRo?=
 =?utf-8?B?VTVFUFVCMWxROFV1V3JNOXpBN2hIcXZ4SVVwcUZ3VXJNWmNpRG50NFdsMy9K?=
 =?utf-8?B?b1dvSXBpWUpaNUg4WGFPMHdqbEc2R2JaMTVUMkMrRVJMV0I2UC9BRlV4c1ZK?=
 =?utf-8?B?QWIxYTA1blV6cURaaVkyazFvZm93Y3NIWGR2cVpRcDRWMVczZHVtQmZnK0Z2?=
 =?utf-8?B?UWpvRGNQenBKQ0s4S0cwbFV6b01kZGdVdFNmcmlPb1BlN2V2ckV0d25od054?=
 =?utf-8?B?VkJwbTFZdnJ4dWxPcnEzOHhTWU5GMmZwSE9SVzVST3laWmptMFNlZWZuV2hk?=
 =?utf-8?B?NFMySGZoYy81cDE3VG5MQldyaFozenJ6dk1HUXBkRFpZOWp1MXRSWXlySE5W?=
 =?utf-8?B?cmJTSndOTnNIYi9NdEIyeGs0UWhEY3JYSGdoZDdsT2R2MEkxM0N5OTNBWFhn?=
 =?utf-8?B?TmJ4T25tY3NoL1pJV3d1Z1QvV3ZTU2pOQS81QmNBSUNNOGlFQU41bTliTFhH?=
 =?utf-8?B?WTVPMmZKR3pVRzFTSVBId1F2N1RGREY3S1MrOE9HdER5MTAxWU9ubGdYUzBr?=
 =?utf-8?B?ZEVMWUc0dlhpRHE4VGlpTXNpNzZJd01JdXVzcmMrakEveFEreFhBNlB3SXJ0?=
 =?utf-8?B?NWl4K0lyNlhORnRFRkRpeUxIbGpNZXI4WkdJbGEvTHV5SXhkNjV5ZWJhV1k4?=
 =?utf-8?B?bEhpcEExRnJ6Nk9CdlVuc0N1YnM5NXI2bUxBTGM3d09ndms1VGNQdUg3NlZk?=
 =?utf-8?B?c0pFM3pLKy84NFBXeFdlSmpUeWRVbWhsZkZPK0V6M1Rta3h1cGhUM2ZJTS9X?=
 =?utf-8?B?dzVUcWRTbzNIUUYwRjhRbVVNTmFDWlJtM1VMbGIzWWpnZGN6enVvN0EvK2lT?=
 =?utf-8?B?U2UxazU0bE1XcVNrYnY2S0hsTUorY2svMFdkRkp3MDhMWWx4YVpPN1J4eVpM?=
 =?utf-8?B?QURVOFdudTZjVzZ0V25vTktwb0tFempuamxBZ0pvM3VvRWJ1ajNFL2hlT3lY?=
 =?utf-8?B?YVRGVExqa1NpdFVWaXN6d0hTS3IvSHBTZ2ZwUlYrMXp1UTY4Uk9KN3QzMnAv?=
 =?utf-8?B?Q3pEYVdlWlhTcnRMT0FCRHkvRkFGT3hRUHg2eXR4bzRwMFdKRktCcXBBY2Fv?=
 =?utf-8?B?Y1RGeW1zMVFFVHliWXFUQUJpUlIyQm12R0wyMmhKWWk2cCtZWjM4bDZXbG5Y?=
 =?utf-8?B?dlA1dEpLVk53NjA0TnJtMTRUbGlxZXBlWUoyNnArSGp0dVpBVE5sZENTMThh?=
 =?utf-8?B?elk2TFBMS1BLL01YY3lxSTlkcVRNVDkwdG1qZ25ZelhpMTVMcUp0NFZIUXUy?=
 =?utf-8?B?SnNuNXNjUWpWOENDZmg2KzJuKy9jcFhFWTkwb2E4ZmVpdnp5VVYzQkF1cnIy?=
 =?utf-8?B?WEpiT3pPaXFIZVF6RjJXZ25UV0JUTXR5RzVJYzIvczI5YVU2S3hoME8vdzNp?=
 =?utf-8?B?YUcxTTZ5U1dLTDc2d2NHeGhBVGtVNU9VRldSMnlQWjlXb2NhWGdMamhEWi9I?=
 =?utf-8?B?bWxwU1JsWTJ4dmZwZnQ5d3JVL3J1a2ZwSXN6aG5kV1VUM2d2ajJVKy8yUFZJ?=
 =?utf-8?B?dFlKOUpUOXBKVldLOHlyb2Y2N0hHQUovR29EVno1d1hETDBnRnFVTGhXSnE2?=
 =?utf-8?B?TUJNR1JycVczNmx2Ulk1TDFad1FERWhtb0dNUVA2cjRJVTY4WDBRcC9sdXZP?=
 =?utf-8?B?ZnltZHJkL2hRRzZmYTFNNUt4cDlGOGN0QXpHSkFLT1I2dUs5UXEyczBuWjFT?=
 =?utf-8?B?RUdBMC9Ldzl1TEV6d080MUFqR3FEK3RpMmRpWGhxQmpFWlNJVGJ6MHUrV3Rk?=
 =?utf-8?B?dEVaRmo1QkhITXlWQ1hORzZFcTMxdFJtQmJtWVBuc2JXeWR4Y3UxR0NZTUk0?=
 =?utf-8?B?WURXbmI5TFN6OUJWamRhVjVjd3ViOFpXdVpTajEycytodmFCQ0NHUWIrbzQ0?=
 =?utf-8?B?YW8xM0d5enFaelAwK0ovZ3QvREVGMlE1bk5UaUhzbDZla3Bwd1hLM0V0MGd3?=
 =?utf-8?B?Q2J3S1pyeElrV2dwVXowcDBNdVFrVFN1WVhJSHVxNmdOSDVvbC9CdE5RM3pQ?=
 =?utf-8?B?Z0k1M1ZBS1pHNHpHSTlObXJHUFVzTUFWMTl5a0JOMFdHQWRydGx0RnZCTjRS?=
 =?utf-8?B?bzBPMkN4ZWxRTHBNYjBTZTlZVmJ6V2d1cGR3azJ5ZE4vM1ZrOFpER2NNZkVT?=
 =?utf-8?B?aG9RQi9RalUzcVMzUEFsb3AyOHMyUDRRNDRua0xNU2c5VVVUNkVZYzdnb0NU?=
 =?utf-8?Q?tLAC2SCE+sEx+nZE=3D?=
X-Exchange-RoutingPolicyChecked: F+4ymyTpWbmoW7gswr9NBbRpcmkmdnT7B9B7+tGpgBnMFbw3XTie+owoCRp3wK0XP8QnpOX5C2hnf2PgdZrm2fs2RjhrW7KevCHWBzgT32t61uPlZnfz06IusmdPShK/R/dq7mqKRvW96oOIymMDu6ZuUkub7suybf8o8l+KSnV370RdrxQDaVZOPhCuaTrO9YMGOrqBavDDsSbYvifGQgvF6IoPgQXEmPWMUXD/zxlxwGGrhp1Q+Y2L/YjaP0EZrI09jvNm4oLk1pM/z85cPrn0zXqScD3LWJK/9ziE+0kqlALuzUkARSyxsLSDH4Bb/T8W+jNVLp7paNYb7QRKnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b4abe3-9e6a-48ad-35d1-08deababf649
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:13:39.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozdDWj1w5eOp0xovyXBOdf57FGn162B84EWPj0nWL4Dbf+3vze0WAmBBg7Ap50P3644BuRowcx5JTQFNJGEwGJOFNtZmCCUCvX1N7UkRURc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
X-OriginatorOrg: intel.com

On 5/6/2026 2:59 AM, Thorsten Leemhuis wrote:
> On 4/17/26 12:43, Dima Ruinskiy wrote:
>> Commit 3c7bf5af21960 ("e1000e: Introduce private flag to disable K1")
>> disabled K1 by default on Meteor Lake and newer systems due to packet
>> loss observed on various platforms. However, disabling K1 caused an
>> increase in power consumption.
>>
>> To mitigate this, reconfigure the PLL clock gate value so that K1 can
>> remain enabled without incurring the additional power consumption.
>> Re-enable K1 by default, but keep the private flag to support disabling
>> it via ethtool. Additionally, introduce a DMI quirk table, so that K1 may
>> be disabled by default on known problematic systems. Currently, this
>> includes the Dell Pro 16 Plus, where the issue has been reported to persist
>> despite the changes to the PLL lock timeout.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220954
>> Link: https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20250623/048860.html
>> Link: https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20260330/054059.html
> 
> What happened to this fix for a regression first reported in January? It
> looks like it fell through the cracks. Or was some other solution found?
> 
> Ciao, Thorsten
> 
There has been a bunch of back and forth discussion and varying versions
of a fix for this. Its still in the Intel Wired LAN queue, and is
currently waiting for one the E1000E team to report testing completed.

Thanks,
Jake
