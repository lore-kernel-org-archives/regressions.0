Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717F443C0F
	for <regressions@lists.linux.dev>; Wed,  7 Oct 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383406; cv=none; b=AefZOowu0JO+dc6W3bPNwTqWsEgzCHXSN7x+noRXCfuHdj1suW8B159crQJisYUWPBkjkscR5sDWuy/DfHaVHtG9SQDHWK6zGRfZ4BVESYBibjDH/QbsAaFTA3daCxuOBOEgCCeM+ZDDzOuhiNkFX6yV5ECqMfWGt2GH+SQCBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383406; c=relaxed/simple;
	bh=YdwXa+gYPV2xPSIZFSFUvZVHY6ZdJN0bSPvFhhGvJQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQtIov1001wgSYtIgmp1fQoIqYeDikz8EcJlSOwkwFrcSvvtW5wdlUBz2V1LhgecBZWrk71jHI19ILXqcJvmxhEqY5dz+SKTcDX0OnGH5qMpIrBmnGTZ9lX8kzX0Wy8kiwApQZEQ+svl/Aumwqh5gNmG2zVT16HHssueAAzOGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=d7DZedTW; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="d7DZedTW"
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791383398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gukTut55doiAIV/L2DTCknRd5UGNYzDqxIrYIRuSdpk=;
	b=d7DZedTWMsICLOFTGjrtaMLbnwqJpUgnLbby597Ebwcss8hqARWraf1AlFcRLmWBl+Uh1a
	cy72JTBb/8fR6wX5OtSiPwzIDVeIMXrRLcSXRQDuL296SGG5PzwQSYt1ipcuZ7OPdHeBQy
	cysEbg21/jDV94H7c44WwKnMPd+3dcE=
To: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sched/cputime: Don't account idle time twice after dyntick-idle
Date: Wed,  7 Oct 2026 16:29:50 +0200
Message-ID: <20261007142950.547604-1-stian@itx.no>
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
v3:
- Warn if now < tick_start (Frederic)
- Read and clear the overlap with plain accesses instead of
  __this_cpu_xchg() (Frederic)
- Store the forwarded expiry in ts->last_tick, so that the tick restart
  that follows does not forward it again (Frederic)
- Drop the tick_nohz_full_cpu() check, vtime_generic_enabled_this_cpu()
  covers it (Frederic)

Retested on the SPARC T7-1 and the x86_64 KVM guest, also with
nohz_full=1, without IRQ_TIME_ACCOUNTING and with highres=off. Same
results as v2.

v2: https://lore.kernel.org/all/20261005194010.168299-1-stian@itx.no/
v1: https://lore.kernel.org/all/20261004184701.4112237-1-stian@itx.no/

 include/linux/kernel_stat.h |  7 +++++--
 kernel/sched/cputime.c      | 39 +++++++++++++++++++++++++++++++------
 kernel/time/tick-sched.c    | 22 ++++++++++++++++-----
 3 files changed, 55 insertions(+), 13 deletions(-)

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
index 06bddaa738e52..faac7c2066d84 100644
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
@@ -468,18 +468,38 @@ static void kcpustat_idle_start(struct kernel_cpustat *kc, u64 now)
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
+		if (!WARN_ON_ONCE(now < tick_start))
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
+	struct kernel_cpustat *kc = kcpustat_this_cpu;
+	u64 overlap = kc->idle_tick_overlap;
+
+	kc->idle_tick_overlap = 0;
+	return overlap;
+}
+
 void kcpustat_dyntick_start(u64 now)
 {
 	struct kernel_cpustat *kc = kcpustat_this_cpu;
@@ -487,6 +507,7 @@ void kcpustat_dyntick_start(u64 now)
 	if (!vtime_generic_enabled_this_cpu()) {
 		vtime_dyntick_start();
 		kc->idle_dyntick = true;
+		kc->idle_dyntick_entry = now;
 		kcpustat_idle_start(kc, now);
 	}
 }
@@ -555,6 +576,11 @@ u64 kcpustat_field_iowait(int cpu)
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
@@ -695,12 +721,13 @@ void account_process_tick(struct task_struct *p, int user_tick)
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
index 6c3fea3867139..4e293f81e4dc1 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -763,12 +763,18 @@ static ktime_t tick_forward_now(ktime_t expires, ktime_t now)
 	return expires + TICK_NSEC;
 }
 
+static void tick_nohz_forward_last_tick(struct tick_sched *ts, ktime_t now)
+{
+	if (now >= ts->last_tick)
+		ts->last_tick = tick_forward_now(ts->last_tick, now);
+}
+
 static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
 {
-	ktime_t expires = ts->last_tick;
+	ktime_t expires;
 
-	if (now >= expires)
-		expires = tick_forward_now(expires, now);
+	tick_nohz_forward_last_tick(ts, now);
+	expires = ts->last_tick;
 
 	if (tick_sched_flag_test(ts, TS_FLAG_HIGHRES)) {
 		hrtimer_start(&ts->sched_timer,	expires, HRTIMER_MODE_ABS_PINNED_HARD);
@@ -1329,6 +1335,12 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
 	return ts->idle_calls;
 }
 
+static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
+{
+	tick_nohz_forward_last_tick(ts, now);
+	kcpustat_dyntick_stop(now, ts->last_tick - TICK_NSEC);
+}
+
 void tick_nohz_idle_restart_tick(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
@@ -1341,7 +1353,7 @@ void tick_nohz_idle_restart_tick(void)
 		 * no tiny amount of idle time is accounted twice.
 		 */
 		ts->idle_entrytime = ktime_get();
-		kcpustat_dyntick_stop(ts->idle_entrytime);
+		tick_nohz_dyntick_stop(ts, ts->idle_entrytime);
 		tick_nohz_restart_sched_tick(ts, ts->idle_entrytime);
 	}
 }
@@ -1385,7 +1397,7 @@ void tick_nohz_idle_exit(void)
 
 	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
 		now = ktime_get();
-		kcpustat_dyntick_stop(now);
+		tick_nohz_dyntick_stop(ts, now);
 		tick_nohz_idle_update_tick(ts, now);
 	}
 
-- 
2.43.0

