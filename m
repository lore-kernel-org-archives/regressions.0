Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E533CEA8;
	Thu, 23 Apr 2026 21:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978207; cv=none; b=SNNn978XwQbjyd6JFXYyOP0SaAdYEqBE3tBp/oFmI4Ick5RJmD4GkgMziFNGc1ythsR7BWpGB+wPx5jJOE/3zHrjx+trsZ7QbpkgdhCm59T96HDgf0Tgc6Ql6JEgtUWUDluIx1qZUzxZHi1r2gmk9M7uLgmagU1wFxBPtj9AR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978207; c=relaxed/simple;
	bh=jicRkjxAdp8AcCcPUjbadYpVexqneFhcKTzet6r3h5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dg+1NTbJsop14kyarOpSNlQ6p8WXz9JMaPALx6KpejFtZQ9j+Rm2XCiJNcXZKMidcO3mRPDqO7XjpAYyVfWHyJGF3a7nwHSkclPilV4knVKih0UH1qSGdIj8yxEQmAFtKFxjdjWrus3U0T5yvzmWl34e3+wcIVAK40HjZDdhx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vfsw7X80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vfsw7X80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1538C2BCAF;
	Thu, 23 Apr 2026 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776978206;
	bh=jicRkjxAdp8AcCcPUjbadYpVexqneFhcKTzet6r3h5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vfsw7X80JLWG87rigYmms+aaE4YkaApjZI6XVr2Of47GDY1sjxLsk08O4Wb/e0WF7
	 Y+X3OjI+cvAGecePqQNIkeNmKI17+7FIEwGdW5eokHlBN8zdAn7Kcmc7SZAiyWwFMv
	 W3tcYISr4cc7mNrPwcgpI8hiYUU7HxrJ4at+dKeGX5i7qVQA703sY04okfDhbIevYU
	 /K/m1+1/7NVBdG0rw7BeXh4l16CejUB8uIpZUUpy2dXvuUA2hB72DLZw1wJazay9Su
	 PdxbgbJ1XW/xUSXhyKt494yRjuRUU7RoD46c1++UfjtQYxgNYBgrjhA9OOcO8jS9OD
	 ms7z+qkM/i3CA==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra
 <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
Date: Thu, 23 Apr 2026 23:03:23 +0200
Message-ID: <874il11jac.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 23 2026 at 10:41, Linus Torvalds wrote:
> If that rule was actually an important part of the ABI, it shouldn't
> have been a debug thing.

It's a debug thing because it's too expensive to be enabled by
default. And it's actually valuable for validating RSEQ critical section
ABI correctness as they can't be single stepped with a debugger as the
break point interruption would immediately canceled.

> So:
>
>  (a) the debug code in question needs to just be removed, since it's
> now actively detrimental, and means that any kernel developer who
> *does* enable it can't actually test this case any more. It's checking
> for something that has been shown to not be true.
>
>  (b) we need to fix this (revert if it can't be fixed otherwise)
>
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

There are two issues:

  1) ARM64

     On ARM64 RSEQ got broken completely with the partial move to the
     generic entry code. There are patches flying around which "fix" it
     and Mark is working on a more complete solution as there are other
     subtle issues with that aside of the obvious RSEQ wreckage. The
     latter could have been detected with the existing RSEQ selftests if
     any CI would actually run them on -next.

     That's uninteresting and unrelated to the tcmalloc issue. It's just
     a boring bug which will be fixed in the next couple of days.


  2) The tcmalloc problem

     That's a known problem for at least 6 years. tcmalloc assumes that
     it "owns" rseq and can do whatever it wants with it.

     In 2022 the glibc people requested that tcmalloc becomes
     interoperable with the reasonable expection of glibc to utilize
     rseq as well:

          https://github.com/google/tcmalloc/issues/144

     Status unresolved.

     That means that using tcmalloc requires to tell glibc to _NOT_ use
     rseq and at the same time precludes any other library which wants
     to use it for the documented purposes. So this code sequence blows
     up in your face:

        x = tcmalloc();
        dostuff(x)
          evaluate(rseq::cpu_id_start, rseq::cpu_id)

     because tcmalloc overwrites rseq::cpu_id_start and thereby breaks
     the ABI which evaluate() is rightfully depending on.

     That has absolutely nothing to do with the kernel as there is no
     kernel interaction between tcmalloc's abuse and the subsequent
     evaluation of rseq::cpu_id_start. The kernel has no way to fix that
     problem at all.

     Now back to your generally correct and agreed on "observed
     behaviour" rule.

     Feel free to enforce it, but be aware that you thereby set a
     precedence that a single abuser can then rightfully own a general
     shared interface of the kernel forever and force everybody else to
     give up.

     The tcmalloc developers actually documented that they own the
     world:

     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.

     Do you seriously want to proliferate that?

Thanks,

        tglx



