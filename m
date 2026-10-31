Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434511;
	b=GWWnZl3aXU/9OwYUS2ZAh6gHn9Uo6yLo1M373aSli5m/1LJmsQ1EwQbV6tKIR0zQgjI6
	 55aGoV12OgIWc2DSz4Ry049i0L2zdOzq2CKRUx/1ToRBdqIyOOZRpgSH6kON/wOYWK27m
	 /dO2RgicO8rhnjJAOuwpcZ41GhjY+EbGD/nZI8P9iJ0Jt/h3ZAOxe1uneJz3VU8wopJDb
	 9W03ssns1f398G2r6YoIBS+UMuN2v9KTCI8dECy5LnZebXkqKen2x1wrtQ9tmAWzmGImm
	 TbAN0F0+MtlkLgBnWt1C/UxH2J5UmLAXP3Q8Uhjl2BFqBcRrIMfga1Id+UkDFH5QLRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434511;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FqJxpfEbtPpMaPRZL7Coega2rfTUVb84HDfAPxU5jbM=;
	b=Dxv2mfwSwYW211igdwM1IA2ea96VLKrXeJQ2N+RlYzuQr/98h0Liby5/NkaYBHwyFM+a
	 cwT7kOIfZjaqmEDfYk+WoNFW2te0Yk4SdW5a0fz+M+EZC5RwguZJtBpXnTdjGsO6gjO4Z
	 Ug5D4JEtOvJ0MEkiw3SjDKY9zEthoNw8k/5ja8SLCvlBfil2mP98+WeNula37AgPgcu6C
	 8tWQp50seeKojxEl1c61igH+0krJRhXxgddGIHwwrDnD6QRowaeNl20ht8+YH21xzB4M4
	 hb5JWzb48X5j2fWDRGo+cF/Huz8QX/TxQmZxAKXg4cEsfSQGTHQzCjhzEOhgHDbk59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=aimWbPdP;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0340606A31F
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 08:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0340606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=aimWbPdP
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793434507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FqJxpfEbtPpMaPRZL7Coega2rfTUVb84HDfAPxU5jbM=;
	b=aimWbPdPf/X/bFQZI4BMo41AUaIa3Xyv9zdjegyeHdYAXyqDFiRMet5DzPcYg9meV6ukU+
	truvABeWvVhFUTlBdA3g7lncim2YUignyFwXOpLb97SuCezV8hl0mK2bUltA0x7jHVC3YU
	5NGreDh6aGLslz0iHvKVCxxxaXQr22o=
To: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Breno Leitao <leitao@debian.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/cputime: Don't warn when the tick period starts after idle exit
Date: Sat, 31 Oct 2026 09:14:07 +0100
Message-ID: <20261031081408.3378884-1-stian@itx.no>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kcpustat_dyntick_stop() warns if idle ends before the tick period
that the next tick will account has started. That happens on x86 in
a CPU's first idle period with the tick stopped, right after the
switch from the jiffies clocksource to tsc-early.

On the jiffies clocksource ktime only moves at the tick. When the
clocksource switches some time d after a tick, that d is lost: ktime
continues from the value of the last tick. The next tick comes
TICK_NSEC after the last one, but ktime has only moved TICK_NSEC - d,
while tick_periodic() still adds a full TICK_NSEC to tick_next_period,
which is now d ahead of ktime. When NOHZ starts,
tick_init_jiffy_update() rounds it up to a multiple of TICK_NSEC and
the sched timer is armed there, up to nearly two ticks after now. A
tick stop saves that as ts->last_tick, and an idle exit before now
reaches ts->last_tick - TICK_NSEC sees the tick period in the future.

Nothing is accounted twice then. The first tick covers a period that
starts after the idle exit, and the code already handles it. Drop the
warning.

Fixes: 96a494c9cfd8 ("sched/cputime: Don't account idle time twice after dyntick-idle")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/all/bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de/
Reported-by: Breno Leitao <leitao@debian.org>
Link: https://lore.kernel.org/all/auTCQauaU733PY5z@gmail.com/
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com/
Signed-off-by: Stian Halseth <stian@itx.no>
---
v2: rewrite the commit message, which named the wrong variable and
had the wrong clocksource. The code is unchanged from v1. Add the
reports from Breno and Linus.
v1: https://lore.kernel.org/all/20261025100202.2584654-1-stian@itx.no/

 kernel/sched/cputime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 9e0fb8633d823..17f3cbd5d403a 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -478,7 +478,12 @@ void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 			kc->idle_tick_overlap = 0;
 		}
 		tick_start = max(tick_start, kc->idle_dyntick_entry);
-		if (!WARN_ON_ONCE(now < tick_start))
+		/*
+		 * After a switch from the jiffies clocksource the tick can be
+		 * armed more than a tick ahead, so the period may not have
+		 * started yet.
+		 */
+		if (now > tick_start)
 			kc->idle_tick_overlap += now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick = false;
-- 
2.43.0

