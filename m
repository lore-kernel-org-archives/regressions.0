Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56D3E8C54
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947790; cv=pass; b=Z87ZDdYRgYXmyloxOxMqSx9pEg7CJIIryEcyYjHJzqrqLrnxAGz6a3DZOibLliV75Z82eIHtq1bXXGbU6kx+S2PxDfm89vhDg9aCh4KzceNTR5kMjgmJ58eCh/e62M44oDiExisuAt1ZT39LsWfZJjWClTc4JIMW69hapmpst1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947790; c=relaxed/simple;
	bh=TKhCTQv37tUfdCqzTtpw+wDi6EmFC1dW3WGcHmM9ocY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eR1BrEnmJpvlB51c8MdGv40sv09d5hlT0P3hjZG+SMq4R6IUAyoW9681ABiUQgjvn0E2qg6m7pJBceeoW7L8XGXLSOVKv8q6Qf8Euu58BKyvrr+s1xSxv4hu1Pzq6rTVQLNLUcTkthS+5Mc0PjlMHHMt+z7eOggB31htDkvbxvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tWBYXuvP; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tWBYXuvP"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38def541b0bso57592261fa.1
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 05:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776947787; cv=none;
        d=google.com; s=arc-20240605;
        b=YoDlnol5VPk0yEequOM07dJknBEP/b1Fkke0XhySqjaCW1cm0YdGeM5toTBPOGNzx3
         2qQRacUkbysOyW1I/wZiWbdos9sW/3GP5yPNKYAUA4Sc4ezhYx71MqXKooyQPax8A/8T
         ruPIxVxXFOVRVtdFoJ6GNFys5dEoR91lv+6x3By5E0lC/wujz22sU0UUrfQer9jFu3EG
         2nlE21FoamjHITjtGvtFnDVUhRzX6+0oEZUvbJ7eCA32GgHa6u6HediSbf3bQbykiFus
         6HTR/d1iTkxB1AI+rEkxwNjbFXfh2Tcj8OLxLi78chPmTsGxSKo8u0o2Ows6f3KCeac3
         Rm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        fh=XuiyPa6Adr4aPArgtwjfaX7TpgS0Js1XHyI6brc6GPY=;
        b=E76Gj49SSgaSZhtGxKx7A/Xj9ReR4baixmrTlVUXzBk43I6iB4WBJnzsgIdWRhZNL1
         hh01VCgNcQLTT/VDaeIGy4OwHIo7fzYEwxuIZtxKg6Ql8wBOnxg2ywg8q8g65esb9Vm/
         C+rFDoE3P0r83ixv42K2aVTomBKTh/T9LOu+zuy+38Vk3uadx1OEXxQxa4GUzyb8NnDI
         YCnUAiDjAId7zr5YES//F3nFzQiQ1TK5sjLQMPqLf9TYyK0kdw0fqcAse6NpPhzNu6uC
         D2F4QyUmDhNt7hWTLf9jBcA+hXPnNLKB1kzn+XdZYwWCgkbJl8aLkahGlAKXQwXNi3me
         Z+mA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776947787; x=1777552587; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        b=tWBYXuvPaeCoyenhR3TlRmngdsH5utfzJQ7c1HJcOOk+QTgT26MNU4+CSCYQI+a/6M
         6A+mRGTVZUwWeFisNYH+NLu1pFFo8ghXNgHpn0Arxa7x3V2j7FC12lbIiZvZptFH/m0V
         4BIZOOYSzeaZZzJMolHS8OaBE+QDI3Ti3/RFFV1wQqfF4MdQbzLzLRdUpV+JZgMnycFQ
         VqPvBZ8dKSCBpDbCJ/AJO1TOPnYbTMCnsgp1rvFVEQsViMdeps5OX627PDD17wcVgZ0J
         DVDzFYQRtzDX8AFvDUJuEboQEZq98nLCwgLVRL2wUwAHgi8hv1QXefz6uEwC+PGiASLz
         RoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947787; x=1777552587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        b=iKMqG1fG3JxjstWNfLK68HBjZIXQVqRSNBtehq6TB2E8/j7qUSRKqngAT4g5rDm+SQ
         LKXWQbjEEEYEvIP/h1AQQyrtS423BZWTi9CxvLSTBEvDVB0qIqDMGfyGSReBR+1myVZa
         uf4csOr8jHYZAaD5jc+gfv8QSG85UmvkMeXMQtnzOtkCEKwOZpxukt6bpRvHit75jn5n
         bB45lino4VJc+BteEoAtCWsr/Wl9j/1eBlNfrbx1lxKl+4PjkaboFI9iF/IBQSWqLpaA
         faVh5nsJbIS01idoPE78Ipv/2ZNFR9Zy1JeGJJJZpam1/7UG5SibO97reoPzGwIBnXMT
         5FkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+WBWM+nrK+g3aoIiVcHsLdAHfLp6N59HaJ4UD3GVGmF/kuGjl+atOT3tVr4MQmF3khSYEj1hE3XyYcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4IiOfg4fcniu//B04guktG4uri6amxaoiFSPTIIlPe+/0p80O
	IohEto7/fZYNISbGXmmKBQfAX5YyokcYkCpePt1XQnmn1kv50df91PTw3oIEE1ASOFYw8tj6nVK
	r9BoS7kLMGav83zIQ/pUhr9WRH4t72OJOiqftmw4G
