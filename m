Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADB31A81C;
	Thu, 23 Apr 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973194; cv=none; b=e75rNMBX1ZfxNmaaoK59z62Yz+gFjC8wAmYtyWGcwJ1rmMJXgl5OXFbLuhFwTvd94ycjzcCRHCwSq0VwR28OW7qSDQ47Okdvclhy9m+jWJtzde5IWPMhKSK1ZH209aJsu3YModEMXKYjt4c8X+RZNvAk3B0T7RYELxgWhYaO0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973194; c=relaxed/simple;
	bh=yMr5E62x+WcPU2LZQ8qhJm588joa6CJhMuH2XFE5D5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XmY2OGb974i3hQ5hhCmAZcpiyannPxFNcJekAJVtVsOYJdwtybaDI61woSJGdmzUvIwRPTOT2iri2WzpI0gd0Z72hsKhp8lYLP/Se3al/hOLZAfGcMEykS+5rUsj/Br+OmFlUCMS8d8wkIRTjmmk+TT7XVVk342xcKGQwHvFQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HasZMFhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HasZMFhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D102CC2BCAF;
	Thu, 23 Apr 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776973194;
	bh=yMr5E62x+WcPU2LZQ8qhJm588joa6CJhMuH2XFE5D5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HasZMFhsIKBGKP4SK9SpvBrBwHScX1EeFffbgWHv8HO1XPHoTk6XHyG55IemEWhBO
	 g8C/A9madVtFpIBWFfJhMkUFjqzpyL56jrPaNTGhDbMx/ke5NXemou9Rb1nDsGM+Ov
	 YfdYQywUoiN925ffREUQKKEktuWhH5NcfpUzaYDinMta7s9P5KFGJawC106TiHp7ZA
	 wESWc50no9cXCSPguczlJb+yNOSIAnUNUckxwdu+tqUUCyDR4jMkL2/UMFpvhGDNHQ
	 5+1Wzq8QhkR6dGg7/ZksICEwbJQkYDtWGviwdqkiPLal1aMnluaOhz/GGanNppubjO
	 Y3Lf74P0qhUSw==
From: Thomas Gleixner <tglx@kernel.org>
To: Chris Kennelly <ckennelly@google.com>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra
 <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Dmitry
 Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jinjie
 Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
Date: Thu, 23 Apr 2026 21:39:50 +0200
Message-ID: <877bpx1n5l.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23 2026 at 13:38, Chris Kennelly wrote:
> On Thu, Apr 23, 2026 at 1:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org>=
 wrote:
>>   3) The RO for userspace property has been enforced by RSEQ debugging
>>      mode since day one. If such a debug enabled kernel detects user
>>      space changing the field it kills the task/application.
>
> The optimization in TCMalloc that you're describing has been available
> since September 2023:
> https://github.com/google/tcmalloc/commit/aaa4fbf6fcdce1b7f86fcadd6598746=
45c75ddb9

And the github issue which requested glibc compatibility was opened in
Sept. 2022:

      https://github.com/google/tcmalloc/issues/144

> I thought the RSEQ debug checks were added in December 2024:
> https://github.com/torvalds/linux/commit/7d5265ffcd8b41da5e09066360540d6e=
0716e9cd,
> but perhaps I misidentified the ones in question.

I might have misread the git log. But that still does not justify the
violation of a documented ABI for the price that nobody else can use it
once tcmalloc is in play:

   x =3D tcmalloc();
   dostuff(x)
     evaluate(rseq::cpu_id_start, rseq::cpu_id) <- FAIL

>>   7) tcmalloc violates the ABI from day one and has since refused to
>>      address the problem despite being offered a kernel side rseq
>>      extension to solve it many years ago.
>
> I know there was some discussion around a preemption notification
> scheme, rseq_sched_state; but I thought the discussion moved in favor
> of the timeslice extension interface that recently landed. Timeslice
> extension solves some use cases, but I'm not sure it addresses this
> one.

No it does not. That's an orthogonal optimization.

Thanks,

        tglx
