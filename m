Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BEC78B60
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979825; cv=fail; b=RbvOHwn8nMol8jhs2MwCvmGdXot5x2aXSY8Un98iE2BeN9rGDn1P5yGHbYuSI48PeYnPVq88nItRUUeumjVbL11L0/x67kt9Bo2ri2y4Xoj/iELEaSB/KFyLouGK5iQ0E8qyYvcGQmuKLgJK//qFtnQkI03USdGCNDVHtpJ5i04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979825; c=relaxed/simple;
	bh=Wdl6kg96+qJuLmh2X8bhz33LWUuSho47AZxFb4bu7UM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XP/lI7em8UAOTHwR3OefQfAFKmfw7PsBaEn1g2G9Ye4IJjHeTc51uL2BhPRcoqtVSUtiABP9y0QMYC3HCptK0JXMYweL/F1d8UrLhNlpn8ZgxMIdBPEWUOAb4VasiUhiafIRbdY+3XkGHqWJCcqPDzRedorPc1CxWqpiVAO3uss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O9Vky0c1; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O9Vky0c1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyHFauqMJ4vpKQwh2FtBYy4jwjHJsOKMVUFTOF1pf2z5PTK9xtXUhbIFgv0tjZsNtNLtocMmETcIBkwSgPXK59ECf4nLb3HA/51fHecNQHe9lpQrFZTxU8FJRk7iaexQEoCF+B6Ie1LuDkOcezGQ2JCWWvZD5scKHtfwQVMPq7YRKzLMImsQEdRzoLrYyc8LXK0nLpv/LEDeeZKe2CaRendYkyQ4rhul7l2jze3O8Vnye2rw0VD7MC7eg7fEvIZCzYhHQaSBjnAxpZC9fSkXOg1kLmyhWdsBTUYKSyojcUdu17BXmIaJo4O58Bmqx3zyogNGTDS9YdIGbjUZRpIQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtsF85wvKXTbSweeyabst8Fp5x2L6uCc83ISerQItQM=;
 b=ZyhyqGtFc71m5MSr4mIBtsnscTxI7+nu0j7Ii85tkGMcUNq/2iuPJou7GfHgaMzT58fksUMvPJF5e6z2jqPrl9raR/KRKCaIbNzOhgNVSPnLl9gUU52xJwnFtyfDCs7SzZ4AtjaZM6/su52W9qwlIti+rctFAI8GManRk4xERzeYAS3+xEFcSljepTsHbnnAKN2Jl3waOiSdoXAOI2cUZAONpX9FCjdTKICP9C5Ipy55meWxY8WTPj2GWAZouHIq7rOeHPwlAQJF4ciHT0AM2eQmtBuzF9yYAZYlu9DtV4w9p+5kkxOql9GO88iZw2zBresZ2a7QZ50GMLfc1q3uEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtsF85wvKXTbSweeyabst8Fp5x2L6uCc83ISerQItQM=;
 b=O9Vky0c1yQlAstpmJvcSrAW7J7fgrPOK+1p4afSkvyuDP+XwmSTmUAJVkOwtCgcRshOE/J6Ji4Atv7RwCz13JozK0Y/k4pcAjGVqt5lH7MjICplZxcrBsFB+qcpVrqPchjsLh5JKAMfJl9DvP7ubXSQ7b8lTzePfUcaVCZAE8TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 18:23:39 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 18:23:39 +0000
