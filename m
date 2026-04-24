Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B80D3382F1
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049119; cv=none; b=JNYQVYRoxqddSbHyzwc5BJxrVjNgJ3RHW9mmUkBkNl4q+9eREGRP/3xfT8WAsR9fFvI0iqaJtBdmcw/JrAexGNfo+ILSu+Kyiwhpd3oH/SFGJqVN06Io3dWvvFydnBpe5JCDWTnw4OWJY4xjk0VqHKozEHduGLvFAzC3THdcbj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049119; c=relaxed/simple;
	bh=NNSj0/hf7tQ6PJoG7h7+22StFVVEM/2F5mFaH+ZLITA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahcmMRSxIC1iqhbmZwupPkhjvf2+aJkLEKi+U/ngixOamJLGsWhIngcSTd9NYdDb4Z76z8jQkQ2eGu33ZpDERVOe7/jVU/0nHpk33CX4rbYMZbAUaoDRL1h9hh3dya8pYW9p+OSGKt73Zwz3Kz8Q43afN148OZq4q3rKKVRGMG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Rbv0USdu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Rbv0USdu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5459F1BB2;
	Fri, 24 Apr 2026 09:45:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 950763FAA1;
	Fri, 24 Apr 2026 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777049116; bh=NNSj0/hf7tQ6PJoG7h7+22StFVVEM/2F5mFaH+ZLITA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rbv0USduzEorHSW2inheR/4Y4ysBS5NfxbFI5nI/XXSaUiC3dSLiTsJzm6/aSqPQa
	 B8rqSzUiBZYURyAe+01mfDZav/sLCyClsK5bumX2UXRhKGKdzUvAoHNaAEvRWQIDOb
	 mu1HddRUhOAFqOE/9PB3078zA/0vhLAFBSRuiuX4=
