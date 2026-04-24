Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076331F9BF
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019575; cv=pass; b=ISBqjrnn8Q2Zn39graH07SLwNdzeYNPZcY9vNhZ8C/oQQfuPRc94E6zxO03uQLOKu4Q1kj0dkkBVfrlzV+Ru/WGQKpNFqgsi9KV9Y0YeYX3AanBjbnIYI/viRvLjkrT9Y3pUXNqEtuE/YBk0+3EnFtTi8U9gF7Y1kxjHyYwCKYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019575; c=relaxed/simple;
	bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp+YHxvkfQPaKjTtnUuY8t5XL3ZU7gPiD2Fj0dkAQMzx6hChZ6cfYlSkwJhZMZ5UcratJ+iDMQrq4rEsc2CBUpVOu47J3m7MFIwlRw5UDlplTNQxRKTTu5NBz9e2v6jwayE0TLN95kL6wPnHcZhXAK8nqki1hcy9TOA6Fd+EpDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=OMT0I9ax; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="OMT0I9ax"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba51e69988aso1019136666b.0
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 01:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019572; cv=none;
        d=google.com; s=arc-20240605;
        b=IQ4KTMYQZEsT5K9mpR5L7V5MHxltT7LpulHhnvfqNyammDWw7rB+ca3o+jhPPUgI/V
         D5YtvWlgLW2/1QBzt8N0xD118yssT6k2gdxEzp7oXUCRCQIpCgbpS7SkH5Uf20fF5AVB
         bLrVhWO8Wb1v5kiTEHob61ho16cSIm6OWEZKwb5S2wOR2cQMFT1NCdzYkDQS+gFXS1Yk
         4hyMIIWDcjbmWfO/UbchHPzUlNI3SR+kTsK/9fFNC1e43LJoaV5r59An+SYx4USfm+Lm
         UT4lzJzKBkUNqiGd9da5MFOlD68/5sFdToXildqQo25Kqpug6V5gGJUwz5oc+1g0Qu8L
         fdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        fh=v838NpFCO1+Z7drnN1TP3IAnXvSrvUBfeBbp5n8YGhY=;
        b=JgSUNM/v2KJen6EtLCf4Pcgi2O5pm7B49mk0U7awMsjPO53QeJOYzEmh0jrpf/i+zH
         qI8drrs43y1+d3P+IxZ5f/V1vtURq9EjpjM3cAImj9kTN7hKRVvjtDkKUZ7mZ5DWNqH1
         TRShMIYQvi1jbEoFd0oqVlOAZ+uT8JIm06a6THDmrYBiC4Lpu94E9yMWJPZObLNXyxc/
         LjTL2VEXoUCT3Fb0GFX4tXBhbwF9KuvsVYl9B8fdvIWTzlFxjyNjw7NAMmQJIdjO7Mxg
         O+2zXB9EIxCrrxKhdd0N6s7kGt0GpC3ga/9xB77vwm78RpsjtSl4O+7XdT5veZax+tQp
         n+dQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1777019572; x=1777624372; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        b=OMT0I9axhT5qLtl/yMVU6OhrBT8tZkK4JhI1K3HH3iFudSAqDux2h+ZsQL/Gfc7iyK
         KPlaofWxLb8IsRMl86pzeEqonvgEvj1HKXyFnjIFvAsrEf5zQcBwKdwYTtw8CFJbhCFe
         msWUySi5IBTv6AFWbkgGEhglpxFvSMMVSu4Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019572; x=1777624372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        b=qTROO8yKGZ72sty/N0T9Fq4Nu7Z0vvZklQvJfPWGEENt0wFKzlJCnTRhuf51+LQ9R8
         epltn3Nef0/xPSzV3w9hdgGJgiQSx/Gh3JHqRaIWDT93TT1qXRzjYl4olTAZqsU0yUSB
         RRvT8Mo+pb1zE7UINidl8ftUJGQ0ORbsgQYxAOryfPTEAijX+6NzzDZ6ynt0wbj7dNzI
         vlwwFiFTeiXHNaobC+uh3JoU+EtYXOhAMMfZbSjLNBPXqTwQZo4f02jnxW58DRvWSRRs
         6Ga+0EezhiUmJlHM4hHcdTl0ghGq4kAG1Hj+vrpY73Wsn9KwwIMRkSMUJiiu3Ili4rDV
         wlSA==
