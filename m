Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1455469850
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045167; cv=none; b=H1/4l+rIJhazxKE5XUD/E2YTPOCdLCmQwZhEVHoKVWr4VSXHbM76un6yb9cg1EaBlfe2gc3p3scRmxjOEuok0KjI8d2F9dbaQ6JhKtO9VTUPz4TjZRAIchxt3rfND7V8cyG59I87NCdIkjU58yX7uNgNMwSCnZdjJ5fS7vmwZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045167; c=relaxed/simple;
	bh=D9//gtau93f5XerofrItixBT6zd7uRUute5k0cuN6bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFRudA6t0+0aiVvenw96QNEYN/cVCRvHWOw2ZJB4Q+UvB4eEfn/KbpC7I9Ij3oaGE6dxPSGghOA+owMgLLbPer7vuobd55IcOndCU+jxEHokeg9BOPIM0mDRgjxHPOGDqG56eMfrafV2BIoORdAuC4z0wXLzRLZU3plsQZyRtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PofadQzk; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PofadQzk"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35ef6b49813so1049677eec.0
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 23:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792045164; x=1792649964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXVzb0Jzr93GDd45RAu5R4HJB03a5B7I9AqKlO7C0qk=;
        b=PofadQzkeQO3DLlt/lD7XVEy7XWx7BjCELpZmv+R+EtDhvqFTiJ+fyNuCtr1nue38M
         eTFdUO1TZxa4lCcwUQNpQ5gG2NAoZhyId+lA1wzoIlfcgYg7FJJnZXB2BejHpB+Lq9zA
         oriffYnnmPjdDdOeXcGhO/TyKWaaPdvLZAB6iyU5ALRu9UbIIQFPUvPvNcTmT5OIb6S9
         OHy6nqymSP/xbkrVOU+I1cFtGWPDxDVNDlET+v0kfisFaUGF8/8HunQvClawq2wto+++
         mW10TeJlds8HsL+v52qwaZcsVjZzZ9sTpQrTQ7DUfbMVswz2QN7IysUxWfrzYAjZI565
         Lqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045164; x=1792649964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXVzb0Jzr93GDd45RAu5R4HJB03a5B7I9AqKlO7C0qk=;
        b=hj/k1/VvjGGM18Phf/uKACGanJE0eFAcb2ej668GzXSgISPatbHZnX5Ium55Tz/814
         CVn16r204u9o6hSRdXaMIcX4WBxnGGzH//CqZTAUE+O4aQ+XaZcJCDYElydgWpzjkEcw
         si3sCug/3kolsqUEdgHC4Q3cC9bnfFFYMzyMDnnT3wp+Bw3I0nk7cpviU2VxKgtnyCbc
         rjEhQV9cJAkgaARVZQ5ocfoVWHyLRmD61YBVBIbRxmq6JR3tc2fUdspmcBtmyR0l8RYX
         c86oUuBabzRe1RxoeMwCz7ddaf1MhH6PwIKbJAxszyWjJ3y0XtwgNHCK/rBo/7ZI6yFE
         ZGQw==
X-Forwarded-Encrypted: i=1; AKwUvBxjzKYHpe5NqnPNrDJj4dD0EyvXZ4YUWQvqzQnAlUdzWtLRWswFzN3ph0isQNX/KUHYc5SNSCDutVOSkA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIl7ry2BwuhQ6oE905G0DF9Hzc71ubefDTFvLGVwSTk95fsrRxd
	VkzWwIBYnQz+E1m9zG8YNVvG4+9J3M6XnnrrphnDF1Ghzdk1l0gqmUWs
