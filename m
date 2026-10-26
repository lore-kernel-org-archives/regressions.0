Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032962;
	b=TtpdtvtR0KFBdfH035kQw/0SWYimT1rPsFr2fcCdEdGYmUbcDGQRzHuW71q+PVOywdZf
	 Ft4ZZZUjiCqwa/Y5tO250QjbOze35R9RxKvy0W0oK557FqZVSgPkMhLnvjWj6lRWFxjuL
	 WASa51tZtYDNoELl1aBaJFXE4Kau6a7u2qJkn62F+IvePmyDL3vqEfPk7YYOuP5frTJzg
	 3xV78twis8QEiI/rW9qonVef6TT/AousNK0oxbwsHrMLPXrpu4ZpZFRFxMAODsZu+XOnu
	 VCijGBcE1nR71m4WyPfpiYUxdUn4k6n2LVXIACmFdAs/JgKDlBHoH326ZUQIfcNEf+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032962;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6mbXt/Af0zoLEPy8v7Meri4cKDTZRsA9NiegSTOWj8g=;
	b=A6erRk25vP7h0M16uNkdKkf1B1K20Qg6rfZ7dF9fZYM3vfXaEgolO8A8gDyOd3jnY7Sw
	 L4M7TrpgtvGtvTiWawQavMabdNC4M1VlTfPlZ9sarU/5SMO3WLDtiLJbXRCLeH+JKgQ6y
	 QAcBP/R6h2fbZHa/VYMCzVcHgnaoZXYk/C2Mpiv2Jq1IuNMoaiKFpEhR6Xg9DeUvWwKHt
	 AU0esd6M13gpJBC5cYTy7Zdctu4ufl7eE16rCVBBIdkHmTtEVuz7LGiCmkWwvSJPmuI5G
	 +BdkUCXnlKcAP3+2Zt7iifJe6aLHxdLvYRLMndaDcU1FrnEiom4x0h2a4hPPf9fTO+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RuiU/N1D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84CC606A31A;
	Mon, 26 Oct 2026 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuiU/N1D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CA71F01825;
	Mon, 26 Oct 2026 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032962;
	bh=6mbXt/Af0zoLEPy8v7Meri4cKDTZRsA9NiegSTOWj8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RuiU/N1DOwMl477zmkdrSfMoPB38d0RUMO51YSSc1d5EHkWobQ8zBq8Vp0MFcwTba
	 mEIiQw383b58naYd5TzAiD+JyxARrdC7mK0WRXnJuJ2NTOcT/+sbSBk9vJ/17CdHgg
	 cDr7eUtZoJIHatUL2LHtB1OYwM+v8GQY0DIXWetcs1X795se5lMwDngp0O8Pf+NN1T
	 n3K01A39o7109M9T8se5Ao0q/vOiIyo6vkcY/W8US7Bp/ChLN8dofBdUM1SwYUifCO
	 Ud95vosTArsJ3cZ1cImhkOM6wbUY0XXxY/CQ0YfUZa4/7LBq6dJjj6bK88NHFG8lMT
	 /Y7B8QK8l62bg==
Date: Mon, 26 Oct 2026 17:42:39 +0100
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
Message-ID: <at-C_3rGi55L1v2X@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
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
In-Reply-To: <20261025100202.2584654-1-stian@itx.no>

Le Sun, Oct 25, 2026 at 11:02:02AM +0100, Stian Halseth a écrit :
> kcpustat_dyntick_stop() warns if idle ends before the current tick
> period has started. It fired once during boot on a Dell XPS 13, in
> CPU 0's first idle period, right after the switch from refined-jiffies
> to tsc-early.
> 
> That can happen. The clocksource switch continues ktime from the last
> jiffies update, so ktime falls behind the tick by up to a tick, and the
> sched timer that NOHZ arms next on tick_next_period can expire more
> than a tick after now. In a KVM guest it was 1.5 ticks ahead after a
> switch from jiffies to hpet. An idle period that stops the tick and
> exits before it fires then sees ts->last_tick - TICK_NSEC after now.

I'm a bit confused by the scenario that happens here. Do you mean that
after switching from a clocksource to another, ktime_get() goes backward?

Also refine-jiffies is not a suitable clocksource for nohz, so last_tick
shouldn't be updated while refine-jiffies is the clocksource.

What am I missing?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
