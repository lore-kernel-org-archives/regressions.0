Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD333F58E8;
	Thu, 15 Oct 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089150; cv=none; b=G2X/TW8GkHOP1aYjU+pdyOUpZFIZ0WyG9UXClUKY9f75BEjuegZZZPU1Yc2h2msaudGFaZd6VOAi4p8JbrBxExlFMrvkBX+6Ogp84nYD7NHvC8XCsYyeXBWlDjb4xl0hbAes5y/Vf5id44Q2CdhCFdMUqw5cL4sbYG79Eo874iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089150; c=relaxed/simple;
	bh=4Htp05Yu6WKm/2IcPJJ+TCWaRgP4kwiFqBvKWAwgdzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ciEZeIOBvktAraMwmEIZJphc2fxuW4hj8DsNK8K9jQ8tjrunhTAfXp0IbVbfbBDaY1ri1Yp0ZOi/Xcf2qM2cw/uEip6LNLJpARnzdap+4K3nAKDEXFfXPzuliqmeHtFBpu/HbgkjgjAbu4D5QQHV3Bh5pW87lNMiOykufeSIkHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnPFzpFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnPFzpFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984041F000C4;
	Thu, 15 Oct 2026 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792089148;
	bh=3/ZhwJXDAIhjRzxk9QyR5oQU0tHsJ0x+/pfjWyCI3iY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DnPFzpFaptJ0bOVBAltZYO4in70ZAna2pAqSQcqL6Hjq21Uo3iyAbj9LJQ1GCkpKU
	 wFuuDv1iA+i2NnlpOMVABUgBw0WyWBNZW2QoDsz94JIUmrz1ZIYZStkvzVP34uaKLA
	 ujTt5A4vUBdbAgWY9hbNNyyZoOmcMMkMkuY4DLNyQhHC0l6V3x0S+RHW/tABestSV8
	 pRNVrtJ2I3mKITo9Wp/12o6XOKBs2UNBrLR3JEvMo2Q+sOhCDC2dq1MZF4URjexMlC
	 U2WO5WjsbK7D2c2LjiQjxP4Jtnvrr6Y2a1y4xSRUX5iw9V6kfGlm+IdQ2A/E4k/Hg9
	 wgzKaES/vUYQw==
From: Thomas Gleixner <tglx@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Miroslav Lichvar
 <mlichvar@redhat.com>, Jiri Wiesner <jwiesner@suse.de>, Daniel J Blueman
 <daniel@quora.org>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
In-Reply-To: <20261010065509.72916-1-kmehltretter@gmail.com>
References: <20261010065509.72916-1-kmehltretter@gmail.com>
Date: Thu, 15 Oct 2026 20:32:25 +0200
Message-ID: <87a4oeerwm.ffs@fw13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Oct 10 2026 at 08:55, Karl Mehltretter wrote:
> Since the watchdog rewrite in v7.1, the TSC can be marked unstable
> after a delayed watchdog run under QEMU TCG. Without injected stalls,
> this happened on 5 of 12 boots on a loaded host and 0 of 6 on an idle
> host.
>
> The delayed run re-arms the timer with an expiry already in the past.
> The watchdog then runs again almost immediately and rejects the TSC
> based on a roughly 75 us measurement interval.
>
> #regzbot introduced: 763aacf86f1b
>
> v7.3-rc5, 4 vCPUs, after vCPU 0 was stopped for 0.8 s:
>
>   clocksource: Marking clocksource tsc unstable due to frequency skew
>   clocksource: Watchdog                    hpet interval:            74940ns
>   clocksource: Clocksource                  tsc interval:            74251ns
>   clocksource: Switched to clocksource hpet
>
> The intervals are 75 us, not the 500 ms watchdog period. A function
> trace of clocksource_watchdog() from the same boot:
>
>   busybox-79 [000] ..s1. 15.168486: clocksource_watchdog <-call_timer_fn
>   busybox-79 [000] .Ns.. 16.269726: clocksource_watchdog <-call_timer_fn
>   busybox-79 [000] .Ns.. 16.269820: clocksource_watchdog <-call_timer_fn

I did not think about that scenario obvioulsy. The code is resilient
against long intervals between two measurements, so the easy and
straight forward fix is indeed what you (or the LLM) suggested.

Thanks,

        tglx
---
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -673,7 +673,7 @@ static void clocksource_watchdog(struct
 
 	/* Could have been rearmed by a stop/start cycle */
 	if (!timer_pending(&watchdog_timer)) {
-		watchdog_timer.expires += WATCHDOG_INTERVAL;
+		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
 		add_timer_local(&watchdog_timer);
 	}
 }
