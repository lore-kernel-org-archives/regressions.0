Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C281A726D
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 18:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981496; cv=fail; b=FetOsWmINcyqujYlUOt35mWxE0RtIQc3nYfrv5vzosTlLyWe/j8OPFeNfCNaGgjMO8sJ9Kei53sq9wBKPESVLY7VRpdle4iGJdrDvqVZEpbq3t1JUb8L4JIs3kLeJ/JNoEupnapBX/MbeO4W9c+K24qr/HVa7RMD/TJ8KkiYTfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981496; c=relaxed/simple;
	bh=ssY2SbVJyQGg3aMBLi0d4PxJhhNi/OyeouJFhKq04EQ=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hSb9Muz4voHTuGNp/JhYa0dZ8fIoWKdYgaDQfW55joSgB5k/LTrlFdXhtPlizE4Cdfqv7nwrSkBeQhGTseCd4mD8Ogm7BZLju4mo4S5qbRTomTtJ2b1sCs5Uj9p0zH9lOYwK4j3lKoPzzsgxRbY+pYmdplxotB1rEZXpYqcWTPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2AxBJaga; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2AxBJaga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYsuPyr2rugagDAEOqEQP2Q4HSDqcTN7FhXCVXqxeKYqQ7okVloqhQdYO/4RT2BtkCcMxGVbxlefm2a0h7dSGF99xZaqzKTRGq05q/AvM0vSlfxXkjaMSTeSpU2jHOVT3JneGCPZ5AuQf7O0tt8kVnnX0areN4g1rIFLxIwlnZaZ/RQbDxYFuT+EW35Me1I3yBazsofqY5UPXw6hNODQnDLpb0Su8vaqRCCFA+nhX1gWJU9PlNutw1Y9Br42w9zGxtDwThQmqeqDh1/VrJD6qSSQpzzmtKav0Gb7CD3+htBCLzbvfuJSh4k0rUfTKiz+cPJcYrMZxdhaHDNETHa1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiuX3U2Y74L0Kp11cbsEim3sXcKSzVr40ki8dto78+M=;
 b=QSpcFVBLMWohA1/R7wEkchIhJsu7kVle4Ki7jepEaiCMvKxPMV5uA0tykg15zAf7Qx3Oj60YUjyP4bl70GbVBrezWZ9WkEJE2fXyy8FSKF9EsG+LNYKPa5f9SsOYunmfTUDzM+9UOEBdNoCzd1IHsTs9xmc4SAfs1QieIbG5IqH6YOC63by5QwymcDnby6W3JtK0Rqdl/OZdLk4VuJ5MQZyllWZgHCYj602zxXP066/WSdmcdhI8u4PaSgyPAHTioUm+pAbRt/db2i8qXWX/SrATWd7bXz/Qp4QKxzVQVz79tKZJMEHskyjQAhXbWSZCfxt381uIkdxWQ1831L7IFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiuX3U2Y74L0Kp11cbsEim3sXcKSzVr40ki8dto78+M=;
 b=2AxBJagapOsBvHDivAF6O0hrDXhCMt2OX/TDXeye/7GUZGTonYy6u1nZFYbQbDFVRWyisaUBLp8Qg19jo1+hSGyzzMsRMM1jb2ivYUkIKAvGs2V0w3v4seElbhT0L31fU7g8tI5MdEVC9YFpousy2ciVBp6nNjgCY+SlTd8DQ0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 18:51:29 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 18:51:29 +0000
Message-ID: <467722db-188f-4487-a837-01e65e194d3b@amd.com>
Date: Thu, 3 Oct 2024 14:51:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
From: Harry Wentland <harry.wentland@amd.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 regressions@lists.linux.dev, Raju.Rangoju@amd.com, Sanath.S@amd.com,
 Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <afb91d66-55b2-466d-87c6-5de196b326d8@amd.com>
