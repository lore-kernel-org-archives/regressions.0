Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9B210B
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 23:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ujehNQJb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc2b8deb23so9038275ad.1
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 15:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699398986; x=1700003786; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pn2xbqpzR6FgYHmHcEXrzNp21T6qV/UPNfBvteYfbm4=;
        b=ujehNQJbh1VYfGqEgtUV09UrrWdR7fGa7miWF1630rLv97nOVpafOQLw2jYy/GGwDm
         9Dy8BXkzHCJVoPors4M7Eoy8QjcIZQCbfExyt5NIO9TIguXqGjYeM4DC9HVEdR8b1u5x
         26Im9um5a5u+nKsYnIl8pmAx1yZSfYFXn9rjvUnG7uJ+ChNZRlxU5sHq4nrqG/QjdXMk
         3vbq7Moy6E+TUwA/97vfIPzyPwDm2Ik92XmYEXfKZ04kBOjKCYXVGbL2GASJ1OgD7OAI
         F4fHoEDObVX8gqfsacv3BjhQdLWaKTK5z3FLpi1YE8UCcIVwDHgPmmOTAEi6y3iWuPmD
         11tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699398986; x=1700003786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pn2xbqpzR6FgYHmHcEXrzNp21T6qV/UPNfBvteYfbm4=;
        b=JsQwnA/Xvifv42JnS7SB1O0btwOQXL9ANsNEBDzrNnKJGbaWmnmhyDlt4Y7/zT9N7R
         RFPvCLiFXa9xQtnERpmbsyQL8hmisBhh7BTmm9tMsBjyoFsjaHdgHI840Z2+wFV+mvpN
         rNL9HizWZW9xttOEsJVV+/EBAfAA3y6Q9E4dNlG0NpHLfv42B54zH1BU53xPWqO+ccHl
         /Et6r4y6lALzF4dvsJj8PXI/CNJ49l6X7wnVIWuB1gl0ztfD/jykr8UHLGwes0ugpxb0
         gINbW5BErxT0AULLxCIfm9AxTwtfbgET1Ms/z0bGF6bxiWbL7Nnt9p6WSqoKHg8nUl3J
         ivFw==
X-Gm-Message-State: AOJu0YxF4XrpBpLqteU2dR7XbsdC3Sis0dCgKFwr1Q6MutZmjemZ5h1X
	UTNfgeiCVXmGWYoAv7R/jCoMkmbV2dzPaRsBrmOXDQ==
X-Google-Smtp-Source: AGHT+IHTjFyKKGKP73ZCBoxXIcSsGWD0lm9eNitHK6l18Y+uE7+8pgejVYniuCqc8IwvMjfVwc1BlQ==
X-Received: by 2002:a17:902:d2c9:b0:1c9:e121:ccc1 with SMTP id n9-20020a170902d2c900b001c9e121ccc1mr435974plc.5.1699398986163;
        Tue, 07 Nov 2023 15:16:26 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id jf20-20020a170903269400b001c9b5b63e36sm355968plb.32.2023.11.07.15.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 15:16:25 -0800 (PST)
Message-ID: <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
Date: Tue, 7 Nov 2023 16:16:24 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
 <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
 <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
 <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
 <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
 <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
 <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
 <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 4:12 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 4:44:56 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 3:29 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 7, 2023 4:16:51 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/7/23 3:07 PM, Timothy Pearson wrote:
