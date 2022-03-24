Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D841FA1
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648134605; x=1679670605;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xxUYAU/CzdFyFfAygDLP5lZMo0E0mebdUJ3Cm2f1y7s=;
  b=V5yloXm/9tgXW7WUnJMW/PQJbN976wAnMLgpqShz2eS6Xn2DdUXbh0vk
   yeit9m/rT0l9uTn241F3XaDU6Bx18yq76LbbmYQNw2pEOtHPgE92CALib
   r8m8NojRDxkCUwDP2kEgMobbZqmKuPK7d4daCyb4sVjCAc9b4gmLnK7Tc
   tgM35WiySvHgVX5bfHn3BmULnGdbSRNFMdU104gja76STExClIWKXHJDd
   SFH9eA7bd8Xw62e5psXW2TGJFQUA+qcy6gdq2FRVjxDIZsXMcUHrk8qv4
   kx7ugyWXMP9MQwZjqu2hIHBFGrwkEUGCDEniNdjHO3+NTrc80aBfK9OJg
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="319108696"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="319108696"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 08:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="544683611"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2022 08:10:05 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 08:10:04 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 08:10:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 08:10:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 08:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsARimxkbqmJEDz45QaynDn8vxZ3fZLKqQhWnBruQMMXIfJEXPXnEbTSBvOr8/G4tNCfdpVQ0f/1nCId39N1e2Ynuwp7t/4oVMdTXJMF8x828Z05nBr4/Or0Yzg4XP+saLOD4YzhcUKsZw7QG21FaZWzsOOUTJr4k7xyLlxcew3qZ71wY7/TazAXfCOdfW0fhHjEEuWw5LCzReMDPZHOEMn8bCm0tIbHUubN2GRsUhx4rbF09ZcyRVF3Wpe0mwr0rCqqecYYXsgeJc1RDRVDOaNM3q4eG0c/IP9DarfOgNMNaaaOu8JTLWVkc4rtKzdZPy8TR888ntW5rqsXeOnVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRPHTsSmYhJHPgSmFRQNAslyYyUH1WmXpVIbYj0vmi0=;
 b=YrQKv+7lvTlfJQ4mLWpA18UCpcXMBLYDCVK8eWJyViijFiHUfRiMU8AEpGxw+huMzsmewFBbNdyM2Wz3c644rIhKKcKaJcgJR6FlJeNqB6X0lx5Jdzd6ulopgSb0On1J2O9SqkkRZc/uO9fzxTL2VpABfG8imhwa403Y/EGAvfgwib4JX2WFcI//bXtU6ESvuhY9JY7fYI5HCb4C9gl3yVjvpaUw2UtM86dFjYI1MC4EHrSCRQRHhnNXn83fXwqCmZ24SZrBn4UqSzAD/2nTQzfAfnDoDC4F83EBwA/F+JohNWzcyNNBk3yinAs9bsFkZAjDil/RDqgzy/wA5D+bpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MWHPR11MB1760.namprd11.prod.outlook.com (2603:10b6:300:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 24 Mar
 2022 15:10:02 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::d171:52df:cf0f:c1b1]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::d171:52df:cf0f:c1b1%6]) with mapi id 15.20.5102.019; Thu, 24 Mar 2022
 15:10:02 +0000
Message-ID: <1e0558eb-b1f1-edb5-e554-a41f2c160401@intel.com>
Date: Thu, 24 Mar 2022 17:09:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: Bug 215689 - e1000e: regression for I219-V for kernel 5.14
 onwards
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>, "Ruinskiy, Dima"
	<dima.ruinskiy@intel.com>, naamax.meir <naamax.meir@linux.intel.com>,
	"Neftin, Sasha" <sasha.neftin@intel.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	intel-wired-lan <intel-wired-lan@lists.osuosl.org>, James
	<jahutchinson99@googlemail.com>
