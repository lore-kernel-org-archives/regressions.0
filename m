Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793488296;
	b=tfFzczxsPO18uZCBDh/wph25FytrjaT1O4uP+tXyotRvQUCHkYDtcD73HZb5z9GDDouP
	 VhjlCVzpBcZIpNoO67B3stkvQl0G/gGaLA8Ixtt1RUGIACvSfuoM51KvozXiXQzYJ9nJS
	 vtZQWtkBPGpHhqkUushxxP5gVr9TgkXjgUzNq6Q61REdySX70mw1I4Vy1VU5aywWK4g6F
	 1Zf0YAd57lXqDAVrxUaDrOBvjgmSk3Eyy1/ZEndHadQ10/nC9mk6lLcJc8KTdb4GCv9Ty
	 UsrWwNdInfd9UDNcFNvrzYYdpuouexzwsQldfwJJeoJYu3TZdgbSX+N1ySViFfbTkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793488296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+vwqR7R/Qd/4UimjGgOC1d+3YkZbyyskbTsDZYcztrg=;
	b=2GtWVr+4pjaQFp/dMXoeHgA726aY7Cz156l9WDafYI18VObCtlpyv8B/v/LZd6WCW3R+
	 5F9S2NPAT5EyINPIIWcQIniKxuNHqLrOEKKifeg+sCnMJHQUdsvDZ16bbSaXrTBW1vmMD
	 7UfDWE701eGfR0VFOSm6pD8GYUtrHb7PjHThPlkC+oR98WtcQpD8uVmyYYU57CgGg98b7
	 Qld+z2TC0TFFTwD0gxZOm1UPVHjbJwyTxXxfA/l0uaicWJ6dP4ET6FSs4eOFHxrGVum5r
	 a4zaBU8xpNs1DmtmAA+FSK8XVnzOuxNVmpUETATUv+qTXgNfN+DdFdbnXnU4lvekl2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NUHMz/Gd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23106606A31A;
	Sat, 31 Oct 2026 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUHMz/Gd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4274C1F000C1;
	Sat, 31 Oct 2026 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793488296;
	bh=+vwqR7R/Qd/4UimjGgOC1d+3YkZbyyskbTsDZYcztrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NUHMz/GdDJ0UNgPLgnRsX1pe9eJ9Ka2wWeECNxQ/6mW3AR0BOHODpxtmIpzMPGdzq
	 EDmYonr3JWfuM/gtvyxJTNfyIB1jABGqZMxw1Aye9mqmhK03O5PEFy+CN2y+6TiRDx
	 BZ/hYNaO6i2NWpeHAzUjZLG2J4pj7CHIiFi8d7YEUGjfuUrBt2hhY4Nx0bG9EpSIdF
	 HJ7Tq7HogXGtl688iZCnmE0UkJnr9O791T9YVK707olTPyF7am30nY53W0iwRDyZRN
	 DOo3ZyvLCSKePKPDt5zHjnlXpP4mA50tE4HO/iRe3R1TX/AabJmC562xHRESXiFRdE
	 smQDFlpltoB9w==
Date: Sun, 1 Nov 2026 00:11:32 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Breno Leitao <leitao@debian.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cputime: Don't warn when the tick period starts
 after idle exit
Message-ID: <auZ1pISMUGbXSlbp@pavilion.home>
References: <20261031081408.3378884-1-stian@itx.no>
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
In-Reply-To: <20261031081408.3378884-1-stian@itx.no>

Le Sat, Oct 31, 2026 at 09:14:07AM +0100, Stian Halseth a écrit :
> kcpustat_dyntick_stop() warns if idle ends before the tick period
> that the next tick will account has started. That happens on x86 in
> a CPU's first idle period with the tick stopped, right after the
> switch from the jiffies clocksource to tsc-early.
> 
> On the jiffies clocksource ktime only moves at the tick. When the
> clocksource switches some time d after a tick, that d is lost: ktime
> continues from the value of the last tick. The next tick comes
> TICK_NSEC after the last one, but ktime has only moved TICK_NSEC - d,
> while tick_periodic() still adds a full TICK_NSEC to tick_next_period,
> which is now d ahead of ktime. When NOHZ starts,
> tick_init_jiffy_update() rounds it up to a multiple of TICK_NSEC and
> the sched timer is armed there, up to nearly two ticks after now. A
> tick stop saves that as ts->last_tick, and an idle exit before now
> reaches ts->last_tick - TICK_NSEC sees the tick period in the future.
> 
> Nothing is accounted twice then. The first tick covers a period that
> starts after the idle exit, and the code already handles it. Drop the
> warning.
> 
> Fixes: 96a494c9cfd8 ("sched/cputime: Don't account idle time twice after dyntick-idle")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/all/bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de/
> Reported-by: Breno Leitao <leitao@debian.org>
> Link: https://lore.kernel.org/all/auTCQauaU733PY5z@gmail.com/
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com/
> Signed-off-by: Stian Halseth <stian@itx.no>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks!

-- 
Frederic Weisbecker
SUSE Labs
