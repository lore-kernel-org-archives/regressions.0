Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB353D891F;
	Tue,  6 Oct 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281476; cv=none; b=B2eyD90+wyODS6zLGdUTVylr2kUBkRkFjzAfgUs3EU8Q8kCuIzCIQYWW2IWfOQZv/Xvi1Ab8lD4L3aSJxPjCa7ecTeSX3HpG9uVHFtAcLar4dXcmbKKlGsS28LrNvaUckXhPmuXgdGINajAdQex7Ou8HaApXTS98BltUcZYD2KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281476; c=relaxed/simple;
	bh=B7XGyvRTkNcB0MQQMCK3c46Gz7azMTsYH8/wU+on+sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PS4oJuvbDpKZg2LHJrSrtRVfhPcK3eQpIL2isjNMlFxcQLxa6wENVoOtalH01UJaoXApMAC6bWnrITZx9E94+R5l+WF94eMlZ8nHzx2KFqtYKspUo2448/i1eKxXNwoseP1LFweeaW+L2SW8Yla8M5z8C6/wnPSMCW2cqqIxcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKEcanmB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKEcanmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A141F000FF;
	Tue,  6 Oct 2026 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281475;
	bh=5BhNgeoas0N8hx7hHpxllY+wWjO41dA2PctbScKkY4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZKEcanmBqihsHRek9n2Iv4Oto0hnk68gr9gXVk0g1JarX2zejFNvY5L8HI2P3H/qZ
	 G+igblKHC30qKRHbjbdj95B5gFJMIDnWefWR1gC87zAXS6j4or8xtKoxzCIFLvB1SE
	 gaWpFyX3GdmcQGoWoIJ6wVU0iD8CZcZKN0ETSHvMGoC8LKs5yIcNcUegnzyAl1njFd
	 FwlQjbYVjmVpnBy3WQ8GAzjgdkC/rKb58+82cEQFapuB9ifK+5cQPAP1KUp5aC4nnE
	 u5nhTBVQf5vkdt357jYI/8DkIDcbCa+GSPuehUA9f/+qWPD6XBsFRBcg9zm3bGfzHo
	 Fn8I1N6cYQhiQ==
Date: Tue, 6 Oct 2026 12:11:12 +0200
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
Message-ID: <asTJQHcGzJmB9u33@localhost.localdomain>
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
> ---
> v2:
> - Keep the overlap per tick period, so that a second dyntick-idle
>   period before the tick adds to it instead of replacing it (Frederic)
> - Read it through a helper in the NO_HZ_COMMON block, with a stub in
>   its #else, like kcpustat_field_dyntick(). IS_ENABLED() does not build,
>   as the field only exists with NO_HZ_COMMON. The helper is static
>   inline, as there is no user with VIRT_CPU_ACCOUNTING_NATIVE.
> 
> Frederic's case does not happen in my tests on its own. Since
> f4c31b07b136 ("sched: idle: Consolidate the handling of two special
> cases"), without a cpuidle driver or with a single state, the tick is
> only stopped after it woke up the idle loop, and that tick takes the
> overlap first. With a test-only change that stops the tick on every
> idle entry, as a governor may, the guest added to a pending overlap
> about 900 times a second under a pipe ping-pong between two CPUs.
> 
> So it is not what is left with steal time. That is the same with v2,
> +0.7% to +1.4%, and only shows when the task also spins for 1 ms after
> each wakeup.
> 
> Total CPU time per wall second on the loaded CPU, v2:
> 
>   SPARC T7-1, HZ=100, busiest CPU*       1.0001
>   SPARC T7-1, HZ=100, 3.7 ms sleeps      1.0000
>   SPARC T7-1, HZ=100, 25 ms sleeps       0.9998
>   SPARC T7-1, HZ=100, pipe ping-pong     1.0000
>   x86_64 KVM guest, HZ=250, 3.7 ms       0.997  (1.505 before)
>   same guest, pipe ping-pong             1.000  (1.152 before)
>   same guest, 9 ms sleeps                0.985
> 
>   * under its normal load, about 90 tick stops/s
> 
> The guest was tested as for v1, with and without IRQ_TIME_ACCOUNTING,
> with highres=off, with steal time and with the forced restart path. The
> -1.5% with 9 ms sleeps is the late tick delivery described in v1.

IIUC, there is still an excess of cputime accounted here sometimes, right?
And that never happened before the patchset that rewrote the cputime idle
accounting. Am I understanding correctly?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
