Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102DC369D7C
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335769; cv=none; b=C0DP1tJ4ognbYub76UD0l9NaHlV6LuVD70hW3Ia4wyx1Z3s0zM69d1k8+OHAsreMjbCcQ1ev+3eQD9xhUbDpNvjCpapzmkmI7BSBAbYddu/Gsk/X+8c93Y/H5yR0yBiXNTV1etOW7Lmw6FVNOxJ2ydF1mOoZ5O9DfjZPg3vNIMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335769; c=relaxed/simple;
	bh=SQFwUewzSOx53ZmqI378nkQLZMzqWDuiG2AEkShbijs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq3lkYr1I4yPF4MTI9OHDfzDWPedbjO+vuZ41Ak+w2MGiJ9okqscDdosZMC4tM4C62QHN47qtpc7JxMpTs0EEull8n3fi3hPfEwdJw/xwHMQ3rAvQhBUDGAHncwVF9VAF6XiEXtNOsG2di6CN2qB2LgLWX3KPpp+qA+1+P2qzos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tDxlA1Ns; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jv2C1krr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tDxlA1Ns";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jv2C1krr"
Date: Wed, 2 Sep 2026 09:56:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87QVxY/Uc4nIbt3eNljsG8iZqjJ1C6yGs/I4LnmzEfc=;
	b=tDxlA1Ns3lPHlpvz6Bn1KfbMRr3Hsw42ZXyp0Km/BgZicJKBI7B0X+PfWrWyT9km8wEZ4Z
	f7oVYNEbJuwrWpEPVxuFKlai3srCZIq75+1H7lDqk4z+lBLatxNkRWxByyv9nbxJCau5T+
	iVAOlaHyYJBQfw041oBoPXviq00UqE8pi5CyINposw1/GuiudO1+06YUHAtVZUGGeijIpZ
	Qyf9VkBK79q0IEHIsL9qQNFXsW3xyEbHNpI2XhV2jTpnHK2wHk5Q2WMa9O3pcpE/H0cUrG
	C9t1uYpC5t3trKSL/M5vn3eeyMDahp8bNE6Oux0PDKilxJ/TfLDxNRULw/+7kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87QVxY/Uc4nIbt3eNljsG8iZqjJ1C6yGs/I4LnmzEfc=;
	b=jv2C1krrTXsVytfFWte+6vAfx3sdFLkkSsSfAH7lHg6b0DGkwHHJX+JfiWvM3P7kJU4Qv9
	nm74F+lSHE4Z1uBg==
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
Message-ID: <20260902075604.A_-jz823@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com>
 <20260824160337.0IvfKx8A@linutronix.de>
 <20260825170605.2462933-1-nickita.taranov@gmail.com>
 <20260901230559.1978876-1-nickita.taranov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260901230559.1978876-1-nickita.taranov@gmail.com>

On 2026-09-01 23:05:59 [+0000], Nikita Taranov wrote:
> Following up with three things: a better reproducer, results from two more
> vendors, and a prototype of the approach you suggested.
>=20
> ## A new repro
>=20
> The code could be found at https://gist.github.com/nickitat/a7a46b61d6769=
ceec493881f82e7b344 .
>=20
> This one is an ordinary producer/consumer: threads park in plain FUTEX_WA=
IT
> like the idle workers of a thread pool, others issue plain FUTEX_WAKE on =
the
> same futexes, so waiters are woken, loop and re-park. Only plain FUTEX_WA=
IT and
> FUTEX_WAKE. The kernel's own auto-scaling during thread creation is the o=
nly
> thing that ever asks for a pivot.
>=20
> The control is one prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, n) befor=
e any
> thread exists, which marks the hash custom and disables auto-scaling, so =
no
> pivot is ever requested and the stall cannot occur. Basically, the same s=
tory
> as in the first repro.

