Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08934D4CE
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229229; cv=none; b=NZMI4EFDcH3bhv8gzT48vKN2IAAcfUwpCxczaUW/Wsnb0OxdmTeoUnjsSIg5eV+kEKz1fs+Fito9Py7+cH6MpYIAUdB8HspUttRv2ba29iiFEjXgSIBI0y9O50cNBCcQmojtfobVCgl8n5lzWfWth2cQlNXe8tySP7TBJVTNU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229229; c=relaxed/simple;
	bh=+V2yOU+IEx2bRGNa7AKhNr+tqi17KL3zZ8Qi4Qd+OpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXmtfCFzx2HKRaY8bn+yF2ITBXjqVqlVPWQ7VL8M5zcRZhux0dnyiAV7yH5iA7EfWELDriFLPUU1dni3Ed3gSZLlQzHs8+uGcr5Egko1XBXvn2xFSxxXFM9zwJipx/+VGP9do4BMRwycgXzghvLbwecQpOZijSD3se+mblvSpDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=V/Lo2cS3; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="V/Lo2cS3"
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791229219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RXXaTH0thaDIWQ2rIWXTHhz8bvjMei03oLIjkgt3krU=;
	b=V/Lo2cS3jLLjRugz+6/LqJ5sVr5kw09XkZ8HR+CdrdXqwgmw9C/oYfeFQ4kiZcSG5tZRpL
	zxY8b3M/P4nU6yib7aiUeminU31Z7PAUNfJL65MSmgYWddPHjnZAOUlQPui0AGtJa52PW7
	eVI6Sddqyj9r4zyIIktgQZpMUBKEjH0=
To: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/cputime: Don't account idle time twice after dyntick-idle
Date: Mon,  5 Oct 2026 21:40:10 +0200
Message-ID: <20261005194010.168299-1-stian@itx.no>
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

Record how much of the current tick period dyntick-idle has accounted,
and leave it out of the tick that ends the period.

Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
Link: https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
Signed-off-by: Stian Halseth <stian@itx.no>
---
v2:
- Keep the overlap per tick period, so that a second dyntick-idle
  period before the tick adds to it instead of replacing it (Frederic)
- Read it through a helper in the NO_HZ_COMMON block, with a stub in
  its #else, like kcpustat_field_dyntick(). IS_ENABLED() does not build,
  as the field only exists with NO_HZ_COMMON. The helper is static
  inline, as there is no user with VIRT_CPU_ACCOUNTING_NATIVE.

