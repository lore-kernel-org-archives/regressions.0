Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18513ECBD5;
	Mon,  8 Jun 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931609; cv=none; b=HRYPe9o5SEjYOr4jEfspyeZlxjenicZsKP9ZwiV+Q2K3gY4vx5pd1f4MFOJP8oq0wdh6NawnGobI1PuPtz4HKMtrCd2VeXqw6w8pM5Abe5H7xr3mWZk4tdKx6/QkNXfWnkfzyasTlEfW4u37DIUcJfzsJLcBprOLz9zudl+X2lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931609; c=relaxed/simple;
	bh=6hpOHoPuZrJ811PRBRwv1T82j/VrFqa1cYdzOEJgzPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mp9Nrpq57MusufC7qo+3Ei1Ip47gTmBxLwgEaxKXYqrgqyb/8ncDDYWTZXMQiCOow9BAW9X9conuSxxYGeCjKQvmB+HtyTM2zUMJ93zb2++xGXgTMmWgHG1FDLr8NLkYirkkOXyvAxWsqNedWWqevO2HnUFburHEp+QSLL9ggOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS1Y4UZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS1Y4UZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945A51F00893;
	Mon,  8 Jun 2026 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931608;
	bh=mg7/+m75L9vy7oRrRsWTHKmIvgWh3VyWCWO0qvJldsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bS1Y4UZ7FizRBBWK1g26cJ9yx1nivTVjql/1FOqywg7FmLw+3X1iFcs/o3Up5u2Ww
	 9MZXZL0vXeM2u6pQUf1FrcgDh/76TkpN8rpow7BzYvSjv0OjV3RAAEsgQhDWTOkpKA
	 LIASIOcBbX45Ci3i+oEqZV/AQhcE3fTVcld5yDqMFCDQ1Y9/Bw9QsR5BFxsdepxaSk
	 dxaoDfPSogdWC4YxIxlGLhWPIYMR7aDYdtE9LggWE4S7r/z/VFKgFVAVdLPUPurQkS
	 Aq1CO+QLmIDff0SXJBlY8Aj9jJCd6SnObydvK2NHgjaAruCn/QboYP+pvkSUe312SN
	 LccP1gIIZFXnA==
From: Thomas Gleixner <tglx@kernel.org>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olivier Lambert
 <olivier.lambert@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests
 during PV spinlock initialization
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
Date: Mon, 08 Jun 2026 17:13:25 +0200
Message-ID: <87ldcp3w16.ffs@fw13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 08 2026 at 12:29, Teddy Astie wrote:
> In 6.12.5+ kernels on AMD CPUs, we observe abnormally long boot times 
> where the guest is struggling on PV spinlock initialization.
>
> This occurs starting with 6.12.5, and also on more recent kernels on 
> Intel platforms, but that hasn't been fully investigated at this time 
> (but I assume it's a variant of the same issue).
>
> This occurs since a backport of 76031d9 ("clocksource: Make negative 
> motion detection more robust").
>
> Some (claude-based) analysis made appears to relate that to the lack of 
> proper max_raw_delta in the jiffies clocksource which appears to make 
> the clock fail to progress meaningfully.
>
> Here is a raw summary of the analysis
>  > We tracked it down to a single stable backport in 6.12.5: commit 
> 1a678f6829a8 ("clocksource: Make negative motion detection more robust", 
> upstream 76031d9536a0). It introduces a max_raw_delta field on struct 
> clocksource but never initializes it for the default boot timekeeper 
> (the jiffies clocksource), so clocksource_delta() clamps every delta to 
> 0 and CLOCK_MONOTONIC freezes while that clocksource is active.

Bah. jiffies clocksource is registered way _after_ timekeeping started to
use it.

The untested below should fix that.

Thanks,

        tglx
---
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -60,15 +60,9 @@ EXPORT_SYMBOL(get_jiffies_64);
 
 EXPORT_SYMBOL(jiffies);
 
-static int __init init_jiffies_clocksource(void)
-{
-	return __clocksource_register(&clocksource_jiffies);
-}
-
-core_initcall(init_jiffies_clocksource);
-
 struct clocksource * __init __weak clocksource_default_clock(void)
 {
+	clocksource_register(&clocksource_jiffies);
 	return &clocksource_jiffies;
 }
 