Depends. That PR_FUTEX_HASH_SET_SLOTS will block the requesting thread
until the change is active. The auto-scaling does not block the
requesting thread (the one creating the thread).
If you have already 20 threads which are busy on FUTEX_WAIT/WAKE, the
PR_FUTEX_HASH_SET_SLOTS request can also take some time if the active
counter never drops to zero (because multiple threads always own a
reference).

> v7.2, Xeon 6975P-C 96c/192t SNC=3D3, 8 runs of 4 s per point, clock pinne=
d:
>=20
>   threads   auto   pre-sized   stalled
>        16   25.8        42.3      0/8
>        32   34.8        41.1      0/8
>        48   28.7        31.8      0/8
>        64   29.9        34.2      0/8
>        96    3.7        46.3      8/8
>       128    3.6        53.6      8/8
>       192    4.0        38.7      8/8
>=20
> Throughput is far lower than the numbers in my earlier mails because the =
work
> is real; the comparison is the point. The control (pre-sized) is almost f=
lat
> across the whole range, so the work does not get harder with thread count
> -- only the arm that requests a pivot collapses, and only above a thresho=
ld.

How bad is this in general? Do you have a workload where you fire a
process, create 128 threads and then seconds later kill the whole thing?
I would imagine that in general it is long living process and once the
"final" privat hash gets installed, it remains=E2=80=A6

> ## It is not only this Intel box
>=20
> > You might have hit the sweet spot with your CPU. I have here a 144 CPU
> > box and
>=20
> I wrote previously that this Intel host was the only one where the repro =
worked,
> based on a 96-thread sweep with the old reproducer. At 192 threads, with =
the
> reproducer above, Graviton4 does reach the same state -- less often,
> but permanently when it does.
>=20
> 192 threads, 15 s runs, per-second traces:
>=20
>                         latched permanently   transient   never
>   Xeon 6975P-C                  8 / 8              -        0
>   Graviton4 Neoverse-V2         1 / 15           2 / 15    12 / 15
>   AMD EPYC 9R45                 0 / 14          14 / 14      -
>=20
> Graviton4 will stall at a higher rate if the wakers are created gradually
> rather than all at once -- the `ramp_ms` parameter spreads their creation
> over that many milliseconds in total, which is what a thread pool growing
> while already under load does. I saw 5/16 stalls on one run.
> AMD still never latched in ~200 runs.
>=20
> So the state is reachable on more than one vendor's hardware and usually =
permanent
> once entered. What differs is how often a process falls in.
> Arguably, this flakiness is worse than a deterministic stall for a real p=
roduction.
>=20
> ## Prototype of your suggestion
>=20
> > Not sure what we could do here. One idea might be to block further
> > futex syscalls so they don't acquire a new reference on the existing
> > hash and allow a transition to the new hash more quickly.
>=20
> The only analogy available to me due to lack of any knowledge is rw-locks=
=2E I asked
> Claude to adapt the percpu-rwsem code to futex, and after a few iteration=
s we
> produced a hopefully viable patch. I suppose it implements plus-minus you=
r suggestion.
>=20
> The results (same box and all the rest of the environment):
>=20
>   - the reproducer: 0/8 stalled at every thread count, against 8/8 on sto=
ck at
>     96 and above; 192 threads run at 54 Mops/s instead of 4.
>   - futex kselftests: 14 passed, 0 failed, with the mechanism enabled and
>     disabled; futex_numa and futex_numa_mpol pass.
>   - requeue-PI selftests looped under a continuous pivot storm, to exerci=
se the
>     drop_fph handoff against the phase: all rounds passed.
>   - stress-ng: 64 futex stressors, and a 40-way futex/clone/mmap mix, 0 f=
ailures.
>   - PROVE_LOCKING and KASAN builds: clean.
>   - measured overhead ~0.6% on a pthread_mutex/pthread_cond benchmark wit=
h pinned clock.
>=20
> Makes sense to note that the patch was applied to v7.2 and all testing wa=
s done on that build.
>=20
> The code could be found at https://gist.github.com/nickitat/0b1cc68deff5f=
e2b27209b150da6fb00 .
> If you find it useful, I can prepare a proper patch for the kernel tree.

