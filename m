Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5163D0939;
	Tue, 28 Apr 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364320; cv=none; b=mz6GFb6TbQwJSuGBnw+AteB+NPhWHyHGPAVV1d8quqsiGrOS0t+vgKLlrHOSHWjAw8w8/pWeFiHXTqQcXgCm6+06gF4KKxXj4kuXbcafVaoUzUkfvaU/UYwuRTDSEQI0v8j9WKpy/FjAbjbg57umHKAM1UpVmwUPRFqtXsFsxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364320; c=relaxed/simple;
	bh=MhezThA/nJ+hhYlIaaGQ8ij0+fmtxu+kVhgm7c/bqys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ed1x3LFSRzVDKJISGykYM5iTYClfL+okp72/UfEoA+TL5wOOc6lcI9vQAv9VhBew7XjYXXx9AQNVqRg1U8sU5hDgfAQeHsqHfFzzJqvxog2xbzzQEEeM+yTe1x3vOsKnvAN6y93JxpNaefw3IPmIvb2+YsX7xxf+1ETHUR3AQrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoiIKsZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoiIKsZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FA4C2BCB6;
	Tue, 28 Apr 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364320;
	bh=MhezThA/nJ+hhYlIaaGQ8ij0+fmtxu+kVhgm7c/bqys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KoiIKsZVUlhecxBNBYmQEotK+aS0RK1/dQsgOKul81md2mFjJYhmHKpjrJfr6Iz2D
	 HQQW8Qf3mT3exqI38otWfZpNxkNc0n3uo2QpDP1OBDdiDq3SMP9PCdmVWMqXL4mjpY
	 aXYPxRMk+IbwHdNuwi2PlqrV/KZxYzeaT32k3+emMojKxBTWNHLue8heBzpWmw2h86
	 FiwlCoRxoxwBkCRxOuvUUadL3Kx9BBsMiIlwbc8b1kCgDoJ7A3K5o8ZQFQcqcJgTej
	 HRm80v2iFmZMTpIjGKoQJcT56rr/m4f86WdE3+cfEeGgT6NxYSUVyQq9wfE+tBtzZW
	 oPJA0BNAFcWLg==
From: Thomas Gleixner <tglx@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathias Stearn
 <mathias@mongodb.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, Florian
 Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, Matthew Wilcox
 <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <878qa7zexc.ffs@tglx>
References: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
 <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
 <CACT4Y+ZofNqpeDdgde969LzLznxbRb8CPB6m=CS2RiSmkSYPQQ@mail.gmail.com>
 <878qa7zexc.ffs@tglx>
Date: Tue, 28 Apr 2026 10:18:36 +0200
Message-ID: <875x5bzeeb.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 28 2026 at 10:07, Thomas Gleixner wrote:
>> Not sure if that's it, or there is something else.
>
> Can you try the updated version below?

Is there a pre-compiled version of those tcmalloc tests somewhere?

I tried to build it from source, but I really have better things to do
than wasting my time on debugging this bazel nonsense.

Thanks,

        tglx
