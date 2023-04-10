Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011B5250
	for <regressions@lists.linux.dev>; Mon, 10 Apr 2023 20:15:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id e13so5335733plc.12
        for <regressions@lists.linux.dev>; Mon, 10 Apr 2023 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681157723; x=1683749723;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MfpiSE/BEmv/ibb2zWU6o10fgYsbnSc6vQEnuBfczw=;
        b=oZpRg5wjUojWvpLCLumlxsqXKog5i2Lno15loJ2GYc/+jV5GxXvLHTPArQBJ2jCW4W
         X/Hh66Y3Yv7G/B42T/gVNLwW51Agn7BUUYnH73lw8pdbpHPY1bm+/a1AIqVroEKVpe/3
         15SNP3wupz2tZtmdrUMBMu7w6xDDETIpKMj8bEm9bnpyznlNopQO1H1BRynBK4LYLXcI
         sPX1z6Jtc81bSJ6/muk+VejBmr/mcmJje4QmJ9H45feFIL57dwPXZmXuMVefNQ5+f2fw
         ijrxop8OfvsWxoYHO+N3TF8qZFFW7E0/UylQL5t3oAXoELgc54qiHTwQfmL4EINtVkeI
         yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681157723; x=1683749723;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MfpiSE/BEmv/ibb2zWU6o10fgYsbnSc6vQEnuBfczw=;
        b=OY0LYVXu4mTUOJPQibYt9P1J6Aykw6fRD7PM7stXqoubEoiRZuYNDmr/811ZVkAcSM
         qxGccpoDVGaxUGhB5B4R9dfGIp/WsAvP0mLTu9+4GfYA+wXcThCwsS5LwFke7THlCcrr
         yApPuU3UT0IBlEISCH6DVMqwvzSejlGqV/CpA+4dZNkSizGloTKLEtqichQ9LXhY8hwH
         AVJoWNjc95hkC6LsqFVYsbwA/V4ethPEGzzoY/kyUvGuraTVl9QGAQ2EMZl3KykJRCf+
         Bwwy6ClbvUur0PKMc5t8jkxkXSEJYeExsCfizcQif6Vj26hbrfUzyw3WPyv/3kRQSzKG
         VMYQ==
X-Gm-Message-State: AAQBX9dKh5tf1Nw4QyDMPpaNjWJV5nHRp9t0dhfPbPbchPX+pnc3VRV5
	ZJ0w7qHBZyQ499ue9ZtGmRlHlRhNKQo=
X-Google-Smtp-Source: AKy350YibfwmV4kJ4WQ2m4e9kwh42vq7awW/ooCK3Q8OYrMsDDSZGz7raR8PHw4cKYmTflFBBBLCXA==
X-Received: by 2002:a17:902:e752:b0:1a6:3630:16e1 with SMTP id p18-20020a170902e75200b001a6363016e1mr6045788plf.13.1681157722547;
        Mon, 10 Apr 2023 13:15:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090ae68100b002349fcf17f8sm9810375pjy.15.2023.04.10.13.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 13:15:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <629f3d60-3200-6da3-1d84-220d2b9ae1e8@roeck-us.net>
Date: Mon, 10 Apr 2023 13:15:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux@armlinux.org.uk
Cc: Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
References: <20230320131845.3138015-1-ardb@kernel.org>
 <20230320131845.3138015-4-ardb@kernel.org>
 <934225fd-6cc0-4c83-a322-94ddc8598366@leemhuis.info>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 03/12] ARM: vfp: Fix broken softirq handling with
 instrumentation enabled
In-Reply-To: <934225fd-6cc0-4c83-a322-94ddc8598366@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/23 07:29, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 20.03.23 14:18, Ard Biesheuvel wrote:
>> Commit 62b95a7b44d1 ("ARM: 9282/1: vfp: Manipulate task VFP state with
>> softirqs disabled") replaced the en/disable preemption calls inside the
>> VFP state handling code with en/disabling of soft IRQs, which is
>> necessary to allow kernel use of the VFP/SIMD unit when handling a soft
>> IRQ.
>>
>> Unfortunately, when lockdep is enabled (or other instrumentation that
>> enables TRACE_IRQFLAGS), the disable path implemented in asm fails to
>> perform the lockdep and RCU related bookkeeping, resulting in spurious
>> warnings and other badness.
>>
>> Set let's rework the VFP entry code a little bit so we can make the
>> local_bh_disable() call from C, with all the instrumentations that
>> happen to have been configured. Calling local_bh_enable() can be done
>> from asm, as it is a simple wrapper around __local_bh_enable_ip(), which
>> is always a callable function.
>>
>> Link: https://lore.kernel.org/all/ZBBYCSZUJOWBg1s8@localhost.localdomain/
>> Fixes: 62b95a7b44d1 ("ARM: 9282/1: vfp: Manipulate task VFP state with softirqs disabled")
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> [...]
> 
> It feels a lot like I'm missing something, but I can't figure out what,
> I thus have to ask:
> 
> What happened to this patch and/or the series? From my very limited
> viewpoint it looks like there was no progress for nearly three week now.
> 
> Reminder, 62b95a7b44d1 is a commit from 6.3 cycle and fixing a problem
> Guenter ran into. Hence it to me looks like it's something that better
> would be fixed this cycle. Or is this considered too dangerous for some
> reason and thus need to wait? But even then I wonder a little bit why
> it's not in next by now.
> 

Something for sure has changed. I can no longer reproduce the problem
with the latest kernel (v6.3-rc6). I can still reproduce it with
v6.3-rc2. Further testing shows that it is no longer reproducible
for me with v6.3-rc3. That made me curious. I am currently bisecting,
but that will take a while.

Guenter

