Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6E34567
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="upZTtCsB"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c7a4735a30so1462242a34.1
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 15:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699401176; x=1700005976; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htUD3ZHdVQlNHRNiyGuM3Nl/6lHntaotffAYbl95PyU=;
        b=upZTtCsBZkP3zGGdd1nAuKXZUsHo8fWJJ46oPek6y2+yqKqp1/KsC5jsfwr4WgZmdY
         KbxLChmizyNDA7zAHRqxDk1IUyPnhdQ2GwC+zUJ7n3LNI05Cu+pPS4NaZl5k65h2nNjA
         4++dIefUqRrIwrKp2+zcH3gxt0eU7dChhQJJobXajUMbKXsG4xbY6iUhgTZwG6V9G2IT
         LBT8XfP+R+bN5CGRsZKpLZptFWGxzVXF2fypjxf86DOfHhKDMhyivib3j+4O9W6fZv5b
         DzOY3aGkeSkgkpGkKWBjqW2xDF8Ozy7uzPsdFipQqS7l8Q4FVTna3R4ky+4mkUaHP0jv
         2rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699401176; x=1700005976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htUD3ZHdVQlNHRNiyGuM3Nl/6lHntaotffAYbl95PyU=;
        b=Tu38UrCPOElATL4HcRjoP0YJspq0tvY1Iocb42/IyF4lBQgRRpT4Hnj1BvJSqwHypb
         t9Ipkuve6NmutnC28E0AeGZ0fxD/wnXXvx9HEAlFFiWK5BAFhr1xf5AERcPweBimghNX
         wBsF20c8B6fLVeQpvvK44IYMqP4i6s4ANLMrFwxXak8sky9vqWk0owi4yG20EKWsYHQq
         AbuP5xbsT02pRXhC5Oxk8DkcmjGiYwNt+VqM1RFNJ222YYb8jqFynmVGIA510YdbGbwS
         FyctID3+EvWPTAsWqWjUO8iUiblFiRpo8V3s7R4Tix3wY1ORCpWced0ZawDBM0EIRyeD
         lDKQ==
X-Gm-Message-State: AOJu0YxSikaEuwRxH+/mRSyvRYktCdVSes/dlcT8MV5zfSsSuzEsTbAQ
	iOdGuGclI4jaCA9QKw1uR9Nc1w==
X-Google-Smtp-Source: AGHT+IGulhlOFoPVgrv1P8EDp7YzTI5aopb0hi5Cy61wFKwYh+jp8yK7KUHkKE+jA3WitAIRMYdMGg==
X-Received: by 2002:a05:6808:23d6:b0:3ad:aadd:6cbf with SMTP id bq22-20020a05680823d600b003adaadd6cbfmr567577oib.0.1699401176066;
        Tue, 07 Nov 2023 15:52:56 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id 29-20020a63185d000000b005bcea1bf43bsm1886245pgy.12.2023.11.07.15.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 15:52:55 -0800 (PST)
Message-ID: <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
Date: Tue, 7 Nov 2023 16:52:54 -0700
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
 <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
 <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
 <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
 <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
 <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
 <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
 <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
 <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 4:34 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 5:16:24 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 4:12 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 7, 2023 4:44:56 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/7/23 3:29 PM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Tuesday, November 7, 2023 4:16:51 PM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>>> On 11/7/23 3:07 PM, Timothy Pearson wrote:
