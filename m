Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B622173D
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340404; cv=none; b=azX2vA4PCwi4eoVmy9Nk1e8kQgkmt8RzGAmxlfdlTg1VfCZ6zF2SLdIqQgaeguG9MxU7z0Dlx5r8brqIUfby8QhBCd430Jf9X7sw+ORBsWLvESIMqz1A30BQD92Xm39Cvhy2GAHVZr17P70uMtuZ75fDQtLhMJInglTGWl8l/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340404; c=relaxed/simple;
	bh=WU3xe617abCKg9Yttm94QPXbifhoZSFuJ/Z3RtgJMpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SR+9Rlx88gvqkpaxyPsJdmM8c/3lqMRnYTLciPRWtIxRPXeOFh2Y0r8HBDlrIGQze5WlgnqHXc2Ma6jKJsfu4/7BQ5kH5BdSG7NpKwg3nxUtzWJKJ3ROVJlQ7kAkzo6keW7qfKIs4hqpv62hHoYCoMjagT9ZIBJpWA/NLl+T+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2g9cc0h5; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2g9cc0h5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pDwE7wKYwD2f44L+Z40JlpqwY3yuoiet96aLvALDJ2Q=;
	b=2g9cc0h5sJhPNGXrtQekeUfyBTMUhgD61nVvAKAhMN/QhZYMJvzsUGXtwzr2vMmouS8qizPXv
	JiVu6mMAyJoJKiQssKDXpY7ia3J0HE7oC3kCkF/7ptvyVOAtYAd4uiA7WMqtrzi2dGeh2PR6oME
	SLigfb+DOMg1DboE/0xZMn4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g4NHR4L15zpSwg;
	Tue, 28 Apr 2026 09:33:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 339824048F;
	Tue, 28 Apr 2026 09:39:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Apr 2026 09:39:57 +0800
Message-ID: <21b50a60-0cbf-43ee-b6d1-318cba206aea@huawei.com>
Date: Tue, 28 Apr 2026 09:39:56 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness
To: Mark Rutland <mark.rutland@arm.com>, Mathias Stearn <mathias@mongodb.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>
CC: Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov
	<dvyukov@google.com>, <regressions@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aeueE1I1OuVkOcEZ@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aeueE1I1OuVkOcEZ@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 4/25/2026 12:45 AM, Mark Rutland wrote:
> Patch for the arm64-specific issue below. This doesn't fix the generic
> cpu_id_start issue, but it brings arm64 into line with everyone else,
> and it's the shape we'll need going forwards for other stuff anyway.
> 
> I've given it light testing with Mathias's reproducer and the
> kselftests, which all pass.
> 
> I've also pushed it to my arm64/rseq branch:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/rseq
> 
> Mark.
> 
> ---->8----
> From 79b65cbbfa20aa2cb0bc248591fab5459cdc101b Mon Sep 17 00:00:00 2001
> From: Mark Rutland <mark.rutland@arm.com>
> Date: Thu, 23 Apr 2026 16:51:12 +0100
> Subject: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness
> 
> Mathias Stearn reports that since v6.19, there are two big issues
> affecting rseq:
> 
> (1) On arm64 specifically, rseq critical sections aren't aborted when
>     they should be.
> 
> (2) The 'cpu_id_start' field is no longer written by the kernel in all
>     cases it used to be, including some cases where TCMalloc depends on
>     the kernel clobbering the field.
> 
> This patch fixes issue #1. This patch DOES NOT fix issue #2, which will
> need to be addressed by other patches.
> 
> The arm64-specific brokenness is a result of commits:
> 
>   2fc0e4b4126c ("rseq: Record interrupt from user space")
>   39a167560a61 ("rseq: Optimize event setting")
> 
> The first commit failed to add a call to rseq_note_user_irq_entry() on
> arm64. Thus arm64 never sets rseq_event::user_irq to record that it may
> be necessary to abort an active rseq critical section upon return to
> userspace. On its own, this commit had no functional impact as the value
> of rseq_event::user_irq was not consumed.
> 
> The second commit relied upon rseq_event::user_irq to determine whether
> or not to bother to perform rseq work when returning to userspace. As
> rseq_event::user_irq wasn't set on arm64, this work would be skipped,
> and consequently an active rseq critical section would not be aborted.
> 
> Fix this by giving arm64 syscall-specific entry/exit paths, and
> performing the relevant logic in syscall and non-syscall paths,
> including calling rseq_note_user_irq_entry() for non-syscall entry.
> 
> Currently arm64 cannot use syscall_enter_from_user_mode(),
> syscall_exit_to_user_mode(), and irqentry_exit_to_user_mode(), due to
> ordering constraints with exception masking, and risk of ABI breakage
> for syscall tracing/audit/etc. For the moment the entry/exit logic is
> left as arm64-specific, but mirroring the generic code.
> 
> I intend to follow up with refactoring/cleanup, as we did for kernel
> mode entry paths in commit:
> 
>   041aa7a85390 ("entry: Split preemption from irqentry_exit_to_kernel_mode()")
> 
> ... which will allow arm64 to use the GENERIC_IRQ_ENTRY functions directly.
> 
> Fixes: 39a167560a61 ("rseq: Optimize event setting")
> Reported-by: Mathias Stearn <mathias@mongodb.com>
> Link: https://lore.kernel.org/regressions/CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com/
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Chris Kennelly <ckennelly@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 29 ++++++++++++++++++++++-------
>  include/linux/irq-entry-common.h |  8 --------
>  include/linux/rseq_entry.h       | 19 -------------------
>  3 files changed, 22 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index cb54335465f66..65ade1f1544f6 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -62,6 +62,12 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>  }
>  
> +static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
> +{
> +	enter_from_user_mode(regs);
> +	mte_disable_tco_entry(current);

Did we skip sme_enter/exit_from_user_mode() on the syscall path on
purpose? Not very familiar with ARM64 SME.

> +}
> +
>  /*
>   * Handle IRQ/context state management when entering from user mode.
>   * Before this function is called it is not safe to call regular kernel code,
> @@ -70,20 +76,29 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
>  {
>  	enter_from_user_mode(regs);
> +	rseq_note_user_irq_entry();

Can we just use irqentry_enter_from_user_mode() instead?

>  	mte_disable_tco_entry(current);
>  	sme_enter_from_user_mode();
>  }
>  
> +static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
> +{
> +	local_irq_disable();
> +	syscall_exit_to_user_mode_prepare(regs);
> +	local_daif_mask();
> +	mte_check_tfsr_exit();
> +	exit_to_user_mode();
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to user mode.
>   * After this function returns it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -
>  static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> -	exit_to_user_mode_prepare_legacy(regs);
> +	irqentry_exit_to_user_mode_prepare(regs);
>  	local_daif_mask();
>  	sme_exit_to_user_mode();
>  	mte_check_tfsr_exit();
> @@ -92,7 +107,7 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>  
>  asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>  {
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  }
>  
>  /*
> @@ -716,12 +731,12 @@ static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
>  
>  static void noinstr el0_svc(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_syscall_enter_from_user_mode(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	fpsimd_syscall_enter();
>  	local_daif_restore(DAIF_PROCCTX);
>  	do_el0_svc(regs);
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  	fpsimd_syscall_exit();
>  }
>  
> @@ -868,11 +883,11 @@ static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
>  
>  static void noinstr el0_svc_compat(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_syscall_enter_from_user_mode(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	local_daif_restore(DAIF_PROCCTX);
>  	do_el0_svc_compat(regs);
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  }

Otherwise, looks fine to me.

>  
>  static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 167fba7dbf043..1fabf0f5ea8e7 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -218,14 +218,6 @@ static __always_inline void __exit_to_user_mode_validate(void)
>  	lockdep_sys_exit();
>  }
>  
> -/* Temporary workaround to keep ARM64 alive */
> -static __always_inline void exit_to_user_mode_prepare_legacy(struct pt_regs *regs)
> -{
> -	__exit_to_user_mode_prepare(regs, EXIT_TO_USER_MODE_WORK);
> -	rseq_exit_to_user_mode_legacy();
> -	__exit_to_user_mode_validate();
> -}
> -
>  /**
>   * syscall_exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
>   * @regs:	Pointer to pt_regs on entry stack
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index f11ebd34f8b95..a3762410c4ab6 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -753,24 +753,6 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
>  	ev->events = 0;
>  }
>  
> -/* Required to keep ARM64 working */
> -static __always_inline void rseq_exit_to_user_mode_legacy(void)
> -{
> -	struct rseq_event *ev = &current->rseq.event;
> -
> -	rseq_stat_inc(rseq_stats.exit);
> -
> -	if (static_branch_unlikely(&rseq_debug_enabled))
> -		WARN_ON_ONCE(ev->sched_switch);
> -
> -	/*
> -	 * Ensure that event (especially user_irq) is cleared when the
> -	 * interrupt did not result in a schedule and therefore the
> -	 * rseq processing did not clear it.
> -	 */
> -	ev->events = 0;
> -}
> -
>  void __rseq_debug_syscall_return(struct pt_regs *regs);
>  
>  static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
> @@ -786,7 +768,6 @@ static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned
>  }
>  static inline void rseq_syscall_exit_to_user_mode(void) { }
>  static inline void rseq_irqentry_exit_to_user_mode(void) { }
> -static inline void rseq_exit_to_user_mode_legacy(void) { }
>  static inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
>  static inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
>  #endif /* !CONFIG_RSEQ */