X-Gm-Gg: AYBFou3miRnnsQ68+O3LHNJykC+J52YCiML5y3pRgmg6GZ9uXbk7lz6FecOIUSzeVYd
	4z8VwMa4RmMOxxu8sXgWklgoQHUbZiZI6R+yujaCi4+4nXBTuV+UqosZsHxo7MTU3IFLpzzb2n2
	sV69tZ0/MWnvjdUGrq4susb6f3Vautwa1sUJg6yi3fqyuMpJWK0KYSBfe2KfNl9fk88Nq7gHYWf
	D+rzMsFg529n0vPbJWiKGSHqv+g4yNMH6yh7xO7yFNsHQqpy+C7kMOk0LRwwv+93kbVUU7Jsd8O
	1vIIAzq4p1N4eNrDieihPMvtLjudpgQw6ED/4CvfmqcQeysJmeuxejz9syn04jrmsQzlJU0/gHF
	PA5g3GHiOgYHH7zTlrRJbuAvk42Og0gtD35kbdgD66E7xrqd91h6eafDguxCKiInQ7D4NbBfQRg
	6Ar18FmJZI9lDZEaEwTiXetrCAFlG/E1GQdpApWLWgYmFmK++0HKRhDzUEQU4kXT4Zit2t7CfHu
	unpP7g2/3CfWP27HqFTfainQH80ey9SoTndkccExVmLMcbzYqhegYAxSQ==
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr31673280eec.16.1792045163355;
        Wed, 14 Oct 2026 23:19:23 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm44545339eec.8.2026.10.14.23.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:19:22 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Martin King <martin3kx@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org
Subject: Re: [REGRESSION] sched/rt: NO_RT_PUSH_IPI causes multi-second PI-boost starvation in pro-audio workloads (dd29c017aed6)
Date: Thu, 15 Oct 2026 14:19:15 +0800
Message-ID: <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903092037.5b739980@gandalf.local.home>
References: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com> <20260814183652.611e7ecf@gandalf.local.home> <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info> <20260903092037.5b739980@gandalf.local.home>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Steve, Martin,

I do not have Martin's workload, so this is not a reproduction of the reported
audio dropouts. What I have is a narrower synthetic experiment that may help
locate the non-PUSH failure Steve suspected. Sending data, not conclusions, and
no patch yet.

The short version: with RT_PUSH_IPI off, a PI-boosted task that cannot run on
its own CPU can be stuck in a state where the pull side cannot reach it and the
push side was never queued, until the task holding the CPU schedules out on its
own. Two things have to line up for that, and one of them (affinity) is in my
first attempt to get this wrong, so I have included the counter-example below.

Setup
-----

QEMU/KVM, 4 vCPU, non-PREEMPT_RT, 7.3-rc7 (24a19b953e2a). The feature is
toggled at runtime via /sys/kernel/debug/sched/features. Four SCHED_FIFO
threads:

  cpu1: L  FIFO 10  owner of PI mutex M, affinity {cpu1,cpu3}
  cpu1: X  FIFO 99  hog, busy for the whole dwell
  cpu2: W  FIFO 90  waiter, blocks on M     <- deliberately outside L's mask
  cpu3: R  FIFO 60  spare, spinning

W blocking on M boosts L from 10 to 90; the trace confirms it:

  waiter-114 [002] d..3. 52.286120: sched_pi_setprio: comm=owner pid=115 oldprio=89 newprio=9

L then cannot run on cpu1 because X holds it, and its only way out is to be
moved to cpu3. cpu3's spare runs at FIFO 60, which matters: before the boost L
has prio 89, and find_lock_lowest_rq() requires the target's
highest_prio.curr to be strictly higher priority than the task being moved, so
cpu3 is not a legal target until the boost happens. That way the opportunity is
created by the boost itself and not by some unrelated migration.

Measurements, dwell 1500 ms
---------------------------

  RT_PUSH_IPI   n   resumed <100 ms   owner resume median   min / max
  off (default) 8   0/8               1499.6 ms             1146.1 / 1502.6 ms
  on            6   6/6                 0.8 ms                0.6 / 5.4 ms
  off, no boost 2   0/2               1499.2 ms            1499.1 / 1499.2 ms

