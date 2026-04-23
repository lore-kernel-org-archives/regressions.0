Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DB3845BC
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949144; cv=pass; b=sYlYn8JM7qtsuWKcQd6yoiBsJIUq3oWUrwgSRe6rXt4N2ndK1jCW1xVT8OVOaLHxDhPMu71lb9sNWlecRjn0o3fDeOqSul7P7wbAZcjcBKxa3WBR6ZREQ7zXG/Ty2yYLgy3Vr0pBLVbOiRT4lX4zHr5df4Uc+aOPsOFTzzbmnX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949144; c=relaxed/simple;
	bh=4rae3jvkCjQWMcvHSde4gAJUq4nke8pE4IKBx+HyCyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4oQkUoJWPXIoMVHLrV6oGcWKIOzhoY6ir7Xa4tF7unE/2r1W+fKkMx3Ct4bWzsVy3I2NVwjObcjVNw9es26esEdWPbRcimQo8PXsvNBaMysXCDCC7Oooi9RDUH2qVyRoZFTARuB4GdZuoQ6fk8G3Msj+IM5cIy7eX8yiD7m+C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PtTTPQkx; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PtTTPQkx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e800deae4so56027071fa.0
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776949141; cv=none;
        d=google.com; s=arc-20240605;
        b=UAy5TGAaqV1AqsFi4iBvjrnZ5haKt22tcsbOa1JQ1kg54Do3bcoJ7Q6gvirSC+wm6y
         fRc2Rf+2kgXgvul4+OUQ0fer/EaAhprFiYen+6NFqVN2o3UlF7MPFqxJRrkSxnVrREF/
         lz7Cel6biMUvTwuIs8pNJgRXWE46mV+aQMWwREzI4Fdjmv9Z7ZOJSwcSDaQc0SccEv1C
         K3qc3zeW9oSYxWWeLkqy6mdWwR3RBZPM6GVaJPYeV1igDmPrpjcSq8LM+xXEfvI7KAh9
         AtJtviMAke3RHcvHojJbjs3sOPQDJrwHjkDDE//zqD/EFKZQKc4lmV6LB0T3uKvEFtQt
         mcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        fh=eXKEPtSHMo2KqJmMdqG/pcoU/RHBuU3bxfXpqcAFwic=;
        b=bBxvx1dEuThxaKXe+TAhaS9QtlYwdXVfq3osHvr2HCe6p1OtRIfI2UUaMscWgrT5vo
         pR3/QhlOloan2uKaNvpXWXTDimymcemgVg2jfmCjApz8vOMJgvHZivWTLF+Z8iitIKXB
         UeDfVu5RX4JR5L9m/dAKD3b3N/1vElym/2K2LFpaLF6x+7Bf+olkbtPv5t0IoHd1D+lp
         koo4wnGQI2vTBJYaTF9/QENSH0ud4IwLgO6dMYKUk/QV3N5o36D8EK3oqQf0foAkyUHa
         rzvj3EC2OUBYz8LZ/LsWdU2FCASmtexYnWo2/tvNkBGZvKY46/5o2D/K7UJCgaYktrZM
         +vcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776949141; x=1777553941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        b=PtTTPQkxQghFLKxci0yOSV1lvxz7uHmZIYSaNmyreykIa57z2WCpag83ryDaXAvKP3
         yebIeYkFzsrzJqMZQUgQpc1j67ktkqDOR6aLWbGa1gboi3ZJ3u9f8UIhCHnmsVd+M9Yd
         MGCmQ46sAVFJnoXPnTdXXLcF6+TNwJjkaGgPW91cAzr6vfv4SQB74GKMtObjGm/26gDn
         kyBFHFc3CUMAPR/IcdPF7DZtv0wnwQMWZ3hV1VEsO5SgU89uZR8Jr+W4rR9LPpu0Ga8b
         HtXkYg0iiGWygSzLIvY0ILHpSg9ATBYt1h6GW7rTpfkvyahOvJEswtq+g2sg7YQFXvjq
         fXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949141; x=1777553941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        b=j87X6A/ue+oESZL3o4G8n6MF/c3aIFhXEIIvGoVPY138qKTynZES2c55O+fhGu2ky+
         RpCnM/+AOYtCllN8XOFxihQAmss6SDAlajqU0vtQhmfPkoXm3Q+D6B0GU7gPvzBDuEIh
         ML8e4WLP9D7j5eX5LKkOZnBd1fnUEGUAba+3LldKBh0mkIjIeNzVA8WvNbTTMEz2F3gi
         ZP7KphE3YiSDRis69/JkwigexUxEiCLJMPGEeCScltmD0mKqgIriZqacg50IwoJEG/C5
         0ursJO5CxIgkmZvIFIQpbUxL39P2KobcGB7kafJDM4GoMQP/J3QFgk1b9/9opgE4oKmJ
         iG+g==
X-Forwarded-Encrypted: i=1; AFNElJ+lWOFCtMDEH2+CMF00QKrbkSV+6eyaacwvlpjiZDaVVQeFmjxXNRuLZjMlC75H+qCHjVm/cZIzHSdiaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTMNmes5XXDT1HI6kYS/TKsjMmtXdVHvjezy7+D66s07N6DUYT
	deII891UR5Aa1l0kBnep0eavPbtCxfjRftCqwksrRf5pAIzszomvBuv132BlsrXPQJOdGxT3hWC
	Tc6K5koxeNkaeCb5Wy+RtdSk0AGiDol2bQ9s+8Smq
