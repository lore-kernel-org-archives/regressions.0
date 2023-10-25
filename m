Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC708467
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 00:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="EOJ6hD53"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6bbfb8f7ac4so1094673b3a.0
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1698194049; x=1698798849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8AeR5cX4ECeRAMqM9bk6xqQoLMHM5hoApBMejuGgnI=;
        b=EOJ6hD53jYotRybYiGfuagUL2vtl9js5+zxg0may28KCxBqTBjd/3APesi7m0s/Ly/
         IbLKxWq6xagVrrMEbCT7B/d4WOjlldSGXW0k0qY2daTXUr97rrK9JoNOV5ZrznnUSn5+
         TP9SfaaKSI1asFvHX5x7HwZiuo3/LAcLXpdX+AqQSagCJ6AiZ9Jd7OvUBLzsJS1eHJDY
         pkBFPvf0To0sGWrFcI1E8kStkKahi2jTY11HZyp28x6LWF11WyFkoLlxb2eMKYmRueA1
         ps38iLIJmbYEYG2sFPTAwZcdyRLYgT+1SYC2ozNrCKYOyadtwy734llVLONSm67G17pL
         G9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698194049; x=1698798849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8AeR5cX4ECeRAMqM9bk6xqQoLMHM5hoApBMejuGgnI=;
        b=VCa5LXuydsvnCmuEDUVINN1h21UQrWD25L4avYDvkO4JQpzqjUOzM+DZhqvpu05/5e
         vKHk8ZY8kv6YuyKZteDp+KoRfGkqQXRF1kmlUIDGM3zLpwWQzyAEXDXmdQUsFdPQ0cLx
         274sq6+WidvVh01VlQGBASZxA9i3Cp7Hq19uvM+fzzSi8V5vRrwdPQuh8GHUfq9zmWAp
         0mr8vOacwkV0kj6WHovNtvSEigTGfuSOL2amQ8AHc3LP9jP16x82WGG96uWxPu51MGjg
         GH4zPLuGgwgcHKgsuxPQhGB/JVM8uM+GfUVnkAD+uKMmzTclIGXrteFCFpYXPI50m4Dh
         ufoQ==
X-Gm-Message-State: AOJu0Yz9tRJN2bLE7BU3lRBeFzNddUTmMatVeSyo2HIcYwY+KMuCesHZ
	UrJSYDeJn+gcG7lv5yO3OU8WrQ==
X-Google-Smtp-Source: AGHT+IGpxAnEvrI6l7SDpL7iESVoor6ZCUMq1w/wBpUXkzIX2xbD4rgxQX9ZLlZIuL82wxU6qAWDSg==
X-Received: by 2002:a05:6a20:c188:b0:15a:2c0b:6c81 with SMTP id bg8-20020a056a20c18800b0015a2c0b6c81mr17059900pzb.3.1698194048863;
        Tue, 24 Oct 2023 17:34:08 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id a6-20020aa79706000000b006b22218cb92sm8124187pfg.43.2023.10.24.17.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 17:34:07 -0700 (PDT)
Message-ID: <4ace2109-3d05-4ca0-b582-f7b8db88a0ca@kernel.dk>
Date: Tue, 24 Oct 2023 18:34:05 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: task hung in ext4_fallocate #2
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
Cc: Andres Freund <andres@anarazel.de>, Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-ext4@vger.kernel.org,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 gustavo.padovan@collabora.com, zsm@google.com, garrick@google.com,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 io-uring@vger.kernel.org
References: <20231017033725.r6pfo5a4ayqisct7@awork3.anarazel.de>
 <20231018004335.GA593012@mit.edu>
 <20231018025009.ulkykpefwdgpfvzf@awork3.anarazel.de>
 <ZTcZ9+n+jX6UDrgd@dread.disaster.area>
 <74921cba-6237-4303-bb4c-baa22aaf497b@kernel.dk>
 <ab4f311b-9700-4d3d-8f2e-09ccbcfb3df5@kernel.dk>
 <ZThcATP9zOoxb4Ec@dread.disaster.area>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZThcATP9zOoxb4Ec@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/23 6:06 PM, Dave Chinner wrote:
> On Tue, Oct 24, 2023 at 12:35:26PM -0600, Jens Axboe wrote:
>> On 10/24/23 8:30 AM, Jens Axboe wrote:
>>> I don't think this is related to the io-wq workers doing non-blocking
>>> IO.
> 
> The io-wq worker that has deadlocked _must_ be doing blocking IO. If
> it was doing non-blocking IO (i.e. IOCB_NOWAIT) then it would have
> done a trylock and returned -EAGAIN to the worker for it to try
> again later. I'm not sure that would avoid the issue, however - it
> seems to me like it might just turn it into a livelock rather than a
> deadlock....

Sorry typo, yes they are doing blocking IO, that's all they ever do. My
point is that it's not related to the issue.

>>> The callback is eventually executed by the task that originally
>>> submitted the IO, which is the owner and not the async workers. But...
>>> If that original task is blocked in eg fallocate, then I can see how
>>> that would potentially be an issue.
>>>
>>> I'll take a closer look.
>>
>> I think the best way to fix this is likely to have inode_dio_wait() be
>> interruptible, and return -ERESTARTSYS if it should be restarted. Now
>> the below is obviously not a full patch, but I suspect it'll make ext4
>> and xfs tick, because they should both be affected.
> 
> How does that solve the problem? Nothing will issue a signal to the
> process that is waiting in inode_dio_wait() except userspace, so I
> can't see how this does anything to solve the problem at hand...

Except task_work, which when it completes, will increment the i_dio
count again. This is the whole point of the half assed patch I sent out.

> I'm also very leary of adding new error handling complexity to paths
> like truncate, extent cloning, fallocate, etc which expect to block
> on locks until they can perform the operation safely.

I actually looked at all of them, ext4 and xfs specifically. It really
doesn't seem to bad.

> On further thinking, this could be a self deadlock with
> just async direct IO submission - submit an async DIO with
> IOCB_CALLER_COMP, then run an unaligned async DIO that attempts to
> drain in-flight DIO before continuing. Then the thread waits in
> inode_dio_wait() because it can't run the completion that will drop
> the i_dio_count to zero.

No, because those will be non-blocking. Any blocking IO will go via
io-wq, and that won't then hit the deadlock. If you're doing
inode_dio_wait() from the task itself for a non-blocking issue, then
that would surely be an issue. But we should not be doing that, and we
are checking for it.

> Hence it appears to me that we've missed some critical constraints
> around nesting IO submission and completion when using
> IOCB_CALLER_COMP. Further, it really isn't clear to me how deep the
> scope of this problem is yet, let alone what the solution might be.

I think you're missing exactly what the deadlock is.

> With all this in mind, and how late this is in the 6.6 cycle, can we
> just revert the IOCB_CALLER_COMP changes for now?

Yeah I'm going to do a revert of the io_uring side, which effectively
disables it. Then a revised series can be done, and when done, we could
bring it back.

-- 
Jens Axboe

