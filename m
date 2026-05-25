Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF038AC97
	for <regressions@lists.linux.dev>; Mon, 25 May 2026 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779743532; cv=none; b=kHubOn4Y4xcCc1FrHKx3mKxAG8z6K57veDRHTSCEs8gJSjzNaeH0VxmkW8h/EXCtIsu3tbFRYL470GFiGPY6y7HJLL6j9Hz5e8X4VIytiDPCSH+Us+72j94gLeUYo9l8fOtg7UQ1W9ZWDNM6kT4V1um9ywGeELpRRb/EcY6LSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779743532; c=relaxed/simple;
	bh=xNWkpKiYP2L1B1Os2FRnlTYEV7BM10If+hm4KZCvi5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvcm0vKb0ufeC7X/vreG65ziFHOWLNBHjD/B4i+Haz+isPIJJQmaFDrIfCLazrX+iX02PjvOpjJy7AQIt7hssqWsrmoTGyN4qrOmsv6VX/nSYbfjIHZt45UICi3PmkJiwkBAII8BP9Eoy0IzM/u6+6W/L43MrdTdSIBJ+qF7gwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SW7CW+2Z; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SW7CW+2Z"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gPT944dyRz9v87;
	Mon, 25 May 2026 23:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779743528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jQmM172M8HcD2CEk7L5WNzL5HmakvY9lpWUyWzfc94=;
	b=SW7CW+2ZSbWmmIEJoLMjrYinsHD7LW1+xUkexU1zVtki7CP8D+KN8cgrM2HILuv4hxDkMd
	JIACvLNUeKZXU1shb5843fV5+SGnOQ8ujU7yTsWyERZFiKRssXB7jBBAsUaUuND4XvT5kp
	QBm13CVR76GDGJ90jG793a9RKANi4MBvetX5LdyG4XK8IBmeBc8cc/hcxStFV0YYhWc7RC
	HyDwEgS30XM3O3zGaDBPcNK5uImRIa7Y1nOdrICl9MpD7AXVZSnuDjjrpG8CfKw2LrcklE
	bkm00S4cLfhnnFm6MCbNeziFZrT0/Z4viPlDluLMc810aj+KZWCDbfjxNtghoQ==
From: Lukas Beckmann <lbckmnn@mailbox.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Mike Galbraith <efault@gmx.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 6.12.y v2 4/5] sched/deadline: Fix dl_server getting stuck
Date: Mon, 25 May 2026 23:11:16 +0200
Message-ID: <20260525211117.630141-5-lbckmnn@mailbox.org>
In-Reply-To: <20260525211117.630141-1-lbckmnn@mailbox.org>
References: <https://lore.kernel.org/stable/20260522213120.1205100-1-lbckmnn@mailbox.org/>
 <20260525211117.630141-1-lbckmnn@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 79db48a505cdd4b4967
X-MBO-RS-META: gy7ozzmnngr54b3ict53yfkyzbsdbo6i

From: Peter Zijlstra <peterz@infradead.org>

commit 4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c upstream.

John found it was easy to hit lockup warnings when running locktorture
on a 2 CPU VM, which he bisected down to: commit cccb45d7c429
("sched/deadline: Less agressive dl_server handling").

While debugging it seems there is a chance where we end up with the
dl_server dequeued, with dl_se->dl_server_active. This causes
dl_server_start() to return without enqueueing the dl_server, thus it
fails to run when RT tasks starve the cpu.

When this happens, dl_server_timer() catches the
'!dl_se->server_has_tasks(dl_se)' case, which then calls
replenish_dl_entity() and dl_server_stopped() and finally return
HRTIMER_NO_RESTART.

This ends in no new timer and also no enqueue, leaving the dl_server
'dead', allowing starvation.

What should have happened is for the bandwidth timer to start the
zero-laxity timer, which in turn would enqueue the dl_server and cause
dl_se->server_pick_task() to be called -- which will stop the
dl_server if no fair tasks are observed for a whole period.

IOW, it is totally irrelevant if there are fair tasks at the moment of
bandwidth refresh.

This removes all dl_se->server_has_tasks() users, so remove the whole
thing.

