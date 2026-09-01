Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68033AD8B
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303969; cv=none; b=MnpanxHQT/ljbyYZXtnr+g3C1bNTNe4t9HjEMWMisj+vxuckDrREbVOvTXfs3UOQ8IEerg5QCD+p1ylb3jV6aP4AbDUnfu6bXx7ew0J6g3sz23Uy7cbhjo7I0WB1FzHKmQjHYOg+IgZ3pDgZ7xv23OEFz07clzpREYwsrZNF3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303969; c=relaxed/simple;
	bh=tkQ0kD+VMer15vDl/K38aWxjoMQ6gTQ90qZPji1LAis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0V/nhMIRPIlwOZkV6w1oTpYUzFm47HFXaP+xLQYLJiBr3VLpyKhwAUhseefGFzs5XaReEZ1zbCr/DLIz5kMXJVF0q97DTY0fOfgFvEAQfvVbYtaFmf5pd0wI+tzBACRmysgKOAWXtSFmV+rvztBypgYi8mw/VFzemlb/cYsP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is55a8hk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is55a8hk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so3419675e9.3
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303966; x=1788908766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt9MSV90ZufNw6jL5AtF4xHXrqZeARSuYavbAJb7c8w=;
        b=is55a8hkWMOzVMQTPEZpFORsph1/6nzxrSBTfbssjrZbG1TCTcKMplBTy6MxxH2QYa
         G/YDDH+Q2wfVroR3QgFvDr9/IEL0q/ltSIa4eBp9XoosfzVaxYxZDN3u7uI64DPWNdj5
         MaUhvpkyXwBdSlAaYZrN3qawH+Lv3/+zWfcGKxcpJFbuhVTubSqSmK9JeLV44UZkfsio
         fbww9v1+2Dc7eGuTDrFqAH922XiE3E+b4umenQrYOifM1+PG2feqb0t9VONPtC8asaZY
         L7YV9OU5XOx38H8qZXXEcyXsXOjRtR/FqIuKLIXZv9/hMDWtGyqFsWehSDrPY0f6pSgy
         ThTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303966; x=1788908766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt9MSV90ZufNw6jL5AtF4xHXrqZeARSuYavbAJb7c8w=;
        b=lqhNjnC8RYoVlFC+LyHYepWOhkTea5GBnOOSxGQstL8auYEO7hSrrcSjpPPGGYuQqm
         fpPURdAX2V+PnBge7JI04XXFOnvOC721ioZtlDHrLDYMoSVBbuEWzhJspuavP+PIZO5F
         L4P6N3FkH+EtIbAAVKPQVVs7u4NEI7FnKcGGO2Cs8JMBLjiRkurxzeViTUQPHEk8EnkQ
         t+EWu5S5ugHnEkOxr8muOq3uFO9EMbPIkJPe4fH22R3Yp0tzo9afbDe3c/Emuod3Cnow
         Q+TDK/HiABGvLRq0mMeQLAx/VljY4t/UQUeIXafZgaNiHqRNbBSwHVULZPtEwz2Agk2v
         tQvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUEk151gpCo/W4j2r2Fk/0mio5PyVTT/kU7rNvTaQTBnIC7xsSGq6U9fse4jnEHhRDUrlZEs7c8fEJrA==@lists.linux.dev
X-Gm-Message-State: AFuF++mh6CJqGuQmhmS674kF/2BymknSObMG/xXzunTRwz2hfyartgkH
	zMPDWD1UcjvsrB9lZoDWI19OOepVRKptpLiZFisGZoBHwFQCYsQVV/Wy
X-Gm-Gg: AR+sD12C3Cm5/dXAP1hwdIWNYpF3zycf0eBhUQjvBrxgWlekHTQlpFm9ZRrXpBmev5B
	yWp6AE5meujz9wlA+y8r6OVzUodQlnlUW3I8a51ol6UreWL47WnP3lKnZ4eUgP2NvaK0iKc7pRY
	vq2sXngQsMySLk/sMy+l5iuWygfK49gVMHzCCj+/JJOaHv09trrKv8TGtOkyxzqjQvc53aKzgMc
	OalFxkl3zlarPDWH76x9YXwnRki4iMxziI0n/CU1suaKoy8tWyFn4hM11SJW0A+V2NCynBkzhLP
	vibliPzVLdYWd5DFWOOU1oB+ZNhoVZlwMqwuKimP3894zr2ckHa6t2MkOUpKxP3yY3xt854ia5V
	EoecMS3oCfAkmv/SQfqpz5AWjQj7qOB8mnaOyE+6zyHyn52+yactJRYCaorR8ZZPwvpkFoQHl3b
	l2gAoJIkItZVczsw14eR0hiGyXL6C6awFvIedeTi3lTQOJ9MKyJsCaKbJTDr9k4OeewmWZUL4HS
	05brZDKVkESywNpW0VBzS6RFI0Lo0qc/Rjk9CaNYjwyd2VJiHDiOF0xYfJNjMfVengkmErfk+ue
	/MgB1A==
