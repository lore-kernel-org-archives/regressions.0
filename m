Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C813CFB6
	for <regressions@lists.linux.dev>; Wed, 20 Nov 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128393; cv=none; b=H193A1PMPobKq1FZFk0AyCeDdJVR/zEtlvshYpluo4nQI58tkv+SrhCXfhhk9r0Iu12alVU2MxPPQlv6X9IPHjkghJ1B9GZju2cAjxMVjaPZEMnT3KKSM5JnbhN1vFIlZLodG3tOHmLTrZMSYvmCT1T/S070kTpDfgoDyv2WcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128393; c=relaxed/simple;
	bh=FCvj2/G36BpuLQdzReLtR5lIFwjoErIAljyykkiAk64=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fCWuN31HAtc03BWf8QAjybQN3OX/ZsqArp3Z3pxZP2CqHJE8pwQqE9dMc+zu721FzGScS2huWf206Rg+jB+6bpVzKRC1VQLQCjXr9Lnb77kt23iKgQugWanqpuPbffKGxxon6bFxxbdtsou/280OC/Uk7NBO7/8rlxpjBIGHo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1yTgwbM; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1yTgwbM"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e388f173db4so3891276.3
        for <regressions@lists.linux.dev>; Wed, 20 Nov 2024 10:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732128390; x=1732733190; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hA7/jTfvEvvp0vYIHl4c3THkQPVUzVNCs6YM2/ZYMNA=;
        b=p1yTgwbMJ5XR7VfH5OLiR3XVyWIggYGasUj2WqKZRH2MXK42XaO2W3bBNgvboNVvwG
         rD0hXNct+T0145fwBc3VVemT/wIlUoBE6Dv5LvaQfm+23cKO9a7sOC+Ckxl0IstHAnAS
         2qBGbisLg5Xhgds3F0+eLh/WMeFDm0WhpqU230rw1ffc8qVbTH2lRGkyqk8guad5JnE+
         s2r7GMkO8ehjDM0QarrP2LgxxvZl6aiezuq2s7o7lUt221bhXr4pn5B3eJh5m3XwPiyT
         JGWvfHBBcS5TEzYnnpaqfBNiKm/Ewdvqv4/dwQiKIG7c1GUCP3SpYOrLLZkQIDf9yltJ
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732128390; x=1732733190;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hA7/jTfvEvvp0vYIHl4c3THkQPVUzVNCs6YM2/ZYMNA=;
        b=neC1cYNUISk9IeSKltytvUzbRWpOr3SXF5p1/B3DBqnAM8R76TXfGA+XUJKNSHVc4E
         Hg1JCGIgee2C37Mld+RYS0MmA3qSQIutKEdvBWmQK4MBw2xO45KFZpvMvVhrCgag9aZ6
         LfX4A7SYQIrJf5fVK4yk0LpJf2PAL18vI09NgV8DqZkCFDoYsWd2XCSjWcfAcwh/6dGS
         PiYCw7vvA4U+pJNqOesGTBjLAxzerxRuQPvrsK/NMld+Z/5bbDC0HDWKvJjfb2729qsX
         qZIW7C6w0CdbVRtvNaH0RNeeQX2YewS9KmKdt8NCY69wDFN45QQ8OdmxZs9eU/HvmywR
         XaOw==
X-Forwarded-Encrypted: i=1; AJvYcCXLtKyAq/wY4rKW1T7ibskB22m9nvZ88dtN5DsHe3DZeOOrYcELAGQGSMJmQaVc2HaYQFFD9fjK7OUQPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNlkwwkqG0iLpYDQCviiyU4fVDFjswkFnPyf7bIy9ctX54ofRK
	Qn4P7uChZumBQbaq5BDaJMXB5Rmb8mahe1ed3OGStl8PeejL/cDbxSlXd1mm7dtkzRrpkEisFKc
	sI/nU
X-Google-Smtp-Source: AGHT+IEDkhYTiI5OseGPF+A421GcX+ypm5rVUXPDgikPovAjusbWISocWyC3x6sPz54Lt/atzxBlsEM+WW+c
X-Received: from jstultz-noogler2.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a25:d601:0:b0:e30:d445:a7c with SMTP id
 3f1490d57ef6-e38cb5470c0mr1453276.1.1732128390415; Wed, 20 Nov 2024 10:46:30
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:46:15 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120184625.3835422-1-jstultz@google.com>
Subject: [RESEND][PATCH] locking: rtmutex: Fix wake_q logic in task_blocks_on_rt_mutex
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
Reviewed-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
Apologies for being noisy, I recognize its only been a week, but
I wanted to resend this now as the problematic commit just
landed in Linus' tree and I've not seen this get queued yet.

thanks
-john

---
 kernel/locking/rtmutex.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index ac1365afcc4a..e858de203eb6 100644
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

