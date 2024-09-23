Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A771A4C96
	for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727106372; cv=none; b=YEIWN7swZfsRoYdrgwtUIrZ+/vBUn5X1Um//eQoOIpYUPlrrR/raz1aHM+TYoqpzyXQGyJufUKJMKc3i2W1b71lxDY0LVp1PcYCCGTLixuKjVmztm/s4o/tszXc/NPYN1LeOOFfXBtzfJqVErQeK0LirDdXXEefB5nJ3BhRw0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727106372; c=relaxed/simple;
	bh=C2xYYnW+/eBvgc3v+eP03xaZFfxQt6yM2oxQFwb5t2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrGTyGh/sumXWeP8uYEJ8hOXmz7tZvrLqMrERxLU68ayLDbpbvFLhyhkA3hm5V6mlvhBpw2sNKovLjfZeo4HS9DdYfzQ3c9FV1aa7rx2L4ZYNBCzqk/sjSODiJGTzaofJTPmlNb7YHQ1yTm8ooh/0eRN89fzkwQX7D8DfsIZ/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=mJOamtPy; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="mJOamtPy"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9ad8a7c63so488340885a.3
        for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1727106368; x=1727711168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESYwXswqqcUH5BLw9hFh9aaHVtjhIWmKyClvFuaPqsg=;
        b=mJOamtPy0uiheqC6zGqKU+Fv8OKsqa60nxc9rkat7Gwh0boJXnS3l5+7wCT5jG6E+F
         mr3aTvXGAMXLKtzeC5tAXu4nBVrDx+IdwQmuZZlGDPfgCc4wMnHCp72H95AA8Yy6CYwK
         +U/1BIAmBVtayx5hpriiII0XmL4IoPxUe7oh5dgvvcgAQUTavVvkwACZCAcUFqPM+7PC
         R0Row7SbfuGGQC7r2reA6vvSCZDD4zkbqsUOEE4bc+UmDpxyQu+k686RGeS3v+Ea8IgQ
         Ns1Eoe7o65d3dOnxD9ehfwt1rFxiYM02ffhAWwRAwQ81ur0bJQ628yy194wi72qwhnXQ
         pblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106368; x=1727711168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESYwXswqqcUH5BLw9hFh9aaHVtjhIWmKyClvFuaPqsg=;
        b=kcN3rm5pY6e4zZRE7q39pyhXXAUgbDthJxZ4KPqFWxItbYI/qYsjdFNiPe6Un9I2HA
         0i6ggwXuKvUQu15yZRjxJCGcgMx1YIQn9TJYgN9L1k7MrXpvEhS+25SfmjWrCSzBqSSP
         Hpd6FHZ3rPPzhY7gv0XbRqClGFk86WrnIizTqBWpOGCgN3G8jBzRKP12N8u9Wk13kCa9
         61qHUcquyeF2Q/2jemzHd50ZT5ufMymoK+sAiVM5+YsGuE9nWQK8XkMPD3B8JosUV2Df
         +NOo3uxEndx7rW2gBSnA1WLmk1GwUOKr8VfaSiTUweqkuiuXUf+69I8W9x86wCSe5Oar
         Dg/A==
X-Forwarded-Encrypted: i=1; AJvYcCXuSMYi6GsTFhhAbt45eTLCiuf+Vi5w10ygy2aVAzZzF9Wa70CrUZ2mRxz5PEmYA5AP1QV9bJnxEtYgfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhlLsnSE09njtbjhTgoDIUXNUUkSX0d4sR0ZtZOS9dSBdDh+Dk
	7NiwMYlIRo8Bm7fq1Fvm76jfIyDj+htZ6HSVUZSSqq/TpOh1oXt67N03vwYVaLQ=
