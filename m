Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C939D6F2;
	Mon,  8 Jun 2026 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954199; cv=none; b=rQDJQedTOAqdMVUehTGiALCQKD95+khJfkE3gyEE6NwYg3tQJXkRuPw67+HgxUW+dZr6KyfjrtR+mt/k7cC894UAfoePVjDE8lfIZr9mbWED0lj3VVhF2jET1rvyDAw7eGGRMZ9+XlN4L/japMQRUcdaXMoKoOK8UIOrp+Am0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954199; c=relaxed/simple;
	bh=scxepYKdw+DdMG/57kQ0cW6RtzFBbrAT08eO1lr5yxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S6TueXRXw4d/AteXT83nI7UaFGDYhxeOJeeNmh0h8u/Ax2VLJa6MOENAscNv0aQVM5zrfXbLc0/adJt3n4H+L0tCEWDnWuQpvJ/tTjLG1YKPCM/EA/DOu4Aa5FsqEaXOdR4bgzgnC9GoyaRBfCP82QODR7/Dmx9vvTWhg0CZlVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHotO+HY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHotO+HY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BEC1F00893;
	Mon,  8 Jun 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780954198;
	bh=10Ge8gkdRT2r2MB4nZOmsq7A7oBUPMVrH/EAt53EHDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cHotO+HYT6KnftYtwqtcC1eOb0CiIjpQDNAtr0eiW9Spfg+ZKZoEsPPnjzbyBsnvl
	 3aO7kALqnRkhd9MuYISWiOJsWqEl33m8z7H9e3tLQ8kIiNaTwe7yoTRbRBpAQoQTGY
	 aLBTbHiJ2o73r9gx5sAyHcHiQCzsYEmDsORsQ4IUhxPpN5Ed8M+DyVyqa5nEuijFqP
	 K0XjdaxMc6d5Nm/JjrnVeHqYH6ID6h/SbThmr9fNmZc8FP6U0ONRKmVBi7Ch3l64Ds
	 w8sYstQvc3bmYUv+HI/uC6qG/9l/Dfcq5n0fdimIWtTMYDeSn4S41bVAN1C0/2U2Cr
	 /CO2im1u1GyyA==
From: Thomas Gleixner <tglx@kernel.org>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olivier Lambert
 <olivier.lambert@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests
 during PV spinlock initialization
In-Reply-To: <87ldcp3w16.ffs@fw13>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
Date: Mon, 08 Jun 2026 23:29:55 +0200
Message-ID: <87ik7s4t64.ffs@fw13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 08 2026 at 17:13, Thomas Gleixner wrote:
> On Mon, Jun 08 2026 at 12:29, Teddy Astie wrote:
>> In 6.12.5+ kernels on AMD CPUs, we observe abnormally long boot times 
>> where the guest is struggling on PV spinlock initialization.
>>
>> This occurs starting with 6.12.5, and also on more recent kernels on 
>> Intel platforms, but that hasn't been fully investigated at this time 
>> (but I assume it's a variant of the same issue).
>>
>> This occurs since a backport of 76031d9 ("clocksource: Make negative 
>> motion detection more robust").
>>
>> Some (claude-based) analysis made appears to relate that to the lack of 
>> proper max_raw_delta in the jiffies clocksource which appears to make 
>> the clock fail to progress meaningfully.
>>
>> Here is a raw summary of the analysis
>>  > We tracked it down to a single stable backport in 6.12.5: commit 
>> 1a678f6829a8 ("clocksource: Make negative motion detection more robust", 
>> upstream 76031d9536a0). It introduces a max_raw_delta field on struct 
>> clocksource but never initializes it for the default boot timekeeper 
>> (the jiffies clocksource), so clocksource_delta() clamps every delta to 
>> 0 and CLOCK_MONOTONIC freezes while that clocksource is active.
>
> Bah. jiffies clocksource is registered way _after_ timekeeping started to
> use it.
>
> The untested below should fix that.

That obviously needs to be:

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
+	__clocksource_register(&clocksource_jiffies);
 	return &clocksource_jiffies;
 }
 
