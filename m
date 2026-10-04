Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71D440A3E
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124067; cv=none; b=U53gfOI+vL75pI0dJ67KPmx+QRZX15O3lei/qpPXUXd+9h/hTMouq+mC7c91rB2SrFUPsekWuvq+17ETvPMvgHGz4guokmNbiN8fNX7M6DOAdeljBMC4A72Rvz8opLdVTY7PWjqCETx03BEeGtZSgpigOxQqfOgXErIRZz13xQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124067; c=relaxed/simple;
	bh=1KdpqyBuIjuLBvWYIW5i5vria/6OVyt65BvBNkWHUCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xib9cGGurdBvKKhq79pkyahXkRHH0TaeDgdQ8pqNebTuJEAUmcQsRowWuu1tlczHqmPeNqvaE7NBDBGu5C86Y3p7/FpwWu4afjTJbWoEl2oydZOI803odVBzATbsaYeF3wbpmOPnDYP9ewa/dQ+AuPiz3JJXetBvR0FPj7lva2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=p7SipqU1; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="p7SipqU1"
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791124057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f1mUDrEgHuD4xd6cPadDTTmFU27wOGNSESTtR/jQtY8=;
	b=p7SipqU1iSvk3dnl5H7B7i2txRvHbGnjP0yF6uF//WDIdV3FFrL3sqF+C7ATM3n30FeTFg
	dZ4GqX882XwM3OhNpBF1NQDHtZYn52tynDpUiWzsf03IkxDYpbFSlqoYglZ2Pe4bmT4wcn
	l+kyd1pb7/qk5pq2tYFj1HPFVy2LVVg=
To: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] tick/sched: /proc/stat idle time exceeds wall time since v7.2
Date: Sun,  4 Oct 2026 16:27:24 +0200
Message-ID: <20261004142724.3896396-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since v7.2-rc1, /proc/stat counts more idle time than wall time on
NO_HZ_IDLE kernels with TICK_CPU_ACCOUNTING. Monitoring that computes
CPU usage as 1 minus the idle rate shows negative usage on idle
machines.

Measured over 60 s with /proc/stat and the idle_sleeps counters in
/proc/timer_list:

  SPARC T7-1, 7.3-rc5, HZ=100, 256 CPUs:
    idle per wall second 1.0057 on average, 1.44 on the worst CPU
    (92 tick stops/s, 4.8 ms of excess per tick stop)

  amd64 (Opteron 1214), 7.2.7, HZ=1000, 2 CPUs:
    idle machine:                         +0.03% and +0.06%
    a task waking every 3.7 ms on CPU 1:  +13.1% on CPU 1
    (285 tick stops/s, 0.46 ms of excess per tick stop)

On both machines the excess is about half a tick per tick stop.

From reading the code (not bisected), I think the cause is that
cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting") made
dyntick-idle time and tick-sampled time share cpustat[CPUTIME_IDLE].
On idle exit, kcpustat_dyntick_stop() accounts idle time up to now.
The tick is then restarted on its old period, and the first tick
accounts a whole TICK_NSEC through account_process_tick(), although
the part of that period before the idle exit has just been accounted
as idle. Before v7.2, /proc/stat read ts->idle_sleeptime, and the tick
fed a counter it did not use, so nothing was counted twice.

I have a fix that records the overlap in kcpustat_dyntick_stop() and
leaves it out of the first tick. With it, idle per wall second is
1.0000 on both machines, and -0.1% under the wakeup load at 280 tick
stops/s. I am still testing it with IRQ_TIME_ACCOUNTING and with steal
time in a KVM guest, and will send it when that is done.

#regzbot introduced: cf6444c3e1bb7

Stian
