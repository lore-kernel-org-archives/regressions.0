Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505B410D30
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587423; cv=none; b=TOhKRwB7GLonbaXXbLVPIewkDcffBozzoNhbJpRQ2ziTrrwa6r/dJi8afMtNBH9Rfg3X4IlWmGJ1Ftu74mWPGi47T5hU6WpvDBuyRxbna9AgeoMpbKdKuG4RR7JiFZgOyLYKGVU/UHqa5d1YQagTSQ9ur+YI4vvtfgJ4reltPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587423; c=relaxed/simple;
	bh=qKX26eklEIv9hnCfUZaQX3spzJ5gIoe19/0snx2+S/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7scE3Gi+Jol2d76pyz5YEfEqy+AMX/N/wjPLvIHZT/TmmAGCVA8oS7k6i/4NXi13GLc//mGPkg5O9C8PoCq2mFWqNeqXpn5IdUT+EUWTcRhtZ6hHbaCwsCbxG1cG2+3ZwUeNb2t1MdFILX9m6BszrsAuATn0bHqACg9dck+/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=etdP0f3j; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LnDNYOKq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="etdP0f3j";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LnDNYOKq"
Date: Mon, 24 Aug 2026 18:03:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787587418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etw3muVJJnYVkEiVrxXg7N0EM0ZhMyn7vgzO4WXSJp0=;
	b=etdP0f3jZ4SsksLjLkEJKROCfEsgzd3MkjejIsoBDjBK6IfU3YCrqcjxz7iSD05uBD5dL6
	mmqxe660iaXyqWKf3ms33RR5d/Obxb6XlGP4xzRQENcIDg2rQW6sGJRQ/3VpMkSF5eioNW
	6guTfizK81GHeG/p4eowPb+m3rthMrAlokaZ8kEtq/RcjuD421JzfcgFS3ye0BQdAB7dIG
	M2YC4wXa7zfT9j4fwKSa7+GyaGxkXbLrEN/PkfPtDvAiWdvXIw9xL9o+m6hIlHyTFSlUS2
	cz5uPQ7iS4Tw9pDQPmNzCT9QVzh6etKeNSF8Q5NBHjBBCO+iv7XPMgfwyZ43WQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787587418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etw3muVJJnYVkEiVrxXg7N0EM0ZhMyn7vgzO4WXSJp0=;
	b=LnDNYOKq9tWFogr9lxb1Re8OfbtLG2jOK6NBxrKupgWCnJhNwySTMkg7g/LV2HQsaaMEaZ
	BpjNVTmj1DPUhHAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Nikita Taranov <nickita.taranov@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: futex: private hash can stay on the shared atomic refcount
 indefinitely after auto-scaling
Message-ID: <20260824160337.0IvfKx8A@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260823150046.204417-1-nickita.taranov@gmail.com>

On 2026-08-23 15:00:43 [+0000], Nikita Taranov wrote:
> Hi,
Hi,

> The commit message anticipates a slow transition, but as latency:
>=20
>   "The side effects would be that on auto scaling the new hash is used
>    later and the SET_SLOTS prctl() will block longer."
>=20
> What I am reporting is that under load it may not complete at all for
> tens of seconds.

Hmm. There are two things that can an effect how quick the transition
is:
- The completion of an RCU grace period to ensure all futex users moved
  from per-CPU reference counting to atomic
- The possibility of all FUTEX participants (all threads of the task) to
  not use futex for a while.

The latter means, if you multiple FUTEX users all the time (as seen in
your example) then the reference counter never drops to 0. As such, the
transition to the new private hash bucket can not happen.

> The trigger needs futex activity to overlap a hash growth, which is just
> an ordinary thread-pool ramp: the growth is requested while the earlier
> threads are already working.  That is not specific to startup -- a pool
> that grows later under load is hit at least as hard, see below.  If the
> process goes quiet for a moment afterwards the count drains and everything
> is fine, which is why this is easy to miss and why the symptom is
> bimodal.

