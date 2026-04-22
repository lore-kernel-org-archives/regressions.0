Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00812225403;
	Wed, 22 Apr 2026 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865528; cv=none; b=M5L/x0IRvGOCt0NHxlVPliNZkUQLEjEv0ltX7QGBObdqMcbhklTNMXhtDWTF8tZGVqlDWQpFLu4UW6xRDDGTzkysoc4GnSAiuy66OTa52gBtNtkyt8PMMBeIAiyuo7aCNTYQlIMl1bKO9fnVOGDufb1pGhedOpWJXKq+UAKLffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865528; c=relaxed/simple;
	bh=XlIMPVFT8LSFo3xeB6oUBZGcINKFQCtQr839TPdOnuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awXLyz94RZ8uAUTMIM39Qtoq6JUKGgop/rWxC51/Wnub+/TrT/zBYBQTvyE2ITJm18eRpu/BSNN/u9+F8hnj93H9VYZ7kfeh4j2AbDRG8Jc5MQE9pi5noKJMQutxFOa790LQWQYYtC+oIGq9quJbKSR/gNa3erPqWhiXZJZhckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YpNKwhrF; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YpNKwhrF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zpVXbEUfIpmO4kQcsukB71G+pmauVdO2lhouOcQ7VmA=; b=YpNKwhrF1D/UEoyJtvJSew2MYz
	7jkA8HbJcAzQ1tBUsJvJMDcX2/ppbl0JHLx9MQ8Ql0C5RcAnvKmTIndJz7AiHL/xSaTE3fEFc3hWd
	/TrOJ9nyDNCJvwVGIRthABLzjRk3NJ1Q3d1U/JkhrSNfSJpePj12YEBsck5X8n6VZ+ahzFoTClFIB
	dZt4fnP5P4ZUIpkkW1ahaHTZIDPBw6CnMUq8j56P5CR+TPEb9EqsmEU6il6oarQzTsCknSXloAOio
	NXiQKRhn//bfU6idalIdyf3BvNqitVIIraDDYuSoZGBgS7u3PxlcTEckVmBupZAZmrBwE7I8uq8jQ
	qM2z9fAA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXtI-0000000BpKj-2ktG;
	Wed, 22 Apr 2026 13:45:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EAE7E3008E2; Wed, 22 Apr 2026 15:45:19 +0200 (CEST)
Date: Wed, 22 Apr 2026 15:45:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Waiman Long <longman@redhat.com>, John Stultz <jstultz@google.com>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] sched/core merge 1c3b68f0d55b: futex_waitv lost
 wakeup hangs RE Engine games and PID 1 init
Message-ID: <20260422134519.GQ3102624@noisy.programming.kicks-ass.net>
References: <CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com>
 <20260421135332.GC1064669@noisy.programming.kicks-ass.net>
 <20260421144105.GA3179637@noisy.programming.kicks-ass.net>
 <CABXGCsO5fKq2nD9nO8yO1z50ZzgCPWqueNXHANjntaswoOh2Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsO5fKq2nD9nO8yO1z50ZzgCPWqueNXHANjntaswoOh2Dg@mail.gmail.com>

On Wed, Apr 22, 2026 at 03:48:16PM +0500, Mikhail Gavrilov wrote:
> On Tue, Apr 21, 2026 at 7:41 PM Peter Zijlstra <peterz@infradead.org> wrote:>
> > Specifically, see this thread:
> >
> >   https://lore.kernel.org/r/95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com
> 
> You're right — it is to blame, and I was about to follow up to say so.
> 
> After sending the first mail I kept re-verifying markers with the
> stricter RE2+RE9 workload and found that 33c66eb5e984 (parent 1 of
> 1c3b68f0, which I had marked "good") actually reproduces the hang too.
> A third bisect run with the stricter workload converges unambiguously
> on:
> 
>   25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
> 
> Parent b9bdd4b68404 ("locking/semaphore: Remove the list_head from struct
> semaphore"): good. 25500ba7e77c: bad.

Please test this:

  https://lore.kernel.org/r/20260422092335.GH3102924@noisy.programming.kicks-ass.net

and reply there with your findings if possible.
