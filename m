Received: from mail.vapourmail.eu (mail.vapourmail.eu [5.75.183.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F11CEAD8
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.183.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727818360; cv=none; b=CibrRk4yEKbP2hAJDD5/7WGeLXMe9dc2kOgNIMbkAwlBQgBQW+JGQ2a5mu3jJzOC05EKDqT5wXid6cGNTg+s1oQ2W1TStA0T4ZsDlsYg9agrE4z/RzqwXdH73tdhBNP1ADlQPpG77Q7QxmXMo2JpX8Y/dTx0BWaGREO7Fp4t4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727818360; c=relaxed/simple;
	bh=msRv+wj1UiQoqKTQBAUpAS+3YDWf9M7FcIXLZ9BS2ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh7zMSFkkKTzRIdR8gB1WFTXA9veZz15HSQvx2j4W+xOXaPe/UuvkkrKWarvEC5HxGTy9P/Z0hmxwJR0Phxr+4M6Fzk71vcSVrrCSX55NkOshW324F76fR8yaMzcUiGHC32+N9hJIOKuZOqpS02lRA3I9oHhz5CguKvZZIarcEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me; spf=pass smtp.mailfrom=johnrowley.me; dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b=P7+RqhTz; arc=none smtp.client-ip=5.75.183.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b="P7+RqhTz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0482CC0076;
	Tue,  1 Oct 2024 22:32:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=dkim; t=1727818356;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=msRv+wj1UiQoqKTQBAUpAS+3YDWf9M7FcIXLZ9BS2ro=;
	b=P7+RqhTzTea40vH4nwpBLtbwEgl6eIO/gOFfZXtOMBc/VfvBN43+YC2Fr5lmTWzKf+jqdZ
	sPQfSfuUjByPH1v8ycgcTOV0EYrUz7Pu5D4jjVJ1EeCOI2v6xd+1s/G3dYqkO6xxSitcll
	otPIp37EDOwL5ZNOUa4N/7b5UApG7Icq3SNH7DflaLNvvcyxg1HsiVvRV06OJVEvzhOiWa
	ni0Ss3GQuOIXJgnpMVPwNMnlu9lAgD0+ZuoMwu6CpYANPA4o7COadL2+cTKQM/pcKP7/ky
	hTuZY8h3o45LRe8dl9FlqpjX50X42bIpG69RT3g7Cu4BRIxTGeTPRGShFd0Jdw==
Message-ID: <92af8678-2b45-409e-82d1-f273fe907a36@johnrowley.me>
Date: Tue, 1 Oct 2024 22:32:35 +0100
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
Content-Language: en-US
From: John Rowley <lkml@johnrowley.me>
In-Reply-To: <25eed927-fe69-4005-8c0d-c5f3052e662e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The attached patch seems to improve rendering performance a lot; animations and desktop performance are generally smoother again.

But it doesn't seem 100%, e.g. if I let the laptop idle for 10 secs before interacting with the touchpad, the desktop cursor seems to stick in-place for 100-200ms or so, before becoming responsive again.

This 'sticking' problem doesn't seem to occur with PSR disabled.

My testing isn't exactly scientifically sound I'm afraid, if there's a better test or benchmark I can run, please let me know.

On 01/10/2024 22:16, Mario Limonciello wrote:
> On 10/1/2024 16:14, John Rowley wrote:
>> Disabling PSR as per Leo's reply seems to have done the trick!
>>
>> Stock 6.12-rc1 (without revert): BROKEN
>>
>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
>>      6
>>
>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
>>      Sink support: yes [0x03]
>>      Driver support: yes
>>
>> With amdgpu.dcdebugmask=0x800: BROKEN
>>
>> With amdgpu.dcdebugmask=0x10: FIXED! Performance is as it was on 6.11.
>>
>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_state:
>>      0
>>
>>      /sys/kernel/debug/dri/0000:c1:00.0/eDP-1/psr_capability:
>>      Sink support: yes [0x03]
>>      Driver support: no [0xffffffff]
>>
>> I have the older Framework 13 panel (BOE 0x0BCA, 2256x1504 @ 59.999 Hz) so I assume PSR isn't supported according to Mario, yet psr_{state,capability} above seem to indicate otherwise?
>>
>
> PSR and Replay are two different things.  But from your above analysis it does confirm it's a PSR issue.
>
> There's a patch that Hamza attached to https://gitlab.freedesktop.org/drm/amd/-/issues/3658.
>
> Can you try that?
>
> Thanks,
