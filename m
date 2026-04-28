Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0C2836A6;
	Tue, 28 Apr 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365405; cv=none; b=Is6Mw8TVt9/pkJ/iZ5DFgeVdF/tLBUYOEfOYJqXyaeAXQRvho5sjgqbqM6RLdWECEXvNxzB8AbJbYTmUr8FFTFDJpmm8d+tRvotpMZFBTZVwjsxHA9xuP4+44WTD2LoTHgAT4bgsfU5tF9n7814sh1NlXPvJ0DnPMxKSlHyB9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365405; c=relaxed/simple;
	bh=6431jNMlyh5TZtkffCv2Acjak2j02YoCm1/rh7vP68Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ruWvf/FKe2LtR/MC5OBJCA0hT1nyM7AQPjudEjN0/FgOsUULul5ollaXvbPea3NQjGi3fHcSgdQmYNrDzXcCaRwB2I989d1snOsdymNBbmhlM2ZFer/wb3TbrD5vutYV4TXn01T7tSLojt8OAfSpIDdZeHEjzf50j+qLlQNURiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjZl9ocH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjZl9ocH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A3C2BCAF;
	Tue, 28 Apr 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365405;
	bh=6431jNMlyh5TZtkffCv2Acjak2j02YoCm1/rh7vP68Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bjZl9ocH4SCCsKL6l+xut4XRgQbREMkmZTjBz0W35LvibOIiSFM4swxDiBLi1B4kq
	 CiYK9Q4JEB06BO80FC0P6bHV5Su4RUiMFTFE91SEHGNH8RIqFyaKrElslx6pHkrQF1
	 8E+C9J4DD2WmyWL+PQ12DB4h4cEoj+ceqmG4fI1lwYCbKXkgF67rW/lIq0k9pwxsXM
	 bDCN4ArLqgLMb7mH0rT9r0C5tVx8TqkGSu3EXmqvODEQfKT2cnddKCXa6Go7S4S0zt
	 N7kxo15ymikiGVFMJnXvBpTWwgEbcgyLEYK89Q7hTrlRTlW97mNuUhNHoLKSUwFyLc
	 FwENZ0Ur+VklQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
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
In-Reply-To: <20260428080359.GI3126523@noisy.programming.kicks-ass.net>
References: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
 <20260428080359.GI3126523@noisy.programming.kicks-ass.net>
Date: Tue, 28 Apr 2026 10:36:41 +0200
Message-ID: <87340fzdk6.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 28 2026 at 10:03, Peter Zijlstra wrote:
> On Mon, Apr 27, 2026 at 12:04:48AM +0200, Thomas Gleixner wrote:
>> +   * - 5
>> +     - Time slice extensions
>> +     - Not supported
>> +     - Supported
>
> I'm sure its cute when rendered, but when read as text this is nigh on
> unreadable.

I tried the other table variants. They are even worse :)
