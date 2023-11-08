Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2C1C02
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Zw437i0V"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 43D638285512;
	Tue,  7 Nov 2023 21:30:37 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xGlC-ftB-sMg; Tue,  7 Nov 2023 21:30:36 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4F6F282857FA;
	Tue,  7 Nov 2023 21:30:36 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4F6F282857FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699414236; bh=2vjAp663O21/rgSqTxcbYVVytv9lSpKgK8Dh1p73kP0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Zw437i0ViLkKtIlZDdHAWsbjaFYEd4o37ND57bRjJGfX3WU//k15BTMw+VOgW6omd
	 jWBAzvabdeB6Yeog5FwHihIwXDHMdLWyV9HDhBmiN1VoST+TZh2xzB95wzd2UVrqLk
	 PgSEArrh3gb1Rik/vArIf/nmwMiLlHLVotoPBITU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id O-vS2jquGgyn; Tue,  7 Nov 2023 21:30:36 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1BFD78285512;
	Tue,  7 Nov 2023 21:30:36 -0600 (CST)
Date: Tue, 7 Nov 2023 21:30:35 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1561246958.45682580.1699414235813.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1182536385.45681866.1699414033205.JavaMail.zimbra@raptorengineeringinc.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com> <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk> <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com> <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk> <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com> <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk> <1182536385.45681866.1699414033205.JavaMail.zimbra@raptorengineeringinc.com>
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
Thread-Index: dIJT5hYx4l7x5oIjnKx5PRjV86G9y18dGr2b



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
> To: "Jens Axboe" <axboe@kernel.dk>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 9:27:13 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>> <asml.silence@gmail.com>
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
> So I ran it a few more times and we do actually hit the WARN_ON_ONCE(do_kill) in
> io_worker_handle_work().  It's possible we hit it much earlier in the boot
> process before and I simply missed it, since it's only printed once per boot.
> If you have a potential patch or avenue of testing based on that information
> I'm happy to try it.

Actually, I take that back.  I had other debugging in place that tripped that condition.  Investigation continues...
