Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F3C387590;
	Tue, 21 Apr 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782478; cv=none; b=V7tZyJatPYJPjwkxWKGxxX/PtAdyPlnZmqLaNggnh7mwxSXAp8zMdDK4CJQ2owLT4eU6I9CK2n8RL2TB+8qILcZLpB551M2sf7U7U1SP1AjXbNIDvtBJviXLl+WE64uCe+LuI9J5iLdyQWHoUyNJ+BD9HwUDiTiMxDhctEKBhd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782478; c=relaxed/simple;
	bh=eUsPVs4H00MOIZ7hGByVjsez62fQaX22cBPV+qdnJFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjFQvTC4EX0N3inSKvd8Xu+dXxUUqSdNzIsWGsBdFN1FNPbfvD+4tCDe6PGPoStxu7iUAarRGn21wQ1agp8+DeLq4X+fov4uEI0crcLGRfTcT93+n+tL/icI3tLlKDInTpASkpOhMAcoCH/x/b8iEo10M1KUE3e5atqQbELxkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZUUcV+oE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZUUcV+oE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=htgERjaz1YsR7gI1soPxAs0fQKQ00EHwH7Lj+1WT+O4=; b=ZUUcV+oEAbHegbBcUM0OZmWySx
	nljkU9M1UeVEicTiOSpgd7o8Pn/KVwShEdxwrE3cKoZlCFx7ihXsGM1JJy+uyYC5LTDnnb2vP9Yq/
	tsgDp+bEbgyhpsXp56qEVMfo5Trea6J6mnV/o7UcQ/5+TY/8Y7B+guaavv2dNx8sj7CokAoLJAkuD
	I6GJbTCDHE/+1zcrS9eQ7RgtL1fwratSCjVXyxpdEu4hbErKIsGGv8DFsgppuD4SzcFitpak0QLv2
	BDJ0nyWtUNRxLl4cqQKz4mQ1/tbJF6L/AOUaMKO1EkXnHRJopc4U73CmtlABlIN2PmuVX/SwWKOlS
	Oq+ozgVQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCHi-00000009wft-1Of5;
	Tue, 21 Apr 2026 14:41:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DA78A300708; Tue, 21 Apr 2026 16:41:05 +0200 (CEST)
Date: Tue, 21 Apr 2026 16:41:05 +0200
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
Message-ID: <20260421144105.GA3179637@noisy.programming.kicks-ass.net>
References: <CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com>
 <20260421135332.GC1064669@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421135332.GC1064669@noisy.programming.kicks-ass.net>

On Tue, Apr 21, 2026 at 03:53:32PM +0200, Peter Zijlstra wrote:
> On Tue, Apr 21, 2026 at 06:19:52PM +0500, Mikhail Gavrilov wrote:
> > Hi,
> > 
> > I've bisected a user-visible regression to the sched/core merge for the
> > post-7.0 merge window. Resident Evil 2/3/4/9 running under Proton hang
> > deterministically during level load on any kernel built from a tree
> > that includes this merge, and recover on its first parent. The same
> > lost-wakeup signature also appears at PID 1 startup on intermediate
> > bisect steps, preventing boot entirely in some cases.
> > 
> > The bug reproduces on two independent workstations (ASUS and ASRock
> > B650 boards, both Ryzen 9 7950X + RX 7900 XTX + 64 GB DDR5), so it is
> > not board-specific and not a one-machine environmental issue.
> > 
> > ## Summary
> > 
> > - First bad: 1c3b68f0d55b ("Merge tag 'sched-core-2026-04-13' of
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> > - Parent 1 (33c66eb5e984, master before merge): good
> > - Parent 2 (78cde54ea5f0, tip of sched/core): good
> > - Merge: bad
> > 
> > Both parents are good in isolation; only the merge result exhibits the
> > bug. Linear bisection inside the sched/core branch (v7.0..78cde54ea5f0)
> > yields no first-bad commit, which is consistent with a semantic
> > conflict introduced by the merge itself rather than by any single
> > commit in the pulled branch.
> > 
> > The bisect was run twice with different bookkeeping for inconclusive
> > steps (first treating boot-hang merges as 'skip', second re-testing
> > them and marking one — 88b29f3f — as 'bad' after observing the same
> > lost-wakeup signature during early init). Both runs converged on the
> > same first-bad commit 1c3b68f0. The 'good' steps inside
> > 78cde54ea5f0..1c3b68f0^ therefore reflect the tip-of-master state with
> > all the non-sched pull requests already merged but without the
> > sched/core pull, and they reproducibly pass the game test.
> > 
> > Reproducibility is ~100% in both directions: every tested build that
> > includes the merge hangs on the first level-load attempt; every tested
> > build with parent 1 as the tip completes a full level playthrough and
> > a save-resume in both RE2 and RE9 without issue.
> 
> And you're absolutely sure:
> 
>   25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
> 
> isn't to blame? That appears to have broken ww_mutex, which is used
> quite heavily by the graphics stack.

Specifically, see this thread:

  https://lore.kernel.org/r/95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com
