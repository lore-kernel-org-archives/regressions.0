Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF203806D9
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776923651; cv=pass; b=WcG6GdQxwZoQ/1bz4LQTNAlkGe1GcCw3b36st9nhZhEwv95GmeU92Zoof3PjwE+mbbyG/i4MD+V6ftnyVaxYjrAW/SJugV5PssyUJjEcEr9EsFx7pUMGjQb+Pi7z1ZklE5eYR9znJDqQEAzvk9GH1wFHljSq1i2qb869ATiLHWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776923651; c=relaxed/simple;
	bh=vHrBdwKKKidXyWyBJfuc2Ee2FZ3EZtkXD+yyVir6jas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKQPYUiwR0pITOJnFi2zC/5bousSHi9KtLwnB0Xad6IpLSGFwERwmbJgSImaLBnHO4OS1CyGBU0yiAKd6pYEFMLVBl7zO/IprvtpuXx/8KVm9ZKUR/ffumoVWjJsObFQgQ22VYyW7UU0n7nM0SZIXvpYCAkJV2+TyK119Jq+ouo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGRYngD4; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGRYngD4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38cc8708d76so53166501fa.3
        for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 22:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776923648; cv=none;
        d=google.com; s=arc-20240605;
        b=E6PD3CBBEfF88QLiniVnsvZjnZfeiwrlLZW62R2xQ6CwamMkLe42viucX6DgU/+q1R
         MmSWD7A298hvb+Po49gEhW+Wx425VJ7YL8DPBI8pAOo8G69fAoK3MFxy/fzP2RSFAa0s
         QqwDV9GrG9bEAjrDT8XC24mI3OdtrEuS4m/Am88l7vCFmOA6j0Eqh7kYbqLhw3+FzvEP
         iLH5bysH5nmWjVquSrmszONwDI1FfjLJW30vWPo5Zhu8xpXJ/0uEgtCHbjvdqzn++mAn
         giEbirnCComTepr2itN6dXx85G0tSfbTVk2CZoVTxY7kr7s0IIHDwcfeqSPoPL4fW7xY
         49Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        fh=2PeQGw+n3cGytGwIVuGF7FXOZCwhiL+poM1RZynbch8=;
        b=OwjnvjPCtBSMg0oyd8T0ZBICZ03FaqF9o6TXGRztMJNUzIGnv31buSQq7JDrTs5osD
         GN+o/MGLgupwqN76soeeJ/npNlfPYfAfsai0OgcAgjEeTpFmifW7yaB4pd5YGF/Qb1d9
         EH9Q97lvOzFDJM/qFKfE1tcctV2vy5op5p9hX7ma5lD0aOyBNYebFXEWj1bJ+/9TuEGg
         hzcKS9BS339XrkCPS7ChyD4up6tpkwQmfaZgfsO+zGV8a8bAuOOlVb+KJBW069p6+Whc
         i27jXv4s7IfM5yjkyfsLMiOormOZhdx7EDTCtk7slBsaDxJjN38ih5H5T4/QsTcjys8h
         urSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776923648; x=1777528448; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        b=YGRYngD441dpt/j6IH9PregKjU+Xoc4Z0S/GV4p83hrccQr9IRkstBmoIGpFwEEvWX
         /CQ4Mfm2Rw9Eldwuw5uWkT9xECEGBNEyVMVFUmkyEiyp6+W/Y0KMhX2yus5AbD9mfLZK
         odqIw9JwjskOL4g411+ORKSkN5noMa34+Xx53PNfXNlFaold1vU+qatPkVSgt0GVDDtQ
         5Cnq6BWvv3XUAesZJ++HfV8ALG+REKHC2MSNmDo+tKHtq4NsIOSQomPY5pNM5JRNxN+s
         DT8+PaOZkjcN7FEdZl3A1CYPZd4tc6CnreLJDMfzCiX0KPRtHCd5gAlZn8YVgoXmaR5y
         gfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776923648; x=1777528448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        b=Us/On2ydpzlwUtz8wjUJDdQCXIxkVpvmPV08irWvd8HwgL3Z+0dvrLOs6na+VmsBC2
         A77GaelYBbtzpQjWhrQHABtRdRq3ky2cHs/eTnzraOKjmXamO/abj5H+AjQK6oUbApWr
         HP+MRf5UaBzWrvNI0CEl0zyDIWQLUz6ZjKUlvkwwq9uMG1AANRPCec+XLnKrR37Ig1uK
         uRVV8F9RuIJu7wTiXzyexU+HGk6ruvFOtuIue93xdJS8MSrCV9A5n4VnNSqQxLnLk/SS
         0Cf7P3X6yRAjI3F0STeBohRwZSVHuUrFuEStTDaN4GykXZg7t1zZCqaZh1Wyi4eYqpLj
         vTwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vBg0pgatk09bkMUj/AoeYVBGf6iv77ezbVSR7bRQxoTixGBmdINJ7GaJx2aXz9q1iAvwt4sC7zxroiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ODjOOoA/0pFLjsRj3BbbqjwsDGCeIu+hyCXoG4b49OYoD96L
	EhfADJVFlLcCsUzdsG21mjR+nNivz4brtPvHRii7o/so+NnNtQp90aJKT6efzXTiJI2Cwcc5iI+
	D4a0Z54O6+6YtqC7nXWZIEtTvzwTUUKKall3qqmXs
