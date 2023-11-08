Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE8DF4E
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="h5z9JBCl"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7a9541c9b2aso60725139f.0
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 07:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699456215; x=1700061015; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKBCCzS93wJK4ko/5uMp6luOuxLwYljPkeWJ28DEdgw=;
        b=h5z9JBClbMtLekGPseB03l0Pbf7Eyp/e83jrxcx5hZwGFWKg16wBs0EhPLwZmEyRwj
         xuUGviPauy7Ch7niJ2dysshV++fVnCN6GmtUWOsOAKgQZqCZ0U3vvEWT9NyJY4P7+v1J
         4/+kFrPYZVixmJHO1wPzQwLlMnFXl7nSvQFnS7UCMm+CRQap3SxmDwlXrFMbCvbjIeYp
         d98lojeGzgQ6Hsbnn95lg8a+My760laAIAzg8f6O1xg1ItAlXeLQTR69XZJ80zRq9J/s
         vJh9Rlxo1AbM1lgPMcktXLWWOZvpZBLHdhNmMQXqEyBtdDxaWQtTlzRWNNx8hNPdxevg
         SxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699456215; x=1700061015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKBCCzS93wJK4ko/5uMp6luOuxLwYljPkeWJ28DEdgw=;
        b=NHwGb3SZ0HLlcE49nBxNwOYMXXBG27eojWXFWK7g4CTAGDfVIDSOVS8uNC1VxgC2Ij
         9SGaBCiwfJqx1VpIlszDuM1ZxkJfuZ4/GFLv2rNz8O9zFJTHvdypV7t18A/Ipus80rXc
         coLvbD+Fgq0duVF+hvbsgcw/BjBoDIqhu1iagS5g1AWP6M8synkRiMOL4r0Uhy337p3x
         hiBFQL64HNhSfk08qJ1VJry0jB7dKF60nDmT3N6XE0CybYgdixkqo+p1YweMLRg/CviM
         8NArYpxcqm/1Hmgw7FGNlChbw/XisA21jR9cC4qjtAoo0fsTkukk4cW4lQTK4hBdZspV
         0Ppw==
X-Gm-Message-State: AOJu0YzRoxEO/LfWpWxij9lmgPnYSPIJln8dUTeUTqDVjJu/FjufwCw6
	G2QiusZI1k8uu/ygekg43xMXjA==
X-Google-Smtp-Source: AGHT+IH9/c/UPgrevMnxrazoQViROH3ZLNbMZqRQwbuCZCCJlUmJmgW50vKMHHMhUDLdbzD+Md0FUw==
X-Received: by 2002:a05:6602:b8c:b0:792:7c78:55be with SMTP id fm12-20020a0566020b8c00b007927c7855bemr2737744iob.0.1699456215591;
        Wed, 08 Nov 2023 07:10:15 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id dq27-20020a0566384d1b00b0045b16bddb8fsm3135787jab.111.2023.11.08.07.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:10:14 -0800 (PST)
Message-ID: <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
Date: Wed, 8 Nov 2023 08:10:13 -0700
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
 <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
 <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
 <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
 <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
 <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
 <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
 <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
 <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 9:00 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 6:09:39 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 5:02 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 7, 2023 5:52:54 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/7/23 4:34 PM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Tuesday, November 7, 2023 5:16:24 PM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>> But since you said you're seeing exits on signal 9, that would seem to
>>>>>> indicate that someone ran SIGKILL with potentially pending IO.
>>>>>
>>>>> Just to make sure we're talking about the same thing, when I refer to
>>>>> signal 9 I am referring to instrumentation I added to the
>>>>> get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I
>>>>> assume the SIGKILL is not expected, i.e. not coming from another
>>>>> location in the io_uring kernel code?
>>>>
>>>> ksig.sig is set to signr, which is the number of the signal. So that
>>>> would seem to indicate that _someone_ is sending SIGKILL. But at the
>>>> same time, you don't see any of the cancel-on-exit triggering. Puzzling!
>>>> io_uring or io-wq doesn't send any signals.
>>>>
>>>> In your instrumentation, are you checking where the signal is coming
>>>> from?Is it being dequeued as an actual signal, or is it some other
>>>> condition in get_signal() that ends up setting it to SIGKILL?
>>>
>>> I still need to check this in more detail.  What I do know at the
>>> moment is that the kill seems to be related to the entire workqueue
>>> going down, i.e. it is sent to the workers of a given workqueue after
>>> io_wq_put_and_exit() and io_wq_exit_workers() are called for that
>>> workqueue.  Not sure if that helps any, will keep digging...
>>
>> Another option is that it's doing exec() with pending IO, which will
>> cancel it. But I'm also assuming that mtr/friends will check result
>> values of writes and would've caught that there.
> 
> Here's something potentially more useful, the stack trace of what's
> calling the workqueue exit function:
> 
> [   35.074923] Call Trace:
> [   35.074939] [c000000007183890] [c0000000005c0804] io_wq_exit_workers+0x48/0x214 (unreliable)
> [   35.074994] [c000000007183920] [c0000000005c0410] io_wq_put+0xa0/0x27c
> [   35.075034] [c0000000071839f0] [c0000000005a92a8] io_uring_clean_tctx+0x98/0xe0
> [   35.075082] [c000000007183a30] [c0000000005bdc78] __io_uring_files_cancel+0x4f8/0x580
> [   35.075129] [c000000007183b20] [c000000000153fc8] do_exit+0x1c8/0xce0
> [   35.075169] [c000000007183bf0] [c000000000154c58] do_group_exit+0x108/0x110
> [   35.075209] [c000000007183c30] [c00000000016ac6c] get_signal+0xbfc/0xce0
> [   35.075251] [c000000007183d10] [c00000000001ed50] do_notify_resume+0xd0/0x420
> [   35.075298] [c000000007183dc0] [c00000000002dbbc] syscall_exit_prepare+0x15c/0x360
> [   35.075348] [c000000007183e10] [c00000000000cf74] system_call_vectored_common+0xf4/0x260

The task owning (or using) the ring got sent a signal, and it's now
exiting which entails canceling pending IO operations too.

> This call is associated with the mariadb userspace PID:
> 
> [   35.074242] CPU: 12 PID: 1260 Comm: mariadbd
> 
> To me, it almost looks like the mariadb I/O worker thread is getting
> terminated via signal and that this termination is taking out the
> write before it can complete.  Is that even possible?

If a write has been started, then it should finish. For storage IO,
there's no way to cancel a write that's already in progress. But async
writes queue up, and if an io-wq worker hasn't retrieved it yet, it will
be found and canceled, and hence never make it to stable media. But this
should also have triggered the cancelation WARN_ON() stuff I added in
that debug patch, but not sure if you are running with that as well.

Might be useful to add some debugging around where signals are sent,
rather than retrieved. But seems like we'd already know it's SIGKILL per
previous debugging.

It could also be a task that has pending IO and is doing exec() (and
friends), this would also cancel inflight IO.

-- 
Jens Axboe

