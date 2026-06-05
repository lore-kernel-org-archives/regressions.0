Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D73A4523
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685657; cv=fail; b=pwSOCPX6cnOdZ80UsCFk6OY+8SHI3qTpJh3R4kCqZcZ1OnzD5M9fhjGhEUqY1bgvHNna1wAxB+yZJ7uylPhGcAinwTIGNZcs3gHxn8UZ8lCGZSe5NhJ3GPqi39DAK2R1Uch2xGV/DOnZaRCK2gDqVDsLUBKvg4cO86dPhuwrTWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685657; c=relaxed/simple;
	bh=gydB5lThqnyD2C+O4gGGdvBASGR+NumKxiaWKT2UIZg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eagShESit7je4teZ2G8UYS+ecmloHesb+3tEq8Q+IO42sLfC4f4bGpkKuuye3iUcELZhnrAonNZCqWliexyGnuZo3iZPpKY1Az7gx6s6NWQo8clngLCUU6NHKSeYDF6dR6UmYQGfWBJy9kYayTPVXquZmKgd+xdjE7YcC4dGkjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BkCMcssl; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BkCMcssl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3oDVNkqZtkiNfxsF/8Ryb3lkWXiE8qoaPur1kns1gfhJ1+sgqqWg5J0TTu4rk0J+yXpwRWfwMmdtlVNguHYnP4jTslBRNjSlC9uQXZ7JjCXJ7Bw73ULw54pvHW6cs61L2C5vvN2nHaRMpgEpqlIfQKawmxPqxu64cHFqpR2ohqHFOBzTpWnVlgbpCZ5WwgGld5hro8yrEc3H+hFcH4/fh/h07B6tipe8B4F5cAc99w73sk4LOo+ayw4yCDUDrjqtL/lF/JW/kzZt4xh2yG0mePa7anMwUkIrSqFxV5dwsxMxxUiqQ3HneRhIGvYDdm8x/gUxHKU3tttZc0EXU0vqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeNgUZXueu0V5ehY07VasiI+PWla3WQp6PLrbRsIpKQ=;
 b=R1V9UZxHU5LN80PTqmQsV/r6yMdr3JcqGS56wBIObt1bdBWhIPL7+G88go5XM7l1LEkXwOblq6sOlEXbPLrGdYo/B4poLhiXyWrsXM3pUe5wLlSoHMnzl786NlPJJmuxYMdJ6Ik4XUVrVfzj5SsF3x4yflvmWrY2bfoKu1uCg1ZaDDO7gfbn+Fzt2lwYJ+atq81o3PjrcBwENnEfLivA2OrVkw5LTUMvOCyrVVnZitx/s391/Avlbt+lRMYvEiUin+e4FJ7Fq0V39aB9Sk/XwDzrOlepzzIP3Og+pFFXlLbI58djZ326zkkG6XifcRwdaSuWOrdHWYbIcZ7tBjU7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeNgUZXueu0V5ehY07VasiI+PWla3WQp6PLrbRsIpKQ=;
 b=BkCMcsslIsB/hyUvtlW7IbuXimJvcs/sgE8yLp2s6XH9RJvdD8xY/VqIsFwoerwl/kl+tdZoaeLIAb2ucX200Yl8pKZBaIafNjZEctIsLzEaLOu+LRsPvsxfqz2O6t5Q+nuQR1XwPRmjv+fEXfabzsNcAAyWN4WLLTvtAiHSmaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:54:13 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 18:54:12 +0000
