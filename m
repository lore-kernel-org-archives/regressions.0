Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0033F7884;
	Mon,  5 Oct 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199985; cv=none; b=FujXBGMv4dmVZSVCFHssj//O9/UNdUmzKY2VxKkr99/Ky6csrykM6fUvzjgTSKPhPbvAYL+f4YtZKiyuGpLpavnPcQRlL/ODcebCLNisbHf8qJ3pzznq+my//P9U8EA5xMYvOYeIxAOQ/NJAN2Okp61eVrZX1bIXtpX+eUtmZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199985; c=relaxed/simple;
	bh=bJs9Ivdi/a9OpMRTDWNtToSzjGfDOfpdsb3rZ2bVdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLI7AfiW4C0QfO4EjE+k4qUBUTS22QJGoArbZQtqMweCX29P+EWAg5dB7S31FVYvdJiZKo3fdIwWzM4BFsLgPAuoSFLrPZdE5fOCljuwwRX+PMM4GcWXGAZgCL8yDf03UTM/mwYL8mJeMNmSC74fk5S4cJoMz4LXOyIQQ8eaT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeZrrP1s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeZrrP1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16CA1F000FF;
	Mon,  5 Oct 2026 11:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791199983;
	bh=q9kbYSKByzd4pmTpQNkclUGDcvB9gcJWpPb9oLSkHVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeZrrP1sxDGVHoPYodkoOktkgoBxHhPkeQFYzANXxQeP3UyKp2q0mBRPeLJ4Y83zH
	 fBByd8Kj8HU7YsYVGKM0o8FLLzJiUyQMNzh5XAtvU3FW6cllmWqsbfzfr0seU9sQSk
	 Ocb2rwqan3CEt89NuW+wTltWiaMDr5JvlgYoEmY9WbpbxacmlGvmAYxr1PT+B7IAq5
	 7ImWB6Crtm5CmqKAR4dsvzA8G86gI2TRAuwPm5MWJQtb0vdKv9MwdZ7g2gLcaquUNB
	 FG7VqYmuDCRr+ih929Bw+rpvTLV/6CQYse60BKrdy5syvMHCDZxjvhif4jS4Vn6CVJ
	 A0G23gqgz8i3A==
Date: Mon, 5 Oct 2026 13:33:00 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Don't account idle time twice after
 dyntick-idle
Message-ID: <asOK7M4Re5aYqmsl@localhost.localdomain>
References: <20261004142724.3896396-1-stian@itx.no>
 <20261004184701.4112237-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261004184701.4112237-1-stian@itx.no>

Le Sun, Oct 04, 2026 at 08:47:01PM +0200, Stian Halseth a écrit :
> On idle exit the dyntick-idle accounting accounts the time up to now,
> then the tick is restarted on its old period. The first tick accounts a
> whole TICK_NSEC to whatever runs, although the part of that period
> before the idle exit has just been accounted as idle time, or with
> IRQ_TIME_ACCOUNTING as IRQ time. That is up to a full tick per idle
> exit, and /proc/stat reports more idle time than wall time.
> 
> Record how much of the tick period had passed since the tick was
> stopped, and leave it out of the first tick.
> 
> Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
> Link: https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
> Signed-off-by: Stian Halseth <stian@itx.no>

That makes sense. Some comments below:

