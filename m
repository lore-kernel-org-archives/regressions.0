Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB423CEB8C
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940766; cv=pass; b=UXuGwKG7+qx7RqDeoETe+86oYnL0NkCkhxNEMHw93TRCwxO48iWS7QOSf42nzgVAa2mH3AvJQtNdTRdP1U+MNlSa3nzOxAkMM4Z/Bzzj05U9VMqnuZXeMYNgcS9yYQASWI/IvDakRj36337mYT2H98kT1rAW2Yb+58WUEfMF33E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940766; c=relaxed/simple;
	bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rV/FPFvbpcs80Bf9nCv0H+xvDJDfKChFyZ34FYh1Tg91gKOh+07YUhXzqCDAvarmnJAM7H7cdRiiDrOv9ZO0rwR4AeUl8usuadpF9nuGdECNTqHDsDIiVcc6I2tyyESjLniG3GnXeGgbrdTrMmrfhwZsCL7KpFyxgnqpcdow5ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=GJF2lkSA; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="GJF2lkSA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso8950235a12.1
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 03:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776940763; cv=none;
        d=google.com; s=arc-20240605;
        b=Es7uMq3B2Rez9GYoefswzGWTei8YkthlSGTDqzrOM7GhpVxrDcU4WMi6pb6ulEMS4U
         IUqL1ZR3/wvImahCf6I+ZV+BfiFOob8zyAlPry8y/O+8wLfq5dPk8sMmV1Ek303gfyX8
         Clldf/nn/S5uXiR6Kjlpy3YcZPTYqOy8aTrt0mz/VmX0RjkOy2U0Hg0J7UTYl3mNosnp
         ITS3oB7tNSYX96rLI8PqrZQmOfJ3lgyPmZ3gj1s9bvyh2kBtiq/oKuGOQJyNi1vfPnW+
         0hTUbidjavr3qs5ffmZAHL8hYa1h7+el2dZ3WX/m0Sa5xEnjz28/jWnpgl4MeE5WS31/
         JGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        fh=IFOZDS1u1tqedu+vp4IxAPyw0WJ8m/jWE4ZKBnEz9/E=;
        b=D9JTHTYia9JP6zVnpiHBlWptq9uLgHdXi/QlBTfYbgZRTVH9c2Vmm+4XLFITfzAtzM
         aH8trlagp7PRHfKKggAHd9lDjpbHdb1KaSmSu18sq92uNeip3RlSJVd28mGaGk6da2CC
         0hAheDxiB3M8sE3GAHtV6CaUSqCwysXXC8gNSCkupfsJxrPmuPcg7dwi04It4lTAPLFZ
         Kx3jfDtHDV+V94SahYJAL1ZlBupqVYOUGsswz2P6ebNcVeD8y8Gg/9r6j5fO4101JnFC
         T6XyLcsfg66dmDiVg4Yniygk8Nxnjs7icfN0aKCc8M8IXIeHcKAIxDPQytaDim41yIYC
         e6Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776940763; x=1777545563; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        b=GJF2lkSArx7tZjSz5n/PYKRpDsowgsKm0D3F/vesKRyiA8g1hWpo55HmJJnZzP0YQv
         0BHsO/lHo0tGpjwt4qwFb2l4peFqnGgwEVITL1Apl8KCWymATi4yvytIh1kpXUlTFud8
         wLfH8AMxaGPBruVhPb8RoG+aeyFx4UnGRIk9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776940763; x=1777545563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        b=aVdpASVn8IAXBJ3CRGjW3YIY2c8VoXJ6JbsrhK0Gn5j1cWSlkYIOTMoD9MuZE3oj1o
         rwUZQuB9zvNDeIFBihB5yk2jEXcVLH1azeH3+tADsEelv7vyQMG1WZbQfBQrnuJLyN+C
         lTsM7hCXIxt4LAVTLhmd8sys0qL2O/OT6n8o1p3RXcWAXdFgguBuHULGojo6V3tu/JjT
         oo3UPvprZwqHjrqydiLjrqh2yqXGZqUkTcfcbwD53BAS80f/epRB4g2/O35LlK6Rzaql
         wk2SuqOl+x9AykQZJBhRB+QBCoGs209IJlKR1lesIA4suXvwFb51J0brCmtDhgfaGfms
         WadA==
X-Forwarded-Encrypted: i=1; AFNElJ+XKvoHEtmcz7Dw4a93Om0A7oUDpPf5eoWoGSjnKveK/hZW+OezMlYHJMtCRrXkQD5kpu+Ohz7AQBrLPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq4LfcBD9X4Ayh4YgrIUruvc9OpGSwhRl+vjvFM3foA2zP+el3
	P04NLU3wp+DfnO4lkGZd8VgwyczyXVDVDrzOzGTkmh8N/5CmKilqrWW0iCMakFADyc9b8fvw3Lg
	r6n2ze82CoEZbX5U5wyXpfM4pNsjb7VemIhOqfWp3AA==