Message-ID: <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
Date: Fri, 5 Jun 2026 13:54:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com> <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com> <aiMLK1Hvk0Fmyimm@mail-itl>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aiMLK1Hvk0Fmyimm@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:610:32::10) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: a41634bb-3730-4b44-da7f-08dec333d57b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sw3KvpxkoxCWrlEXiSADKL1e5hz2q0kWPtz97+ng8Tbu3dgoX9PfMDmmQRWnSjWNMXntTWYmmTD5WrQTmQ9XSJROtHl8a2W9mq0bt+dVRb9K+RkGnsflWnsG3tfPwe5mJqDk0RZm9PFTGuHclzuL8L6/bo4kvDxzX6pelUzMzPPADHJFqhmW8anF3vQQwWgLucXkVlAiv5hB8dh+NUKqmiVM9yRlVzRI2UfX8UACq+rVDdhZ4ATirybBdtHE5jefEUitQvY+w7Ca0DElJHz3HGeIvUPVRascSegNCaSpcuIzd6fXFvHQA+Ao15jGvCVMBhyaWWjCyo/MHCyQ1oZtitVGkz1b8pYQeW2cRMgMeTsHk6sae7oXhzCVNf6dH4wMtvWAnfXBwM0HOwIHzZW1GSw3XLpctED276qUXmCEJCwXkmdvtp0+MxJC8+cWj4AwNzO7OTwJFkg0m4zZ6V3vYXbPwP0ZtffGDb2nuGrOBjntAsQodz3aHK0hoBcLfa/J/HyUr4U64aTq9iCCVigK9nqeeLFLtli9j5gCp0xgbYRVxL7letoWX5aBg3zhOYJyCGOHZRRfW+Wtnk2j+yB/CkQwKAHtZtqgNf2ezfmuMYI0PCNloBO/SbWt0FyNjGjIslNcawkt6wLaZRXIT5G0fgozhFcnkkoTf57M4FfQSABRS3ja9gguAK3l3c+A4GcG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmJ0emZxaDh6c0V1QjJhbnkwVHlGRDZMQzVjRmV5Y3JHcERHSEZQcmR6Zmc4?=
 =?utf-8?B?UXhhay96aUVOY1BnNUNtTGhBY3ZvcytWQjVsVWt0SkVVR1ExdnczK21TeXNz?=
 =?utf-8?B?ajhYaXY4RHRoV3NZeTg2UlVKNjhGUHJBc3ZIWG16Z1E4aW1iTnUwV2dpWDdD?=
 =?utf-8?B?M0VCVldVNXhzQ1ZTSkRoZ3c5TmhSclhrVTlsRVFObjdoT0FlVytobFZZU1lu?=
 =?utf-8?B?ZHlKRW4zUG1VYWdhMTRUa3ZHZDh0OVNJQ1JWa25hakxMc2k2TWsrenIyOG5w?=
 =?utf-8?B?RW1sS0x4L241SkMrdkExYUFzaE1kRkZEWFR3b0t2Q0lmNzlyNHpjRENlY011?=
 =?utf-8?B?L1lGakRMbUhtZFRCSGpxMmFQM0l5VUtaN080bnZ5RTZuUVU2Nks0cFg0ODZU?=
 =?utf-8?B?cGhzenEwdTBvektkR0t1NFh1ait4d3R3ckpUSFRoTEt3cDkySFBaNkZUZjEx?=
 =?utf-8?B?T1l1MDNJZVpmckJzMzgrSUErK1JFdi9jU1h4bUYxT3VNcEZRM3BJOUwvN1Rm?=
 =?utf-8?B?R1JUeHU3WkVURlBkaTl4bFVQU2Q0M21hdEN0K0xKcG1idENjQlhxRnJtMHlN?=
 =?utf-8?B?ZFZXdU45ZlZ1V3NnWXlrazc0cUNPYjNMQ3NkRUc4VlJsRnhNazd4RCszNlFC?=
 =?utf-8?B?bVhBMXVOL3A1TmlqUHFBMTR3VmlYMTNWOUlFUHpsa1pCYkxpczlLSHU1VzFa?=
 =?utf-8?B?cjc1OFYzSXdxeTBrQ1hqMjcwTlVqd0dWRVhSNy9zSXJYQ1FyeFA4SDlLZWJv?=
 =?utf-8?B?VzU4Vk5Pb2IwZCt4aVpQOWExQmQ4L2d6MURCZFhmRFBKTTJJWUsxMSs5RVla?=
 =?utf-8?B?THUvSW9YZ3o5N0xSZjVOVDdwbE1seEM0OUx1T2lqY1A0dTA0aEdoVkRRbExY?=
 =?utf-8?B?TUZnNzF6TmpmdFRwM3F3eFQ0bkRIdGRkRG4rZytVVmFwU0hoZ1FyZDdsSFZQ?=
 =?utf-8?B?RWRzblhZZGxxNWZLTDdYTEtBckFPblJWTzNXVXBnUVQ2QklUTWFXT1E0M1hM?=
 =?utf-8?B?TUdFaHc5bzJ5K0tjbzlDN3V4Yzl2Wis0Q0J6UDVLS0tWUlZsR1ptc2xZWTRh?=
 =?utf-8?B?V0tEYTloM0w1aXZBWERocmVFeVlWL2s2SE45TC9JNmRPL0FSL3J0TEJIMENm?=
 =?utf-8?B?UlU2RzZ0eTdCRWRjNy83UjA2YzI1M2p4NnpBajlLbzk5L1Y4WnlvYVQyUy9w?=
 =?utf-8?B?R3VXbzFraXo3bno3cnpqV1FjdGRNY3pJVUM2WkdIMmloQjQxWWM5bHdkN3N3?=
 =?utf-8?B?R1l5YzVpQXVmcmorNW1rWWxBTW1SMGZMNlhLUXZXeEQxWjlyTnNuamZjV0ND?=
 =?utf-8?B?UmdXQ205RVlNSjhUVDRmUGNtVm0rUVFVZ3FNb0lsWjFCemI2UDQ3U3JYbmlt?=
 =?utf-8?B?M2FOa3hYM3ZXL1p2bVBVK0d3eHpiNUYrVkhKVjhXS2JnQTNrQnU5MVliMW5H?=
 =?utf-8?B?Q053THA1K1RvNUl0bUlldzN0aExZbm9VRGk5RDdDbWFKSzFiWTUvVmdsY3Fw?=
 =?utf-8?B?bHJCeU1IUzdHMi9kand0QlhQdzJxc3ZWWEsva25yZzRTWTMxa0MyRGprL3A5?=
 =?utf-8?B?TXFRKzREM2krcDU4Y1VoL2cyUVU0SmhHSmZPREFJSTVVQWxNSFk0VUVuMGQz?=
 =?utf-8?B?OU5FVDNXLzR3dmVzK0N4eVdMSVVqS2dmcTJ6TWVyZVBUczkzRDcySTVKOWpD?=
 =?utf-8?B?WE5rNTBEUjQ1THRDbXdMclBsVkN0N1V2eFl5azg4UGdFWXhSanE2QzlPbngz?=
 =?utf-8?B?cXVZcEl5TlZCZ3Z0d1h5NnNIR3Y1dkVSSEFhN2FNV3BwdndqdUVVVVVDZTJv?=
 =?utf-8?B?bE01eGNBejZRbUJvdzI5SlpsbDRkVm0yZHZBS2NDd0JNdk9haWsyNHR4RDRx?=
 =?utf-8?B?Q2hEQnhUbFM2OWEyaWE3U1BnRkFXSFliZE5MRkpqT0dsSU9weWZwWUpKeTlC?=
 =?utf-8?B?MnNRNlFQYXhBcERueWtnSE53aU05bHhEZWJEWUtoMjc4WkxqNFdicnhSWUVL?=
 =?utf-8?B?K1gvNW9QUWdEdXFYSUZ3MURXMldUZVdRTlp2VEVYczIvOTkrSXUwUGRFS0pr?=
 =?utf-8?B?MzRGeGlDdERnZjRtcDF3K3M4WnlBckhVbnJMMjZXRUtvRzZ5aXA5UE54U1ph?=
 =?utf-8?B?YXhVUWV3aVUxT3B5cUZvaVRXRHB1bVN3M3JkMFdqZHBDOW9DRUJYNDdiaGlM?=
 =?utf-8?B?NDFsWnpVa3lkbWliYm5MMW81WDVTa0VmOUNkSmZyQTRRVlBIL0t3TUJDSDVJ?=
 =?utf-8?B?Z0dHRmo0S21CMkRZeTlNMVdNUXFMeDEzUVJwY1RsbEIrc3dmZlFDSmdtNzYx?=
 =?utf-8?Q?eatZIsr2lah3CSoXe8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41634bb-3730-4b44-da7f-08dec333d57b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:54:12.7756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb37JXn84IIodzTPTQmX4ny4LhCpKgEXuZsSDmybvnynj1+w3UrXtpA2BYh76PEk6HU8QHW/5G61JAHTh1yv6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183



