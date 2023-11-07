Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351F34546
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="hwbgD8JK"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A435A828586A;
	Tue,  7 Nov 2023 17:34:04 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yuoZtkLTcy-Z; Tue,  7 Nov 2023 17:34:03 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 683368286991;
	Tue,  7 Nov 2023 17:34:03 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 683368286991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699400043; bh=O7hPvbstOb2P4dAjZ+au0i4ZEdEV79Jxh72DdrP3An0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=hwbgD8JK++NoMxh2eEeCkHw7CJWiPMy7l2Ylh00ZCi1UH2VZcPYonDhjnpR04MlcZ
	 VRAqoD3/I2HkuQtT/v780yZuc98wH6bgTrQfL+p06/Ar2YYXxAD9JBcPdTzK3cWkMC
	 I/YrDZD1dP3l/1ob+GacKIIFFR4kBWd3Xdx1Fv2A=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ORqBVaPAxYh0; Tue,  7 Nov 2023 17:34:02 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 7550B828586A;
	Tue,  7 Nov 2023 17:34:02 -0600 (CST)
Date: Tue, 7 Nov 2023 17:34:00 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk> <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com> <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk> <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com> <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk> <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com> <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
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
Thread-Index: WjeKSvJSAKUyv//qxU2YSd6VclFlWg==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 5:16:24 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 4:12 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 7, 2023 4:44:56 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/7/23 3:29 PM, Timothy Pearson wrote:
>>>>
>>>>
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>
>>>>> Sent: Tuesday, November 7, 2023 4:16:51 PM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>>> On 11/7/23 3:07 PM, Timothy Pearson wrote:
>>>>>> Interestingly enough that's where my current investigation is leading
>>>>>> as well.  After instrumenting and re-instrumenting the codebase far
>>>>>> more times than I'd like to admit, I've noticed that the workers don't
>>>>>> time out on kernel builds that show the corruption, they are directly
>>>>>> terminated via signal (SIGKILL).  On kernel builds with the delay, the
>>>>>> workers time out and self-terminate.  I'm still trying to parse out
>>>>>> what the exact difference between these two mechanisms would be and
>>>>>> how it plays into the corruption, but at least it's a start...
>>>>>
>>>>> Maybe poke at how they are exiting - you say timeout, so they've been
>>>>> idle for a while and then go away? This would then cause worker creation
>>>>> again later on if, say, we have 1 worker left and it goes to sleep. So
>>>>> the timeout itself may not tell you much, outside of then causing that
>>>>> other condition to happen. You could even try and shrink the timeout to
>>>>> HZ / 10 or something like that to make it more likely to happen.
>>>>
>>>> Agreed.  As of right now I can confirm that with the delay in place
>>>> (no corruption) the workers are exiting on their own, no signals and
>>>> no IO_EXIT bit being set.  When I remove the delay (reintroducing the
>>>> corruption) I see signal 9 being sent to the workers, and a mix of
>>>> IO_EXIT being set and not being set.
>>>>
>>>> Ignoring the signal 9 does not fix the corruption, which makes me
>>>> wonder more about IO_EXIT and whether things are not fully committed /
>>>> properly torn down when the worker thread terminates.  This also
>>>> dovetails nicely with the fact that the observed write corruption
>>>> always seems to be in the latter portions of the page, never at the
>>>> beginning of the page, also indicating rapid / unclean termination of
>>>> the writer process.
>>>>
>>>> Will keep digging...
>>>
>>> This is useful. If the workers are exiting, they will try and process
>>> work that is still pending. And it obviously does, or the process would
>>> hang on exit or ring exit. But it'll also cancel said work, which
>>> obviously did not happen for the old kthread scheme, as there was no way
>>> to do that. So you'd just wait for it. Hence maybe what's happening here
>>> is that mtr/mysql/mariadb isn't properly waiting for pending writes to
>>> finish? It's just assuming that previously submitted writes will finish
>>> if the task is killed?
>> 
>> It's entirely possible.  What is the correct way to wait for pending
>> writes via the liburing API?  MariaDB uses liburing under the hood,
>> and if I know the call(s) to look for I can make sure it's properly
>> handling task exit.
> 
> I'd expect the task to wait and verify the results of pending requests
> before doing io_uring_queue_exit(). But I'm not familiar with the code
> base, maybe the task just exits? Closing the io_uring fd from an exiting
> task would do the same.
> 
> I tried the below patch when running mtr here, but don't see any of them
> trigger. You can try that, that'll tell you if we ever run cancelations
> on pending io-wq work. If that triggers, I can try and cook up something
> that would figure out where that is coming from.

Doesn't trigger on my end either.  At least we know that's not the problem now.

> But since you said you're seeing exits on signal 9, that would seem to
> indicate that someone ran SIGKILL with potentially pending IO.

Just to make sure we're talking about the same thing, when I refer to signal 9 I am referring to instrumentation I added to the get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I assume the SIGKILL is not expected, i.e. not coming from another location in the io_uring kernel code?
