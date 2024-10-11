Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AAE210182
	for <regressions@lists.linux.dev>; Fri, 11 Oct 2024 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641293; cv=none; b=CDblUp1M2VhvHiaLaafuNnxh2mvOVHWVJMf8byvA8k2hMAAvOIWEFQ44iAubz401mWDcV7B3pWwXrRyLeskLiglU71knZ00OH3IqDNI4mDEXF4tDrTwxJP3Iln07YhmcZp0X5+0owmDuEcKdlK0G1WrFZHomnh9uWLICj6hrFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641293; c=relaxed/simple;
	bh=LzVn8pERo3wShMtL240piFs4IbQa4eGYVpzyVPZIcUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoVl8pcl5doevO4pABOGh+fO/PX85cdmAHIcCApo2ihij3KxU/zDC00J7fuFFwDiCB9g92yCH8Eau9Ac1xDQRu/E6qQWC+uxSLfkmbQi+zF66dNBfNWYjLijdbLf79jVJbaLPTcnT8A0/YoB7SjIt/cqsrGJ9/Leqn4ElSNXFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=yCLo6Ntj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="yCLo6Ntj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4603f47b2c8so20165081cf.1
        for <regressions@lists.linux.dev>; Fri, 11 Oct 2024 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1728641290; x=1729246090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQCHUVieXC/maxrCZuriWbj4FWAgT/JMBz1Cy/ysUrU=;
        b=yCLo6NtjX3yzi2fK8tnr+m3+xHxzY7Hn1rddqH2usDjZ77A3+KiA++2vzeocbDQmgy
         VRfGUZq7kJhKvu2IXFxJbhLTMN/c22rOsUBDaLsWa/FnMcabUnBls9EUtIOhtvZb6pgD
         Z3kklhnaJsDaEky+7uT3R7hJA+KrdOSXtMrJD/AVEch83QRoTYmn3IirFmmiwxBOd9Rp
         Yocm+bPORgG5Jnonczh8iGBHg52NjwEqQLStlrrbmap6ZJ9kVLIMDfH68U10SSF9qrSG
         F07FCwYbHEAOiY1AB2hcpbF+ux04m/iBHTRFpLbf/LnnPyzCui/wImQ06lS0gKytA3Il
         pXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641290; x=1729246090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQCHUVieXC/maxrCZuriWbj4FWAgT/JMBz1Cy/ysUrU=;
        b=h+Z7EH/PgH2SEQ/ORrKNfWDUHjyFbrurwr7Ua1gIT/ljk/kAbG8T/FEznKFFB1RrDl
         YpMcTpXfwLrAKE2UM57vvZnaTilSmAqabaB+Msb4kzAuaVlo5qZL8YCXx59/V+ULjwGt
         8/B60n6h9eLsY1ZHl8kIxW0u1uPNuIFEimzG1ATw1GK+DHnswVRwZndBxqZhfJfXhtSo
         gu+MD5fKMUh7h9ob2HIEyAmBi41gXnNTEpkVpbden2zazPMxC/bPdZ4cNQbVqzq0DaCl
         g0UCJIQHQEB00efXahYdLxWSAuHePofGkXkrNJKk//fH37RbiM2/0qZcDkdakSdJvcRT
         rPAA==
X-Forwarded-Encrypted: i=1; AJvYcCWKPKkjFXQUSoqHl+mStzpomZJz8Uw/RuBpuhAoBfGizJ17qNIKE0yymX7E6lAmcOll4aGs9Jw3GnEOWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw80UX7E2nGiaMMpAhjY5iwIsusZLwsJgpVDtHa9I9LekPHIFHU
	9BE4a6iH1E6OHen8myLcKRtMcnuMxDB9Loy/2OT2ogYycxCIuTXgsDUiflbCSno=
X-Google-Smtp-Source: AGHT+IFu68bfj4KlZX+oQML02MqSIj4X1LzVRMFNAjcPoO3TU5Z670rBUiQ5+zSiTJ1izUVkkMuZWA==
X-Received: by 2002:a05:6214:5b87:b0:6cb:d302:f0cf with SMTP id 6a1803df08f44-6cbeff63b0fmr33690246d6.28.1728641289721;
        Fri, 11 Oct 2024 03:08:09 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8679d3csm14030136d6.137.2024.10.11.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:08:08 -0700 (PDT)
Date: Fri, 11 Oct 2024 06:08:03 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Klaus Kudielka <klaus.kudielka@gmail.com>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Bert Karwatzki <spasswolf@web.de>, regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] sched/core: Indicate a sched_delayed task was
 migrated before wakeup