X-Gm-Gg: AeBDietKhg6JDlyqSJ1/r81GrnnIj+K2L2MUY0zmZl+qOy0ppb5k5U+MlhzptQkh8tl
	NOo8zj3ZLQCOvu7wGykM0yxhZoEYSMFND5SJDnaKBFiJ/sHQVvA0J47dSKvlkw/K4m/QMCXJtT6
	evvULSJUxAJSCj+oXaQZodyq1T0Fs3G3gxieIfGtY+5GEZUewuWcgBgUgaXaInHGrQBTmKHRoDI
	IP6a/LFCI6B2EjUi5xHi44dmjle259/Qaq/ymdMLxnSpYg+p2gPqObIkDFGmwH160knF7Ss8h2r
	+9bhEF1UMEPGawk+
X-Received: by 2002:a17:907:97cb:b0:ba6:7e1e:778a with SMTP id
 a640c23a62f3a-ba67e1e78edmr989960466b.1.1776940763204; Thu, 23 Apr 2026
 03:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net> <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
In-Reply-To: <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 12:38:56 +0200
X-Gm-Features: AQROBzDLZqpaRWt1enscGE22sx01XrMi4DwyHGjG6mzxtk-KQGkjwLXmTDGeCv8
Message-ID: <CAHnCjA0zt93wp2jAs6QX3eN+BtR8Xb3iZROzs48xZ3GNrzXOfg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 22, 2026 at 02:56:47PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> >
> > > Additionally, it breaks tcmalloc specifically by failing to overwrite
> > > the cpu_id_start field at points where it was relied on for
> > > correctness.
> >
> > This specific behaviour was documented as being wrong and running with
> > DEBUG_RSEQ would have flagged it.
> >
> > The tcmalloc issue has been contentious for a long time. The tcmalloc
> > folks relied on something that was documented to be wrong. It has been
> > reported to the tcmalloc people many years ago and if you were to run
> > tcmalloc on most any kernel (very much including 6.19) with
> > DEBUG_RSEQ=3Dy, it would have yelled.
> >
> > The tcmalloc people didn't care. There was a proposal for an RSEQ
> > extension for what they need, and they didn't care. All this should be
> > in their bugzilla or whatever.
> >
> > The RSEQ rework improved performance significantly for everyone, and
> > kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
> > over because they relied on implementation behaviour that was
> > specifically documented to be broken. And they didn't care. Google was
> > very much aware of this. And hasn't lifted a finger to remedy it.
>
> Also: https://lore.kernel.org/all/874io5andc.ffs@tglx/

(Sorry for the resend to folks who got this already - I got an alert
that it was rejected by the mailinglists because it contained html so
attempting to resend as plain text)

I won't claim that tcmalloc _should_ be abusing cpu_id_start as it is.
I agree that it seems questionable at best. However, I will strongly
disagree with the following comment in that message:

> What it not longer does is updating the
> CPU number for the preemption case on the same CPU
> because that's just a massive waste of CPU cycles.

I don't think it will cost _any_ cycles to implement what I proposed.
And it especially should have no impact from just enabling rseq on a
thread as glibc now does. It should only result in different
instructions being executed when the program actually _uses_ rseq by
setting the rseq_cs variable to a non-null pointer. I will repeat the
proposal with a bit more commentary in case you missed some of the
details that make it free:

Any time a critical section might be aborted (migration, preemption,
signal delivery, and membarrier IPI), the kernel _already_ must check
the rseq_cs field to see if the thread is in a critical section [and
if it is null because the program isn't using rseq critical sections,
no further action is taken]. This is documented as nulling the pointer
after (I assume to make later checks cheaper) [if this changed, then
it *is* a change in _documented behavior_, not just an implementation
detail]. It would be sufficient for tcmalloc's internal usage if every
time the kernel nulled out rseq_cs, it also wrote the cpu id to
cpu_id_start. [This is one additional store to a cacheline you are
already writing to so it should be ~free on modern OoO CPUs and cheap
on others. There might be a small cost to loading the current cpu, but
since nothing depends on that other than the store, I still expect it
to be ~free]

To make this more concrete, I am proposing adding

unsafe_put_user((u32)task_cpu(t), &t->rseq.usrptr->cpu_id_start, efault);

after each place where you currently do

unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);

in rseq_update_user_cs. Is that something that you would expect to
cause a performance issue?

Again, I'm not claiming that it is "good" that this needs to be done.
But it does seem like a small price to pay to keep existing binaries
working on new kernels. Quoting the first paragraph of
https://docs.kernel.org/admin-guide/reporting-regressions.html:

> =E2=80=9CWe don=E2=80=99t cause regressions=E2=80=9D is the first rule of=
 Linux kernel development; Linux founder and lead developer Linus Torvalds =
established it himself and ensures it=E2=80=99s obeyed.

I don't see anything on that page that says it doesn't count as a
regression if the userspace program "relied on implementation
behaviour that was specifically documented to be broken".
