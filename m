Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5BC2D63C
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 22:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Dt6PYeUB"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-77773d3246aso12488785a.1
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 14:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699913751; x=1700518551; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPGsAYgwH2w15lwhGKJFKHTV8JFp8nWAlaAZ/gy20Zs=;
        b=Dt6PYeUBigr9TdIJ8IXIYyFPhE4teLhggXXaqeNhAf+WGWnfUNSD/07qDbwQUJNnEv
         t4CImzoNrIX7Yl6NEO3cfl5oflSDeiYxBHeYDtnLNGoSZPCY3ypHHh3l3AaxYegA5BUH
         H9k3KjgHoDey/LakCNetldYKmj/CuAU2Sg6i0ki7rGhyowZOqxJVIK7NON5W4er0Rh8W
         DfFkkeuH7ltH9AGbswICdHk081C7cr4m9XvhFML33/ngHrUHtEXPNCuisxUj4BLI1jcX
         CwaMhCPim9wmc2h2BKDKW/weHmnhbJcETmuIJONorbCSs+leJpcSlYGqIt6lusN6Ycp3
         te+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913751; x=1700518551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPGsAYgwH2w15lwhGKJFKHTV8JFp8nWAlaAZ/gy20Zs=;
        b=efApiyeny0UdLcL7SX5E5Xu29wOmfRsA2meIfS2ykXLp9OmX/WGgL4OCrp3wefXXZ9
         LGl4ZfLwBl8k2l/Pxyr4AJxYK6HCgvEhvl/XDFviUTueLCiQADBAJstqbq9xLtICaDzJ
         +mSbeo59DmeFjGgRt520ydk3t2yBNDTjhFV+E8ujCHOg5eR4u6AlFFhD+ZX2n08l+a/w
         vE3LAi7i3qmAvXXx9jY5pENT1NMo33fn7MoOCrCjIcSlI4Ob2d/PxV4OSKSy0ebd0HW6
         09YSfm2lTKmwoGqyOR8v+On9/Kc9T+fVDTDP0aQSGZfCsnHk/KmSWFuTAOfGA+fVs1Aa
         JLmA==
X-Gm-Message-State: AOJu0YziYLz2cmiGgJUQnnig3eoI7y+YbQLsmd5jJ1FwIt5DTVz4c4u9
	yEAO5ILMCcH40NBur/oiv9/gqg==
X-Google-Smtp-Source: AGHT+IEb+KFIKmqS0kFj2bUZonnaifIh1Ogl6BaRD+XZFOBgdU4w08LfDfeyhtHHV1jfyg0mWeJb7g==
X-Received: by 2002:a05:620a:1a83:b0:76f:1846:2f6b with SMTP id bl3-20020a05620a1a8300b0076f18462f6bmr577580qkb.1.1699913751237;
        Mon, 13 Nov 2023 14:15:51 -0800 (PST)
Received: from [172.20.4.17] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id bi33-20020a05620a31a100b0077703f31496sm2177649qkb.92.2023.11.13.14.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 14:15:50 -0800 (PST)
Message-ID: <483d8017-4d15-4367-bac4-0e420cb4eb54@kernel.dk>
Date: Mon, 13 Nov 2023 15:15:44 -0700
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
 <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk>
 <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com>
 <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com>
 <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
 <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
 <1450850996.47063900.1699902121475.JavaMail.zimbra@raptorengineeringinc.com>
 <5c59eda2-c638-4927-ac7a-aba7ffb284c7@kernel.dk>
 <1843925555.47083836.1699909110545.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1843925555.47083836.1699909110545.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 1:58 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Monday, November 13, 2023 1:29:38 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/13/23 12:02 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Monday, November 13, 2023 11:39:30 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/13/23 10:06 AM, Timothy Pearson wrote:
