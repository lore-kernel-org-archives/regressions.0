Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D337CD59
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207501; cv=none; b=IU8VOnUfU38vNdi3ERJ6jbCKfVl7dCTO3DcQ/FajUff0vSgfjF8QR44wrwY1yggLBwBF+/u6u+Q2NMl/zX9tDyHKN0unNoDkG+qlTl7b3oFU7PKtsmc69nZNjxEUGo72241E/RHWatUJIetVMo1CV5QF30I4+wmQTBGs66zAHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207501; c=relaxed/simple;
	bh=o4qQdmso+7jbXfBITogLWM6RoF+x+AIWAvNaFOvCHxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3J1kvr+DdlrN67n447jemm3p6lkWLRtJt5TtvjwBGYWdBZAzUeKg7pNYkCDnH8f2jIj4yJko/nHUmg4Lgbf5jmltTaRU25z7UJZ3CLJ0Tuyz3Y6oCjROGH5AO/KS/LNKgyn1hooRt01KsUx9cqOZPws31l2ojH6yMNN3p+TdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0Yx6wT/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0Yx6wT/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso3856853a12.1
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788207499; x=1788812299; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJshX3L9F+nGxdNG5KJuqcT71hdUCxKC1U3uQESPtUs=;
        b=F0Yx6wT/G0fxwY5wH8J7Bcv5UGll23lzsaZ29/C4SB0v0v6eP6sCq86VsipsWrMjDn
         eTfommMtUmYEOcJJwmLWKA5T1uhpMi3fU08rORZkj7G6ig/Jfebc+FHZ4H1qYK/soGAF
         IPmMy7gC12vvju+ppuGWtzthdM1sa2XVS09Dje/siXR3b4pmSMUwjcdPoKKVW3VjoLDr
         zyZtv3OUPJNJIg5Wk6PffP3FTvIiYiQpzcpK6T0jwbLG3vXM/O0ifximYszrL4DKvows
         bDl/Tn8orosJz54BKEufveSkMUhcatQMW++4uhd3YoX2e1rs8WbQi22wuYbnn9zY+4aY
         Ealw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788207499; x=1788812299;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJshX3L9F+nGxdNG5KJuqcT71hdUCxKC1U3uQESPtUs=;
        b=D7wfqE8uRvuX1Ky9PlMevbj4lM4y3sC+v2vDhf6j6ipAeJog9vQmIdQ+O7f0HlqJUg
         kUizahKBfbHMTZVgXIFRqHSWWoq3wx9fMzWietI7l0QSyV8nIoAsRQOPWxQp7o8k9XEK
         MQUZHEppE026jURZdDDrbjNavrlFiVy9eLTsUXDOg2/lzFye1nndIvSlV3rZxpmDCW/h
         pOtXqQvjakqunDoE48MVSQSbntQ5If4immzBqic9p33pTAqNhLuC/vgXdHYczydJ7gdc
         Tdfd/9n9mwVvkffcZXtRXrABlTKKmD7tH/XFVMDowHi3CxaFHY06OQU7yeO1SWQBGDZE
         GKSA==
X-Forwarded-Encrypted: i=1; AHgh+RrtKyeZQrITGX8EValOoto/ZPTl1a238IbpvKrHrRaYV1PvJIiW7f7dkbq5j2QLwZe2/hReioG6R+OMAw==@lists.linux.dev
X-Gm-Message-State: AFuF++lp5Yk/YrsBNzxyKMwXiZBYBgTfvvWm2W7ILZrgSU1Y0vGs5urB
	4efEa39RyXzmqCJ3IvjZpsyP+r1YfPI8SAe0WV6oj9E5JDFKZRHAjMok
