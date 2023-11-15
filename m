Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20D364B3
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="yM40yCTH"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77bbe4702a1so10624085a.0
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700073453; x=1700678253; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kNecfSqx4BBMiHG8RpcjTKsdPVX/jDTrJ7cWN5Pmpx4=;
        b=yM40yCTHdrgM7L3bsUEwwAias6NRxEE38RPLAQbmTPEg5Al39CytUTPjeJMzBBdWxI
         iwGEDDT9bZICiRvIO9BtIg+JVsv3laLb3K3qjG/qxZlVOssueLE3lyU0LRqGas76Ntsq
         mEQDLSN8Dtd7PzZGtzKyCJjpHXjgHGo02cmfufPLTrcI8LXUY6HKBHpwox4s6y4Rxfg5
         BdFoc25t+lMdk28zrI3XZ9Z/Lfbwy2A5R+X0HJFhrHxi9dPQVRtJ4cpCbWwuynOcBHJZ
         d7+9Pgl0yGN7kgn5nIqmDYhAy318JRFa8UF/+xUzV4Q5q5F07OvrPp4xLHu/PDFrv9bg
         /t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700073453; x=1700678253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNecfSqx4BBMiHG8RpcjTKsdPVX/jDTrJ7cWN5Pmpx4=;
        b=mlvQsr2wXRCrMNrcScCCHiEN3Hrbmd8lWYmIqrZp4Iu0f8Pyu5PytCCmzNM2FLphmn
         BDYqhUDOAcCYGHo2p4WBmMBWjLikN4zX4P2CIcfUZlOC6pkb13+heu9+CFjsB8+I7w5d
         IYAucZSVsZ7/AWsm7Pp4mFXSl0ZbTKzaStFs5SYMGVxnI18wIMt8L1JHPupkqn6aqsRQ
         ivEAR3qIvFovpR+381Mvvm2+J7RXUIjH7pG026Bz7snQoouvy6KlNdB2IW46tNNO4Yya
         sci01ZneHl1hQm2X7AUJugqcOXlXdzwdoocZwt9/x9VygKcmV8pWQDXoMoU2VaiF5Kp6
         J/JA==
X-Gm-Message-State: AOJu0YxjBkLdogue0yAtezKFre2jgg5XxeqY7+x5G5dG0ddNHd2MY/QI
	VrLFf6iiZtrFSVO9znaI5RCNeg==
X-Google-Smtp-Source: AGHT+IGDLmx/dhTt0ZMKtHY0BjLDhwOvsxvHMxI5R0NZb7b02egK3xBVK8opwv0wr1BMRIFHi+mvaA==
X-Received: by 2002:a05:620a:46aa:b0:773:a8d0:b326 with SMTP id bq42-20020a05620a46aa00b00773a8d0b326mr6796723qkb.4.1700073453674;
        Wed, 15 Nov 2023 10:37:33 -0800 (PST)
Received: from ?IPV6:2600:380:9174:8ba6:574e:42be:c115:95f1? ([2600:380:9174:8ba6:574e:42be:c115:95f1])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a2a1200b007743360b3fasm3657930qkp.34.2023.11.15.10.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 10:37:33 -0800 (PST)
Message-ID: <edc9d8b9-3583-4f68-9deb-57bff838138d@kernel.dk>
Date: Wed, 15 Nov 2023 11:37:31 -0700
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
 Pavel Begunkov <asml.silence@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
 <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
 <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
 <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk>
 <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com>
 <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
 <810551908.47566437.1700073352061.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <810551908.47566437.1700073352061.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 11:35 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>> Sent: Wednesday, November 15, 2023 12:30:15 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/15/23 10:03 AM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>, "Michael Ellerman"
>>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>>>> I haven't had much success in getting the IPI path to work properly,
>>>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>>>> least able to narrow down one of the areas that's going wrong.  Bear
>>>>> in mind that as soon as I reenable IPI the corruption returns with a
>>>>> vengeance, so this is not the correct fix yet by any means -- I am
>>>>> currently soliciting feedback on what else might be going wrong at
>>>>> this point since I've already spent a couple of weeks on this and am
>>>>> not sure how much more time I can spend before we just have to shut
>>>>> io_uring down on ppc64 for the forseeable future.
>>>>>
>>>>> Whatever the root cause actually is, something is *very* sensitive to
>>>>> timing in both the worker thread creation path and the io_queue_sqe()
>>>>> / io_queue_async() paths.  I can make the corruption disappear by
>>>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>>>> function, however no amount of memory barriers in the io_queue_async()
>>>>> path (including in the kbuf recycling code) will fully resolve the
>>>>> problem.
>>>>>
>>>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>>>> amount of workers being created overall?  I know with some of the
>>>>> other delay locations worker allocation was changing, from what I see
>>>>> this one wouldn't seem to have much effect, but I'm still looking for
>>>>> a sanity check.  If we're needing to wait for a millisecond for some
>>>>> other thread to complete before moving on that might be valuable
>>>>> information -- would also potentially tie in to the IPI path still
>>>>> malfunctioning as the worker would immediately start executing.
>>>>
>>>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>>>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>>>> delay before we either pass to an existing worker or create a new one.
>>>>
>>>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>>>> list guaranteed, especially on weak memory model systems?  As I
>>>>> understand it, different workers running on different cores could
>>>>> potentially be interacting with the same kiocb request and the same
>>>>> buffer list, and that does dovetail with the fact that punting to a
>>>>> different I/O worker (usually on another core) seems to provoke the
>>>>> problem.  I tried adding memory barriers to some of the basic recycle
>>>>> functions without too much success -- it seemed to help somewhat, but
>>>>> nowhere near complete resolution, and the buffers are used in a number
>>>>> of other places I didn't even try to poke at.  I wanted to get some
>>>>> feedback on this concept before going down yet another rabbit hole...
>>>>
>>>> This relies on the fact that we grab the wq lock before inserting this
>>>> work, and the unlocking will be a barrier. It's important to note that
>>>> this isn't any different than from before io-wq was using native
>>>> workers, the only difference is that it used to be kthreads before, and
>>>> now it's native threads to the application. The kthreads did a bunch of
>>>> work to assume the necessary identity to do the read or write operation
>>>> (which is ultimately why that approach went away, as it was just
>>>> inherently unsafe), whereas the native threads do not as they already
>>>> have what they need.
>>>>
>>>> I had a patch that just punted to a kthread and did the necessary
>>>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>>>> that point. Within the existing code...
>>>
>>> Would you happen to have that patch still?  It would provide a
>>> possible starting point for figuring out the exact difference.  If not
>>> I guess I could hack something similar up.
>>
>> Let me see if I can find it, and make sure it applies on the current
>> tree. I'll send you one in a bit.
> 
> Much appreciated.
> 
> New question -- should a user of liburing be able to oops the kernel
> under any circumstances (userspace access / NULL pointer dereference)?
> I've started putting together a torture test application and hit ...
> something ... almost right away .  If this isn't supposed to happen
> I'll send more details off-list for a double check.

No, certainly not. Please do send me the details. I'm assuming this is
on an unmodified kernel, some of the patches that have been flung around
in this thread are definitely not generally sane, it's just that knowing
the context of what is being used makes that fine for test purposes.

-- 
Jens Axboe

