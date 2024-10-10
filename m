Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B05199E9B
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589042; cv=none; b=cdgwEC0Mdsx/PcGIv1qJAyZawgB951RInbOX2J2XmLkiQVOJoIb3gB48JQ3VvM0vXruAp/Q85YHy3tFRR8jLJwQbIKH2JseXC/fuylsbMQSkmrOUZvV9HHHsLawiq7mDMezlI0tqhekl726Z/EryDehhM9dgT3vllLGyPyDdTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589042; c=relaxed/simple;
	bh=kyK9IfIumtMxOBKf01YQ/Yv4b7sj1pM8kXYoi3jPLzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kS09BWYBzjEU9779G0P4KG5y2B0tLlRwv37Mp6G/RYg9+WEPWlIPXsU5e2NwiIBUmyIzFwC36/j4DhQLssHsjw1F3ZkbW6uh9umZWEeKXrta0IBZpnSjWU6PB/+fQWb7zS6O8bbVq+rAooaS7BteYnCxWvzg3Kb8XFF4xcH87XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=wvysMbpm; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="wvysMbpm"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b10e0fadbcso82491385a.2
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 12:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1728589038; x=1729193838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gsLHGAEjqDtfYrDyUfOa/QAzf3Oef5x5SfIBxktNMGQ=;
        b=wvysMbpm4gfcxyZH/Dydjw5L9Q8t4h32ltNUcnn6JUVjDU9h8pIW17P7MGLig4WaC0
         VJk69iI01oEt+uy8PCcYs7KX9HGoHShtMe+aFDOjc6pC5YvAPXO4LDaL8dn5T0tDgKWn
         e/ysvk1jRJ03/aqFSjt0/psTK6enHlNTfO7p8pnsYaaA5kFN96jhqBCG00Xsosv5ZNpq
         g8xOoqGWIdSI1EsnRJ99B0zQAy3BJmFYREM4tna2vGRucRzzPE/nX9Cv53lidhaxoK/6
         o2cd+0lMjNagf3Q+5Kg3M74Umtuue3WDHHbtayuXYoNicQnBQpcyt1NXF9r+52YI1Jge
         CHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589038; x=1729193838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsLHGAEjqDtfYrDyUfOa/QAzf3Oef5x5SfIBxktNMGQ=;
        b=hnnUBnFmq3+L61mSTKshP+MhedGtPeQS1wCxxEtMvcYN11pAMkuewqeCDy+PW9bvN/
         5x5j8S3Ta/TxLWi+lYf0y9v3EgdWZyqkk8E4Cnx6VtOmdv2Xn99+PEec/0vzhboiCkgR
         bnbjMqff09fDa84Yr67PAfcIK4i9g5CDLlEO3/uNU4/P6fykywnirNcGjVByJAU/ZhY7
         7ab814B3QTlK7qEGMS7eUUEzwTOiH5V8EISiXrLhHlYp7WTF6SZiOIZhBJkV8VI/cZdk
         7VYnDAgPt2eL4COjQ8MSF87rqJsuZwWHrp/YJNsaG4xuDZcJduBuw7tLFbbZE3/bN4qQ
         ESaA==
X-Forwarded-Encrypted: i=1; AJvYcCWgJAAfZZvgRoOeec0A0jAgD/ZjFRIpR72Np3ucQ6aZRUWeG3RUv0EPHoEGic9LJF1iPd4Z3ghbpOItdg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6cw+Ik/3C53JvbR8kTKK98mKDzCfVIk/9uiobw2qpSyCROBVU
	PM6iYC5wyqW9j0Sy+mKkDayF1bzno2op9midw/ZMpSSMpKUg7VNw1R4mUMqKQ/I=
