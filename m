Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60D2F859
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="FZsmbPBM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6bbfb8f7ac4so1911429b3a.0
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 14:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699395413; x=1700000213; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmRKKBlvnek0iLiLx8GyFUhXzIobJ6H0Pveu7JJRPng=;
        b=FZsmbPBMBu2r4xuqAOLyRrOxKpHLvsR5OAc+j3C7wAJuNGeQz3C8qwCMze7OhfHyC1
         9GGxpmJ6dPmph7drGkrA3XXJAIgnyBpfCQLqd00dP5eYpdzO3vw314rCxKyMXVmNwflx
         sDUkFp0lU5QnKcMWCdyIFPAMd729DOyOwQ1YFpFWG9bH9psUrQ+Tg0MXplaYMLaH+AUv
         7y+CaVhJ9TncU3j8pbK4kljq0Ii+Cbu0Y7sCcHVhwTeMPBNpPoi38AtmwKh1N/k1LrZy
         on5ZNWyREHZZjD5EGRgPznb16Z1AoCiObpSUARnplGTh4gykneIhHalfOQ/D26qfGwY6
         cI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699395413; x=1700000213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmRKKBlvnek0iLiLx8GyFUhXzIobJ6H0Pveu7JJRPng=;
        b=XfyLkm5rIqtoivdv8l88YDXN9IV5XJjKwV3QhDE3Z237PcPgpYo7M4o6pWWRAB1Byy
         WDAdmpV509SmsepoTE54At3roxNuibTzFTQ0Ck2zKcw5K0EW/6O+N8HmtV2/u9ZbtbyP
         jls09Ae+4wBnDLFShWoGHnIp+Gu/7otY5Cp5sfrLNCsRpqxMqQSQnOTyPKUgqMhnoTjo
         bNpO72B9E7mn/mLRHP097Zgb0T1xVjNZzRapuCzo+XasPppTzbTqAmKh8pp48kEeqY5H
         k+QN3U1VMlrS11OVhmOLgRW1w3FyYTS0oUCy5CVwxTjX1vo/tCULJ0/Elt4LWbcGh7kj
         8hOg==
X-Gm-Message-State: AOJu0YzSmsYc9IQFT2FPhD0MHuZJUyjfCLNYPrbfqCSogvOzCtwAEv6v
	wbok/Z9MxmxiD2NBV31LHfT/vSIvQ6IHtVUOCNvOrQ==
X-Google-Smtp-Source: AGHT+IH9GI1sito78UYNw5/yIaGO6vtXouaxyxLfx93oYvlJFxGwujYqb/JDBPukWOlZYcquon5QjA==
X-Received: by 2002:a05:6a20:4304:b0:16e:26fd:7c02 with SMTP id h4-20020a056a20430400b0016e26fd7c02mr330503pzk.2.1699395412907;
        Tue, 07 Nov 2023 14:16:52 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001c7443d0890sm301015plf.102.2023.11.07.14.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 14:16:52 -0800 (PST)
Message-ID: <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
Date: Tue, 7 Nov 2023 15:16:51 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
 <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
 <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
 <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 3:07 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 3:46:40 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 2:39 PM, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions"
>>>> <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 7, 2023 3:22:16 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>>>>> I can make the corruption disappear by adding a 1ms busy wait delay
>>>>> into io_wqe_dec_running().  This appears to alter the timing of
>>>>> something in the io_uring system just enough to make the (presumed)
>>>>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>>>>> the lock debugger, yet a corruption problem that disappears with a
>>>>> delay is indicative of a race somewhere.  The delay primary impacts
>>>>> how long the IRQ lock is held, if the delay is moved outside of the
>>>>> IRQ locked section the corruption returns.
>>>>
>>>> This is interesting... This forces the current task to schedule out
>>>> first, rather than potentially create a new worker.
>>>
>>> That makes sense -- when debugging, everything seems to center around
>>> worker creation and the exact timing / context of that operation.
>>>
>>>> If you put that 1 ms sleep at the top of io_wq_worker(), before the
>>>> loop, does it fix it as well? With the previous one removed, of course.
>>>
>>> No, it does not.
>>
>> OK, so it's not related to delaying work handling for a new worker. What
>> if you add a 1ms sleep before calling wq->do_work() in
>> io_worker_handle_work()? For both this and your previous test, might be
>> worth shrinking this 1ms to something way smaller, as it's hard to know
>> if it's the fact that we're scheduling first that's important, or if
>> it's just a timing delay and hence now it's much harder to hit this
>> race.
> 
> Nope, no joy.  I had already tried shrinking the delay and the issues
> came back.  Ditto for switching to usleep; allowing the process to
> leave the core (or something else to schedule on the core) seems to
> bring the corruption back despite the time delay remaining in place.

Gotcha

>>>> Does it do anything if you just put isync() in there instead of the
>>>> sleep in io_wqe_dec_running()?
>>>
>>> Unfortunately no, that doesn't fix things either.
>>>
>>> My gut says it's something racing with either the I/O worker creation
>>> or wake (trying to schedule work onto a half-created or still sleeping
>>> worker?) but so far I haven't been able to isolate the root cause.
>>
>> One of my initial suspicions was improper handling of signals, since
>> creating a new worker will happen via task_work_add(..., TWA_SIGNAL).
>> But I'm not sure how likely that is, as that could/would happen normally
>> too if signals are being used, and would trigger on more than just
>> powerpc obviously.
> 
> Interestingly enough that's where my current investigation is leading
> as well.  After instrumenting and re-instrumenting the codebase far
> more times than I'd like to admit, I've noticed that the workers don't
> time out on kernel builds that show the corruption, they are directly
> terminated via signal (SIGKILL).  On kernel builds with the delay, the
> workers time out and self-terminate.  I'm still trying to parse out
> what the exact difference between these two mechanisms would be and
> how it plays into the corruption, but at least it's a start...

Maybe poke at how they are exiting - you say timeout, so they've been
idle for a while and then go away? This would then cause worker creation
again later on if, say, we have 1 worker left and it goes to sleep. So
the timeout itself may not tell you much, outside of then causing that
other condition to happen. You could even try and shrink the timeout to
HZ / 10 or something like that to make it more likely to happen.

-- 
Jens Axboe

