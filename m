Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B72264D3
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972695; cv=none; b=ikLyfRPoaWUaYhLhvdGZDlE404HRkm3RJ1x9WatuNK+06spai7uAwTYeXLCqCdrM/dTyC325sihRDzJ2ymCUa0HOl/2kcI60OFB+5OeXnend2VZbsOmed2Cv4049POvC91C6DWQRdBtgqf6tu7aYHTMdlAqGJ3be4MBcfepVg2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972695; c=relaxed/simple;
	bh=qGR/aPw5QWnLfBwCWBIyY0NU3BdbXOxa86DpocFW2rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JVI7T7k8gq3YHUUFn5nxSxaoSxqyK6lkDqSYHaXxN8yZ8svqZPm28sibpExmQ5NTWalP8ZQWHPBE4XNLcQ2YfzS6jWBHmGxXmwGD5Ni8MQprFDCyIK5wxEy5EYCagqZTeG1DrnZNZ/+4WysKGzDR1AygJvPsVqYdGCh05kxXJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=00mjlLu3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YwjUs7vn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="00mjlLu3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YwjUs7vn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776972691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr/7Zmxu/ZQqvILwZW7UDw2oRwDO+gN3baqm7IZmHr4=;
	b=00mjlLu3y5F/trdb0l39Eob8Dc+G319oqCPepgM8gT+nKK47phL5euTHhBxYMj8bKEVhDY
	vlK5FbSIqEuMi/xwY1j97KgEMA/nIXQcUrZRl7n5mfkFDC1x//X+nrMxTNdhsokryLlo68
	bJOx4tG0MMjOg5KqS+Oju+rz85vmVO8ZTk/QDzf/hg9OWkh/6bgVdnnX0Ol9rmSs4rk/tn
	dqOvDb5cio/xPRY2IJwakZ4iq9znfqNN7XWimLLfO0/1EOjE9f+S2jQD8vPGCQPl6a0Xcy
	ydC09f/Xv68/7rBbjGZ2ZpUuwXbH62+uHAabbxhSyLEPsva3BuK6bb3NaTsJOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776972691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr/7Zmxu/ZQqvILwZW7UDw2oRwDO+gN3baqm7IZmHr4=;
	b=YwjUs7vnnAeHab+Lnj7sEh9P5XfR0rsYrN+4B+4jvo6EpPb7hHxCqRpuAV5miLnZdmLWlp
	yipHfaVmWd+QsXAg==
To: Mathias Stearn <mathias@mongodb.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
Date: Thu, 23 Apr 2026 21:31:30 +0200
Message-ID: <87a4ut1njh.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23 2026 at 12:51, Mathias Stearn wrote:
> On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>> The kernel clears rseq_cs reliably when user space was interrupted and:
>>
>>     the task was preempted
>> or
>>     the return from interrupt delivers a signal
>>
>> If the task invoked a syscall then there is absolutely no reason to do
>> either of this because syscalls from within a critical section are a
>> bug and catched when enabling rseq debugging.
>>
>> The original code did this along with unconditionally updating CPU/MMCID
>> which resulted in ~15% performance regression on a syscall heavy
>> database benchmark once glibc started to register rseq.
>
> Just to be clear TCMalloc does not need either rseq_cs to be cleared
> or cpu_id_start to be written to on syscalls because it doesn't do
> syscalls from critical sections. It will actually benefit (slightly)
> from not updating cpu_id_start on syscalls.

I know that it does not do syscalls from within critical sections, but
it relies on cpu_id_start being unconditionally updated in one way or
the other.

> It is specifically in the cases where an rseq would need to be aborted
> (preemption, signals, migration, and membarrier IPI with the rseq
> flag) that TCMalloc relies on cpu_id_start being written. It does rely
> on that write even when not inside the critical section, because it
> effectively uses that to detect if there were any would-cause-abort
> events in between two critical sections. But since it leaves the
> rseq_cs pointer non-null between critical sections, so you dont need
> to add _any_ overhead for programs that never make use of rseq after
> registration, or add any overhead to syscalls even for those who do.

Well. According to the comment in the tcmalloc code:

// Calculation of the address of the current CPU slabs region is needed for
// allocation/deallocation fast paths, but is quite expensive. Due to varia=
ble
// shift and experimental support for "virtual CPUs", the calculation invol=
ves
// several additional loads and dependent calculations. Pseudo-code for the
// address calculation is as follows:
//
//   cpu_offset =3D TcmallocSlab.virtual_cpu_id_offset_;
//   cpu =3D *(&__rseq_abi + virtual_cpu_id_offset_);
//   slabs_and_shift =3D TcmallocSlab.slabs_and_shift_;
//   shift =3D slabs_and_shift & kShiftMask;
//   shifted_cpu =3D cpu << shift;
//   slabs =3D slabs_and_shift & kSlabsMask;
//   slabs +=3D shifted_cpu;
//
// To remove this calculation from fast paths, we cache the slabs address
// for the current CPU in thread local storage. However, when a thread is
// rescheduled to another CPU, we somehow need to understand that the cached

                  ^^^^^^^^^^^

// address is not valid anymore. To achieve this, we overlap the top 4 bytes
// of the cached address with __rseq_abi.cpu_id_start. When a thread is
// rescheduled the kernel overwrites cpu_id_start with the current CPU numb=
er,
// which gives us the signal that the cached address is not valid anymore.

The kernel still as of today (the arm64 bug aside) updates the
cpu_id_start and cpu_id fields in rseq when a task is rescheduled to
another CPU.

So if the code only requires to know when it got rescheduled to another
CPU then it still should work, no?

But it does not, which makes it clear that it relies on this
undocumented behaviour of the kernel to rewrite rseq::cpu_id_start
unconditionally. I'm not yet convinced that it relies on it only when
interrupted between two subsequent critical sections. We'll see.

....

Now we come to the best part of this comment:

// Note: this makes __rseq_abi.cpu_id_start unusable for its original purpo=
se.

So any code sequence which ends up in:

   x =3D tcmalloc();
   dostuff(x)
     evaluate(rseq::cpu_id_start, rseq::cpu_id)

is doomed. This might be acceptable for Google internal usage where they
control the full stack and can prevent anyone else to utilize rseq, but
in an open ecosystem that's obviously a non-starter.

And they definitely forgot to add this to the comment:

// Never enable CONFIG_RSEQ_DEBUG in the kernel when you use tcmalloc as
// it will expose the blatant ABI abuse and therefore will kill your
// application.

If your assumption that the rewrite is only required when rseq::rseq_cs
is non NULL and user space was interrupted is correct, then the obvious
no-brainer would have been to add:

        __u64	rseq_usr_data;

to struct rseq and clear that unconditionally when rseq::rseq_cs is
cleared.

But that would have been too simple, would work independent of endianess
and not in the way of anybody else.

But I know that's incompatible with the features first, correctness
later and we own the world anyway mindset.

Just for giggles I asked Google Gemini about the implications of
tmalloc's rseq abuse. The answer is pretty clear:

   "In short, TCMalloc treats RSEQ as a private optimization rather than
    a shared system resource, which compromises the stability and
    extensibility of any application that needs RSEQ for anything other
    than memory allocation."

It's also very clear about the wilful ignorance of the tcmalloc people:

   "In summary, the developers have known for at least 6 years that the
    implementation was non-standard and conflicting with other rseq
    usage. The github issue which requested glibc compatibility was
    opened in 2022 and has been unresolved since then."

Thanks,

        tglx