X-Gm-Gg: AeBDiet793hjSwgVYVEcpP1HBElOx+FDQR+9kQNhaZwusWz63TGZfT/MpqKWa01FfjE
	KOFIJLtLkhwwFUSf6hceFODk2Kaak1EyoCAGa/VWtjFkGwfKeX/MXCi3LeCMTgT/dDYuvPdhIL9
	cli+PqmQSdjI9VrJiuYv7YxOlg//2Z+NawAhQxRFMx1CXUJjFCYQbuROZB5zl4gfPcjakbunZvj
	Hj5G0DY/UGYhRTtyrkKmHyC9pSupbM9BiBRipWmTCZFwwrj+wdi3GXmmlrg3gQJWOugTJFrFVvL
	KkV7a/I8/WBk5auS3XBljgoZG3O6t9XEuBbeBpJ0Ueg4n9013yhK26tWVR5QDk7qbT8RHhzT6Ij
	x76Gfaw8OKK4oiog=
X-Received: by 2002:a05:651c:4209:b0:38e:d870:1db5 with SMTP id
 38308e7fff4ca-38ed8701e80mr69433801fa.7.1776949140643; Thu, 23 Apr 2026
 05:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com> <CACT4Y+bMH+q2C7Xg9oHRP5ZbmvLpMpYzrdAd7B6XoXYc8=22sQ@mail.gmail.com>
 <84e0a8f6-c24c-469a-82a4-e82e33b764b4@efficios.com>
In-Reply-To: <84e0a8f6-c24c-469a-82a4-e82e33b764b4@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 14:58:48 +0200
X-Gm-Features: AQROBzBMZhPIR5gRUuR2Cv8QJN7ZCnPb8ovR-0L9yVQuuYL1RfgenAYTSh02Kxg
Message-ID: <CACT4Y+aSvv-n4gknRm8D=pLGsnh7PU3f5MTJSq4tTPqUWn80+A@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Mathias Stearn <mathias@mongodb.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>, Michael Jeanson <mjeanson@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 at 14:53, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-04-23 08:36, Dmitry Vyukov wrote:
> > On Thu, 23 Apr 2026 at 14:29, Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> >> On 2026-04-23 01:53, Dmitry Vyukov wrote:
> >> [...]
> >>> +linux-man
> >>>
> >>> This part of the rseq man page needs to be fixed as well I think. The
> >>> kernel no longer reliably provides clearing of rseq_cs on preemption,
> >>> right?
> >>>
> >>> https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/=
rseq.2#n241
> >>
> >> I'm maintaining this manual page in librseq.
> >>
> >>>
> >>> "and set to NULL by the kernel when it restarts an assembly
> >>> instruction sequence block,
> >>> as well as when the kernel detects that it is preempting or deliverin=
g
> >>> a signal outside of the range targeted by the rseq_cs."
> >>
> >> I think you got two things confused here.
> >>
> >> 1) There is currently a bug on arm64 where it fails to honor the
> >>      rseq ABI contract wrt critical section abort. AFAIU there is a
> >>      fix proposed for this.
> >>
> >> 2) Thomas relaxed the implementation of cpu_id_start field updates
> >>      so it only stores to the rseq area when the current cpu actually
> >>      changes (migration).
> >>
> >> So AFAIU the statement in the man page is still fine. It's just arm64
> >> that needs fixing.
> >
> >
> > My understanding was that due to the ev->user_irq check here:
> >
> > +static __always_inline void rseq_sched_switch_event(struct task_struct=
 *t)
> > ...
> > +               bool raise =3D (ev->user_irq | ev->ids_changed) & ev->h=
as_rseq;
> > +
> > +               if (raise) {
> > +                       ev->sched_switch =3D true;
> > +                       rseq_raise_notify_resume(t);
> > +               }
> >
> > There won't be any rseq-related processing for threads preempted in
> > syscalls, which means that rseq_cs won't be NULLed for threads
> > preempted inside of syscalls.
>
> Let's see if I understand your concern correctly. Scenario:
>
> A thread is within a rseq critical section. It exits the critical
> section without clearing the rseq_cs pointer, expecting the kernel
> to lazily clear the rseq_cs pointer eventually when it detects that
> it's not nested on top of the userspace critical section anymore.
> It then calls a system call _outside_ of the rseq critical section,
> but with rseq_cs pointer set. Based on the rseq man page wording,
> it would then expect the preemption within the system call to guarantee
> clearing that that pointer.

Yes, this is the scenario I had in mind.

> Here is the relevant comment block in the man page:
>
>                       Updated by user-space, which sets the address of  t=
he  cur=E2=80=90
>                       rently active rseq_cs at the beginning of assembly =
instruc=E2=80=90
>                       tion sequence block, and set to NULL by the kernel =
when  it
>                       restarts an assembly instruction sequence block, as=
 well as
> >>>>>>>>>
>                       when the kernel detects that it is preempting or de=
livering
>                       a  signal  outside  of  the  range targeted by the =
rseq_cs.
> >>>>>>>>>
>                            ^^^ this
>
> The whole point about lazy-clearing of rseq_cs is that it _may_ happen wh=
en
> the kernel preempts or delivers a signal (or at any point really), but it=
's
> just an optimization.
>
> Updating the manual page with this wording would match the intent:
>
>                       Updated by user-space, which sets the address of  t=
he  cur=E2=80=90
>                       rently active rseq_cs at the beginning of assembly =
instruc=E2=80=90
>                       tion sequence block, and set to NULL by the kernel =
when  it
>                       restarts an assembly instruction sequence block. Ma=
y be set
>                       to NULL by the kernel when it detects that the curr=
ent
>                       instruction pointer is outside of the range targete=
d by
>                       the rseq_cs.
>                       Also needs to be set to NULL by user-space before  =
reclaim=E2=80=90
>                       ing memory that contains the targeted struct rseq_c=
s.
>
> Thoughts ?
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