Frederic's case does not happen in my tests on its own. Since
f4c31b07b136 ("sched: idle: Consolidate the handling of two special
cases"), without a cpuidle driver or with a single state, the tick is
only stopped after it woke up the idle loop, and that tick takes the
overlap first. With a test-only change that stops the tick on every
idle entry, as a governor may, the guest added to a pending overlap
about 900 times a second under a pipe ping-pong between two CPUs.

So it is not what is left with steal time. That is the same with v2,
+0.7% to +1.4%, and only shows when the task also spins for 1 ms after
each wakeup.

Total CPU time per wall second on the loaded CPU, v2:

  SPARC T7-1, HZ=100, busiest CPU*       1.0001
  SPARC T7-1, HZ=100, 3.7 ms sleeps      1.0000
  SPARC T7-1, HZ=100, 25 ms sleeps       0.9998
  SPARC T7-1, HZ=100, pipe ping-pong     1.0000
  x86_64 KVM guest, HZ=250, 3.7 ms       0.997  (1.505 before)
  same guest, pipe ping-pong             1.000  (1.152 before)
  same guest, 9 ms sleeps                0.985

  * under its normal load, about 90 tick stops/s

The guest was tested as for v1, with and without IRQ_TIME_ACCOUNTING,
with highres=off, with steal time and with the forced restart path. The
-1.5% with 9 ms sleeps is the late tick delivery described in v1.

v1: https://lore.kernel.org/all/20261004184701.4112237-1-stian@itx.no/

 include/linux/kernel_stat.h |  7 +++++--
 kernel/sched/cputime.c      | 35 +++++++++++++++++++++++++++++------
 kernel/time/tick-sched.c    | 23 ++++++++++++++++++++---
 3 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index 9ca6c2259dfea..6e252048b5ade 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -40,6 +40,9 @@ struct kernel_cpustat {
 	seqcount_t	idle_sleeptime_seq;
 	u64		idle_entrytime;
 	u64		idle_stealtime[2];
+	u64		idle_dyntick_entry;
+	u64		idle_tick_period;
+	u64		idle_tick_overlap;
 #endif
 	u64		cpustat[NR_STATS];
 };
@@ -111,7 +114,7 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
 #ifdef CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE
 
 static inline void kcpustat_dyntick_start(u64 now) { }
-static inline void kcpustat_dyntick_stop(u64 now) { }
+static inline void kcpustat_dyntick_stop(u64 now, u64 tick_start) { }
 static inline void kcpustat_irq_enter(u64 now) { }
 static inline void kcpustat_irq_exit(u64 now) { }
 static inline bool kcpustat_idle_dyntick(void) { return false; }
@@ -132,7 +135,7 @@ static inline u64 kcpustat_field_iowait(int cpu)
 #else /* !CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE */
 
 extern void kcpustat_dyntick_start(u64 now);
-extern void kcpustat_dyntick_stop(u64 now);
+extern void kcpustat_dyntick_stop(u64 now, u64 tick_start);
 extern void kcpustat_irq_enter(u64 now);
 extern void kcpustat_irq_exit(u64 now);
 extern u64 kcpustat_field_idle(int cpu);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e52..3c6185e9e0963 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -381,9 +381,9 @@ void thread_group_cputime(struct task_struct *tsk, struct task_cputime *times)
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
@@ -418,7 +418,7 @@ static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 
 #else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 static inline void irqtime_account_process_tick(struct task_struct *p, int user_tick,
-						int nr_ticks) { }
+						u64 cputime) { }
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
 #if defined(CONFIG_NO_HZ_COMMON) && !defined(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE)
@@ -468,18 +468,34 @@ static void kcpustat_idle_start(struct kernel_cpustat *kc, u64 now)
 	write_seqcount_end(&kc->idle_sleeptime_seq);
 }
 
-void kcpustat_dyntick_stop(u64 now)
+void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 {
 	struct kernel_cpustat *kc = kcpustat_this_cpu;
 
 	if (!vtime_generic_enabled_this_cpu()) {
 		WARN_ON_ONCE(!kc->idle_dyntick);
+		if (kc->idle_tick_period != tick_start) {
+			kc->idle_tick_period = tick_start;
+			kc->idle_tick_overlap = 0;
+		}
+		tick_start = max(tick_start, kc->idle_dyntick_entry);
+		if (now > tick_start)
+			kc->idle_tick_overlap += now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick = false;
 		vtime_dyntick_stop();
 	}
 }
 
+/*
+ * The first tick after dyntick-idle covers a period that the dyntick-idle
+ * accounting may already have accounted in part.
+ */
+static inline u64 kcpustat_tick_overlap(void)
+{
+	return __this_cpu_xchg(kernel_cpustat.idle_tick_overlap, 0);
+}
+
 void kcpustat_dyntick_start(u64 now)
 {
 	struct kernel_cpustat *kc = kcpustat_this_cpu;
@@ -487,6 +503,7 @@ void kcpustat_dyntick_start(u64 now)
 	if (!vtime_generic_enabled_this_cpu()) {
 		vtime_dyntick_start();
 		kc->idle_dyntick = true;
+		kc->idle_dyntick_entry = now;
 		kcpustat_idle_start(kc, now);
 	}
 }
@@ -555,6 +572,11 @@ u64 kcpustat_field_iowait(int cpu)
 }
 EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
 #else
+static inline u64 kcpustat_tick_overlap(void)
+{
+	return 0;
+}
+
 static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
 				  bool compute_delta, ktime_t now)
 {
@@ -695,12 +717,13 @@ void account_process_tick(struct task_struct *p, int user_tick)
 	if (kcpustat_idle_dyntick())
 		return;
 
+	cputime = TICK_NSEC - kcpustat_tick_overlap();
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
 
-- 
2.43.0

