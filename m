Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626763;
	b=nJ4GRkRQf1H2wJNZZV8n5aNxW37VPTBIGzQFKAy/c3ZYyhgswniAm1J2hx16oeR8nErd
	 ritMr0yTKzRdyoHEw9fisyl6Ut2Nkntbf07+5pILd/L+dnhmfDu9Dipftzm7mMAYPtr8J
	 ctrQ+m0TA5zn+7egMbC0hNWcq8BmsvU0tXmnecRIGjpaxfDfpk05zDmk6FSn20otOB1mN
	 zp70KNF0O6O78oBf0RFT4fhj5Z1epARzBse3F6XKqxgq9gTTCQ83+eo2j4GhKAXhv7un0
	 9BydouxvRQI1BGGpiT/bvD/FJBi1TxB7MobK+VWSMxRx/JQ0Rynuw3XbhNcawU3ZsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626763;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
	b=ssA64PrCmkaZGoSCrF/o9a+Fb/pY46HM45RAPOoRezJ1SBqCP80nm43jHEOyVt0vtT3W
	 q+2sH3kQO5vqxBCmUqaz8OrzcSfvNnLqRzNdo6BgyzbEw+M8+iuJAahHNXrg1048VDHo7
	 4FCfpAN/Dd3gHYPh+y7eo7REreRX5PIh0VOitX3WvLK5pe5qe2RNKLsI/HhI5Ltemi81i
	 OlevcM+RqndZ9d3OPA66/pnS/i9vhHnAuLfbktXDNViLdibaYXOokUR6lytTI1owucUe6
	 CRUkDG+pgV4H6fCws02NRETthFaQkBAA+y9mufx8OGpuUswc8L0UPEuVe7zNxZRWZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FosV7S9N;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041D606A326
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 13:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B041D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FosV7S9N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793626761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
	b=FosV7S9NMGGtT4hY0IZkF1TmDorZE/UzwgVwS3h+iS8HC3bLV+PptY/Kw+XROBx0XDLD+a
	qY6TLzdbZI+ZYgUxNJ4C1iixmXNT10guVtKrSDyfngFMm6EfJ0hPLV4jG2G9y4T82vVFM5
	cMMJI+rfVjnZCX3OjO3CZJdssnGa0M0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-BBjEOlDyMv-0wNch9RH-zA-1; Mon, 02 Nov 2026 08:39:20 -0500
X-MC-Unique: BBjEOlDyMv-0wNch9RH-zA-1
X-Mimecast-MFC-AGG-ID: BBjEOlDyMv-0wNch9RH-zA_1793626759
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b00febba3so2085168f8f.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 05:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626759; x=1794231559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
        b=zpsC/ZucGnOHGeqC6/9x8OMPnLV5yELv7MQexGqTYJthql9vkdarwP92x3M0N8mdf6
         K7AsIBijfM+K4//0sFtLzaPM449iLQU15rFIOivVP0/gN4/lKVPar/pjQ3Fk6+WmKKCJ
         JgkTIscjs4bJnI4IsnBFDdxWdwMw6yE5GX24wLz7HFg96IgARrgEYBQZlP//pMKwsg//
         XaDnyyQA93KwyoPNY3lXT7rPiCqnGLTjernaF/QZF1MHd50oQXMS0a901gQn8WQQDogP
         CqFdKGwXdMqaIxoaWoUnADMq8C/rCpQVmAa+bwuZBcuiOQ6qRavP2sDOCAoGjKxOguqf
         umCw==
X-Forwarded-Encrypted: i=1; AKwUvBwFqAuVIA7mscOVWU7IG88A6Z2r2wKIJmw0gS3FtURM0MzFZSFzrxVVvEJta9tQtYWDk/I6amLN65kHGw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8U/dTEtcgHpuE0NwNFoDP3rtvF2lXYodeprVe1GWEAB8oHNcgE
	1NKlv017jdOhxvqg6qEZCgoQSBrizyfNI368u2F0N1OMNdoEF5tMKEnqH8oVE2NRVnuQ5t78YWy
	msEAc5dP3q9m9qUENKT1U9w4lHCQddJG4LmgB9CjvAC/ndU8eR2inV0ZQ7qddDQEa
X-Gm-Gg: AYBFou2zR4S4cP5fcm8OMOIy5rd0n3OZaElgih6WLh+j6wWyzM9fZwcfK7Z7H7Z8MCK
	ngSCDLvZr/n0AxZrHnOFyZ2CQ5P+C4GCptzPOrEOZJGFHwWkzGZNbTVoXgI1fX0svkjtkzRdgTU
	Gv++9pmZmPbNvtJk5r9i2u/ImRmjLiuzpt55lulbkv0neHVh6laF+/pJdsGSNZoqS7P8GUu76L/
	18y/8tQ3dOP7mUr1EonC3uMu1hP86WIX7Y/xy2TYbpkE43fNCGMTh+jOb7a0vSiEVxxEbuYqdAF
	z2FjhZh9jzG8hgcpvC5ADHYhDmnkPlBVPtEOk0wbrEELXImHMluc8141vQJF/iA8YGa2ITA64Ao
	kNagjbImxvWyL7YRacQU3CrCQpO/lokuAqsGL9gsfzG68mFfJeiuXkY5Ujo1bQPancsr2XyVHnY
	eeZA==
