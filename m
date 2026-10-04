Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C203F58D6
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139639; cv=none; b=G3DHjiX5IYaLHdnvnHIoI2p7rZL7i2kiM1hsXK2bF4ymF8u8qxr2Rm5279e/S28/SLRXcDr8qUpBgalPebcmqYDGIhV9XFy5ttL0ozAkIxUz01l3ZqPpzkoHGOyK5tSyu+A2xSMllWjIF2WcG8J3BzYoJqhJDOq0Co4k7SeAOYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139639; c=relaxed/simple;
	bh=Ri5tY/ymuqDerSHUUNxj6ieE/B3Q9TV8b6vqDFbh680=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL7nYaENdYWzkI2+36VwnxVXDLO5Bxo7LOiCWqoNroD7u9TBoYVAwcB4btftYo7h2EfLrm+xjlOPqCw5WjLcpOrLGjogI+EE2IURLazhcr3vUm1MWSt0iZyUu4PdEwu8OXBkKqbJpe3/D0JJXm7INjGoTB1CLvSGT0c/7FU/ixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=h5lw1CI5; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="h5lw1CI5"
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791139634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shW9J6EtWdFWpHQ0j5m5jWKBM8EkLVa0bnNSZAHXgmg=;
	b=h5lw1CI5CdmnyFWiMgSbC4gikEmTTD7CgsSJ2Pe4GfD5XeBuecBy50t3Nx3b1VqZpo4Yf8
	SeUX7Y7Jujg2jnaNDivIZal2dmEZ1rBPXfW3Rd6+HDwbF2kA7ne1baTJMSDL4qhDdtTU06
	Ac1bNErAS+X+SXzXRptlIF8Pejz4i4I=
To: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/cputime: Don't account idle time twice after dyntick-idle
Date: Sun,  4 Oct 2026 20:47:01 +0200
Message-ID: <20261004184701.4112237-1-stian@itx.no>
In-Reply-To: <20261004142724.3896396-1-stian@itx.no>
References: <20261004142724.3896396-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On idle exit the dyntick-idle accounting accounts the time up to now,
then the tick is restarted on its old period. The first tick accounts a
whole TICK_NSEC to whatever runs, although the part of that period
before the idle exit has just been accounted as idle time, or with
IRQ_TIME_ACCOUNTING as IRQ time. That is up to a full tick per idle
exit, and /proc/stat reports more idle time than wall time.

Record how much of the tick period had passed since the tick was
stopped, and leave it out of the first tick.

Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
Link: https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
Signed-off-by: Stian Halseth <stian@itx.no>
---
Tested by comparing /proc/stat with CLOCK_MONOTONIC per CPU over 30 to
60 s, with a task on one CPU that sleeps in a loop. Total CPU time per
wall second on that CPU:

                                         before   after
  SPARC T7-1, HZ=100, busiest CPU*       1.44     1.0000
  SPARC T7-1, HZ=100, 3.7 ms sleeps               1.0001
  SPARC T7-1, HZ=100, 25 ms sleeps                0.9996
  Opteron, HZ=1000, 3.7 ms sleeps        1.131    0.999
  x86_64 KVM guest, HZ=250, 3.7 ms       1.53     0.998
  same guest, 9 ms sleeps                1.195    0.982

  * under its normal load, about 95 tick stops/s

The guest was tested with and without IRQ_TIME_ACCOUNTING, with
highres=off, with steal time from a busy loop on the host CPU, and with
a test-only change that forces tick_nohz_idle_restart_tick() on every
idle loop iteration with the tick stopped.

The -1.8% left with long sleeps in the guest is time between an idle
tick's expiry and its delivery to the halted vCPU, which nothing
accounts. The summed lateness of those ticks matches it within 2 ms/s,
or within 8 ms/s with steal time, also with highres=off. It is there
without this patch as well, where the double counting hides it. On the
T7-1 it is within noise.

With 3.7 ms sleeps and steal time, +0.3% to +1.3% is left, which I
have not explained.

 include/linux/kernel_stat.h |  6 ++++--
 kernel/sched/cputime.c      | 31 +++++++++++++++++++++++++------
 kernel/time/tick-sched.c    | 23 ++++++++++++++++++++---
 3 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index 9ca6c2259dfea..950867deea29f 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -40,6 +40,8 @@ struct kernel_cpustat {
 	seqcount_t	idle_sleeptime_seq;
 	u64		idle_entrytime;
 	u64		idle_stealtime[2];
+	u64		idle_dyntick_entry;
+	u64		idle_tick_overlap;
 #endif
 	u64		cpustat[NR_STATS];
 };
@@ -111,7 +113,7 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
 #ifdef CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE
 
 static inline void kcpustat_dyntick_start(u64 now) { }
-static inline void kcpustat_dyntick_stop(u64 now) { }
+static inline void kcpustat_dyntick_stop(u64 now, u64 tick_start) { }
 static inline void kcpustat_irq_enter(u64 now) { }
 static inline void kcpustat_irq_exit(u64 now) { }
 static inline bool kcpustat_idle_dyntick(void) { return false; }
@@ -132,7 +134,7 @@ static inline u64 kcpustat_field_iowait(int cpu)
 #else /* !CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE */
 
 extern void kcpustat_dyntick_start(u64 now);