In the 8 "off" runs, 7 never migrated at all: L stayed on cpu1 and started only
once X finished its dwell. The 8th moved to cpu3 5 ms before X exited, which is
a by-product of the hog leaving rather than a rescue, so I used a fixed 100 ms
threshold for "timely" rather than "eventually moved". With the dwell raised to
4000 ms the waiter was blocked for 2.26 s before L finally moved.

The third row is a control with PTHREAD_PRIO_NONE instead of PRIO_INHERIT, to
check that the opportunity really comes from the boost. Without the boost L
stays at prio 89, cpu3's curr is 39, 39 > 89 is false, and so there is no legal
migration target at all. Both feature settings look the same there, which is
the expected result.

The affinity counter-example
----------------------------

My first version gave L affinity {cpu1,cpu2}, that is, including the CPU whose
priority drops when W blocks. In that shape both settings rescued L in 0.5-6.2
ms and the two paths do not diverge at all. The reason is that cpu2 can pull L
inline, and task_is_pushable() only requires
cpumask_test_cpu(cpu, &p->cpus_mask) for the pulling CPU. The split only shows
up once that CPU is removed from L's mask.

So this is a fairly narrow condition: PI boost, RT overload on the owner's CPU,
and affinity that excludes the CPU that just went idle. I do not know whether
Martin's livefx workers hit all three. The trace in his report has the worker
boosted and enqueued but never scheduled while other CPUs idle, and nothing in
his description rules it out, but I cannot confirm it from the data in the
report.

Where the non-PUSH path appears to lose it
------------------------------------------

Both sides have to miss the boosted task.

1. The pull side cannot reach it. In the non-PUSH branch, pull_rt_task() walks
   the overloaded CPUs and calls pick_highest_pushable_task(src_rq, this_cpu),
   which requires cpumask_test_cpu(cpu, &p->cpus_mask). L's mask excludes cpu2,
   so cpu2's loop finds nothing and returns empty-handed.

2. The push side was never queued. rt_queue_push_tasks() is only called from
   set_next_task_rt() and switched_to_rt(). prio_changed_rt() queues a pull when
   the running task's priority drops, but it does not queue a push. The boost
   arrives through rt_mutex_setprio() -> sched_change_end() ->
   prio_changed_rt(). L is not the current task on cpu1 (X is), so it takes the
   non-current branch, which only ends up doing resched_curr().

The result is that after the boost, cpu1 will not queue a push until X itself
schedules out, and cpu2 cannot pull L because of the affinity check.

The two paths are separable in the trace by the hardirq marker:

  # RT_PUSH_IPI on - the ipi runs the push in hardirq context on cpu1
  hog-122 [001] d.h2. 53.803264: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3

  # off - no ipi; the push happens on cpu1's ordinary scheduling path,
  # and in this run only 5 ms before X left on its own
  hog-113 [001] d..3. 50.615178: sched_migrate_task: comm=owner prio=9 orig_cpu=1 dest_cpu=3
  hog-131 [001] d..2. 70.614471: sched_switch: prev_comm=hog prev_state=X

One more observation, in case it is useful: prio_changed_rt() does not appear to
have ever queued a push. I walked that function's history and did not find a
revision that did. That would be consistent with Steve's guess that this is a
long-standing bug that the PUSH path happened to cover, rather than something
dd29c017aed6 introduced.

What I am not proposing
-----------------------

I am not suggesting flipping the RT_PUSH_IPI default. The thundering-herd
reason for keeping it off outside PREEMPT_RT is clear, and trading a regression
for that is not a fix.

If this is too far from the real workload to be worth chasing, or if there is a
specific trace you would rather have, tell me and I will either drop it or
collect that instead. The probe and the full logs are small; happy to send them
to anyone who wants to rerun it.

Thanks,
Chaosheng

--
Chaosheng Qu