References: <6801d0ef-9620-0f61-c107-c2c5524952ef@leemhuis.info>
From: "Neftin, Sasha" <sasha.neftin@intel.com>
In-Reply-To: <6801d0ef-9620-0f61-c107-c2c5524952ef@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1b369f-8389-4ae7-aac3-08da0da85e5f
X-MS-TrafficTypeDiagnostic: MWHPR11MB1760:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1760AE54A5F5B0FA4240B65697199@MWHPR11MB1760.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPkvvebtBrp0RicuOk6EOA7IZwDFVXAZq0NBEqtbeoyoyvIMrJRUE0wtYn+8HKNUbGcJ5bcreLqAwt8OCOeiw4RRKfrESzsCoE5IwY1ceq1bHmXAYXgA7GeKc3Vymd3raYtuap4C1ZQHZFsbNVAAXoKe+AbutJpNKoYKsfpqgOgZqJd2KwNCsN2BBb7gfouV3SnHl4V9BJTPNpnCktK9EEvbP7VD6Gaxx5Wx9HzMCvY/oGhk49qYW169gImmCF99kndqO5X+dW0u4fNKCR6x/e9d8SvyO/JlGcSBOFHZtkj/RQX3fU/B6frZ1WQ/s/YeJg+b9oPGYdu8OiuxEBiySzndgY/PdmmbOp8w9cQuFtQIRc9REbtPuOT2ExRzxzYEK45ugzByC/vuIRMted33P1qpbTXhXCY5CpFCkVkerAK+nDxHiAG9bD6oEnQXgzbAYrVPLRkLm4oFtvxm/IQW4eRaJb3BBdKi9lyzFUWW5/JtQsgIPuNHQYUCm216g/AnCKOn0ya78qA5ViaDOgmve0TFibGRbXJQWyapwXsbc2Wqs3QEUuNjNEk5wfA0SNyN/buhJo6fRoeBDpyWcAqLxbk9OYzXMIRQ4HU/+O5jAX9b885P9Dgj9cKoNt8+oBCR+1c7X9VfXiezPO7Hh59mLt8eh/JIfm5tQQHKTYQ7yc+1dRV9hdCy9eJUppLVWJB8PldzcXsUEzaL/yQnc5eWFhdo77uKQbi1B8wARmeNOmFmkmol0Un/iSqWCJfBi4ZmGl+a2p5qFLr486geVDF9cxsyMTVPbNr78IiiZJERgnF9XEkYF9RRRDBxGEuswMxJQE5zY1dOvDwX+1PFnXzBsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(83380400001)(4326008)(8676002)(66476007)(6486002)(966005)(508600001)(86362001)(53546011)(6506007)(6666004)(31696002)(6512007)(2906002)(8936002)(186003)(5660300002)(26005)(2616005)(31686004)(316002)(54906003)(110136005)(36756003)(38100700002)(921005)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5tUHl3Y0pkYS9mZkpYQVQ4ZTJOWlkrOHZqN01KRWkrbzA0SjVsbnJDUm5M?=
 =?utf-8?B?Vm8wdW9qVTVEcldtY0p0YnhoZ1g1RTlyL2h5Skl5VnZBcFd2TU5kRGZVRWxi?=
 =?utf-8?B?QWhaRzFPNDBVZ1pEQkY2a0QwOGZvYzZjQVdYaURmSnRCaThONVRtSHZvZ2Y5?=
 =?utf-8?B?VjdnMWRUbm5UZkNsNDBDNGtBV0lYdThLLzJIelJYampzNG9pRCtxamZEL3pF?=
 =?utf-8?B?YUV3cGhOT1NJZVk5aWdTWTJ6Q2JWbFBlL08ydVNsQm5ndE1YODB0SnlpVlc2?=
 =?utf-8?B?Rk1aZ2JmNExTQVl6MjVVdzloRGVTeHMyb0dHanBzK3p4QW5XL1NHMjFyVUhZ?=
 =?utf-8?B?cHcxS29MZXRMVEI1V2ZUYWh1V3RJcitWQTc2OUNHTWdlWEREK1g4M0dLQUpN?=
 =?utf-8?B?aUg3dytiVlllb1F4c0VSbmRxeExySkdIeTU5eVlkOWZST3dUN0V6bzRPSFFo?=
 =?utf-8?B?alR3UTBaTk5hcFpLYUtQVmVwdFJGakVoQmtkZDZ6Rmk5QzEzQVduci8rNTZt?=
 =?utf-8?B?TXFha3BhOTBxOFVFYW83aFhzN3RCQ3RycDhvVWEzbngyWWZ5VFVnS2dydmpp?=
 =?utf-8?B?dVRRV296ejZ2OTRrQWp0ZlJWZEthS0IxVVpBOXp1b0ZvSnh2T2ZlWTN5cEIv?=
 =?utf-8?B?OWZncHdTd1Y1eHF4SVVpRWtSdy9KbGxlbUY3N20veW1ETzBSSzdhS1gzRXJN?=
 =?utf-8?B?SjQzZ3plY3N5TzZVN0E1ZUZETTMwRlZGTlkwNkEwcHhTZEc4WXhGSExaWG50?=
 =?utf-8?B?cDRSaGxEY1BEL292eS8zY29WYnlPTkZ4SXlnajMyQ01OdU1wKzBEQXhQUFNz?=
 =?utf-8?B?RVhpK1AyVXdTU3dPMHpvcUhTcVRieDNXNzhNcWQ5M3Z0MHBPU3FEcUQxa09v?=
 =?utf-8?B?MHRoY1F1ZWFMOXMzS3RoSVVjbzAraUcyaEhFT3dsZk15Qm1nc2VXWmhVSEsz?=
 =?utf-8?B?L0NQSHlQVlZ0bUE0dExGeTdBV0tEWG5QNmY4dmttYnpNNUZja1dUcWt1TW5m?=
 =?utf-8?B?cnFyWW9MbVFnNGYwUG95OC9TaG9KUlNjSWxnN2JKc3cyOVVlcXMxU2N4RnY4?=
 =?utf-8?B?REROVStxRlZ1U3NDcENvWVZwdGV3MXdFVUN2RnN0ZFZYYU03anFNcWk4UkVa?=
 =?utf-8?B?SnMvbGExTUtRdHMrZmMrbFdlS2xoTmVlVnY5TTU1YXVoZXIyVC9sOVo1TUtV?=
 =?utf-8?B?TDBDRUJDazlzMTVCOTdISnBXaFhPaGJrMnpIbVBlRzRhRVRVQmNwOGN5cGpX?=
 =?utf-8?B?K0dsNHdqck5taFNIaXl0dmYyVGtWZWtnZzRyL3FuT2RWazdUQWQ3WHJYaGVG?=
 =?utf-8?B?c1hVVndXRi9hMm5vZGxmajk1UlZRR2M5UXFRS3g4cWgrUEU1eVplamJQV2U4?=
 =?utf-8?B?b0wzSVV0TWJDc2EzNmxVK1N0UzVHM2lTRTlVaklmdnpvbEhsazR6VURxU3BX?=
 =?utf-8?B?a3EvRllTNE9oemdQTHBWMVJDNUtrSDhIVzlKQWsvL0FXamJDTkFNbFZLd3Mw?=
 =?utf-8?B?dFJzTlBPa3hVbGRMSzVHZ3RHVFVsbHVoWnZGcEEyR3F5Mm15TnZ2cG9RUWll?=
 =?utf-8?B?RzZTY3BtbEFYa2wzS2R6MFlNZUhGekpNMFl0SHBYaTBraTVXZ0ZnUTkxYjhI?=
 =?utf-8?B?eWkwc1pZdDJEeEZPZkFVTmJkQWVoMkhWUUEyYmhsT1VrNElxNCtXYUFhZDlL?=
 =?utf-8?B?U1o5eElhRXZVWklhaVZHTE9SaTZOSVp3ZUxJSE9vSXh3RDZHY244alBLdEFh?=
 =?utf-8?B?T0RNeHIwN3cyZURxU0JKRnNDZXB5MUdRb0VTRlh2aEJuaVNMa0lGek5GSGp5?=
 =?utf-8?B?b3Z2Z2dsREF3dHo5eTFBT0Mvdy9rSU5KcHpEZ0VBUzRxUWNOV09IazYvTG1p?=
 =?utf-8?B?L3NJZDlUL3ZRcUZDaUZDU0Uvd1FvTm9SNzBsaUorcHlmZGNuS1JVMjk1alM1?=
 =?utf-8?B?c09OandULzk1Ly9PZ3VVV3dhZ0hYRnVtRE5FMEJSTHNnVTVKMHU4OE5lcmN4?=
 =?utf-8?B?QkpESDdHV2pKa084ZTc0cU8yaVljcEpJY0EvSlpqellzVDRwdWpTODVRZzdY?=
 =?utf-8?B?VzhIajlwQTVDNWVJYVhVZm9rN2I1MEMzd09JUDZOMVhmNkE2bSszcC96Sm9E?=
 =?utf-8?B?MG0wSm5rdjNDTzJYQ0RPaXI1NFBGOS9BMWUwQ1NvUi9vK0pGdmorbEU0S2Zy?=
 =?utf-8?B?b3d3UzVicmYxd2EzMnI4azV4cG5hdTNiZ3gyYmZFNUh5N3BYQTlDeEl3aTdO?=
 =?utf-8?B?aHBzbFA5NC9QYzJrUmJ3THpWcW9SYjFoZXB4c2lvN2ZNNWVaQy9iejd3bEpm?=
 =?utf-8?B?NHFIeHNpMEJ5U3VXNlhjQzN1aTdqQlZmbWI2N0djcVd2QXNSUWRRdmY4ZzVo?=
 =?utf-8?Q?BjOaiIr1SGy2eOT0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1b369f-8389-4ae7-aac3-08da0da85e5f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:10:01.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mblQSvLemFJnX0Rd4Bl0RiVPiNkEq3G6RNlZiLwPwgZWiMxt9YtEQDBpBv6BiGE7DcIUj2vc46ATlh/NfejYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1760