-extern void kcpustat_dyntick_stop(u64 now);
+extern void kcpustat_dyntick_stop(u64 now, u64 tick_start);
 extern void kcpustat_irq_enter(u64 now);
 extern void kcpustat_irq_exit(u64 now);
 extern u64 kcpustat_field_idle(int cpu);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e52..9205e92680943 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -358,6 +358,19 @@ void thread_group_cputime(struct task_struct *tsk, struct task_cputime *times)
 	}
 }
 
+/*
+ * The first tick after dyntick-idle covers a period that the dyntick-idle
+ * accounting may already have accounted up to the idle exit.
+ */
+static u64 tick_cputime(void)
+{
+#if defined(CONFIG_NO_HZ_COMMON) && !defined(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE)
+	return TICK_NSEC - __this_cpu_xchg(kernel_cpustat.idle_tick_overlap, 0);
+#else
+	return TICK_NSEC;
+#endif
+}
+
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 /*
  * Account a tick to a process and cpustat
@@ -381,9 +394,9 @@ void thread_group_cputime(struct task_struct *tsk, struct task_cputime *times)
  * softirq as those do not count in task exec_runtime any more.
  */
 static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
-					 int ticks)
+					 u64 cputime)
 {
-	u64 other, cputime = TICK_NSEC * ticks;
+	u64 other;
 
 	/*
 	 * When returning from idle, many ticks can get accounted at
@@ -418,7 +431,7 @@ static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 
 #else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 static inline void irqtime_account_process_tick(struct task_struct *p, int user_tick,
-						int nr_ticks) { }
+						u64 cputime) { }
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
 #if defined(CONFIG_NO_HZ_COMMON) && !defined(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE)
@@ -468,12 +481,15 @@ static void kcpustat_idle_start(struct kernel_cpustat *kc, u64 now)
 	write_seqcount_end(&kc->idle_sleeptime_seq);
 }
 
-void kcpustat_dyntick_stop(u64 now)
+void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 {
 	struct kernel_cpustat *kc = kcpustat_this_cpu;
 
 	if (!vtime_generic_enabled_this_cpu()) {
 		WARN_ON_ONCE(!kc->idle_dyntick);
+		tick_start = max(tick_start, kc->idle_dyntick_entry);
+		if (now > tick_start)
+			kc->idle_tick_overlap = now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick = false;
 		vtime_dyntick_stop();
@@ -487,6 +503,8 @@ void kcpustat_dyntick_start(u64 now)
 	if (!vtime_generic_enabled_this_cpu()) {
 		vtime_dyntick_start();
 		kc->idle_dyntick = true;
+		kc->idle_dyntick_entry = now;
+		kc->idle_tick_overlap = 0;
 		kcpustat_idle_start(kc, now);
 	}
 }
@@ -695,12 +713,13 @@ void account_process_tick(struct task_struct *p, int user_tick)
 	if (kcpustat_idle_dyntick())
 		return;
 
+	cputime = tick_cputime();
+
 	if (irqtime_enabled()) {
-		irqtime_account_process_tick(p, user_tick, 1);
+		irqtime_account_process_tick(p, user_tick, cputime);
 		return;
 	}
 
-	cputime = TICK_NSEC;
 	steal = steal_account_process_time(ULONG_MAX);
 
 	if (steal >= cputime)
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea3867139..1c5cefbb10812 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -763,13 +763,20 @@ static ktime_t tick_forward_now(ktime_t expires, ktime_t now)
 	return expires + TICK_NSEC;
 }
 
-static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
+static ktime_t tick_nohz_restart_expires(struct tick_sched *ts, ktime_t now)
 {
 	ktime_t expires = ts->last_tick;
 
 	if (now >= expires)
 		expires = tick_forward_now(expires, now);
 
+	return expires;
+}
+
+static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
+{
+	ktime_t expires = tick_nohz_restart_expires(ts, now);
+
 	if (tick_sched_flag_test(ts, TS_FLAG_HIGHRES)) {
 		hrtimer_start(&ts->sched_timer,	expires, HRTIMER_MODE_ABS_PINNED_HARD);
 	} else {
@@ -1329,6 +1336,16 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
 	return ts->idle_calls;
 }
 
+static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
+{
+	ktime_t tick_start = now;
+
+	if (!tick_nohz_full_cpu(smp_processor_id()))
+		tick_start = tick_nohz_restart_expires(ts, now) - TICK_NSEC;
+
+	kcpustat_dyntick_stop(now, tick_start);
+}
+
 void tick_nohz_idle_restart_tick(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
@@ -1341,7 +1358,7 @@ void tick_nohz_idle_restart_tick(void)
 		 * no tiny amount of idle time is accounted twice.
 		 */
 		ts->idle_entrytime = ktime_get();
-		kcpustat_dyntick_stop(ts->idle_entrytime);
+		tick_nohz_dyntick_stop(ts, ts->idle_entrytime);
 		tick_nohz_restart_sched_tick(ts, ts->idle_entrytime);
 	}
 }
@@ -1385,7 +1402,7 @@ void tick_nohz_idle_exit(void)
 
 	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
 		now = ktime_get();
-		kcpustat_dyntick_stop(now);
+		tick_nohz_dyntick_stop(ts, now);
 		tick_nohz_idle_update_tick(ts, now);
 	}
 

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