X-Google-Smtp-Source: AGHT+IHj5PGC9osLeQUv9ktZgVhXRPSB6Fwv1DjqQyk86AtXgSdlA2G2TojPVocEWliGjaTLX//pTw==
X-Received: by 2002:a05:620a:450c:b0:7b1:171a:5abf with SMTP id af79cd13be357-7b11a3ad759mr40640685a.45.1728589038183;
        Thu, 10 Oct 2024 12:37:18 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148df5d6sm72055985a.31.2024.10.10.12.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:37:17 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:37:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Klaus Kudielka <klaus.kudielka@gmail.com>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Bert Karwatzki <spasswolf@web.de>, regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] sched/core: Indicate a sched_delayed task was
 migrated before wakeup
Message-ID: <20241010193712.GC181795@cmpxchg.org>
References: <20241010082838.2474-1-kprateek.nayak@amd.com>
 <20241010082838.2474-4-kprateek.nayak@amd.com>
 <20241010130316.GA181795@cmpxchg.org>
 <20241010130621.GH17263@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010130621.GH17263@noisy.programming.kicks-ass.net>

On Thu, Oct 10, 2024 at 03:06:21PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 10, 2024 at 09:03:16AM -0400, Johannes Weiner wrote:
> 
> > I'll try to come up with a suitable solution as well, please don't
> > apply this one for now.
> 
> I'll make sure it doesn't end up in tip as-is.

Thanks.

This would be a replacement patch for #2 and #3 that handles migration
of delayed tasks. It's slightly more invasive on the psi callback
side, but I think it keeps the sched core bits simpler. Thoughts?

---

From d72a665d7c7c7d9c806424f473d13452754471d3 Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 10 Oct 2024 14:37:43 -0400
Subject: [PATCH] sched: psi: handle delayed-dequeue task migration

Since sched_delayed tasks remain queued even after blocking, the load
balancer can migrate them between runqueues while PSI considers them
to be asleep. As a result, it misreads the migration requeue followed
by a wakeup as a double queue:

  psi: inconsistent task state! task=... cpu=... psi_flags=4 clear=. set=4

First, call psi_enqueue() after p->sched_class->enqueue_task(). A
wakeup will clear p->se.sched_delayed while a migration will not, so
psi can use that flag to tell them apart.

Then teach psi to migrate any "sleep" state when delayed-dequeue tasks
are being migrated.

Delayed-dequeue tasks can be revived by ttwu_runnable(), which will
call down with a new ENQUEUE_DELAYED. Instead of further complicating
the wakeup conditional in enqueue_task(), identify migration contexts
instead and default to wakeup handling for all other cases.

Debugged-by-and-original-fix-by: K Prateek Nayak <kprateek.nayak@amd.com>
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Closes: https://lore.kernel.org/lkml/20240830123458.3557-1-spasswolf@web.de/
Closes: https://lore.kernel.org/all/cd67fbcd-d659-4822-bb90-7e8fbb40a856@molgen.mpg.de/
Link: https://lore.kernel.org/lkml/f82def74-a64a-4a05-c8d4-4eeb3e03d0c0@amd.com/
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 kernel/sched/core.c  | 12 +++++------
 kernel/sched/stats.h | 48 ++++++++++++++++++++++++++++++--------------
 2 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 88cbfc671fb6..527502a86ff9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2012,11 +2012,6 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & ENQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
-	if (!(flags & ENQUEUE_RESTORE)) {
-		sched_info_enqueue(rq, p);
-		psi_enqueue(p, (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED));
-	}
-
 	p->sched_class->enqueue_task(rq, p, flags);
 	/*
 	 * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
@@ -2024,6 +2019,11 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	 */
 	uclamp_rq_inc(rq, p);
 
+	if (!(flags & ENQUEUE_RESTORE)) {
+		sched_info_enqueue(rq, p);
+		psi_enqueue(p, flags & ENQUEUE_MIGRATED);
+	}
+
 	if (sched_core_enabled(rq))
 		sched_core_enqueue(rq, p);
 }
