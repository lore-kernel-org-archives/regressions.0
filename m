Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCACA5A;
	Thu, 23 Apr 2026 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964785; cv=none; b=PwvHxkkU7mLqasuc0h7XOSCPHSb0q57N21x9mF7y12JWmeoFE86WyYUtK9r6P+1WnAgYXSNpXIVCfUPQJwbiVxtQMhl5V9Iqnj7Yvo0UdNUJ3onJG94o/goCDCspjrhErAIynbjuVBwEilKC8aobAoyeMo4WzTFrNNn02Fh6A48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964785; c=relaxed/simple;
	bh=Cdmfkm8GEQ2TJcnyq/J8jHFvtrJGx0HP6bi3r/GUzuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ApIrJskUGa58Qd89MLdzNjTHhU+Qb2u4/kyttRIP5NtU6kiFRzGxs9iOWffvfhZ4mNd8lbUYtKj59d9Stl6LUyLAMHo7yOlLZXWq8u5uLNP/aptU1ql4TlFLr8htMmxYdNYCd8xbuxCWtwSKK/pFVLCEjU4vbGYE+deC9S+B2z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDopWkP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDopWkP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E18C2BCAF;
	Thu, 23 Apr 2026 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776964785;
	bh=Cdmfkm8GEQ2TJcnyq/J8jHFvtrJGx0HP6bi3r/GUzuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iDopWkP4JMOa0oed1lMMwY3+J0HB/CaIEcZaEPVxbZGqZImRl7y3AoHTReBd/KSkP
	 dI7Q0rp7J5qByrzrg7P/zpks1NsLxI0ddqk5TEJOGNCOLpAL6crEIi21ckZgOyL1Ey
	 +7e4FgZ61xdTiOsQOQ1Win77DpXPVAxp9KSzkQWCfSiUmnGxinyswJxG9KGR1jgnOS
	 QE05YJ+x227s4UzoF8yxQrAp6JV2qzbxR35bT5v/0Fhd+64GjSPvauUn51IHJQq6Kb
	 pZG+fQIN7K+Us4iIk18xy67XVpfavN79uYlSzycQ8QH2J42d9zQGklZq7HYdJkANlS
	 8jJYvh11g3X7A==
From: Thomas Gleixner <tglx@kernel.org>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
Date: Thu, 23 Apr 2026 19:19:41 +0200
Message-ID: <87cxzp1tn6.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 23 2026 at 14:11, Mathias Stearn wrote:

Cc+ Linus

> Of course, even if we make that change, it will only apply to _future_
> binaries. That's why we prefer a kernel fix so that users will be able
> to run our existing releases (or any containers that use them) on a
> modern kernel.

I understand that and as everyone else I would be happy to do that, but
the price everyone pays for proliferating the tcmalloc insanity is not
cheap either.

So let me recap the whole situation and how we got there:

  1) The original RSEQ implementation updates the rseq::cpu_id_start
     field in user space more or less unconditionally on every exit to
     user, whether the CPU/MMCID have been changed or not.

     That went unnoticed for years because nothing used rseq aside of
     google and tcmalloc. Once glibc registered rseq, this resulted in a
     up to 15% performance penalty for syscall heavy workloads.

  2) The rseq::cpu_id_start field is documented as read only for user
     space in the ABI contract and guaranteed to be updated by the
     kernel when a task is migrated to a different CPU.

  3) The RO for userspace property has been enforced by RSEQ debugging
     mode since day one. If such a debug enabled kernel detects user
     space changing the field it kills the task/application.

  4) tcmalloc abused the suboptimal implementation (see #1) and
     scribbled over rseq::cpu_id_start for their own nefarious purposes.

  5) As a consequence of #4 tcmalloc cannot be used on a RSEQ debug
     enabled kernel. Which means a developer cannot validate his RSEQ
     code against a debug kernel when tcmalloc is in use on the system
     as that would crash the tcmalloc dependent applications due to #3.

  6) As a consequence of #4 tcmalloc cannot be used together with any
     other facility/library which wants to utilize the ABI guaranteed
     properties of rseq::cpu_id_start in the same application.

  7) tcmalloc violates the ABI from day one and has since refused to
     address the problem despite being offered a kernel side rseq
     extension to solve it many years ago.

  8) When addressing the performance issues of RSEQ the unconditional
     update stopped to exist under the valid assumption that the kernel
     has only to satisfy the guaranteed ABI properties, especially when
     they are enforcable by RSEQ debug.

     As a consequence this exposed the tcmalloc ABI violation because
     the unconditional pointless overwriting of something which did not
     change stopped to happen.

Due to #4 everyone is in a hard place and up a creek without a paddle.

Here are the possible solutions:

  A) Mathias suggested to force overwrite rseq:cpu_id_start everytime
     the rseq::rseq_cs field is cleared by the kernel under the not yet
     validated theoretical assumption that this cures the problem for
     tcmalloc.

     If that's sufficient that would be harmless performance wise
     because the write would be inside the already existing STAC/CLAC
     section and just add some more noise to the rseq critical section
     operations.

     That would allow existing tcmalloc usage to continue, but
     obviously would neither solve #5 and #6 above nor provide an
     incentive for tcmalloc to actually fix their crap.

  B) If that's not sufficient then keeping tcmalloc alive would require
     to go back to the previous state and let everyone else pay the
     price in terms of performance overhead.

  C) Declare that this is not a regression because the ABI guarantee is
     not violated and the RO property has been enforcable by RSEQ
     debugging since day one.

In my opinion #C is the right thing to do, but I can see a case being
made for the lightweight fix Mathias suggested (#A) _if_ and only _if_
that is sufficient. Picking #A would also mean that user space people
have to take up the fight against tcmalloc when they want to use the
RSEQ guaranteed ABI along with tcmalloc in the same application or use a
RSEQ debug kernel to validate their own code.

Going back to the full unconditional nightmare (#B) is not an option at
all as anybody else has to take the massive performance hit.

Oh well...

Thanks,

        tglx