X-Received: by 2002:a05:600c:190d:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49ce584b94bmr12387935e9.13.1788303965569;
        Tue, 01 Sep 2026 16:06:05 -0700 (PDT)
Received: from ip-10-19-79-40.tail983ac.ts.net (ec2-35-159-55-138.eu-central-1.compute.amazonaws.com. [35.159.55.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3706sm2066364f8f.18.2026.09.01.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:06:04 -0700 (PDT)
From: Nikita Taranov <nickita.taranov@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: futex: private hash can stay on the shared atomic refcount indefinitely after auto-scaling
Date: Tue,  1 Sep 2026 23:05:59 +0000
Message-ID: <20260901230559.1978876-1-nickita.taranov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825170605.2462933-1-nickita.taranov@gmail.com>
References: <20260823150046.204417-1-nickita.taranov@gmail.com> <20260824160337.0IvfKx8A@linutronix.de> <20260825170605.2462933-1-nickita.taranov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up with three things: a better reproducer, results from two more
vendors, and a prototype of the approach you suggested.

## A new repro

The code could be found at https://gist.github.com/nickitat/a7a46b61d6769ceec493881f82e7b344 .

This one is an ordinary producer/consumer: threads park in plain FUTEX_WAIT
like the idle workers of a thread pool, others issue plain FUTEX_WAKE on the
same futexes, so waiters are woken, loop and re-park. Only plain FUTEX_WAIT and
FUTEX_WAKE. The kernel's own auto-scaling during thread creation is the only
thing that ever asks for a pivot.

The control is one prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, n) before any
thread exists, which marks the hash custom and disables auto-scaling, so no
pivot is ever requested and the stall cannot occur. Basically, the same story
as in the first repro.

v7.2, Xeon 6975P-C 96c/192t SNC=3, 8 runs of 4 s per point, clock pinned:

  threads   auto   pre-sized   stalled
       16   25.8        42.3      0/8
       32   34.8        41.1      0/8
       48   28.7        31.8      0/8
       64   29.9        34.2      0/8
       96    3.7        46.3      8/8
      128    3.6        53.6      8/8
      192    4.0        38.7      8/8

Throughput is far lower than the numbers in my earlier mails because the work
is real; the comparison is the point. The control (pre-sized) is almost flat
across the whole range, so the work does not get harder with thread count
-- only the arm that requests a pivot collapses, and only above a threshold.

## It is not only this Intel box

> You might have hit the sweet spot with your CPU. I have here a 144 CPU
> box and

I wrote previously that this Intel host was the only one where the repro worked,
based on a 96-thread sweep with the old reproducer. At 192 threads, with the
reproducer above, Graviton4 does reach the same state -- less often,
but permanently when it does.

192 threads, 15 s runs, per-second traces:

                        latched permanently   transient   never
  Xeon 6975P-C                  8 / 8              -        0
  Graviton4 Neoverse-V2         1 / 15           2 / 15    12 / 15
  AMD EPYC 9R45                 0 / 14          14 / 14      -

Graviton4 will stall at a higher rate if the wakers are created gradually
rather than all at once -- the `ramp_ms` parameter spreads their creation
over that many milliseconds in total, which is what a thread pool growing
while already under load does. I saw 5/16 stalls on one run.
AMD still never latched in ~200 runs.

So the state is reachable on more than one vendor's hardware and usually permanent
once entered. What differs is how often a process falls in.
Arguably, this flakiness is worse than a deterministic stall for a real production.

## Prototype of your suggestion

> Not sure what we could do here. One idea might be to block further
> futex syscalls so they don't acquire a new reference on the existing
> hash and allow a transition to the new hash more quickly.

The only analogy available to me due to lack of any knowledge is rw-locks. I asked
Claude to adapt the percpu-rwsem code to futex, and after a few iterations we
produced a hopefully viable patch. I suppose it implements plus-minus your suggestion.

The results (same box and all the rest of the environment):

  - the reproducer: 0/8 stalled at every thread count, against 8/8 on stock at
    96 and above; 192 threads run at 54 Mops/s instead of 4.
  - futex kselftests: 14 passed, 0 failed, with the mechanism enabled and
    disabled; futex_numa and futex_numa_mpol pass.
  - requeue-PI selftests looped under a continuous pivot storm, to exercise the
    drop_fph handoff against the phase: all rounds passed.
  - stress-ng: 64 futex stressors, and a 40-way futex/clone/mmap mix, 0 failures.
  - PROVE_LOCKING and KASAN builds: clean.
  - measured overhead ~0.6% on a pthread_mutex/pthread_cond benchmark with pinned clock.

Makes sense to note that the patch was applied to v7.2 and all testing was done on that build.

The code could be found at https://gist.github.com/nickitat/0b1cc68deff5fe2b27209b150da6fb00 .
If you find it useful, I can prepare a proper patch for the kernel tree.

Regards.