@@ -2041,7 +2041,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	if (!(flags & DEQUEUE_SAVE)) {
 		sched_info_dequeue(rq, p);
-		psi_dequeue(p, flags & DEQUEUE_SLEEP);
+		psi_dequeue(p, !(flags & DEQUEUE_SLEEP));
 	}
 
 	/*
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 237780aa3c53..767e098a3bd1 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -119,45 +119,63 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 /*
  * PSI tracks state that persists across sleeps, such as iowaits and
  * memory stalls. As a result, it has to distinguish between sleeps,
- * where a task's runnable state changes, and requeues, where a task
- * and its state are being moved between CPUs and runqueues.
+ * where a task's runnable state changes, and migrations, where a task
+ * and its runnable state are being moved between CPUs and runqueues.
+ *
+ * A notable case is a task whose dequeue is delayed. PSI considers
+ * those sleeping, but because they are still on the runqueue they can
+ * go through migration requeues. In this case, *sleeping* states need
+ * to be transferred.
  */
-static inline void psi_enqueue(struct task_struct *p, bool wakeup)
+static inline void psi_enqueue(struct task_struct *p, bool migrate)
 {
-	int clear = 0, set = TSK_RUNNING;
+	int clear = 0, set = 0;
 
 	if (static_branch_likely(&psi_disabled))
 		return;
 
-	if (p->in_memstall)
-		set |= TSK_MEMSTALL_RUNNING;
-
-	if (!wakeup) {
+	if (p->se.sched_delayed) {
+		/* CPU migration of "sleeping" task */
+		SCHED_WARN_ON(!migrate);
 		if (p->in_memstall)
 			set |= TSK_MEMSTALL;
+		if (p->in_iowait)
+			set |= TSK_IOWAIT;
+	} else if (migrate) {
+		/* CPU migration of runnable task */
+		set = TSK_RUNNING;
+		if (p->in_memstall)
+			set |= TSK_MEMSTALL | TSK_MEMSTALL_RUNNING;
 	} else {
+		/* Wakeup of new or sleeping task */
 		if (p->in_iowait)
 			clear |= TSK_IOWAIT;
+		set = TSK_RUNNING;
+		if (p->in_memstall)
+			set |= TSK_MEMSTALL_RUNNING;
 	}
 
 	psi_task_change(p, clear, set);
 }
 
-static inline void psi_dequeue(struct task_struct *p, bool sleep)
+static inline void psi_dequeue(struct task_struct *p, bool migrate)
 {
 	if (static_branch_likely(&psi_disabled))
 		return;
 
+	/*
+	 * When migrating a task to another CPU, clear all psi
+	 * state. The enqueue callback above will work it out.
+	 */
+	if (migrate)
+		psi_task_change(p, p->psi_flags, 0);
+
 	/*
 	 * A voluntary sleep is a dequeue followed by a task switch. To
 	 * avoid walking all ancestors twice, psi_task_switch() handles
 	 * TSK_RUNNING and TSK_IOWAIT for us when it moves TSK_ONCPU.
 	 * Do nothing here.
 	 */
-	if (sleep)
-		return;
-
-	psi_task_change(p, p->psi_flags, 0);
 }
 
 static inline void psi_ttwu_dequeue(struct task_struct *p)
@@ -190,8 +208,8 @@ static inline void psi_sched_switch(struct task_struct *prev,
 }
 
 #else /* CONFIG_PSI */
-static inline void psi_enqueue(struct task_struct *p, bool wakeup) {}
-static inline void psi_dequeue(struct task_struct *p, bool sleep) {}
+static inline void psi_enqueue(struct task_struct *p, bool migrate) {}
+static inline void psi_dequeue(struct task_struct *p, bool migrate) {}
 static inline void psi_ttwu_dequeue(struct task_struct *p) {}
 static inline void psi_sched_switch(struct task_struct *prev,
 				    struct task_struct *next,
-- 
2.46.2

