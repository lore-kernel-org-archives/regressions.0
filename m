Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DA23A7
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648150585; x=1679686585;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RDKHcFdrqv4vBLCrap0UDNiX6mFmUMfzwMpGWHAc0B4=;
  b=PEABOouB10xBblMJm7PUudgIt3vHzi8VB4yYhdhLjOpwvEUawJl4b/9X
   e4hJucPnGDRSXud25OP+nqNN+Ew//B1UaERPaAudFH8UMOMfMDRe8i/Mi
   hPGrWJ98GSqzup6eYL91dHKghz6coWuqa+PI5HLSfOypCqckbwxfa+AIO
   pfjTRCfKe0hSGczEK7ekC87YIjZIAHO2AHIxSNmUGrmK/CGLS1DjF71wI
   pJIRocoXd9Rx3/F1RjKUKAdjGJQ7u3DeUUkg7EZZlX9T6xrp9VW54K0la
   ipnW9Al3zkvcsNE1dHiw40V9FV6eGRtQypAW7bpITQQ1DpXPjXVdgFItS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="239074275"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="239074275"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 12:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="544785982"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2022 12:36:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 12:36:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 12:36:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 12:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1w9JgB4ub56ICnlboGItVIcjIMVXV7WjzfMT+nVuhzC1AbzRJyV9EyjnZh4eE84P7Y2jNjmjWjyO4C+5UFLnFT1XTZuZ/aZ5hoPWM07LIDPFETJyXgOkEM1Op00ZqgGyOyzZuwnnmTehlmZ2SfE2yVUuC3HHQ6RrGFuwydO3jouDHZbaEtj5Zy3nvEjqMO1sOJFzgnHz17hqusnTYFTxUXDEuejOcyqDmzP76QF5ktE6jxL6mtP07WCFP0p3lCzXbp4W8a7AQW1Fmus9qTMdnNeLDvE6hVXKXWcescHRFs0ZuEtCdZXzbtatYttzJPKavoI6pzMCOV3l9W0wbWg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq5lcaeHZK+jVASWSE95LaUhwVxwWgiPXSosyTrGkdE=;
 b=LM1y00KHUWio34Tqkxz5Ri4GFoBtYF31r0wNHOEovk7zQ/Kphj+OYwOFTyWevaQPfJxYCb+LiO3+UQC2paF/oPFBvPX7PJZt8pteEuHCXAGONpxPFqKVypSwzqs8aTyGW1tBQ9y052mftgU2YvT8A723AoMQDFQvU8hA6REkeniq27+xgcGPY2c/ER03VU+857/QZcsXDicW/N03J32w1+5PoymSoeNx3WnsHxU5OG14MEjX6QopAq/x+vSiMvJ3BhOEO2UnYvtNv0ReS5CZoZ5PMEbRKb5WaNwy2oIbDM3z3MOSkmV+cMfNlodT6CIoZ7Uh4sxHgjuo0IQjUf4pYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.21; Thu, 24 Mar
 2022 19:36:21 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::d171:52df:cf0f:c1b1]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::d171:52df:cf0f:c1b1%6]) with mapi id 15.20.5102.019; Thu, 24 Mar 2022
 19:36:21 +0000
Message-ID: <d25169dd-02e5-73ad-3873-eec374697233@intel.com>
Date: Thu, 24 Mar 2022 21:36:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: Bug 215689 - e1000e: regression for I219-V for kernel 5.14
 onwards
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>, "Ruinskiy, Dima"
	<dima.ruinskiy@intel.com>, naamax.meir <naamax.meir@linux.intel.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	intel-wired-lan <intel-wired-lan@lists.osuosl.org>, James
	<jahutchinson99@googlemail.com>, "Neftin, Sasha" <sasha.neftin@intel.com>
References: <6801d0ef-9620-0f61-c107-c2c5524952ef@leemhuis.info>
 <1e0558eb-b1f1-edb5-e554-a41f2c160401@intel.com>
