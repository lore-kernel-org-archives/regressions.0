Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAB2F870
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="jFH2sZZ5"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 04600828550B;
	Tue,  7 Nov 2023 16:07:48 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wa_vovUcffNj; Tue,  7 Nov 2023 16:07:47 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0383B828586A;
	Tue,  7 Nov 2023 16:07:47 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0383B828586A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699394867; bh=SmwGxXzbwfMqKfBpVlqYFOJkELa0/kaWa8Gua8ZIwy8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jFH2sZZ5Gnq3jYocNljpRGlau/JiNwoPJLcvyQg518aon9qGkMPcpqntRJQq0f1gJ
	 RejEi+Q6s8PP+PpBa9rYh/L5nKZ6j0X37tGCd4opuOXMdTv4dfP8C2OHSwUG7r8WV0
	 oplBWgbtK/Y2p3WvZ6J6gO1MuUIr0pbExbts6t7U=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bsWp_Q2UyQan; Tue,  7 Nov 2023 16:07:46 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D57A2828550B;
	Tue,  7 Nov 2023 16:07:46 -0600 (CST)
Date: Tue, 7 Nov 2023 16:07:44 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk> <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com> <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
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
Thread-Index: gD1FlFl7RPgcmIZVuSTHRXwCZ7y28g==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 3:46:40 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 2:39 PM, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions"
>>> <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 7, 2023 3:22:16 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>>>> I can make the corruption disappear by adding a 1ms busy wait delay
>>>> into io_wqe_dec_running().  This appears to alter the timing of
>>>> something in the io_uring system just enough to make the (presumed)
>>>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>>>> the lock debugger, yet a corruption problem that disappears with a
>>>> delay is indicative of a race somewhere.  The delay primary impacts
>>>> how long the IRQ lock is held, if the delay is moved outside of the
>>>> IRQ locked section the corruption returns.
>>>
>>> This is interesting... This forces the current task to schedule out
>>> first, rather than potentially create a new worker.
>> 
>> That makes sense -- when debugging, everything seems to center around
>> worker creation and the exact timing / context of that operation.
>> 
>>> If you put that 1 ms sleep at the top of io_wq_worker(), before the
>>> loop, does it fix it as well? With the previous one removed, of course.
>> 
>> No, it does not.
> 
> OK, so it's not related to delaying work handling for a new worker. What
> if you add a 1ms sleep before calling wq->do_work() in
> io_worker_handle_work()? For both this and your previous test, might be
> worth shrinking this 1ms to something way smaller, as it's hard to know
> if it's the fact that we're scheduling first that's important, or if
> it's just a timing delay and hence now it's much harder to hit this
> race.

Nope, no joy.  I had already tried shrinking the delay and the issues came back.  Ditto for switching to usleep; allowing the process to leave the core (or something else to schedule on the core) seems to bring the corruption back despite the time delay remaining in place.

>>> Does it do anything if you just put isync() in there instead of the
>>> sleep in io_wqe_dec_running()?
>> 
>> Unfortunately no, that doesn't fix things either.
>> 
>> My gut says it's something racing with either the I/O worker creation
>> or wake (trying to schedule work onto a half-created or still sleeping
>> worker?) but so far I haven't been able to isolate the root cause.
> 
> One of my initial suspicions was improper handling of signals, since
> creating a new worker will happen via task_work_add(..., TWA_SIGNAL).
> But I'm not sure how likely that is, as that could/would happen normally
> too if signals are being used, and would trigger on more than just
> powerpc obviously.

Interestingly enough that's where my current investigation is leading as well.  After instrumenting and re-instrumenting the codebase far more times than I'd like to admit, I've noticed that the workers don't time out on kernel builds that show the corruption, they are directly terminated via signal (SIGKILL).  On kernel builds with the delay, the workers time out and self-terminate.  I'm still trying to parse out what the exact difference between these two mechanisms would be and how it plays into the corruption, but at least it's a start...
