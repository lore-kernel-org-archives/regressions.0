Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465671C36
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 04:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="uD1wn4Vf"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4F6E08285745;
	Tue,  7 Nov 2023 22:00:48 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1SQ6zSrF5CdV; Tue,  7 Nov 2023 22:00:46 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A3F7982856EE;
	Tue,  7 Nov 2023 22:00:46 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A3F7982856EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699416046; bh=b/TPDzLLS8IiaJGu63CY35vrariPL++Xjvo/jUhX2Ec=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=uD1wn4VfwAfr3gss0+MYTYYo+CF8OqCP2D6zu5yAj64EcTyxqkoG3BFu/lC6V9k9V
	 5zo2296LxRXm7fak9LE7702OBlPuuaUzbpHFM7c2eA/uxcclrCzO3R4R/u0x/wAevH
	 LAFQH73CFkcm78EZb4A8vmomrFlleVG/hKGDlMEE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uho3GE0OUHF6; Tue,  7 Nov 2023 22:00:46 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 811A48284E9F;
	Tue,  7 Nov 2023 22:00:46 -0600 (CST)
Date: Tue, 7 Nov 2023 22:00:44 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
	regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk> <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com> <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk> <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com> <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk> <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com> <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
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
Thread-Index: S/0/XUhulcFqwZ6Ag874G0P359UiJg==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 6:09:39 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 5:02 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 7, 2023 5:52:54 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/7/23 4:34 PM, Timothy Pearson wrote:
>>>>
>>>>
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>
>>>>> Sent: Tuesday, November 7, 2023 5:16:24 PM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>> But since you said you're seeing exits on signal 9, that would seem to
>>>>> indicate that someone ran SIGKILL with potentially pending IO.
>>>>
>>>> Just to make sure we're talking about the same thing, when I refer to
>>>> signal 9 I am referring to instrumentation I added to the
>>>> get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I
>>>> assume the SIGKILL is not expected, i.e. not coming from another
>>>> location in the io_uring kernel code?
>>>
>>> ksig.sig is set to signr, which is the number of the signal. So that
>>> would seem to indicate that _someone_ is sending SIGKILL. But at the
>>> same time, you don't see any of the cancel-on-exit triggering. Puzzling!
>>> io_uring or io-wq doesn't send any signals.
>>>
>>> In your instrumentation, are you checking where the signal is coming
>>> from?Is it being dequeued as an actual signal, or is it some other
>>> condition in get_signal() that ends up setting it to SIGKILL?
>> 
>> I still need to check this in more detail.  What I do know at the
>> moment is that the kill seems to be related to the entire workqueue
>> going down, i.e. it is sent to the workers of a given workqueue after
>> io_wq_put_and_exit() and io_wq_exit_workers() are called for that
>> workqueue.  Not sure if that helps any, will keep digging...
> 
> Another option is that it's doing exec() with pending IO, which will
> cancel it. But I'm also assuming that mtr/friends will check result
> values of writes and would've caught that there.

Here's something potentially more useful, the stack trace of what's calling the workqueue exit function:

[   35.074923] Call Trace:
[   35.074939] [c000000007183890] [c0000000005c0804] io_wq_exit_workers+0x48/0x214 (unreliable)
[   35.074994] [c000000007183920] [c0000000005c0410] io_wq_put+0xa0/0x27c
[   35.075034] [c0000000071839f0] [c0000000005a92a8] io_uring_clean_tctx+0x98/0xe0
[   35.075082] [c000000007183a30] [c0000000005bdc78] __io_uring_files_cancel+0x4f8/0x580
[   35.075129] [c000000007183b20] [c000000000153fc8] do_exit+0x1c8/0xce0
[   35.075169] [c000000007183bf0] [c000000000154c58] do_group_exit+0x108/0x110
[   35.075209] [c000000007183c30] [c00000000016ac6c] get_signal+0xbfc/0xce0
[   35.075251] [c000000007183d10] [c00000000001ed50] do_notify_resume+0xd0/0x420
[   35.075298] [c000000007183dc0] [c00000000002dbbc] syscall_exit_prepare+0x15c/0x360
[   35.075348] [c000000007183e10] [c00000000000cf74] system_call_vectored_common+0xf4/0x260

This call is associated with the mariadb userspace PID:

[   35.074242] CPU: 12 PID: 1260 Comm: mariadbd

To me, it almost looks like the mariadb I/O worker thread is getting terminated via signal and that this termination is taking out the write before it can complete.  Is that even possible?