>>>>> Interestingly enough that's where my current investigation is leading
>>>>> as well.  After instrumenting and re-instrumenting the codebase far
>>>>> more times than I'd like to admit, I've noticed that the workers don't
>>>>> time out on kernel builds that show the corruption, they are directly
>>>>> terminated via signal (SIGKILL).  On kernel builds with the delay, the
>>>>> workers time out and self-terminate.  I'm still trying to parse out
>>>>> what the exact difference between these two mechanisms would be and
>>>>> how it plays into the corruption, but at least it's a start...
>>>>
>>>> Maybe poke at how they are exiting - you say timeout, so they've been
>>>> idle for a while and then go away? This would then cause worker creation
>>>> again later on if, say, we have 1 worker left and it goes to sleep. So
>>>> the timeout itself may not tell you much, outside of then causing that
>>>> other condition to happen. You could even try and shrink the timeout to
>>>> HZ / 10 or something like that to make it more likely to happen.
>>>
>>> Agreed.  As of right now I can confirm that with the delay in place
>>> (no corruption) the workers are exiting on their own, no signals and
>>> no IO_EXIT bit being set.  When I remove the delay (reintroducing the
>>> corruption) I see signal 9 being sent to the workers, and a mix of
>>> IO_EXIT being set and not being set.
>>>
>>> Ignoring the signal 9 does not fix the corruption, which makes me
>>> wonder more about IO_EXIT and whether things are not fully committed /
>>> properly torn down when the worker thread terminates.  This also
>>> dovetails nicely with the fact that the observed write corruption
>>> always seems to be in the latter portions of the page, never at the
>>> beginning of the page, also indicating rapid / unclean termination of
>>> the writer process.
>>>
>>> Will keep digging...
>>
>> This is useful. If the workers are exiting, they will try and process
>> work that is still pending. And it obviously does, or the process would
>> hang on exit or ring exit. But it'll also cancel said work, which
>> obviously did not happen for the old kthread scheme, as there was no way
>> to do that. So you'd just wait for it. Hence maybe what's happening here
>> is that mtr/mysql/mariadb isn't properly waiting for pending writes to
>> finish? It's just assuming that previously submitted writes will finish
>> if the task is killed?
> 
> It's entirely possible.  What is the correct way to wait for pending
> writes via the liburing API?  MariaDB uses liburing under the hood,
> and if I know the call(s) to look for I can make sure it's properly
> handling task exit.

I'd expect the task to wait and verify the results of pending requests
before doing io_uring_queue_exit(). But I'm not familiar with the code
base, maybe the task just exits? Closing the io_uring fd from an exiting
task would do the same.

I tried the below patch when running mtr here, but don't see any of them
trigger. You can try that, that'll tell you if we ever run cancelations
on pending io-wq work. If that triggers, I can try and cook up something
that would figure out where that is coming from.

But since you said you're seeing exits on signal 9, that would seem to
indicate that someone ran SIGKILL with potentially pending IO.

>> What page size are you using?
> 
> I've tested on both 4k and 64k page kernels with no difference.
> MariaDB is using a 16k page size on disk, and when the corruption
> happens it's apparently only writing part of the 16k page.

OK.


diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..2ee18905d57e 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -553,6 +553,8 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 	struct io_wq *wq = worker->wq;
 	bool do_kill = test_bit(IO_WQ_BIT_EXIT, &wq->state);
 
+	WARN_ON_ONCE(do_kill);
+
 	do {
 		struct io_wq_work *work;
 
@@ -889,6 +891,7 @@ static bool io_wq_worker_wake(struct io_worker *worker, void *data)
 static void io_run_cancel(struct io_wq_work *work, struct io_wq *wq)
 {
 	do {
+		WARN_ON_ONCE(1);
 		work->flags |= IO_WQ_WORK_CANCEL;
 		wq->do_work(work);
 		work = wq->free_work(work);
@@ -934,6 +937,7 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 	 */
 	if (test_bit(IO_WQ_BIT_EXIT, &wq->state) ||
 	    (work->flags & IO_WQ_WORK_CANCEL)) {
+		WARN_ON_ONCE(1);
 		io_run_cancel(work, wq);
 		return;
 	}
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ed254076c723..c0bd35e5429a 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1943,7 +1943,9 @@ void io_wq_submit_work(struct io_wq_work *work)
 
 	/* either cancelled or io-wq is dying, so don't touch tctx->iowq */
 	if (work->flags & IO_WQ_WORK_CANCEL) {
+		WARN_ON_ONCE(1);
 fail:
+		WARN_ON_ONCE(1);
 		io_req_task_queue_fail(req, err);
 		return;
 	}

-- 
Jens Axboe

