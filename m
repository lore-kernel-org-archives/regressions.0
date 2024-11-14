Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B418CBFB
	for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 19:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731610857; cv=none; b=UUxU9Pgg5viWaqapGX8QgKhle8Q4Bhsn9vcWRiZ0mK1eWEXFv6HkFLqNju5VnclxJDEJe9xu4nENG6zi8jp7xD0hCKMl+Wr4XCO/vF5lGR681U8JmjJ+Lhk8VdKwY9hz+VyRlPgbbyeux/g1DNs+df6JmMVzDLW0Hsjk040Fq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731610857; c=relaxed/simple;
	bh=ksnwTDE/dUDhebnDpklJdpLWpJpk3HHSBiMjts9oTM0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Eof+ci2tKUilRTT1AfDuP0rHMCKi/prPuxNokOFCkeakBSzsARPE26dJbdu7ntQ3dFCp9jlB0yyG4uPfwg/RZ3VGbXr/e+vrf6dYG+1HGtrUMZoNvEZjlBpzcVtQC8uhmVRSqEaeOge4L37/tC0dq1S/mzU6ya/2YcwfIbxjmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mqzn4BSS; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mqzn4BSS"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71ec3392c25so979415b3a.1
        for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 11:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731610854; x=1732215654; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+vtCKFwRHOyBTbrHTcq12fkzIAClNT27MCjUuoEV7g8=;
        b=mqzn4BSSLQoexS1Rr6K50RtSf0B3ThDphZ+TpkKWNVOiomt8T4YrRoAETdFj2wCOcm
         Lih3vyo+U7Hxh0QZr4pou+VakaLlzZ5/uQpiND+Gk3aHRFiLCaPUdOse5qogVntqUY4s
         l+99i1/QOnDL04kjFTy/vUc72LYhdCG9fY3lCQ2Bf62UuY4ip5D/0w7uKj6hgimuyQE6
         tMcADCoJVrwY+Ai+8YRl8IkFkTQlEd1n90T4oUXxvZa+M2mujokd+PMGF8d6PHibZV4r
         NYDcAMFiO2jghP4o3/Or1hovjv9aJfZdgkq0E3bzM3syjkihyUrfXRchx0+ahwxpVlO3
         GlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610854; x=1732215654;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vtCKFwRHOyBTbrHTcq12fkzIAClNT27MCjUuoEV7g8=;
        b=LeyRIUbRQliSpKRI/n7mlkehezX1tLCdEio+TvNgfIzqgLHeKlxIINz47uzVoUJfeB
         v+Pv/m+N7Oz3hcd3kaaoK+nbKy/1RY4bDU1KzyF1Hpj/irX3aiqcoGLzOwSSdbQgcvbg
         O/j7T5JoNctXjeyJvDAdDsReJSoZqoUFZgeopyjFN9YQTXidoH8QuQ6EEAsTi/xNfYos
         QjtkDmFI41RPn9hPGFUYj52v60g0lgiUELnomOfVXx73rWiTnM0REAVBfPOylOTkSWzw
         l47MXMBCLS+oQUK+tEi8b4TUswH1ihSIdHTj6kOZuy9LIZJQhvv2ZbQOsxLP+ybOTaJY
         L8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpnvSwDfsj5ZO//KGTL5JvBIOw5pohGF9MZBSRGdqdTf55Y6LDPTu0OT54nqDXe3n8RcGSRGX/xH5X2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwzOTMa1/WGwsfc7A+a7Nn5GRQlLDaATLPlAAZuzBowfLGPVVw
	Wej/znoI4H79+gfSS6gVRFaT5tqhclQ8r9vbN8R8nxG5jdNnj1YR5VTY4QDO55SC8WIrX5KwLxU
	05oiR
X-Google-Smtp-Source: AGHT+IE/GDni8tDvMRvqR7DODgCnOX8yXZFz69Y33hmoz1TmL8eynyASyO7qKiEpJ51ScOibxQmXGliBBDYT
X-Received: from jstultz-noogler2.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a05:6a00:988:b0:71e:4535:9310 with SMTP id
 d2e1a72fcca58-724769f6913mr101b3a.0.1731610854501; Thu, 14 Nov 2024 11:00:54
 -0800 (PST)
Date: Thu, 14 Nov 2024 11:00:47 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241114190051.552665-1-jstultz@google.com>
Subject: [PATCH] locking: rtmutex: Fix wake_q logic in task_blocks_on_rt_mutex
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-team@android.com, 
	Davidlohr Bueso <dave@stgolabs.net>, regressions@lists.linux.dev, 
	Thorsten Leemhuis <linux@leemhuis.info>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Anders had bisected a crash using PREEMPT_RT with linux-next and
isolated it down to commit 894d1b3db41c ("locking/mutex: Remove
wakeups from under mutex::wait_lock"), where it seemed the
wake_q structure was somehow getting corrupted causing a null
pointer traversal.

I was able to easily repoduce this with PREEMPT_RT and managed
to isolate down that through various call stacks we were
actually calling wake_up_q() twice on the same wake_q.

I found that in the problematic commit, I had added the
wake_up_q() call in task_blocks_on_rt_mutex() around
__ww_mutex_add_waiter(), following a similar pattern in
__mutex_lock_common().

However, its just wrong. We haven't dropped the lock->wait_lock,
so its contrary to the point of the original patch. And it
didn't match the __mutex_lock_common() logic of re-initializing
the wake_q after calling it midway in the stack.

Looking at it now, the wake_up_q() call is incorrect and should
just be removed. So drop the erronious logic I had added.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Joel Fernandes <joelaf@google.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Benjamin Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel-team@android.com
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: regressions@lists.linux.dev
Cc: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Anders Roxell <anders.roxell@linaro.org>
Fixes: 894d1b3db41c ("locking/mutex: Remove wakeups from under mutex::wait_lock")
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/lkml/6afb936f-17c7-43fa-90e0-b9e780866097@app.fastmail.com/
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
 kernel/locking/rtmutex.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index c7de80ee1f9d..a01e81179df0 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1248,10 +1248,7 @@ static int __sched task_blocks_on_rt_mutex(struct rt_mutex_base *lock,
 
 		/* Check whether the waiter should back out immediately */
 		rtm = container_of(lock, struct rt_mutex, rtmutex);
-		preempt_disable();
 		res = __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);
-		wake_up_q(wake_q);
-		preempt_enable();
 		if (res) {
 			raw_spin_lock(&task->pi_lock);
 			rt_mutex_dequeue(lock, waiter);
-- 
2.47.0.338.g60cca15819-goog

