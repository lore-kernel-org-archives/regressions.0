Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789C38A736
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451402; cv=none; b=IU/ywHzE46y2S/G4pUgOBah440uqJuy4dmwERtU1LKJeuMzFK2n6Y/eaQagYFljXK4fcrVNXHvPtI+0Fxs4pYkdsqA+7WMpNG6PxGXkFlBtQVk5Je8VwT3mBsbmg56ItI6gWTGktf/9lFYN2D51olkvy5TfZGG9Tv59ctzpp1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451402; c=relaxed/simple;
	bh=qMT1NX+zIHgJmJlgodutkDLJfbNg/gbC5a0twUCi6TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKxUFfCHCm4KJhBQeKWFuJ/i/RGcNLGW8zS6P/GCoZETRtLfpWjh5lyiNi1q8ZWJv3H0nNWq6c/DCDx64I2Zzz+X2NSM+eiGf3Y+nwsG9bpM/ES6MOGwZgBuuXU0IkKyz319px0Vdcx9jMrhqTqhd9UFeBx/FSMMTgH0h7p0Qo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OOEvCkAm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ikuJDRHT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OOEvCkAm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ikuJDRHT"
Date: Thu, 3 Sep 2026 18:03:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788451398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LjgTxkB5zSVJzJcaPywHI0T0gYLDigFmAh14plXp34M=;
	b=OOEvCkAmwFpas5OUKiujIY3hbBzn4shpq83enDwyRsZr55zouKLf9Cnv9ugfNVua/su6pc
	zg99uLiLi1xy0BV9WLaAxhB5UfogQWmlZ0CgEmxLmwhfCsb0kJd6hkdcV17nv88L72SjJS
	PMxVBq5yDvs0zs4R0FXRMamxINJDib/AUkS1U0k+/RvldhE2oQlI8J2haTf+GRAx37QKKI
	mHOXVouoLgxor52J6iAvAcM1ZD3Oz2wZKi2di8EYP7F6hwKhujc/jVVm1OtiV7XA0YvRtD
	9qbmYJ4O5dvitGqrXbIpNycx7nZxtQS7c4tdzVMnxH3C13jRS6nVsIcBPCtocg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788451398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LjgTxkB5zSVJzJcaPywHI0T0gYLDigFmAh14plXp34M=;
	b=ikuJDRHTsO3XeJJYqCQfqsThXrmxlh2Dz2nbRv2Wunm7MQb5gwMfCAZX+fpzVFslICRqMS
	9G7UN4A/Tim8eRDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Nikita Taranov <nickita.taranov@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: futex: private hash can stay on the shared atomic refcount
 indefinitely after auto-scaling
Message-ID: <20260903160317.-6L7VXXK@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com>
 <20260824160337.0IvfKx8A@linutronix.de>
 <20260825170605.2462933-1-nickita.taranov@gmail.com>
 <20260901230559.1978876-1-nickita.taranov@gmail.com>
 <20260902075604.A_-jz823@linutronix.de>
 <20260902213143.3426531-1-nickita.taranov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902213143.3426531-1-nickita.taranov@gmail.com>

On 2026-09-02 21:31:42 [+0000], Nikita Taranov wrote:
> The problem was originally observed on a synthetic benchmark that pretty much
> did what the first repro does. On that benchmark, it was really bad as you saw.
> I've never seen it on a real workload, so cannot comment on that.

Okay. In that case I need to figure if we want to care about a
regression on micro benchmark.

>                           stock v7.3-rc1        + your patch
>   Xeon 6975P-C 96c/192t   8/8 at 96,128,192     0/8 everywhere
>   Graviton4 Neoverse-V2   see below             0/8 everywhere
>   AMD EPYC 9R45           0/8 (never stalls)    0/8

So this means my quick hacked fixed your problem?

> I'm guessing your patch was an early stage draft, but just in case let me flag
> one problem I saw: on the Intel box the futex selftests regress:
> 
>   stock v7.3-rc1     14 passed, 0 failed
>   + your patch       12 passed, 2 failed
> 
>   futex_requeue      requeue_multiple:
>                        expected 10 == futex_cmp_requeue(f1, 0, &f2, 3, 7, 0), got 0
>                        expected  7 == futex_wake(&f2, INT_MAX, 0), got 0
>   futex_requeue_pi   2 of 24 fail: broadcast_owner, owner
>                        "Test terminated by timeout"

Yeah, I might have got something wrong. It was just an idea but might
look into this if we need this fixed. Thanks for the feedback.

> Regards.

Sebastian