So you create a new state and try to not deadlock. I'm too sure about
the PI bits.
But what about

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 51ba5e1257c04..b370b4cf168eb 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1975,6 +1975,39 @@ static int futex_hash_allocate(unsigned int hash_slo=
ts, unsigned int flags)
 	return 0;
 }
=20
+void futex_hash_wait_new(void)
+{
+	struct wait_bit_queue_entry __wbq_entry;
+	struct mm_struct *mm =3D current->mm;
+	struct wait_queue_head *__wq_head;
+
+	if (!mm->futex.phash.hash_new)
+		return;
+
+	__wq_head =3D __var_waitqueue(mm);
+	init_wait_var_entry(&__wbq_entry, mm, 0);
+	__wbq_entry.wq_entry.func =3D woken_wake_bit_function;
+	add_wait_queue(__wq_head, &__wbq_entry.wq_entry);
+
+	/*
+	 * add_wait_queue()		futex_ref_put()
+	 * MB (this)			MB (implied)
+	 * futex_pivot_pending()	wake_up_var()
+	 *                                waitqueue_active()
+	 *
+	 * Notably, it must not be possible to see
+	 * !futex_pivot_pending() && !waitqueue_active().
+	 */
+	smp_mb();
+
+	while (!futex_pivot_pending(mm) &&
+	       wait_woken(&__wbq_entry.wq_entry, TASK_UNINTERRUPTIBLE,
+			  MAX_SCHEDULE_TIMEOUT))
+		/* empty */;
+
+	remove_wait_queue(__wq_head, &__wbq_entry.wq_entry);
+}
+
 int futex_hash_allocate_default(void)
 {
 	unsigned int threads, buckets, current_buckets =3D 0;
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index f00f0863ed441..d538e8e15c336 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -246,10 +246,11 @@ struct futex_bucket_ref {
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
 extern struct futex_private_hash *futex_private_hash(struct mm_struct *mm);
 extern void futex_private_hash_put(struct futex_private_hash *fph);
-
+extern void futex_hash_wait_new(void);
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
 static inline struct futex_private_hash *futex_private_hash(struct mm_stru=
ct *mm) { return NULL; }
 static inline void futex_private_hash_put(struct futex_private_hash *fph) =
{ }
+static inline void futex_hash_wait_new(void) { }
 #endif
=20
 extern struct futex_bucket_ref futex_hash(union futex_key *key);
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d4483d15d30a5..7ad8a060371c6 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -195,6 +195,8 @@ int futex_wake(u32 __user *uaddr, unsigned int flags, v=
oid __user *pop, int nr_w
 	if ((flags & FLAGS_STRICT) && !nr_wake)
 		return 0;
=20
+	futex_hash_wait_new();
+
 	CLASS(hbr, hbr)(&key);
 	auto hb =3D hbr.hb;
=20
@@ -283,6 +285,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 	int ret, op_ret;
 	DEFINE_WAKE_Q(wake_q);
=20
+	futex_hash_wait_new();
 retry:
 	ret =3D get_futex_key(uaddr1, flags, &key1, FUTEX_READ);
 	if (unlikely(ret !=3D 0))
@@ -744,6 +747,8 @@ int futex_wait(u32 __user *uaddr, unsigned int flags, u=
32 val, ktime_t *abs_time
 	struct restart_block *restart;
 	int ret;
=20
+	futex_hash_wait_new();
+
 	to =3D futex_setup_timer(abs_time, &timeout, flags,
 			       current->timer_slack_ns);
=20

It depends on v7.3-rc1 and should keep new waiters blocked until the new
hash is installed. I also added wake path assuming they will continue to
matter what. It might make sense to do this on the wake side only.
Does this do anything?

> Regards.

Sebastian
