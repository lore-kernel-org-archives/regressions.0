Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288273115A2;
	Tue, 21 Apr 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779624; cv=none; b=XkUihlyeVlSZDxfwTp7YVInci0bPaNmmlFqb2NUAKSYErFl3C/HOq3WoOk4ezPrPf7qCibIBrMifYKsQhgWnQ+c9DB3/O55LGS73Hrj+ns1epSfhFquIMKqpTorRcyD3xtkR6603Fd+80GqZuOzHDS1LpmwT34cTR+MsMMO+fqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779624; c=relaxed/simple;
	bh=KtRH4AhZq1s6MR810Fx/mOEMBRCG8qQr4D5ivlbiNM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1waTQyA/3M6WA6KGEmipaSby7h6T8CcX7Eyim+AA92ptrxkPjHOxJD0D/yu7c30hy5yKVWUwFzQLny3hrmEQOkPTZsBeRb4gmhpGh8uL82XDQL7c9iqGUsHIaDB8DPjUuzQMxgJIK2u50xMNPOKt7iCMMcV6hhvNktos4/rtLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A3riO+Zl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A3riO+Zl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fmUcyxC9SK0mp7oOMaO1ZKraIq2I81QcqGRSlZ/ksGI=; b=A3riO+ZliLJjcE+E8Kx0Zuhr2Y
	6s9XDCmNXxT3e2XgOsyLath3faNHnM9xjQT6TN10ZIl2QFlKQBHdxxtxNXziAMLmza7w0oxvp3fuD
	+eW97/zVVB8X2x4wEOL/GIEcb4LKNvO+cys9PBwLGPEtlxBcC47bm8B3XES4MXbYaAaAG5aAWjPu/
	VyA5Iga+xoJiqDNXZNo/47mpVP3Vz74+dU5/60VUqqrTnx/2agxKcPJrsoPpmCeeVL6qHEp9epgYc
	rbsQu041tJADBIDMKjfY4KAB46xOmFDhworPD8EmpSh4l9SPbNZNT7GVyaeWzkY3yGyzO0ABq952g
	G+SKZUhQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBXi-0000000ADVd-0HTC;
	Tue, 21 Apr 2026 13:53:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8744B300708; Tue, 21 Apr 2026 15:53:32 +0200 (CEST)
Date: Tue, 21 Apr 2026 15:53:32 +0200
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
Message-ID: <20260421135332.GC1064669@noisy.programming.kicks-ass.net>
References: <CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com>

On Tue, Apr 21, 2026 at 06:19:52PM +0500, Mikhail Gavrilov wrote:
> Hi,
> 
> I've bisected a user-visible regression to the sched/core merge for the
> post-7.0 merge window. Resident Evil 2/3/4/9 running under Proton hang
> deterministically during level load on any kernel built from a tree
> that includes this merge, and recover on its first parent. The same
> lost-wakeup signature also appears at PID 1 startup on intermediate
> bisect steps, preventing boot entirely in some cases.
> 
> The bug reproduces on two independent workstations (ASUS and ASRock
> B650 boards, both Ryzen 9 7950X + RX 7900 XTX + 64 GB DDR5), so it is
> not board-specific and not a one-machine environmental issue.
> 
> ## Summary
> 
> - First bad: 1c3b68f0d55b ("Merge tag 'sched-core-2026-04-13' of
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> - Parent 1 (33c66eb5e984, master before merge): good
> - Parent 2 (78cde54ea5f0, tip of sched/core): good
> - Merge: bad
> 
> Both parents are good in isolation; only the merge result exhibits the
> bug. Linear bisection inside the sched/core branch (v7.0..78cde54ea5f0)
> yields no first-bad commit, which is consistent with a semantic
> conflict introduced by the merge itself rather than by any single
> commit in the pulled branch.
> 
> The bisect was run twice with different bookkeeping for inconclusive
> steps (first treating boot-hang merges as 'skip', second re-testing
> them and marking one — 88b29f3f — as 'bad' after observing the same
> lost-wakeup signature during early init). Both runs converged on the
> same first-bad commit 1c3b68f0. The 'good' steps inside
> 78cde54ea5f0..1c3b68f0^ therefore reflect the tip-of-master state with
> all the non-sched pull requests already merged but without the
> sched/core pull, and they reproducibly pass the game test.
> 
> Reproducibility is ~100% in both directions: every tested build that
> includes the merge hangs on the first level-load attempt; every tested
> build with parent 1 as the tip completes a full level playthrough and
> a save-resume in both RE2 and RE9 without issue.

And you're absolutely sure:

  25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")

isn't to blame? That appears to have broken ww_mutex, which is used
quite heavily by the graphics stack.