X-Gm-Gg: AR+sD11xD0xn/ogHSNSKH/uqtZlXKVB5hqvZMba5lodbKxuUTmuQBSB5tSdxQyyGTqT
	E/aZzIXI2BzsHVAd4+bJpVK1hluXnq6c4G+gskrqPmMewc1FxVXtRzHm6ubUuWQsk1dnUzqlXv7
	XtBVgk7ua6AYXWl0BYIO20xK9MxfSEE4FrR43hTw6FejwxBhoUoNOFXudkPBYrcZenxft1W37ky
	D2OGrH/FO6hzRPtfj+IRUaHUoJtTy55bhrj3ZGRth8bLfEMT7rQcOdUaVxe2gwg7FqxkdXxh0/W
	MqgrQrfmRqjfvZ7HJqsZgEHkXkHxkBm2FsMdMVf3mcMs/yDCikWIBvpVht0dzsdrs3P5RfZa32j
	nTXAzchso985asaqodW9UVk04PC+RJ3IE2JZILK7RF0YsQUvpXv2QS80IZfoTXeMu6qYDRUAbaG
	a1z4/7x93OO81dEJeMYWl8MamLI3h5scfU9P99+7SOOQXmvwJtCU1boXCp9eGE7xV5ho41lcD/P
	H1JpFF/EYNEXeGnrWPblPWo
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr49750171637.9.1788207499237;
        Mon, 31 Aug 2026 13:18:19 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm34915143eec.24.2026.08.31.13.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:18:18 -0700 (PDT)
Message-ID: <b46209d5-e518-4289-9b3a-5854a2512278@gmail.com>
Date: Mon, 31 Aug 2026 13:18:07 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
Content-Language: en-US
To: Stian Halseth <stian@itx.no>, andreas@gaisler.com, davem@davemloft.net,
 sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, thuth@redhat.com, regressions@lists.linux.dev,
 nroach44@nroach44.id.au
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260831172928.3082853-1-stian@itx.no>
 <afaa8ced-0717-4d62-8ea6-4ecdbf489694@gmail.com>
 <680606d594645568c21afcc552558882c4f59a96.camel@itx.no>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <680606d594645568c21afcc552558882c4f59a96.camel@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stian,

No problem at all, and I appreciate your honesty and for reaching out. 
It’s best to get this addressed as soon as possible if you have the time 
to work on it—I’m currently swamped with other tasks. Overall, I don’t 
mind if you take over these patches, and truly appreciate your 
assistance to the sparc64 community. Just please continue to give me a 
mention in any patches related to this work, since I spent a 
considerable amount of time debugging, researching, and validating the 
fixes.

When I last tested on 7.0 and 7.1, both of my patches worked:

A)    sparc64: increase kernel thread stack size to 32K

B)    sparc64: Fix comparator problem with timer interrupts

I was able to debug and validate these issues on S7‑2 and T7‑1 hardware. 
I’m not sure if others have reported similar problems on T4 or T5 systems.

Regarding:

STACKTRACE: hub_event():entry: 31856 bytes used
STACKTRACE: hub_activate():entry: 31680 bytes used
STACKTRACE: usb_control_msg():entry: 30768 bytes used

This was a set of debugging code inserted into function hot spots and 
scripts to measure stack usage at runtime. It helped me identify trouble 
spots and gave me a better idea of where stack consumption was highest. 
At the time, I wondered whether it might be possible to reduce the stack 
size of usbcore and the Nvidia mlx5 functions on sparc64, but that would 
be a significantly more time‑consuming task. I may have updated my stack 
monitoring script since then as well.  It’s also been a few months, so 
I’d need to refresh my memory on the details.

If you have a quicker or better methodology for reviewing stack usage—or 
any general suggestions—I’m definitely open to seeing them, along with 
your config and exact procedure. And if you need help validating against 
S7‑2 and T7‑1 hardware, I can try to allocate some time to assist.

Best regards,
Tony

On 8/31/26 11:54 AM, Stian Halseth wrote:
> Hi Tony,
>
> You're welcome.
>
> I saw it was stuck, and wanted to push it along. Looks to me like a
> proper fix that should be included.
>
> PS: Don't want to take any credit, this is 100% your fix. If you rather
> want to handle it yourself, let me know :)
>