> ---
> Tested by comparing /proc/stat with CLOCK_MONOTONIC per CPU over 30 to
> 60 s, with a task on one CPU that sleeps in a loop. Total CPU time per
> wall second on that CPU:
> 
>                                          before   after
>   SPARC T7-1, HZ=100, busiest CPU*       1.44     1.0000
>   SPARC T7-1, HZ=100, 3.7 ms sleeps               1.0001
>   SPARC T7-1, HZ=100, 25 ms sleeps                0.9996
>   Opteron, HZ=1000, 3.7 ms sleeps        1.131    0.999
>   x86_64 KVM guest, HZ=250, 3.7 ms       1.53     0.998
>   same guest, 9 ms sleeps                1.195    0.982
> 
>   * under its normal load, about 95 tick stops/s
> 
> The guest was tested with and without IRQ_TIME_ACCOUNTING, with
> highres=off, with steal time from a busy loop on the host CPU, and with
> a test-only change that forces tick_nohz_idle_restart_tick() on every
> idle loop iteration with the tick stopped.
> 
> The -1.8% left with long sleeps in the guest is time between an idle
> tick's expiry and its delivery to the halted vCPU, which nothing
> accounts. The summed lateness of those ticks matches it within 2 ms/s,
> or within 8 ms/s with steal time, also with highres=off. It is there
> without this patch as well, where the double counting hides it. On the
> T7-1 it is within noise.
> 
> With 3.7 ms sleeps and steal time, +0.3% to +1.3% is left, which I
> have not explained.

Perhaps because sometimes idle is reentered shortly after exiting and
kcpustart_dyntick_start() overwrites the previous overlap. Say we have:

TICK_NSEC=100
next_tick=X

tick stop()
entry = X-90
tick_restart()
exit = entry + 10 (which is X-80)
overlap = 10

schedule()
// tick still hasn't fired

tick_stop()
entry = X-10
tick_restart()
exit = entry + 5 (which is X-5)
overlap = 5

tick()
   tick accounts TICK_NSEC - 5 but it should also consider the previous
   overlap, so it should be TICK_NSEC - 15.

But beware as it only matters for tick X, not for the next-next one that will
fire at X + TICK_NSEC, in which case the previous overlap should be ignored.

But please double check what I'm saying while being sleep deprived :-)


> 
>  include/linux/kernel_stat.h |  6 ++++--
>  kernel/sched/cputime.c      | 31 +++++++++++++++++++++++++------
>  kernel/time/tick-sched.c    | 23 ++++++++++++++++++++---
>  3 files changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
> index 9ca6c2259dfea..950867deea29f 100644
> --- a/include/linux/kernel_stat.h
> +++ b/include/linux/kernel_stat.h
> @@ -40,6 +40,8 @@ struct kernel_cpustat {
>  	seqcount_t	idle_sleeptime_seq;
>  	u64		idle_entrytime;
>  	u64		idle_stealtime[2];
> +	u64		idle_dyntick_entry;
> +	u64		idle_tick_overlap;
>  #endif
>  	u64		cpustat[NR_STATS];
>  };
> @@ -111,7 +113,7 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
>  #ifdef CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE
>  
>  static inline void kcpustat_dyntick_start(u64 now) { }
> -static inline void kcpustat_dyntick_stop(u64 now) { }
> +static inline void kcpustat_dyntick_stop(u64 now, u64 tick_start) { }
>  static inline void kcpustat_irq_enter(u64 now) { }
>  static inline void kcpustat_irq_exit(u64 now) { }
>  static inline bool kcpustat_idle_dyntick(void) { return false; }
> @@ -132,7 +134,7 @@ static inline u64 kcpustat_field_iowait(int cpu)
>  #else /* !CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE */
>  
>  extern void kcpustat_dyntick_start(u64 now);
> -extern void kcpustat_dyntick_stop(u64 now);
> +extern void kcpustat_dyntick_stop(u64 now, u64 tick_start);
>  extern void kcpustat_irq_enter(u64 now);
>  extern void kcpustat_irq_exit(u64 now);
>  extern u64 kcpustat_field_idle(int cpu);
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 06bddaa738e52..9205e92680943 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -358,6 +358,19 @@ void thread_group_cputime(struct task_struct *tsk, struct task_cputime *times)
>  	}
>  }
>  
> +/*
> + * The first tick after dyntick-idle covers a period that the dyntick-idle
> + * accounting may already have accounted up to the idle exit.
> + */
> +static u64 tick_cputime(void)
> +{
> +#if defined(CONFIG_NO_HZ_COMMON) && !defined(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE)
> +	return TICK_NSEC - __this_cpu_xchg(kernel_cpustat.idle_tick_overlap, 0);
> +#else

Please use IS_ENABLED()

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
