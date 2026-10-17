Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BCF47F762
	for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239275; cv=none; b=hWAd26hL42fuGcrfdaXJYH2Gef+82LZzkMVF7u6a08o1pSDNs1b8wPeAKF1gGTlbhSC7YD0Hz14c2ydGNJOQbllT610yLUsifAPG8L7kUh3kT1G/cb4uRxl4Q/QRBcCA9a3Ii0+P7alCJzchqNo1N1jiNI08LzxjmChEvclM02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239275; c=relaxed/simple;
	bh=YSk8+ZJeyU6lUWnetAhWqjXfnDgXJ+FhsYf+NkXzx/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCa/EvCrpjF9qbenqOEV1pUgzq+Lqgnm86cGBiAKP9L3ZaFLDo/J8P2cY/XaGdQoze1QYMFw5AgsdgE6Zmjol/4MwvxEB4BgI1jVJSEk2ajCCHxOeNyKdRLZQ4XWWIwBlaK2hceQP3uiPwS+STFxhC6VUerTA0Bv5uOKIrzhxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqVf1opd; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqVf1opd"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so852236c88.0
        for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792239273; x=1792844073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z66yztvANzuR9me/cFTc8jCAnqYHFfuYz2a0mwZJbfI=;
        b=NqVf1opdOK5gmhTc7CcG94CEc2GS1DfMbZ9MC+9JYzSZxNQ3hiu8qThQDFVJjABAnI
         x1l52avNA3zU3ihWC4XJ3a3sgFEBf3GAWnFDn/03KV9ulCbz+rUJD8DeZB4njfzBRBcS
         pTkxSr8atMNdIt96pBEYEmO1cWk569ZPws0yBNBDrgLgQZCy9ZaSLr/KgPG2NyMocLwK
         /kqpOAaVCGKRaRtqjNHBlvNvBblLyY2G6yi+tAJQ3ogpWFlKV+2Bg6pH/4DTi1YN9Ibi
         WO5L2Lz0JSUNnAla/2mrIiJSFpi7i+1P010Ctrn2MeIRqV2H2xBHILSHY5GI/sHsc7pr
         8MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792239273; x=1792844073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z66yztvANzuR9me/cFTc8jCAnqYHFfuYz2a0mwZJbfI=;
        b=v9fYnv//1b9oJ8GZmEa2vblUcFhlgV4qAW9bNKoALZA8kdSQzqQeMTXStbIW0gDJoU
         PctlAFsHMLWJU8TUBNS3yJcpffvbh+QIr+zC4pW6ffhuoDlBFiBYC4EDy44jxPAKIILw
         KU7k3niCaDMIMamF/rCrc9nEpcbivtUB5nf3AUQ60R/WbmanJVJLH1kr9rypIONtPq6t
         GGr3VXWLeDw/pdV0qHzRIV5qdWzxzaUHbbjezxoe2IoiuXw94Rw08O0levifyqBVqjN3
         IhOh7cwgjm27n+d1qjuDAKPe3jsS8iUC/Texy778M12dj+Q2zvZpSc/yiRh9hrwhBiYv
         jdTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHkY2jkV8CrshCSQrPU/d3lBrdNyc7L7CP1EPNxERgYx+u4DUzqLJ6J+zLxG8vK2lUsLP35AUfCyE25Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7J/yur2uYM9CsLiCFliwiTbHWpSJ/9JoQx4g8SsSzR6fTlZtI
	ae84MmwU1b8ddIGnyGKT1JfB5LEqXmA2uWrKEOOG7JiNIoTK19DQ7S4o7GMDvFDa
