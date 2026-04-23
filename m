Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96D37C93A
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944896; cv=none; b=fPIaVt1eFPYJUs98xajS2S41yMfqTuTxNlAhsMHpV6t0u0K/sJ4CqwBikVTKJNUtNAgjZxQdvORG6FicU8Veq0WXVcUa3tlrRw2LR0gW9AbBUCEJ/Fq9GyO6R8PkpHaaWMSsJKxH7ohfjIqBf7nzt7j32xOFbl37ZGi66Kx4c+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944896; c=relaxed/simple;
	bh=l1l+dNdwfcS9H8sU7GZUFT5Hjc9i8GqSQpsbT8TvgLs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z/uMR7AJ49V+oqWzYk1/RS7mHAa5sY1ODqeqNHB8yloITKqDcFHB46AYk482hDPRgTWF9w7Ognz+S1Tn1SLj/o9lPixqjnMhOtZp7o98QPBADqQUHkLS0BQqnHocf7zIGVShb50eJtZ44Km++vVF5YpI8jFVCRTJAxd67tQ27c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ppjznlY3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NHdURgAv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ppjznlY3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NHdURgAv"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776944893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kLp6EQuRiSx+Qrn1H6AKFXY7OanD+wy8Q5FYkeQJAg=;
	b=ppjznlY36wTPmrvfJwDa34Q31pMkkz9Fw6yo3mvk5UfISfJuJbykVarX8XDE1gebXmKaPa
	ps/QvVQ0ycQ2v+3b+iNxbyeqdSVyFVI+0dpDoGEKjmGc2CQkeuE9W97hE0aSO2FbYfM9Gv
	p6x/7iGcZJaERx+1OyILBwQ7GUgxzRPI12enuxA+0RF+rZtuQt95qCU/1rgaufoV7RQ5FN
	CX1k+APTitHw7nDsY6Qjiruhu5SJTevkp3PrismnQnARDmX4hwFXj1EK77sUFARxq0Dl8t
	YNQquUnVx9EdV4ms5uerQ543l3okx3jNq3UXP6/klNj7YQ5NcT1sldc4ruMrNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776944893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kLp6EQuRiSx+Qrn1H6AKFXY7OanD+wy8Q5FYkeQJAg=;
	b=NHdURgAvj5rDfEqiN/RpuMhjPo9zK7VL5SMlHYfC9+6TQdk3S2T//viQcEdjALHPz4h4+8
	kKZXJpi4i27dNcBw==
To: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
Date: Thu, 23 Apr 2026 13:48:12 +0200
Message-ID: <87fr4l28zn.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23 2026 at 11:24, Mathias Stearn wrote:
> On Wed, Apr 22, 2026 at 3:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> To make this more concrete, I am proposing adding
>
> unsafe_put_user((u32)task_cpu(t), &t->rseq.usrptr->cpu_id_start, efault);
>
> after each place where you currently do
>
> unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
>
> in rseq_update_user_cs. Is that something that you would expect to cause a
> performance issue?

That would work and not bring the performance issues back, but:

  1) Did you validate that adding the reset into rseq_update_user_cs() is
     actually sufficient?

     If adding it to rseq_update_user_cs() is not sufficient, then we
     have a really serious problem. Because we'd need to go back and do
     it unconditionally, which then makes the 15% performance
     regression, which happened when glibc enabled rseq, come back
     instantaneously. And in that case the damage for tcmalloc() is the
     lesser of two evils.

  2) The tcmalloc abuse breaks the documented and guaranteed user space
     ABI and therefore it makes it impossible for any other library in
     an application which uses tcmalloc to rely on the documented and
     guaranteed rseq::cpu_id_start/rseq::cpu_id semantics.

     Which means, that tcmalloc is holding everybody else hostage.
     That's just not acceptable. Not even under the no regression rule.

  3) The fact that tcmalloc prevents a user from enabling rseq debugging
     is equally unacceptable as it does not allow me to validate my own
     rseq magic code in my mongodb client because enabling it will make
     the DB I want to test against go away.

     Again tcmalloc holds everybody else hostage for no reason at all.

The most amazing part is that tcmalloc uses this to spare two
instruction cycles, but nobody noticed in 8 years how much performance
the unconditional rseq nonsense in the kernel left on the table.

Thanks,

        tglx
