Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112C3222
	for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 16:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671B9C433EF;
	Thu, 26 Jan 2023 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674749478;
	bh=FDWqGrT6gli+ZkXUcX+XibAU3+og5P3uR2DttrVJRh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EvNf2S1ORgBG2zoPoQee2NLX8ya3baKZbJ37WLDapr7D8T5eW4vaEkxLGKBpkm/UT
	 hv4RE5WLtrNGhuP4q2nuPc0ENESA5u7bg5TEPorPkl00g93Kgtn6w1OSKnuq2NuJ+X
	 iEd13d2EdH8uryylSAUkclcx7SvoTstFzcYiKcOOUSoR6tOvwhrMRCjXnWhVUOjBHI
	 qsCLnJMm/58Nofj0UoqPrkNK8zPt25H3iybePB0zdRPnkMYLcO+6rZxuwq+wHLpTR6
	 ihpWgc7W0yhdTRP7r1CUOdAl5qW0p8WMldV1JSsBawk+PWCQcmf78oJgo7ORfJ60dh
	 o8WP3XAoiCryA==
Date: Thu, 26 Jan 2023 16:11:11 +0000
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
Message-ID: <20230126161110.GB29438@willie-the-truck>
References: <20230121021749.55313-1-longman@redhat.com>
 <20230124194805.GA27257@willie-the-truck>
 <fdf76fb2-1da4-2d72-7eb3-21137a7d6845@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdf76fb2-1da4-2d72-7eb3-21137a7d6845@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 24, 2023 at 03:24:36PM -0500, Waiman Long wrote:
> On 1/24/23 14:48, Will Deacon wrote:
> > On Fri, Jan 20, 2023 at 09:17:49PM -0500, Waiman Long wrote:
> > > The user_cpus_ptr field was originally added by commit b90ca8badbd1
> > > ("sched: Introduce task_struct::user_cpus_ptr to track requested
> > > affinity"). It was used only by arm64 arch due to possible asymmetric
> > > CPU setup.
> > > 
> > > Since commit 8f9ea86fdf99 ("sched: Always preserve the user requested
> > > cpumask"), task_struct::user_cpus_ptr is repurposed to store user
> > > requested cpu affinity specified in the sched_setaffinity().
> > > 
> > > This results in a performance regression in an arm64 system when booted
> > > with "allow_mismatched_32bit_el0" on the command-line. The arch code will
> > > (amongst other things) calls force_compatible_cpus_allowed_ptr() and
> > > relax_compatible_cpus_allowed_ptr() when exec()'ing a 32-bit or a 64-bit
> > > task respectively. Now a call to relax_compatible_cpus_allowed_ptr()
> > > will always result in a __sched_setaffinity() call whether there is a
> > > previous force_compatible_cpus_allowed_ptr() call or not.
> > I'd argue it's more than just a performance regression -- the affinity
> > masks are set incorrectly, which is a user visible thing
> > (i.e. sched_getaffinity() gives unexpected values).
> 
> Can your elaborate a bit more on what you mean by getting unexpected
> sched_getaffinity() results? You mean the result is wrong after a
> relax_compatible_cpus_allowed_ptr(). Right?

Yes, as in the original report. If, on a 4-CPU system, I do the following
with v6.1 and "allow_mismatched_32bit_el0" on the kernel cmdline:

# for c in `seq 1 3`; do echo 0 > /sys/devices/system/cpu/cpu$c/online; done
# yes > /dev/null &
[1] 334
# taskset -p 334
pid 334's current affinity mask: 1
# for c in `seq 1 3`; do echo 1 > /sys/devices/system/cpu/cpu$c/online; done
# taskset -p 334
pid 334's current affinity mask: f

but with v6.2-rc5 that last taskset invocation gives:

pid 334's current affinity mask: 1

so, yes, the performance definitely regresses, but that's because the
affinity mask is wrong!

Will
