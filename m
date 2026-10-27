Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120820;
	b=uQHlj8bekzqE+8g66CY+t+MP/Lm/Famv7jVUH9LtAQBD1ioIBge6nETlIqxFNLelhNHY
	 xVq4ShvR9DKOp+0RKAnQErv9Ky1+dAezJr+kKXNS4qj+gY3kHrCMZZi9vJHe9wuvW5lv8
	 cRA/rwnKRso4tuiamEOwhz6pVzOpQ+hiOId2JJoyFnaAiLqg1nB6o4f+/ADDWCa1Po4Ot
	 ReoMYeXrnSbivOyd+Z1mrsHHgXjWY6WqGOtsHwXxmGP+goBaRD8loWhOdKLroFvytdZ8l
	 W1uyxam3A0+NHzCyQnX1DOmWdjyH1ft/Vx3Q9Brxcxvk6cgk/Dv7fo9d2gJIeFWIBeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=qz+F66rSX774OMfGyH0AnvMDREHIfP+YFA6k4xGLXvo=;
	b=SyYYEr1VFEofyXe/a7TFkxMI8iUOg8KdGxdAGWfg9oLuR1Lmmgwkvw4xPmMN7dpmHxna
	 1qxhRBItAzD072qhi59YFOM1IkjdR1JQRDaT27s30UslBpn0yAOc5VaZsCrEkv7lSdcnI
	 +ou8rEabEW+nd9TAMFCw675d1uqSqiyMSN8uoXeto7kA9U+PBWI6mCrAYEQNqaA4BiCDM
	 SFVIAohd5q3X+uW67Dv45OB/X9yMIxqTcReOEmj4zddQ8DFyJ1XOSPZg9MS5RXGc+PmbS
	 1bofUH2nsA426X7IBDCpnLpAf9VzWuWgnDUpc+PA16Jk7qTY34g0Uz8SFNPf95kFZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpC3byZA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87244606A31A;
	Tue, 27 Oct 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpC3byZA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC171F01825;
	Tue, 27 Oct 2026 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793120820;
	bh=qz+F66rSX774OMfGyH0AnvMDREHIfP+YFA6k4xGLXvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpC3byZAtvlGpYRXSXRyHxG01Qq1iZeMikIG5S7aRtixJQnxNdauV/efJi1gVGJhB
	 wBeFbBT/viBcaQv2sHIckw6BB/MN7vk7kA11nWjLGmK+CeS85PvbIbvsIIpzHBdKBI
	 rcG0Toa4pjT2NssAJGvSH8s8SFvBIIaA9K1jAlHa29Wgrcj2NKTFLaTtLZw0726Irc
	 4O10HZvJh4oCIPvgRSh5gAOl0PjqWSEwPbv9AaET7rik5Vq/bIIpvW7+PLnixs0X+9
	 AE2CG7kEFAkXIcBOL0XovK2BvmmY2G5lgRL5TDkHeKI0a60Esf/SIUQx8i2k6rwJ3K
	 FgMkDleBkxVKg==
Date: Tue, 27 Oct 2026 18:06:57 +0100
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
Message-ID: <auDaMdhD2zGBLhDE@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
 <at-C_3rGi55L1v2X@localhost.localdomain>
 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
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
In-Reply-To: <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>

Le Mon, Oct 26, 2026 at 06:28:44PM +0100, Stian Halseth a écrit :
> Hi Frederic,
> 
> 
> On Mon, 2026-10-26 at 17:42 +0100, Frederic Weisbecker wrote:
> > 
> > I'm a bit confused by the scenario that happens here. Do you mean
> > that after switching from a clocksource to another, ktime_get() goes
> > backward?
> 
> No, not going backward, my description was vague, sorry.
> It's tick_next_period that runs ahead, not ktime going back.
> 
> Also, please challenge my assumptions, as I might be analyzing this
> wrong. This codebase is still pretty new to me, and I might
> misinterpret some things.
> 
> But from how I see it, on jiffies, ktime only moves at the tick. So
> seen from the tick's point of view, tick_next_period == ktime_get(). 
> 
> After the switch ktime keeps moving between ticks, but the next tick
> still adds a full TICK_NSEC, so tick_next_period ends up ahead of now
> by the part of the period that jiffies never counted. 
> In a KVM guest at HZ=250 that was 2.3 ms.
> 
> Do you follow my reasoning?


Ok let me try to picture this:

Initially, jiffies or tsc-early, not sure, is the clocksource:

- tick_setup_device() sets tick_next_period to ktime_get()
- tick_periodic() adds TICK_NSEC to tick_next_period right before updating
  jiffies. So as you said tick_next_period == ktime_get()
- Note last_tick is not involved in that mode

Then later on boot comes a oneshot device:

- tick_init_jiffy_update() adjusts tick_next_period to be aligned to TICK_NSEC
- tick_sched_do_timer() -> tick_do_update_jiffies64() sets tick_next_period to
  roughly ktime_get() + TICK_NSEC

> 
> > 
> > Also refine-jiffies is not a suitable clocksource for nohz, so
> > last_tick shouldn't be updated while refine-jiffies is the
> > clocksource.
> 
> Yes, right. last_tick gets its first value from the sched timer expiry,
> which is that tick_next_period rounded up to a tick multiple by
> tick_init_jiffy_update(). 

last_tick actually gets its first value when the tick is stopped for the
first time in tick_nohz_stop_tick() and is set to the next tick that won't
happen.

> 
> In the guest that made the first expiry 4.66 ms after now, so for the
> first 0.66 ms a tick stop leaves last_tick - TICK_NSEC in the future.
> Paul's registers show the same, now 235623102 with last_tick
> 240000000.
> 
> I can rewrite the commit message along these lines, or fix up
> tick_next_period at the switch instead if you prefer that.

I'm still confused by what is actually happening.

Thanks.

> 
> /Stian



-- 
Frederic Weisbecker
SUSE Labs
