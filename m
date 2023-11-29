Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BDE57F
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pyYGXSkH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3zM/MGcD"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701248254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGut62ybfe28ybZ43VX49v4u3VfIheCoqpgPTSbsrts=;
	b=pyYGXSkHrtNeAaJdR2tkk5ywCxuX9h0psTJRmlkpAaCB6+TdGqElK6xStunG6NMUoLz35Z
	pQvxtfJTk/JKC3UamdRQKAz3BkL8ng+fxqy45yPhCJXCZq/YGo2OaCdKouU1TBec2/gEED
	nc5Ti+DtToptqH0XfughR4KBg6NThZ9QkddGnN0LJyaurf20cMVz4/zXRjkWrZUixW7cBi
	27YqXL7cwyn1xg0jMsH8A6BhBzBJqzunZhjqodaWmYIGS627m7xgs5+FsiokWD2kmSgo6H
	7/VwO9KTxlPhuQYrC2bLsu/95HznhOgoGj8tWavwm4bBJE+uIp+QqfswA/5Zsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701248254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGut62ybfe28ybZ43VX49v4u3VfIheCoqpgPTSbsrts=;
	b=3zM/MGcDpAN5/7z76YtFg8pTuLKzdlJyznkN/bsnYMJgFCc3A6r9+u/4ct3tdc+BSUlIWx
	EU44GYdo98LHkzAA==
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, paul.gortmaker@windriver.com
Cc: bp@alien8.de, linux-kernel@vger.kernel.org, peterz@infradead.org,
 richard.purdie@linuxfoundation.org, x86@kernel.org, Linux kernel
 regressions list <regressions@lists.linux.dev>
Subject: Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128
 x86/alternative: Rewrite optimize_nops() some]
In-Reply-To: <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
References: <ZUEgAAGDVqXz2Seo@windriver.com>
 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
Date: Wed, 29 Nov 2023 09:57:33 +0100
Message-ID: <87r0k9ym0y.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Nov 11 2023 at 12:51, Linux regression tracking wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
>> [Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128 x86/alternative: Rewrite optimize_nops() some]] On 30/10/2023 (Mon 20:30) Thomas Gleixner wrote:
>> 
>>> On Mon, Oct 30 2023 at 19:24, Thomas Gleixner wrote:
>> 
>>> > Can you add "debug-alternative" to the kernel command line and log both
>>> > a working and the non-working kernel output. It's noisy :)
>>> >
>>> > Also do you have a .config and the qemu command line handy?
>>> 
>>> Forgot to ask: Does the probkem persist with 6.6 ?
>> 
>> My bad, should have mentioned v6.6 and linux-next is impacted. Always a
>> conflict between burying the lead and boring people with details.
>
> Paul, was this regression ever solved? I wonder as I could not find
> anything with a "Fixes: 6c480f222128 [...]" tag on lore and this thread
> looks stalled.

Hmm. I was waiting for the .config file to materialize and for an
eventual analysis of the alternatives debug output....
