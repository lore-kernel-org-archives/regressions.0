Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211BD372ECE
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017432; cv=pass; b=DEIUYUSo8oM48JOp6btRt3ifWZDpotH4f5rXBiM7lXXtvJiE1P2FgsA1qV7/rOUiAKZI1oVRSAO+bX0JT3O+5JK2WcFXxsJAigsnQoP/xFOh+74Ysy1La9P8lF9Uum2ZNbeTQ31OtQOb2RaybvaHneiAUrPq6gX5jY69RHok+Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017432; c=relaxed/simple;
	bh=HCb0SMH+1JGy/xLd8LWsIFi5YiWSKOjijV9SvLdq1C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp2u2+Uz3n4/DPs6GfIVkrPGEaJKitqTRbpLXiMPBXllcogrYBfxLRwmyrcdqWeHBpxtVio7qjS60QZXxZUqMXphO6FB/30juz65d0fW+AifidNP9k8QXQ8JKyjNlk9Z0T1U63YGfnbnj0RytUG7QiuHL2QUdb2R+ahNRMha8MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dkv5jnF9; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkv5jnF9"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso8406329e87.1
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 00:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777017427; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf0iDcUAz+n0DWu7jsE0m7PBzhQm0bdjM3NDaG+4C9pACH8bgPjK+bYgAPxrGDMevz
         eaX0QhBzV/t8jOrTTl3uSIYBhpBuliaBODe7e0Jq1AQgxwfe8KAyIZMJLBdyh+L6orZb
         NzDbKgNzhXG+QkhfC9SwEc+KVlKdJaLyxAD3lxZpZEfDuqta6rRC3MzGW5IC/fMG8OKz
         HYUyRfaGjAVt+jpaDyMj2yHiWaPYatMJB4og1UVKEBmMBbpwHFXcs1LjulxQw0LD+n9P
         7C/JUnJfoxRtVs7kiRlkF6A5zJGSK1YotSxzZsQnkJRu8EOSvGycsifRI+Zvwsf+GJ2+
         M1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        fh=ADQj71S1wU6N7Sz2ToE+2jQGYHMIkRkrlyqxnzTQA2Q=;
        b=IVH7fFv6U2/2heplqkA2Uts+ORJ2UdbmlD1uBUiV7XFn0fkjlPKnGJtuWSH3rWYJE5
         YuMQBXKT1AlfWe83PR5rW/vMhs2DZJ8RdJ9rlk2MTvcLY0dL23uZpXhIImq6ZA1C63l0
         yB6ydR5kVbJyaTrHzMMXQMfi2hNLfskem29XFjV/ESixHSVcEII/z6XzTBGCxQuFvOJ8
         54IP86ArRMgyVTPc5LhW05DbAItmMDzFF3RJNHtBKn4PLtJkv8ryEipvZo8RpjqIHdnh
         Q/jJ1wkGv1A9VvJzWABeA0sFhzw4HY8Bx8EEEcpi5Akrl1vh8lYyu62dlJitzIdqm+3V
         7Lbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777017427; x=1777622227; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        b=dkv5jnF9a9BADhxD4mgeQiwcV3scWsUtiesUPRwfhWnts9/i0nM6IML000hpT73GXj
         fxb9nRwnDTClRepknsqJ4CiPMwEBFvWNPl5LJw8amSixcw/CqIAGTfAWJ4k6UG0jhDve
         i8ifTVXJ9JxYeEhPwP6dY7sirL8+ne/9ZSDjgPaznNbrrtazinBcjiaT4QozFmYTmslJ
         0GxzyVIlEUZ7RQhBPjRbwSSn/Ok3ZtwiWIxtXu1X5V6luxipOyZ7R2aCJE750qij6oLD
         umJwl08puXkBumGOI4F6Awn0x+/PG/CnlpPAkoAogPRP6BK0xRspNm3Q3aVfDcEDauvR
         NBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017427; x=1777622227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        b=W8hXHXak5pM9Wcs/5uLBqUhmlJ4AvENEnwCxLf/85EbkBuh5zIT+30SLUIDbehVnQ0
         jIW91h+8F5gIuMa+KxtBsFdFfMVnPDxJSYajm+sgANQYbSNBfhz7qGvezq85QEnOHR6d
         UR4NURfrEhA4seI3ryuxd1u+FkiKHulhmX9YptLHFAW+149E5AxPDrIPhAy3RL419jZH
         TYoi6pVamOrAp8/f6qY5RMBRK/15udSx+jnNuyK0xGUmbCF/OameVBSSvU0FvVl+V1zE
         VGPd2AFZyzy5ZItEI0h9MkPNvfMz66i7Pcn/J7IkN3O+VbZIDHJOKp+8iUWKi9H7W8Dn
         3LsA==
