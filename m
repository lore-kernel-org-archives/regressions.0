Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB337EFF6
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940780; cv=none; b=jlikeKZosBZddOZOIS2ifEXvNT21eq6Edgg5pLVJe+gNKwh6dXuVfW7ZnPGzabQQAThJBMmZ41GVOj0LLox7d7Sal+IvgwU7LXmWRP+LdXS+yo0OEKhKMWsYNsmblfllaCZSlbnzpWO0LWxQSjRg4goqe5fiVNPawHG5CiV0dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940780; c=relaxed/simple;
	bh=YvqwC9Ximwz+0MdnRR3v4UcqD9U84FwX3TF72tfh6Eo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fYc5adUlaOup8HUwjqM/glSXMsINc9lMM++Lse46XkjiGuaYHOWlATKvuvTzaRA0wYqSJMjh+U3HMsrI6TqVNygINqYGZDH437JqV34GelfxCeG1HJ4qMrlQsMYCS533k31ZNWkUwFha7UFCHN3aNITNp+9qgA6ExG/Ialux/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AuW1xLgt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HRXq/Pfn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AuW1xLgt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HRXq/Pfn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776940777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGEO2F0ScelrhYb0KLha9yRxuMqwCHKRlDug71W0idc=;
	b=AuW1xLgtZm+C8AnaQKzWFF9ZB1yEB+dmq6Pz4OGcKHDgIWWmYYXSJGGFIdfxk7VyzA+Znm
	MQtCwuJoUu5RkUE16EMgFycJkQBRJkQXe6IP0y+ewDd3ag329+5l1zkCDJpwebMtt3om/r
	G0EfMn8H9+BC4sRMaQWQuBNEprFpp3rVgR2wjM/KdPLo/kBaIHHumei7A369z2YjQWlcpm
	NnZM7hbFPGB6YVoBAvSjgFDa19IWRewfsnmZK19tOsxYrporbOnSFtl1vG/hrIUg9a8e4i
	HN2jEdG/NYNTUrH/sqg2G6NvMZvP03wAuIawYNA6eG/67A3CXob8UKH8PGHr2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776940777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGEO2F0ScelrhYb0KLha9yRxuMqwCHKRlDug71W0idc=;
	b=HRXq/PfnQegrvLWQuStXBRMN299tx2QwQeuxH8m0oYNyaMoxm4tb4mGPSv/bPhl2C+9y3s
	551qIyszJd9b2LCw==
To: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mathias Stearn
 <mathias@mongodb.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake Oler
 <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
Date: Thu, 23 Apr 2026 12:39:36 +0200
Message-ID: <87ik9i0xlj.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 23 2026 at 07:53, Dmitry Vyukov wrote:
> On Thu, 23 Apr 2026 at 03:48, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This part of the rseq man page needs to be fixed as well I think. The
> kernel no longer reliably provides clearing of rseq_cs on preemption,
> right?
>
> https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241
>
> "and set to NULL by the kernel when it restarts an assembly
> instruction sequence block,
> as well as when the kernel detects that it is preempting or delivering
> a signal outside of the range targeted by the rseq_cs."

The kernel clears rseq_cs reliably when user space was interrupted and:

    the task was preempted
or
    the return from interrupt delivers a signal

If the task invoked a syscall then there is absolutely no reason to do
either of this because syscalls from within a critical section are a
bug and catched when enabling rseq debugging.

The original code did this along with unconditionally updating CPU/MMCID
which resulted in ~15% performance regression on a syscall heavy
database benchmark once glibc started to register rseq.

Thanks,

        tglx