Content-Language: en-US
In-Reply-To: <afb91d66-55b2-466d-87c6-5de196b326d8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 954987c0-5f96-4d8f-545f-08dce3dc6447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3NTcUZTTlpaYzQ4dzFwaHlSc0VqREtGaTNTV0JNbnRLV0JtODlsdjJzQVBO?=
 =?utf-8?B?MVkybnIyUkpxWEh0SG0xTGFwSTdXTCtaalJmSGk2L3h6b2VWOWZQbzFCS3BV?=
 =?utf-8?B?ZXlzR3FzYXdUc0hPYUwrMENZRk1LaEcvMDB4T0QvcDlEOVJTdnZ4TXo2YlhH?=
 =?utf-8?B?UGV2bE5oK3JyWUcyNktkaGI4MWRQem1hRkFaK1RFQTFwMG9XeVBINXAwRnR2?=
 =?utf-8?B?Q3c2RVpLSTIzb09iNlJEVHRVQ2FnYzJaTkFuSm00Q1ZqemlIdjQxR3N0TGtP?=
 =?utf-8?B?eU1qaWRPTzZFeVk0VkFWVWNyd3krUUVNQjZETEtaRUx4K3pXb1F3eGRsQ1BR?=
 =?utf-8?B?MzV0bFoxSnR2WFByb01KVUhVVDZFYU9DbHBGS1gvUDdRTHNIWDFmbm9aNG9K?=
 =?utf-8?B?eGV5TzB6NHFtYU5mZlpoVDNmbXFTMjRXd0FYdjl2NTd0OGdGbEU5Z01XSjVR?=
 =?utf-8?B?NlZpOWtBbTh3UG5ST3BobitoUXUwM1NKQWpBUFErcFlwdnVua1FFajd6ZjJ1?=
 =?utf-8?B?dTVLajlWQkZjTElDZDJJQVp0OVlvZUUydnNFVHVFMFdKMm56Z2Vxbkp5a3h1?=
 =?utf-8?B?RTJ6NDlaajcrbE16aUNuR1JWVWVkbHBJV1JML2hVS2czMlA4N2s1MDJQNEVk?=
 =?utf-8?B?L1lIam5BRFd5WHhRNllPMWdCbGJPVWNNVW9ESjNudThtbkVBVTQ1b0dwOUEw?=
 =?utf-8?B?M05yQ0pzRElvRWo1b0FVL2o2V2tRK3l3eUpBRnVlanJIUWg4M2xoYmMyVmU0?=
 =?utf-8?B?TSsvMXpGYndGOFRUTndUN0ZzdTRhYkRpV1BQNkhXRUJyRWwzdE1QblBibkpT?=
 =?utf-8?B?VkZFWWE1UTFZSzJKOCt4OWVZRFRXM0J0VGFOeWtOL084aVJPcFg4a0NWSUs0?=
 =?utf-8?B?YVdoWmQxa0RnUXRkeWR1K3pIYTZLQ2R6Sk9oVUZqeE85VUFEYzFZcDZzd1pM?=
 =?utf-8?B?dStNUkdQQTE0YTBkYldBM2ZoNGNzQVFVeDhLMUVhcmpKYWgzS3lHeng2aVlx?=
 =?utf-8?B?azYzdUxiZEhheUdNSmJJdnZHeXRrd2NmeVEvdnFZMlZwdkhTTWRscjdkNkVj?=
 =?utf-8?B?dGFQZGloTkRGL2pmcUdYMFFlMFM4enZRVWV3T01FcHNtM0VKenphZk1EZXBo?=
 =?utf-8?B?N2pDRTVkZU9vcGhNanlia1U5U2ZlS3dEeVJZM3VIcnllTHBncnpuT2hEUUVQ?=
 =?utf-8?B?ZE12T2pEbkJFdTNvQXArZ2FESGlyalpPekl0U2ZZeFNnN2NhaEZmalRWK0hH?=
 =?utf-8?B?c2l3cENEMHd0czM2aGhlN1VwQjlnbHJuVnU2MFVoUzRVeUZVMG9xTU5Pdmhp?=
 =?utf-8?B?QkdXWGtZY1NiaC8xQk4wRFl4QVo4ODlRbk5zOWVMeXNwc0VSektSVnpybmtX?=
 =?utf-8?B?TFF0c2hZQlRwbmRzRzZBRXRFSEhwK3JaSXNkLzB6bWpkRGJKK1lLRVE3UDNs?=
 =?utf-8?B?RzFmYmhqM1VSRFFDUlFQcnBjRm0vMW9Ud1VKd0JCdkIvU3pIaUNrTFdySDlN?=
 =?utf-8?B?SEdQVzR5b3lHbzVBU3dXSWJHalg1OE5OTU1XZjAySG9XODN3S0s3ZzgzWFhT?=
 =?utf-8?B?RjFFbWE5NDdwa2V3VCtjUWxCTklFMnE4THRFUW81aCtPOS9CYnJ4WW8wSlQ0?=
 =?utf-8?Q?TTMfjRgjDhmSzMqoNf/MG6SBvSF7uU9dWKjsjHfFjXkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW5obVRFYjcyM25MSVhwT3J2UlE5ZzM2bVp5Q0h2djNWTng4TWZpKzZlTnlU?=
 =?utf-8?B?RVBCQ0FFUS80VmF2UFBjWm0zVm9sOGhrei9xWmZYbWsyWVp0akxzNDVNS0JU?=
 =?utf-8?B?RU9wclBmYXdoZ1RZZXZLWXBKNmdOdk55R3FpVVB0V05mZ3p0cHFzOEJ5cVpI?=
 =?utf-8?B?ejFCSWxrRVBOODkvV3Z5N21ZRHJkWVhBdUlMNzJVN3lTWjNkTU5NMTBIeVIr?=
 =?utf-8?B?Z1lXa0tUQTc0dXdoU2ZlRUVhMkVTTTUyVjYvUTd6YityL2ZoanEzVkk4Q3U2?=
 =?utf-8?B?Mm1QZHdBdUlPK0gzaTZUWStncW1Ia285eHg0S29nUDJZaHlBTjM1bEsvOUMw?=
 =?utf-8?B?KzA2MzAzbHgycERkOEhpWGU2R2JvYUdKcDVycy9lM3NFTWpLMVI2ZTVtU1VN?=
 =?utf-8?B?SHRFYVBWWlFlZGxoNjE2R0JGSmRiUGEzU1lVQjJsdU8xRTRhTHk0eTA0WXdk?=
 =?utf-8?B?WnpEWWRCT2t3Y0dyWFBsRWlKbkFvRlJHRXVZVHZUZFk5aW1pSGNYQzNYOHBu?=
 =?utf-8?B?ZDM0MUpSanhtT1ZkcWtzOVhhZERjUnRXZ1ppcnZiZndyTXZGOHluN2lwMWE5?=
 =?utf-8?B?Wk5BMVhaYVpyRmVJMG5YeWxJdEdnTUovRzc2RlBVczlmL0RwYUVuZFB3eVBT?=
 =?utf-8?B?WU1IWkkwb2FXeUtaT3NCNzVDWThLRUxtZzJmb2tCZGFGU1ozL3dyY01LL3BG?=
 =?utf-8?B?QzZ1OWNpcjR2ZjIxd0N2L0QrU2IxcWcxaWdWM3Z0ZXJRTURZK29KaUNOTTB4?=
 =?utf-8?B?WHlJWmdOV1BWTHZvdHQzc0ltNFFCL1RqVFlUQkN5ZlNSWTFNdWFYSXIvWEtF?=
 =?utf-8?B?RzNKV1NldW5HRmJabERDVUtMMDY4RDhkSDBCbnJWY01CM1Z1UTR4QWg1cmJE?=
 =?utf-8?B?Y0phblcxeDRUZmZwaW1WT2JKS214RndyZzdmUnU2Y3ovK0cwSmtORWdBWUlT?=
 =?utf-8?B?ZFY5TzAvSzVna05BUW9TKzg4Q1VMNW41R1ZNa1NhNUxLdFhPU0lqVnpZOUpi?=
 =?utf-8?B?UXJKVWI5UUhLb2JMeUhxZVdGaXQrc1haTHJweHNJRzNNYURXc0dIUXN1VVlI?=
 =?utf-8?B?bGlEczgzZCtzM3pTYUY0NlBrTXIxN1RobHptL2R3UEdwS1VCUUplaXRWdjdj?=
 =?utf-8?B?L3pWMmRxU0ViK0xIbWlVMEJHeWhMKzFHTVRIN2VEVkQ3SjRmbE5zb28rd1B1?=
 =?utf-8?B?L1VqUWNlVTVZOGhvNFZFVGpmUUsvRFZmbmlHVkpaLzArNlhwRm9RWkd0aEhE?=
 =?utf-8?B?RU1xQUZJQXBleGZQbXlWb051VFhwOUFuWkhLbFNINzZHSHQxd0ZxL1dRTnJQ?=
 =?utf-8?B?RDk2ZHIxeXNyalFXUVVhWTV6MS9iSUtaRTFKMTBOVzFac2lacHVwaERPUWRI?=
 =?utf-8?B?MTAyOGZ1T1IwVFdDN1ZyRzZGVERhQ2dPdld5SGhLNUwvS0ZzSEdxdFBxaHE3?=
 =?utf-8?B?eWpHMEJXL24wWllwN09vQUxhdDVaZFRIWFNoOWVadU9UUjc3Rk42WVF5WDNS?=
 =?utf-8?B?d2dqV2FBZ0ZTTHhEVDVOd0NSdU1jYm10T3hMSDZHVSsrSXlFQ2ljS2VhR2xK?=
 =?utf-8?B?UEM2cFQxV0ZabDdhSTdvRlZ5bHlZVkliYlhFQ1I3ekNBTmFyd0I4WE5DM1Q1?=
 =?utf-8?B?d1JqTFZiNm90RkxRMHUxQVJRUWpEOW0zYmVBU0Zab2hQKzRPUnpuUFVVVFcy?=
 =?utf-8?B?TUREQTA3STFoNE1YS0ZCWldtVXIzekVJekpERnFHVHlJNC9TSjNhMkdlRFFu?=
 =?utf-8?B?MEtRK2U5Wmg4aFNPWFcwVnlRL2gyRHQvQ1dPa3NPcnZoN0lRRkxvOEN4MERF?=
 =?utf-8?B?VE9lT3NiZHhHVXNZQTJ2YTZkZjNXc2M4ZTRoZ2VKS0VFcnhtV2JacVFEUE9O?=
 =?utf-8?B?d1h2MU1HbmVOMDVRY2Z3VWhqSXF5WjRic3FxZEg5QnVFT2V4ZTRyY0ZacVJK?=
 =?utf-8?B?aFBTazcxN1NCbGRGVzFMNnloUWJQUWcxWDhpTzdHMWRVcjhpQVM0cUlZbzc1?=
 =?utf-8?B?K0tWa3lIejFVN3ZGc2Y2clgwRjN4L3g0bUl4cVIyaTYrWkVLK05xYytYWmxZ?=
 =?utf-8?B?a25oWnhEcTdXRDcveDhralZrd1FZeFc2L25PVFhXN1hoN0gzdFpibXFUU0tT?=
 =?utf-8?Q?b017d55LfqAU4UwRy5LmfZyEc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954987c0-5f96-4d8f-545f-08dce3dc6447
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 18:51:29.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqHQ7bm1wf/OUUjpb5JEb6vi1eBBfi7aJGkzO/cp2+2E3YnOkKkCIlgv5dhGWuq5oxC9von/oRDpU6ckTppJ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796