X-Forwarded-Encrypted: i=1; AFNElJ+T0BlXec/GqmX5O/4fCBplN6tdT+0zMh24LMyD4ce5cg4QNDmiCkkV9Mbd555yZb2fjlT5jT3rQ/9PwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0f+4F5h76lHdZ4Drc4Bnfly3e8BrtMlJF3FAeoADjhilKAtML
	Q1bEPdZEM4ROWciDvlQdEJrcMicpTAOVkWt0pR2vDyyhdhme/80oCnHApcNKo2R0n5i+34uo1uQ
	9UY2kb9xRkZyA3IKQWpf6enLiaX+aGB4ZN12IMTA2
X-Gm-Gg: AeBDiesmR78wusK/rJkl7upPPeD93+Sert6/WLby5EJAuk8YRunmuUxfFDmyIm/zR38
	h+nV7F69vclT3NaqqKhif6YEJ6txg9x11fuadwAzLH8eUe3omnAgaK5NH/8BWlVre8dk9QyqF2N
	XFj3jtS3bugWgEEno6tDtzm4WVEkvNHE6elY1OQPu1PRwKx+j9YMj6/OU+djspGVbknWIeaP/Mh
	C2xhoAUQ6iaMeOlSSv+6kSpOAr3/P4sY+ZZghWMJKHWOXyqlh1ob4rqbVuhAhh1r1z/aoJfphPJ
	xlR8D0c8HuqcSBv0ya4S0GQvfPz+PyghNWwHSkkw7fyH6NLOmRLs0SvLzP+v5OUv2FMP3iRYNrV
	MsRYmZCQj6KBpmuqENvA7yf4cyto=
X-Received: by 2002:a05:6512:61b3:b0:5a3:e7f1:5946 with SMTP id
 2adb3069b0e04-5a4171766e8mr10818350e87.9.1777017426431; Fri, 24 Apr 2026
 00:57:06 -0700 (PDT)
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
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
In-Reply-To: <87a4ut1njh.ffs@tglx>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 24 Apr 2026 09:56:54 +0200
X-Gm-Features: AQROBzACQ3yI2kl8vg3Kcy5MxWLQ9Q6j6OYD-UEZj9wyuB3F1SqwdpFTVc0GJDU
Message-ID: <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathias Stearn <mathias@mongodb.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 at 21:31, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, Apr 23 2026 at 12:51, Mathias Stearn wrote:
> > On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutron=
ix.de> wrote:
> >> The kernel clears rseq_cs reliably when user space was interrupted and=
:
> >>
> >>     the task was preempted
> >> or
> >>     the return from interrupt delivers a signal
> >>
> >> If the task invoked a syscall then there is absolutely no reason to do
> >> either of this because syscalls from within a critical section are a
> >> bug and catched when enabling rseq debugging.
> >>
> >> The original code did this along with unconditionally updating CPU/MMC=
ID
> >> which resulted in ~15% performance regression on a syscall heavy
> >> database benchmark once glibc started to register rseq.
> >
> > Just to be clear TCMalloc does not need either rseq_cs to be cleared
> > or cpu_id_start to be written to on syscalls because it doesn't do
> > syscalls from critical sections. It will actually benefit (slightly)
> > from not updating cpu_id_start on syscalls.
>
> I know that it does not do syscalls from within critical sections, but
> it relies on cpu_id_start being unconditionally updated in one way or
> the other.
>
> > It is specifically in the cases where an rseq would need to be aborted
> > (preemption, signals, migration, and membarrier IPI with the rseq
> > flag) that TCMalloc relies on cpu_id_start being written. It does rely
> > on that write even when not inside the critical section, because it
> > effectively uses that to detect if there were any would-cause-abort
> > events in between two critical sections. But since it leaves the
> > rseq_cs pointer non-null between critical sections, so you dont need
> > to add _any_ overhead for programs that never make use of rseq after
> > registration, or add any overhead to syscalls even for those who do.
>
> Well. According to the comment in the tcmalloc code:
>
> // Calculation of the address of the current CPU slabs region is needed f=
or
> // allocation/deallocation fast paths, but is quite expensive. Due to var=
iable
> // shift and experimental support for "virtual CPUs", the calculation inv=
olves
> // several additional loads and dependent calculations. Pseudo-code for t=
he
> // address calculation is as follows:
> //
> //   cpu_offset =3D TcmallocSlab.virtual_cpu_id_offset_;
> //   cpu =3D *(&__rseq_abi + virtual_cpu_id_offset_);
> //   slabs_and_shift =3D TcmallocSlab.slabs_and_shift_;
> //   shift =3D slabs_and_shift & kShiftMask;
> //   shifted_cpu =3D cpu << shift;
> //   slabs =3D slabs_and_shift & kSlabsMask;
> //   slabs +=3D shifted_cpu;
> //
> // To remove this calculation from fast paths, we cache the slabs address
> // for the current CPU in thread local storage. However, when a thread is
> // rescheduled to another CPU, we somehow need to understand that the cac=
hed
>
>                   ^^^^^^^^^^^
>
> // address is not valid anymore. To achieve this, we overlap the top 4 by=
tes
> // of the cached address with __rseq_abi.cpu_id_start. When a thread is
> // rescheduled the kernel overwrites cpu_id_start with the current CPU nu=
mber,
> // which gives us the signal that the cached address is not valid anymore=
.
>
> The kernel still as of today (the arm64 bug aside) updates the
> cpu_id_start and cpu_id fields in rseq when a task is rescheduled to
> another CPU.
>
> So if the code only requires to know when it got rescheduled to another
> CPU then it still should work, no?