From: "Neftin, Sasha" <sasha.neftin@intel.com>
In-Reply-To: <1e0558eb-b1f1-edb5-e554-a41f2c160401@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0087.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::20) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01355181-9720-4ddd-05ea-08da0dcd92c8
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5939:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5939031DDF48369C8E86736397199@SJ0PR11MB5939.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QIrxXGvQpl8Y3VLMWJ2M9YjcFLWlLUmfVmRLgXi0RogOLLd1D2djdeT9Pg6cvYuN11mjqk9Qh1qLIkr1xNSk/CrnmdWLE2n9Q0sZoK9GzJ4gCv1NXpQt/0rnfQ84YKB2E4O47e3bMFpYTzKQXEyjveqdvMiscpBTEK2I9+KMvtejbqFZtAGk6oUM2l3Aw5RetU7WHYzw8420OC4+blqVTmlR9PlqU4zyXNVHIuDgnPhU7lT96aL7UbHgw+l738Vz+Hkyu1/aAuLwTcoclM9R3YGN/D5i0E4zajL1WMc4B9vplqW5RuwtqAqmUMYM+Q9d8e1sqgsFxuP9dv0JBDp0EyuxlH7eW0DMkFWRf4mtKd+ZMdHu7O8mDGwCAwPB55ASh3Y04H0WGSxT7KRYMRsIhRwVvL4zbrOb5AHuiFfdlX/OL4I/XSJuXKttxGZd8WgkqNbxOuKXsWKw6UeHtqEvHKqdFSUGawkjEva0VZxtI2QhcRcqhUUKyabssNHfWmRgIXGa+AsPfG8x63kabiEEZePxIw50fmLl2JXPk+iMQErGDD2ZLKJC/8AYXx6lArvr9rpU7qufTHn3GV3tAnLTviUJJUx70vpv8fQueGBEFKT6uSrDmHhW3xycb58AyKu4t/BkM5mavNTPvf4M4rYzf4mSyAs3MQwrVsgk+cufGOtWyJMO/OU3RnZvnMfn8H7w8TfJ+nAB+bhj8jN6yCWeCRfSJxZ6KZFHnlCbE7l2cSONdA0Nlo97rdojlg1+oFrHZt6F7772A0AdjeQoqLxMCpJNK9nHgD3ZnU3QHcJ/BY++LToL0HZZsH4at7Dw7XP7HDPRffHZ2UOYOJCoFR+ySw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(2906002)(66946007)(8676002)(66476007)(82960400001)(66556008)(4326008)(86362001)(38100700002)(31696002)(508600001)(6512007)(36756003)(83380400001)(966005)(110136005)(6506007)(26005)(186003)(6486002)(53546011)(316002)(31686004)(2616005)(6666004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBoT1BIeVovVm9UMmxKbmswY1N2NjBvd1JnQjlxa3Nid2ZNQURjbldVTk5U?=
 =?utf-8?B?bVI4Tk9ZdjlUU2NIQlBsUTZjeWVha1hta3NtL1MvN3c5d0ZUUFhrR1J6RHp5?=
 =?utf-8?B?dmk2Y2F4czJLSitjQjdxL1QvTzNJaWVEVGJoNlpjMzBLWkhpT05JZEMyUWlk?=
 =?utf-8?B?UE9JeVdmbVFEcXhuSDJlUkQvN3pyV3RENGRoSXZ4MXZVamY0QllLUmJOemVu?=
 =?utf-8?B?aEd1S2pkdUM0d1JNOGNGVWw4UDF1Q3UvZEJ4Wko1OVUyTHY4Y29VeDRwZnNy?=
 =?utf-8?B?dXZJd0Z5YUtuK0NoV0ZsYitYdmV4b2gzaXdiejErMU9lbjJwWUJDREoxL1RK?=
 =?utf-8?B?aGo4SXE0bmRPQ3k5WU12cWl0cnFJaHJyVThRTlA1OFRDZ1BXeHFzZnpuSU5W?=
 =?utf-8?B?NjNvbnh6Y0J4WlJpYy9aWjN4Q2tNalUxYzNkbHJKSWRLbC9lVC94UWJyaENU?=
 =?utf-8?B?aXBEYWFrM1R1QWphSDVuUnhhdDBtTXNjWmd4NW9RdzFuaUVnMU5kL3dNbDRE?=
 =?utf-8?B?amN0aWVKVENxb0Z3Zno1SEt0cU9EUVBwN21LWVZJTUI1dWZqL3R4YlVieXFN?=
 =?utf-8?B?MDZiTFdhVFhOZmVMd2hMKzREaWN1ODU3MFpscEtVblE1RzRhOFZMb1hEN0tp?=
 =?utf-8?B?Zi96ZTJleithTEFHUU5ubFdOS3RIMlZSS202bE9FLzh1Mm9aMnptQlNvQjRN?=
 =?utf-8?B?N3d3RU43VUNWeUdUTHRNSXNEcjg5ZzhmV09rNThvUnNGL0VRa0VmRkFENnJV?=
 =?utf-8?B?b1FONjgxV3VYYlB2RWFiZlVUeFp2S1JTcWgwdmFYRUdHeWtwQ3VlbjhBanVq?=
 =?utf-8?B?dG1tV2x5dk5UZThqNk5YaTJnbW92YkQvT2Fud0pWeWdOaVBuQW4vVlgrQnlk?=
 =?utf-8?B?eEM1SjRQWmJIWlR2dFErZnZoMjJvSXBlOU5RNXpKckZqWk5EZld0Q0twdVM1?=
 =?utf-8?B?U2FLUkR1V1BmeXcyQUJUZDdLa2NWcUxneGRqQW55djZGSVkyVFA0RUZ1VjV0?=
 =?utf-8?B?TmpyQ1dtOEg5VVJyejB4SndjcWc4aXpNV05JR1I3bmlaai9rQUFQU1QxNitX?=
 =?utf-8?B?cHVoZzRZU3RsVFlpM3piY2xCUFJxdDFrTEJkMG1rcmRFZ1p2RytQTlQzdTNG?=
 =?utf-8?B?cWZuSU5DWjlxWG5YT21rWi9weHFNTVljWEpoVEFhU2tkMjBiZEszZU13WXZV?=
 =?utf-8?B?b1V5R2drZW80OSt4K3BjUFQ2dHRaeldzRWdvemJHM2tnQXlKY1MvdElNZnhh?=
 =?utf-8?B?RHZ3N2tJWXlJcjN0SVFvayttcDhHY09ZZG81QzdCMGVIelBVZjZlbytRRHc3?=
 =?utf-8?B?ZGhZWEZHYWF1SVZPT2lKNWN5R0E3eWUyb2Z3bml5TlVkTVNFMS9kUVZ1TjBa?=
 =?utf-8?B?QXNjNnJaVWRUS0xCQ09RaWZrbVlFcTBPcEJ6NGxuSXI4S1BFelBJRG1aZnpP?=
 =?utf-8?B?MDlIL0V4eElDQU0rN0EydExianRqbjNvUUppbDAvRWVSLzlBcmpjMWFYRmpq?=
 =?utf-8?B?blEzVndxcUpWcVhOQmE2ZjUzc2lVUzBGRHlZSHJqVEVDT0RSUVVrdHVWTjhj?=
 =?utf-8?B?TUt1SXYzalo3M2NjbzEzbGhKMTJGVG11Z0x0cis2Q2N2bTRVWWJmZ252TjJq?=
 =?utf-8?B?VTFWVFlzVmRNNFlsWFI2VmFHaVZwTjE5cU1qNi9KcGNIRlZnUFpSZXRIRUN1?=
 =?utf-8?B?cVFUc2MvakltK1h6cE5VMWdYbDRLQ0ZlYTdycVJmLzgxUDlQZnpxTWl5c1h2?=
 =?utf-8?B?V2lURXVCQ0VzU0p0QWIwZjRvTUluclFQYk1nVFV0ai9WYng2K3ZKdlRtQ2RT?=
 =?utf-8?B?K3dDVFNpeHJkdFVzTmpDMHNHdUFhMXZsNi9sT2ZKSkhjQlNFbDhBUHpqVW9U?=
 =?utf-8?B?TUF5b3F5dXpCb0JtTTByOFpQODdQZjlmUVRxenhock4zK3BibFRxOVZ2YTl5?=
 =?utf-8?B?NzhvVFQwQklSNFZ2RTczNWpobmtkT0NzUi9NWWhjb0Q4S2ZjZnVIZ09XK0x2?=
 =?utf-8?B?N1NnWnVXbDVnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01355181-9720-4ddd-05ea-08da0dcd92c8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 19:36:21.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWp5mRJBE5YPpWonHMn7usgTDLrcdWhG7q/0FaQ1IFbEFOyyA22XXeB73gYGACYXigXrq2rPV/WJAzZXEYqBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com

On 3/24/2022 17:09, Neftin, Sasha wrote:
> On 3/24/2022 12:37, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org that afaics nobody
>> acted upon since it was reported about a week ago, that's why I decided
>> to forward it to the lists and a few relevant people to the CC. To quote
>> from https://bugzilla.kernel.org/show_bug.cgi?id=215689 :
>>
>>> [reply] [−] Description James 2022-03-15 13:45:38 UTC
>>>
>>> I run Arch linux on an Intel NUC 8i3BEH which has the following 
>>> network card:
>>>
>>> 00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection 
>>> (6) I219-V (rev 30)
>>>          DeviceName:  LAN
>>>          Subsystem: Intel Corporation Device 2074
>>>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
>>> ParErr- Stepping- SERR- FastB2B- DisINTx+
>>>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast 
>>> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>          Latency: 0
>>>          Interrupt: pin A routed to IRQ 135
>>>          Region 0: Memory at c0b00000 (32-bit, non-prefetchable) 
>>> [size=128K]
>>>          Capabilities: [c8] Power Management version 3
>>>                  Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA 
>>> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>>>                  Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
>>>          Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>                  Address: 00000000fee003d8  Data: 0000
>>>          Kernel driver in use: e1000e
>>>          Kernel modules: e1000e
>>>
>>> I found a major regression since the previous few kernel versions 
>>> which causes several odd issues, most noteably I use the machine to 
>>> stream live tv via TVheadend and was finding this to be unusable 
>>> (picture freezes and sound breaks up very badly with continuity 
>>> errors in the TVheadend logfile).
>>>
>>> I found the issue was introduced since the 5.14 kernel, and have 
>>> eventually got round to performing a git bisect, which landed upon 
>>> the following commit:
>>>
>>> 44a13a5: e1000e: Fix the max snoop/no-snoop latency for 10M
>>>
>>> Indeed, if I revert this single commit then the problem is resolved.
>>>
>>> To help diagnose the issue I applied the following patch to capture 
>>> the values of the lat_enc, max_ltr_enc vs lat_enc_d, max_ltr_enc_d 
>>> variables:
>>>
>>> diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c 
>>> b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>> index d60e2016d..f4e5ffbcd 100644
>>> --- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>> +++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>> @@ -1012,6 +1012,7 @@ static s32 e1000_platform_pm_pch_lpt(struct 
>>> e1000_hw *hw, bool link)
>>>          u16 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
>>>          u16 lat_enc_d = 0;      /* latency decoded */
>>>          u16 lat_enc = 0;        /* latency encoded */
>>> +       struct e1000_adapter *adapter = hw->adapter;
>>>
>>>          if (link) {
>>>                  u16 speed, duplex, scale = 0;
>>> @@ -1074,6 +1075,9 @@ static s32 e1000_platform_pm_pch_lpt(struct 
>>> e1000_hw *hw, bool link)
>>>                                   ((max_ltr_enc & E1000_LTRV_SCALE_MASK)
>>>                                   >> E1000_LTRV_SCALE_SHIFT)));
>>>
>>> +               e_info("e1000e: lat_enc=%d max_ltr_enc=%d", lat_enc, 
>>> max_ltr_enc);
>>> +               e_info("e1000e: lat_enc_d=%u max_ltr_enc_d=%u", 
>>> lat_enc_d, max_ltr_enc_d);
>>> +
>>>                  if (lat_enc_d > max_ltr_enc_d)
>>>                          lat_enc = max_ltr_enc;
>>>          }
>>>
>>> With this in place I see the following in dmesg:
>>>
>>> [    3.241215] e1000e: Intel(R) PRO/1000 Network Driver
>>> [    3.241217] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>>> [    3.243382] e1000e 0000:00:1f.6: Interrupt Throttling Rate 
>>> (ints/sec) set to dynamic conservative mode
>>> [    3.749009] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): 
>>> registered PHC clock
>>> [    3.824751] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width 
>>> x1) 94:c6:91:ae:b3:7b
>>> [    3.824765] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network 
>>> Connection
>>> [    3.824849] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: 
>>> FFFFFF-0FF
>>> [    6.949327] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc=2233 
>>> max_ltr_enc=4099
>>> [    6.949331] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc_d=58368 
>>> max_ltr_enc_d=0
>>> [    6.951165] e1000e 0000:00:1f.6 eth0: NIC Link is Up 1000 Mbps 
>>> Full Duplex, Flow Control: Rx/Tx
>>>
>>> Notice that lat_enc_d=58368 and max_ltr_enc_d=0 !
>>>
>>> lat_enc_d is greater than max_ltr_enc_d so it's setting snoop latency 
>>> to max_ltr_enc (i.e. 4099) where it would have previously been set to 
>>> 2233 in this particular example. This seems to be where the problem 
>>> lies.
>>>
>>> Prior to commit 44a13a5:
>>>
>>> if (lat_enc > max_ltr_enc)
>>>    lat_enc = max_ltr_enc;
>>>
>>> After commit 44a13a5:
>>>
>>> if (lat_enc_d > max_ltr_enc_d)
>>>    lat_enc = max_ltr_enc;
>>>
>>>
>>> I'm not sure whether it was intended for this new code to take effect 
>>> for an I219 since the commit message on 44a13a5 indicates it was 
>>> aimed at I217/I218. Seems strange that max_ltr_enc_d is getting set 
>>> to 0?
>>>
>>
>> BTW, that commit is from Sasha Neftin.
> Hello Thorsten,
> I've expected follow decoded values (link 1G)
> lat_enc: 0x000008b9 => lat_enc_d: 189440 (1024*185)
> max_ltr_enc: 0x00001003 => max_ltr_enc_d: 3145728 (1048576*3)
> 
> scale 0 - 1
> scale 1 - 32
> scale 2 - 1024
> scale 3 - 32768
> scale 4 - 1048576 (nano s)
> 
> I've separated calculate:
> e_info("e1000e: 1* max_ltr_enc_d: %d\n",
>         max_ltr_enc & E1000_LTRV_VALUE_MASK);
> e_info("e1000e: 2* max_ltr_enc_d: %d\n",
>         (1U << (E1000_LTRV_SCALE_FACTOR *
>         ((max_ltr_enc & E1000_LTRV_SCALE_MASK)
>         >> E1000_LTRV_SCALE_SHIFT))));
> I would expect:
> 1* max_ltr_enc_d (value): 3
> 2* max_ltr_enc_d (scale): 1048576
> and so: value * scale
> 1048576*3 = 3145728ns
> 
> Please, let's check it. (I am wondering if over-calculate it)
> Thanks,
> Sasha
ok. Overflow... Instead of
+       u16 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
+       u16 lat_enc_d = 0;      /* latency decoded */

