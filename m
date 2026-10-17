Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B3480338
	for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248291; cv=none; b=DMna2elvj+NZ4fnM3/f25jUwdyBJnyk/FBLdfKWyi5b3SlIHl8CKvlbDdYik+wcEuVDNKT2fYzirlIN2fho+keaNA9Rtem4sBPnRdgu+r76NcgCN+QuNNLQa2hO9+BFHTnPikHanKFynZ7NfWeAbF+RrjzYhPrmvjbDyUH7l4Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248291; c=relaxed/simple;
	bh=9W9VPntOD4cza6SWolsofg5MHk9qupWnlgrDHPiC6x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8EtZ33Vxt0T/bpLFGwjAjxsvPgHEfny639YPEJvj4LPIv6gQbLnBIXUKEzyRvWz/r9bNZBurpR5I9BH4JRZMKB2+hDIX5zKO39mR08FmOBRo/aq64JK98hN9Pg3xZEtHskrGyoQeGcyRXv67YNtWvnbREWdeKcpFwSNT14PvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoFCC286; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoFCC286"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd35952so74308f8f.2
        for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792248288; x=1792853088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3C5yvzncARK8+153xgzCb4sHIjKt3sGGJ2HcJ31DIM=;
        b=PoFCC286iZgIuqFGIsEwXwMR3qXUVpWmUpQtT3pDuvGMU9WktVq+I649ZPMLt/Uwp6
         a+18mAxRMR3XIGBBeidpo38xQ3LWxhx4hR4uzAjeH6b4E8QDFMlHgn3TbpZTp9XJiLEV
         oc9w3XpIRH9W3skDxrI2VMBN4qjp72Alx+TGLJaqdS/r8m9MpZtePFDmaqZZ68o+la0s
         nkoVcyvGf2kDLIxOE0Jp2v7VtmJRWy/Urj7OW5W3UruMApPd96MU0lK62yR/Xw5GV5Qu
         3DMvuU8E1c2NHC/uOCupVxKMTXtbNbPbCObEWxqjQBOCiav1n3ox9CPtYU3t5FBNQFfb
         qSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248288; x=1792853088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3C5yvzncARK8+153xgzCb4sHIjKt3sGGJ2HcJ31DIM=;
        b=A3uOhjGjsHANEKUZuRPxb4n3Zyf86Vmj1u7b0IHLOWjuphN921nhCY2WMLfsBVA5Ig
         jOG0jNboKxEFNwwjaA3coivcCHFOxrGNq+kOCIrtZkLtPXO2+tZeQ0HywsuSJSdWSzLB
         luzZncokHtgnoUtbyQs7/OUcWi+D4DQS4Nvj2LYyjbibPiX3GX2ccpCzzFi+HV7b7BhA
         5rraxwFh+eiFqf0AaDpOuH9VHjJg+8DqHSiqGLiCWGtBi3EoUAKWPmLKHRUv822WzYKH
         6olEnAi/HUnx6jfy0vDmKbsFXEpQfGj80OKDd/20jEh9431n4fUFVBpoWZ7+hxBqEufr
         DHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvECZOryKcOIvPqBO+0EyNDDdENNTl11wSy77Hz/GrjR/pJXY4Gx2ZaD6EQaVZbBxo3IdfE8xKqghVjg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIqIL2dCmpZgcsaLfzmKNF5uuhJDjqs9JOnym/1NIrvQRPuPhR/
	c8+1NMY2QT1zya3xrubeQioNZ1o8e1W8MK5y5d2s8shkQrkyZ8VKALyz
X-Gm-Gg: AYBFou0eXyZjdMosVg9jbbpyG09MtYCdFgyZuJxN5HOC7mYovT++2osSJ51Or1h6rrR
	WSf1pnHDzkKioBNR2lZT9BuWJgmiB7z6zxdRQg44GxN3CgaWK2M5b9ZVUyfRsYcudt6WEhhEfzF
	4XNfrQgFDrkCVEHsXTwVlL89yRHul1tWTM3XhNtSJKBqDPxYCSwfvrsznKZxtKF2ZyIb9Dk9lU/
	71mPK9ZqC4HejuwLeC+2r/Slipl0N6vcV6APT97ZwTjXwvbSqqwPVXkoINP89PxPFYPw5NRezqO
	FqwPpgCKDLuJVU/3hiZ3xQpS9IjNdI7ChvGJokIWeM0K2rFivgn/t4i6AbONkTQciSqSDYOnJCv
	93XJxF8vtA2Xo2ymXvKTf1TqFCoNrIm1zEvHfyRjIr/x+Zbihssf74MPttZk7iIHjKjHBeLKesW
	A1ChG1yKPhviDn+uomzZ6jGxFhH3yJNRsnLXiKzkQ+fH0ocPlny7f2SDAPh6SeRcl/xhD3LZKPZ
	jOc2zsD/QZ5eXF57+bjHUbBag==
