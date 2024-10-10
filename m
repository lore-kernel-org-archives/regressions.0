Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC84594C
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728526998; cv=fail; b=dyPU1eZetcalr/pztzDpJB2lSUhALkj28WO9grlC5/wxk9sdEou1pKtvx3nhtLZifZ6jTrQBEKaM9e9xPitsyUdjoe8++DsS5QISRdEKGdR2nUVGj4mTx0jZqmSJlLvlwy3qAY359g7n3BcbajOO+4/fFt7qbwdcF0sJNkxZN3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728526998; c=relaxed/simple;
	bh=hfRO3Rs8npazua3zk+Eye56fRuEgMz6bis/6hTcz1Bw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JfSiDmkjNT4pWxr/zgbKMdNCJzOJL9wmRyNUyGx7EISguNLCcQdu41YyvFZgyXrryDc9PxIjzQasmu77oFGhRlrUj/G8c5dqsp5zYWmHk6gt8GHPyu4qfTpPsyfxfv4Mv1kggiq9TS7H9ljh96KY/OLRMRb/V2ojBswimu0MP0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=joB5Lwy2; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="joB5Lwy2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpZkrAND7/6719qpF2xR0yhlF3k3syrm/kKZ3kvu4+xnFcDowNrCetZ/DZJl38Wkc8ah45ri0UvcQ1lPaR+7G3jS9llPBTNBk3NWpA9aOBzAU7tWS/63nfm8WzK/05ldh+VhlqioxQOZ5ct18+fKhhsqHq0SuTYy3JePlbFrecaehfH/sPcpyp85RlDs/fCP2SQMhLLMY1V48t0Z5s0f0d2sllDgUvMaXuS0ho2x/3Yiz8SFqT4Ldg3IiK7WhitwgrtGcRWl/vqmWb+ZFEgeapUv97Ozi2eH378XkpxSpc3BYOIKJXCG4j8GqJ4gk9MmB6eS1oBmOkmXTiK4NnBpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUSA/hkxFIpjqj8/wqOXBAnsxQT0km9ePskSMFV9Byg=;
 b=STyFxIYFY5qrmxJcfilHgb2Ox7xBc49na30sGqIR1zGyYM1rIFC9ZjRC9pbePQOtHYPw8Uw2RES5ILAGmlw+34144fW3rB/WFA2XGcshgyAqIJKcb+ucqF7gKtd7NKNXbA4Ysrf1EnFgU7X7yqwWYnajzoBj93TjDae4TIKy7uFKOo1axpLwuO93BoRZ4SlLzzrpgw7yMwrPgJ5UIjg89cSLtCJxj0Fvwu9PMLDKHHVoH3UJqOHI4cFTNZyQyHfRM2JrqlHgC1zkg2wFTSO//XdqoBxr1zzJQY8jDM3Otk5K8eqVxgxST9Pc5vHVW47rDL1TOFSeJuOreEvgyLbixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUSA/hkxFIpjqj8/wqOXBAnsxQT0km9ePskSMFV9Byg=;
 b=joB5Lwy2Rm1Jd86slEs97LMuG8BDQadpjWMGBh60kqKQh3tQ1BxJIjSPxaUnEql0zpwnw8LGYu/E/jwIvAwjvOPNmtocn/RKKlNeknvwVFky/Wdw/0cMXOdLCgm1A+suW+UrXGF6sTlJhqGwM2e/yJpiMvbl+pdXcBqdgZdO/uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 02:23:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 02:23:13 +0000
