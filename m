Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454885;
	b=si9WmV/TOeqP6m4evmAWDglyhhJOPcA9DHGMSL0lDqWSWBa9a9d6Y2ts6WZzehdlWhMD
	 prvrijmnxBCA4xl3xYNkjkduF9pyY2xWqgXymZRGlk02uTomnoeNzFpPKum39xO5dN45O
	 a9vglEm+ZgD/hmQTTDHqgKyz/ebLdzNaHdc2xiAAXDeF+tobaFGF47MVhVsRzRZfhOA71
	 vYjf617r3PYdpchmcrIpq5yWeMoY4e45PNqdhHje2OTK+29GRZ2jPKGOCEePyoEj7ivHI
	 KuzTh2mIz1Q3HpQNusvdtdaj4sO247gTNLwRobsk7Q8KatdjVusLHKyKvew8IyZQTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454885;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SAztymwg+1aT7fmppIIECZake9mLXZOFcliz/rEV6Yg=;
	b=O7bo/Qhyv7/jERXi4+iOFWW3olyh3aZuWYUuCC5s3YPZ3zUIWl4lfprVR6w3yFzKsqOd
	 kgrbIZWnADytDn2l5bOjk5MGGSfmy41iG3pdbnBNkcxQqro9/Hd+tdU2DeL4Od5o3XCSO
	 ZyhbLHPPwANn+pKzxGDrsL2bZKlxMuqYEJLkAjoWAWu4hR985VU/TxRIlP+Yk+fhlDRaT
	 hPn+6PaMRxZL41/HhbkLQSGc4XsyodedfO8LeZxCUGNHemDkCX1thQLR6i4BJNsSMWus2
	 x3iH0m6wBatL7zNzthtsGao4suz0fCeCj6ltCfQadCFQnM1HQuOGG42nTEDFp0q8+CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPKUfF85;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF96606A31A;
	Sat, 31 Oct 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPKUfF85
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1519C1F000C1;
	Sat, 31 Oct 2026 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793454884;
	bh=SAztymwg+1aT7fmppIIECZake9mLXZOFcliz/rEV6Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPKUfF855EqJibsijDWeOa813F+Hh8hERpo4jZ0GpPvIdBbF3YECPPKkS5eZ/Wa38
	 lvJSJX7nuBkZPYtaga1cY71iYRU15qGMhMoq/FJj2/JZkrI9yiqoX5e99O5slWZcdT
	 7a/Z0940ZGFAZK0+32XAl/e4HeDKawD7+nv7YyFYMSR7zneW6L2t5Y9uLCm5HhU/Gp
	 3k5MloZRH/0nGOK3N6ivsRs0gMySIqpq+Jga9cVIlu7JRDW0gUAHOomGKLQqf/xudG
	 frTVmvH0s+glBWPIQ5LEE/Ni2Ot3tBtm07Uysmjt5t7/umUKTX7/A7wWvrZc5p8X/X
	 m7kICxSMzUH8Q==
Date: Sat, 31 Oct 2026 14:54:41 +0100
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
Message-ID: <auXzIbzU9aWBD_fM@pavilion.home>
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

So that assume that during the clocksource switch, the new clock synchronize
with the old one so that ktime_get() from the new clock should start from the
last value of the old clock. I'm having troubles to verify if
tk_setup_internals() does exactly that. Trying to recollect the few pieces of
my brain lost in the process.

I just added this patch to see what happens in practice:

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..e8f3fc435933 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1854,6 +1854,7 @@ static int change_clocksource(void *data)
 {
 	struct clocksource *new = data, *old = NULL;
 
+	printk("old= %lld\n", ktime_get());
 	/*
 	 * If the clocksource is in a module, get a module reference.
 	 * Succeeds for built-in code (owner == NULL) as well. Abort if the
@@ -1876,7 +1877,7 @@ static int change_clocksource(void *data)
 		tk_setup_internals(tks, new);
 		timekeeping_update_from_shadow(&tk_core, TK_UPDATE_ALL);
 	}
-
+	printk("new= %lld\n", ktime_get());
 	tk_aux_update_clocksource();
 
 	if (old) {

And I get this dump when jiffies switched to tsc_early:

[    1.549194] old= 1352575566
[    1.549930] new= 1352578748
[    1.550636] clocksource: Switched to clocksource tsc-early

That's 3 us, it could be the simple difference between the 2 printk.

But the switch from tsc-early to tsc is much more:

[    2.639818] old= 2445754540
[    2.640172] new= 2446107950
[    2.640927] clocksource: Switched to clocksource tsc

That's 353 us.

What do you think?
