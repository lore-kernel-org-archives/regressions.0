Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C0390228
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880175; cv=none; b=mwqqe1hCUHIowe1h7ZpEzk9gMAePF8/AdcfPLUp7b5HkCgMu6TK5pmcW1PsqPoV8njYAPPMBL4vCUGxTufw/AycZZu/0/52i32nd6VsEPn39PMeqxD1R05q42io01CIsbV2LGuHVU5f4g8Z7UTQp1B5vR/rdbmgNTqwU5fBgccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880175; c=relaxed/simple;
	bh=AAAZFVhj4M6AwqpI8D2FcdqH9D6+YqkabJd9Ckj1TgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZkWNUGjWsx5u/+BBctsu+HnFs4XY+nURtPZ5tTlYgpD7Zl8ZUUJTuuCv4rYGtXdgIlINwry207yiF7/anJ4Et5RzPEQ0TMggxuaclH908IZN3ZWdIVlcgOPz1qwWKGwaL/954gh1e5ILt//sDGixKjqIs9ye1x+BAxwzlHsd3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=linQPxsp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZGdWOozz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="linQPxsp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZGdWOozz"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776880172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XBuWwkO3NKaYBu7YzCXDRbesX1p5yTsd+4/nZC8plvE=;
	b=linQPxspEWgh9AKcJWRoPaKpvSiDJh5h1gk9gUTPKmL7q94Bsy7QBtYRxj/1aJj5neA++a
	VrUXXlxahPvgBYIlH4uGkindBtH5d6w3r4209pqVYYe5D/J60RdLwES9goNVdVzd9EPLXA
	TpJ/DVYxTPtfqi2IN+IdvnD0Jf0mDaDAwfemBYYNxxcbm9+TMAKt/2WIoBQ79vyLmnlIWS
	/q3feELPwVvc+9/R+oiU5jWvGSUe+9QtfG26pM4Op1qZ/y20ZcIE/HXYLaLpPl/+ApFxfA
	5pGKPDC3y1EVMjuWBpyGLs/XnbYFS18lfuY3TUphW0KbxHMHjIX0ljz+lI2ZTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776880172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XBuWwkO3NKaYBu7YzCXDRbesX1p5yTsd+4/nZC8plvE=;
	b=ZGdWOozzrg59C1LUZXlaz64KuR3ie950K3dYDlOoK210mRnJ4Hn6kpeDV9txRGxSWFtp0F
	8ICPQussMlcrWeBg==
To: Mark Rutland <mark.rutland@arm.com>, Mathias Stearn <mathias@mongodb.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
Date: Wed, 22 Apr 2026 19:49:30 +0200
Message-ID: <87zf2u28d1.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 22 2026 at 14:09, Mark Rutland wrote:
> On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
>> TL;DR: As of 6.19, rseq no longer provides the documented atomicity
>> guarantees on arm64 by failing to abort the critical section on same-core
>> preemption/resumption. Additionally, it breaks tcmalloc specifically by
>> failing to overwrite the cpu_id_start field at points where it was relied
>> on for correctness.
>
> Thanks for the report, and the test case.
>
> As a holding reply, I'm looking into this now from the arm64 side.

I assume it's the partial conversion to the generic entry code which
screws that up. The problem reproduces with rseq selftests nicely.

The patch below fixes it as it puts ARM64 back to the non-optimized code
for now. Once ARM64 is fully converted it gets all the nice improvements.

Thanks,

        tglx
---
diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index 2266f4dc77b6..d55476e2a336 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -30,7 +30,7 @@ void __rseq_signal_deliver(int sig, struct pt_regs *regs);
  */
 static inline void rseq_signal_deliver(struct ksignal *ksig, struct pt_regs *regs)
 {
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		/* '&' is intentional to spare one conditional branch */
 		if (current->rseq.event.has_rseq & current->rseq.event.user_irq)
 			__rseq_signal_deliver(ksig->sig, regs);
@@ -50,7 +50,7 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
 {
 	struct rseq_event *ev = &t->rseq.event;
 
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		/*
 		 * Avoid a boat load of conditionals by using simple logic
 		 * to determine whether NOTIFY_RESUME needs to be raised.
diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index a36b472627de..8ccd464a108d 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -80,7 +80,7 @@ bool rseq_debug_validate_ids(struct task_struct *t);
 
 static __always_inline void rseq_note_user_irq_entry(void)
 {
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY))
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))
 		current->rseq.event.user_irq = true;
 }
 
@@ -171,8 +171,8 @@ bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
 		if (unlikely(usig != t->rseq.sig))
 			goto die;
 
-		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
-		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_ENTRY=y */
+		if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 			/* If not in interrupt from user context, let it die */
 			if (unlikely(!t->rseq.event.user_irq))
 				goto die;
@@ -387,7 +387,7 @@ static rseq_inline bool rseq_update_usr(struct task_struct *t, struct pt_regs *r
 	 * allows to skip the critical section when the entry was not from
 	 * a user space interrupt, unless debug mode is enabled.
 	 */
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		if (!static_branch_unlikely(&rseq_debug_enabled)) {
 			if (likely(!t->rseq.event.user_irq))
 				return true;