X-Received: by 2002:a05:600c:3512:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4a1d7601f29mr55451775e9.2.1792248288122;
        Sat, 17 Oct 2026 07:44:48 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm172958705e9.12.2026.10.17.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:44:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 17:44:43 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Martin King <martin3kx@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-rt-users@vger.kernel.org
Subject: Re: [PATCH] sched/rt: queue a push when a queued RT task is boosted
Message-ID: <atOGI0tcyXnuWuD9@scheduler.schedules>
References: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com>
 <20260814183652.611e7ecf@gandalf.local.home>
 <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info>
 <20260903092037.5b739980@gandalf.local.home>
 <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
 <20261017121423.393837-1-chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261017121423.393837-1-chaosheng.qu.linux@gmail.com>

On Sat, Oct 17, 2026 at 08:14:23PM +0800, Chaosheng Qu wrote:
> Hi Steve, Peter, Martin,
> 
> Two things: a correction to my previous message, and a patch that follows
> from your suggestion.
> 
> First, the correction. In my last mail I quoted this trace pair to argue
> that the non-PUSH push only happens when the hog leaves:
> 
>   hog-113 [001] d..3. 50.615178: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3
>   hog-131 [001] d..2. 70.614471: sched_switch: prev_comm=hog prev_state=X
> 
> The second line is wrong. It does not appear in any of my logs; I
> assembled it from a different run and mislabelled the timestamps. The
> first line is real (aff-multi.log, the 4 s dwell run). It does not change
> the conclusion - in the 1.5 s dwell runs the owner still resumes at a
> median of 1499.6 ms and 0/8 meet a 100 ms bound - but the quoted trace was
> not what I said it was, and I would rather correct that now than have it
> found later.
> 
> Second, the instrumented follow-up you asked for. I put kprobes on
> pull_rt_task(), push_rt_task(), push_rt_tasks(), prio_changed_rt(),
> enqueue_pushable_task(), pick_next_pushable_task() and
> find_lock_lowest_rq(), on the same 4-vCPU non-PREEMPT_RT config. The
> picture is tighter than what I described before:
> 
> - pull is reached, and immediately. On the boost, waiter blocks, cpu2
>   goes idle, and pull_rt_task(cpu2) runs between 5 and 99 us later. It
>   comes back empty. The reason it comes back empty is the affinity test in
>   task_is_pushable(): pick_highest_pushable_task(src_rq=cpu1,
>   this_cpu=cpu2) requires cpu2 to be in the boosted task's cpus_mask. In
>   my scenario the mask is {1,3}, so it is not. When I widen the mask to
>   {1,2} the very same code pulls the owner to cpu2 within 2 us, so the
>   affinity test is the whole difference.
> - push is not queued at the boost. prio_changed_rt() runs, and nothing
>   queues a push from it. I kept the full trace for three clean runs: in
>   all three the first balancer event after the boost is pull_rt_task(cpu2)
>   at +5..+99 us, there is no push_rt_task()/push_rt_tasks() for the whole
>   1.5 s dwell, and the owner never migrates - it just waits the hog out.
>   Being precise, OFF is not "never pushes": in other runs a push does
>   appear on cpu1, but it is entered from the hog's own scheduling path
>   (the trace attributes it to the hog thread), not from the boost, and it
>   lands whenever that path next happens to run - which is why the few
>   runs that do escape land anywhere between 62 ms and 1.2 s. Across all my
>   OFF runs (n=17) only one met a 100 ms bound; the median is 1498.5 ms.
> 
> So the non-PUSH path loses the task because both sides miss it: pull
> cannot select it (affinity), and push is not requested at the boost. That
> matches what you wrote - the boost should trigger another analysis of RT
> migration, and we do not do that.
> 
> The patch below does exactly that: when a queued, non-current RT task's
> priority is raised, ask its rq for a push. The push selects a target from
> the task's own cpus_mask via find_lowest_rq(), which is the selection the
> pull side could not make. rt_mutex_setprio() already ends with
> __balance_callbacks(), so the callback runs inside the same rq->lock
> section, on the same path as the existing rt_queue_pull_task().
> 
> A/B on the same tree, same config, same probe, only this patch different:
> 
>   OFF, mask {1,3}       before: 1/17 timely, median 1498.5 ms
>                         after: 13/13 timely, median 4.8 ms (0.6-59.6)
>   no boost (control)    before: 0/2 migrated, median 1498.2 ms
>                         after: 0/3 migrated, median 1499.2 ms
>   ON (RT_PUSH_IPI)      before: 3/3, median 3.06 ms
>                         after: 5/5, median 0.72 ms
> 
> The control row is the one I would look at: with no boost there is no
> legal target (cpu3's spare at FIFO 60 is more urgent than the owner at
> FIFO 10), so the new push finds nothing and I did not observe any
> migration, same as before the patch. The patch only acts when a real
> migration opportunity exists.
> 
> With the patch, the mechanism is visible in trace:
> 
>   waiter-109 [002] 51.667482: prio_changed_rt
>   waiter-109 [002] 51.667695: push_rt_tasks
>   waiter-109 [002] 51.667739: pick_next_pushable_task
>   waiter-109 [002] 51.667955: find_lock_lowest_rq
>   waiter-109 [002] 51.669068: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3
> 
> Caveats, since this is a first cut: measured only on a KASAN +
> PROVE_LOCKING debug config, only non-PREEMPT_RT, only this synthetic
> topology, not on Martin's REAPER workload. I did compile-test the UP
> build (build_policy.o, CONFIG_SMP=n) and it builds; the PREEMPT_RT
> combination I could not build here because this tree has no RT patch set,
> so it is untested.
> One scope note: prio_changed_rt() is reached from sched_change_end() for
> ordinary sched_setscheduler()/sched_setattr() priority changes as well,
> not just PI boosts, so this would also queue a push when a queued RT task
> is raised by userspace. That case looks symmetric to me but I have not
> A/B'd it; say the word if you would rather gate this on pi_top_task. I
> have not flipped any default and I am not proposing to.
> 
> One more thing, in case it is useful, and it may be the real reason
> nobody has touched this: the prio_changed_rt() push omission is not
> recent. I walked the function through 15 revisions back to 2007 and none
> of them queued a push, so this looks like it has been there since the
> non-PUSH fallback was introduced, which is consistent with your guess
> that the PUSH path was covering for it.
> 
> Happy to respin, narrow it, or drop it if the direction is wrong.
> 
> Thanks,
> Chaosheng
> 
> 
> A PI boost can leave a queued RT task stuck on a runqueue it cannot run
> on. The pull side cannot help: pull_rt_task() on another CPU only picks
> tasks whose affinity includes that CPU, so when the boosted task's
> cpus_mask excludes the CPU that just went idle it is never selected. The
> push side is never asked either: prio_changed_rt() only queues a pull.
> 
> In a four-vCPU non-PREEMPT_RT guest with RT_PUSH_IPI off, a FIFO-10 task
> holding a PI mutex, boosted to FIFO 90 by a waiter on another CPU while a
> FIFO-99 hog keeps its own CPU busy, stayed queued for the whole 1.5 s
> dwell while a FIFO-60 spare sat idle on a CPU that was in its mask. With
> RT_PUSH_IPI on the same setup resumed in under 6 ms.
> 
> Queue a push from prio_changed_rt() when a queued, non-current RT task has
> its priority raised. The push selects its target from the task's own
> cpus_mask, which is exactly the selection the pulling CPU cannot make.
> RT_MUTEXES already arranges for __balance_callbacks() to run inside the
> same rq->lock section, so this is the same delivery path as the existing
> rt_queue_pull_task().
> 
> With no boost present there is no legal target and the push finds
> nothing, so behaviour is unchanged.
> 
> Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>


IDK about the patch itself but,

This long long explanation should go below '---'. Not to the commit
message.

And isn't this Steven's suggestion? So I think we need a
Suggested-by.


Thanks,

Kayra
