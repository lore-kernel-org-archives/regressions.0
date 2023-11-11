Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AB1C2A6
	for <regressions@lists.linux.dev>; Sat, 11 Nov 2023 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="LG2468T6"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C4A5A82852B9;
	Sat, 11 Nov 2023 13:15:30 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id X9wWay3ERPey; Sat, 11 Nov 2023 13:15:29 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 544CD82853FB;
	Sat, 11 Nov 2023 13:15:29 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 544CD82853FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699730129; bh=lrRjRfmuV/MQ7wrJiURIprKQTTHCvblfH3f7o9Vbv5c=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=LG2468T6N2Q9iSXKC0hc5B+tzcjH85YN7efMCYcEi+IriT4g5RdC6G5saLQZruNGW
	 qBLCPfCnJkCwKN/XN/BsPv7CjwBrZYz+95cx9QgNlfMxGoYlKiXyTwuI5qhfg9JuXC
	 RbbeExIs+s8LPsiKhCIRbcn/5iQGOMJx1K7y4xoU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ue_sJrcWoED9; Sat, 11 Nov 2023 13:15:29 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 27B0D82852B9;
	Sat, 11 Nov 2023 13:15:29 -0600 (CST)
Date: Sat, 11 Nov 2023 13:15:29 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1342639774.46565254.1699730129026.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1626632f-b190-48e4-b04d-a2d5a3d2083b@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com> <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com> <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk> <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com> <cb7b2bc1-3cf0-43b4-ad66-c35f9c59cbb9@kernel.dk> <1962251239.46563579.1699729495314.JavaMail.zimbra@raptorengineeringinc.com> <1626632f-b190-48e4-b04d-a2d5a3d2083b@kernel.dk>
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
Thread-Index: cXrJYbZAlOi1q3+juo80Bl7I7/UYxg==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Saturday, November 11, 2023 1:11:14 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/11/23 12:04 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Saturday, November 11, 2023 12:58:03 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/11/23 11:42 AM, Timothy Pearson wrote:
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>
>>>>> Sent: Friday, November 10, 2023 8:52:05 AM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>>> On 11/9/23 11:48 PM, Timothy Pearson wrote:
>>>>>>
>>>>>>
>>>>>> ----- Original Message -----
>>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>> <asml.silence@gmail.com>
>>>>>>> Sent: Thursday, November 9, 2023 10:35:08 PM
>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>>> ----- Original Message -----
>>>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>> <asml.silence@gmail.com>
>>>>>>>> Sent: Thursday, November 9, 2023 9:51:09 PM
>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>
>>>>>>>> Just to go back to basics, can you try this one? It'll do the exact same
>>>>>>>> retry that io-wq is doing, just from the same task itself. If this
>>>>>>>> fails, then something core is wrong. I don't think it will, or we'd see
>>>>>>>> this on other platforms too of course. If this works, then it validates
>>>>>>>> that it's some oddity on ppc with punting this operation to a thread off
>>>>>>>> this main task.
>>>>>>>>
>>>>>>>> diff --git a/io_uring/rw.c b/io_uring/rw.c
>>>>>>>> index 64390d4e20c1..1d760570df04 100644
>>>>>>>> --- a/io_uring/rw.c
>>>>>>>> +++ b/io_uring/rw.c
>>>>>>>> @@ -968,7 +968,7 @@ int io_read_mshot(struct io_kiocb *req, unsigned int
>>>>>>>> issue_flags)
>>>>>>>> 	return IOU_OK;
>>>>>>>> }
>>>>>>>>
>>>>>>>> -int io_write(struct io_kiocb *req, unsigned int issue_flags)
>>>>>>>> +static int __io_write(struct io_kiocb *req, unsigned int issue_flags)
>>>>>>>> {
>>>>>>>> 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
>>>>>>>> 	struct io_rw_state __s, *s = &__s;
>>>>>>>> @@ -1092,6 +1092,19 @@ int io_write(struct io_kiocb *req, unsigned int
>>>>>>>> issue_flags)
>>>>>>>> 	return ret;
>>>>>>>> }
>>>>>>>>
>>>>>>>> +int io_write(struct io_kiocb *req, unsigned int issue_flags)
>>>>>>>> +{
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	ret = __io_write(req, issue_flags);
>>>>>>>> +	if (ret != -EAGAIN)
>>>>>>>> +		return ret;
>>>>>>>> +
>>>>>>>> +	ret = __io_write(req, issue_flags & ~IO_URING_F_NONBLOCK);
>>>>>>>> +	WARN_ON_ONCE(ret == -EAGAIN);
>>>>>>>> +	return ret;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> void io_rw_fail(struct io_kiocb *req)
>>>>>>>> {
>>>>>>>> 	int res;
>>>>>>>>
>>>>>>>
>>>>>>> That does indeed "fix" the corruption issue.
>>>>>>>
>>>>>>> Where is the punting actually taking place?  I can see at least one location but
>>>>>>> if it's a general issue with the punting process I should probably apply any
>>>>>>> test mitigations to all locations, and I'm not familiar enough with the
>>>>>>> codebase to be sure I've got them all...
>>>>>>>
>>>>>>> Thanks!
>>>>>>
>>>>>> I've been exploring a bunch of other possibilities, and one that has
>>>>>> been slowly coalescing is whether we're triggering a bug somewhere
>>>>>> else in the kernel.  Now that I know the io_write call is somehow
>>>>>> related to this issue, I went back and went over some of the earlier
>>>>>> logs, and might have found something.
>>>>>>
>>>>>> When I enable KCSAN I sporadically see this type of race:
>>>>>>
>>>>>> [ 1549.152381]
>>>>>> ==================================================================
>>>>>> [ 1549.152515] BUG: KCSAN: data-race in dd_has_work / dd_insert_requests
>>>>>> [ 1549.152609]
>>>>>> [ 1549.152644] read (marked) to 0xc0000000080c2e98 of 8 bytes by task 3372 on
>>>>>> cpu 27:
>>>>>> [ 1549.153193]  dd_has_work+0x160/0x1b0
>>>>>> [ 1549.153259]  __blk_mq_sched_dispatch_requests+0x42c/0xdf0
>>>>>> [ 1549.153331]  blk_mq_sched_dispatch_requests+0xe4/0x120
>>>>>> [ 1549.153403]  blk_mq_run_hw_queue+0x358/0x390
>>>>>> [ 1549.153479]  blk_mq_flush_plug_list+0x8fc/0xea0
>>>>>> [ 1549.153556]  __blk_flush_plug+0x2bc/0x360
>>>>>> [ 1549.153622]  blk_finish_plug+0x60/0xa0
>>>>>> [ 1549.153689]  __iomap_dio_rw+0xd28/0x1140
>>>>>> [ 1549.153759]  iomap_dio_rw+0x80/0xf0
>>>>>> [ 1549.153825]  ext4_file_write_iter+0x9f8/0xff0 [ext4]
>>>>>> [ 1549.154249]  io_write+0x4bc/0x900
>>>>>> [ 1549.154309]  io_issue_sqe+0x12c/0x5f0
>>>>>> [ 1549.154370]  io_submit_sqes+0xdd4/0x1050
>>>>>> [ 1549.154429]  sys_io_uring_enter+0x344/0x15d0
>>>>>> [ 1549.154499]  system_call_exception+0x354/0x400
>>>>>> [ 1549.154569]  system_call_vectored_common+0x15c/0x2ec
>>>>>> [ 1549.154651]
>>>>>> [ 1549.154685] write to 0xc0000000080c2e98 of 8 bytes by task 3667 on cpu 32:
>>>>>> [ 1549.154757]  dd_insert_requests+0x81c/0xac0
>>>>>> [ 1549.154825]  blk_mq_flush_plug_list+0x8ec/0xea0
>>>>>> [ 1549.154902]  __blk_flush_plug+0x2bc/0x360
>>>>>> [ 1549.154968]  blk_finish_plug+0x60/0xa0
>>>>>> [ 1549.155034]  __iomap_dio_rw+0xd28/0x1140
>>>>>> [ 1549.155100]  iomap_dio_rw+0x80/0xf0
>>>>>> [ 1549.155166]  ext4_file_write_iter+0x9f8/0xff0 [ext4]
>>>>>> [ 1549.155563]  io_write+0x4bc/0x900
>>>>>> [ 1549.155606]  io_issue_sqe+0x12c/0x5f0
>>>>>> [ 1549.155648]  io_wq_submit_work+0x2e4/0x490
>>>>>> [ 1549.155692]  io_worker_handle_work+0xbac/0x1020
>>>>>> [ 1549.155745]  io_wq_worker+0x224/0x7b0
>>>>>> [ 1549.155792]  ret_from_kernel_user_thread+0x14/0x1c
>>>>>> [ 1549.155841]
>>>>>> [ 1549.155864] Reported by Kernel Concurrency Sanitizer on:
>>>>>> [ 1549.155904] CPU: 32 PID: 3667 Comm: iou-wrk-3372 Not tainted 6.6.0+ #10
>>>>>> [ 1549.155961] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw)
>>>>>> 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>>>>>> [ 1549.156032]
>>>>>> ==================================================================
>>>>>>
>>>>>> Notably, the io_write calls are in the chain, and there were exactly
>>>>>> two of these races and two test failures in the this test run.
>>>>>>
>>>>>> io_write+0x4bc seems to be WRITE_ONCE(list->first, last->next) in wq_list_cut.
>>>>>
>>>>> The above race is would just cause hung IO in the IO scheduler, it would
>>>>> not lead to corruption. The io_write() call would be call_write_iter(),
>>>>> not sure where you get the other one from?
>>>>>
>>>>> In any case, when I ran this test case last time, I just used /dev/shm/
>>>>> as the backing store and it still hit. Not io scheduler would be
>>>>> involved there.
>>>>
>>>> Fair enough.  Was grasping at straws a bit that night.
>>>>
>>>> Quick update on-list, it seems MariaDB uses io_uring for write then
>>>> tries to go back and do a standard synchronous read.  The data is
>>>> valid on-disk at some point after the read (i.e. after the process
>>>> exits, the data is confirmed valid on-disk), but the read itself
>>>> returns corrupt / stale / garbage data.  MariaDB is the only
>>>> application I've seen that tries to mix io_uring and standard I/O
>>>> operations on the same file, and this may be playing into the issues
>>>> observed.
>>>
>>> Nope, it's fine to mix and match. You obviously cannot issue a read
>>> (sync or otherwise) before the async write has completed and expect sane
>>> results, and I strongly suspect this is what is going on here...
>> 
>> Yep, agreed it's fine, just that most apps don't do that so we're in
>> potentially less-tested territory. :)
> 
> I don't think this is true. If you're doing buffered IO, your
> synchronization is the page cache. This is 100% true regardless of
> whether you use read/pread or io_uring to do the read, only difference
> is the delivery mechanism for the read. But if you do:
> 
> threadA				threadB
> start via write(2)
>				io_uring_enter()
>					submit_read()
> write(2) completes
> 
> or
> 
> io_uring_enter()
>	submit_write()
>				read(2)
>	write completes
> 
> then it's obviously broken.

Agreed.

> This has nothing to do with io_uring, which
> uses the page cache for IO just like any other buffered IO syscall that
> would do IO, sync or async.

Understood.  At this point I'm much more familiar with the io_uring write path, having been up and down it over the past few days, than the read path.

> If I were to guess, mariadb considers the write stable when it's been
> submitted. If the read, sync or async, is submitted right after that,
> then it would be completely valid to return stale data as the write
> isn't done yet. You're at the mercy of timing at that point, which may
> be why this shows up as a regression from 5.10.158 to 5.10.162, as
> timing likely changed with the switch from kthread to io-wq native
> workers.

That's something I need to figure out, and also why it only seems to hit ppc64 (though that could just be ppc64 being more likely to trigger the data race due to timing or similar than other arches are).  From what I can tell MariaDB does try to do an fsync() before read, but if I understand correctly that won't do much if the io_uring writes aren't actually completed first...