This was my first thought too:
https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgkQSt_=
OOmYg@mail.gmail.com/
The only problem is with membarrier (it used to force write to
__rseq_abi.cpu_id_start for all threads, but now it does not).
Otherwise the caching scheme works.

I have a tentative fix for tcmalloc:
https://github.com/dvyukov/tcmalloc/commit/58d0eca91503f539b26d20b6f55fb2f6=
f8bc0c37

The crux is as follows.
Tcmalloc needs to make all threads stop using old cached slab
pointers. The stopping procedure is now:

slab->stopped =3D true;
membarrier();

and all rseq critical sections now check the stopped flag in the
cached slab pointer. If it's set, the thread does not proceed to use
the slab.




> But it does not, which makes it clear that it relies on this
> undocumented behaviour of the kernel to rewrite rseq::cpu_id_start
> unconditionally. I'm not yet convinced that it relies on it only when
> interrupted between two subsequent critical sections. We'll see.
>
> ....
>
> Now we come to the best part of this comment:
>
> // Note: this makes __rseq_abi.cpu_id_start unusable for its original pur=
pose.
>
> So any code sequence which ends up in:
>
>    x =3D tcmalloc();
>    dostuff(x)
>      evaluate(rseq::cpu_id_start, rseq::cpu_id)
>
> is doomed. This might be acceptable for Google internal usage where they
> control the full stack and can prevent anyone else to utilize rseq, but
> in an open ecosystem that's obviously a non-starter.
>
> And they definitely forgot to add this to the comment:
>
> // Never enable CONFIG_RSEQ_DEBUG in the kernel when you use tcmalloc as
> // it will expose the blatant ABI abuse and therefore will kill your
> // application.
>
> If your assumption that the rewrite is only required when rseq::rseq_cs
> is non NULL and user space was interrupted is correct, then the obvious
> no-brainer would have been to add:
>
>         __u64   rseq_usr_data;
>
> to struct rseq and clear that unconditionally when rseq::rseq_cs is
> cleared.
>
> But that would have been too simple, would work independent of endianess
> and not in the way of anybody else.
>
> But I know that's incompatible with the features first, correctness
> later and we own the world anyway mindset.
>
> Just for giggles I asked Google Gemini about the implications of
> tmalloc's rseq abuse. The answer is pretty clear:
>
>    "In short, TCMalloc treats RSEQ as a private optimization rather than
>     a shared system resource, which compromises the stability and
>     extensibility of any application that needs RSEQ for anything other
>     than memory allocation."
>
> It's also very clear about the wilful ignorance of the tcmalloc people:
>
>    "In summary, the developers have known for at least 6 years that the
>     implementation was non-standard and conflicting with other rseq
>     usage. The github issue which requested glibc compatibility was
>     opened in 2022 and has been unresolved since then."
>
> Thanks,
>
>         tglx
