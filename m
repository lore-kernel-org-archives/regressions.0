Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711BED1
	for <regressions@lists.linux.dev>; Sun, 10 Apr 2022 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649582807; x=1681118807;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qQg0a0NODuW6CVMkUnC7O2q80L5D2NhbDL9dgb6ySkw=;
  b=SGYI9unclEGfIgiDggVssD3mj868PVLFxFPfFS8O14n6cu/HBuB9yCLy
   pcyFbftSTXLAVtViXZ8/zlzh6beHJS5FoXWxcbD9Hppg+mMIwJLd7Gsbf
   4zaceX3yPs987rYLo9dxWdpAZHc5Tm60aChxT+QLwbf4U3H8KUGZIp0uY
   kl/Ll+JamsVz2x7hX2RTJmb0YCFQb+HJESL7iqo3qcqnU3jdOQWqjDn/Z
   Gwkq7T0A4rpicRAGRjJuIp05VR0kPmrc8GgEbcsPRwoU5TUBj3XCORHm0
   A8vf6FxxIv1bhv5E+EdU7Pd5eT00cocFsOQAMQNNqW4e1r/z9BZu+oYY5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="261395191"
X-IronPort-AV: E=Sophos;i="5.90,249,1643702400"; 
   d="scan'208";a="261395191"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 02:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,249,1643702400"; 
   d="scan'208";a="589427983"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 10 Apr 2022 02:26:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 10 Apr 2022 02:26:46 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 10 Apr 2022 02:26:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 10 Apr 2022 02:26:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 10 Apr 2022 02:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWwl+5J09ywgeqhp+YQ5gwGw+yfqz9w8B9ZLQQyBwWaNPwwg9AS8DqZzdK6e2DeQVxPOSNih8bSrO9x88WuF05LZmer0NAjKVI98Pp4sMA00KCvFr7kdv3k+1OnGz9KNfiO2KDB6zdX4s5qdP+y8QisgRF5zC7QFc3SUOjMBoev8T5GT47glqtwHFpY73ouMqET58V283m6adZ3o9Iv+IBan0s4dypcgZqO380COG/XqXfMY5zrQWSm8bxsWcRCojtQqsmCn123AECLH8BLUivZCaHwByvtV8sXDMZOsYR9MPl7u+zixavNU+cbRPBP0U63CDpZTlGIQ7L0WNy11Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR3kw+4V/C83yKVrqjjOgDQyfe7sjaE+Qvtwh15Mdqw=;
 b=ku4Y1QRL0TUT1nER6UqbeJdsIA3DYmJr4SiAdebY6s+EYwLeQXbfrZJ3nhLbdbkSqIuMgvtFtq39iMzz8soUNcCoIjpu8Uu8AConh8IhkzHLrJ1bFQuo5pJY76f27lVG+zj9eOKoKCvzLziF3zjrawyzQ9D9R8kyR9T4zDkli585ATOy70Io11MOU0nAsaOeLupoPZhDjB2KI2UaWaoacmMA2Z8dwEXGMxKQJAGF82hH0+YMbo0Q12ltOCGZK2Ga/Wja9H7wrEOTLDID9ovMjXVKdgdYntjySYOBy11dCIezPF52RLxso58F2XVAoE/HEPopY9lW1kCJCiZSIeU+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Sun, 10 Apr
 2022 09:26:43 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::758d:b6d0:2a6d:54e1]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::758d:b6d0:2a6d:54e1%6]) with mapi id 15.20.5144.029; Sun, 10 Apr 2022
 09:26:42 +0000
Message-ID: <b63584c0-aa7c-9252-f3ef-7ddc857ad5ae@intel.com>
Date: Sun, 10 Apr 2022 12:26:32 +0300
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
 <d25169dd-02e5-73ad-3873-eec374697233@intel.com>
 <46696877-3dc9-0600-9a8f-eda42d029cd7@leemhuis.info>
