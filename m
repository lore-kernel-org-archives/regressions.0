Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609736F438
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946334; cv=pass; b=pRAzVCyzo9vn7jBpCEL21PDo4wIC5xwSvNVCjtkThowdmMI/+jswN3ntrOP7Mu+g6nUXuJrzryiPaMws3I6pbx6YIavaVCDXXLABsnyaAg6EL1HThux88rwd6ZgMpkROpGRDOVq9zZ/9OYHCze61ebhLLfkQeLOrOuAmyfRmezg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946334; c=relaxed/simple;
	bh=V2e/R09y9NLGIB0Sb6qI8MuLDch7E2rRrsJxA1MXxhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw6thlUIkDkJ7dM+TJvC+UCHpjEXKO6eyFGutcGKlovA0IergaRyf0q8PWdqp0NUkh2lbjCjA/mDdFz850R9LNn4DqkCY775G9j+gbe+Q4jCV/WF8UlGBkqiM5u8fmo3s83XYjGiNYHnSSdekH9HRHvHAHFDdqxEc04irP+zbPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=ZSqRKLCB; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="ZSqRKLCB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba922426c5cso96620166b.3
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 05:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776946331; cv=none;
        d=google.com; s=arc-20240605;
        b=KxTeH+F2cI2L4vg7Zp6gk8cB6WUpzhISx0kG5Spo4oXillGNOsXf3D+x9ylnKPZaDx
         81QAfi8YeG6vdgPd9p5DckpDWkrEPMsIgg0f2V7uc+1zrqvVSwcFQziPumPRVywrJs39
         C3dbgXG7FCPLdKM1ZxFTwGhuyqzXIUD4D+fU3aeyVPGkw8XBAG2zn/hE/o0cqFt4/oIJ
         RXQjnYUq04h6wApBOMUcKuwHXLtLJKsKe36a/wBF76RSduGrMWXoZcuT6E99+4t/CTOX
         U0DoagkYUwD+kHc90ySpr+T2dbHM2VefGNEBdK53UpX5zSz9gb3IuUtx5SY/BteWYOdi
         JgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        fh=lurKe6kDopoCr0HwqbastCK9sI7D13qPLishnsbBsWI=;
        b=h6DTC5mEwd5Dp9kt7E8FwU1jzKu6M+vXRLOpVbOavYBGrdGvmAjo2PSIDjULGUPkq/
         000iUjFF7152tlMD3re+IUdcjEY0ccDLU2WOphquMclsCNLXtlHlwO8NOw15ClXEnFvZ
         m0Go6AsZW5Dj6fXzq3A9y/vy+TU+Rib4eWz1AdojzEhz2i1TYT4rE/HAcBHN71Yt/Ags
         Xg1OhjoZsycnjEmtV2e4++WaWzOa5lS1gQUch2aybktK9QP6RCkoqLMCItqYcpZDtelF
         NWcCwX0y0TY3Gvba+dfy59PjlXDypYNgvhLkWd3fNYD8IoVv2BhH6uBnNd1zp/OZlzYl
         n5EQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776946331; x=1777551131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        b=ZSqRKLCBhD8Rd4iIh+zIB82RhWnCL/WartIGkjEayGQ+avxhxu8B4P9hs8yqR4twwF
         0GdRDmd8G7+rG4gVPKU80m0fh43CYX3wnCKsrCshZWHOPAGAnQxhG/z2Dcl9/b0q3GVt
         mktuLqtXDcInaf4pIo0rC41weqYyOBO283xzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946331; x=1777551131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        b=U7a21XKOdUVhRg+aRfLq2R3barLFcXPQd+9pAqrrhQ8ZMFtJgv+8fqZWwpruO8oZfs
         9cCdp7DuzbSwiZtMGzwkhVH3Cg6G68nsmoJCWrQVyJ91Z/UIHY2VBYfkA0h9L9//6WOt
         xoS9DaJYwLTsJesR71zR4Pa3IhMd1NxpeRH5S/T9tDcaOo5IaiCgmogtdq2Oz7RD+cYQ
         pBrB1dF+ylk2zasOEbxhETwpJVi4rA8vp81X6CHrQPptj7DRohBblMpcl/PAUgGZHhKV
         lBLg9PYtAX3jnPtC8mnyMx3NxJyVya29uHqdEc32Q7g8bZRZ4NUr/lYZpkPBuTjcKwNA
         EyFg==
