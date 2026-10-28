Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196858;
	b=ECb7jdBnNMKen3rVocgZ5r7uDhUR7H/xOxpDCQWCiqRNmcm2yVY7jEsIhfmg/jILIN7z
	 Q1ItPNOt3XEQujb5lOEzWAliaLcuUZ1VmemtdFftbrtNHvVyE4Z1mitQu58+ti9X1eFnw
	 JenNJPNSGKXyXJ0QNpXUleDrqtNnKlAcloOO5zsCJ26/odsHxeJszz36Tn6WPn1xUXyv3
	 aJBhP3zE/KyURDKotIta/E0qSHGV7tOft2HKe/Lxbl0TseHmaDEVW0sQuC0G6Y/TDqp/+
	 lRUogGg6JJkGjCUzAb8BY2uSE0+0gmWHDxIOuoDX8n2f/9nYKtFGKUUyc1dBXWD0N/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196858;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=BqdCbO5Ut770wMKCPxk+JDzKFsU8wGiYFlxDAYWMQg0=;
	b=hrGAjdt72FLXaqODqaap+mu/ntrIPX9N9ZiKCAq7u0EdPBi1JrsM6OjsJVGjlqQ2jzkh
	 jANLaswHKv1oF/vRXnUKloMEXQvpmB0jR5bUMSKxZ9v3c4h4zH0yS5mBORqR+/d1s1PiX
	 wHcCHbBddrASKHZSuzXPHqJZ34O6EWafRKxjikcc2g3A7Cy8um9jVosSJUqroJyhAXIdW
	 eL8zv+/Xp5K/WgOCoVQYPwTann4qzGC/uAImRkRQ7+POizR9n8GgJEyb9JBNHdqW3wx3Y
	 QewYJibEfbgzq/6VlY/OfAThA+husXBs+eYIzv8YsIe407jEF5RQasoSsDYqzz9HrPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7WdcUEs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F882606A31C;
	Wed, 28 Oct 2026 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7WdcUEs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582721F01825;
	Wed, 28 Oct 2026 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793196857;
	bh=BqdCbO5Ut770wMKCPxk+JDzKFsU8wGiYFlxDAYWMQg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7WdcUEshtnGEY0jtT+5U3gtfFTzY5U4BrxTzKp6flf9vOhpmzfpZ09YZ7mEA7Esd
	 3v0poyhZfNUHrUkZ3K865/Mx4oyYq9S+nOv7rUG7Fbf0zPJttCsdZSUhGMackv6t9Q
	 FVjyx4pm/+cDgtkQV7NSlDJQb9Gf1bxAJS5wi2kZzUftC7Pj9KvAtHLIlaViUk15cg
	 qUYeKqcJnMj8iAh0DJiqJjYhmfZiCSwPBfp/jW8fjRdX/NkqPTtsu8CuRzkYREjIss
	 ssBc9zFRTSLfZ+DWPXhi6JWsneLSUwKBiKLin7LagI06R8hHbQj3PM/is76KBUiHXB
	 tvaQDMzTqi6og==
Date: Wed, 28 Oct 2026 15:14:14 +0100
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
Message-ID: <auIDNl9EUX4CzWzr@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
 <at-C_3rGi55L1v2X@localhost.localdomain>
 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
 <auDaMdhD2zGBLhDE@localhost.localdomain>
 <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
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
In-Reply-To: <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>

Le Tue, Oct 27, 2026 at 08:05:49PM +0100, Stian Halseth a écrit :
> Hi Frederic,
> 
> On Tue, 2026-10-27 at 18:06 +0100, Frederic Weisbecker wrote:
> 
> > Ok let me try to picture this:
> > 
> > Initially, jiffies or tsc-early, not sure, is the clocksource:
> > 
> > - tick_setup_device() sets tick_next_period to ktime_get()
> > - tick_periodic() adds TICK_NSEC to tick_next_period right before updating 
> > jiffies. So as you said tick_next_period == ktime_get()
> > - Note last_tick is not involved in that mode
> > 
> > Then later on boot comes a oneshot device:
> 
> The clocksource is initially jiffies, and I believe there is a step missing
> before the oneshot switch: the clocksource switch, while the tick is still
> periodic.
> 
> Please let me know where I lose you

If I knew where I was, I wouldn't be lost. But don't worry I was already
"there" way before you arrived :-)

> or if/when you disagree with
> my analysis. Not sure if you're more confused about my attempt of an
> explanation, or by what's really happening ;)
> 
> Here we go... 
> 
> The oneshot switch can only happen inside a tick, so at the earliest
> in the first tick after the clocksource switch. In the guest it came 
> 0.7s later since tsc-early waits for the watchdog in the guest.
> 
> So...for a while tick_periodic() runs on tsc-early. ktime now moves
> between ticks too, but the next tick still adds a full TICK_NSEC, so
> tick_next_period gets ahead of ktime_get() by the part of the period
> that had passed at the switch. Still here? :)

So let me depict that:

// clocksource = jiffies ?
// clockevent = lapic ?
tick_setup_device()
   tick_next_period = ktime_get() // jiffies_to_nsecs(jiffies)

tick_periodic()
   tick_next_period += TICK_NSECS
   jiffies++ // ktime_get() == tick_next_period

// jiffies > tsc_early
clocksource_select()

tick_periodic()
   //one tick has passed, so ktime_get() == jiffies + 1
   tick_next_period += TICK_NSECS
   jiffies++ // ktime_get() == tick_next_period == jiffies

No?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