From: "Neftin, Sasha" <sasha.neftin@intel.com>
In-Reply-To: <46696877-3dc9-0600-9a8f-eda42d029cd7@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::32) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c8a277a-9597-4336-de38-08da1ad438cb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB41508BDEABD5D049F064EBAC97EB9@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ETWoZBF+fDGoMcjIrHsDr8PEnbK9Rzm/sn69jroJjolSwxO7xJ4LC7oKhSImqpOass3SRBkCJKCkxFhY3a2s0mCOUE9b+yqKmNAkEafWZ561OZ+88couObI7P0ZLml16dhYxxR3ZFSPaRkPROY0WhW2PVFgh6HTLp4qmXP1+jwdeEMTRFcafDAhEUhR3QlarQkrdzij19IXBqYGiDwChqhNHAfzIN2i9HKi/eVve2HQi69nAuFs41P0tdHhDMYtgFGta0yYyO4CglZcMopBIT5PMDjd+udX69KZM46i/NYolOqr4eyZlJKZhfon9vRxANazGgP1X4+CnUvkbWS5x8n+cL0exU/697d2ca2HEPgcxQu1YqKXZr+/O7ShQXmZeji6CYiWj6UdbmB6k+fEtIuun6d2xo69i0P6pFkKMaPgDuiLY+PD+3D6aYAzKojR7VIbc52uLA+nl4HTj0q1k8mFnttGAhZqkxUEdmjUz03r4ZWbgbMWFrYfpZYl+gfCkGeauTzQ4bqtYxmZ2HQSSeJw+m8kW7Tfy1hwaht8E/mNGglm10zPYdbVxXOnZOS8yzixqNEHfF+2w23EVN4mjOv/arAD7kP1kw4sMr2Fqaw/zpww+Jtuf5cl22sOsb9eMAkQqSAnM9GioByoHPOVyJ/OB0QNkSjE42VzYHqCHIyTQh/ItGoeRhTSMEMSX6Y9eQYCtnxrsXZnRT20bapXfdzMe1aEBQrwnWVK7fyI6zStbbSUkKAhBW2L0VqldtA/8PUoSIHtFyuFcwiDe8cFpyqB8ecRFMkSgaWF811l29RJABGL2Ry26X9q5tYgrlxFCSZTDf7uMAprwZS83ehUMtgF69Tk/H+2Ec+LOYa/KCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(8936002)(6486002)(966005)(26005)(186003)(5660300002)(2906002)(36756003)(31686004)(316002)(31696002)(86362001)(66946007)(2616005)(4326008)(8676002)(54906003)(66476007)(66556008)(110136005)(6506007)(53546011)(82960400001)(6512007)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkgzZ3hKSDdxVjYvbzhPTEJvZjVjcWR1bXcvRGMzRE5IaDllOGUvaEs4eUtj?=
 =?utf-8?B?ZmMvbVl4d0JZMjd4cUt6MVY0elFQcGJVUmtwMkJTbjFHUWFCQWMvS1pIS1I5?=
 =?utf-8?B?YXpvOEFMWlZJbk8wbWJCOWFORjNieGgrQmpxeXhJMmcvdFhuUCs0RXVFSGl2?=
 =?utf-8?B?MU5HVVFIdHVoNjJ2Rzk2alk1b254NmhiZkY2QU9PUFI4TytTWGlGTlJXNHlZ?=
 =?utf-8?B?cnpTOC9VVXdod1cxdEJscDNpNDh2YkVQVFRSWXkwWFBkeDRMSHc1OVNHdlZk?=
 =?utf-8?B?YXBEbFFZTWlSTXFna2d3b1VVeFBtVUkxSWM0UDNSdW0yTXJhckZiaWZZRkZE?=
 =?utf-8?B?YzFPVlRZazIvZkNOTnpybHM4UGpJT2ZwRVZMWHdkYXhkbWxaTStWSmhjRG9y?=
 =?utf-8?B?enRPZ2Jvd1FNRnREdk9Mc1RzK0duVW91NzMxQVN5Mk02aVIvRWtoNDkzUFFu?=
 =?utf-8?B?MlBPbDVKQnhWd3B5aXZXWHRBTnlyUHNDTzZIbGpNMmpodnBTMERDcUlWNWo2?=
 =?utf-8?B?MVA2ZzNWc3FjSjNacS9jcVlhaUhsNUlReS9OQmZZRG9NRlFyWURxKzVvMFFV?=
 =?utf-8?B?OEJidGtRU1FadkJFeXc1SS82WFlCS2FvSENRZStoaThDaUJnaEJUZ0VZRGxZ?=
 =?utf-8?B?Uk9TVmdGUjgwWER4eDhZQzV0eXpneTJwSHI4U3VnVVorMGlEM01IbVRZVnF3?=
 =?utf-8?B?Y3MzWEdhK2ZlOFVRTUZxV1JOZ0RzUmdUL3o3ZU9USk9VWGY4V3lYMEphRksv?=
 =?utf-8?B?bCtzSUVraGRMeEhqeUVUQzZYeE1ra3NHUENEVWRmeEpqOHRVaWMxV1QvdWFV?=
 =?utf-8?B?QlNvaVhXM3VYSUc1eTFNWFZOUW1kRWNTK2pyczVOQzR3NWNEcmtLdSsyYmx6?=
 =?utf-8?B?cSttbjBCWk5KNFVFdUtCRDZhTjhRK0JBbi9qSVFvNGJFaGltMTFoMWNFZG5T?=
 =?utf-8?B?dU1xR1Nnb1dRTEFnOTZLclozdm51ZTZydXZoSXgwalhIdytHaXd1YUd0a1g5?=
 =?utf-8?B?KzJscDVvcWZENjNONStHcVdwL1c5a1hKdG95WUkzZ25UZTh3RStOZjNKaHFx?=
 =?utf-8?B?RVlnQUcyQk5VbGVsRmw5bVpJYUlnQmx2bUw1OG1TQVpvNnNxdXFNSWpGcEZt?=
 =?utf-8?B?WlhabEFzSWtIWGh6MU5FT0lOeXpCU1M2T0NwbzArRG1zcjBNbG00QVVPTVBi?=
 =?utf-8?B?UmhNTSsySTlDL0ZKc1RwM3B1MFBqVEVveG1Fb0dJZWViYzVQYkhXM1lzV1Ex?=
 =?utf-8?B?UW8wbk9Qa2tFOEwwbzFlS3pXVFh4aWhqYi9wMlYwMWlkYjN3TUNVSjdKK1U3?=
 =?utf-8?B?NHFTZlRsS28wYlo1VWQxNUUwMjNJREtvYXZuVjJzeDVXQlRnK0VkaHNvcjJ0?=
 =?utf-8?B?WDM5NzJPSE54cnVqZTBPOGFsRzdVbFRWQzlBekpMOGNyTGs4YWRldEJUQmVh?=
 =?utf-8?B?MmIyTG50RFY2YU1PeUZ1MjI4NWQxRHF1NFBEMEJDYmV5aERsa3RNUDJDOEpB?=
 =?utf-8?B?RlJEWDR4ZFZNV0I4aXB6RkFlK3hVRkRMUkQ3Qzg0RXRYRWs5djByelZjNWJF?=
 =?utf-8?B?MWdVSGxzRWxldVk5UTVmVlFCSUsvVmFqTWJvN0c4TUlrbHQ3TDZOMjNvNTFo?=
 =?utf-8?B?b28rd2IwR0U1OHlIVnRwb3NhQ1R3Y0d4MlVMRnpiYXpZSUNRUFcwUFB5dEtS?=
 =?utf-8?B?UzhWNElrOUE0U04vd2NNbzMxVUNFU1BwWjlpODJjcXQvS1kzMUdabC9OVEZk?=
 =?utf-8?B?WVRkUmNOS3hGRkQxdU8raFg2dUhSNzN0TnRLeUw2eDJRZkpuRTlPWWQ4NHNN?=
 =?utf-8?B?RVNIZ01ob05JT0t2SENCRlBPQWg1bjh1d3lMNVdqQjBOY09mUzNGS2kyQUd2?=
 =?utf-8?B?eXREaGZHeU9YR1cxTUc3R1B1a0xFUkhtTVlFb1hvaExmU2tlck9oNVoyQmh0?=
 =?utf-8?B?SFF5b0RRdlpjNG01WHRzSUpPeDE0L1YwNjl4NEl5TUhGaWdqWko2YUlNYXRH?=
 =?utf-8?B?NUIwYTN3VisxdVVkelQ1eE1QNExGUCtCVmlQaGpUYTUxdG16eWluamE2Mmkv?=
 =?utf-8?B?U29LWWVXdWNEcEZUSVYrcTNKRmJ1VFAxaFpFRE44NklyQkorN2VYemZpLzFK?=
 =?utf-8?B?UzBNQ2xHRHVFQlY1UzJlVGxqNFlyM2h1dDU0RkN1RG5iTk9JVzJlT0lOcnVX?=
 =?utf-8?B?UWU1VFRUV242Q3dMU0czVklhVi91bjN0Ny9SMHpDSHo1aG5wdnNrTW1NWnZo?=
 =?utf-8?B?MGRBN24zMC8vd3FhRS9lWHlIN2s3MjdwTkVmN2JDaXpaaU0zL2xCRGdQcVQy?=
 =?utf-8?B?TUNxbjkzYVp2VGhqY1RESDdZYnh6cUlDcGJjMG82VXFYVGdCZG5VNWxsWWM3?=
 =?utf-8?Q?HXN+x0R70Bp6e2PE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8a277a-9597-4336-de38-08da1ad438cb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2022 09:26:41.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvRtrChBr9VMRztHAIsESsuGcC5EN1utydVUBpXrLfcv4IoOAtGzaPz0On+0OgVHyvjXb83nxJkxTjTAK7CUkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
