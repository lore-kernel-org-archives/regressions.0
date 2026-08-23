Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F237F8B1
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787497257; cv=none; b=Ju/uNTGBDo33utoGYbqeBlWk2ZBLMWLwHmX5+XGOqo2ZnP6Su5AfUgytMrqXB3Z8ThsOpgjH5tUeTHnV0Fb6U3hwPIF3B4KIcffFmFbC/K+wiyBO1b/74IY3rm4ofCaAXFTuxtzXV2cDGs3yNysH5bkrThFhSLV2BMhRxhsKwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787497257; c=relaxed/simple;
	bh=5Fd59v0aDEIUDZtVN1iuxApwVXQAAbz0XUbw1/uHK3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWoEhDVKQzYur13iCBoYV2Hc8EFyj99DPT79BVQkSrMl9RlWcnIEWxTmhWY29M/IZprliMSLUNn0wHCYWNTFHpZFjLQ4wH43+NLo6CKwnoJt8HOxslMQPzBpzDOGYysxbwCBZj6J7PeeUDRM/WFTPTc7RdcgCbPsYZD7HcqCyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYRB23ID; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYRB23ID"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so295741666b.1
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787497251; x=1788102051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6qFq2wp75R7k63UZEa07Wgiq6jcmWOZ7COsEmOdWBo=;
        b=lYRB23IDlbVCxMOd6UhGHF7UpfmpltToqDkjsQ22D8QxxEJlyVQAvferhZYvsfAGOC
         Dg8fQ2KR52ii5/L5WcuQl0ugh7XmtbM2IriM+SfZfRAJGMD0Uxcc8pOyMSTJMuqHu7ha
         xyeNdIdyV6F8t678MwT/tgv0rZEM2qWo/M1xMXuK0zDhscl+kesjNhmYC80fIDvj7nj9
         OgarcmrsC2KmykT+CLEKfrkoMVWE+CaqCQB1DPRcKl+0KbwFcqkpPZ9PcjHyK+MA+u7w
         9D4OeOLJiSIMtt0Oz1Cn0gv7MjqIyv0gHpYq0zN9KR+wNUgZt+K9wyLWgyDosd+qbP+R
         SZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787497251; x=1788102051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6qFq2wp75R7k63UZEa07Wgiq6jcmWOZ7COsEmOdWBo=;
        b=dVa74Yx5lWaJ8rXNfa4UdCnBY8BVdFVzG66tLZOZB+uZAGIwMI+Pp6E3pObdauu3WV
         Kpn453e+9s1HdXu84PobqWppgwTPIhvpqk62HFGTg2Nxo2gyRaZcezXlI+IklBPuM8fp
         bcVY2f8T66XO1rMCrm/73NqXnSLtbIgfcq4Vvj1s1S1VNhv5yffd8/Y7+nSkMOMxvgr6
         sjT9REM92mGCn2/MpWFBtJZmU69GM4mMlWdDxyMy6EoZ56XhvR4DLziMEDN/8zzJ41/r
         ANISjxrX4ycshYSCC2KqMJTR47v+XlmiXE7BgqyaEveJ3yA1bE+LOfiSDGsiuSJ8ucCa
         vxlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+cxR/9/yMo4Y6+oMRtUHuf1Hx5uBWkjEl/pbn7BG7GuxTQSRdziO6dNmU4ndjae25C3Uu9bjxkajfpg==@lists.linux.dev
X-Gm-Message-State: AFuF++l0eO9/OBGGDvqlcIhuEacDYxoSmQvIM8djvR4sLekXYkb8QBoX
	7mIKGUBe6GXjBw2PGW9qtVptHUEY+RScfUR8RWuxQ0/eJEdiPCTF+iJs