X-Gm-Gg: AeBDievPx54CwTUsXb/T0ytZp/erWMnpVYqILfpTihloLI7WBzrn6GQCyZ3vDloD7Au
	+i6BKYHrlwXk3ao3e20dnm99GhWdnPYyLqK+tyPWo3EPo4Rc3TynfxRyEEhLssRq9PsJT+WF0ZG
	UBYxx9LHTJlqXf39wLCXiJgrgvSiGksf9mnd72SrGMuip2svpgG/0LBZ0xjYDbrP8fJRlglIStn
	I8PwHq2zCAMZWLFgKQL+YqBsll+gp0jgnk6r/xr9+FeVp2qAR/pxCh249Gj97NIdh1TGbMuDVNl
	slTP+MLO316HUMxUK3SgNfSeZBsOV4t316c6mql1b3Ihwl88TPfB9+/ptHJ5uxfv+xWD9uzNsZO
	6GsMnUJ7hQBJYfHHM5LTfTUUo7g==
X-Received: by 2002:a05:651c:2129:b0:38c:4231:91df with SMTP id
 38308e7fff4ca-38ec7843861mr104639501fa.10.1776947786923; Thu, 23 Apr 2026
 05:36:26 -0700 (PDT)
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
 <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com>
In-Reply-To: <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 14:36:15 +0200
X-Gm-Features: AQROBzBeN0_imLCp4YRP1WQt-rdOLNehWGA1b8A-XdhmUjECxUTrglkEDT8uDp8
Message-ID: <CACT4Y+bMH+q2C7Xg9oHRP5ZbmvLpMpYzrdAd7B6XoXYc8=22sQ@mail.gmail.com>
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
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 14:29, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-04-23 01:53, Dmitry Vyukov wrote:
> [...]
> > +linux-man
> >
> > This part of the rseq man page needs to be fixed as well I think. The
> > kernel no longer reliably provides clearing of rseq_cs on preemption,
> > right?
> >
> > https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241
>
> I'm maintaining this manual page in librseq.
>
> >
> > "and set to NULL by the kernel when it restarts an assembly
> > instruction sequence block,
> > as well as when the kernel detects that it is preempting or delivering
> > a signal outside of the range targeted by the rseq_cs."
>
> I think you got two things confused here.
>
> 1) There is currently a bug on arm64 where it fails to honor the
>     rseq ABI contract wrt critical section abort. AFAIU there is a
>     fix proposed for this.
>
> 2) Thomas relaxed the implementation of cpu_id_start field updates
>     so it only stores to the rseq area when the current cpu actually
>     changes (migration).
>
> So AFAIU the statement in the man page is still fine. It's just arm64
> that needs fixing.


My understanding was that due to the ev->user_irq check here:

+static __always_inline void rseq_sched_switch_event(struct task_struct *t)
...
+               bool raise = (ev->user_irq | ev->ids_changed) & ev->has_rseq;
+
+               if (raise) {
+                       ev->sched_switch = true;
+                       rseq_raise_notify_resume(t);
+               }

There won't be any rseq-related processing for threads preempted in
syscalls, which means that rseq_cs won't be NULLed for threads
preempted inside of syscalls.