X-OriginatorOrg: intel.com

On 4/10/2022 11:21, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
> 
> Hey Sasha and e1000e developers, what's up there? Two and a half weeks
> ago it seemed the root cause for this regression was found and a
> proposed patch to fix it was added to the bugzilla ticket and even
> tested by the reporter. But since then nothing happened afaics. What's
> up here? Or did I miss something?
Hello Thorsten,
Patch submitted to the IWL:
https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?h=dev-queue&id=7dd121b8d5735780b6a70db735d44b3e5b856130
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
> #regzbot poke
> 
> On 24.03.22 20:36, Neftin, Sasha wrote:
>> On 3/24/2022 17:09, Neftin, Sasha wrote:
>>> On 3/24/2022 12:37, Thorsten Leemhuis wrote:
>>>> Hi, this is your Linux kernel regression tracker.
>>>>
>>>> I noticed a regression report in bugzilla.kernel.org that afaics nobody
>>>> acted upon since it was reported about a week ago, that's why I decided
>>>> to forward it to the lists and a few relevant people to the CC. To quote
>>>> from https://bugzilla.kernel.org/show_bug.cgi?id=215689 :
>>>>
>>>>> [reply] [−] Description James 2022-03-15 13:45:38 UTC
>>>>>
>>>>> I run Arch linux on an Intel NUC 8i3BEH which has the following
>>>>> network card:
>>>>>
>>>>> 00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection
>>>>> (6) I219-V (rev 30)
>>>>>           DeviceName:  LAN
>>>>>           Subsystem: Intel Corporation Device 2074
>>>>>           Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
>>>>> ParErr- Stepping- SERR- FastB2B- DisINTx+
>>>>>           Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
>>>>>> TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>>           Latency: 0
>>>>>           Interrupt: pin A routed to IRQ 135
>>>>>           Region 0: Memory at c0b00000 (32-bit, non-prefetchable)
>>>>> [size=128K]
>>>>>           Capabilities: [c8] Power Management version 3
>>>>>                   Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
>>>>> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>>>>>                   Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
>>>>>           Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>>                   Address: 00000000fee003d8  Data: 0000
>>>>>           Kernel driver in use: e1000e
>>>>>           Kernel modules: e1000e
>>>>>
>>>>> I found a major regression since the previous few kernel versions
>>>>> which causes several odd issues, most noteably I use the machine to
>>>>> stream live tv via TVheadend and was finding this to be unusable
>>>>> (picture freezes and sound breaks up very badly with continuity
>>>>> errors in the TVheadend logfile).
>>>>>
>>>>> I found the issue was introduced since the 5.14 kernel, and have
>>>>> eventually got round to performing a git bisect, which landed upon
>>>>> the following commit:
>>>>>
>>>>> 44a13a5: e1000e: Fix the max snoop/no-snoop latency for 10M
>>>>>
>>>>> Indeed, if I revert this single commit then the problem is resolved.
>>>>>
>>>>> To help diagnose the issue I applied the following patch to capture
>>>>> the values of the lat_enc, max_ltr_enc vs lat_enc_d, max_ltr_enc_d
>>>>> variables:
>>>>>
>>>>> diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>>>> b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>>>> index d60e2016d..f4e5ffbcd 100644
>>>>> --- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>>>> +++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
>>>>> @@ -1012,6 +1012,7 @@ static s32 e1000_platform_pm_pch_lpt(struct
>>>>> e1000_hw *hw, bool link)
>>>>>           u16 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
>>>>>           u16 lat_enc_d = 0;      /* latency decoded */
>>>>>           u16 lat_enc = 0;        /* latency encoded */
>>>>> +       struct e1000_adapter *adapter = hw->adapter;
>>>>>
>>>>>           if (link) {
>>>>>                   u16 speed, duplex, scale = 0;
>>>>> @@ -1074,6 +1075,9 @@ static s32 e1000_platform_pm_pch_lpt(struct
>>>>> e1000_hw *hw, bool link)
>>>>>                                    ((max_ltr_enc &
>>>>> E1000_LTRV_SCALE_MASK)
>>>>>                                    >> E1000_LTRV_SCALE_SHIFT)));
>>>>>
>>>>> +               e_info("e1000e: lat_enc=%d max_ltr_enc=%d", lat_enc,
>>>>> max_ltr_enc);
>>>>> +               e_info("e1000e: lat_enc_d=%u max_ltr_enc_d=%u",
>>>>> lat_enc_d, max_ltr_enc_d);
>>>>> +
>>>>>                   if (lat_enc_d > max_ltr_enc_d)
>>>>>                           lat_enc = max_ltr_enc;
>>>>>           }
>>>>>
>>>>> With this in place I see the following in dmesg:
>>>>>
>>>>> [    3.241215] e1000e: Intel(R) PRO/1000 Network Driver
>>>>> [    3.241217] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>>>>> [    3.243382] e1000e 0000:00:1f.6: Interrupt Throttling Rate
>>>>> (ints/sec) set to dynamic conservative mode
>>>>> [    3.749009] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized):
>>>>> registered PHC clock
>>>>> [    3.824751] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width
>>>>> x1) 94:c6:91:ae:b3:7b
>>>>> [    3.824765] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network
>>>>> Connection
>>>>> [    3.824849] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No:
>>>>> FFFFFF-0FF
>>>>> [    6.949327] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc=2233
>>>>> max_ltr_enc=4099
>>>>> [    6.949331] e1000e 0000:00:1f.6 eth0: e1000e: lat_enc_d=58368
>>>>> max_ltr_enc_d=0
>>>>> [    6.951165] e1000e 0000:00:1f.6 eth0: NIC Link is Up 1000 Mbps
>>>>> Full Duplex, Flow Control: Rx/Tx
>>>>>
>>>>> Notice that lat_enc_d=58368 and max_ltr_enc_d=0 !
>>>>>
>>>>> lat_enc_d is greater than max_ltr_enc_d so it's setting snoop
>>>>> latency to max_ltr_enc (i.e. 4099) where it would have previously
>>>>> been set to 2233 in this particular example. This seems to be where
>>>>> the problem lies.
>>>>>
>>>>> Prior to commit 44a13a5:
>>>>>
>>>>> if (lat_enc > max_ltr_enc)
>>>>>     lat_enc = max_ltr_enc;
>>>>>
>>>>> After commit 44a13a5:
>>>>>
>>>>> if (lat_enc_d > max_ltr_enc_d)
>>>>>     lat_enc = max_ltr_enc;
>>>>>
>>>>>
>>>>> I'm not sure whether it was intended for this new code to take
>>>>> effect for an I219 since the commit message on 44a13a5 indicates it
>>>>> was aimed at I217/I218. Seems strange that max_ltr_enc_d is getting
>>>>> set to 0?
>>>>>
>>>>
>>>> BTW, that commit is from Sasha Neftin.
>>> Hello Thorsten,
>>> I've expected follow decoded values (link 1G)
>>> lat_enc: 0x000008b9 => lat_enc_d: 189440 (1024*185)
>>> max_ltr_enc: 0x00001003 => max_ltr_enc_d: 3145728 (1048576*3)
>>>
>>> scale 0 - 1
>>> scale 1 - 32
>>> scale 2 - 1024
>>> scale 3 - 32768
>>> scale 4 - 1048576 (nano s)
>>>
>>> I've separated calculate:
>>> e_info("e1000e: 1* max_ltr_enc_d: %d\n",
>>>          max_ltr_enc & E1000_LTRV_VALUE_MASK);
>>> e_info("e1000e: 2* max_ltr_enc_d: %d\n",
>>>          (1U << (E1000_LTRV_SCALE_FACTOR *
>>>          ((max_ltr_enc & E1000_LTRV_SCALE_MASK)
>>>          >> E1000_LTRV_SCALE_SHIFT))));
>>> I would expect:
>>> 1* max_ltr_enc_d (value): 3
>>> 2* max_ltr_enc_d (scale): 1048576
>>> and so: value * scale
>>> 1048576*3 = 3145728ns
>>>
>>> Please, let's check it. (I am wondering if over-calculate it)
>>> Thanks,
>>> Sasha
>> ok. Overflow... Instead of
>> +       u16 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
>> +       u16 lat_enc_d = 0;      /* latency decoded */
>>
>> Should be:
>> +       u32 max_ltr_enc_d = 0;  /* maximum LTR decoded by platform */
>> +       u32 lat_enc_d = 0;      /* latency decoded */
>> I will process the patch address this overflow and some e_dbg to
>> eliminate calculation.
>>
>> sudo cat /sys/kernel/debug/pmc_core/ltr_show
>> SOUTHPORT_A                         LTR: RAW: 0x0 Non-Snoop(ns):
>> 0                   Snoop(ns): 0
>> SOUTHPORT_B                         LTR: RAW: 0x0 Non-Snoop(ns):
>> 0                   Snoop(ns): 0
>> SATA                                LTR: RAW: 0x900f Non-Snoop(ns):
>> 0                   Snoop(ns): 15728640
>> GIGABIT_ETHERNET                    LTR: RAW: 0x88b988b9 Non-Snoop(ns):
>> 189440              Snoop(ns): 189440
>> XHCI                                LTR: RAW: 0x891a Non-Snoop(ns):
>> 0                   Snoop(ns): 288768
>>
>>>>
>>>> Could somebody take a look into this? Or was this discussed somewhere
>>>> else already? Or even fixed?
>>>>
>>>> Anyway, to get this tracked:
>>>>
>>>> #regzbot introduced: 44a13a5d99c71bf9e1676d9e51679daf4d7b3d73
>>>> #regzbot from: James <jahutchinson99@googlemail.com>
>>>> #regzbot title: net: e1000e: instabilities on I219-V for kernel 5.14
>>>> onwards
>>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215689
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>
>>>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>>>> reports on my table. I can only look briefly into most of them and lack
>>>> knowledge about most of the areas they concern. I thus unfortunately
>>>> will sometimes get things wrong or miss something important. I hope
>>>> that's not the case here; if you think it is, don't hesitate to tell me
>>>> in a public reply, it's in everyone's interest to set the public record
>>>> straight.
>>>>
>>>
>>
>>
>>
Sasha
