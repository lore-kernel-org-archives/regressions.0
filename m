Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AA32260C
	for <regressions@lists.linux.dev>; Sun,  4 May 2025 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746388971; cv=none; b=izOEY+x0ZWr8G82Pbsmb6SZjYyQUp75H/eeOZIY9ybbX8TLXwzvCU37TvRWXgr8s1Bu9z/VRLAPB3bxiPCQWprPSZpUlx9MfZ0vYc5efA6r/UqMgBgOmV7kcO9IUrOEiMww4ld9B2oPwQmvPjrErp27jO6d2iFhTfVYKKCqT+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746388971; c=relaxed/simple;
	bh=oLVEQiT1E2hIWP/2lXC5CJo98Oa/o+aN9Njjq9Jx67Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVTlwJdb3C4/LEe4bo+GIT/od3D81XrbGrC+ZssZdOgc93WATn8AjNYRqE+pKHYtDzFpsmYumek5TuurRWe1W787Nvm5rB7cNy93KIYB00nvQ+R32oeDyngouExojQ8DVLsKAGwunSPHzVt7Sx3x4/PhTKalQy5g4MuMShjq6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPEGMSjG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPEGMSjG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad1b94382b8so94706366b.0
        for <regressions@lists.linux.dev>; Sun, 04 May 2025 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746388967; x=1746993767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vI9uJQQEGi80Mtf6IsTHJ7pV+pxOXaUOfgENHS4qtWM=;
        b=NPEGMSjGoE3Jb4axPZ3Z0hdvJNT7/MtvEgwSp8wZNfQjHQEe+BHxPgsiCSa70mUhZf
         C+ZCIuv2+t31j5psgUhn/hh5/boCppQ+ld8/ocOpryDEke9GXYToa10H1UbuDip+KfwX
         Mo6ePRHZH2/xD93ZvZSQMWE3nJfF19jKFwpavxW9r8T7SkI+IS5KtHZubyIQ6T+5xOzb
         wrhionBjfhhz0jhuPriHT/GdRNOrSBnhoGVbK7bCNR7q3cvBL4IXX8UFpdcPpbVfMnBA
         C0PtWdikwRwJl/sCu61XX6ussld0g1MS4r4TgE1CoepcGTz3Bd4I/W4sy23vzLlL3NB/
         5LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746388967; x=1746993767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vI9uJQQEGi80Mtf6IsTHJ7pV+pxOXaUOfgENHS4qtWM=;
        b=QsTINbdeEz08H+3wXNI1dogrQZxJJ9Knj9Xc0kzgJFx2zPRGEZyFVP/AvePntpJIXc
         k56lcsiJckYpV4+eLwPyc6Uie27trltZ4i6d8TlUtvvAM+NkeA7Cvr25ehHGwsEi5bnv
         hRoI/rUMoimxoM3/Ps0W4JDSer8wcM+f+Hvi0N/ofG/vKC1WG3f3W/8OasPPJtE05YUH
         jDBZMtypXPwfU6Oiek4TGvhbuBtvm/+2Pbc+YMoMMksDpG85dx8o0rP7L2O6qiOCe3wH
         FB0OmIO9gxxnhH3jnesUB70Uwnz1uEP9rO8J+UCfCL+SoPBEYY/W83NMMwrmHfdR5Cnu
         gMjQ==
X-Gm-Message-State: AOJu0Yyb4QTbPJCGOP5nIOAMawVlb+RAc/H8WHFnL9mgbhlkaSMQMmuj
	oCCYR0EXf1CVEMObrUwKGw4Ig/yHjb8UGaLIDddW3gTZ9IXGxyu2