Fixes: cccb45d7c4295 ("sched/deadline: Less agressive dl_server handling")
Reported-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: John Stultz <jstultz@google.com>
[ adjust renamed variable in fair_server_has_tasks (which this patch
removes) ]
Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
---
 include/linux/sched.h   |  1 -
 kernel/sched/deadline.c | 12 +-----------
 kernel/sched/fair.c     |  7 +------
 kernel/sched/sched.h    |  4 ----
 4 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 299a65a92d2e..464d281aa2e4 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -701,7 +701,6 @@ struct sched_dl_entity {
 	 * runnable task.
 	 */
 	struct rq			*rq;
-	dl_server_has_tasks_f		server_has_tasks;
 	dl_server_pick_f		server_pick_task;
 
 #ifdef CONFIG_RT_MUTEXES
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 6ff9055a6981..609783d7de29 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -916,7 +916,7 @@ static void replenish_dl_entity(struct sched_dl_entity *dl_se)
 	 */
 	if (dl_se->dl_defer && !dl_se->dl_defer_running &&
 	    dl_time_before(rq_clock(dl_se->rq), dl_se->deadline - dl_se->runtime)) {
-		if (!is_dl_boosted(dl_se) && dl_se->server_has_tasks(dl_se)) {
+		if (!is_dl_boosted(dl_se)) {
 
 			/*
 			 * Set dl_se->dl_defer_armed and dl_throttled variables to
@@ -1201,8 +1201,6 @@ static void __push_dl_task(struct rq *rq, struct rq_flags *rf)
 /* a defer timer will not be reset if the runtime consumed was < dl_server_min_res */
 static const u64 dl_server_min_res = 1 * NSEC_PER_MSEC;
 
-static bool dl_server_stopped(struct sched_dl_entity *dl_se);
-
 static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_dl_entity *dl_se)
 {
 	struct rq *rq = rq_of_dl_se(dl_se);
@@ -1220,12 +1218,6 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 		if (!dl_se->dl_runtime)
 			return HRTIMER_NORESTART;
 
-		if (!dl_se->server_has_tasks(dl_se)) {
-			replenish_dl_entity(dl_se);
-			dl_server_stopped(dl_se);
-			return HRTIMER_NORESTART;
-		}
-
 		if (dl_se->dl_defer_armed) {
 			/*
 			 * First check if the server could consume runtime in background.
@@ -1891,11 +1883,9 @@ static bool dl_server_stopped(struct sched_dl_entity *dl_se)
 }
 
 void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
-		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task)
 {
 	dl_se->rq = rq;
-	dl_se->server_has_tasks = has_tasks;
 	dl_se->server_pick_task = pick_task;
 }
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d26e078d0623..f36512892adf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9058,11 +9058,6 @@ static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_stru
 	return pick_next_task_fair(rq, prev, NULL);
 }
 
-static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
-{
-	return !!dl_se->rq->cfs.nr_running;
-}
-
 static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
 {
 	return pick_task_fair(dl_se->rq);
@@ -9074,7 +9069,7 @@ void fair_server_init(struct rq *rq)
 
 	init_dl_entity(dl_se);
 
-	dl_server_init(dl_se, rq, fair_server_has_tasks, fair_server_pick_task);
+	dl_server_init(dl_se, rq, fair_server_pick_task);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a09e2d25edd5..9391ff62cdaa 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -371,9 +371,6 @@ extern s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s6
  *
  *   dl_se::rq -- runqueue we belong to.
  *
- *   dl_se::server_has_tasks() -- used on bandwidth enforcement; we 'stop' the
- *                                server when it runs out of tasks to run.
- *
  *   dl_se::server_pick() -- nested pick_next_task(); we yield the period if this
  *                           returns NULL.
  *
@@ -389,7 +386,6 @@ extern void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec);
 extern void dl_server_start(struct sched_dl_entity *dl_se);
 extern void dl_server_stop(struct sched_dl_entity *dl_se);
 extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
-		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
 
 extern void dl_server_update_idle_time(struct rq *rq,
-- 
2.54.0

