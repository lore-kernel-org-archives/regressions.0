Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834E663F
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Q/ITyOZH"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 96C84828558C;
	Tue,  7 Nov 2023 18:02:51 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UzHo7YO4ADzq; Tue,  7 Nov 2023 18:02:50 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A0BF2828592D;
	Tue,  7 Nov 2023 18:02:50 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A0BF2828592D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699401770; bh=cbDF5TQ9mv6/1cdVWau9oQpJYUfCDFWqnIE6h8+zA0M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Q/ITyOZHgRuWTv9aoFXKeqBDf5JKhke7/5iF31MwVOev0sgkA1A39BLZs4TrdGP/7
	 bVBhxWcg9omqoFYxjXWlAIUBu9gOL1v+arpY7s3vqIXV5V+Py+7xhT+eVDIEOGr1V9
	 DIullApzdPHWWtxyEKzeCNnYoZ9tXjaB7O13AhoM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OV8KzHo4komr; Tue,  7 Nov 2023 18:02:50 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 46D4A828558C;
	Tue,  7 Nov 2023 18:02:50 -0600 (CST)
Date: Tue, 7 Nov 2023 18:02:48 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk> <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com> <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk> <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com> <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk> <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com> <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
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
Thread-Index: GP3ofYFQbjtv+RQpyuFgpqTy1Hb9Yw==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 5:52:54 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 4:34 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 7, 2023 5:16:24 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>> But since you said you're seeing exits on signal 9, that would seem to
>>> indicate that someone ran SIGKILL with potentially pending IO.
>> 
>> Just to make sure we're talking about the same thing, when I refer to
>> signal 9 I am referring to instrumentation I added to the
>> get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I
>> assume the SIGKILL is not expected, i.e. not coming from another
>> location in the io_uring kernel code?
> 
> ksig.sig is set to signr, which is the number of the signal. So that
> would seem to indicate that _someone_ is sending SIGKILL. But at the
> same time, you don't see any of the cancel-on-exit triggering. Puzzling!
> io_uring or io-wq doesn't send any signals.
> 
> In your instrumentation, are you checking where the signal is coming
> from?Is it being dequeued as an actual signal, or is it some other
> condition in get_signal() that ends up setting it to SIGKILL?

I still need to check this in more detail.  What I do know at the moment is that the kill seems to be related to the entire workqueue going down, i.e. it is sent to the workers of a given workqueue after io_wq_put_and_exit() and io_wq_exit_workers() are called for that workqueue.  Not sure if that helps any, will keep digging...

> I don't expect the below to do anything as it _seems_ it's correct
> as-is, but...

<snip>

No change.  As you said, it's correct as-is. :)