X-Received: by 2002:a5d:588a:0:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-48e6e2ff039mr22169070f8f.22.1793626759034;
        Mon, 02 Nov 2026 05:39:19 -0800 (PST)
X-Received: by 2002:a5d:588a:0:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-48e6e2ff039mr22168991f8f.22.1793626758540;
        Mon, 02 Nov 2026 05:39:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm20245980f8f.20.2026.11.02.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:39:17 -0800 (PST)
Date: Mon, 2 Nov 2026 14:39:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Weiheng Qiu <weihengqiuu@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, cgroups@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline, cpuset: total_bw corrupted by a sleeping DL
 task's cpuset move
Message-ID: <auiSg2cB6BSjtg9a@jlelli-thinkpadt14gen4.remote.csb>
References: <14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DBRWZdTxuULxxPOs-U_G--WB2BVR1qNxfROmp71GR9k_1793626759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 31/10/26 17:08, Weiheng Qiu wrote:
> Hi,
> 
> Moving a sleeping SCHED_DEADLINE task from the root cpuset into an
> exclusive partition and back, before it runs again, leaves the root
> domain short by the task's bandwidth. The root then over-admits, and
> when the task exits its total_bw underflows: small DL requests fail
> with -EBUSY while large ones wrap in __dl_overflow() and are admitted.
> The partition also keeps a stale reservation.
> 
> cpuset_can_attach() and set_cpus_allowed_dl() both decide through
> dl_task_needs_bw_move(), which tests task_rq(p)->rd. A sleeping task
> is not migrated when its affinity changes, so task_rq(p) still points
> at the CPU it last ran on, and on the move back the root domain is
> neither re-credited nor the partition debited.
> 
> Reproducer below; needs root, cgroup v2 and debugfs, and turns the
> last CPU into a partition, so use a test VM. On mainline c339f4010dea
> with 4 CPUs:
> 
>   cpu3 is a partition; sleeping DL task 76 (0.5 CPU) in the root cgroup
>   total_bw in CPUs (change since start):
>   start:                     root  0.650 (+0.000)   partition  0.050 (+0.000)
>   moved into the partition:  root  0.150 (-0.500)   partition  0.550 (+0.500)
>   moved back to the root:    root  0.150 (-0.500)   partition  0.550 (+0.500)
>   (expected: +0.000 and +0.000; the task is in state S and has not run)
>   root domain admits 28 more 0.1-CPU tasks: 0.650 + 28 x 0.1 = 3.450 CPU
>   reserved, limit 3.000 CPU (3 CPUs x 1000000/1000000)
>   those tasks exited:        root  0.150 (-0.500)   partition  0.550 (+0.500)
>   the DL task exited:        root -0.350 (-1.000)   partition  0.550 (+0.500)
>   DL tasks left: 0; new 0.010-CPU request: Device or resource busy
>   DL tasks left: 0; new 0.500-CPU request: accepted
>   after a root-domain rebuild (recomputed): root 0.150, partition 0.050
>   moved in while asleep, then SCHED_DEADLINE: Operation not permitted

Thanks for the report and reproducer.

Can you check if what below helps with it?

Best,
Juri
---
 kernel/sched/deadline.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 4d66e7298b686..2eebb688891a8 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3324,14 +3324,26 @@ static void task_woken_dl(struct rq *rq, struct task_struct *p)
 	}
 }
 
+/*
+ * Find the root domain where a DL task's bandwidth is currently
+ * accounted. For a sleeping task that was moved between cpusets
+ * without running, task_rq(p)->rd may be stale. Use the task's
+ * current cpus_ptr (not yet updated to the new mask) to find the
+ * actual root domain.
+ */
+static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
+{
+	unsigned int cpu = cpumask_first_and(p->cpus_ptr, cpu_active_mask);
+
+	BUG_ON(cpu >= nr_cpu_ids);
+	return cpu;
+}
+
 static void set_cpus_allowed_dl(struct task_struct *p,
 				struct affinity_context *ctx)
 {
-	struct rq *rq;
-
 	WARN_ON_ONCE(!dl_task(p));
 
-	rq = task_rq(p);
 	/*
 	 * Migrating a SCHED_DEADLINE task between exclusive
 	 * cpusets (different root_domains) entails a bandwidth
@@ -3339,16 +3351,16 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 	 * domain (see cpuset_can_attach()).
 	 */
 	if (dl_task_needs_bw_move(p, ctx->new_mask)) {
-		struct dl_bw *src_dl_b;
+		unsigned int src_cpu = dl_task_root_domain_cpu(p);
+		struct dl_bw *src_dl_b = &cpu_rq(src_cpu)->rd->dl_bw;
 
-		src_dl_b = dl_bw_of(cpu_of(rq));
 		/*
 		 * We now free resources of the root_domain we are migrating
 		 * off. In the worst case, sched_setattr() may temporary fail
 		 * until we complete the update.
 		 */
 		raw_spin_lock(&src_dl_b->lock);
-		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
+		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(src_cpu));
 		raw_spin_unlock(&src_dl_b->lock);
 	}
 
@@ -3358,10 +3370,13 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
+	unsigned int cpu;
+
 	if (!dl_task(p))
 		return false;
 
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	cpu = dl_task_root_domain_cpu(p);
+	return !cpumask_intersects(cpu_rq(cpu)->rd->span, new_mask);
 }
 
 /* Assumes rq->lock is held */

