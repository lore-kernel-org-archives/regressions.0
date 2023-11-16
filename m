Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9049476
	for <regressions@lists.linux.dev>; Thu, 16 Nov 2023 03:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="XuXgHZhp"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B28B58285690;
	Wed, 15 Nov 2023 21:54:54 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9jgLeJDrKaZP; Wed, 15 Nov 2023 21:54:53 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0EEF382856AF;
	Wed, 15 Nov 2023 21:54:53 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0EEF382856AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700106893; bh=F+lIZwp9pqwMKbMLYVB4lZ6pjj98QBqSZZh1OE7Doa0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=XuXgHZhpzvEdTB7Rh11cVtGK8jXrCgvs1exV2V8XOK5XCvAVNQGkcxFwmsaVIVWS6
	 OZFVNfyf04haWGNdpx2B9lOWYA53WZqbPNZjhs8swNdjE2V/A9pARbTfBes1F5eNun
	 ITv9RswF2LVtAtAm1efuZX6ntIFB/6Riw79k7/xI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aAxL2UKbKypT; Wed, 15 Nov 2023 21:54:52 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B99638285690;
	Wed, 15 Nov 2023 21:54:52 -0600 (CST)
Date: Wed, 15 Nov 2023 21:54:50 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <368367067.47661779.1700106890793.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <5fb3fb19-cb9b-42d0-8949-7a9be8750682@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com> <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk> <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com> <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk> <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk> <230871836.47658490.1700105335407.JavaMail.zimbra@raptorengineeringinc.com> <5fb3fb19-cb9b-42d0-8949-7a9be8750682@kernel.dk>
Subject: Re: Regression in io_uring, leading to data corruption
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: Regression in io_uring, leading to data corruption
Thread-Index: pKBzWVMxEqmEf7vHVrMn/xZC3Gep1A==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
> Sent: Wednesday, November 15, 2023 9:46:01 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/15/23 8:28 PM, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>, "Michael Ellerman"
>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>> Sent: Wednesday, November 15, 2023 1:00:53 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/15/23 11:30 AM, Jens Axboe wrote:
>>>> On 11/15/23 10:03 AM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>, "Michael Ellerman"
>>>>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>>>>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>>>>>> I haven't had much success in getting the IPI path to work properly,
>>>>>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>>>>>> least able to narrow down one of the areas that's going wrong.  Bear
>>>>>>> in mind that as soon as I reenable IPI the corruption returns with a
>>>>>>> vengeance, so this is not the correct fix yet by any means -- I am
>>>>>>> currently soliciting feedback on what else might be going wrong at
>>>>>>> this point since I've already spent a couple of weeks on this and am
>>>>>>> not sure how much more time I can spend before we just have to shut
>>>>>>> io_uring down on ppc64 for the forseeable future.
>>>>>>>
>>>>>>> Whatever the root cause actually is, something is *very* sensitive to
>>>>>>> timing in both the worker thread creation path and the io_queue_sqe()
>>>>>>> / io_queue_async() paths.  I can make the corruption disappear by
>>>>>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>>>>>> function, however no amount of memory barriers in the io_queue_async()
>>>>>>> path (including in the kbuf recycling code) will fully resolve the
>>>>>>> problem.
>>>>>>>
>>>>>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>>>>>> amount of workers being created overall?  I know with some of the
>>>>>>> other delay locations worker allocation was changing, from what I see
>>>>>>> this one wouldn't seem to have much effect, but I'm still looking for
>>>>>>> a sanity check.  If we're needing to wait for a millisecond for some
>>>>>>> other thread to complete before moving on that might be valuable
>>>>>>> information -- would also potentially tie in to the IPI path still
>>>>>>> malfunctioning as the worker would immediately start executing.
>>>>>>
>>>>>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>>>>>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>>>>>> delay before we either pass to an existing worker or create a new one.
>>>>>>
>>>>>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>>>>>> list guaranteed, especially on weak memory model systems?  As I
>>>>>>> understand it, different workers running on different cores could
>>>>>>> potentially be interacting with the same kiocb request and the same
>>>>>>> buffer list, and that does dovetail with the fact that punting to a
>>>>>>> different I/O worker (usually on another core) seems to provoke the
>>>>>>> problem.  I tried adding memory barriers to some of the basic recycle
>>>>>>> functions without too much success -- it seemed to help somewhat, but
>>>>>>> nowhere near complete resolution, and the buffers are used in a number
>>>>>>> of other places I didn't even try to poke at.  I wanted to get some
>>>>>>> feedback on this concept before going down yet another rabbit hole...
>>>>>>
>>>>>> This relies on the fact that we grab the wq lock before inserting this
>>>>>> work, and the unlocking will be a barrier. It's important to note that
>>>>>> this isn't any different than from before io-wq was using native
>>>>>> workers, the only difference is that it used to be kthreads before, and
>>>>>> now it's native threads to the application. The kthreads did a bunch of
>>>>>> work to assume the necessary identity to do the read or write operation
>>>>>> (which is ultimately why that approach went away, as it was just
>>>>>> inherently unsafe), whereas the native threads do not as they already
>>>>>> have what they need.
>>>>>>
>>>>>> I had a patch that just punted to a kthread and did the necessary
>>>>>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>>>>>> that point. Within the existing code...
>>>>>
>>>>> Would you happen to have that patch still?  It would provide a
>>>>> possible starting point for figuring out the exact difference.  If not
>>>>> I guess I could hack something similar up.
>>>>
>>>> Let me see if I can find it, and make sure it applies on the current
>>>> tree. I'll send you one in a bit.
>>>
>>> Wrote a new one. This one has two different ways it can work:
>>>
>>> 1) By default, it uses the native io workers still, but rather than add
>>> it to a list of pending items, it creates a new worker for each work
>>> item. This means all writes that would've gone to io-wq will now just
>>> fork a native worker and perform the write in a blocking fashion.
>>>
>>> 2) The fallback path for the above is that we punt it to a kthread,
>>> which does the mm dance. This is similar to what we did before the
>>> native workers. The fallback path is only hit if the worker creation
>>> fails, but you can make it happen every time by just uncommenting that
>>> return 1 in io_rewrite_io_thread().
>>>
>>> The interesting thing about approach 1 is that while it still uses the
>>> native workers, it will not need to be processing task_work and hence
>>> signaling with TWA_SIGNAL or TWA_SIGNAL_NO_IPI to get it done. It simply
>>> forks off a new worker every time, which does the work, then exits.
>>>
>>> First try it as-is and see if that reproduces the issue. If it does,
>>> then try uncommenting that return 1 mentioned in #2 above.
>> 
>> OK, so those two test cases worked, *but* I would have expected that,
>> since when we go through the system workqueue (with its associated
>> delays) it is functionally the same as inserting the udelay(1000) at
> 
> No we don't! For case 1, we use the exact same mechanism as the stock
> kernel, the only difference is that we'll always hand it to a new
> worker. Will that slow down some writes, certainly. Because before that
> patch we'd potentially hand it over to an existing worker immediately.
> Eg as soon as we did the spin_unlock() in io_wq_enqueue(), a new worker
> could grab that same lock and start processing the work. We're not
> talking a 1ms delay here, it's way shorter than that. This again to me
> tells me it might be an ordering or barrier issue, but at the same time,
> I've run with smp_mb() before and after insertion AND on retrieval of
> the work item on the other side, and it triggers the issue even even.
> 
> On top of that, if we pre-create the workers, then we've already
> established that the issue does not occur. With pre-created workers,
> there's no extra delay between handing off the write and issuing it,
> like we have with the test patch. In fact, it works the _exact_ same way
> that the stock kernel does, except you don't have workers exiting or
> being created. To me, this tells me that it cannot be a memory ordering
> issue. If it was, we'd 100% see it for that case too, as we have all the
> same handoff and execution as we did before. The only difference is that
> we don't have an IPI for worker creation, and we don't have workers
> exiting when they time out.
<snip>

OK, fair enough, I've been at this long enough I forgot about the precreated workers "fixing" things.  Let me step back a bit and meta-analyze all of what we've learned, even though a lot of it doesn't make any sense maybe there's a pattern somewhere in all the noise.