X-Google-Smtp-Source: AGHT+IHPUR6EuXJsHNnKKFnokK0Em7hNPMb8rIhk8WEyODJzzOukPb0nF82ySC7C0nba/DeW5dzZjg==
X-Received: by 2002:a0c:f20a:0:b0:6c5:2a13:b8e1 with SMTP id 6a1803df08f44-6c7bc83bf00mr207859086d6.43.1727106368349;
        Mon, 23 Sep 2024 08:46:08 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e44bfc4sm48392486d6.2.2024.09.23.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 08:46:06 -0700 (PDT)
Date: Mon, 23 Sep 2024 11:46:01 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Parag W <parag.lkml@gmail.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	pmenzel@molgen.mpg.de, regressions@lists.linux.dev,
	surenb@google.com, tglx@linutronix.de
Subject: Re: Error: psi: inconsistent task state! task=1:swapper/0 cpu=0
 psi_flags=4 clear=0 set=4
Message-ID: <20240923154601.GC437832@cmpxchg.org>
References: <20240922102047.GA437832@cmpxchg.org>
 <20240923120339.11809-1-parag.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923120339.11809-1-parag.lkml@gmail.com>

On Mon, Sep 23, 2024 at 08:03:39AM -0400, Parag W wrote:
> FWIW, moving psi_enqueue to be after ->enqueue_task() in
> sched/core.c made no difference - I still get the inconsistent task
> state error. psi_dequeue() is already before ->dequeue_task() in
> line with uclamp.

Yes, that isn't enough.

AFAICS, in psi want to know when a task gets dequeued from a core POV,
even if the class holds on to it until picked again. If it's later
picked and dequeued by the class, I don't think there is a possible
call into psi. Lastly, if a sched_delayed task is woken and enqueued
from core, psi wants to know - we should call psi_enqueue() after
->enqueue_task has cleared sched_delayed.

I don't think we want the ttwu_runnable() callback: since the task
hasn't been dequeued yet from a core & PSI perspective, we shouldn't
update psi states either. The sched_delayed check in psi_enqueue()
should accomplish that. Oh, but wait: ->enqueue_task() will clear
sched_delayed beforehand. We should probably filter ENQUEUE_DELAYED?

This leaves me with the below diff. But I'm still getting the double
enqueue with it applied:

[root@ham ~]# dmesg | grep -i psi
[    0.350533] psi: inconsistent task state! task=1:swapper/0 cpu=0 psi_flags=4 clear=0 set=4

Peter, what am I missing here?

---

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b6cc1cf499d6..4f036c66cf07 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2012,11 +2012,6 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & ENQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
-	if (!(flags & ENQUEUE_RESTORE)) {
-		sched_info_enqueue(rq, p);
-		psi_enqueue(p, (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED));
-	}
-
 	p->sched_class->enqueue_task(rq, p, flags);
 	/*
 	 * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
@@ -2024,6 +2019,11 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	 */
 	uclamp_rq_inc(rq, p);
 
+	if (!(flags & (ENQUEUE_RESTORE|ENQUEUE_DELAYED))) {
+		sched_info_enqueue(rq, p);
+		psi_enqueue(p, (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED));
+	}
+
 	if (sched_core_enabled(rq))
 		sched_core_enqueue(rq, p);
 }
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 237780aa3c53..138c52c2f2c9 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -129,6 +129,9 @@ static inline void psi_enqueue(struct task_struct *p, bool wakeup)
 	if (static_branch_likely(&psi_disabled))
 		return;
 
+	if (p->se.sched_delayed)
+		return;
+
 	if (p->in_memstall)
 		set |= TSK_MEMSTALL_RUNNING;
 
@@ -148,6 +151,9 @@ static inline void psi_dequeue(struct task_struct *p, bool sleep)
 	if (static_branch_likely(&psi_disabled))
 		return;
 
+	if (p->se.sched_delayed)
+		return;
+
 	/*
 	 * A voluntary sleep is a dequeue followed by a task switch. To
 	 * avoid walking all ancestors twice, psi_task_switch() handles