Right. As long as you allow it to settle then everything will be fine.
Once the reference counter was allowed to drop to 0, the first user will
install the new private-hash and all other threads wait until it is
done.

=E2=80=A6
> 96 threads, each issuing FUTEX_WAKE_PRIVATE on a private futex with no
> waiters, so the syscall does little besides take and drop a hash
> reference.  Threads start work as they are created -- deliberately no
> start barrier, since an idle window after thread creation lets the pivot
> complete and hides the problem.
>=20
> Build with
>=20
>   gcc -O2 -pthread futex_hash_repro.c -o futex_hash_repro
>=20
>   # let the hash auto-scale (default)
>   $ numactl --membind=3D0,1,2 taskset -c 0-95 ./futex_hash_repro 96 5 0
>   threads=3D96 slots(start=3D0 set=3D0 end=3D512) 5.01s   13.0 Mops/s
>   threads=3D96 slots(start=3D0 set=3D0 end=3D512) 5.01s    9.4 Mops/s
>   threads=3D96 slots(start=3D0 set=3D0 end=3D512) 5.01s   11.7 Mops/s
>=20
>   # pre-size the hash before any thread exists
>   $ numactl --membind=3D0,1,2 taskset -c 0-95 ./futex_hash_repro 96 5 512
>   threads=3D96 slots(start=3D0 set=3D512 end=3D512) 5.00s 1049.0 Mops/s
>   threads=3D96 slots(start=3D0 set=3D512 end=3D512) 5.00s 1050.2 Mops/s
>   threads=3D96 slots(start=3D0 set=3D512 end=3D512) 5.00s 1049.8 Mops/s

You might have hit the sweet spot with your CPU. I have here a 144 CPU
box and=20

| bigeasy@herakles:~$ ./futex_hash_repro 140 5 0
| threads=3D140 slots(start=3D0 set=3D0 end=3D1024) 5.00s 659.2 Mops/s
| bigeasy@herakles:~$ ./futex_hash_repro 140 5 4096
| threads=3D140 slots(start=3D0 set=3D4096 end=3D4096) 5.00s 789.1 Mops/s
| bigeasy@herakles:~$ ./futex_hash_repro 140 5 4096
| threads=3D140 slots(start=3D0 set=3D4096 end=3D4096) 5.00s 786.4 Mops/s
| bigeasy@herakles:~$ ./futex_hash_repro 140 5 0
| threads=3D140 slots(start=3D0 set=3D0 end=3D1024) 5.00s 631.1 Mops/s
|
| bigeasy@herakles:~$ taskset -c 0-95 ./futex_hash_repro 96 5 0
| threads=3D96 slots(start=3D0 set=3D0 end=3D512) 5.00s 704.4 Mops/s
| bigeasy@herakles:~$ taskset -c 0-95 ./futex_hash_repro 96 5 512
| threads=3D96 slots(start=3D0 set=3D512 end=3D512) 5.00s 737.4 Mops/s
| bigeasy@herakles:~$ taskset -c 0-95 ./futex_hash_repro 96 5 512
| threads=3D96 slots(start=3D0 set=3D512 end=3D512) 5.00s 733.1 Mops/s
| bigeasy@herakles:~$ taskset -c 0-95 ./futex_hash_repro 96 5 0
| threads=3D96 slots(start=3D0 set=3D0 end=3D512) 5.00s 690.6 Mops/s

It is not as bad as you describe. Could you try v7.2 which has commit
a734d9fca84e1 ("futex: Optimize futex hash bucket access patterns")
which might help to settle the counter.

> The magnitude depends on how far mm->futex_atomic has to travel.  Across
> the three SNC clusters of this socket it is ~11x; confining the same 96
> threads to one cluster brings the run to ~3.

Not sure what we could do here. One idea might be to block further
futex syscalls so they don't acquire a new reference on the existing
hash and allow a transition to the new hash more quickly.

Sebastian
