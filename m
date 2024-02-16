Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08029768F2
	for <regressions@lists.linux.dev>; Fri, 16 Feb 2024 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708093196; cv=fail; b=CyAByzhsAcNZY4D7SQfMQKMUWR0YhYyLWBFF+xbWNem5rzMcwtxntmUHPEYIXyo3nPkwcozneliQNY8fpWciWZCE9VlhfMgJ+iTy3kxceR2sWGBsy9m7xfJKsjLj93TCR4ZGa/du3jj2w77uRb9wx38mCkZ5zwrAthSw8allL/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708093196; c=relaxed/simple;
	bh=TW6JEZMg68fiD3SMiPRGrI4qf1leX2CwhUGH84szdiM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cocI3rXlueqoyOP3gBdQtSNa6l+xGhjTKG9dRK1hA6mFfn0me8WAIicfNtVeYBrr2TeCzxDjbWsaNoJ4gXE2SW/22JqQt0PD2mf2IJhasXGzBB+UmmS4q9+Ccm/mIGM3SacnJNw3Ohm5zeUkj/BYiYeFzjeMkPCgAG4skhQR//4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mR4a3umB; arc=fail smtp.client-ip=40.107.94.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mR4a3umB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNhWgsILl4lTbFcFQSbWKFJXdxFRFH0oFWUVu+v2UiaQ0D7hhrgOHXi9o1fX1eZ341C3UUtx7KQsnR6Jdrc1gaAemjOOSPTygLPhq5fcygLJe/lVG5gJVqHdYtTQrR6fww9USWTyT2XwIDN2+DkqR3Y0bp5MEXR5LLvecf4ZZ0+AM/0Hc2mbd2XscKeEOhllwTcVTolOQ5rHvpXmWcS3CwPNsX5VdZMNPP4K/6cIQ0A+/P6dHd9j5kAiaHi9KSSumPkB7VApSJIRvmYSmGEVDcIdfEHrjbc5h7L73A1gTBjOg1CVuNQ1huh7cYcsUileqdS9sWMtAeohfPdNUeRd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZoC7VmztzhMWTvqHJIw+Z1CHlYdU19rFikvGXz/vRk=;
 b=PGUtyBvecoiVTrIZdUrX7WqzfaNx9jRnIe/Mc/3952afBosrti3k/FGQ28+TKN2wAwlBBpVWb/T7yqGeBPq3yBzCDAOeJuwV3M5pfp6kIaVD45vBpXb8VK7DyJWsrGN15X5babPfcGYTNOF1GYOCFJeqw+i5sbdITAq8YbjyYIi/09IzfjmYSnM+pWYfKCRFpQFY7imf1VV2cRQ7cK+YWTXsEkiTq/URTaNGzZbpqK3NLXtHvbeNJZ7pLclO4I42QEkXGZMKiClcb3Zq+Y6/XFAtp9Wmys0yS4mW75sHulmG01en/Xgh6t59bNSQvv0gk8g9D7Z8IgN+K/OUyJd7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZoC7VmztzhMWTvqHJIw+Z1CHlYdU19rFikvGXz/vRk=;
 b=mR4a3umB4Pw01cdWIhScF9NBa8i/wAUm6k+sPS8z9GTg1/bSAkjB/xYnYFmpFe1Y/C2dWOO5NDJZva9DP8rtcq/N+fvpnyLYiQpiK6SuPQ2g0aHKgRegDdG+KnkXDEvbCPT/E/zJYoRg6cfEnRhX5e2Qb1hrYw9iR28hQ/tIQes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:19:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:19:51 +0000