Message-ID: <afb91d66-55b2-466d-87c6-5de196b326d8@amd.com>
Date: Thu, 3 Oct 2024 14:23:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
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
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20241003134743.GO275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0333.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::26) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d33242-1cd9-4020-4ee1-08dce3d880f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnJUMTg1UDZabTZXczZESHVVd2VVeHVJZXNqV3d6d3ZDUFVzN3lwd0ppZ0RJ?=
 =?utf-8?B?U1RtWjgzVVM4dnZVZTJJbmNOQVcydDI5aTBrTnpmRDcreExUQ05kVTZRMDFw?=
 =?utf-8?B?MHlwc0tuSEFxNHJybmZ1UEplbWJMdVl2QmVGOXdlNG9YekFKMEdRYnAzV2dE?=
 =?utf-8?B?Sk9WMGdxS2FuTElpeDlKbTA1QXduNStMOStheFh1MFRBbk1SaS9pZXJ0RUJl?=
 =?utf-8?B?dytjZ0VpWUg5UmlyUG1GbXh1eWVlNzNkeklxSlE5U3VFTGxPSld2NysxcG1a?=
 =?utf-8?B?eFc4QmVtS1lIaUk1Um1pbTgwWngvZ0FtVForZkZmeGtOZHB1RzVaY25GdURj?=
 =?utf-8?B?SHN1TjlwVHdrSmp1SWhEYmE4Q0hNNGZrRlkyZG91Nlp6dk1JSEVWa2YwU0g3?=
 =?utf-8?B?MU1EVXZpNVI4RHVGQnlZeWticlVNZWQwanhkbEVIYmx1WEl4RFhjT0RCZGhP?=
 =?utf-8?B?UG9WM2UzZ0FkSVVwazNRTlV1bkg1RzlWaVZ3NlNwbzJnSzFicTBXTjFjS0l4?=
 =?utf-8?B?NGVFdGVTK0FhaGlDUU5OZFAvbGpsdWlhTHNjdUdyM2JNaW5xMTdUMTl3YUtT?=
 =?utf-8?B?TzBOdmpKcVB0S2pmZTVHekNVbXA5M2I1SEZEOUs3bktEcWRWbmZON2JDZll5?=
 =?utf-8?B?elljQmFCT045NGVRM2xLOVpiU2daT1VDVlhZVE5oSWc0cExSWk1QV1Fmczgr?=
 =?utf-8?B?cEx4NVBPMFVIcTZKVXJoVkdwNWpkdU9VUmVRWlJReXNwTG1MendkSXA5bzhh?=
 =?utf-8?B?dkNUTlBQTnJTQisxWE9YbFVnbmt2VzRLdnRWWnRPeVR3M0NLQkhNTzA5ai9V?=
 =?utf-8?B?N3dYa3NqdXBPaWdlUk1rbWhOM1VEZnNucmg1Y1RWUHJ4dmpnKzFLL09nVm5L?=
 =?utf-8?B?NHVXTysrWjJZYjF1VGh5Nm5WaVJURGtOREN6U0Jma01vdDVYd2pUYStYSytK?=
 =?utf-8?B?L2RvdFRqN1RDYThObGVJTjk0VVRPYjZVOGRIZVplam1kRkQxOHI3b2hnRW05?=
 =?utf-8?B?R3dNQnRVd2tlNHQrQU11K3RXbFg4eXhveGpBNkEvNkpqZnNLeUsrbUpnejV3?=
 =?utf-8?B?VTN2cDF0dVBEM3BPWmFla090ZUZiVDJja2ljSTloUGN4SzZKNGpzRlFaUjkw?=
 =?utf-8?B?L2Y1a2VjSlFycXNheXNRVWdYcjdhNFlBcGhjQkRDS1VqMHg5eUY3QXl0MGNa?=
 =?utf-8?B?K1pZd09jRWY2RGtMYk9pUXM1TlpLaGhCMzZkcVZaakpuckpWbEV3ZFFXcGkz?=
 =?utf-8?B?Uk1GTHI1TzRnL2w4MFJvTzBZVXpMdDdQYjZFUHZnK3VOd1NvdEUrbkdqYVBE?=
 =?utf-8?B?eHlLNnBBZXByUklYMzVDTnd5dHQ3UEs0UUF4NkRYVVNPV3JwOGdzcWQ5WkI4?=
 =?utf-8?B?SjNHVUF3cFhTVDhKVzFGYytwbkNXK1psY2RLVnJBUCtGSCtuck1ac1JxMlFF?=
 =?utf-8?B?U2dPV2dvY0xkSFNoVStValhzRVFMUi9samZwMlppNTJseFlpY0tMVENyc3FD?=
 =?utf-8?B?TDNDUkN2M1NFc2kvbTdIcmVNdnphWWNHeFFqNzM1eEFBNHUvNllrMnRsUURs?=
 =?utf-8?B?ZG9BbU9JVHg4MC9sRGhOd1V1Snd5UURadC90ZmRqZ1ZBdS9EUnNONmk4Unh1?=
 =?utf-8?Q?sABd8wJ+HLIp+XBuUl3C1klut05iOL59Az0HEYPH7j9c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTZESnlRTWgvVkhYeVhYUzdzbjk0NVJKNkFvYlJjN295MDdFa3BXSVJ0Z2Zp?=
 =?utf-8?B?anA4eUxzOFJjWmpPQks1Q1dLWUJrSWdtNjBCbHhLNUdFNzArZUpBbXlFYzUz?=
 =?utf-8?B?UndsT3RsZzB1RnVIWWhGVVFhSEExMXhEcWN6ZGo2djEzdTJjeGwyWUJ5VXdO?=
 =?utf-8?B?UzI4dTdKYmtpaDIwVndoR1FwMm5URWtLL00wQlZhMjk0R2NpNll0bDJwOG5l?=
 =?utf-8?B?V0pJUEtkWHFvUndnNE1KWGIvSXo2T0kxcTcyYXNzYnVoOXdFajM1bG5hUlNZ?=
 =?utf-8?B?a3FCeW0wRXNPUnBkeG5QRzZjT2ZJbFA5Nk5UVjVrcjA1YVNGWFkreTdkQ0VK?=
 =?utf-8?B?V0krdjBRMUhUQUtoZ0UyZVREejdVOVQ4RW4vUVMvU0xHdCtwM3dyQzJYODVX?=
 =?utf-8?B?TUJIaWhUbmlJMGcxdU1SamRuT2h0SzlqSDdrako1TzFHdkIrc254Z25XNzVu?=
 =?utf-8?B?eWtEbVBsQm00WVBoRGwrSDNISytjUVBhQ2t1MjNOOEIwWFFZSUhqVVBicXNq?=
 =?utf-8?B?WmFFcFhWelkyR2I1cVNKZHZpK2ZWTFNyM3FyaVgwcnA0UTI4TzN5dGlvNFMz?=
 =?utf-8?B?Tm13b3NDZHlNT0RzQWMxU1NzOG1QbEhXNlNpdm9QYm0rOTcvRkFzOWR1RE5F?=
 =?utf-8?B?Z0FVczN4N0UvNUwvR3c5SzhkQ1NiaGdybjVYNzNtUzlwOTRoZUoxVWJZSFZP?=
 =?utf-8?B?TWlwNzFreGJkZmlqVEQzL3A4U045cWE5UytxOVQxakhma0prMkowcERRZ1Jk?=
 =?utf-8?B?L2VYN0hENkc4anhLQmF3U0x0THJNR0FOUm9FdGUxNEpyRjloSEJ2dUtqVUhN?=
 =?utf-8?B?Nkt2aW5BblZUMnlFbmJkZy9IVnZtYXJDTGhXOVlENTBrQUk2WUthVjZ2NlZR?=
 =?utf-8?B?NjJTSXNFZDZqOTQrcHJ0RHRDcFJGZGhENXFUdVc2ZUdpdzBsWXZoQ0ZHRTUw?=
 =?utf-8?B?Qk1ZM0o2T2FDQ2VFOWdIOU90YndtTE5xYnU3aVgvcEFoUlB0K2orK2crR3Jn?=
 =?utf-8?B?eWtuVFN1VFJKS3hWSHMxNUdBUkZtK3FsWjlOVzF0UFdwNU1YbVBuaVB3Y1cv?=
 =?utf-8?B?TmlKSEJ1OUprcWJZVXRWemdWanVDZWViMzQxcDVkblhaTUxNSVBVUXRMTDM2?=
 =?utf-8?B?WWtPRjRIN052SkhwbW9TS3VVVXl5UnpZR2gvaFkremZYbG8rbXFORktRWHN2?=
 =?utf-8?B?dWlkOWl6dUNyUDFJSEtUY0R3Z2pJSlZrVndFWUhHWlNBKzl3M2hPeUJBT3RY?=
 =?utf-8?B?UktRelpPZDRQZ0Jwb1JSU2NjUENERWFHZ2xCMVdpK010YkdGanFJNzJMeEYr?=
 =?utf-8?B?V2Zua2RhUVNGY1hkR2FQelB6S3JPOWtEd2RmNXorVlVTdDV5NG9iazVOeUJH?=
 =?utf-8?B?dWRUSHkyNGhsVDFoczhjNkZjSXVkaWp2NUs3d2VxRXV2T1Nubi9DOC9wQWw3?=
 =?utf-8?B?NnFTV3NGazhpOWUyUXF3RHNmVUlFZElkbXhUZVBFMWVScktmYmhKQTdZMnkr?=
 =?utf-8?B?KzVkeDg2Y1RKamswdlZ3Y1V2OXkvVFVYMmJtcUtUczY5OUZkeXM1bUZvZmpZ?=
 =?utf-8?B?dTY0UkI2NVBDQUNkQlN5L2J0cDRBTmw5RHU4eTNzUzR2eUNFUUEwV2o0R2o3?=
 =?utf-8?B?K1ZTNE01NkxUWWNOMCsrL1dvOWlBL2lOYktZbjlGTExaU2VYZE5MRHd2Q3N2?=
 =?utf-8?B?UFlBVWMxZkN0d1BNMThDNHF4Z1ZqRnd0RU84Y0tMR0Q2OHFkd0I5WXBFdWFL?=
 =?utf-8?B?UlF5amprK1hJZzduQlI2MXR2UU9VNlVrckQ2UUhnN0Q2alN6VGc5d3U5eHBZ?=
 =?utf-8?B?dk1PYVBTRnpWM1hZZGNGUWtUbi9rMGZGcHB6andMaEkzR0loejJVOHgrRzVW?=
 =?utf-8?B?enFlTHlMMUV4SG8rTHljLyt6b1I5cnB4Y0tlUzVERzg3ZTNSejRBUlVOelpv?=
 =?utf-8?B?KzJxS2o4UWMzS2wxMjVXbG10NjBTYjdydDF1a0J1QmFRTkNEK0VXVWk5d0JO?=
 =?utf-8?B?ZXFKTzNCcnFyTFRpdkV1V1dZeDhuWm1tcmUzbnVyeEF4aTN5RDFEQi9mSEJX?=
 =?utf-8?B?ZENJdTBEWHIxc0d2Wis0YzBGRGUyV3lpZnJsNWpYeGd5bjZuZHpmNFcxV01S?=
 =?utf-8?Q?Is2O77KuqpNM+MUVGE2YpSX2F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d33242-1cd9-4020-4ee1-08dce3d880f0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 18:23:39.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK9DyBwTsARJXjcPaUAniRZt6R+eqwcdR8dU8otA3k4aQXr/GcW+y3WVHsTKJnYKHev+LUdfVuB8H6j9UaohCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788