Message-ID: <c5209c31-9263-4fe7-b387-319bbaac866d@amd.com>
Date: Wed, 9 Oct 2024 21:23:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "<Harry Wentland" <harry.wentland@amd.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:806:a7::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fc55a3-b6b1-4aee-173f-08dce8d27dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FJQy9WTHB0M09BYzRrNkw0R0p1ZG4zbkxZZmtRYnk2dzFoTDFWRWdqYXVv?=
 =?utf-8?B?RzF6bW9XNjFPKzNrdURDSXYvOTZERnFjeHpFNzlySVZSUUlkcXZvQ2N3U21L?=
 =?utf-8?B?dTBqeHZuOFpxR1ZrU2tzRjFwblBIb09ROEhISzBrM0xneGp2Q0V0VEFVaWVW?=
 =?utf-8?B?MEdvSkRHelgzeXdaZXRjc0svNjcrR3RrU1kyZERUOFBmcndRQTk1VnlUano0?=
 =?utf-8?B?QnV0WUFOa2c2NldPQUR3Qy9HZGNLR3BFY0NaTHZZT0NzTy9vYXZYb1kwOUFY?=
 =?utf-8?B?RXRFd29LSG54ODRjV1FWbUlGaTdFd0x6c0t3WlhKS0VsWjNRaEZuSlVPeGtN?=
 =?utf-8?B?TVc4T3p1c1JieFl0d0RJM01Ic0lrYjA5bEVPVUVhT21iS0Y5RnM1Mk5hMUlE?=
 =?utf-8?B?UVNIWDhDSTdUbFIyMmgzZFN6S0ZRc1Q2SDBUdXZMUFNjSTQ1bjhwdE1yWmtF?=
 =?utf-8?B?RFpJcllWZUVpQnRVMnJKWlJTSHhkVkJ3dEk4cEZtc0dxRVEyOUVsMWRmbVdx?=
 =?utf-8?B?bFNRMW1IZmZSRXgzK3lPaEU2VVhacDBwZ2JhQ0JDdHZ1VXNyTEYraGdoanJG?=
 =?utf-8?B?V2lZWFFSNVIweU5nRDVoZEM2Q1VzSG1RaDJJSE80L1VORWFaUmIxYmxKMGI3?=
 =?utf-8?B?anc1dytzK205emd3cm1RVHZZbGMwWnJQWHZGRFJtVUYrbUVlQUlSblI5UVFW?=
 =?utf-8?B?N3Mzd0pRVUJkbUN3aWNqby9EdTVKdmJIM1NNdzJmT0N1QTdvOVFCVTQwblFx?=
 =?utf-8?B?WjBnZW1qeWs3NGdtOHBOZFFZYllub3EwYlVHeXpobkpHeFpzYlk3bGxjb0Iz?=
 =?utf-8?B?QVJPc1cyVzJVSFRZR1p0RGJPRldQUFNhSmZybmk1Z2dUWW54NFh3TUM0ZDBP?=
 =?utf-8?B?Y0RxYitSNU54cjBTV21SaGVtZjhpblFsaEZQeGF6eGFWYjNxSUc1SVE0dnNP?=
 =?utf-8?B?a2ZaMlU2d1BoeGlSeTdKQXFQTFhiWklKNCtGb2xiMjdac3d0TngyMU9FQlo0?=
 =?utf-8?B?aDFqRXIrRXROcFRpc1ZNU05LMnhVOExOQ2FFMytPdGxCK2tiZkNZaGFUYlJB?=
 =?utf-8?B?OWN6REQ4QjAzQ2lEdW9GdmgxNmlkSk05cE5yRGsvdHUydjkxNWttODJnRnFl?=
 =?utf-8?B?d0haRmxiZVYvcWNYVHpwUGZWZHZzWm1wanRMZHRueWthTW5wdG55WEF0SkVR?=
 =?utf-8?B?dDFRYlVnQm94MmI1ZTlLRUJmWk54ZXVJY1dqYnlacmE0ZzZSeWp4YmdNWW5m?=
 =?utf-8?B?ci9ueGEwZi9zajE4REI1QzVzdlAzbVF3WEpwMzErdXhzQVpiQnpXS29SRnhC?=
 =?utf-8?B?TmN1WjVvclRESURJNUpXN1B1SGZRRGxDZnNFQzROejhjQWRTcDhaVU81Nkhn?=
 =?utf-8?B?dHR0cnJiZWppNHJrWDJpN24wSGJ4MjZsdGRqNlZSdXRQV2pndHhqRTRPY2JN?=
 =?utf-8?B?aWEvSE9NY21nbWJDMGJ5dzJzWkpvN2dSMkVPWG5Uc1pCRkcxVTA2cVFEVHEv?=
 =?utf-8?B?aTU2MUtrVHBza2dhWHJiWSszd1ljdjE2aWxQUUMxdGhJd2ZzWllQa01pVjE5?=
 =?utf-8?B?S0tJTGc1LzFaSHh0ZWoybmtDZDRwRVVtVUFJbVljOGVld09RQzJiTytjZFJh?=
 =?utf-8?Q?J5ZCSeQCoOwsIVdplPrc2LsO9N5NoekjidN9e4haQVGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhKeElFTFVTRStKSmYzSUNkVzdLTE9uZHJINSsyUFZyVXlMbjBibmQ5d3hY?=
 =?utf-8?B?RmpJK1NWY0lieTZLU2Uxb1NSSXZGVVhMcCtwenA5UDR1Q1ZCQklMeXplMlVD?=
 =?utf-8?B?UEJYS0JrZjZVSTJEZGxoN3Q5S3VkSG9RcCtlRzNUU0dJUVI4Ti91OHlyQWo3?=
 =?utf-8?B?akUzb2xEOHdUWUZvUVdhTkRzQUVwUGdQVlRsTzhUKzZDVGVDdTRaZEtJc2xx?=
 =?utf-8?B?bWxJZ3Q1alNXdlRHbkdFYnRLOUdrclphRVo0L2hKUllGak5peUNYdkpBQnps?=
 =?utf-8?B?cSs1ZG0yZFZyUzlZQTdFd0NTOHhtZXkybzhNaXFiWHhIbjgxWXpaREdhWDdG?=
 =?utf-8?B?SGlTTFNoVmZEdUlsUytuYU5qdGlZMVE4djE5dlZ1TGFUZjhub3BFWmx0Nkk2?=
 =?utf-8?B?R3FKU3lCNjBoN3pqdDFxNTFnUWRhTDhjZmNINGRqQ0lCSnNNMjlYUjNQV3ZQ?=
 =?utf-8?B?eXpmbStGeVZkQXJ5ZEtIeTBjcXFwRFJicm01L3N2NEJtWW9lWmdsbGtDWXln?=
 =?utf-8?B?c05NOEtCcUI2L2NOUnFjOVdxQUhrdWhYcUNZTjlHVmFqRmZ0RlVzRElhWkhi?=
 =?utf-8?B?TDJnZ2JnUnBqdHF1bjVnREcxUVp1TGE0UVZFeVZjNDVQYlZoYVFKMmdwTXRs?=
 =?utf-8?B?RmQvTVBvTmFDVGFraXZvQ3FNOEptQVlhVjlXWGNlQ056WTUwcnBoY3pXWDB3?=
 =?utf-8?B?a3AvanJOaWRGdWdwc2M0WGJOTFdlR05tbmNKUjhYZWEwYldsQXJwaXBocDhx?=
 =?utf-8?B?UFlwTGMxODIxYkhyYy9YcjM4YkhCRDU0S2ludWxkNTVuSWQxLzVzZkRMT2dp?=
 =?utf-8?B?VysyLzFwTU1jZVI2ZG90bUJrRVR4WUMrT093K2U4Y2lobkFWemlxKzVRVDZo?=
 =?utf-8?B?OTIrQWdqUC8rMEhHQ2ZGckZNcEZ1WWJXbk95N1J3Mm5acGNwRGhITGdtYkxt?=
 =?utf-8?B?VHVkam14bEdhaTB4K1VYN0RFY3Q1S3hsdnVVMTl4U0cwZkk3cG1vRUxydmVE?=
 =?utf-8?B?WEpCOEx0b0tnOXZnRFdic0NRa0orMlFOdSt5ZGF2ejZkSnB5ZE1YNlZjSEVj?=
 =?utf-8?B?Q2FUVURMMUdDVFhVZ0F0cDVMWEwwcVlmVko4VzUxbnRsQmY4bHpsaXlWZGdM?=
 =?utf-8?B?QXAyeHVYbVBwNkk5N0pvU3B1YWdyWnlSbWQ2MlNqMVBkbEpxQ2g3bGJOME1p?=
 =?utf-8?B?QnFrYmxKek8xYVRacVRmWUxCaTlaRjlKZFhvSkQvSkV2Tm5VVWVqMlpIR0V6?=
 =?utf-8?B?R09EQWJJU2hwN1dTb2JNcFQva0N6WGlaRU1BYTJDOXNYMm1UZDg5MHJQdTda?=
 =?utf-8?B?alRXaGJpQ2xjY21hS0llZHlMNzFPdGpKalVOaFJZQnYrMzV5ZU1PSFk5bGJE?=
 =?utf-8?B?RlNKb245UHJTN2FIbTRmWG9vcER2M3p1VnRHMVovQUJKMmZIRjlPeXk2Y081?=
 =?utf-8?B?MzF1cWxPSG96N3hQSzF3eVdYSU83RFdDaWJlVEtBSG5yNEw4cnZzVkhHK3Z5?=
 =?utf-8?B?NTYwRzE5UVpWZS9pV1FGWWxPWHFrc211NlVnMmxOYTZZY20ra2ppTlM1b2dN?=
 =?utf-8?B?aTdrNFc4S2g2QnpZWU1yL2JtKzh5S0dUR3g0WExuL0ZReVh4R2hiS1BVR2NB?=
 =?utf-8?B?VmVvQVVXTVBMY2U4bXVtUlRwbWxvTE9UdU44WW5sTjl2TG8wM2J0bHJIbmt2?=
 =?utf-8?B?T05ycFBnNGhHTXhVQ3djZHkwRVpTb0lJYVVpZVhpSVZBcG1pUzBWNzZENjZ4?=
 =?utf-8?B?R3h1a1JVMUV0WTlUdnNxdENxNnY1bXo4WkExaG5VR0J6ZGNRVUxaSWdBb0xO?=
 =?utf-8?B?bU1ycFlkeGU4Ri90SldUd1p0QTR1cWh6OFV4MWZyRGM1T1NINHVpNkxUYWFO?=
 =?utf-8?B?WnRFb05YbURDYTBvTVBXZ2d4cXVpSmdndUlYamZJOWZZeENEV2ZrWEJRYnVl?=
 =?utf-8?B?Z2ZJM2JUWGk1UTRWZjZrMko3N04yV0ZmOXBsL0NEU2UzZG5HdytoSzBMaXFP?=
 =?utf-8?B?akV1R29xQ2lwdFUzTXhwa1AySFBTaGJraTVqdXNVb3dyOHMvSG9WSUI4N3Z6?=
 =?utf-8?B?UG5PT1dDQk9rU1l1bGlDb2VhaW9HdjZjT2p6OFMzK284UGJBVVlnTGY1dXFq?=
 =?utf-8?Q?LspG2rBjmJ4jyEFkAAvuxdkU+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fc55a3-b6b1-4aee-173f-08dce8d27dd9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 02:23:13.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBO49fH5nlj3vIWN9Bj/wCob1u99A61j509+rcI96LhyVkSsSkajY4N6WxkaBp+JwaAaQLWBntgZyk+6OQ79UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044

