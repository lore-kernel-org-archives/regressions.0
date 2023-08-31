Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C4746B
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 08:48:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bf078d5f33so4279365ad.3
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693471733; x=1694076533; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmHxtW5BDCI+klsJLFmGsEYI1Ty7dMZvjkbH7YkXfSw=;
        b=MG3rGHp/RhYT7zRaNZTzbvaQIpST/EJgcnvlBZXiQPQs94qSK6ZyAEGeJQoSfaXBy6
         9xlBKRzq7Fwoyha4WTkEFqOFex2SbFxLESSQ7yVz5woYhGY26OlDOUOkNunb4XKmP55m
         0pjuozDg9aQYLqRauPeFGXwRVd0rxSXFB0Okp/QqWxd/XL6PFrHo4Xa0JbAazuXh9BFr
         Rv0EXFozaQcZiRqmvI1SSsW4orjrSCpACxZqXTEZ1k2Qx2aobGGdkdnjigjd+0g5mTyE
         XaIoWOvndQYSIkVKfRShCucQgOe46HgRDm7VDfE5V4Bv6iJyJ6C0w9BPYBgAkC3XGEoI
         o+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693471733; x=1694076533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cmHxtW5BDCI+klsJLFmGsEYI1Ty7dMZvjkbH7YkXfSw=;
        b=MGFmw4dH8/XZANtRs6SkyrHCfz7fyHOgM6wYBhPIrIhgRWzPsSuQsEawLYJbpfbp3t
         jmN7HR2FdBiSCYTcjn/dDNUs/NpBzHsbTsNto9KaRCVopxtPqv+bG73H45s6Con7uWVx
         EgoL0/7s7+sXQERQY4+ur5PdumeobUTCl0TLXTsHb3GWnu2LZny4USRMDpr6eJ1+2YCm
         xY8XAgEIGlq9I8auE7f3p+yH9gsamrLnlwqafxv7943af8VdzVU1DJYF/LBG4tyvEevb
         E9LksjCYxwXhl/cgMhABbhwCTAVmBpe84b3i/P/Dqa2o8UUPHsK+5RlU3eSUVI2JkJu0
         ggeA==
X-Gm-Message-State: AOJu0YwVF4/NsV3y0pLp9hkKflNT9VOSNf4BPlshT02rJBzyTs14KbM2
	YC81R1hd6UDl7WVVNlwcaCCWNg==
X-Google-Smtp-Source: AGHT+IEU4uV9edU+XNhQL065uaOKU00Or8bYyU1MHRoHn/U6tR5DeM7K54pCViRvbdp7PFa7UZxdnA==
X-Received: by 2002:a17:902:d34c:b0:1b8:a19e:a3d3 with SMTP id l12-20020a170902d34c00b001b8a19ea3d3mr4068259plk.52.1693471732861;
        Thu, 31 Aug 2023 01:48:52 -0700 (PDT)
Received: from [10.84.158.67] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902fe8200b001bdf45eb5b6sm786424plm.284.2023.08.31.01.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 01:48:52 -0700 (PDT)
Message-ID: <55e2861e-9722-08f8-2c49-966035ff4218@bytedance.com>
Date: Thu, 31 Aug 2023 16:48:29 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [External] Re: Fwd: WARNING: CPU: 13 PID: 3837105 at
 kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
To: Benjamin Segall <bsegall@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Igor Raits <igor.raits@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
 <xm26cyz4ibnb.fsf@google.com>
From: Hao Jia <jiahao.os@bytedance.com>
In-Reply-To: <xm26cyz4ibnb.fsf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/8/31 Benjamin Segall wrote:
Hi,

> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> Hi,
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> Hello, we recently got a few kernel crashes with following backtrace. Happened on 6.4.12 (and 6.4.11 I think) but did not happen (I think) on 6.4.4.
>>>
>>> [293790.928007] ------------[ cut here ]------------
>>> [293790.929905] rq->clock_update_flags & RQCF_ACT_SKIP
>>> [293790.929919] WARNING: CPU: 13 PID: 3837105 at kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
>>> [293790.933694] Modules linked in: [...]
>>> [293790.946262] Unloaded tainted modules: edac_mce_amd(E):1
>>> [293790.956625] CPU: 13 PID: 3837105 Comm: QueryWorker-30f Tainted: G        W   E      6.4.12-1.gdc.el9.x86_64 #1
>>> [293790.957963] Hardware name: RDO OpenStack Compute/RHEL, BIOS edk2-20230301gitf80f052277c8-2.el9 03/01/2023
>>> [293790.959681] RIP: 0010:__cfsb_csd_unthrottle+0x149/0x160
>>
>> See Bugzilla for the full thread.
>>
>> Anyway, I'm adding this regression to regzbot:
>>
>> #regzbot introduced: ebb83d84e49b54 https://bugzilla.kernel.org/show_bug.cgi?id=217843
>>
>> Thanks.
>>
>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217843
> 
> The code in question is literally "rq_lock; update_rq_clock;
> rq_clock_start_loop_update (the warning)", which suggests to me that
> RQCF_ACT_SKIP is somehow leaking from somewhere else?

If I understand correctly, rq->clock_update_flags may be set to 
RQCF_ACT_SKIP after __schedule() holds the rq lock, and sometimes the rq 
lock may be released briefly in __schedule(), such as newidle_balance(). 
At this time Other CPUs hold this rq lock, and then calling 
rq_clock_start_loop_update() may trigger this warning.

This warning check might be wrong. We need to add assert_clock_updated() 
to check that the rq clock has been updated before calling 
rq_clock_start_loop_update().

Maybe some things can be like this?