On 2024-10-03 14:23, Harry Wentland wrote:
> 
> 
> On 2024-10-03 09:47, Mika Westerberg wrote:
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
>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>
>>>>>>>       usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>>
>>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>
>>>>>>> lspci output:
>>>>>>>       https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>> acpidump:
>>>>>>>       https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>
>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>
>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>
>>>>>> Do you boot with any device connected?
> 
> Great question. A Thinkpad USB-C dock. When I unplug the dock at boot it
> boots fine and when I plug it in later the laptop charges from it and the
> dock's audio output work fine.
> 
> In the midst of my experiments I also noticed at one point the dock
> wasn't charging my laptop and hard-resetting the laptop didn't fix that.
> I had to unplug the dock from the wall and plug it back. So there is
> likely some interaction going on with this particular dock that must've
> sent the dock's FW into a bad state.
> 
> The dmesg with the revert and thunderbolt.dyndbg=+p is here
> https://gist.github.com/hwentland/7e25dedd3e707fdae1185d65224d4d66
> 

Apologies, that dmesg was from a build with a bad .config and has some
FW loading errors. They seem to be unrelated though. This is a dmesg
from a good build. It still has a wlan FW error but that shouldn't have
anything to do with the problem at hand.

https://gist.github.com/hwentland/867f7afbf3df20547a877e794a8d8e6b