Message-ID: <20241011100803.GA331616@cmpxchg.org>
References: <20241010082838.2474-1-kprateek.nayak@amd.com>
 <20241010082838.2474-4-kprateek.nayak@amd.com>
 <20241010130316.GA181795@cmpxchg.org>
 <20241010130621.GH17263@noisy.programming.kicks-ass.net>
 <20241010193712.GC181795@cmpxchg.org>
 <20241011083323.GL17263@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011083323.GL17263@noisy.programming.kicks-ass.net>

On Fri, Oct 11, 2024 at 10:33:23AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 10, 2024 at 03:37:12PM -0400, Johannes Weiner wrote:
> > It's slightly more invasive on the psi callback
> > side, but I think it keeps the sched core bits simpler. Thoughts?
> 
> I wouldn't mind if psi_{en,de}queue() get the full flags argument in the
> future. For now the one boolean seems to work, but perhaps it makes more
> sense to just pass the flags along in their entirety.

Something like this?

I like it better too. There is a weird asymmetry between passing
ENQ_MIGRATED to one and !ENQ_SLEEP to the other both as "migrate".

No strong preference for whether the ENQUEUE_RESTORE check should be
in caller or callee, but I figured if we pass the flags anyway...

I toyed with a separate branch for ENQUEUE_INITIAL. But it saves one
branch during fork while adding one to repeat enqueues. The latter
should be hotter on average, so I removed it again.

Completely untested. But if it looks good, I'll send a proper patch.

---

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 527502a86ff9..42cf181bf3ab 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2019,10 +2019,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	 */
 	uclamp_rq_inc(rq, p);
 
-	if (!(flags & ENQUEUE_RESTORE)) {
+	psi_enqueue(p, flags);
+
+	if (!(flags & ENQUEUE_RESTORE))
 		sched_info_enqueue(rq, p);
-		psi_enqueue(p, flags & ENQUEUE_MIGRATED);
-	}
 
 	if (sched_core_enabled(rq))
 		sched_core_enqueue(rq, p);
@@ -2039,10 +2039,10 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & DEQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
-	if (!(flags & DEQUEUE_SAVE)) {
+	if (!(flags & DEQUEUE_SAVE))
 		sched_info_dequeue(rq, p);
-		psi_dequeue(p, !(flags & DEQUEUE_SLEEP));
-	}
+
+	psi_dequeue(p, flags);
 
 	/*
 	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 767e098a3bd1..8ee0add5a48a 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -127,21 +127,25 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
  * go through migration requeues. In this case, *sleeping* states need
  * to be transferred.
  */
-static inline void psi_enqueue(struct task_struct *p, bool migrate)
+static inline void psi_enqueue(struct task_struct *p, int flags)
 {
 	int clear = 0, set = 0;
 
 	if (static_branch_likely(&psi_disabled))
 		return;
 
+	/* Same runqueue, nothing changed for psi */
+	if (flags & ENQUEUE_RESTORE)
+		return;
+
 	if (p->se.sched_delayed) {
 		/* CPU migration of "sleeping" task */
-		SCHED_WARN_ON(!migrate);
+		SCHED_WARN_ON(!(flags & ENQUEUE_MIGRATED));
 		if (p->in_memstall)
 			set |= TSK_MEMSTALL;
 		if (p->in_iowait)
 			set |= TSK_IOWAIT;
-	} else if (migrate) {
+	} else if (flags & ENQUEUE_MIGRATED) {
 		/* CPU migration of runnable task */
 		set = TSK_RUNNING;
 		if (p->in_memstall)
@@ -158,17 +162,14 @@ static inline void psi_enqueue(struct task_struct *p, bool migrate)
 	psi_task_change(p, clear, set);
 }
 
-static inline void psi_dequeue(struct task_struct *p, bool migrate)
+static inline void psi_dequeue(struct task_struct *p, int flags)
 {
 	if (static_branch_likely(&psi_disabled))
 		return;
 
-	/*
-	 * When migrating a task to another CPU, clear all psi
-	 * state. The enqueue callback above will work it out.
-	 */
-	if (migrate)
-		psi_task_change(p, p->psi_flags, 0);
+	/* Same runqueue, nothing changed for psi */
+	if (flags & DEQUEUE_SAVE)
+		return;
 
 	/*
 	 * A voluntary sleep is a dequeue followed by a task switch. To
@@ -176,6 +177,14 @@ static inline void psi_dequeue(struct task_struct *p, bool migrate)
 	 * TSK_RUNNING and TSK_IOWAIT for us when it moves TSK_ONCPU.
 	 * Do nothing here.
 	 */
+	if (flags & DEQUEUE_SLEEP)
+		return;
+
+	/*
+	 * When migrating a task to another CPU, clear all psi
+	 * state. The enqueue callback above will work it out.
+	 */
+	psi_task_change(p, p->psi_flags, 0);
 }
 
 static inline void psi_ttwu_dequeue(struct task_struct *p)