From: Hao Jia <jiahao.os@bytedance.com>
Date: Thu, 31 Aug 2023 11:38:54 +0800
Subject: [PATCH] sched/core: Fix wrong warning check in 
rq_clock_start_loop_update()

Commit ebb83d84e49b54 ("sched/core: Avoid multiple
calling update_rq_clock() in __cfsb_csd_unthrottle()")
add "rq->clock_update_flags & RQCF_ACT_SKIP" warning in
rq_clock_start_loop_update().
But this warning is inaccurate and may be triggered
incorrectly in the following situations:

     CPU0                                      CPU1

__schedule()
   *rq->clock_update_flags <<= 1;*   unregister_fair_sched_group()
   pick_next_task_fair+0x4a/0x410      destroy_cfs_bandwidth()
     newidle_balance+0x115/0x3e0       for_each_possible_cpu(i) *i=0*
       rq_unpin_lock(this_rq, rf)      __cfsb_csd_unthrottle()
       raw_spin_rq_unlock(this_rq)
                                       rq_lock(*CPU0_rq*, &rf)
                                       rq_clock_start_loop_update()
                                       rq->clock_update_flags & 
RQCF_ACT_SKIP <--

       raw_spin_rq_lock(this_rq)

So we remove this wrong check. Add assert_clock_updated() to
check that rq clock has been updated before calling
rq_clock_start_loop_update(). And use the variable rq_clock_flags
in rq_clock_start_loop_update() to record the previous state of
rq->clock_update_flags. Correspondingly, restore rq->clock_update_flags
through rq_clock_flags in rq_clock_stop_loop_update() to prevent
losing its previous information.

Fixes: ebb83d84e49b ("sched/core: Avoid multiple calling 
update_rq_clock() in __cfsb_csd_unthrottle()")
Cc: stable@vger.kernel.org
Reported-by: Igor Raits <igor.raits@gmail.com>
Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Hao Jia <jiahao.os@bytedance.com>
---
  kernel/sched/fair.c  | 10 ++++++----
  kernel/sched/sched.h | 12 +++++++-----
  2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 911d0063763c..0f6557c82a4c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5679,6 +5679,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
  #ifdef CONFIG_SMP
  static void __cfsb_csd_unthrottle(void *arg)
  {
+	unsigned int rq_clock_flags;
  	struct cfs_rq *cursor, *tmp;
  	struct rq *rq = arg;
  	struct rq_flags rf;
@@ -5691,7 +5692,7 @@ static void __cfsb_csd_unthrottle(void *arg)
  	 * Do it once and skip the potential next ones.
  	 */
  	update_rq_clock(rq);
-	rq_clock_start_loop_update(rq);
+	rq_clock_start_loop_update(rq, &rq_clock_flags);

  	/*
  	 * Since we hold rq lock we're safe from concurrent manipulation of
@@ -5712,7 +5713,7 @@ static void __cfsb_csd_unthrottle(void *arg)

  	rcu_read_unlock();

-	rq_clock_stop_loop_update(rq);
+	rq_clock_stop_loop_update(rq, &rq_clock_flags);
  	rq_unlock(rq, &rf);
  }

@@ -6230,6 +6231,7 @@ static void __maybe_unused 
update_runtime_enabled(struct rq *rq)
  /* cpu offline callback */
  static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
  {
+	unsigned int rq_clock_flags;
  	struct task_group *tg;

  	lockdep_assert_rq_held(rq);
@@ -6239,7 +6241,7 @@ static void __maybe_unused 
unthrottle_offline_cfs_rqs(struct rq *rq)
  	 * set_rq_offline(), so we should skip updating
  	 * the rq clock again in unthrottle_cfs_rq().
  	 */
-	rq_clock_start_loop_update(rq);
+	rq_clock_start_loop_update(rq, &rq_clock_flags);

  	rcu_read_lock();
  	list_for_each_entry_rcu(tg, &task_groups, list) {
@@ -6264,7 +6266,7 @@ static void __maybe_unused 
unthrottle_offline_cfs_rqs(struct rq *rq)
  	}
  	rcu_read_unlock();

-	rq_clock_stop_loop_update(rq);
+	rq_clock_stop_loop_update(rq, &rq_clock_flags);
  }

  bool cfs_task_bw_constrained(struct task_struct *p)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 04846272409c..ff2864f202f5 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1558,20 +1558,22 @@ static inline void 
rq_clock_cancel_skipupdate(struct rq *rq)
   * when using list_for_each_entry_*)
   * rq_clock_start_loop_update() can be called after updating the clock
   * once and before iterating over the list to prevent multiple update.
+ * And use @rq_clock_flags to record the previous state of 
rq->clock_update_flags.
   * After the iterative traversal, we need to call 
rq_clock_stop_loop_update()
- * to clear RQCF_ACT_SKIP of rq->clock_update_flags.
+ * to restore rq->clock_update_flags through @rq_clock_flags.
   */
-static inline void rq_clock_start_loop_update(struct rq *rq)
+static inline void rq_clock_start_loop_update(struct rq *rq, unsigned 
int *rq_clock_flags)
  {
  	lockdep_assert_rq_held(rq);
-	SCHED_WARN_ON(rq->clock_update_flags & RQCF_ACT_SKIP);
+	assert_clock_updated(rq);
+	*rq_clock_flags = rq->clock_update_flags;
  	rq->clock_update_flags |= RQCF_ACT_SKIP;
  }

-static inline void rq_clock_stop_loop_update(struct rq *rq)
+static inline void rq_clock_stop_loop_update(struct rq *rq, unsigned 
int *rq_clock_flags)
  {
  	lockdep_assert_rq_held(rq);
-	rq->clock_update_flags &= ~RQCF_ACT_SKIP;
+	rq->clock_update_flags = *rq_clock_flags;
  }

  struct rq_flags {
--
2.20.1