X-Gm-Gg: AeBDiet1f5IkXh1m25Hsyi6BxChDZvOhnjNNAtiG7vzTbzwqnBFJO6CnLkqZch+uU7R
	d4b6do3zc4MnQU35RnuwPSPfIKAFEts2wM8ZhqkHFj+cGlH60lcTCULEtBGzw4FUnw9GrqiDlSN
	dxyJrA1xloCtVKw5siDXxolDrIy4B8hqObfbkhmlkV6JKOE8quTvMZbCbkIYfuxS+eKOlaxWGeL
	iFWh2ftxbadvjFW8ORUAUrQBi4oUebmVWlKMlN+U2riyw5SMraXWIAYGK5k0qnxmsj9DmHx01Db
	Ah2eWB2/jhnsemNXaxzIcYzmg06Q1HI/7DI+u6Y0yPINmXS8vZwog4MIZV3LciKkQDYbCWlM222
	cCraYHdp3oFqCM+EbYw==
X-Received: by 2002:a05:651c:555:b0:38e:99ba:ec77 with SMTP id
 38308e7fff4ca-38ec783f2ffmr78727471fa.14.1776923647481; Wed, 22 Apr 2026
 22:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
In-Reply-To: <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 07:53:55 +0200
X-Gm-Features: AQROBzDiWg3BhfVAmxsSMzsrj4-DDyCRyJJ_hjD1dpJPTaQSNdduKsPUw0QTTv0
Message-ID: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Mathias Stearn <mathias@mongodb.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 03:48, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> On 4/23/2026 3:47 AM, Thomas Gleixner wrote:
> > On Wed, Apr 22 2026 at 19:11, Mark Rutland wrote:
> >> On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
> >> Conceptually we just need to use syscall_enter_from_user_mode() and
> >> irqentry_enter_from_user_mode() appropriately.
> >
> > Right. I figured that out.
> >
> >> In practice, I can't use those as-is without introducing the exception
> >> masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
> >> so I'll need to do some similar refactoring first.
> >
> > See below.
> >
> >> I haven't paged everything in yet, so just to cehck, is there anything
> >> that would behave incorrectly if current->rseq.event.user_irq were set
> >> for syscall entry? IIUC it means we'll effectively do the slow path, and
> >> I was wondering if that might be acceptable as a one-line bodge for
> >> stable.
> >
> > It might work, but it's trivial enough to avoid that. See below. That on
> > top of 6.19.y makes the selftests pass too.
>
> This aligns with my thoughts when convert arm64 to generic syscall
> entry. Currently, the arm64 entry code does not distinguish between IRQ
> and syscall entries. It fails to call rseq_note_user_irq_entry() for IRQ
> entries as the generic entry framework does, because arm64 uses
> enter_from_user_mode() exclusively instead of
> irqentry_enter_from_user_mode().
>
> https://lore.kernel.org/all/20260320102620.1336796-10-ruanjinjie@huawei.com/
>
> >
> > Thanks,
> >
> >         tglx
> > ---
> >  arch/arm64/kernel/entry-common.c |   14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > --- a/arch/arm64/kernel/entry-common.c
> > +++ b/arch/arm64/kernel/entry-common.c
> > @@ -58,6 +58,12 @@ static void noinstr exit_to_kernel_mode(
> >       irqentry_exit(regs, state);
> >  }
> >
> > +static __always_inline void arm64_enter_from_user_mode_syscall(struct pt_regs *regs)
> > +{
> > +     enter_from_user_mode(regs);
> > +     mte_disable_tco_entry(current);
> > +}
> > +
> >  /*
> >   * Handle IRQ/context state management when entering from user mode.
> >   * Before this function is called it is not safe to call regular kernel code,
> > @@ -65,8 +71,8 @@ static void noinstr exit_to_kernel_mode(
> >   */
> >  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
> >  {
> > -     enter_from_user_mode(regs);
> > -     mte_disable_tco_entry(current);
> > +     arm64_enter_from_user_mode_syscall(regs);
> > +     rseq_note_user_irq_entry();
> >  }
> >
> >  /*
> > @@ -717,7 +723,7 @@ static void noinstr el0_brk64(struct pt_
> >
> >  static void noinstr el0_svc(struct pt_regs *regs)
> >  {
> > -     arm64_enter_from_user_mode(regs);
> > +     arm64_enter_from_user_mode_syscall(regs);
> >       cortex_a76_erratum_1463225_svc_handler();
> >       fpsimd_syscall_enter();
> >       local_daif_restore(DAIF_PROCCTX);
> > @@ -869,7 +875,7 @@ static void noinstr el0_cp15(struct pt_r
> >
> >  static void noinstr el0_svc_compat(struct pt_regs *regs)
> >  {
> > -     arm64_enter_from_user_mode(regs);
> > +     arm64_enter_from_user_mode_syscall(regs);
> >       cortex_a76_erratum_1463225_svc_handler();
> >       local_daif_restore(DAIF_PROCCTX);
> >       do_el0_svc_compat(regs);


+linux-man

This part of the rseq man page needs to be fixed as well I think. The
kernel no longer reliably provides clearing of rseq_cs on preemption,
right?

https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241

"and set to NULL by the kernel when it restarts an assembly
instruction sequence block,
as well as when the kernel detects that it is preempting or delivering
a signal outside of the range targeted by the rseq_cs."
