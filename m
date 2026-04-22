Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF7D3EAC77
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863363; cv=none; b=di7J90XUwmtVpnMbbPIzwW+lvumascm50rbSb0/ZuMYAWzRM2UmEW4pgsuX0X9FC400Br51z//CA6ph3eT04kS+wgIoanVLuBaL0LvTHqyS/FdCPJDm30TTThdOi4rsmnsrIN437YzBZDZUp/EK9lzxMRkymtT+qnpXX1rLG9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863363; c=relaxed/simple;
	bh=sDAmfWRbhtZL8LQJ7n7PetB5htxStJHE815D4TEoevU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt5Cy/QSi4UurttvJWeETe1bnj+FiL0NAAPu6Ljm1fuooe6qvlFFgbVOzYF96y0G2KXg/sOH0WH1wvxjpV/B0VknbcZDADGskilVK7G5EkaoKv7e4ibxKTZdUyBge4EB0Dcy0iRcXwUJxwwQZ+V2wT5QRGY1trMgVGca1QOVoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MCpXCCOj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MCpXCCOj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999B122E6;
	Wed, 22 Apr 2026 06:09:13 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E262F3FD46;
	Wed, 22 Apr 2026 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776863359; bh=sDAmfWRbhtZL8LQJ7n7PetB5htxStJHE815D4TEoevU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCpXCCOjxhdyirSrRnqI4YZcnoawJqDQNARV8WXKGImOcfCxphaCQcjXpuCCcCmQ9
	 dKSHB7CwUm8JSHQmPqCfZtoQCkfVOOWVQ9XFFH15hdtYTh2eax1TvRHdqvNTRhMobW
	 lakYoRt5RzrM0YITaelsbfvVb0l+GDGBuHo7vSSA=
Date: Wed, 22 Apr 2026 14:09:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
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

Hi Mathias,

On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> TL;DR: As of 6.19, rseq no longer provides the documented atomicity
> guarantees on arm64 by failing to abort the critical section on same-core
> preemption/resumption. Additionally, it breaks tcmalloc specifically by
> failing to overwrite the cpu_id_start field at points where it was relied
> on for correctness.

Thanks for the report, and the test case.

As a holding reply, I'm looking into this now from the arm64 side.

I'll leave it to Thomas/Peter/Mathieu to comment w.r.t. the issue you
raise with cpu_id_start.

For some reason, this mail didn't make it to my inbox, and I had to grab
it from lore using b4. That might be a problem with my local mail
server; I'm just noting that in case others also didn't receive this.

Mark.

> This is a SEVERE breakage for MongoDB. We received several user reports of
> crashes on 6.19. I made a stress test that showed that 6.19 can cause
> malloc to return the same pointer twice without it being freed. Because
> that can cause arbitrary corruption, our latest releases have all been
> patched to refuse to start at all on 6.19+.
> 
> TCMalloc uses rseq in a "creative" way described at
> https://github.com/google/tcmalloc/blob/master/docs/rseq.md. In particular,
> the "Current CPU Slabs Pointer Caching" section describes an optimization
> that relies on an undocumented fact that the kernel was always overwriting
> cpu_id_start (even when it wouldn't change) to invalidate a user-space
> cache. Since the change to stop writing cpu_id_start seemed to be
> intentional as part of a refactoring merged in 2b09f480f0a1, I started
> working on a userspace patch to stop relying on that. Unfortunately when
> that was complete I ran into a wall that is impossible to work around from
> userspace.
> 
> On arm64, the kernel no longer meets the documented guarantee that rseq
> critical sections are atomic with respect to preemption. It seems to only
> abort the critical section when the thread is migrated to a different core.
> The attached test proves it and passes on x86 both before and after 6.19,
> and on arm before 6.19, but fails on arm with 6.19. It pins the process to
> a single core and then has an rseq critical section that observes a change
> made by another thread which is supposed to be impossible. I think this
> will break basically any real usage of rseq, other than just reading the
> current cpu_id.
> 
> An LLM pointed to these two specific commits in the refactor as causing
> this (oldest first):
> - 39a167560a61 rseq: Optimize event setting
> This assumed that user_irq would be set on preemption but it wasn't on
> arm64, so TIF_NOTIFY_RESUME isn't raised on same cpu preemption.
> - 566d8015f7ee rseq: Avoid CPU/MM CID updates when no event pending
> This broke TCMalloc slab caching trick by not overwriting cpu_id_start on
> every return to userspace
> 
> (I have a lot more analysis and suggested fixes from LLMs since I used them
> heavily in this testing and analysis, but I won't spam you with the slop
> unless requested)
> 
> The arm64 change is a clear breakage and I'm sure it will be
> uncontroversial to fix. I can imagine more resistance to reverting to the
> old behavior of always overwriting the cpu_id_start field since that seems
> to have been an intentional optimization choice. I have reached out to the
> TCMalloc maintainers (CC'd) and believe there is a solution that gets the
> vast majority of the optimization while still preserving the behavior that
> TCMalloc currently relies on[1].
> 
> Any time a critical section might be aborted (migration, preemption, signal
> delivery, and membarrier IPI), the kernel already must (but doesn't on
> arm64 at the moment) check the rseq_cs field to see if the thread is in a
> critical section, and is documented as nulling the pointer after (I assume
> to make later checks cheaper). It would be sufficient for tcmalloc's
> internal usage if every time the kernel nulled out rseq_cs, it also wrote
> the cpu id to cpu_id_start. That should be essentially free since you are
> already writing to the same cache line. It was pointed out that that could
> be an issue if another rseq user in the same thread nulled rseq_cs after
> its critical section, which would require the kernel to update cpu_id_start
> each time it checks rseq_cs, regardless of whether it nulls it. We aren't
> aware of any processes that mix tcmalloc with other rseq usages that null
> out the field from userspace, but we can't rule them out since it is open
> source. Either way, this preserves the property of not updating
> cpu_id_start on every syscall return and non-membarrier interrupts, which I
> assume is where the majority of the optimization win was from.
> 
> All testing of problematic versions was performed on x86_64 and
> aarch64 Ubuntu 24.04.4 with the kernel manually upgraded to
> 6.19.8-061908-generic. Source analysis was performed on the v6.19 tag. I
> had a few AI agents confirm that nothing in the relevant changes to master
> should have solved this, but I have not yet tested there.
> 
> $ cat /proc/version
> Linux version 6.19.8-061908-generic (kernel@balboa)
> (aarch64-linux-gnu-gcc-15 (Ubuntu 15.2.0-15ubuntu1) 15.2.0, GNU ld (GNU
> Binutils for Ubuntu) 2.46) #202603131837 SMP PREEMPT_DYNAMIC Sat Mar 14
> 00:00:07 UTC 2026
> 
> [1]  There is also an exploration of some options to make tcmalloc not rely
> on the cpu_id_start overwriting. However we would strongly prefer that
> existing binaries continue to work on 6.19 kernels, even if newer binaries
> don't need that. At least for a good while.