X-OriginatorOrg: intel.com

On 3/24/2022 12:37, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and a few relevant people to the CC. To quote
> from https://bugzilla.kernel.org/show_bug.cgi?id=215689 :
> 
>> [reply] [−] Description James 2022-03-15 13:45:38 UTC
>>
>> I run Arch linux on an Intel NUC 8i3BEH which has the following network card:
>>
>> 00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (6) I219-V (rev 30)
>>          DeviceName:  LAN
>>          Subsystem: Intel Corporation Device 2074
>>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>          Latency: 0
>>          Interrupt: pin A routed to IRQ 135
>>          Region 0: Memory at c0b00000 (32-bit, non-prefetchable) [size=128K]
>>          Capabilities: [c8] Power Management version 3
>>                  Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>>                  Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
>>          Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>                  Address: 00000000fee003d8  Data: 0000
>>          Kernel driver in use: e1000e
>>          Kernel modules: e1000e
>>
>> I found a major regression since the previous few kernel versions which causes several odd issues, most noteably I use the machine to stream live tv via TVheadend and was finding this to be unusable (picture freezes and sound breaks up very badly with continuity errors in the TVheadend logfile).
>>
>> I found the issue was introduced since the 5.14 kernel, and have eventually got round to performing a git bisect, which landed upon the following commit:
>>
>> 44a13a5: e1000e: Fix the max snoop/no-snoop latency for 10M
>>
>> Indeed, if I revert this single commit then the problem is resolved.
>>
>> To help diagnose the issue I applied the following patch to capture the values of the lat_enc, max_ltr_enc vs lat_enc_d, max_ltr_enc_d variables:
>>
>> diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>> index d60e2016d..f4e5ffbcd 100644
>> --- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
>> +++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>> @@ -1012,6 +1012,7 @@ static s32 e1000_platform_pm_pch_lpt(struct e1000_hw *hw, bool link)
>>          u16 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
>>          u16 lat_enc_d = 0;      /* latency decoded */
>>          u16 lat_enc = 0;        /* latency encoded */
>> +       struct e1000_adapter *adapter = hw->adapter;
>>
>>          if (link) {
>>                  u16 speed, duplex, scale = 0;
>> @@ -1074,6 +1075,9 @@ static s32 e1000_platform_pm_pch_lpt(struct e1000_hw *hw, bool link)
>>                                   ((max_ltr_enc & E1000_LTRV_SCALE_MASK)
>>                                   >> E1000_LTRV_SCALE_SHIFT)));
>>
>> +               e_info("e1000e: lat_enc=%d max_ltr_enc=%d", lat_enc, max_ltr_enc);
>> +               e_info("e1000e: lat_enc_d=%u max_ltr_enc_d=%u", lat_enc_d, max_ltr_enc_d);
>> +
>>                  if (lat_enc_d > max_ltr_enc_d)
>>                          lat_enc = max_ltr_enc;
>>          }
>>
>> With this in place I see the following in dmesg:
>>
>> [    3.241215] e1000e: Intel(R) PRO/1000 Network Driver
>> [    3.241217] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>> [    3.243382] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
>> [    3.749009] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
>> [    3.824751] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 94:c6:91:ae:b3:7b
>> [    3.824765] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
>> [    3.824849] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFFFFF-0FF
>> [    6.949327] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc=2233 max_ltr_enc=4099
>> [    6.949331] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc_d=58368 max_ltr_enc_d=0
>> [    6.951165] e1000e 0000:00:1f.6 eth0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
>>
>> Notice that lat_enc_d=58368 and max_ltr_enc_d=0 !
>>
>> lat_enc_d is greater than max_ltr_enc_d so it's setting snoop latency to max_ltr_enc (i.e. 4099) where it would have previously been set to 2233 in this particular example. This seems to be where the problem lies.
>>
>> Prior to commit 44a13a5:
>>
>> if (lat_enc > max_ltr_enc)
>>    lat_enc = max_ltr_enc;
>>
>> After commit 44a13a5:
>>
>> if (lat_enc_d > max_ltr_enc_d)
>>    lat_enc = max_ltr_enc;
>>
>>
>> I'm not sure whether it was intended for this new code to take effect for an I219 since the commit message on 44a13a5 indicates it was aimed at I217/I218. Seems strange that max_ltr_enc_d is getting set to 0?
>>
> 
> BTW, that commit is from Sasha Neftin.
Hello Thorsten,
I've expected follow decoded values (link 1G)
lat_enc: 0x000008b9 => lat_enc_d: 189440 (1024*185)
max_ltr_enc: 0x00001003 => max_ltr_enc_d: 3145728 (1048576*3)

scale 0 - 1
scale 1 - 32
scale 2 - 1024
scale 3 - 32768
scale 4 - 1048576 (nano s)

I've separated calculate:
e_info("e1000e: 1* max_ltr_enc_d: %d\n",
        max_ltr_enc & E1000_LTRV_VALUE_MASK);
e_info("e1000e: 2* max_ltr_enc_d: %d\n",
        (1U << (E1000_LTRV_SCALE_FACTOR *
        ((max_ltr_enc & E1000_LTRV_SCALE_MASK)
        >> E1000_LTRV_SCALE_SHIFT))));
I would expect:
1* max_ltr_enc_d (value): 3
2* max_ltr_enc_d (scale): 1048576
and so: value * scale
1048576*3 = 3145728ns

Please, let's check it. (I am wondering if over-calculate it)
Thanks,
Sasha
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
> 
> Anyway, to get this tracked:
> 
> #regzbot introduced: 44a13a5d99c71bf9e1676d9e51679daf4d7b3d73
> #regzbot from: James <jahutchinson99@googlemail.com>
> #regzbot title: net: e1000e: instabilities on I219-V for kernel 5.14 onwards
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215689
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 