On 10/9/2024 16:52, Mathias Nyman wrote:
> On 3.10.2024 16.47, Mika Westerberg wrote:
>> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>>> Hi Harry,
>>>>>>
>>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>>> boot screen.
>>>>>>>
>>>>>>> A bisect revealed the culprit to be
>>>>>>>
>>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>
>>>>>>>        usb: acpi: add device link between tunneled USB3 device 
>>>>>>> and USB4 Host Interface
>>>>>>>
>>>>>>> A revert of this single patch "fixes" the issue and I can boot 
>>>>>>> again.
>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U 
>>>>>>> CPU.
>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>
>>>>>>> lspci output:
>>>>>>>        https://gist.github.com/ 
>>>>>>> hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>> acpidump:
>>>>>>>        https://gist.github.com/ 
>>>>>>> hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>
>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did 
>>>>>>> nothing.
>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>> on a kernel with the faulty patch, without USB functionality, 
>>>>>>> obviously.
>>>>>>>
>>>>>>> I'd be happy to try any patches, provide more data, or run 
>>>>>>> experiments.
>>>>>>
>>>>>> Do you boot with any device connected?
>>>>>>> Second thing that I noticed, though I'm not familiar with AMD 
>>>>>>> hardware,
>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>> somehow?
>>>>>
>>>>> On some OEM systems it's possible to lock down from BIOS to turn 
>>>>> off PCIe
>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>
>>>>> This is what you would see on a system that has tunnels (I checked 
>>>>> on my
>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>
>>>>>              +-03.0
>>>>>              +-03.1-[03-32]--
>>>>>              +-04.0
>>>>>              +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>              |                               \-04.0-[36-62]--
>>>>>
>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Family 19h
>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Family 19h
>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>
>>>> Okay this is more like what I expected, although probably not the
>>>> reason here.
>>>>
>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>> the BIOS on your reference system? (Probably not but just in case).
>>>
>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" 
>>> in BIOS
>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to 
>>> disappear
>>> but the system still boots up just fine for me on 6.12-rc1.
>>
>> Okay thanks for checking!
>>
>>>>>> You don't see anything on the console? It's all blank or it just 
>>>>>> hangs
>>>>>> after some messages?
>>>>>
>>>>> I guess it is getting stuck on fwnode_find_reference() because it 
>>>>> never
>>>>> finds the given node?
>>>>
>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>> reason there is no such reference (there is based on the ACPI dump) 
>>>> then
>>>> it should not affect the boot. It only matters when power management is
>>>> involved.
>>>
>>> Nothing jumps out to me either.  Maybe this is a situation that Harry 
>>> can
>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>> enlighten what's going on (assuming the console output is "working" when
>>> this happened).
>>
>> There are couple of places there that may cause it to crash, I think.
> 
> Its possible we end up trying to create a device link during usb3 device
> "consumer" enumeration before the "supplier" NHI device is properly 
> bound to a driver.
> 
> This is something driver-api/device_link.rst states can cause issues.
> 
> This could happen if xhci isn't capable of detecting tunneled devices,
> but ACPI tables contain all info needed to assume device might be tunneled.
> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
> 
> Harry, could you test if the code below helps?
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..94c335a7b933 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -173,6 +173,13 @@ static int usb_acpi_add_usb4_devlink(struct 
> usb_device *udev)
>          if (IS_ERR(nhi_fwnode))
>                  return 0;
> 
> +       if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
> +               dev_info(&port_dev->dev, "%s not tunneled as it probed 
> before USB4 Host Interface\n",

I'm aware this message is mostly to prove whether this is the actual 
issue but I do want to say if this patch indeed helps Harry's problem 
and you keep a message in what goes upstream I don't think this is 
accurate for all cases.

If you have a Pre-OS CM, it might build tunnels and those could be 
active until the USB4 CM loads and resets them (by the default behavior).

So I think a more accurate message would just be "%s probed before USB4 
host interface".

> +                        dev_name(&port_dev->child->dev));
> +               udev->tunnel_mode = USB_LINK_NATIVE;
> +               return 0;
> +       }
> +
>          link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
>                                 DL_FLAG_AUTOREMOVE_CONSUMER |
>                                 DL_FLAG_RPM_ACTIVE |
> 
> 
> 
> 