X-Gm-Gg: AYBFou1aPj5bKoqm2ddbp1i/sjPYmy1rSkEI684tD4nwcyIcB5W3tfT0bnaSGkh3/T3
	CTfK5D1ROFwxV5757QrthXzBWn27l4PI6m9/4p77RGK31Px5J+swc3BP8mx53rp5ZHKJ5NIGGK2
	zAEVAWd1Mm1RRlm9GJyVcReJS6+a/baLUL2eTiuu5XKZJdsAT3mLsavUGtv3iMpMax8DYHQt879
	Sf7GKWRY2Z79uOgB1F7qN+lwl6ooHTiLm9fdZwL5v7GVBIlXLi04zdsMzUdY94bUh0MrSduwyJO
	ljokKtUV4m2UgFqJxDDR+2ogpOi2nGOn9cqig4kOPxNDlQ4PQe33tEkQuU6XD8r8CnR/+eX2h1m
	IKuIFDJoccdWfXB0Hw1hA512iLsqrXpsNRMdaTJl7aw/vSNomcsL88ILeeWArKWa/lOpkhkysKj
	L5ABEoYJ74wkyKJujZpMZPG7mqCvtuKcMsmI20f4QR11nRqbpKsmBD/zC+IGmqTlmYnD02uM6z9
	/uGH/UK9X50ojNj+aBUyY0XzgDxowpeLMPpoOJAQWVAIvY=
X-Received: by 2002:a05:701b:4651:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1850714476fmr3704983c88.0.1792239273223;
        Sat, 17 Oct 2026 05:14:33 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm13101116c88.3.2026.10.17.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 05:14:32 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Martin King <martin3kx@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org
Subject: [PATCH] sched/rt: queue a push when a queued RT task is boosted
Date: Sat, 17 Oct 2026 20:14:23 +0800
Message-ID: <20261017121423.393837-1-chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
References: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com> <20260814183652.611e7ecf@gandalf.local.home> <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info> <20260903092037.5b739980@gandalf.local.home> <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Steve, Peter, Martin,

Two things: a correction to my previous message, and a patch that follows
from your suggestion.

First, the correction. In my last mail I quoted this trace pair to argue
that the non-PUSH push only happens when the hog leaves:

  hog-113 [001] d..3. 50.615178: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3
  hog-131 [001] d..2. 70.614471: sched_switch: prev_comm=hog prev_state=X

The second line is wrong. It does not appear in any of my logs; I
assembled it from a different run and mislabelled the timestamps. The
first line is real (aff-multi.log, the 4 s dwell run). It does not change
the conclusion - in the 1.5 s dwell runs the owner still resumes at a
median of 1499.6 ms and 0/8 meet a 100 ms bound - but the quoted trace was
not what I said it was, and I would rather correct that now than have it
found later.

Second, the instrumented follow-up you asked for. I put kprobes on
pull_rt_task(), push_rt_task(), push_rt_tasks(), prio_changed_rt(),
enqueue_pushable_task(), pick_next_pushable_task() and
find_lock_lowest_rq(), on the same 4-vCPU non-PREEMPT_RT config. The
picture is tighter than what I described before:

- pull is reached, and immediately. On the boost, waiter blocks, cpu2
  goes idle, and pull_rt_task(cpu2) runs between 5 and 99 us later. It
  comes back empty. The reason it comes back empty is the affinity test in
  task_is_pushable(): pick_highest_pushable_task(src_rq=cpu1,
  this_cpu=cpu2) requires cpu2 to be in the boosted task's cpus_mask. In
  my scenario the mask is {1,3}, so it is not. When I widen the mask to
  {1,2} the very same code pulls the owner to cpu2 within 2 us, so the
  affinity test is the whole difference.
- push is not queued at the boost. prio_changed_rt() runs, and nothing
  queues a push from it. I kept the full trace for three clean runs: in
  all three the first balancer event after the boost is pull_rt_task(cpu2)
  at +5..+99 us, there is no push_rt_task()/push_rt_tasks() for the whole
  1.5 s dwell, and the owner never migrates - it just waits the hog out.
  Being precise, OFF is not "never pushes": in other runs a push does
  appear on cpu1, but it is entered from the hog's own scheduling path
  (the trace attributes it to the hog thread), not from the boost, and it
  lands whenever that path next happens to run - which is why the few
  runs that do escape land anywhere between 62 ms and 1.2 s. Across all my
  OFF runs (n=17) only one met a 100 ms bound; the median is 1498.5 ms.

So the non-PUSH path loses the task because both sides miss it: pull
cannot select it (affinity), and push is not requested at the boost. That
matches what you wrote - the boost should trigger another analysis of RT
migration, and we do not do that.

The patch below does exactly that: when a queued, non-current RT task's
priority is raised, ask its rq for a push. The push selects a target from
the task's own cpus_mask via find_lowest_rq(), which is the selection the
pull side could not make. rt_mutex_setprio() already ends with
__balance_callbacks(), so the callback runs inside the same rq->lock
section, on the same path as the existing rt_queue_pull_task().