X-Forwarded-Encrypted: i=1; AFNElJ+DOfLs8C9LB7EixRRSmrduF9r5sccbp/N4mRqukyNYVPmFyQvH1+u2GTNKFKi6sZTubVFWJOYnwyh1NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDfkd24G96cccTV52mcSb4MxPMx5pwbtMxDLIlxiBgxuFBIUO7
	gTJQwcxyG8Kesa9J51deSh0rYhEGo8C+omEcj1dRLUwaOiz0TWFERYm5VrfQeggWbeLY2Ez58K+
	O3qQ1iiCRUHShC7UKcdaeWb9dbbqlL7k7TB0xabSMiA==
X-Gm-Gg: AeBDiesEGkqgBN5EoUvkVuw9NoRKmeFsyIhc/+NLJP1yXczjdfa40ssJOCRuKo8g+Px
	1UDf8001UL4xjRByPdrqqMIVILxQCLV8cHdtfjTa1WAVmBaAg4K00zYZMX8MXwLGPDaNyQbuUSi
	Ggh76jGrHWYT/mkJiPL4d0hMiY2SZfKVw+1eROt1wnzXphgbIMAErFrzSCX6KN9ydPs5qfYmftO
	Wm7uvETf8l6uE9NE4zjNH5tRmprCtl8xxiamtH9HPEK9k1+QWjdrW6qeQ4kPnjEb9hzEFDUmWhE
	B4p7whwLumaYceaG
X-Received: by 2002:a17:906:fe4d:b0:b9d:ed9a:5f30 with SMTP id
 a640c23a62f3a-ba41b1dfccdmr1577746366b.48.1777019571404; Fri, 24 Apr 2026
 01:32:51 -0700 (PDT)
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
 <87a4ut1njh.ffs@tglx> <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
In-Reply-To: <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
From: Mathias Stearn <mathias@mongodb.com>
Date: Fri, 24 Apr 2026 10:32:21 +0200
X-Gm-Features: AQROBzCHcP8gD_lsen-_9uWdGTZxPs_ZNz8gEN7uOeloBdhtK06l3MK7cQ3RsCY
Message-ID: <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 9:57=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> > So if the code only requires to know when it got rescheduled to another
> > CPU then it still should work, no?
>
> This was my first thought too:
> https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgkQS=
t_OOmYg@mail.gmail.com/
> The only problem is with membarrier (it used to force write to
> __rseq_abi.cpu_id_start for all threads, but now it does not).
> Otherwise the caching scheme works.

I almost wrote a message last night saying that we didn't need
cpu_id_start invalidation on preemption. However, I remembered that
the Grow() function[1] does a load outside of a critical section then
stores a derived value inside the critical section, guarded only by
the cpu_id_start invalidation check in StoreCurrentCpu[2]. It really
should be doing a compare against the original value inside the
critical section (or just do the whole thing inside), but it doesn't.
I haven't reasoned end-to-end through this fully to prove corruption
is possible, but I suspect that it is if another thread same-cpu
preempts between the loads and the store and updates the header before
the original thread resumes and writes its original intended header
value. Ditto for signals, which sometimes allocate even though they
shouldn't.

I was really hoping that we would only need to do the "redundant"
cpu_id_start writes would only be needed on membarrier_rseq IPIs where
it really is a pay-for-what-you-use functionality, I think existing
binaries depend on invalidation on preemption. Luckily that should be
cheap enough to be ~free.


[1] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a2699=
dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L964-L980
[2] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a2699=
dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L551-L605