> I don't see any PCIe tunneling option in my BIOS.
> 
>>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>> somehow?
>>>>>
>>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>
>>>>> This is what you would see on a system that has tunnels (I checked on my
>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>
>>>>>             +-03.0
>>>>>             +-03.1-[03-32]--
>>>>>             +-04.0
>>>>>             +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>             |                               \-04.0-[36-62]--
>>>>>
>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>
>>>> Okay this is more like what I expected, although probably not the
>>>> reason here.
>>>>
>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>> the BIOS on your reference system? (Probably not but just in case).
>>>
>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>>> but the system still boots up just fine for me on 6.12-rc1.
>>
>> Okay thanks for checking!
>>
>>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>>> after some messages?
>>>>>
> 
> It hangs after some messages.
> 
>>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>>> finds the given node?
>>>>
>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>> reason there is no such reference (there is based on the ACPI dump) then
>>>> it should not affect the boot. It only matters when power management is
>>>> involved.
>>>
>>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>> enlighten what's going on (assuming the console output is "working" when
>>> this happened).
>>

I sprinkled printks but don't see any on the console.

Harry

>> There are couple of places there that may cause it to crash, I think.
>> And the __free() magic is something I cannot wrap my head around :(
>>
>> Anyways, Harry can you try the below patch and see if it makes any
>> difference? Also if it does please provide dmesg.
>>
> 
> The patch doesn't seem to make a difference. Same hang on boot.
> 
> Harry
> 
>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>> index 21585ed89ef8..90360f7ca905 100644
>> --- a/drivers/usb/core/usb-acpi.c
>> +++ b/drivers/usb/core/usb-acpi.c
>> @@ -157,6 +157,7 @@ EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>>   */
>>  static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>  {
>> +	struct fwnode_handle *nhi_fwnode;
>>  	const struct device_link *link;
>>  	struct usb_port *port_dev;
>>  	struct usb_hub *hub;
>> @@ -165,11 +166,12 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>  		return 0;
>>  
>>  	hub = usb_hub_to_struct_hub(udev->parent);
>> -	port_dev = hub->ports[udev->portnum - 1];
>> +	if (WARN_ON(!hub))
>> +		return 0;
>>  
>> -	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>> -		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>> +	port_dev = hub->ports[udev->portnum - 1];
>>  
>> +	nhi_fwnode = fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>  	if (IS_ERR(nhi_fwnode))
>>  		return 0;
>>  
>> @@ -180,12 +182,14 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>  	if (!link) {
>>  		dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
>>  			dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>> +		fwnode_handle_put(nhi_fwnode);
>>  		return -EINVAL;
>>  	}
>>  
>> -	dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
>> -		dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>> +	dev_info(&port_dev->dev, "Created device link from %s to %s\n",
>> +		 dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>  
>> +	fwnode_handle_put(nhi_fwnode);
>>  	return 0;
>>  }
>>  
>>
> 