A/B on the same tree, same config, same probe, only this patch different:

  OFF, mask {1,3}       before: 1/17 timely, median 1498.5 ms
                        after: 13/13 timely, median 4.8 ms (0.6-59.6)
  no boost (control)    before: 0/2 migrated, median 1498.2 ms
                        after: 0/3 migrated, median 1499.2 ms
  ON (RT_PUSH_IPI)      before: 3/3, median 3.06 ms
                        after: 5/5, median 0.72 ms

The control row is the one I would look at: with no boost there is no
legal target (cpu3's spare at FIFO 60 is more urgent than the owner at
FIFO 10), so the new push finds nothing and I did not observe any
migration, same as before the patch. The patch only acts when a real
migration opportunity exists.

With the patch, the mechanism is visible in trace:

  waiter-109 [002] 51.667482: prio_changed_rt
  waiter-109 [002] 51.667695: push_rt_tasks
  waiter-109 [002] 51.667739: pick_next_pushable_task
  waiter-109 [002] 51.667955: find_lock_lowest_rq
  waiter-109 [002] 51.669068: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3

Caveats, since this is a first cut: measured only on a KASAN +
PROVE_LOCKING debug config, only non-PREEMPT_RT, only this synthetic
topology, not on Martin's REAPER workload. I did compile-test the UP
build (build_policy.o, CONFIG_SMP=n) and it builds; the PREEMPT_RT
combination I could not build here because this tree has no RT patch set,
so it is untested.
One scope note: prio_changed_rt() is reached from sched_change_end() for
ordinary sched_setscheduler()/sched_setattr() priority changes as well,
not just PI boosts, so this would also queue a push when a queued RT task
is raised by userspace. That case looks symmetric to me but I have not
A/B'd it; say the word if you would rather gate this on pi_top_task. I
have not flipped any default and I am not proposing to.

One more thing, in case it is useful, and it may be the real reason
nobody has touched this: the prio_changed_rt() push omission is not
recent. I walked the function through 15 revisions back to 2007 and none
of them queued a push, so this looks like it has been there since the
non-PUSH fallback was introduced, which is consistent with your guess
that the PUSH path was covering for it.

Happy to respin, narrow it, or drop it if the direction is wrong.

Thanks,
Chaosheng


A PI boost can leave a queued RT task stuck on a runqueue it cannot run
on. The pull side cannot help: pull_rt_task() on another CPU only picks
tasks whose affinity includes that CPU, so when the boosted task's
cpus_mask excludes the CPU that just went idle it is never selected. The
push side is never asked either: prio_changed_rt() only queues a pull.

In a four-vCPU non-PREEMPT_RT guest with RT_PUSH_IPI off, a FIFO-10 task
holding a PI mutex, boosted to FIFO 90 by a waiter on another CPU while a
FIFO-99 hog keeps its own CPU busy, stayed queued for the whole 1.5 s
dwell while a FIFO-60 spare sat idle on a CPU that was in its mask. With
RT_PUSH_IPI on the same setup resumed in under 6 ms.

Queue a push from prio_changed_rt() when a queued, non-current RT task has
its priority raised. The push selects its target from the task's own
cpus_mask, which is exactly the selection the pulling CPU cannot make.
RT_MUTEXES already arranges for __balance_callbacks() to run inside the
same rq->lock section, so this is the same delivery path as the existing
rt_queue_pull_task().

With no boost present there is no legal target and the push finds
nothing, so behaviour is unchanged.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 kernel/sched/rt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add7..13d505470 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2499,6 +2499,17 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, u64 oldprio)
 		 */
 		if (p->prio < rq->donor->prio)
 			resched_curr(rq);
+
+		/*
+		 * A boost can create a migration opportunity that the pull
+		 * side cannot reach: pull_rt_task() on another CPU only picks
+		 * tasks whose affinity includes that CPU, so a task that gets
+		 * boosted while its CPUs are busy can stay queued until it
+		 * becomes current. Queue a push on this rq instead, which
+		 * selects a target from the task's own affinity.
+		 */
+		if (p->prio < oldprio && rq->rt.overloaded)
+			rt_queue_push_tasks(rq);
 	}
 }
 
-- 
2.43.0
