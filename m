Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F68364BC
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="vsdHW5Cj"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E5E0F828553B;
	Wed, 15 Nov 2023 12:35:55 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id t22Xvz0gOde5; Wed, 15 Nov 2023 12:35:54 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3C24A8285977;
	Wed, 15 Nov 2023 12:35:54 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3C24A8285977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700073354; bh=3UMEptB8g9YXJoMD7BDU3sPXGtZRBNZ0a/NtaIogXtc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=vsdHW5CjMOCvA/0EKo00muA1D9/lTpdew03q/BiB7K0DVqC641WZJ2KgqxhyFt8JR
	 bEDMlaETZx+yCx8QggHMjtr+138NucVX85v2ILy81H0DfHtybhXLyhIwWfoTwgWQOt
	 zZdMlN/OKNvrnvc9mb/UwkwmmuRzDxhg1BFkG42o=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6AhcWvC2FxOw; Wed, 15 Nov 2023 12:35:54 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EBB72828553B;
	Wed, 15 Nov 2023 12:35:53 -0600 (CST)
Date: Wed, 15 Nov 2023 12:35:52 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <810551908.47566437.1700073352061.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk> <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com> <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk> <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com> <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk> <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com> <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
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
Thread-Index: HdxhOXROzIwGAKzLwoexU0wvDe/N6g==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
> Sent: Wednesday, November 15, 2023 12:30:15 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/15/23 10:03 AM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>, "Michael Ellerman"
>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>>> I haven't had much success in getting the IPI path to work properly,
>>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>>> least able to narrow down one of the areas that's going wrong.  Bear
>>>> in mind that as soon as I reenable IPI the corruption returns with a
>>>> vengeance, so this is not the correct fix yet by any means -- I am
>>>> currently soliciting feedback on what else might be going wrong at
>>>> this point since I've already spent a couple of weeks on this and am
>>>> not sure how much more time I can spend before we just have to shut
>>>> io_uring down on ppc64 for the forseeable future.
>>>>
>>>> Whatever the root cause actually is, something is *very* sensitive to
>>>> timing in both the worker thread creation path and the io_queue_sqe()
>>>> / io_queue_async() paths.  I can make the corruption disappear by
>>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>>> function, however no amount of memory barriers in the io_queue_async()
>>>> path (including in the kbuf recycling code) will fully resolve the
>>>> problem.
>>>>
>>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>>> amount of workers being created overall?  I know with some of the
>>>> other delay locations worker allocation was changing, from what I see
>>>> this one wouldn't seem to have much effect, but I'm still looking for
>>>> a sanity check.  If we're needing to wait for a millisecond for some
>>>> other thread to complete before moving on that might be valuable
>>>> information -- would also potentially tie in to the IPI path still
>>>> malfunctioning as the worker would immediately start executing.
>>>
>>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>>> delay before we either pass to an existing worker or create a new one.
>>>
>>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>>> list guaranteed, especially on weak memory model systems?  As I
>>>> understand it, different workers running on different cores could
>>>> potentially be interacting with the same kiocb request and the same
>>>> buffer list, and that does dovetail with the fact that punting to a
>>>> different I/O worker (usually on another core) seems to provoke the
>>>> problem.  I tried adding memory barriers to some of the basic recycle
>>>> functions without too much success -- it seemed to help somewhat, but
>>>> nowhere near complete resolution, and the buffers are used in a number
>>>> of other places I didn't even try to poke at.  I wanted to get some
>>>> feedback on this concept before going down yet another rabbit hole...
>>>
>>> This relies on the fact that we grab the wq lock before inserting this
>>> work, and the unlocking will be a barrier. It's important to note that
>>> this isn't any different than from before io-wq was using native
>>> workers, the only difference is that it used to be kthreads before, and
>>> now it's native threads to the application. The kthreads did a bunch of
>>> work to assume the necessary identity to do the read or write operation
>>> (which is ultimately why that approach went away, as it was just
>>> inherently unsafe), whereas the native threads do not as they already
>>> have what they need.
>>>
>>> I had a patch that just punted to a kthread and did the necessary
>>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>>> that point. Within the existing code...
>> 
>> Would you happen to have that patch still?  It would provide a
>> possible starting point for figuring out the exact difference.  If not
>> I guess I could hack something similar up.
> 
> Let me see if I can find it, and make sure it applies on the current
> tree. I'll send you one in a bit.

Much appreciated.

New question -- should a user of liburing be able to oops the kernel under any circumstances (userspace access / NULL pointer dereference)?  I've started putting together a torture test application and hit ... something ... almost right away .  If this isn't supposed to happen I'll send more details off-list for a double check.
