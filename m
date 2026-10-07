Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340948F026;
	Wed,  7 Oct 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373131; cv=none; b=Hv10xwM8toeP1YoxJAQxp/UPKTG9e0JH7jTaId4IqOYksmkw1F5f7LURKU5e+YBAIJv6mbbc1tBEmCn+yVkBqHztocy2Y3HhGovZDcMfE5OzWsphmTZO1Im9nKX8vl1FOuB3G+6ERAiSyUkncc50c5amA3cEcnvZSx8aSudFXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373131; c=relaxed/simple;
	bh=kMv38oKrSaZISHsXYT59RwNnazGK8B9aVUUcQ6OMGMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekq44PZ0Add8JvEpLr3vx+f+kvnQFFQn8q6sJXjGUeL/M5zR+jyD1hGLDe3/1tWyhHwb0yFS1unaJJWNl0PZTDUPwiTZFxF/3qmCrP/qvQlnwIQl5jMwJ1ni3TyWHP//T7L5Hm0aFO6Tcga/iE9LYt7ZhZRTrWuLwjZIW5Ou4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbnIABJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbnIABJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76A01F0089F;
	Wed,  7 Oct 2026 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373100;
	bh=YHMH+keh5NxbxbkzO6Wkar3DFeK8/2kdXEFzdfkNl7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbnIABJ4pIB1VpM1zub2Z5WRvnkL+2HK58CqmNzdKXZg29ZW88/UdxUhxTboAujj7
	 vs7i01FwduYQXN3wTxEJWeRiKzsEx1pT3CiqA/tNArrC6do7rhFEkF6CqzJyhsJFHX
	 v8Txz5wS8f/6yZXkCi8DJffCJp1U/NvgRp1Uvvlm7R5gFrrzDpibhHiD33mbbHmCla
	 sXhaMk3gWlfbXuzwWC6/8PlwQ6mlv7Q80p3WT4l0cDtsc7/I2PZxbQzVbtFSax84kz
	 KZBvx4l0kEzJfQei/GAx7aobiqhl9AnhVaeyuri4f97LqvEvIiwyS+iLqsIu6TUWxM
	 ltXP9ruaTqHdw==
Date: Wed, 7 Oct 2026 13:38:17 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cputime: Don't account idle time twice after
 dyntick-idle
Message-ID: <asYvKTW5qrxi3Wlp@localhost.localdomain>
References: <20261005194010.168299-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005194010.168299-1-stian@itx.no>

Le Mon, Oct 05, 2026 at 09:40:10PM +0200, Stian Halseth a écrit :
> On idle exit the dyntick-idle accounting accounts the time up to now,
> then the tick is restarted on its old period. The first tick accounts a
> whole TICK_NSEC to whatever runs, although the part of that period
> before the idle exit has just been accounted as idle time, or with
> IRQ_TIME_ACCOUNTING as IRQ time. That is up to a full tick per idle
> exit, and /proc/stat reports more idle time than wall time.
> 
> Record how much of the current tick period dyntick-idle has accounted,
> and leave it out of the tick that ends the period.
> 
> Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
> Link: https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
> Signed-off-by: Stian Halseth <stian@itx.no>

Looks good, just a few nits:

> @@ -468,18 +468,34 @@ static void kcpustat_idle_start(struct kernel_cpustat *kc, u64 now)
>  	write_seqcount_end(&kc->idle_sleeptime_seq);
>  }
>  
> -void kcpustat_dyntick_stop(u64 now)
> +void kcpustat_dyntick_stop(u64 now, u64 tick_start)
>  {
>  	struct kernel_cpustat *kc = kcpustat_this_cpu;
>  
>  	if (!vtime_generic_enabled_this_cpu()) {
>  		WARN_ON_ONCE(!kc->idle_dyntick);
> +		if (kc->idle_tick_period != tick_start) {
> +			kc->idle_tick_period = tick_start;
> +			kc->idle_tick_overlap = 0;
> +		}
> +		tick_start = max(tick_start, kc->idle_dyntick_entry);
> +		if (now > tick_start)

We probably should warn if now < tick_start.

> +			kc->idle_tick_overlap += now - tick_start;
>  		kcpustat_idle_stop(kc, now);
>  		kc->idle_dyntick = false;
>  		vtime_dyntick_stop();
>  	}
>  }
>  
> +/*
> + * The first tick after dyntick-idle covers a period that the dyntick-idle
> + * accounting may already have accounted in part.
> + */
> +static inline u64 kcpustat_tick_overlap(void)
> +{
> +	return __this_cpu_xchg(kernel_cpustat.idle_tick_overlap, 0);

We don't need that to be an atomic xchg. It can be a plain swap.

> +}
> +
>  void kcpustat_dyntick_start(u64 now)
>  {
>  	struct kernel_cpustat *kc = kcpustat_this_cpu;
> @@ -487,6 +503,7 @@ void kcpustat_dyntick_start(u64 now)
>  	if (!vtime_generic_enabled_this_cpu()) {
>  		vtime_dyntick_start();
>  		kc->idle_dyntick = true;
> +		kc->idle_dyntick_entry = now;
>  		kcpustat_idle_start(kc, now);
>  	}
>  }
> @@ -555,6 +572,11 @@ u64 kcpustat_field_iowait(int cpu)
>  }
>  EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
>  #else
> +static inline u64 kcpustat_tick_overlap(void)
> +{
> +	return 0;
> +}
> +
>  static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
>  				  bool compute_delta, ktime_t now)
>  {
> @@ -695,12 +717,13 @@ void account_process_tick(struct task_struct *p, int user_tick)
>  	if (kcpustat_idle_dyntick())
>  		return;
>  
> +	cputime = TICK_NSEC - kcpustat_tick_overlap();
> +
>  	if (irqtime_enabled()) {
> -		irqtime_account_process_tick(p, user_tick, 1);
> +		irqtime_account_process_tick(p, user_tick, cputime);
>  		return;
>  	}
>  
> -	cputime = TICK_NSEC;
>  	steal = steal_account_process_time(ULONG_MAX);
>  
>  	if (steal >= cputime)
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 6c3fea3867139..1c5cefbb10812 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -763,13 +763,20 @@ static ktime_t tick_forward_now(ktime_t expires, ktime_t now)
>  	return expires + TICK_NSEC;
>  }
>  
> -static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
> +static ktime_t tick_nohz_restart_expires(struct tick_sched *ts, ktime_t now)
>  {
>  	ktime_t expires = ts->last_tick;
>  
>  	if (now >= expires)
>  		expires = tick_forward_now(expires, now);
>  
> +	return expires;

This should always update ts->last_tick so that we don't need to do
the division twice on dyntick stop.

> +}
> +
> +static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
> +{
> +	ktime_t expires = tick_nohz_restart_expires(ts, now);
> +
>  	if (tick_sched_flag_test(ts, TS_FLAG_HIGHRES)) {
>  		hrtimer_start(&ts->sched_timer,	expires, HRTIMER_MODE_ABS_PINNED_HARD);
>  	} else {
> @@ -1329,6 +1336,16 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
>  	return ts->idle_calls;
>  }
>  
> +static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
> +{
> +	ktime_t tick_start = now;
> +
> +	if (!tick_nohz_full_cpu(smp_processor_id()))

Just don't check tick_nohz_full_cpu(), it will fall into the
vtime_generic_enabled_this_cpu() anyway.

Thanks!


> +		tick_start = tick_nohz_restart_expires(ts, now) - TICK_NSEC;
> +
> +	kcpustat_dyntick_stop(now, tick_start);
> +}


-- 
Frederic Weisbecker
SUSE Labs