X-Gm-Gg: ASbGnctHxd7nY6lDBB3AEpTgUGU5vkZel9O8J7EBRSC+U3KoLGMJco0vr6fMyiOCUcq
	z+H1BT1Zyncgv8XlxBavXNNwXc15I2le8weJwRgWtUQJ3xTrQagEF+Abt5ah4YqaRrcnrfDsEhM
	K9Wnf0TkOo3EfvZJBCVxNOepSEChNmG3jfFSAp8NDomtuTHYUmiP5+v7FGD+ws+w52x1SArWAN/
	892/mfji1Awd9XbSHpVpJYTisRsgeLd1FGH7+L+cAGJFnu9tt0cSnQLRXuFnvldxDTsKKyx0qZI
	eu9hyLqDT3RpMvKl7sTq43TAwAM71tLpeT4D5qKAA1IlO7Sigz3T
X-Google-Smtp-Source: AGHT+IFzIx0SkLpaMMywlpzI8p9RAg0tFozdlH9E8C95r/IlGPu+9Ld92ZWDv/ibJ5NRkCtXU9wetA==
X-Received: by 2002:a17:906:730e:b0:ac8:14ad:f3cf with SMTP id a640c23a62f3a-ad190655119mr501785766b.23.1746388967311;
        Sun, 04 May 2025 13:02:47 -0700 (PDT)