>>>>>>> Interestingly enough that's where my current investigation is leading
>>>>>>> as well.  After instrumenting and re-instrumenting the codebase far
>>>>>>> more times than I'd like to admit, I've noticed that the workers don't
>>>>>>> time out on kernel builds that show the corruption, they are directly
>>>>>>> terminated via signal (SIGKILL).  On kernel builds with the delay, the
>>>>>>> workers time out and self-terminate.  I'm still trying to parse out
>>>>>>> what the exact difference between these two mechanisms would be and
>>>>>>> how it plays into the corruption, but at least it's a start...
>>>>>>
>>>>>> Maybe poke at how they are exiting - you say timeout, so they've been
>>>>>> idle for a while and then go away? This would then cause worker creation
>>>>>> again later on if, say, we have 1 worker left and it goes to sleep. So
>>>>>> the timeout itself may not tell you much, outside of then causing that
>>>>>> other condition to happen. You could even try and shrink the timeout to
>>>>>> HZ / 10 or something like that to make it more likely to happen.
>>>>>
>>>>> Agreed.  As of right now I can confirm that with the delay in place
>>>>> (no corruption) the workers are exiting on their own, no signals and
>>>>> no IO_EXIT bit being set.  When I remove the delay (reintroducing the
>>>>> corruption) I see signal 9 being sent to the workers, and a mix of
>>>>> IO_EXIT being set and not being set.
>>>>>
>>>>> Ignoring the signal 9 does not fix the corruption, which makes me
>>>>> wonder more about IO_EXIT and whether things are not fully committed /
>>>>> properly torn down when the worker thread terminates.  This also
>>>>> dovetails nicely with the fact that the observed write corruption
>>>>> always seems to be in the latter portions of the page, never at the
>>>>> beginning of the page, also indicating rapid / unclean termination of
>>>>> the writer process.
>>>>>
>>>>> Will keep digging...
>>>>
>>>> This is useful. If the workers are exiting, they will try and process
>>>> work that is still pending. And it obviously does, or the process would
>>>> hang on exit or ring exit. But it'll also cancel said work, which
>>>> obviously did not happen for the old kthread scheme, as there was no way
>>>> to do that. So you'd just wait for it. Hence maybe what's happening here
>>>> is that mtr/mysql/mariadb isn't properly waiting for pending writes to
>>>> finish? It's just assuming that previously submitted writes will finish
>>>> if the task is killed?
>>>
>>> It's entirely possible.  What is the correct way to wait for pending
>>> writes via the liburing API?  MariaDB uses liburing under the hood,
>>> and if I know the call(s) to look for I can make sure it's properly
>>> handling task exit.
>>
>> I'd expect the task to wait and verify the results of pending requests
>> before doing io_uring_queue_exit(). But I'm not familiar with the code
>> base, maybe the task just exits? Closing the io_uring fd from an exiting
>> task would do the same.
>>
>> I tried the below patch when running mtr here, but don't see any of them
>> trigger. You can try that, that'll tell you if we ever run cancelations
>> on pending io-wq work. If that triggers, I can try and cook up something
>> that would figure out where that is coming from.
> 
> Doesn't trigger on my end either.  At least we know that's not the
> problem now.

Indeed

>> But since you said you're seeing exits on signal 9, that would seem to
>> indicate that someone ran SIGKILL with potentially pending IO.
> 
> Just to make sure we're talking about the same thing, when I refer to
> signal 9 I am referring to instrumentation I added to the
> get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I
> assume the SIGKILL is not expected, i.e. not coming from another
> location in the io_uring kernel code?

ksig.sig is set to signr, which is the number of the signal. So that
would seem to indicate that _someone_ is sending SIGKILL. But at the
same time, you don't see any of the cancel-on-exit triggering. Puzzling!
io_uring or io-wq doesn't send any signals.

In your instrumentation, are you checking where the signal is coming
from? Is it being dequeued as an actual signal, or is it some other
condition in get_signal() that ends up setting it to SIGKILL?

I don't expect the below to do anything as it _seems_ it's correct
as-is, but...

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f3754..bfec1e95b362 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -244,16 +244,17 @@ static void do_signal(struct task_struct *tsk)
 {
 	sigset_t *oldset = sigmask_to_save();
 	struct ksignal ksig = { .sig = 0 };
+	bool got_signal;
 	int ret;
 
 	BUG_ON(tsk != current);
 
-	get_signal(&ksig);
+	got_signal = get_signal(&ksig);
 
 	/* Is there any syscall restart business here ? */
 	check_syscall_restart(tsk->thread.regs, &ksig.ka, ksig.sig > 0);
 
-	if (ksig.sig <= 0) {
+	if (!got_signal) {
 		/* No signal to deliver -- put the saved sigmask back */
 		restore_saved_sigmask();
 		set_trap_norestart(tsk->thread.regs);

-- 
Jens Axboe