X-Gm-Gg: AR+sD12JBKo+uY4gmOvPdUAlqkQ1BoA80Xi5Pdao1bhlCaKbPL4a+wDwyZxTCpqpRkf
	ItZQNEbFr/+Gl9UEJ0GIi/eGX8JFdVyFR1LNFd/MG92tB+FgTBTt3DKls5F0NoYuj59a08xWTOi
	kbvG1bOUM0SXQ1YoxZQCZA7CHYoqsbD3DKABcTH2LXmdVlc1S1814aGK+ePcPIzEBcRW0eR2ZIz
	QAHK/klvUAyiY+QDZavWk+UnbZPyG0tHh8krNEEI7trd1OATIOYMXZ6ZgfCqwMVUD9+Ks5Zr9OR
	A/R+TUjpRGi7FiRAj0fc2I6CboHuNBRb+ZsVjgNObgugSesrPAR8gGfNOCkUlqNZfIDqreX/qVh
	SklWKFs/Zg16ZQVRJBsJEp/lQf19qJ2LxpkRq3zVyAT3sVMaLdzmhKnd48l/QPiGkAMP2vW5MAT
	EXsljUeKyNM+dc6icuORTn9hsD8/J431YkVwhxckiN4VhlPuL+HoUbA+ObHHjKdxz8Xoj266CiW
	opZJgriMCEik2IXTFUSF2hlDvsfUyTA6kSjV8PRrOU7v8XJW7suEcsbKXEWeHooVaxz0/YiZqEe
	M4nOJQ==
X-Received: by 2002:a17:907:1caa:b0:c20:53c7:488d with SMTP id a640c23a62f3a-c246a5f7664mr2193766366b.14.1787497251155;
        Sun, 23 Aug 2026 08:00:51 -0700 (PDT)