Received: from [192.168.178.68] ([91.90.160.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146a30sm364682766b.30.2025.05.04.13.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 13:02:46 -0700 (PDT)
Message-ID: <03a18f37-9b22-42bd-a3ca-86c8d95b4b1d@gmail.com>
Date: Sun, 4 May 2025 22:02:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
To: "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, Vijendar"
 <Vijendar.Mukunda@amd.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
 <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
 <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <difrost.kernel@gmail.com>
In-Reply-To: <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/24/25 6:53 PM, Prasad, Prasad wrote:
> On 4/24/2025 12:57 AM, Mario Limonciello wrote:
>> On 4/23/2025 2:12 PM, Mario Limonciello wrote:
>>> On 4/23/2025 10:18 AM, Mario Limonciello wrote:
>>>> On 4/23/2025 10:06 AM, Mark Brown wrote:
>>>>> On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
>>>>>> from suspend system dies (no logs available) soon after GPU completes
>>>>>> resume - I can see the login screen, only power cycle left.
>>>>> Are there any updates on this from the AMD side?  As things stand my
>>>>> inclination is to revert the bulk of the changes to the driver from
>>>>> the
>>>>> past merge window, I don't really know anything about this hardware
>>>>> specifically and "dies without logs" is obviously giving few hints.
>>>>> None of the skipped commits looks immediately suspect, there's
>>>>> doubtless
>>>>> some unintended change in there.
>>>> This is the first I'm hearing of it; I expect we can dig in and find
>>>> a solution so we don't need to revert that whole series.
>>>>
>>>> Let me add Vijendar to check if this jumps out to him what went wrong.
>>>>
>>>> * Can we please see the full dmesg up to the failure?
>>>> * journalctl -k -b-1 can fetch everything from the last boot up
>>>> until the freeze.
>>>> * Any crash in /var/lib/systemd/pstore by chance?
>>>>
>>>>> Adding Mario and leaving the context for his benefit.
>>>> To double check - can you blacklist the ACP driver and
>>>> suspend/resume and everything is OK?
>>>>
>>>> If possible can you please capture a report with https://
>>>> web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-
>>>> tools.git/ tree/amd_s2idle.py both in the case of ACP driver
>>>> blacklisted and not blacklisted?  I would like to compare.
>>>>
>>>> Also; can you put all these artifacts I'm asking for into somewhere
>>>> non ephemeral like a kernel bugzilla?  You can loop me and Vijendar
>>>> into it.
>>> FYI - We managed to track an S16 down and can reproduce the issue.
>>> It's a NULL pointer deref happening on the resume path.
>>>
>>> <1>[   74.046372] BUG: kernel NULL pointer dereference, address:
>>> 0000000000000010
>>> <1>[   74.046375] #PF: supervisor read access in kernel mode
>>> <1>[   74.046377] #PF: error_code(0x0000) - not-present page
>>> <6>[   74.046380] PGD 0 P4D 0
>>> <4>[   74.046384] Oops: Oops: 0000 [#1] SMP NOPTI
>>> <4>[   74.046389] CPU: 4 UID: 0 PID: 2563 Comm: rtcwake Not tainted
>>> 6.15.0-061500rc3-generic #202504202138 PREEMPT(voluntary)
>>> Oops#1 Part4
>>> <4>[   74.046394] Hardware name: ASUSTeK COMPUTER INC. ASUS Vivobook
>>> S 16 M5606KA_M5606KA/M5606KA, BIOS M5606KA.304 01/24/2025
>>> <4>[   74.046396] RIP: 0010:acp70_pcm_resume+0x4f/0xe0 [snd_acp70]
>>> <4>[   74.046405] Code: 48 89 45 d0 e8 c2 da 98 fc 49 8b 5d 50 49 39
>>> de 75 18 eb 7b 48 89 da 4c 89 ee 4c 89 ff e8 29 cc f6 ff 48 8b 1b 4c
>>> 39 f3 74 65 <4c> 8b 7b 10 4d 85 ff 74 ef 49 8b 97 c0 00 00 00 48 85
>>> d2 74 e3 8b
>>> <4>[   74.046407] RSP: 0018:ffffd12644d13880 EFLAGS: 00010286
>>> <4>[   74.046410] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
>>> 0000000000000000
>>> <4>[   74.046412] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
>>> 0000000000000000
>>> <4>[   74.046413] RBP: ffffd12644d138b0 R08: 0000000000000000 R09:
>>> 0000000000000000
>>> <4>[   74.046415] R10: 0000000000000000 R11: 0000000000000000 R12:
>>> ffffffffbd774fd0
>>> <4>[   74.046416] R13: ffff8a9f13051e00 R14: ffff8a9f13051e50 R15:
>>> 0000000000000010
>>> <4>[   74.046418] FS:  0000799af9db9740(0000)
>>> GS:ffff8aa486e9d000(0000) knlGS:0000000000000000
>>> <4>[   74.046420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> <4>[   74.046421] CR2: 0000000000000010 CR3: 000000016dfaa000 CR4:
>>> 0000000000f50ef0
>>> <4>[   74.046423] PKRU: 55555554
>>> <4>[   74.046425] Call Trace:
>>> <4>[   74.046427]  <TASK>
>>> <4>[   74.046432]  ? __pfx_platform_pm_resume+0x10/0x10
>>> <4>[   74.046439]  platform_pm_resume+0x28/0x60
>>> <4>[   74.046443]  dpm_run_callback+0x63/0x160
>>> <4>[   74.046447]  device_resume+0x15c/0x260
>>> <4>[   74.046450]  dpm_resume+0x15d/0x230
>>> <4>[   74.046453]  dpm_resume_end+0x11/0x30
>>> <4>[   74.046456]  suspend_devices_and_enter+0x1ea/0x2c0
>>> <4>[   74.046460]  enter_state+0x223/0x560
>>> Oops#1 Part3
>>> <4>[   74.046463]  pm_suspend+0x4e/0x80
>>>
>>> We'll need some more time to dig into it, but I wanted to share the
>>> trace in case it makes it jump out to anyone what's going on.
>>>
>>> Just looking at git blame from that function is this perhaps
>>> 8fd0e127d8da856e34391399df40b33af2b307e0?
>> Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the
>> issue on S16 here.
>>
>> Jacek - can you reproduce with that reverted?
> Hi Mark Brown,
>
> We will send a fix patch to resolve this issue.

Hi Folks,

I've just build and tested the fixes that are heading to rc5 and the 
issue is fixed with 
https://lore.kernel.org/linux-sound/20250425060144.1773265-1-venkataprasad.potturu@amd.com/ 


Thanks,

-Jacek


