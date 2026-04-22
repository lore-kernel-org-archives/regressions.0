Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF03383C7F
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881512; cv=none; b=LRklZReb9HeT+UXzwtzosiUf5OlEc/ZDIoIQiuEEEdN2n4cowArmYb5pJLTsrRVA86juyvJ7xWtkPhkhPSO1RviglPfm8Z/XpQh10ocXrVuw0bZl/paVytgInv3UxpvNjpnHIRg8DjhnYLsExQxzZY7JONfM/aMXpcpiMLjKw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881512; c=relaxed/simple;
	bh=TDugs+cg46R+X6jcBPF7ltfwuZFM53fWiH07iwOk2J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2hwYkfgmUzTydDNUtWl0ld4UroFOZ586Re3cqVYp4caleuZOI6GQnbuWIqbRve2SSIPQu6e2KSYLqWi7KCd80PdMsNo1WWA08Zo6ATXIi2DRm9oBqUmBxVHS5BL5Bp63xcJkQdqIdm0uElrjN8M+4zJehL88PmYC5cGByX5ytc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dNOCNazD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dNOCNazD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B99F2F;
	Wed, 22 Apr 2026 11:11:44 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C483F641;
	Wed, 22 Apr 2026 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776881509; bh=TDugs+cg46R+X6jcBPF7ltfwuZFM53fWiH07iwOk2J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNOCNazDIbHDsRYqsET6kbbkSTuk3HcseBT89m7Cqc1j4DCjf3NXy8HYu/3UWJJWl
	 y6h9PCqCj5bOvifPEFqxvDbvphrfHagEXPsM0X+/rC0hOzFHjf3Ud+Wj40lYkVmG6q
	 xzdIN86a9xjoGKSWjinI4dF/zWSOvqx/lQWH07aU=
Date: Wed, 22 Apr 2026 19:11:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathias Stearn <mathias@mongodb.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
 <87zf2u28d1.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf2u28d1.ffs@tglx>

On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 22 2026 at 14:09, Mark Rutland wrote:
> > On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> >> TL;DR: As of 6.19, rseq no longer provides the documented atomicity
> >> guarantees on arm64 by failing to abort the critical section on same-core
> >> preemption/resumption. Additionally, it breaks tcmalloc specifically by
> >> failing to overwrite the cpu_id_start field at points where it was relied
> >> on for correctness.
> >
> > Thanks for the report, and the test case.
> >
> > As a holding reply, I'm looking into this now from the arm64 side.
> 
> I assume it's the partial conversion to the generic entry code which
> screws that up. 

It's slightly more than that, but in a sense, yes. ;)

The fix is conceptually simple, but I'll need to do some refactoring.

Conceptually we just need to use syscall_enter_from_user_mode() and
irqentry_enter_from_user_mode() appropriately.

In practice, I can't use those as-is without introducing the exception
masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
so I'll need to do some similar refactoring first.

That and I *think* a couple of of the current checks for CONFIG_GENERIC_ENTRY
should be checking CONFIG_GENERIC_IRQ_ENTRY, since all of the relevant
bits are in the generic irqentry code rather than the GENERIC_SYSCALL
code (and GENERIC_ENTRY is just GENERIC_IRQ_ENTRY + GENERIC_SYSCALL).

> The problem reproduces with rseq selftests nicely.

Ah; that's both good to know, and worrying that we've never had a report
from all the automated testing people are supposedly running. :/

> The patch below fixes it as it puts ARM64 back to the non-optimized code
> for now. Once ARM64 is fully converted it gets all the nice improvements.

Thanks; I'll give that a test tomorrow.

I haven't paged everything in yet, so just to cehck, is there anything
that would behave incorrectly if current->rseq.event.user_irq were set
for syscall entry? IIUC it means we'll effectively do the slow path, and
I was wondering if that might be acceptable as a one-line bodge for
stable.

As above, I'd like if the actual fix could make this work for
GENERIC_IRQ_ENTRY rather than GENERIC_ENTRY, since that way we can make
this work as it was supposed to *before* moving to GENERIC_SYSCALL
(which has a whole lot more ABI impact to worry about).

I think that just needs a small amount of refactoring that arm64 will
need regardless.

Mark.

> 
> Thanks,
> 
>         tglx
> ---
> diff --git a/include/linux/rseq.h b/include/linux/rseq.h
> index 2266f4dc77b6..d55476e2a336 100644
> --- a/include/linux/rseq.h
> +++ b/include/linux/rseq.h
> @@ -30,7 +30,7 @@ void __rseq_signal_deliver(int sig, struct pt_regs *regs);
>   */
>  static inline void rseq_signal_deliver(struct ksignal *ksig, struct pt_regs *regs)
>  {
> -	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
>  		/* '&' is intentional to spare one conditional branch */
>  		if (current->rseq.event.has_rseq & current->rseq.event.user_irq)
>  			__rseq_signal_deliver(ksig->sig, regs);
> @@ -50,7 +50,7 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
>  {
>  	struct rseq_event *ev = &t->rseq.event;
>  
> -	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
>  		/*
>  		 * Avoid a boat load of conditionals by using simple logic
>  		 * to determine whether NOTIFY_RESUME needs to be raised.
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index a36b472627de..8ccd464a108d 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -80,7 +80,7 @@ bool rseq_debug_validate_ids(struct task_struct *t);
>  
>  static __always_inline void rseq_note_user_irq_entry(void)
>  {
> -	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY))
> +	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))
>  		current->rseq.event.user_irq = true;
>  }
>  
> @@ -171,8 +171,8 @@ bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
>  		if (unlikely(usig != t->rseq.sig))
>  			goto die;
>  
> -		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
> -		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_ENTRY=y */
> +		if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
>  			/* If not in interrupt from user context, let it die */
>  			if (unlikely(!t->rseq.event.user_irq))
>  				goto die;
> @@ -387,7 +387,7 @@ static rseq_inline bool rseq_update_usr(struct task_struct *t, struct pt_regs *r
>  	 * allows to skip the critical section when the entry was not from
>  	 * a user space interrupt, unless debug mode is enabled.
>  	 */
> -	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
>  		if (!static_branch_unlikely(&rseq_debug_enabled)) {
>  			if (likely(!t->rseq.event.user_irq))
>  				return true;
