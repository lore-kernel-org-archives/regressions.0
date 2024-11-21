Received: from mail.vapourmail.eu (mail.vapourmail.eu [5.75.183.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622361D86CB
	for <regressions@lists.linux.dev>; Thu, 21 Nov 2024 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.183.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732202176; cv=none; b=jXR0/CH7eGv77lN5Zm6Qe/nGTOmshhnLUvQ+j1Jl8Qse3zEDj4C+fxhSI/omJnKKClpwP6PDHW0HSpWYTirexnT8kSh+sWIbYMoWz1due+Fm/rWDLWQElVuY/3iGEGigaPm3DR761TZLcr4WBrCpkTW1NEOQaGbyQioyIB7SYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732202176; c=relaxed/simple;
	bh=KMO+N3fpN2fJO3PINwxqpVoTkk7y2kO6L+yKLjjsjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNI0X5yCw0Cn20ZGldjFC3s8aRKRbTyo/rOCffddIX57vNNCmAX2KtqLvNh5kEAORsnqFWsNgMup1SD3CF0qFr9EiUzK6iy0hg5hVCTrp7Ldu/JmuFmY3TBY/cd85zGCTZZJ7544VfM4PlD9TWMYpWTyVwJdBsSAG/mvit1KvYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=johnrowley.me; spf=pass smtp.mailfrom=johnrowley.me; dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b=nuehN1SE; arc=none smtp.client-ip=5.75.183.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b="nuehN1SE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18412C3AF6;
	Thu, 21 Nov 2024 15:08:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=dkim; t=1732201694;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4sMVi/TNiWhag813YO8ZoSVoCYOYc7/uQrNIYwegqEo=;
	b=nuehN1SEgk2FBDqWHj/LfphI6/n78HVMTzQqXzjGJrZ4Uai35+UC+Mshf0D49boWB55T1r
	SyolmvUMZXMy4LorcjVW3FzY8g7oZKwbuKyVAh0615oimmc3KfzRp3XApK9MGBz0U36V0X
	5xfES/a/jnpTcLLZtWXWIqIkkAjgnqJYZj4HO7Y1hYgTJdaZkYPk7cNgOQr8/EvUyvikeE
	1XPLCgpaHGT3WoZhjwVhByxE/OJ6qFFCKL6pmWPiFRMpdGFBJre2rQLmoB+r9vX8kS+KOx
	19A1XQkqoZNdqd4Gc8271hniFgCGhuS3nkRCBcsZe3U4eeEkiNMR2iCnhiJG5A==
Message-ID: <fe8a0485-4a6c-4676-bcb7-ff32e67f5dfe@johnrowley.me>
Date: Thu, 21 Nov 2024 15:08:00 +0000
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
 <3c0dfd3a-9549-4afa-94b6-80041f498436@johnrowley.me>
 <25eed927-fe69-4005-8c0d-c5f3052e662e@amd.com>
 <92af8678-2b45-409e-82d1-f273fe907a36@johnrowley.me>
From: John Rowley <lkml@johnrowley.me>
In-Reply-To: <92af8678-2b45-409e-82d1-f273fe907a36@johnrowley.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

John Rowley wrote:
> The attached patch seems to improve rendering performance a lot; animations and desktop performance are generally smoother again.
> 
> But it doesn't seem 100%, e.g. if I let the laptop idle for 10 secs before interacting with the touchpad, the desktop cursor seems to stick in-place for 100-200ms or so, before becoming responsive again.
> 
> This 'sticking' problem doesn't seem to occur with PSR disabled.
> 
> My testing isn't exactly scientifically sound I'm afraid, if there's a better test or benchmark I can run, please let me know.
> 
> On 01/10/2024 22:16, Mario Limonciello wrote:
>> On 10/1/2024 16:14, John Rowley wrote:
>>> Disabling PSR as per Leo's reply seems to have done the trick!
>>>
>>> Stock 6.12-rc1 (without revert): BROKEN
>>>
>>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
>>>      6
>>>
>>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
>>>      Sink support: yes [0x03]
>>>      Driver support: yes
>>>
>>> With amdgpu.dcdebugmask=0x800: BROKEN
>>>
>>> With amdgpu.dcdebugmask=0x10: FIXED! Performance is as it was on 6.11.
>>>
>>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
>>>      0
>>>
>>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
>>>      Sink support: yes [0x03]
>>>      Driver support: no [0xffffffff]
>>>
>>> I have the older Framework 13 panel (BOE 0x0BCA, 2256x1504 @ 59.999 Hz) so I assume PSR isn't supported according to Mario, yet psr_{state,capability} above seem to indicate otherwise?
>>>
>>
>> PSR and Replay are two different things.  But from your above analysis it does confirm it's a PSR issue.
>>
>> There's a patch that Hamza attached to https://gitlab.freedesktop.org/drm/amd/-/issues/3658.
>>
>> Can you try that?
>>
>> Thanks,

Hi,

Has there been any movement with this? I's still experiencing performance issues on 6.12.

The previously mentioned patch does not fix the issue, only adding 'amdgpu.dcdebugmask=0x10' to the kernel cmdline does.

FYI I'm running upstream kernel on an AMD Framework 13" (AMD Ryzen 7 7840U w/ Radeon  780M Graphics).

Thanks.

