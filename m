Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E770F45969
	for <regressions@lists.linux.dev>; Thu, 16 Nov 2023 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WnJseryF"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6708d2df1a3so782176d6.1
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 19:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700106363; x=1700711163; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdVZWELafT6acWki004C0s2BCexQURatJSdxW3/NuaY=;
        b=WnJseryFTCdMuRYe46WZAhKAUiLQMP1pckMkWosQkf8d/v8wqYJR8lPz82mUJQY0bE
         lMkcRbXpoIICu2KWSx3d62V6ZdU9xpH8oyLd1G7BUoWBJ2pjf8BDm+kMFqkOREDHFfHh
         uMQxzv1RnLtsMdbZccQclm+NQvmlkv4FiURhYJqdAGYGK2zpBHXgXcgz+FthIfyreSqj
         hO72EzyEZTsTb3logomhYBD64En7lWILbVJF8GvlZ4ug1x98aENVgCD2HW++FfQfb0Xv
         Vcj30WdthS922GMjqWbJMbwIeeSe/FpIqrZoC/bVTCR+GBdGrnlitdiGvecyUdRMO8vx
         7qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700106363; x=1700711163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdVZWELafT6acWki004C0s2BCexQURatJSdxW3/NuaY=;
        b=nQbHGHYhr6n8sJ93wuvml/syZKwknVDpEXi4j5sr+TF2sowm3b9fncdvOhOZYFMxO5
         s9c9r3bCGEmimsJnd44Wz1buuXrEuoaR/8JO+DVwUBv3jmAO86O3de8SJEiOGADVbYt1
         mM8N2TZLi/1fqZYwHVP9IspkjCWjnfKpnS55go+1BwJJFaY/TLn9xnD0wJB1+TCqb1Q2
         tXinZQRulVrSOe+dUOjyTlS3bIhEAQwAobypzsr4kEG87UUcfcgHggzsbEhjxJF2piib
         valleZousqAseRIKSW7HPRdMNhl4HTIZcTAaDMF4nTiPCfPKUuXmk3TZ3ovv2r4KJ5QC
         U3Ig==
X-Gm-Message-State: AOJu0YzFrVJnmfUwDUGB4v+ZHsGcmy7+eU2oQelWBGipMJBo9MBa1A5h
	bFexZC3K7v1Mv2KRA5S00bd2zA==
X-Google-Smtp-Source: AGHT+IEg+N8s7nSEyMONU1+mjkaRIZOruLsYrmfy6HiNtICsfKPZGJtinbqFvH0fF3426s0NrlPJwQ==
X-Received: by 2002:a0c:efd0:0:b0:66d:1bbb:e9f8 with SMTP id a16-20020a0cefd0000000b0066d1bbbe9f8mr7352338qvt.6.1700106363456;
        Wed, 15 Nov 2023 19:46:03 -0800 (PST)
Received: from ?IPV6:2600:380:916a:8cb8:ec78:77a6:1b32:b098? ([2600:380:916a:8cb8:ec78:77a6:1b32:b098])
        by smtp.gmail.com with ESMTPSA id mg2-20020a056214560200b0064906cfe430sm1067620qvb.135.2023.11.15.19.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 19:46:02 -0800 (PST)
Message-ID: <5fb3fb19-cb9b-42d0-8949-7a9be8750682@kernel.dk>
Date: Wed, 15 Nov 2023 20:46:01 -0700
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
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
 <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
 <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
 <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk>
 <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com>
 <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
 <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk>
 <230871836.47658490.1700105335407.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <230871836.47658490.1700105335407.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 8:28 PM, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>> Sent: Wednesday, November 15, 2023 1:00:53 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/15/23 11:30 AM, Jens Axboe wrote:
