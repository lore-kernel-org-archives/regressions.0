Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483696;
	b=zimw9/hCjfQZDscDriMmelY4vbv6onu2mB4P4G2EfSJ2RERRauWyx5ADd+EXhydSjX6T
	 8xFTkAhuupSXhHhcDkEDPVCAzpIA7L0SJtngF2/J9Z0YbwcZPhuWkZXNz081MLolESVso
	 W4C/hILyMH1Mj96HUTd/eUUcoBH1txNNgR7tjaZv4C4zwx31a+m2R6o082WEsc0nWAGcd
	 DWiNQwPTs2d1T6rPqMyGWCNE1tp8p9qaXxZfinaEleE3lDOjvNZGS1qsrLsNpK3bDVQvQ
	 5E9LeKwSv5b/ueA0knoAzgdym7IGfRqegB+7DFwPyXDwh0nmUqYXha/RV5vWVnAYOHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483696;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=bmRh68Ilom1bhJ7ML/nGa6lB3Zj+T3YtBf/Ie36Y2BQ=;
	b=eRtzlGsy7lB5AUc2Cm+Le5Ok+HE7MEVlTF/+ZEVBbC7rtpAlorMM0J8RSeJuWtky0o3x
	 jtc60CgP4oHuidKDDks+lW6oEkNnT9+nCcv5GFRvkoEf4ARZXPZl4//XLoZjKAO36BDIO
	 ldy8mTArU3mE6PDzY6GzXX6ZOgyrJemTcNMzyOGHEZqPSc0l4gGcsnyNdinwjkvJckezo
	 o2I33Mjjh7msgeuu8TO4oQI0v2QnjjtkAOdyaNS6Y4WcScbgN0ovXAyMNJf1sdEmNk7al
	 qxpPSvnGzFxks/k2tIWnC/W8QOxzbZ3DoCUg1MPPyvQID13fB9EegTZ+KWta2ybdozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St6Z2vCU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69539606A31A;
	Sat, 31 Oct 2026 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St6Z2vCU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596911F000C1;
	Sat, 31 Oct 2026 21:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793483696;
	bh=bmRh68Ilom1bhJ7ML/nGa6lB3Zj+T3YtBf/Ie36Y2BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=St6Z2vCUxLm/dYlm9H72MjE3acwGXK0prfIezEMckyDeqIqxZRWI1yFVf5U8J03Gq
	 OCSGZGjAj6WVUcewH/sye0l18+8h4cRC8U4m3Ydrv446SBUO3Ed2VJ5aOcWY0p7hWS
	 NPqO69gJ6cHFQPYBuUcfSajDiWFHpcT1i/k34j9cAPvmoM+Mbd1OaEYVngfvWT/yag
	 G4/tS1GREC4PqVtq+gCqrjtii+Vj4juI0/bRQ4eFuHz4GkrUje924vZ5p4w7xshA8t
	 mjRxswtCvjf4afcfkni6o1/7JFGOZ/MGc1s5OY77ovQYu+HGMKMJAxM8oLld87tynS
	 k8OXP7sTR7qww==
Date: Sat, 31 Oct 2026 22:54:52 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
Message-ID: <auZjrNbfXPv_L6J7@pavilion.home>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
 <at-C_3rGi55L1v2X@localhost.localdomain>
 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
 <auDaMdhD2zGBLhDE@localhost.localdomain>
 <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
 <auIDNl9EUX4CzWzr@localhost.localdomain>
 <68f0450d47577dc4f83d32e5b0211c97ee8d24bd.camel@itx.no>
 <auXzIbzU9aWBD_fM@pavilion.home>
 <a4ba7e5be50ed4de4cad3d3e53355eb533587694.camel@itx.no>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ba7e5be50ed4de4cad3d3e53355eb533587694.camel@itx.no>

Le Sat, Oct 31, 2026 at 03:11:46PM +0100, Stian Halseth a écrit :
> Hi Frederic,
> 
> 
> On Sat, 2026-10-31 at 14:54 +0100, Frederic Weisbecker wrote:
> > > 
> > > Here is where it goes wrong. One tick has passed in real time, but not
> > > in ktime. The switch happened d after the last tick, jiffies never
> > > counted that d, and the tsc only counts from the switch on, so here
> > > ktime_get() == jiffies + TICK_NSEC - d.
> > 
> > So that assume that during the clocksource switch, the new clock synchronize
> > with the old one so that ktime_get() from the new clock should start from
> > the last value of the old clock. I'm having troubles to verify if
> > tk_setup_internals() does exactly that. 
> 
> Not that one, the timekeeping_forward_now() just before it. It folds
> the old clock into xtime_nsec, and tk_setup_internals() keeps that and
> only resets cycle_last from the new clock. On jiffies that value is the
> last tick.

Ah yes! You got it!

> 
> > 
> > [    1.549194] old= 1352575566
> > [    1.549930] new= 1352578748
> > [    1.550636] clocksource: Switched to clocksource tsc-early
> > 
> > That's 3 us, it could be the simple difference between the 2 printk.
> 
> Look at the timestamps: 736 us passed between the two printks, but
> ktime moved 3 us. The 3 us is tsc-early, from the read in
> tk_setup_internals() to your second ktime_get(). The time from the
> last tick to the first printk, plus the 733 us from there to
> tk_setup_internals(), is never counted. That is the d. If you print
> ktime_get() in tick_periodic() as well, old= will match the previous
> tick exactly.

Makes sense.

> 
> > 
> > But the switch from tsc-early to tsc is much more:
> > 
> > [    2.639818] old= 2445754540
> > [    2.640172] new= 2446107950
> > [    2.640927] clocksource: Switched to clocksource tsc
> > 
> > That's 353 us.
> 
> Here the printks are 354 us apart and ktime moved 353 us. Both clocks
> run, so nothing is lost: tsc-early counts up to the switch and tsc
> continues from there.

Now that's clear!

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