>>>>> ----- Original Message -----
>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>,
>>>>>> "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Saturday, November 11, 2023 3:57:23 PM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>> Unfortunately I got led down a rabbit hole here.  With the tests I was running,
>>>>>> MariaDB writes the encrypted data separately from the normal un-encrypted page
>>>>>> header and checksums, and the internal encrpyted data on disk was corrupt while
>>>>>> the outer page checksum was still valid.
>>>>>>
>>>>>> I have since switched to the main.xa_prepared_binlog_off test, which shows the
>>>>>> corruption more easily in the on-disk format.  We are still apparently dealing
>>>>>> with a write path issue, which makes more sense given the nature of the
>>>>>> corruption observed on production systems.
>>>>>
>>>>> Quick status update -- after considerable effort applied I've managed
>>>>> to narrow down what is going wrong, but still need to locate the root
>>>>> cause.  The bug is incredibly timing-dependent, therefore it is
>>>>> difficult to instrument the code paths I need without causing it to
>>>>> disappear.
>>>>>
>>>>> What we're dealing with is a wild write to RAM of some sort, provoked
>>>>> by the exact timing of some of the encryption tests in mariadb.  I've
>>>>> caught the wild write a few times now, it is not in the standard
>>>>> io_uring write path but instead appears to be triggered (somehow) by
>>>>> the io worker punting process.
>>>>>
>>>>> When the bug is hit, and if all other conditions are exactly correct,
>>>>> *something* (still to be identified) writes 32 bytes of gibberish into
>>>>> one of the mariadb in-RAM database pages at a random offset.  This
>>>>> wild write occurs right before the page is encrypted for write to disk
>>>>> via io_uring.  I have confirmed that the post-encryption data in RAM
>>>>> is written to disk without any additional corruption, and is then read
>>>>> back out from disk into the page verification routine also without any
>>>>> additional corruption.  The page verification routine decrypts the
>>>>> data from disk, thus restoring the decrypted data that contains the
>>>>> wild write data stamped somewhere on it, where we then hit the
>>>>> corruption warning and halt the test run.
>>>>>
>>>>> Irritatingly, if I try to instrument the data flow in the application
>>>>> right before the encryption routine, the bug disappears (or, more
>>>>> precisely, is masked).  If I had to guess from these symptoms, I'd
>>>>> suspect the application io worker thread is waking up, grabbing wrong
>>>>> context from somewhere, and scribbling some kind of status data into
>>>>> memory, which rarely ends up being on top of one of the in-RAM
>>>>> database pages.  This could be an application issue or a kernel issue,
>>>>> I'm not sure yet, but given the precise timing requirements I'm less
>>>>> and less surprised this is only showing on ppc64 right now.
>>>>>
>>>>> As always, investigation continues...
>>>>
>>>> I wonder if this has to do with copy_thread() on powerpc - so not
>>>> necessarily ppc memory ordering related, but just something in the arch
>>>> specific copy section.
>>>>
>>>> I took a look back, and the initial change actually forgot ppc. Since
>>>> then, there's been an attempt to make this generic:
>>>>
>>>> commit 5bd2e97c868a8a44470950ed01846cab6328e540
>>>> Author: Eric W. Biederman <ebiederm@xmission.com>
>>>> Date:   Tue Apr 12 10:18:48 2022 -0500
>>>>
>>>>    fork: Generalize PF_IO_WORKER handling
>>>>
>>>> and later a powerpc change related to that too:
>>>>
>>>> commit eed7c420aac7fde5e5915d2747c3ebbbda225835
>>>> Author: Nicholas Piggin <npiggin@gmail.com>
>>>> Date:   Sat Mar 25 22:29:01 2023 +1000
>>>>
>>>>    powerpc: copy_thread differentiate kthreads and user mode threads
>>>>
>>>> Just stabbing in the dark a bit here as I won't pretend to understand
>>>> the finer details of powerpc thread creation, but maybe try with this
>>>> and see if it makes any difference.
>>>>
>>>> As you note in your reply, we could very well be corrupting some bytes
>>>> somewhere every time. We just only notice quickly when it happens to be
>>>> in that specific buffer.
>>>>
>>>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>>>> index 392404688cec..d4dec2fd091c 100644
>>>> --- a/arch/powerpc/kernel/process.c
>>>> +++ b/arch/powerpc/kernel/process.c
>>>> @@ -1758,7 +1758,7 @@ int copy_thread(struct task_struct *p, const struct
>>>> kernel_clone_args *args)
>>>>
>>>> 	klp_init_thread_info(p);
>>>>
>>>> -	if (unlikely(p->flags & PF_KTHREAD)) {
>>>> +	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
>>>> 		/* kernel thread */
>>>>
>>>> 		/* Create initial minimum stack frame. */
>>>
>>> Good idea, but didn't work unfortunately.  Any other suggestions
>>> welcome while I continue to debug...
>>
>> I ponder if it's still in there... I don't see what else could be poking
>> and causing user memory corruption.
> 
> Indeed, I'm really scratching my head on this one.  The corruption is
> definitely present, and quite sensitive to exact timing around page
> encryption start -- presumably if the wild write happens after the
> encryption routine finishes, it no longer matters for this particular
> test suite.
> 
> Trying to find sensitive areas in the kernel, I hacked it up to always
> punt at least once per write -- no change in how often the corruption
> occurred.  I also hacked it up to try to keep I/O workers around vs.
> constantly tearing then down and respawning them, with no real change
> observed in corruption frequency, possibly because even with that we
> still end up creating a new I/O worker every so often.
> 
> What did have a major effect was hacking the kernel to both punt at
> least once per write *and* to aggressively exit I/O worker threads,
> indicating that something in thread setup or teardown is stomping on
> memory.  When I say "aggressively exit I/O worker threads", I
> basically did this:

It's been my suspicion, as per previous email from today, that this is
related to worker creation on ppc. You can try this patch, which just
pre-creates workers and don't let them time out. That means that the max
number of workers for bounded work is pre-created before the ring is
used, so we'll never see any worker creation. If this works, then it's
certainly something related to worker creation.


diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..e87cabe5bbb7 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -673,7 +673,7 @@ static int io_wq_worker(void *data)
 			break;
 		}
 		if (!ret) {
-			last_timeout = true;
+			// last_timeout = true;
 			exit_mask = !cpumask_test_cpu(raw_smp_processor_id(),
 							wq->cpu_mask);
 		}