>>> On 11/15/23 10:03 AM, Timothy Pearson wrote:
>>>>
>>>>
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>, "Michael Ellerman"
>>>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>>>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>>>>> I haven't had much success in getting the IPI path to work properly,
>>>>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>>>>> least able to narrow down one of the areas that's going wrong.  Bear
>>>>>> in mind that as soon as I reenable IPI the corruption returns with a
>>>>>> vengeance, so this is not the correct fix yet by any means -- I am
>>>>>> currently soliciting feedback on what else might be going wrong at
>>>>>> this point since I've already spent a couple of weeks on this and am
>>>>>> not sure how much more time I can spend before we just have to shut
>>>>>> io_uring down on ppc64 for the forseeable future.
>>>>>>
>>>>>> Whatever the root cause actually is, something is *very* sensitive to
>>>>>> timing in both the worker thread creation path and the io_queue_sqe()
>>>>>> / io_queue_async() paths.  I can make the corruption disappear by
>>>>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>>>>> function, however no amount of memory barriers in the io_queue_async()
>>>>>> path (including in the kbuf recycling code) will fully resolve the
>>>>>> problem.
>>>>>>
>>>>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>>>>> amount of workers being created overall?  I know with some of the
>>>>>> other delay locations worker allocation was changing, from what I see
>>>>>> this one wouldn't seem to have much effect, but I'm still looking for
>>>>>> a sanity check.  If we're needing to wait for a millisecond for some
>>>>>> other thread to complete before moving on that might be valuable
>>>>>> information -- would also potentially tie in to the IPI path still
>>>>>> malfunctioning as the worker would immediately start executing.
>>>>>
>>>>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>>>>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>>>>> delay before we either pass to an existing worker or create a new one.
>>>>>
>>>>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>>>>> list guaranteed, especially on weak memory model systems?  As I
>>>>>> understand it, different workers running on different cores could
>>>>>> potentially be interacting with the same kiocb request and the same
>>>>>> buffer list, and that does dovetail with the fact that punting to a
>>>>>> different I/O worker (usually on another core) seems to provoke the
>>>>>> problem.  I tried adding memory barriers to some of the basic recycle
>>>>>> functions without too much success -- it seemed to help somewhat, but
>>>>>> nowhere near complete resolution, and the buffers are used in a number
>>>>>> of other places I didn't even try to poke at.  I wanted to get some
>>>>>> feedback on this concept before going down yet another rabbit hole...
>>>>>
>>>>> This relies on the fact that we grab the wq lock before inserting this
>>>>> work, and the unlocking will be a barrier. It's important to note that
>>>>> this isn't any different than from before io-wq was using native
>>>>> workers, the only difference is that it used to be kthreads before, and
>>>>> now it's native threads to the application. The kthreads did a bunch of
>>>>> work to assume the necessary identity to do the read or write operation
>>>>> (which is ultimately why that approach went away, as it was just
>>>>> inherently unsafe), whereas the native threads do not as they already
>>>>> have what they need.
>>>>>
>>>>> I had a patch that just punted to a kthread and did the necessary
>>>>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>>>>> that point. Within the existing code...
>>>>
>>>> Would you happen to have that patch still?  It would provide a
>>>> possible starting point for figuring out the exact difference.  If not
>>>> I guess I could hack something similar up.
>>>
>>> Let me see if I can find it, and make sure it applies on the current
>>> tree. I'll send you one in a bit.
>>
>> Wrote a new one. This one has two different ways it can work:
>>
>> 1) By default, it uses the native io workers still, but rather than add
>> it to a list of pending items, it creates a new worker for each work
>> item. This means all writes that would've gone to io-wq will now just
>> fork a native worker and perform the write in a blocking fashion.
>>
>> 2) The fallback path for the above is that we punt it to a kthread,
>> which does the mm dance. This is similar to what we did before the
>> native workers. The fallback path is only hit if the worker creation
>> fails, but you can make it happen every time by just uncommenting that
>> return 1 in io_rewrite_io_thread().
>>
>> The interesting thing about approach 1 is that while it still uses the
>> native workers, it will not need to be processing task_work and hence
>> signaling with TWA_SIGNAL or TWA_SIGNAL_NO_IPI to get it done. It simply
>> forks off a new worker every time, which does the work, then exits.
>>
>> First try it as-is and see if that reproduces the issue. If it does,
>> then try uncommenting that return 1 mentioned in #2 above.
> 
> OK, so those two test cases worked, *but* I would have expected that,
> since when we go through the system workqueue (with its associated
> delays) it is functionally the same as inserting the udelay(1000) at

No we don't! For case 1, we use the exact same mechanism as the stock
kernel, the only difference is that we'll always hand it to a new
worker. Will that slow down some writes, certainly. Because before that
patch we'd potentially hand it over to an existing worker immediately.
Eg as soon as we did the spin_unlock() in io_wq_enqueue(), a new worker
could grab that same lock and start processing the work. We're not
talking a 1ms delay here, it's way shorter than that. This again to me
tells me it might be an ordering or barrier issue, but at the same time,
I've run with smp_mb() before and after insertion AND on retrieval of
the work item on the other side, and it triggers the issue even even.

On top of that, if we pre-create the workers, then we've already
established that the issue does not occur. With pre-created workers,
there's no extra delay between handing off the write and issuing it,
like we have with the test patch. In fact, it works the _exact_ same way
that the stock kernel does, except you don't have workers exiting or
being created. To me, this tells me that it cannot be a memory ordering
issue. If it was, we'd 100% see it for that case too, as we have all the
same handoff and execution as we did before. The only difference is that
we don't have an IPI for worker creation, and we don't have workers
exiting when they time out.

> the start of io_write().  I suspect the root issue predates the move
> to worker-managed I/O threads and that it was exposed simply by
> (inadvertently) shortening the delay between the initial io_write()
> call and the subsequent thread start.  Then, when the code started

Maybe? So far it seems very little certain knowledge exists about this
issue, unfortunately, other than it seems to be some very weird arch
interaction/issue.

> issuing IPIs to kick thread start even faster we ended up racing with
> this other mysterious process almost every time instead of somewhat
> rarely, basically compounding the problem and making analysis next to
> impossible until the IPI was skipped via the TWA_SIGNAL_NO_IPI flag.
> 
> I'm unsure if this is related to the oops I sent off-list, but I
> suspect it very well might be given a delay in the same location works
> around the corruption.

I don't think It's related to that at all, that's a worker creation vs
shutdown issue.

-- 
Jens Axboe