On 6/5/26 12:45, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 05, 2026 at 12:36:29PM -0500, Mario Limonciello wrote:
>>
>>
>> On 6/5/26 12:34, Marek Marczykowski-Górecki wrote:
>>> On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 1/12/2026 7:01 PM, Marek Marczykowski-Górecki wrote:
>>>>> Hi,
>>>>>
>>>>> I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
>>>>> with AMD Raphael/Granite Ridge USB controller passed through.
>>>>> It worked correctly in 6.12.59. Between those versions, I don't see any
>>>>> relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
>>>>> but the AMD node driver did got some changes, so my guess is one of them
>>>>> is to blame. I know the good-bad range is huge, but there aren't that
>>>>> many changes to the AMD node driver in this range.
>>>>
>>>> Is this perhaps a case that only the USB controller was passed through but
>>>> that the root controller wasn't?  That would lead to a case that
>>>> amd_smn_init() was never called and thus amd_roots was not initialized
>>>> properly.
>>>>
>>>> So it would be a NULL pointer deref.  If that's correct, something like this
>>>> should work to avoid it.
>>>>
>>>> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
>>>> index 3d0a4768d603c..894823b444d47 100644
>>>> --- a/arch/x86/kernel/amd_node.c
>>>> +++ b/arch/x86/kernel/amd_node.c
>>>> @@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u32
>>>> address, u32 *value, b
>>>>           if (node >= amd_num_nodes())
>>>>                   return err;
>>>>
>>>> +       if (!amd_roots) {
>>>> +               pr_warn("AMD SMN roots not initialized.\n");
>>>> +               return err;
>>>> +       }
>>>> +
>>>>           root = amd_roots[node];
>>>>           if (!root)
>>>>                   return err;
>>>
>>> Thanks, I finally got confirmation from affected user that this patch
>>> fixes the issue. From what I understand, adbf61cc47cb ("x86/acpi/boot: Correct
>>> acpi_is_processor_usable() check again") was not enough.
>>>
>>>>> Original report at (with full kernel log etc): https://forum.qubes-os.org/t/yet-another-usb-keyboard-thread/38355/8
>>>
>>
>> There's another patch being discussed.  Could this help?
>>
>> https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_crate.local/
> 
> Especially with 2/2 patch there, yes, looks like it would help too.
> 

Can you try Boris' inline proposal specifically?