@@ -947,8 +947,8 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 	do_create = !io_wq_activate_free_worker(wq, acct);
 	rcu_read_unlock();
 
-	if (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
-	    !atomic_read(&acct->nr_running))) {
+	if (0 && (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
+	    !atomic_read(&acct->nr_running)))) {
 		bool did_create;
 
 		did_create = io_wq_create_worker(wq, acct);
@@ -1138,6 +1138,33 @@ static int io_wq_hash_wake(struct wait_queue_entry *wait, unsigned mode,
 	return 1;
 }
 
+static void pre_create_workers(struct io_wq *wq)
+{
+	struct io_wq_acct *acct = &wq->acct[IO_WQ_ACCT_BOUND];
+	int i, ret, to_create = acct->max_workers;
+
+	raw_spin_lock(&wq->lock);
+	acct->nr_workers = to_create;
+	atomic_add(to_create, &acct->nr_running);
+	atomic_add(to_create, &wq->worker_refs);
+	raw_spin_unlock(&wq->lock);
+
+	for (i = 0; i < acct->max_workers; i++) {
+		ret = create_io_worker(wq, IO_WQ_ACCT_BOUND);
+		if (WARN_ON_ONCE(!ret))
+			break;
+	}
+
+	if (i != to_create) {
+		to_create -= i;
+		raw_spin_lock(&wq->lock);
+		acct->nr_workers -= to_create;
+		atomic_sub(to_create, &acct->nr_running);
+		atomic_sub(to_create, &wq->worker_refs);
+		raw_spin_unlock(&wq->lock);
+	}
+}
+
 struct io_wq *io_wq_create(unsigned bounded, struct io_wq_data *data)
 {
 	int ret, i;
@@ -1187,6 +1214,7 @@ struct io_wq *io_wq_create(unsigned bounded, struct io_wq_data *data)
 	if (ret)
 		goto err;
 
+	pre_create_workers(wq);
 	return wq;
 err:
 	io_wq_put_hash(data->hash);

-- 
Jens Axboe

