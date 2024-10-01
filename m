Received: from mail.vapourmail.eu (mail.vapourmail.eu [5.75.183.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07400176FB0
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.183.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817278; cv=none; b=WVqnheZyLhPfxMxQyEjJ09MHvYS9IZK5t70i9X6p6yajypYZKr/4EFqaGr1U5LrHgUEM3vdNqsTiBSttU68wWlRsYHzw1O0X0RiAjwQRnsoDpPoNACs+FZYpeVyTdcfq6ER1iwk6Q3GCYf3XJQlvZF+Ke86e3il3gdUyFtvcsx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817278; c=relaxed/simple;
	bh=hQTOuFfqdI7BbwWXmbkc3LpNQPetAK/hYcEs+XxONA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dd2c2ul9wjYRY2FU2x8eL96L/JAM5ppdRBYAvCUzrHFlMnAVFB5qdPGwNvM6H5qch8ZVPgQhCF/O8Wk2NV7ijMBZp6cTE7My3KS1Nf+7PTg5To9nj7zTREU7OmWR7J+vJJE7B628nSm0xyrENj2LtdmIL5XwJvIdl2daLcgPQdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me; spf=pass smtp.mailfrom=johnrowley.me; dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b=sRxyv1mS; arc=none smtp.client-ip=5.75.183.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b="sRxyv1mS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4F53C38D2;
	Tue,  1 Oct 2024 22:14:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=dkim; t=1727817273;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lpLuw2sJgaRY7hkI1hlJqq/JV14pDwqtWhNwVOESN5c=;
	b=sRxyv1mSkAFITZxgCxNKWhWNWPukzxcEvKQXumw5gKajM+6yXVJ2gRaTDEGfrEKhHeGL1r
	T8PGWe/Ag1dC1dk6KuzetR+nRme+USQ2YpgBhtnUT/jSzI3yCOeQQoxxeF34PnmyxsI7Lp
	Dg13HIuPsXuB1Ivx6inN+7HwCeYu0gbt9xuILd+HYrFuFIskBJV6ESero3hEkZghAWT57M
	hzGoIt0t6h0eQUm+snlb0gHvLHGmMODrz026zc+p5LHwASPN66llaOESMrvBjuQlIJ0wc6
	lwwPAX2vLV9urO8t3nMI1KHQmjVPxkMW/l6T/kiZIPS0WLaA//1MQT6Pkql3Kg==
Message-ID: <3c0dfd3a-9549-4afa-94b6-80041f498436@johnrowley.me>
Date: Tue, 1 Oct 2024 22:14:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] 58a261bfc967: choppy GPU performance
To: Mario Limonciello <mario.limonciello@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <9b80e957-f20a-4bd7-a40b-2b5f1decf5a4@johnrowley.me>
 <925cd47c-8f1e-4b74-aeff-6d13ae5f0753@johnrowley.me>
 <95c575a3-100c-4808-b451-b92f14598188@amd.com>
 <836c2c82-4dfe-40f4-8d50-5e7bff04c38c@johnrowley.me>
 <7ed81635-3872-463c-94e5-e4972da9d014@amd.com>
 <bcc97e4e-ffe0-47a7-bd29-c993e5404a33@amd.com>
 <9c562132-64a0-41f5-80ad-8492d1039692@amd.com>
Content-Language: en-US
From: John Rowley <lkml@johnrowley.me>
In-Reply-To: <9c562132-64a0-41f5-80ad-8492d1039692@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Disabling PSR as per Leo's reply seems to have done the trick!

Stock 6.12-rc1 (without revert): BROKEN

    /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
    6

    /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
    Sink support: yes [0x03]
    Driver support: yes

With amdgpu.dcdebugmask=0x800: BROKEN

With amdgpu.dcdebugmask=0x10: FIXED! Performance is as it was on 6.11.

    /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
    0

    /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
    Sink support: yes [0x03]
    Driver support: no [0xffffffff]

I have the older Framework 13 panel (BOE 0x0BCA, 2256x1504 @ 59.999 Hz) so I assume PSR isn't supported according to Mario, yet psr_{state,capability} above seem to indicate otherwise?

Thanks.

On 01/10/2024 21:16, Mario Limonciello wrote:
> On 10/1/2024 15:07, Leo Li wrote:
>>
>>
>>
>> On 2024-10-01 15:10, Mario Limonciello wrote:
>>> On 10/1/2024 14:09, John Rowley wrote:
>>>> I was using power-profiles-daemon version 0.23 in balanced mode.
>>>>
>>>> I also tested TLP, and vanilla kernel without any power daemons running. Without any daemons I use the following:
>>>>
>>>>      energy_performance_preference: balance_power
>>>>
>>>>      scaling_driver: amd-pstate-epp
>>>>
>>>>      scaling_governor: powersave
>>>>
>>>
>>> Thanks as long as it can reproduce in 'balanced' mode that should exclude PPD from being the cause and it most likely a pure kernel bug.
>>>
>>
>> I'm curious if you have a PSR supported panel. Does setting
>> amdgpu.dcdebugmask=0x10 on your kernel cmdline help? This force disables PSR.
>>
>> Another flag to try is amdgpu.dcdebugmask=0x800, which allows PSR but disables
>> idle power optimizations. I wonder if that may be causing extra latency.
>>
>> - Leo
>
> Do you have the "new" 2.8k high res panel on your Framework 13?  If so; can you please check your logs to see if PSR is even getting enabled?
>
> IE it might be enabling panel replay which is new to enable again in 6.12-rc1, and if so; this could be where the issue is too.
>
> The lower res display shouldn't support it.