Message-ID: <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
Date: Fri, 16 Feb 2024 08:19:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Trolli Schmittlauch <t.schmittlauch@orlives.de>
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:806:d2::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 836c62fa-c8af-489a-a1ab-08dc2efa56b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVAygwDAK0mgI4EHjLYihP7LN5kyBOfaKgEbrlT8G0mKYY173NUGBGNoVUUNwMrVJMLf22wzGpArFVNLyo0pZ4VhXeKIRwK2SUD22nXDPy7vbW1RM3mlyB4SdESxNbfEyWigrNOxTxOGCgabKhEA+f63zi6TI8GDs5O2Wj+MGQpGtEArM+ROWRpf4wxA8YqYdxIsBQCwdO2MbXgqDNzdYqq6AaX3KNPuTo4fjCRJmgVWJ1MNPbAYgpsx8SUNJB/5B7PAp+lA0hNv3hhm9vtC4eLElcwgRkl7uXpj8ju3AdZHEo+5vDigs/RDFjAF/ktn78piV9psvNi8p19389tlXsi8b5ISQCy9vLwuuLxd41/oKBfXqlf85DjRf8yUx4EVPKt6pAHtJOig5XXtftkFIo6b7AvqyYS3Q3htvFPb8cZzZTFMDI8QJvmrk7blnvwLsDNlPnYJ2OjsKe5U+PX1KT7QZBY0j08+2/MnyVS3B4Zl+x9nK9oEnB3XUkw9Lco8h4jRa7k4UEHvLpyMzOktkzDY/HMlWVGrUi0icgDBo93jr0f7zzWm/Jhqf8OY9xn0xcLm3lMOJYBzDmagZbnEQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(230473577357003)(1800799012)(186009)(64100799003)(451199024)(15650500001)(44832011)(31686004)(2906002)(5660300002)(83380400001)(26005)(2616005)(36756003)(38100700002)(66899024)(6512007)(6666004)(478600001)(66556008)(53546011)(966005)(6486002)(66476007)(31696002)(66946007)(110136005)(316002)(6506007)(8936002)(8676002)(41300700001)(45080400002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVhFa3BQdG96TEVpY2tJenVFT1ZRM213VGxQbGNOVkQ4Q25Td0hmVXNIL0xE?=
 =?utf-8?B?akxMelNHNnlTazF6Vlp3azFad1d6T3o3ZDlUM1V2cFFmV29ndG1hVG1FeDRq?=
 =?utf-8?B?ZWZsbklIRm8vK0h0Vmk5Zm5aWjU3OWZJYW5YK0d4Nk1Ub2ZKbkdPeXdWUStn?=
 =?utf-8?B?SFZRQVNvMkxPSS9MMW1xWDVWQjNjL3VRdUV3Rnh2S3lmUFlZemNISDdmUEts?=
 =?utf-8?B?NzRCaFZTQzRuN0hiV0hldW1rKy9wWjhRUk12RW1RdHZ4TzQ3RTlJUG45b3Yv?=
 =?utf-8?B?Qkp6aldhR0RjeFdCZVBiQWhnUitkRVNzU0FCMmwwT3JnNlQvNnJUM1JPbUxS?=
 =?utf-8?B?TDhETU9jMW9rL3A0Mzk3SjRUK2Q0NnBkSHNVTGF5M2RJT3YxMWhJblZyTkVk?=
 =?utf-8?B?WmJIV2gvQzhST2xPSXFOK0dTWkFqbm1xTHc1RkpCTDZIcVNxQXNJMlNHWWxZ?=
 =?utf-8?B?VTB5UHFLSVQrRFhZWDRVVXdRRzBmQTU2bWY5MnlleXdIZFdnRHE3TnprSElk?=
 =?utf-8?B?MzM1ekdKZXVqY3RiZk1DLzVPeWw1LzY0YWxSYzNKUnk3RHQxVmRQNEdUWEtx?=
 =?utf-8?B?Yll4ZG9XaGY4S2RVb0srSFRZanJRUy9wZEd2dGUrT0w1dzhxWWYrbHMrTTdJ?=
 =?utf-8?B?UGxsL0lYSUF5bUxnSG9CRGtiQ0JTL1hyNHlGblRxMWwrSFVNUTB2RmgrNjk2?=
 =?utf-8?B?NGorQ2c3VXRaK1lPMThNZ0dwUHRoeW8vL2Y4ZVZkRUwyZmVHanZSaU9kd1Ex?=
 =?utf-8?B?REp5eHdkTXJzNTZ2OVV3SktoT1lyV1g1YzU5eFZoNnhGdlNycEswT0c0Rmxq?=
 =?utf-8?B?b3dUSEFxM2lJSmFFbmV0SithR2lRWEhCc096TkE4Q2pDVnhiRW1rLzkxVTVO?=
 =?utf-8?B?NUJvZ1JHRFpjUXRvMlNJQzlaMEUzUE00eWNGbU5Ga1dRQTFoWC9vZGtJSFYv?=
 =?utf-8?B?WHhVcXdZUkUxa01tdWREekFSeWJBVFJPVUxjUXNYMitXMFFMSUltWHNtNU9X?=
 =?utf-8?B?U3RYRUZsOUdwWVNGWXpmb2Q2cWduUDVjdjFzNmp4RjJZTzJxNXN2UzRMK25E?=
 =?utf-8?B?NXdaRkR4THFWWEFWZUJZNDB5R2k0YkFTV3k4U1hRNUpibDg3bTFWcWNpaDJN?=
 =?utf-8?B?aDVyVGxkNWRmOHNnUCt5eEpvZ1VXd0xIajZlLzhWV29KQlNPaCtTT3Z2R2ph?=
 =?utf-8?B?aXcvUEhoeDBXM056OVcyRG9ULzZQSmtmd1FyOHBqdzBEYlBjU1ZaYjVJL09T?=
 =?utf-8?B?citYaTRmclBlc0lqZkJVTkxIaTRVQzNiZjFxNGlQVEM1WmtoNHRNTndhVHBU?=
 =?utf-8?B?OTV5My95MnM0TndQQ3NuM3hNcHNscGJ2bXpJM3lLTHZmcXpNTGlHVHAxTjFP?=
 =?utf-8?B?S1NXRDJUaHp0RWhjU3d6S1crZmd5VDZ3Q08yQU9tcmFmZE9XWFE2ZlVCckNX?=
 =?utf-8?B?aytYSVFuODVDOWVnWlBZb0x3VkkvSDErWFFiQ3laa3FMa2FCclBzem9QUmlG?=
 =?utf-8?B?U3lRanM3RnFxbEJtcDVaRllKOUEyaDZXcXVQVTUzYkdvem1NbTdTWUgzckNi?=
 =?utf-8?B?SHVydW1wQlBDekF1Q0RaQkhxU1VaUzhvY1pFNm5MS0J5aGFmcFowTDRtWERY?=
 =?utf-8?B?MXp1Nm9PeUI5cENjeHpDd1VFMnhqU2duNnk5Rk02dW0zQ1lUa1E4NlY0d0NU?=
 =?utf-8?B?aE0vOXAxLzlVTzJCS2xiUmhKNldBbGVXV0dRNmR1c0lHREFOREJVSmVvM3J3?=
 =?utf-8?B?QWZYQlZTMk56Q1hYM1FFRCtIUG5tUG10SDdBM0RWMVBneEZYbXMyNmtlUUdL?=
 =?utf-8?B?MklLVjNGalVMMVc0eFhYclRKeDVqYjJYQ240K0xsY2JtYWg0NURiSFVTenE4?=
 =?utf-8?B?bDRjVmFBMHY4cFcwOFgwSnFEYnNPN3ZzeWh1UlZYdXJzQkFoSnNJL2NjOVBx?=
 =?utf-8?B?NlZuM1BrOFQvV25TSnB3ejkvVHFnZXB2ZmpkQjd6aTR1cHducnQ1YVJvclpO?=
 =?utf-8?B?RWNUVmRmekxGOFIwamJON0ZMVkFWNzJNUDFtSzNtNG9TM00vWVBkRkc3RmRn?=
 =?utf-8?B?SUhOWjd2TllBa1ZCNGROK3JWN1NNcmY5enoraE9xQ1dONlhOTFBEVGJoc0hG?=
 =?utf-8?Q?xXq7BC5kdUzqXLU8sVK0mCSaJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c62fa-c8af-489a-a1ab-08dc2efa56b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:19:51.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3S4e36r42x5drBinLHOL7CD5W4uJfvBwJ/iTTa7WHTOb2D/xpXDnKhMKp9CtdMH5iWijs5Y3JQl+EytdNe9DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747

On 2/15/2024 23:05, Linux regression tracking (Thorsten Leemhuis) wrote:
> [moved stable list to bcc, as this is nothing for the stable team]
> 
> On 16.02.24 03:42, Trolli Schmittlauch wrote:
>> I've found a regression somewhere between 6.7.4 and 6.8.0-rc0 that
>> causes my Framework 7840 AMD laptop to freeze after waking it from a
>> suspend. I can reliably trigger the issue, but unfortunately cannot
>> provide useful logs for now and hope to get some help with doing so.
> 
> Thx for the report. I'm CCing Mario, who has some experience with this
> kind of problems and often had helpful advice in situations like this.
> He also wrote a script that can help find the root of the problem on
> systems that use Suspend-to-Idle:
> https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py
> 
> Or does you system use ACPI S3 to suspend?
> 
> Furthermore: could you please provide the output of dmesg after the
> first suspend? Maybe something goes sideways there and causes the later
> resume processes to fail.
> 
> Have you tried if the system is reachable by ssh from another machine
> when it seems to hang?
> 
> And you might want to configure your kernel to print all messages to the
> tty consoles, maybe then you get to see what the kernel prints before it
> hangs
> 

There have been a lot of regressions in 6.8-rc both in GPU scheduler, MM 
and AMDGPU.

If it's not already fixed with the stuff that's going into 6.8-rc5 this 
weekend this is going to be a relatively difficult to bisect.

Here is what I would suggest:

1) Test 6.8-rc4 + patch 1 and patch 2 from this series:

https://lore.kernel.org/amd-gfx/20240208055256.130917-1-mario.limonciello@amd.com/

These two patches are headed into 6.8-rc5.

2) Test 6.8-rc4 + those 2 above patches + these two from drm-misc-fixes

* 
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=02f76a9cd4494719600baf1ab278930df39431ab
* 
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=8746c6c9dfa31d269c65dd52ab42fde0720b7d91

These two patches are headed into 6.8-rc5.

2) If that doesn't work, then do a bisect, but you'll need to apply the 
following for each (applicable) step.

* patch 1 + patch 2 from 
https://lore.kernel.org/amd-gfx/20240208055256.130917-1-mario.limonciello@amd.com/
* 
https://github.com/torvalds/linux/commit/66dbd9004a55073c5931f5f65f5fe2bbd414bdaa
* 
https://github.com/torvalds/linux/commit/d0399da9fb5f8e3d897b9776bffee2d3bfe20210
* 
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=02f76a9cd4494719600baf1ab278930df39431ab
* 
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=8746c6c9dfa31d269c65dd52ab42fde0720b7d91

>> How to reproduce
>> ----------------
>>
>> The last working kernel release was 6.7.4, the issue appeared in all 6.8
>> release candidates from 1-4.
>>
>> 1. normally boot the system with a 6.8 kernel
>> 2. suspend and resume the system 2 to 4 times. Usually, the freeze
>> already occurs at the 2nd resume.
>> 2.1 graphical approach: I've reproduced this directly from the "Suspend"
>> button in my SDDM display manager (X11)
>> 2.2 TTY approach: You can also directly swith to a tty after boot, log
>> in, and then issue `systemctl suspend` 2 to 4 times
>> 3. After resume number 2 or later, the system freezes while resuming and
>> cannot be used anymore. The screen is switched on and displays
>> something, but no inputs are processed and the image is static.
>> 3.1 graphical approach: When suspending and resuming by closing and
>> opening the laptop lid, the screen is black with the cursor displayed.
>> When doing so while keeping the lid open, the display manager's
>> background image and a cursor are displayed, but only statically frozen.
>> No keyboard or touchpad input is processed.
>> 3.2 on a TTY: When suspending and resuming from a tty, a few kernel
>> messages still manage to be printed, but after that no new information
>> is displayed. E.g. when keeping a `journalctl -f` session open in
>> another tmux pane, that journal output does not update anymore. Keyboard
>> inputs are not processed anymore. Nonetheless, the cursor continues to
>> blink regulary.
>> I've attached two screenshots showing the situation with kernels 6.7.4
>> (working) and 6.8 (broken).
>>
>> Detailed Description
>> --------------------
>>
>> In most cases, the freeze already occurs after the 2nd
>> suspend-resume-cycle.
>> Unfortunately, this freeze also appears to block IO, as after a forced
>> hard reboot I cannot retrieve relevant information from `journalctl -b
>> "-1"`. The last retrievable log messages are from the successful suspend
>> action.
>> I welcome any recommendation on how to retrieve valuable information. I
>> have not yet played around with cmdline parameters relevant for debug.
>>
>> System Details
>> --------------
>>
>> Distro: NixOS 23.11, kernel 6.8 rc1-4 compiled manually
>> kernel: Linux version 6.8.0-rc4 (nixbld@localhost) (gcc (GCC) 12.3.0,
>> GNU ld (GNU Binutils) 2.40) #1-NixOS SMP PREEMPT_DYNAMIC Sun Feb 11
>> 20:18:13 UTC 2024
>> hardware: Framework 13 laptop, 7840 AMD series, CPU AMD Ryzen 7 7840U
>> x86_64
>>
>> In the attachments you find:
>> - the used kernel config
>> - my cmdline params
>> - 2 screenshots from the bug occuring when triggered from a tty
>>
>> Next Steps
>> ----------
>>
>> I intend to bisect the issue, but this can take a while due to the need
>> for manual testing and a kernel compile cycle requiring >30min for now.
>> I am mostly reporting this now already to still raise awareness in the
>> RC phase and to have something where I can point other Framework laptop
>> users towards for reproduction of the bug.
>>
>> All the best
>> schmittlauch
>>
>> Disclaimer:
>> I read the kernel docs on reporting issues, IMHO these were a bit
>> unclear on whether RC kernels are in the scope of the stable and
>> regressions lists.
> 
> You mean
> https://docs.kernel.org/admin-guide/reporting-issues.html ?
> Could you elaborate on that? Did you mean the TLDR version or the longer
> version?
> 
>> If they aren't please point me to where to do this. So far I had only
>> reported bugs via the bugzilla.
> 
> Ciao, Thorsten
> 
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> P.S. To be sure the issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v6.7..v6.8-1
> #regzbot title suspend: Framework 7840 AMD freezes on resume
> #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
> 
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.

