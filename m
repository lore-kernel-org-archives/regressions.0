Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686602882CD
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383626; cv=none; b=AUUHdOdKRrmJj7Me+0GjLRhH8mzT/XHmf+X20nLW64C6icSofuA8gBiu2uGPvJUU724QoMOfBFWo3K4qGry7KHn6vSDrrvoiUSznn/PkMn5uGrzF5EFmDItlQGZU7TP/9xX+guOGCOX3AuO/bGv/Y/Y+z3QCmyy3lMrFsLaD/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383626; c=relaxed/simple;
	bh=vao++lsdqUTUJ3waO+UotzCz6bS3XbETUsPpzthmLnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQHt29j4oAL1s3VS16vZJSnVvrzdR3fGB/5QPEbOsqzfZWEj/hKPobErAhqEAOzTstWKv0LoX5zJsXiLWzkSizhbLeo2aLpjAcJgD1tI3Ss2D2N5nwotoPzdGkkRd4BnZ3EkcLtgP4bOAmXtS0hePSer+EkV92qWIM6dSIGUP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XlOTwk+h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XlOTwk+h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53D081516;
	Tue, 28 Apr 2026 06:40:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F6C03F62B;
	Tue, 28 Apr 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777383624; bh=vao++lsdqUTUJ3waO+UotzCz6bS3XbETUsPpzthmLnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XlOTwk+h1G4kkywT2v40Y1cY5X6k1Gt+HWHN9TAo0NX8m8E/g2fXvXONKC3qMIBSU
	 2PtKSX7PADBcLFC463/FahbOfupCHUrntp06nMvhHLZLAOoA/yk8oyRTHaBCHB2+wk
	 pVb51t0fH4Yll57BzZCAqlUFK/cwMnzgOarfaXs4=
Date: Tue, 28 Apr 2026 14:40:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mathias Stearn <mathias@mongodb.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness
Message-ID: <afC4v-vw2l6x-I7q@J2N7QTR9R3>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aeueE1I1OuVkOcEZ@J2N7QTR9R3>
 <21b50a60-0cbf-43ee-b6d1-318cba206aea@huawei.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b50a60-0cbf-43ee-b6d1-318cba206aea@huawei.com>

On Tue, Apr 28, 2026 at 09:39:56AM +0800, Jinjie Ruan wrote:
> On 4/25/2026 12:45 AM, Mark Rutland wrote:
> > From 79b65cbbfa20aa2cb0bc248591fab5459cdc101b Mon Sep 17 00:00:00 2001
> > From: Mark Rutland <mark.rutland@arm.com>
> > Date: Thu, 23 Apr 2026 16:51:12 +0100
> > Subject: [PATCH] arm64/entry: Fix arm64-specific rseq brokenness
> > 
> > Mathias Stearn reports that since v6.19, there are two big issues
> > affecting rseq:
> > 
> > (1) On arm64 specifically, rseq critical sections aren't aborted when
> >     they should be.
> > 
> > (2) The 'cpu_id_start' field is no longer written by the kernel in all
> >     cases it used to be, including some cases where TCMalloc depends on
> >     the kernel clobbering the field.
> > 
> > This patch fixes issue #1. This patch DOES NOT fix issue #2, which will
> > need to be addressed by other patches.
> > 
> > The arm64-specific brokenness is a result of commits:
> > 
> >   2fc0e4b4126c ("rseq: Record interrupt from user space")
> >   39a167560a61 ("rseq: Optimize event setting")
> > 
> > The first commit failed to add a call to rseq_note_user_irq_entry() on
> > arm64. Thus arm64 never sets rseq_event::user_irq to record that it may
> > be necessary to abort an active rseq critical section upon return to
> > userspace. On its own, this commit had no functional impact as the value
> > of rseq_event::user_irq was not consumed.
> > 
> > The second commit relied upon rseq_event::user_irq to determine whether
> > or not to bother to perform rseq work when returning to userspace. As
> > rseq_event::user_irq wasn't set on arm64, this work would be skipped,
> > and consequently an active rseq critical section would not be aborted.
> > 
> > Fix this by giving arm64 syscall-specific entry/exit paths, and
> > performing the relevant logic in syscall and non-syscall paths,
> > including calling rseq_note_user_irq_entry() for non-syscall entry.
> > 
> > Currently arm64 cannot use syscall_enter_from_user_mode(),
> > syscall_exit_to_user_mode(), and irqentry_exit_to_user_mode(), due to
> > ordering constraints with exception masking, and risk of ABI breakage
> > for syscall tracing/audit/etc. For the moment the entry/exit logic is
> > left as arm64-specific, but mirroring the generic code.
> > 
> > I intend to follow up with refactoring/cleanup, as we did for kernel
> > mode entry paths in commit:
> > 
> >   041aa7a85390 ("entry: Split preemption from irqentry_exit_to_kernel_mode()")
> > 
> > ... which will allow arm64 to use the GENERIC_IRQ_ENTRY functions directly.
> > 
> > Fixes: 39a167560a61 ("rseq: Optimize event setting")
> > Reported-by: Mathias Stearn <mathias@mongodb.com>
> > Link: https://lore.kernel.org/regressions/CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com/
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Chris Kennelly <ckennelly@google.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kernel/entry-common.c | 29 ++++++++++++++++++++++-------
> >  include/linux/irq-entry-common.h |  8 --------
> >  include/linux/rseq_entry.h       | 19 -------------------
> >  3 files changed, 22 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> > index cb54335465f66..65ade1f1544f6 100644
> > --- a/arch/arm64/kernel/entry-common.c
> > +++ b/arch/arm64/kernel/entry-common.c
> > @@ -62,6 +62,12 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
> >  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
> >  }
> >  
> > +static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
> > +{
> > +	enter_from_user_mode(regs);
> > +	mte_disable_tco_entry(current);
> 
> Did we skip sme_enter/exit_from_user_mode() on the syscall path on
> purpose? Not very familiar with ARM64 SME.
> > +}

That was by accident. I originally wrote the fix on a kernel that lacked
those functions, and I missed them when rebasing the fix.

I'll go fix that up for v2.

> > +
> >  /*
> >   * Handle IRQ/context state management when entering from user mode.
> >   * Before this function is called it is not safe to call regular kernel code,
> > @@ -70,20 +76,29 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
> >  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
> >  {
> >  	enter_from_user_mode(regs);
> > +	rseq_note_user_irq_entry();
> 
> Can we just use irqentry_enter_from_user_mode() instead?

I've deliberately used enter_from_user_mode() here to keep things
balanced (i.e. enter_from_user_mode() pairs directly with
exit_to_user_mode()). We cannot use irqentry_exit_to_user_mode() as
explained in the commit message.

I'll update the commit message to make that a bit clearer.

[...]

> Otherwise, looks fine to me.

Great; thanks for taking a look.

Mark.
