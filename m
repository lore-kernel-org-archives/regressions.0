Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20701C36
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="s/iQgUTQ"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 970338285800;
	Wed,  8 Nov 2023 12:36:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zf9Ky5U7xTlH; Wed,  8 Nov 2023 12:36:04 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1FDDB8285873;
	Wed,  8 Nov 2023 12:36:04 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1FDDB8285873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699468564; bh=Xn93Xq3ZFYdpw3pVeFxV9l4yt2zf7nAMD6nfH5g0dT8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=s/iQgUTQ3Fp1BBDHsGIjebNoECoMC/AsDXUbwpBeHehkguO2PhEaCWlcgIKa5hgTp
	 LkZ43MpsVfqNJC5rcCYunnk0p4dUwlcQNnUcddy8kPmgq1/Q/YxrcwHOEzI3yzwWYd
	 7LNykLj+sXrBvHN7Fr3N6tBEJyu7CjShPnPRpypA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jsHB1Z3HNmOx; Wed,  8 Nov 2023 12:36:03 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E4E458285800;
	Wed,  8 Nov 2023 12:36:03 -0600 (CST)
Date: Wed, 8 Nov 2023 12:36:01 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk> <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk> <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com> <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk> <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com> <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk> <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
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
Thread-Index: e1ZefXj+G0YAJWziTARIcKWa01rH1A==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Wednesday, November 8, 2023 11:57:59 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/8/23 10:49 AM, Jens Axboe wrote:
>> On 11/8/23 10:40 AM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Wednesday, November 8, 2023 11:26:53 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/8/23 10:10 AM, Timothy Pearson wrote:
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Wednesday, November 8, 2023 9:14:55 AM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>>> On 11/8/23 8:10 AM, Jens Axboe wrote:
>>>>>>> It could also be a task that has pending IO and is doing exec() (and
>>>>>>> friends), this would also cancel inflight IO.
>>>>>>
>>>>>> If this is the case, then you could try with this one to just disable
>>>>>> that and see if the corruption goes away:
>>>>>
>>>>> Unfortunately that had no effect on the corruption.  I've also traced
>>>>> the signal generation into the get_signal() call, which is apparently
>>>>> sending SIGKILL when the thread group is marked for termination --
>>>>> this is in turn why the PID fields etc. are all zero.
>>>>
>>>> That's good news though, because I'm continually pondering why powerpc
>>>> is different here.
>>>>
>>>>> Investigation continues.
>>>>
>>>> If it's not exec, then it has to be a signal. I'm assuming you're
>>>> hitting this in get_signal():
>>>>
>>>> 		/* Has this task already been marked for death? */
>>>> 		if ((signal->flags & SIGNAL_GROUP_EXIT) ||
>>>> 		     signal->group_exec_task) {
>>>> 			clear_siginfo(&ksig->info);
>>>> 			ksig->info.si_signo = signr = SIGKILL;
>>>> 			sigdelset(&current->pending.signal, SIGKILL);
>>>> 			trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
>>>> 				&sighand->action[SIGKILL - 1]);
>>>> 			recalc_sigpending();
>>>> 			goto fatal;
>>>> 		}
>>>>
>>>> which is either exec (which we verified it is not), so I don't see
>>>> anything other than this being a signal sent to mtr/mariadb for exit.
>>>>
>>>> Does this trigger? Doesn't necessarily indicate a bug as it would be
>>>> valid, but if it does trigger, perhaps io-wq has unstarted requests at
>>>> this point and they get canceled and hence never written. If this does
>>>> trigger, maybe try and do your sleep trick there too and see if that
>>>> gets rid of it.
>>>
>>> Yes, it does indeed trigger.  Is there a way to directly check for the
>>> unstarted requests?
>> 
>> Let me hack up a debug patch for this, give me a minute.
> 
> This should do it - whenever this condition hits, you should see
> something ala:
> 
> [   97.960877] io_wq_dump: work_items=0, cur=0, next=0
> 
> in dmesg. work_items is the number of work items we found that haven't
> been scheduled yet. cur is what a worker is currently processing, and
> next is basically a way for cancel to find a work item before it gets
> assigned. work_items and next may get canceled, work_items should always
> finish for storage IO, since signals don't interrupt them.
> 
> 
> diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
> index 522196dfb0ff..643b8e9de518 100644
> --- a/io_uring/io-wq.c
> +++ b/io_uring/io-wq.c
> @@ -553,6 +553,8 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
> 	struct io_wq *wq = worker->wq;
> 	bool do_kill = test_bit(IO_WQ_BIT_EXIT, &wq->state);
> 
> +	WARN_ON_ONCE(do_kill);
> +
> 	do {
> 		struct io_wq_work *work;
> 
> @@ -889,6 +891,7 @@ static bool io_wq_worker_wake(struct io_worker *worker, void
> *data)
> static void io_run_cancel(struct io_wq_work *work, struct io_wq *wq)
> {
> 	do {
> +		WARN_ON_ONCE(1);
> 		work->flags |= IO_WQ_WORK_CANCEL;
> 		wq->do_work(work);
> 		work = wq->free_work(work);
> @@ -934,6 +937,7 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work
> *work)
> 	 */
> 	if (test_bit(IO_WQ_BIT_EXIT, &wq->state) ||
> 	    (work->flags & IO_WQ_WORK_CANCEL)) {
> +		WARN_ON_ONCE(1);
> 		io_run_cancel(work, wq);
> 		return;
> 	}
> @@ -1369,6 +1373,54 @@ int io_wq_max_workers(struct io_wq *wq, int *new_count)
> 	return 0;
> }
> 
> +struct worker_lookup {
> +	int cur_work;
> +	int next_work;
> +};
> +
> +static bool io_wq_worker_lookup(struct io_worker *worker, void *data)
> +{
> +	struct worker_lookup *l = data;
> +
> +	raw_spin_lock(&worker->lock);
> +	if (worker->cur_work)
> +		l->cur_work++;
> +	if (worker->next_work)
> +		l->next_work++;
> +	raw_spin_unlock(&worker->lock);
> +	return false;
> +}
> +
> +void io_wq_dump(struct io_uring_task *tctx)
> +{
> +	struct io_wq_work_node *node, *prev;
> +	struct io_wq *wq = tctx->io_wq;
> +	struct worker_lookup l = { };
> +	int i, work_items;
> +
> +	if (!wq) {
> +		printk("%s: no wq\n", __FUNCTION__);
> +		return;
> +	}
> +
> +	work_items = 0;
> +	for (i = 0; i < IO_WQ_ACCT_NR; i++) {
> +		struct io_wq_acct *acct = io_get_acct(wq, i == 0);
> +
> +		raw_spin_lock(&acct->lock);
> +		wq_list_for_each(node, prev, &acct->work_list)
> +			work_items++;
> +		raw_spin_unlock(&acct->lock);
> +	}
> +
> +	rcu_read_lock();
> +	io_wq_for_each_worker(wq, io_wq_worker_lookup, &l);
> +	rcu_read_unlock();
> +
> +	printk("%s: work_items=%d, cur=%d, next=%d\n", __FUNCTION__, work_items,
> +							l.cur_work, l.next_work);
> +}
> +
> static __init int io_wq_init(void)
> {
> 	int ret;
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index ed254076c723..c0bd35e5429a 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -1943,7 +1943,9 @@ void io_wq_submit_work(struct io_wq_work *work)
> 
> 	/* either cancelled or io-wq is dying, so don't touch tctx->iowq */
> 	if (work->flags & IO_WQ_WORK_CANCEL) {
> +		WARN_ON_ONCE(1);
> fail:
> +		WARN_ON_ONCE(1);
> 		io_req_task_queue_fail(req, err);
> 		return;
> 	}
> diff --git a/kernel/exit.c b/kernel/exit.c
> index ee9f43bed49a..250ae820340c 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -988,6 +988,8 @@ SYSCALL_DEFINE1(exit, int, error_code)
> 	do_exit((error_code&0xff)<<8);
> }
> 
> +void io_wq_dump(struct io_uring_task *);
> +
> /*
>  * Take down every thread in the group.  This is called by fatal signals
>  * as well as by sys_exit_group (below).
> @@ -1011,6 +1013,9 @@ do_group_exit(int exit_code)
> 		else if (sig->group_exec_task)
> 			exit_code = 0;
> 		else {
> +			if (!strncmp(current->comm, "mariadbd", 8) &&
> +			    current->io_uring)
> +				io_wq_dump(current->io_uring);
> 			sig->group_exit_code = exit_code;
> 			sig->flags = SIGNAL_GROUP_EXIT;
> 			zap_other_threads(current);

Unfortunately it's only returning work_items=0, cur=0, next=0, so that was a bit of a red herring.

I have been giving some thought to the CPU pinning of the workers, and one thing that may have been overlooked is that this could potentially force-serialize worker operations.  Did you just have to pin the io workers or did the workqueue also need to be pinned for the corruption to disappear?
