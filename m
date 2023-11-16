Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339479C4
	for <regressions@lists.linux.dev>; Thu, 16 Nov 2023 03:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="XzEAkdD6"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9C33482857D2;
	Wed, 15 Nov 2023 21:28:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id l6s0v-4ZC4K0; Wed, 15 Nov 2023 21:28:58 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E6C198285802;
	Wed, 15 Nov 2023 21:28:57 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E6C198285802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700105337; bh=SO/nGK3S18rzhFflAsPc05SqT5jMj4HMikPbxK73oJo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=XzEAkdD6iqZ0C+IjMvqsxkWNvsIVzNoXeSHM2niqBi8rQCDJT0dsimKpV578F/MaB
	 5q8p385LZpRgUZqfrmGDBU7xizLk0Jq5HZGumD+NdKoTvSDaGhgR/Pj/Bn2DIsjuPP
	 758eD+M2JlhqXPcjlQmL2wA/PbvjeBm6zbyOyrL0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6yowg-EULQMq; Wed, 15 Nov 2023 21:28:57 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 90B5F82857D2;
	Wed, 15 Nov 2023 21:28:57 -0600 (CST)
Date: Wed, 15 Nov 2023 21:28:55 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <230871836.47658490.1700105335407.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com> <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk> <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com> <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk> <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com> <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk> <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk>
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
Thread-Index: umGIO0HOL4IR5YAuYfTBLT+xWDUsvA==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
> Sent: Wednesday, November 15, 2023 1:00:53 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/15/23 11:30 AM, Jens Axboe wrote:
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
> Wrote a new one. This one has two different ways it can work:
> 
> 1) By default, it uses the native io workers still, but rather than add
> it to a list of pending items, it creates a new worker for each work
> item. This means all writes that would've gone to io-wq will now just
> fork a native worker and perform the write in a blocking fashion.
> 
> 2) The fallback path for the above is that we punt it to a kthread,
> which does the mm dance. This is similar to what we did before the
> native workers. The fallback path is only hit if the worker creation
> fails, but you can make it happen every time by just uncommenting that
> return 1 in io_rewrite_io_thread().
> 
> The interesting thing about approach 1 is that while it still uses the
> native workers, it will not need to be processing task_work and hence
> signaling with TWA_SIGNAL or TWA_SIGNAL_NO_IPI to get it done. It simply
> forks off a new worker every time, which does the work, then exits.
> 
> First try it as-is and see if that reproduces the issue. If it does,
> then try uncommenting that return 1 mentioned in #2 above.

OK, so those two test cases worked, *but* I would have expected that, since when we go through the system workqueue (with its associated delays) it is functionally the same as inserting the udelay(1000) at the start of io_write().  I suspect the root issue predates the move to worker-managed I/O threads and that it was exposed simply by (inadvertently) shortening the delay between the initial io_write() call and the subsequent thread start.  Then, when the code started issuing IPIs to kick thread start even faster we ended up racing with this other mysterious process almost every time instead of somewhat rarely, basically compounding the problem and making analysis next to impossible until the IPI was skipped via the TWA_SIGNAL_NO_IPI flag.

I'm unsure if this is related to the oops I sent off-list, but I suspect it very well might be given a delay in the same location works around the corruption.
