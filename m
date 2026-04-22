Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4D2D877B
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887224; cv=none; b=rOMehg2w6MfC/mshAqKLc2HnmekGJFGvhhwect2zl8wOij+8Ht5ION6NGtuJt+pao6rS/zVZMetZ0Nbq05yN7jX0dpV7rBLhYZy5Zy+dElx8SWEw/h3PvFOb6nWJZJKxIHZSZ1I3ZY+QpYn1IFlF/+ZkyZsEjw4Uj1TQGRZqMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887224; c=relaxed/simple;
	bh=DduDmOR+zwDT7iU/i14+E1nk9zi8hmCda3iqRH4uFnc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mwko86vL1TnNtk6nx/2Oc0v62xd/udAfkNv6P9SyMvIyty/9ltkY8htHhwX+SUgBSg2wMxJhdK8irFfZm+ZWm4eyL91ni0h2/WoVvvKuDUEOP54lEyf/2RuPIFDx6Gcu7O+SLBE+DhR5DgPBoOJ5Mqe//QqRM9P32doIsrREufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vzr/TcQ7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yIOGVhET; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vzr/TcQ7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yIOGVhET"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776887221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FIad0NUruDUG63kx4ECALjd4inHFblMc1GRENB68XKU=;
	b=vzr/TcQ7PwlFKHcw3kxS9e+RpxqhTqOk+0x6/WRL5ITuTpLCFEYGcRkA8LuGb320ImhtSR
	WIC0PNkhHvH3cSQJBUoLDPoZaT7lP51lDZTJbhVKtzj8uCIjiuiEhx5kBsekT/bRAyYdQ0
	kWshgbh66cOJkZhtx1w4b4m4+ehVTviPTsLn9xGRzvBLSMGE8boNZ9I08Fkdf7tR5IGOYv
	u4fQUzRzdTxPhRFW60PjE3tvEx5iupIhnCX7y0HvKv6hdHA3t+YxBY3jFDcrrDPgjW5ncg
	tGZnOqVz7YoHBwLbQobq30vAXhbPzgBDobtJculDL7iBP64uWFuR/nOLiFFCSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776887221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FIad0NUruDUG63kx4ECALjd4inHFblMc1GRENB68XKU=;
	b=yIOGVhETdnA7SVsy83sNKIDsqBO5QBui6NQo6LsNgmFEUmHVFK5uRSmJgeCbGME1ZmLEfc
	hW9Cf2L8iFcbRJBQ==
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mathias Stearn <mathias@mongodb.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
Date: Wed, 22 Apr 2026 21:47:00 +0200
Message-ID: <87wlxy22x7.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 22 2026 at 19:11, Mark Rutland wrote:
> On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
> Conceptually we just need to use syscall_enter_from_user_mode() and
> irqentry_enter_from_user_mode() appropriately.

Right. I figured that out.

> In practice, I can't use those as-is without introducing the exception
> masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
> so I'll need to do some similar refactoring first.

See below.

> I haven't paged everything in yet, so just to cehck, is there anything
> that would behave incorrectly if current->rseq.event.user_irq were set
> for syscall entry? IIUC it means we'll effectively do the slow path, and
> I was wondering if that might be acceptable as a one-line bodge for
> stable.

It might work, but it's trivial enough to avoid that. See below. That on
top of 6.19.y makes the selftests pass too.

Thanks,

        tglx
---
 arch/arm64/kernel/entry-common.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -58,6 +58,12 @@ static void noinstr exit_to_kernel_mode(
 	irqentry_exit(regs, state);
 }
 
+static __always_inline void arm64_enter_from_user_mode_syscall(struct pt_regs *regs)
+{
+	enter_from_user_mode(regs);
+	mte_disable_tco_entry(current);
+}
+
 /*
  * Handle IRQ/context state management when entering from user mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -65,8 +71,8 @@ static void noinstr exit_to_kernel_mode(
  */
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
-	mte_disable_tco_entry(current);
+	arm64_enter_from_user_mode_syscall(regs);
+	rseq_note_user_irq_entry();
 }
 
 /*
@@ -717,7 +723,7 @@ static void noinstr el0_brk64(struct pt_
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_enter_from_user_mode_syscall(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
 	local_daif_restore(DAIF_PROCCTX);
@@ -869,7 +875,7 @@ static void noinstr el0_cp15(struct pt_r
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_enter_from_user_mode_syscall(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc_compat(regs);