X-Forwarded-Encrypted: i=1; AFNElJ8srg/YcextQuZUIaPnI3SMv5tD7wMIlIsP0HmtBMOeqFlzZntdb7JswzkwLWpceegLhx2t5Tj5eaDIyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa0ylYGF2GZt4Y9Rv3ViS7U9/xlydk1MsBGs9ZDxieZNKyJ7Di
	t9HpaM5nWy9Cm88RWgFK+gBtWxDBrNfgwGQxw2L+CA+tViQ8kQISdeW3Y49E4fL1JdLsc1aAjjB
	cxFQL3EN9GB4av8djhuIwq4xnxOgQrPP3O2Ao1jXxJg==
X-Gm-Gg: AeBDiettd/kFCnG3za54/vjq8+reK1eWlgTzqOXprtnFS8DdopbdECtgGF/aL6KZsB9
	aOV3u4QOLHct9m9IQ4D1/yP6yBuPyhH2F50wiLVs5UtLKEEots9hl30KWL3sRUp+tVBAQoGKtVS
	jCtnY4FG6eAW4GzwpyGBtd27WL+XQ/qI9SbkTjXtirF3qfLmCGXYa6itQqUqHW8frgEnjlsWZw4
	wCdUaXVpxjx9TkpiD8wR2AH/kPGw39Khmtw6Zz97zH6TUoWycKBfv/f+LLa6J7qBI1a1GkTQRfE
	ZqCEV0RF9a6ELa2d
X-Received: by 2002:a17:907:9729:b0:b9c:30b7:770f with SMTP id
 a640c23a62f3a-ba41b5d2827mr1236383566b.34.1776946330185; Thu, 23 Apr 2026
 05:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com> <87fr4l28zn.ffs@tglx>
In-Reply-To: <87fr4l28zn.ffs@tglx>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 14:11:42 +0200
X-Gm-Features: AQROBzCM6mAx-Xc_U10JYAvRKv_DgQMoTZQWyWV7r3P3EeiSoMbA1BfiRa5wClo
Message-ID: <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 1:48=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> That would work and not bring the performance issues back, but:
>
>   1) Did you validate that adding the reset into rseq_update_user_cs() is
>      actually sufficient?

Not yet, although I confirmed with the tcmalloc maintainers that they
thought it would be sufficient before suggesting it. I'm currently
building your patch from upthread to test that out. I can try this
after, although I don't think I'll be able to get to that today. I'll
try to get a coworker to test it though.

>      Which means, that tcmalloc is holding everybody else hostage.
>      That's just not acceptable. Not even under the no regression rule.

Agree. I don't love the situation either. Or that we need to advise
setting the environment variable to tell glibc not to use rseq. But I
also want our users to be able to use existing mongo binaries on new
kernels.

>   3) The fact that tcmalloc prevents a user from enabling rseq debugging
>      is equally unacceptable as it does not allow me to validate my own
>      rseq magic code in my mongodb client because enabling it will make
>      the DB I want to test against go away.

Glad to hear you use mongodb :)

> The most amazing part is that tcmalloc uses this to spare two
> instruction cycles, but nobody noticed in 8 years how much performance
> the unconditional rseq nonsense in the kernel left on the table.

I am looking into a change to our copy of tcmalloc to have it stop
squatting on cpu_id_start, and will run that through our correctness
and performance tests. I can't promise anything (and I certainly can't
speak for what Google may choose to do), but I share your expectation
that it should be possible with minimal impact. It _is_ more than 2
cycles though, since it extends the load dependency chain by one or
two pointer chases and a bit of ALU ops. I'd guesstimate it will
likely cost on the order of 5-10 cycles per call to malloc or free. I
think we can absorb that, but will need to test.

Of course, even if we make that change, it will only apply to _future_
binaries. That's why we prefer a kernel fix so that users will be able
to run our existing releases (or any containers that use them) on a
modern kernel.