On 2024-10-03 09:47, Mika Westerberg wrote:
> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>> Hi Harry,
>>>>>
>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>> boot screen.
>>>>>>
>>>>>> A bisect revealed the culprit to be
>>>>>>
>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>
>>>>>>       usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>
>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>
>>>>>> lspci output:
>>>>>>       https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>> acpidump:
>>>>>>       https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>
>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>
>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>
>>>>> Do you boot with any device connected?

Great question. A Thinkpad USB-C dock. When I unplug the dock at boot it
boots fine and when I plug it in later the laptop charges from it and the
dock's audio output work fine.

In the midst of my experiments I also noticed at one point the dock
wasn't charging my laptop and hard-resetting the laptop didn't fix that.
I had to unplug the dock from the wall and plug it back. So there is
likely some interaction going on with this particular dock that must've
sent the dock's FW into a bad state.

The dmesg with the revert and thunderbolt.dyndbg=+p is here
https://gist.github.com/hwentland/7e25dedd3e707fdae1185d65224d4d66

I don't see any PCIe tunneling option in my BIOS.

>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>> somehow?
>>>>
>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>> tunneling, and I agree that looks like the most common cause.
>>>>
>>>> This is what you would see on a system that has tunnels (I checked on my
>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>
>>>>             +-03.0
>>>>             +-03.1-[03-32]--
>>>>             +-04.0
>>>>             +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>             |                               \-04.0-[36-62]--
>>>>
>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>
>>> Okay this is more like what I expected, although probably not the
>>> reason here.
>>>
>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>> the BIOS on your reference system? (Probably not but just in case).
>>
>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>> but the system still boots up just fine for me on 6.12-rc1.
> 
> Okay thanks for checking!
> 
>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>> after some messages?
>>>>

It hangs after some messages.

>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>> finds the given node?
>>>
>>> Looking at the code, I don't see where it could get stuck. If for some
>>> reason there is no such reference (there is based on the ACPI dump) then
>>> it should not affect the boot. It only matters when power management is
>>> involved.
>>
>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>> enlighten what's going on (assuming the console output is "working" when
>> this happened).
> 
> There are couple of places there that may cause it to crash, I think.
> And the __free() magic is something I cannot wrap my head around :(
> 
> Anyways, Harry can you try the below patch and see if it makes any
> difference? Also if it does please provide dmesg.
> 

The patch doesn't seem to make a difference. Same hang on boot.

Harry

> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..90360f7ca905 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -157,6 +157,7 @@ EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>   */
>  static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  {
> +	struct fwnode_handle *nhi_fwnode;
>  	const struct device_link *link;
>  	struct usb_port *port_dev;
>  	struct usb_hub *hub;
> @@ -165,11 +166,12 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  		return 0;
>  
>  	hub = usb_hub_to_struct_hub(udev->parent);
> -	port_dev = hub->ports[udev->portnum - 1];
> +	if (WARN_ON(!hub))
> +		return 0;
>  
> -	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
> -		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
> +	port_dev = hub->ports[udev->portnum - 1];
>  
> +	nhi_fwnode = fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>  	if (IS_ERR(nhi_fwnode))
>  		return 0;
>  
> @@ -180,12 +182,14 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  	if (!link) {
>  		dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
>  			dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
> +		fwnode_handle_put(nhi_fwnode);
>  		return -EINVAL;
>  	}
>  
> -	dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
> -		dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
> +	dev_info(&port_dev->dev, "Created device link from %s to %s\n",
> +		 dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>  
> +	fwnode_handle_put(nhi_fwnode);
>  	return 0;
>  }
>  
> 

