Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A593222
	for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 15:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84EDC433EF;
	Thu, 26 Jan 2023 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674748531;
	bh=JsaqBugdvm0bKSn7JKiVG39TV2mp7Z1zU4P2n5J37Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiZqiEicyPY8ZmKU5MdtBbnox3cw+bw0efxeN2ntwi3YjyqlJqRxq79RYKjxQ1YWL
	 swIKChF3Q7GCzUlWFuz2xdpdnvN1/Cb96xo3spb/u9ekIbWg0KcZyka6us+tEqWrxb
	 GtCR6dm6dC+k3CStz0TGxhQ26KXITzOZONhSTX1FtLnX7X0SsIQMLiTRQ7z6gk1MJg
	 9ohtSjlym9jH1vkZ+5iBw1h+DDZnywOu6FFYltb4583I2Q/D1k3W1wm+H1iTbBxL16
	 7PYW6OqH7Sqk0XWnqJMxEvrrKIYcM8qxm0jvKKIH6l4lTsWxuUQoJmiOD7y+GCtss3
	 asczqX8cFsSXQ==
Date: Thu, 26 Jan 2023 15:55:24 +0000
From: Will Deacon <will@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	regressions@leemhuis.info
Subject: Re: [PATCH v2] sched: Store restrict_cpus_allowed_ptr() call state
Message-ID: <20230126155524.GA29438@willie-the-truck>
References: <20230121021749.55313-1-longman@redhat.com>
 <20230124194805.GA27257@willie-the-truck>
 <70cf3890-efb1-cf35-2f94-f2b09092231f@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70cf3890-efb1-cf35-2f94-f2b09092231f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 24, 2023 at 03:08:09PM -0500, Waiman Long wrote:
> On 1/24/23 14:48, Will Deacon wrote:
> > On Fri, Jan 20, 2023 at 09:17:49PM -0500, Waiman Long wrote:
> > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > index 853d08f7562b..f93f62a1f858 100644
> > > --- a/include/linux/sched.h
> > > +++ b/include/linux/sched.h
> > > @@ -886,6 +886,9 @@ struct task_struct {
> > >   	unsigned			sched_contributes_to_load:1;
> > >   	unsigned			sched_migrated:1;
> > > +	/* restrict_cpus_allowed_ptr() bit, serialized by scheduler locks */
> > > +	unsigned			cpus_allowed_restricted:1;
> > > +
> > >   	/* Force alignment to the next boundary: */
> > >   	unsigned			:0;
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index bb1ee6d7bdde..48234dc9005b 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -2999,15 +2999,40 @@ static int __set_cpus_allowed_ptr(struct task_struct *p,
> > >   	struct rq *rq;
> > >   	rq = task_rq_lock(p, &rf);
> > > +
> > > +	if (ctx->flags & (SCA_CLR_RESTRICT | SCA_SET_RESTRICT)) {
> > > +		p->cpus_allowed_restricted = 0;
> > I don't think this is ever called on the SCA_SET_RESTRICT path, as
> > restrict_cpus_allowed_ptr() calls __set_cpus_allowed_ptr_locked() directly.
> > In my testing, we see a failure in the following sequence:
> > 
> >    1. A 64-bit task has an affinity of 0xf
> >    2. It exec()s a 32-bit program and is forcefully restricted to the set
> >       of 32-bit-capable cores. Let's say that new mask is 0xc
> >    3. The 32-bit task now exec()s a 64-bit program again
> > 
> > And now we're still stuck with 0xc after step 3 whereas we should restore
> > 0xf.
> I am sorry that missed it. You are right. For setting the
> cpus_allowed_restricted bit, it should be done directly in
> restrict_cpus_allowed_ptr().
> > > +	} else if (p->cpus_allowed_restricted) {
> > > +		/*
> > > +		 * If force_compatible_cpus_allowed_ptr() has been called,
> > > +		 * we can't extend cpumask to beyond what is in cpus_mask.
> > > +		 */
> > > +		if (!cpumask_and(rq->scratch_mask, ctx->new_mask,
> > > +				 &p->cpus_mask)) {
> > > +			task_rq_unlock(rq, p, &rf);
> > > +			return -EINVAL;
> > > +		}
> > Why is this masking actually needed? __sched_setaffinity() already
> > takes into account the task_cpu_possible_mask(), which is why I asked you
> > before [1] about cases where the saved affinity is not simply a superset
> > of the effective affinity.
> 
> I kind of overlook the use of task_cpu_possible_mask() in
> __set_cpus_allowed_ptr_locked. So we don't really need that masking. That
> make the patch even simpler then. I will send out a v3.

Thanks; I'll give it a spin when I see it.

Will