Received: from ip-10-19-79-40.tail983ac.ts.net (ec2-35-159-55-138.eu-central-1.compute.amazonaws.com. [35.159.55.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm829158466b.49.2026.08.23.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:00:50 -0700 (PDT)
From: Nikita Taranov <nickita.taranov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: futex: private hash can stay on the shared atomic refcount indefinitely after auto-scaling
Date: Sun, 23 Aug 2026 15:00:43 +0000
Message-ID: <20260823150046.204417-1-nickita.taranov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A threaded process doing sustained futex work can end up using
mm_struct::futex_atomic for reference counting for its entire life,
rather than the per-CPU counters introduced by

  56180dd20c19 ("futex: Use RCU-based per-CPU reference counting instead
                 of rcuref_t")

i.e. it silently falls back to the bottleneck that commit was written to
remove.  Introduced in 6.17 and still present in 7.0.0-1010-aws.
On a 96-core Granite Rapids with SNC=3 this costs ~90x
throughput on a futex-heavy microbenchmark and ~11x wall time on a
contended-mutex benchmark.  It is a threshold effect: the same reproducer
on two other 192-CPU machines (AMD Turin, Graviton4) does not stall at
all, and even on the Intel box 64 threads is fine while 96 is not.

The commit message anticipates a slow transition, but as latency:

  "The side effects would be that on auto scaling the new hash is used
   later and the SET_SLOTS prctl() will block longer."

What I am reporting is that under load it may not complete at all for
tens of seconds.

The trigger needs futex activity to overlap a hash growth, which is just
an ordinary thread-pool ramp: the growth is requested while the earlier
threads are already working.  That is not specific to startup -- a pool
that grows later under load is hit at least as hard, see below.  If the
process goes quiet for a moment afterwards the count drains and everything
is fine, which is why this is easy to miss and why the symptom is
bimodal.

I could not find this specific case in the archives -
apologies if this is already known.

#regzbot introduced: v6.16..v6.17


Reproducer
----------

96 threads, each issuing FUTEX_WAKE_PRIVATE on a private futex with no
waiters, so the syscall does little besides take and drop a hash
reference.  Threads start work as they are created -- deliberately no
start barrier, since an idle window after thread creation lets the pivot
complete and hides the problem.

Build with

  gcc -O2 -pthread futex_hash_repro.c -o futex_hash_repro

  # let the hash auto-scale (default)
  $ numactl --membind=0,1,2 taskset -c 0-95 ./futex_hash_repro 96 5 0
  threads=96 slots(start=0 set=0 end=512) 5.01s   13.0 Mops/s
  threads=96 slots(start=0 set=0 end=512) 5.01s    9.4 Mops/s
  threads=96 slots(start=0 set=0 end=512) 5.01s   11.7 Mops/s

  # pre-size the hash before any thread exists
  $ numactl --membind=0,1,2 taskset -c 0-95 ./futex_hash_repro 96 5 512
  threads=96 slots(start=0 set=512 end=512) 5.00s 1049.0 Mops/s
  threads=96 slots(start=0 set=512 end=512) 5.00s 1050.2 Mops/s
  threads=96 slots(start=0 set=512 end=512) 5.00s 1049.8 Mops/s

Both end with a 512-bucket hash, so this is not about the hash size or
collisions -- only about when it was sized.  Pre-sizing via
prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 512) marks the hash custom,
futex_hash_allocate_default() then returns early, no pivot is requested,
and the per-CPU path stays in use.


Evidence that the hash is stuck in FR_ATOMIC
--------------------------------------------

A kprobe on futex_ref_get() reading fph->state, aggregated in-kernel over
a 3 s run:

  auto-scaled (default):
    { state:          0 } hitcount:    1333243      FR_PERCPU    7.5%
    { state:          1 } hitcount:   16461834      FR_ATOMIC   92.5%

  pre-sized:
    { state:          0 } hitcount:   37513027      FR_PERCPU    100%


Effect on a realistic workload
------------------------------

A contended std::mutex benchmark (96 threads over 32 mutexes, glibc-style
futex mutex with an unconditional FUTEX_WAKE on unlock), same binary,
differing only in whether the hash is pre-sized:

  auto-scaled:  52.8 46.1 36.3 51.7 49.6 s     median 49.6
  pre-sized:     4.2  4.5  4.0  5.1  4.6 s     median  4.5

The magnitude depends on how far mm->futex_atomic has to travel.  Across
the three SNC clusters of this socket it is ~11x; confining the same 96
threads to one cluster brings the run to ~3.

It is a regression against older kernels
----------------------------------------

Same machine, same binaries, only the kernel differs.  6.14 is the newest
pre-private-hash kernel I found available on EC2, so it is the
last-good point I actually tested; on it prctl(PR_FUTEX_HASH,
PR_FUTEX_HASH_GET_SLOTS) returns -1, i.e. the feature is absent.

                                    v6.14.0-1018-aws   v6.17.0-1019-aws
  reproducer, 96 threads              1082 Mops/s        11-14 Mops/s
  mutex bench 96T/32L store_wake      3.81-3.84 s        36-53 s
  mutex bench 16T/32L xchg             971 ms             960 ms
  mutex bench 16T/32L store_wake       620 ms             696 ms

The 16-thread rows matter as a control: below the stall threshold the two
kernels agree to within about 12%, so the 96-thread difference is the
stall and not a general slowdown between these versions.

It is not fixed as of 7.0.  On a second machine of the same type -- Xeon
6975P-C, 96 cores, SNC=3, running 7.0.0-1010-aws -- the reproducer behaves
exactly as on 6.17, and does so without any pinning or numactl:

  $ ./futex_hash_repro 96 3 512
  threads=96 slots(start=0 set=512 end=512) 3.00s 1024.9 Mops/s
  $ ./futex_hash_repro 96 3
  threads=96 slots(start=0 set=0 end=512) 3.01s   11.6 Mops/s

That is 88x, from one prctl.

The same conclusion can be reached without changing kernels, which may be
easier to reproduce: selecting the global hash on 6.17 with
prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 0) restores 1020 Mops/s
against 11-14 for the default.


It is not limited to process startup
------------------------------------

A pool that grows later, while already serving futex load, is hit at
least as hard -- and there the hash is left undersized as well, because
the pivot that would install the bigger one never completes.  Threads
hammer futexes throughout; the pool is grown with no pause:

  start -> final     phase 1 (start threads)   phase 2 (final threads)
   8 -> 96     79.7 Mops/s 9.96/thr s=32    5.2 Mops/s 0.05/thr s=32
  32 -> 96    310.7 Mops/s 9.71/thr s=128   5.9 Mops/s 0.06/thr s=128
  64 -> 96    619.8 Mops/s 9.69/thr s=256   6.0 Mops/s 0.06/thr s=256

s = PR_FUTEX_HASH_GET_SLOTS.


Environment
-----------

  kernel   6.17.0-1019-aws (Ubuntu, x86_64)
  CPU      Intel Xeon 6975P-C, 96 cores / 192 threads, SNC=3
           (3 NUMA nodes per socket)
  glibc    Ubuntu 2.41
  governor performance, threads pinned, memory bound with numactl


Reproducer source
-----------------

--- 8< --- futex_hash_repro.c --- 8< ---
// Minimal reproducer: a process whose private futex hash is auto-scaled during
// thread creation can remain on the shared mm_struct::futex_atomic reference
// count for the rest of its futex-heavy life, instead of returning to the
// per-CPU counters that commit 56180dd20c19 ("futex: Use RCU-based per-CPU
// reference counting instead of rcuref_t") introduced.
//
// Each thread issues FUTEX_WAKE on a private futex with no waiters, so the
// syscall does essentially nothing except take and drop a reference on the
// process's private futex hash.
//
//   $ gcc -O2 -pthread futex_hash_repro.c -o futex_hash_repro
//   $ ./futex_hash_repro <threads> <seconds> [presize_slots]
//
// Pass presize_slots to call prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, n)
// before any thread is created, which marks the hash "custom" and disables the
// auto-scaling that requests the pivot.
//
// Pin to cores spread across NUMA/sub-NUMA boundaries to see the full effect;
// the cost is dominated by mm_struct::futex_atomic moving between them.

#define _GNU_SOURCE
#include <errno.h>
#include <linux/futex.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

#ifndef PR_FUTEX_HASH
#define PR_FUTEX_HASH 78
#define PR_FUTEX_HASH_SET_SLOTS 1
#define PR_FUTEX_HASH_GET_SLOTS 2
#endif

#define NWORDS 32
static int words[NWORDS * 16];          /* padded, one per cache line */
static atomic_long total_ops;
static int run_seconds;

static double now_s(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

static void *worker(void *arg)
{
    long id = (long)arg;
    int *w = &words[(id % NWORDS) * 16];

    /*
     * Deliberately NO start barrier: each thread begins issuing futex
     * operations the moment it exists. That is what keeps a reference on the
     * private hash while the remaining threads are still being created, so the
     * auto-scale pivot requested at the final thread count is deferred. Adding
     * an idle window here lets the refcount drain and the pivot complete, and
     * the problem disappears -- which is itself part of the report.
     */
    long ops = 0;
    double deadline = now_s() + run_seconds;
    do {
        for (int i = 0; i < 1000; i++)
            syscall(SYS_futex, w, FUTEX_WAKE_PRIVATE, 1, NULL, NULL, 0);
        ops += 1000;
    } while (now_s() < deadline);

    atomic_fetch_add(&total_ops, ops);
    return NULL;
}

int main(int argc, char **argv)
{
    int nthreads = argc > 1 ? atoi(argv[1]) : 96;
    run_seconds  = argc > 2 ? atoi(argv[2]) : 5;
    int presize  = argc > 3 ? atoi(argv[3]) : 0;

    long before = prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS, 0, 0, 0);
    /*
     * presize < 0 asks for slots=0, which selects the GLOBAL hash:
     * fph->hash_mask becomes 0 and __futex_hash() falls back to the global
     * table. That is the pre-6.17 world, where CONFIG_FUTEX_PRIVATE_HASH
     * was "depends on BROKEN".
     */
    if (presize) {
        int slots = presize < 0 ? 0 : presize;
        if (prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, 0, 0))
            fprintf(stderr, "prctl(SET_SLOTS, %d): %s\n",
                    slots, strerror(errno));
        presize = slots;
    }
    long after = prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS, 0, 0, 0);

    pthread_t *t = calloc(nthreads, sizeof(*t));
    for (long i = 0; i < nthreads; i++)
        pthread_create(&t[i], NULL, worker, (void *)i);

    double t0 = now_s();
    for (int i = 0; i < nthreads; i++)
        pthread_join(t[i], NULL);
    double el = now_s() - t0;

    long ops = atomic_load(&total_ops);
    long at_end = prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS, 0, 0, 0);
    printf("threads=%d slots(start=%ld set=%ld end=%ld) "
           "%.2fs %.1f Mops/s\n",
           nthreads, before, after, at_end,
           el, (double)ops / el / 1e6);
    return 0;
}
--- >8 --- futex_hash_repro.c --- >8 ---