Date: Fri, 24 Apr 2026 17:45:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mathias Stearn <mathias@mongodb.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness (was: Re:
 [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64) and
 tcmalloc everywhere
Message-ID: <aeueE1I1OuVkOcEZ@J2N7QTR9R3>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>

Patch for the arm64-specific issue below. This doesn't fix the generic
cpu_id_start issue, but it brings arm64 into line with everyone else,
and it's the shape we'll need going forwards for other stuff anyway.

I've given it light testing with Mathias's reproducer and the
kselftests, which all pass.

I've also pushed it to my arm64/rseq branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/rseq

Mark.

---->8----
From 79b65cbbfa20aa2cb0bc248591fab5459cdc101b Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Thu, 23 Apr 2026 16:51:12 +0100
Subject: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness

Mathias Stearn reports that since v6.19, there are two big issues
affecting rseq:

(1) On arm64 specifically, rseq critical sections aren't aborted when
    they should be.

(2) The 'cpu_id_start' field is no longer written by the kernel in all
    cases it used to be, including some cases where TCMalloc depends on
    the kernel clobbering the field.

This patch fixes issue #1. This patch DOES NOT fix issue #2, which will
need to be addressed by other patches.

The arm64-specific brokenness is a result of commits:

  2fc0e4b4126c ("rseq: Record interrupt from user space")
  39a167560a61 ("rseq: Optimize event setting")

The first commit failed to add a call to rseq_note_user_irq_entry() on
arm64. Thus arm64 never sets rseq_event::user_irq to record that it may
be necessary to abort an active rseq critical section upon return to
userspace. On its own, this commit had no functional impact as the value
of rseq_event::user_irq was not consumed.

The second commit relied upon rseq_event::user_irq to determine whether
or not to bother to perform rseq work when returning to userspace. As
rseq_event::user_irq wasn't set on arm64, this work would be skipped,
and consequently an active rseq critical section would not be aborted.

Fix this by giving arm64 syscall-specific entry/exit paths, and
performing the relevant logic in syscall and non-syscall paths,
including calling rseq_note_user_irq_entry() for non-syscall entry.

Currently arm64 cannot use syscall_enter_from_user_mode(),
syscall_exit_to_user_mode(), and irqentry_exit_to_user_mode(), due to
ordering constraints with exception masking, and risk of ABI breakage
for syscall tracing/audit/etc. For the moment the entry/exit logic is
left as arm64-specific, but mirroring the generic code.

I intend to follow up with refactoring/cleanup, as we did for kernel
mode entry paths in commit:

  041aa7a85390 ("entry: Split preemption from irqentry_exit_to_kernel_mode()")

... which will allow arm64 to use the GENERIC_IRQ_ENTRY functions directly.

Fixes: 39a167560a61 ("rseq: Optimize event setting")
Reported-by: Mathias Stearn <mathias@mongodb.com>
Link: https://lore.kernel.org/regressions/CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com/
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Chris Kennelly <ckennelly@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 29 ++++++++++++++++++++++-------
 include/linux/irq-entry-common.h |  8 --------
 include/linux/rseq_entry.h       | 19 -------------------
 3 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index cb54335465f66..65ade1f1544f6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -62,6 +62,12 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
+static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
+{
+	enter_from_user_mode(regs);
+	mte_disable_tco_entry(current);
+}
+
 /*
  * Handle IRQ/context state management when entering from user mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -70,20 +76,29 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
+	rseq_note_user_irq_entry();
 	mte_disable_tco_entry(current);
 	sme_enter_from_user_mode();
 }
 
+static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	local_irq_disable();
+	syscall_exit_to_user_mode_prepare(regs);
+	local_daif_mask();
+	mte_check_tfsr_exit();
+	exit_to_user_mode();
+}
+
 /*
  * Handle IRQ/context state management when exiting to user mode.
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-
 static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 {
 	local_irq_disable();
-	exit_to_user_mode_prepare_legacy(regs);
+	irqentry_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	sme_exit_to_user_mode();
 	mte_check_tfsr_exit();
@@ -92,7 +107,7 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 
 asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
 {
-	arm64_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs);
 }
 
 /*
@@ -716,12 +731,12 @@ static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc(regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs);
 	fpsimd_syscall_exit();
 }
 
@@ -868,11 +883,11 @@ static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc_compat(regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 167fba7dbf043..1fabf0f5ea8e7 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -218,14 +218,6 @@ static __always_inline void __exit_to_user_mode_validate(void)
 	lockdep_sys_exit();
 }
 
-/* Temporary workaround to keep ARM64 alive */
-static __always_inline void exit_to_user_mode_prepare_legacy(struct pt_regs *regs)
-{
-	__exit_to_user_mode_prepare(regs, EXIT_TO_USER_MODE_WORK);
-	rseq_exit_to_user_mode_legacy();
-	__exit_to_user_mode_validate();
-}
-
 /**
  * syscall_exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
  * @regs:	Pointer to pt_regs on entry stack
diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index f11ebd34f8b95..a3762410c4ab6 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -753,24 +753,6 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
 	ev->events = 0;
 }
 
-/* Required to keep ARM64 working */
-static __always_inline void rseq_exit_to_user_mode_legacy(void)
-{
-	struct rseq_event *ev = &current->rseq.event;
-
-	rseq_stat_inc(rseq_stats.exit);
-
-	if (static_branch_unlikely(&rseq_debug_enabled))
-		WARN_ON_ONCE(ev->sched_switch);
-
-	/*
-	 * Ensure that event (especially user_irq) is cleared when the
-	 * interrupt did not result in a schedule and therefore the
-	 * rseq processing did not clear it.
-	 */
-	ev->events = 0;
-}
-
 void __rseq_debug_syscall_return(struct pt_regs *regs);
 
 static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
@@ -786,7 +768,6 @@ static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned
 }
 static inline void rseq_syscall_exit_to_user_mode(void) { }
 static inline void rseq_irqentry_exit_to_user_mode(void) { }
-static inline void rseq_exit_to_user_mode_legacy(void) { }
 static inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
 static inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
 #endif /* !CONFIG_RSEQ */
-- 
2.30.2

