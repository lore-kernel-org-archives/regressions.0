Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEE47535E;
	Wed, 14 Oct 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980272; cv=none; b=tT2BTNINfQgnT2EApsP3kYuIfZJ6g6vVPIO5UaXCT6vtgKgzhS0QjudeURO2SPXmtP5lK1S8p2BBzC+TF4bPo7JkgsyJ2EzN6fkk9ZoVGdG97gSX95pCBPhwziYGrY70VQ4JBlk8e4xvmZGHvwdtzT37gyXnhFxHsVVrd3r23Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980272; c=relaxed/simple;
	bh=T5Hkm/YfoDO+dt6SbmWey/1JV9LB5wEM6WRtVkUSZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4CU6F4SnpbvyuM152Z2TfzCIvt2wH4vAyt2pvYaoBjpsHgU7aqcnKwgKpdz1YcGn+MZHIXLdEr6+YljoofaSIuIpqoNP8SEY5awqxF2A9Js7MfKAqM8oPsHUc5Mx15j5MsBXrBa4N7lSzSpwi8X4nXQiIDxXL7UcT0m4n8iQkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1Vr36a2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1Vr36a2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B8A1F000FF;
	Wed, 14 Oct 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980269;
	bh=GS6ckad+7RfurmBBM899KY6kDFBy5nKpxV7tqbtyUHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1Vr36a2+hJElQ4VSbrcuuuEmqBNukF5/zvDyamvnJL9clkBXrqOoZr7GWSbWvpty
	 ulkzto8fvLxgXK+EaiGub/WP+9WdSdWwWHD0IYVwDnAfr7SjAhPNwr3Ja4tIlkmZjb
	 poXk60hthRd+vO7toncThWVTRH5gjgDv0hLy+m+d5UlJAu9EJC2htieyeErV9Acdky
	 OBwp5pnTDHUTPkB30J8x8I9VPV8w/tmy3UmnDzbjIrTCbZcE+pPf0nbl5XkVUTWw4j
	 AQ9a8+tEVyrP1IWxPhE30djLIECvP4VfIuQdJRxtp8vS/dU63N0CJ3YntCqEKAQL68
	 8bu9sZobW581A==
Date: Wed, 14 Oct 2026 14:17:46 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/cputime: Don't account idle time twice after
 dyntick-idle
Message-ID: <as9y6gQSpDPq3z9A@localhost.localdomain>
References: <20261007142950.547604-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007142950.547604-1-stian@itx.no>

Le Wed, Oct 07, 2026 at 04:29:50PM +0200, Stian Halseth a écrit :
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

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thank you very much!

-- 
Frederic Weisbecker
SUSE Labs
