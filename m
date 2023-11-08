Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD57328D2
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="RF4rZQ9U"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 54879828465E;
	Wed,  8 Nov 2023 11:40:19 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NSTVSrlkPvk0; Wed,  8 Nov 2023 11:40:18 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 657F8828545C;
	Wed,  8 Nov 2023 11:40:18 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 657F8828545C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699465218; bh=JHoA7BfXT8evURSDnJlCn0Tbpq2U8z7LPokHh8CJp3k=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=RF4rZQ9UThGhMacYHmyquqqVGhA8nNgcZ7pGiAH/bJxxVcUQli5H11wnfWJrA11g/
	 jQDgXU3JAwHTHwqXFTa4LiZTJ7EoLTBmwoUfer5GfepWrakTNtPAt+jTYAy7pJvgkW
	 AJbyV/OPyWsJwOL83Hfnt1+8HgOK+iNdde73ctus=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qCp2LAV9aUi8; Wed,  8 Nov 2023 11:40:18 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 21993828465E;
	Wed,  8 Nov 2023 11:40:18 -0600 (CST)
Date: Wed, 8 Nov 2023 11:40:15 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com> <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk> <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com> <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk> <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk> <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com> <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
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
Thread-Index: WHQDargDkurugIdDHvS1tmp/EgRzoQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Wednesday, November 8, 2023 11:26:53 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/8/23 10:10 AM, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Wednesday, November 8, 2023 9:14:55 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/8/23 8:10 AM, Jens Axboe wrote:
>>>> It could also be a task that has pending IO and is doing exec() (and
>>>> friends), this would also cancel inflight IO.
>>>
>>> If this is the case, then you could try with this one to just disable
>>> that and see if the corruption goes away:
>> 
>> Unfortunately that had no effect on the corruption.  I've also traced
>> the signal generation into the get_signal() call, which is apparently
>> sending SIGKILL when the thread group is marked for termination --
>> this is in turn why the PID fields etc. are all zero.
> 
> That's good news though, because I'm continually pondering why powerpc
> is different here.
> 
>> Investigation continues.
> 
> If it's not exec, then it has to be a signal. I'm assuming you're
> hitting this in get_signal():
> 
>		/* Has this task already been marked for death? */
>		if ((signal->flags & SIGNAL_GROUP_EXIT) ||
>		     signal->group_exec_task) {
>			clear_siginfo(&ksig->info);
>			ksig->info.si_signo = signr = SIGKILL;
>			sigdelset(&current->pending.signal, SIGKILL);
>			trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
>				&sighand->action[SIGKILL - 1]);
>			recalc_sigpending();
>			goto fatal;
>		}
> 
> which is either exec (which we verified it is not), so I don't see
> anything other than this being a signal sent to mtr/mariadb for exit.
> 
> Does this trigger? Doesn't necessarily indicate a bug as it would be
> valid, but if it does trigger, perhaps io-wq has unstarted requests at
> this point and they get canceled and hence never written. If this does
> trigger, maybe try and do your sleep trick there too and see if that
> gets rid of it.

Yes, it does indeed trigger.  Is there a way to directly check for the unstarted requests?
