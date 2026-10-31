Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793484340;
	b=jJSrR3TJyCXq/opEijXIyRHKo8S4vuaDUGxfGg0GDwaLRC32+360TcbklTqoIbHD1phq
	 s8S9S+eGmXRyBFcw+01DNRI1OTloLheujddgG21ygC+jawaixNtFkn5kPjQquxlfh7CUe
	 PYAb+VhIXIzOoXDa+00Mw4PztK0QNvyQhRy7Jp0PL16+EEkKxb6WUWN/hSukTwQiV011A
	 0t6V1VtlwAnvfBlxej69nyh0vfSF3Lr3Sy+iq0Obst40I95Hcbn5NjuLZ36BAOtzwKWoR
	 Jsu3nadObfxQ5InB56O0YDI2PO+Hv3wOF4fb1jA8P4PQJVZKxPj8hS88kLNc6cFK4bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793484340;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kUYxDlUcQBIJfE+eurUEaEcJ7kCZ/UJLn+2IozuGLFs=;
	b=Wd2//9peQ85QrueU+1W8Ai1fV2pigiF4onP1/QvBQP56NtZr5j1U4VcSDvqgPwLrJV37
	 wzntpspLnABRc5luaPY0QUscLNtiZChK/FAOhjI1W6RSQGpko4EmYyWiy2DwRSmDyG6f0
	 Sa+xqAnzgjucb8SVolew5piOsvj0rf1XCzIPLyY9OHlGFLrc8bFWwnFnptO/lJAYyDMZm
	 qVkwlY4iQE5WeGTdGC/lzLcZzU6kWv83g0BPivTqCsgiZyWQY7Puw5Q1hniqyyK1l1qIY
	 cFzNyCt9SWtPH5jZa0Rw4Vpz9Eq3xDZXI55/feSa4dMapteC+11OrXhbIOyDoYviddQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EtFl/87r";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7F606A31A;
	Sat, 31 Oct 2026 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtFl/87r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348F11F000C1;
	Sat, 31 Oct 2026 22:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793484339;
	bh=kUYxDlUcQBIJfE+eurUEaEcJ7kCZ/UJLn+2IozuGLFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EtFl/87rshWAQKJVvvE/29SDe2vv6qO6YCAMz8uIetzIXcaG+8fJW7K1e9/xy2aAS
	 GhFdSC9n07MoyQ8UvZGt3PiyZHrDZZRQ5g3cliabBQ8YGMxJqy2bYXFmprzf3xwGFL
	 pByV/h6DI7y9nJvO+3zNL2p/BScpNPj36wYjBL7nSVThZsdmgSvCf3YJsjD9tdljFh
	 G6147gP0qmbRJMrrj2ToHNHk5LI6sYbELWlk70NzXUYoXapa0fuN2BWN0CZkSHeu/D
	 d50/0O014YmKRh+aG83HqbvQ3gebVZnNXMLGO/sFOw8NqBEu+Iuad0pRBac9M05YHe
	 1ACSjmjpj2/ag==
Date: Sat, 31 Oct 2026 23:05:36 +0100
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
Message-ID: <auZmMBmheFxH5Dlz@pavilion.home>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
 <at-C_3rGi55L1v2X@localhost.localdomain>
 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
 <auDaMdhD2zGBLhDE@localhost.localdomain>
 <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
 <auIDNl9EUX4CzWzr@localhost.localdomain>
 <68f0450d47577dc4f83d32e5b0211c97ee8d24bd.camel@itx.no>
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
In-Reply-To: <68f0450d47577dc4f83d32e5b0211c97ee8d24bd.camel@itx.no>

Le Wed, Oct 28, 2026 at 06:37:22PM +0100, Stian Halseth a écrit :
> Hi Frederic,
> 
> On Wed, 2026-10-28 at 15:14 +0100, Frederic Weisbecker wrote:
> > 
> > So let me depict that:
> > 
> > // clocksource = jiffies ?
> > // clockevent = lapic ?
> > tick_setup_device()
> >    tick_next_period = ktime_get() // jiffies_to_nsecs(jiffies)
> > 
> > tick_periodic()
> >    tick_next_period += TICK_NSECS
> >    jiffies++ // ktime_get() == tick_next_period
> > 
> > // jiffies > tsc_early
> > clocksource_select()
> > 
> > tick_periodic()
> >    //one tick has passed, so ktime_get() == jiffies + 1
> 
> Here is where it goes wrong. One tick has passed in real time, but not
> in ktime. The switch happened d after the last tick, jiffies never
> counted that d, and the tsc only counts from the switch on, so here
> ktime_get() == jiffies + TICK_NSEC - d.

Ok now that makes sense.

> 
> >    tick_next_period += TICK_NSECS
> >    jiffies++ // ktime_get() == tick_next_period == jiffies
> 
> So after this, tick_next_period == ktime_get() + d.
> 
> The same thing as a diagram:
> 
> // jiffies -> tsc-early, d after the last tick
> clocksource_select()
>    ktime_get() == last tick          // the d is not in there
> 
> tick_periodic()                      // TICK_NSEC after the last tick
>    ktime_get() == last tick + TICK_NSEC - d
>    tick_next_period += TICK_NSEC     // == last tick + TICK_NSEC
>    // tick_next_period == ktime_get() + d
> 
> From a measurement I did with a QEMU guest: at the switch both were
> 329532326. At the next tick ktime_get() was 331212239, 1.68 ms later,
> so d was 2.32 ms, and tick_next_period became 333532326, 2.32 ms
> ahead.

I see now.

Thanks

-- 
Frederic Weisbecker
SUSE Labs
