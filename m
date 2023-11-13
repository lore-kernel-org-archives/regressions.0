Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D993D988
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 23:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="y8bBTgi8"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77891670417so46493985a.0
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699919304; x=1700524104; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXsig2KQzftjqYropdF5xZXEQ8c/ogy1/3YSKnHKlhM=;
        b=y8bBTgi84dc9fYTQrE6h4urd27bbiPrkBuq72Y9gnnX3XA0CXozOLVlEOppxuvoKH+
         w+lgpwgOH3yN87mkRMZhjsWoxN36iwsfL417wxyovGsbPpQ0dVzl8Ywkt5Q/ekOI/hrp
         iVEZn5nVuO5Ojh7x2K7zGwM4JsLpH/X1VHedMkoXY9sGutMwkGQFPwl3Q6aWLCGVkuWn
         uyhIEbTmtefbLGHcLZk/Lf/80Q5/uZNahYc+IAMF5BQn4AA/BLEFcyAlxJoleTfqrGga
         /jfRXIjsO31VRFRc1I5bqCLU1z08BZ72hiEk9Yb7vDYPKzDO90WfUHxOvZmlhVOFt/5S
         NWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699919304; x=1700524104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXsig2KQzftjqYropdF5xZXEQ8c/ogy1/3YSKnHKlhM=;
        b=pHdOEbwN/7r+3wR5z+h6HMEaFhG1z9GPXFNLwZXxqIBHmTDB5dkC63ZzT2kKZRjmv4
         /ZmtyHE4DEE/nJyjTYn4IgPXHUCqah7JaJ1CJ2eQoFauQeB6QXW8Im3OMgRJlQxpWFns
         5fCIcasY6uNcCt0OPx649Rus1oeARXFrtDINeK0HAGYlf/PrPy8Cfk12ZjAESpJxH+xN
         uNY/yx6DhIrCMvaUFsuY9Fhy/d/vmyLN9sE1RrpqPPPvP6u1BZcV1rO+sMoDX9gJzhFB
         2SmDd5UntCqszfXkUzqO+AzEuTYUZ9z1RYvXwjrGN8roX+B3I+7LcqRSg2UgSeNa+KaS
         5KVQ==
X-Gm-Message-State: AOJu0Yzka7FH36aiBYehFVz2sPxN90HJrejgqurUXcUos/VNhFZvbGMX
	Bawph1e0pVTvnyID2N9Rexbz5g==
X-Google-Smtp-Source: AGHT+IESqI/EUWkrJ7kjDkP9xdirrAmoQBbkWR3wc4V/SO7Il4iKyMTX4nrla7cUm5V8wnqVmUJBpQ==
X-Received: by 2002:a05:620a:19a9:b0:778:9b9f:ccbb with SMTP id bm41-20020a05620a19a900b007789b9fccbbmr821531qkb.0.1699919304022;
        Mon, 13 Nov 2023 15:48:24 -0800 (PST)
Received: from [172.20.4.17] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id bi8-20020a05620a318800b007671cfe8a18sm2245578qkb.13.2023.11.13.15.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 15:48:23 -0800 (PST)
Message-ID: <a42053ed-3a45-4dae-b953-00fb5aacb1de@kernel.dk>
Date: Mon, 13 Nov 2023 16:48:12 -0700
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
 <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com>
 <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
 <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
 <1450850996.47063900.1699902121475.JavaMail.zimbra@raptorengineeringinc.com>
 <5c59eda2-c638-4927-ac7a-aba7ffb284c7@kernel.dk>
 <1843925555.47083836.1699909110545.JavaMail.zimbra@raptorengineeringinc.com>
 <483d8017-4d15-4367-bac4-0e420cb4eb54@kernel.dk>
 <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 4:19 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Monday, November 13, 2023 4:15:44 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/13/23 1:58 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Monday, November 13, 2023 1:29:38 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/13/23 12:02 PM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Monday, November 13, 2023 11:39:30 AM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>>> On 11/13/23 10:06 AM, Timothy Pearson wrote:
>>>>>>> ----- Original Message -----
>>>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>,
>>>>>>>> "Pavel Begunkov"
>>>>>>>> <asml.silence@gmail.com>
>>>>>>>> Sent: Saturday, November 11, 2023 3:57:23 PM
>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>>
>>>>>>>> Unfortunately I got led down a rabbit hole here.  With the tests I was running,
>>>>>>>> MariaDB writes the encrypted data separately from the normal un-encrypted page
>>>>>>>> header and checksums, and the internal encrpyted data on disk was corrupt while
>>>>>>>> the outer page checksum was still valid.
>>>>>>>>
>>>>>>>> I have since switched to the main.xa_prepared_binlog_off test, which shows the
>>>>>>>> corruption more easily in the on-disk format.  We are still apparently dealing
>>>>>>>> with a write path issue, which makes more sense given the nature of the
>>>>>>>> corruption observed on production systems.
>>>>>>>
>>>>>>> Quick status update -- after considerable effort applied I've managed
>>>>>>> to narrow down what is going wrong, but still need to locate the root
>>>>>>> cause.  The bug is incredibly timing-dependent, therefore it is
>>>>>>> difficult to instrument the code paths I need without causing it to
>>>>>>> disappear.
>>>>>>>
>>>>>>> What we're dealing with is a wild write to RAM of some sort, provoked
>>>>>>> by the exact timing of some of the encryption tests in mariadb.  I've
>>>>>>> caught the wild write a few times now, it is not in the standard
>>>>>>> io_uring write path but instead appears to be triggered (somehow) by
>>>>>>> the io worker punting process.
>>>>>>>
>>>>>>> When the bug is hit, and if all other conditions are exactly correct,
>>>>>>> *something* (still to be identified) writes 32 bytes of gibberish into
>>>>>>> one of the mariadb in-RAM database pages at a random offset.  This
>>>>>>> wild write occurs right before the page is encrypted for write to disk
>>>>>>> via io_uring.  I have confirmed that the post-encryption data in RAM
>>>>>>> is written to disk without any additional corruption, and is then read
>>>>>>> back out from disk into the page verification routine also without any
>>>>>>> additional corruption.  The page verification routine decrypts the
>>>>>>> data from disk, thus restoring the decrypted data that contains the
>>>>>>> wild write data stamped somewhere on it, where we then hit the
>>>>>>> corruption warning and halt the test run.
>>>>>>>
>>>>>>> Irritatingly, if I try to instrument the data flow in the application
>>>>>>> right before the encryption routine, the bug disappears (or, more
>>>>>>> precisely, is masked).  If I had to guess from these symptoms, I'd
>>>>>>> suspect the application io worker thread is waking up, grabbing wrong
>>>>>>> context from somewhere, and scribbling some kind of status data into
>>>>>>> memory, which rarely ends up being on top of one of the in-RAM
>>>>>>> database pages.  This could be an application issue or a kernel issue,
>>>>>>> I'm not sure yet, but given the precise timing requirements I'm less
>>>>>>> and less surprised this is only showing on ppc64 right now.
>>>>>>>
>>>>>>> As always, investigation continues...
>>>>>>
>>>>>> I wonder if this has to do with copy_thread() on powerpc - so not
>>>>>> necessarily ppc memory ordering related, but just something in the arch
>>>>>> specific copy section.
>>>>>>
>>>>>> I took a look back, and the initial change actually forgot ppc. Since
>>>>>> then, there's been an attempt to make this generic:
>>>>>>
>>>>>> commit 5bd2e97c868a8a44470950ed01846cab6328e540
>>>>>> Author: Eric W. Biederman <ebiederm@xmission.com>
>>>>>> Date:   Tue Apr 12 10:18:48 2022 -0500
>>>>>>
>>>>>>    fork: Generalize PF_IO_WORKER handling
>>>>>>
>>>>>> and later a powerpc change related to that too:
>>>>>>
>>>>>> commit eed7c420aac7fde5e5915d2747c3ebbbda225835
>>>>>> Author: Nicholas Piggin <npiggin@gmail.com>
>>>>>> Date:   Sat Mar 25 22:29:01 2023 +1000
>>>>>>
>>>>>>    powerpc: copy_thread differentiate kthreads and user mode threads
>>>>>>
>>>>>> Just stabbing in the dark a bit here as I won't pretend to understand
>>>>>> the finer details of powerpc thread creation, but maybe try with this
>>>>>> and see if it makes any difference.
>>>>>>
>>>>>> As you note in your reply, we could very well be corrupting some bytes
>>>>>> somewhere every time. We just only notice quickly when it happens to be
>>>>>> in that specific buffer.
>>>>>>
>>>>>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>>>>>> index 392404688cec..d4dec2fd091c 100644
>>>>>> --- a/arch/powerpc/kernel/process.c
>>>>>> +++ b/arch/powerpc/kernel/process.c
>>>>>> @@ -1758,7 +1758,7 @@ int copy_thread(struct task_struct *p, const struct
>>>>>> kernel_clone_args *args)
>>>>>>
>>>>>> 	klp_init_thread_info(p);
>>>>>>
>>>>>> -	if (unlikely(p->flags & PF_KTHREAD)) {
>>>>>> +	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
>>>>>> 		/* kernel thread */
>>>>>>
>>>>>> 		/* Create initial minimum stack frame. */
>>>>>
>>>>> Good idea, but didn't work unfortunately.  Any other suggestions
>>>>> welcome while I continue to debug...
>>>>
>>>> I ponder if it's still in there... I don't see what else could be poking
>>>> and causing user memory corruption.
>>>
>>> Indeed, I'm really scratching my head on this one.  The corruption is
>>> definitely present, and quite sensitive to exact timing around page
>>> encryption start -- presumably if the wild write happens after the
>>> encryption routine finishes, it no longer matters for this particular
>>> test suite.
>>>
>>> Trying to find sensitive areas in the kernel, I hacked it up to always
>>> punt at least once per write -- no change in how often the corruption
>>> occurred.  I also hacked it up to try to keep I/O workers around vs.
>>> constantly tearing then down and respawning them, with no real change
>>> observed in corruption frequency, possibly because even with that we
>>> still end up creating a new I/O worker every so often.
>>>
>>> What did have a major effect was hacking the kernel to both punt at
>>> least once per write *and* to aggressively exit I/O worker threads,
>>> indicating that something in thread setup or teardown is stomping on
>>> memory.  When I say "aggressively exit I/O worker threads", I
>>> basically did this:
>>
>> It's been my suspicion, as per previous email from today, that this is
>> related to worker creation on ppc. You can try this patch, which just
>> pre-creates workers and don't let them time out. That means that the max
>> number of workers for bounded work is pre-created before the ring is
>> used, so we'll never see any worker creation. If this works, then it's
>> certainly something related to worker creation.
> 
> Yep, that makes the issue disappear.  I wish I knew if it it was
> always stepping on memory somewhere and it just hits unimportant
> process memory most of the time, or if it's only stepping on memory
> iff the tight timing conditions are met.
> 
> Technically it could be either worker creation or worker destruction.
> Any quick way to distinguish between the two?  E.g. create threads,
> allow them to stop processing by timing out, but never tear them down
> somehow?  Obviously we'd eventually exhaust the system thread resource
> limits, but for a quick test it might be enough?

Sure, we could certainly do that. Something like the below should do
that, it goes through the normal teardown on timeout, but doesn't
actually call do_exit() until the wq is being torn down anyway. That
should ensure that we create workers as we need them, but when they time
out, they won't actually exit until we are tearing down anyway on ring
exit.

> I'm also a bit perplexed as to how we can be stomping on user memory
> like this without some kind of page fault occurring.  If we can
> isolate things to thread creation vs. thread teardown, I'll go
> function by function and see what is going wrong.

Agree, it's very odd.

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..51a82daaac36 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -16,6 +16,7 @@
 #include <linux/task_work.h>
 #include <linux/audit.h>
 #include <linux/mmu_context.h>
+#include <linux/delay.h>
 #include <uapi/linux/io_uring.h>
 
 #include "io-wq.h"
@@ -239,6 +240,9 @@ static void io_worker_exit(struct io_worker *worker)
 
 	kfree_rcu(worker, rcu);
 	io_worker_ref_put(wq);
+
+	while (!test_bit(IO_WQ_BIT_EXIT, &wq->state))
+		msleep(500);
 	do_exit(0);
 }
 

-- 
Jens Axboe