Should be:
+       u32 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
+       u32 lat_enc_d = 0;      /* latency decoded */
I will process the patch address this overflow and some e_dbg to 
eliminate calculation.

sudo cat /sys/kernel/debug/pmc_core/ltr_show
SOUTHPORT_A                     	LTR: RAW: 0x0 
Non-Snoop(ns): 0               	Snoop(ns): 0
SOUTHPORT_B                     	LTR: RAW: 0x0 
Non-Snoop(ns): 0               	Snoop(ns): 0
SATA                            	LTR: RAW: 0x900f 
Non-Snoop(ns): 0               	Snoop(ns): 15728640
GIGABIT_ETHERNET                	LTR: RAW: 0x88b988b9 
Non-Snoop(ns): 189440          	Snoop(ns): 189440
XHCI                            	LTR: RAW: 0x891a 
Non-Snoop(ns): 0               	Snoop(ns): 288768

>>
>> Could somebody take a look into this? Or was this discussed somewhere
>> else already? Or even fixed?
>>
>> Anyway, to get this tracked:
>>
>> #regzbot introduced: 44a13a5d99c71bf9e1676d9e51679daf4d7b3d73
>> #regzbot from: James <jahutchinson99@googlemail.com>
>> #regzbot title: net: e1000e: instabilities on I219-V for kernel 5.14 
>> onwards
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215689
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
>>
> 

