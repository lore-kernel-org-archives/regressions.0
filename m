Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691670800
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 01:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249947; cv=none; b=MdKl0q8mBIqrCAgMfFh78dsrx77hHQtyOv7rCueifiI5eWdyrR85nCL9C5pXuM8pSbePFS5zCJAyBlzvEC1mZinQpwIZbJd0+cdvl0K5/6Noehoq5Rkno+jbfqN3ReQMPinxYvapakNzn+J/00r5KLPs4ZAOkAVsYsYKsvIh59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249947; c=relaxed/simple;
	bh=vKLzshF1zBPzzTMXiGt8BdyQZzHIDPA5ufOZaf1gACk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+UeXDDGEc+z0P5ux1r096SPnTNvtZkxSHEQ2+Gb0hXUotE0yJQ/85DEMIZW/E23pnyKMjUroVtjJ1g9ILKZTlilY6RGMrGhzeLuMzBirk/+M9E7REIJI3PpRUjCJt/1+t1whtAAm/5iF015idXvHS2fc51tw5hSUkI03J30zrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22548a28d0cso3911355ad.3
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 18:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744249944; x=1744854744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaJxqLk3V06ArQnoQFKz5rLPJR/azvazadpvaNzDZW8=;
        b=RmGhQxtdtMvLl4hP4tlVUlXiRJgRQcUzRlBzMNQ4M4JTQkq5x3lm0ifw//PXc2/Ya2
         Yw9+6TRy2VOvtIBZ+ab5YDLTC0PbyyNR6PPORV/gf0fK8vHmCVczNVL/LJuDVczudBh2
         A36ZjUXweJDI4JD1BJ+15dK/YzJWjTMzBlYlLoLUbdIclft6FbQ5SJSDAb0kU7DU2N5r
         yZG9pFS/2JKSHPps7joa2qcpSYvK5nxsOg7GekjyJkMPUG2mvZI2leQZBo2xb9PF2V7f
         NuMroAGZyy5l8l0ySIiowC2gV+mMobwHYJN+C3r114puN7ulXqGiULR3Zx/fe4OcNG0j
         qVlg==
X-Forwarded-Encrypted: i=1; AJvYcCXYnWwjlS7SNCuxk9tSQ1i8rf/Ehj43cyOpbTrA2/ymd2+5SlMOA4pMnDYxiLVSkvggSfsi0JN2HjbcMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZrDmffabTAfTv5eucbLCCEMfD4cm5gaqpZ2NGy+PFch8IrQwa
	0BQrint/K2hF5jJJk6TBIQe5vvFp3g07us6QrRZPEZ2L7yEN7TC9
X-Gm-Gg: ASbGncsw8E2G3GXS8T2RZ9n1x4RAE4B5qJxRv3BmZ39i9fhuaEcxjv62O9O8hy28OEJ
	KFfvCkOWahoGPMugsw3FGFGT8yoHfZHTUxRFoh5ZFmhJl8yr52tCzSDxZ5u+MlGtHSUiSh+U53e
	lXH1y2fpZjU7ONQZDUsXvJZW7Ct9UaAOZoTOnYPBT4gJ7QIrpYQt6RPjLvmNagmsD/N3O3NfJ5H
	E+HvWkLxjGI4P9dASzyGMuyL0JpYDA5jl6FMEsuCdWbXTMPUYNpHTrJycwb2QX6fdqfmpLPntpX
	TBYGrF2p/ZgeKsAk+TtcEVrHavIqM3P8MxiJF3E7yQTpSAwNFJO6s5DdNKM=
X-Google-Smtp-Source: AGHT+IH5DMA8QYKm1WbSD1sLTN8mlWGKoMcvZflMV5qQELvdqIA+8gtpJaS3iupJUAV6K+BCGVRtRg==
X-Received: by 2002:a17:902:f64d:b0:21f:164d:93fe with SMTP id d9443c01a7336-22be04199b5mr8933505ad.53.1744249944613;
        Wed, 09 Apr 2025 18:52:24 -0700 (PDT)
Received: from sultan-box.localdomain ([142.147.89.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10dc40sm2679257a91.9.2025.04.09.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:52:24 -0700 (PDT)
Date: Wed, 9 Apr 2025 18:52:20 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/2] cpufreq: schedutil: Fix superfluous updates caused
 by need_freq_update
Message-ID: <Z_ckVIK5zAeHHyVb@sultan-box.localdomain>
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com>
 <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>
 <Z_VTRspvmOUfrawh@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VTRspvmOUfrawh@linaro.org>

On Tue, Apr 08, 2025 at 06:48:06PM +0200, Stephan Gerhold wrote:
> Hi Sultan,
> 
> On Tue, Apr 08, 2025 at 08:22:20AM -0700, Sultan Alsawaf wrote:
> > On Tue, Apr 08, 2025 at 10:59:31AM +0200, Stephan Gerhold wrote:
> > > On Wed, Dec 11, 2024 at 05:57:32PM -0800, Sultan Alsawaf wrote:
> > > > From: "Sultan Alsawaf (unemployed)" <sultan@kerneltoast.com>
> > > > 
> > > > A redundant frequency update is only truly needed when there is a policy
> > > > limits change with a driver that specifies CPUFREQ_NEED_UPDATE_LIMITS.
> > > > 
> > > > In spite of that, drivers specifying CPUFREQ_NEED_UPDATE_LIMITS receive a
> > > > frequency update _all the time_, not just for a policy limits change,
> > > > because need_freq_update is never cleared.
> > > > 
> > > > Furthermore, ignore_dl_rate_limit()'s usage of need_freq_update also leads
> > > > to a redundant frequency update, regardless of whether or not the driver
> > > > specifies CPUFREQ_NEED_UPDATE_LIMITS, when the next chosen frequency is the
> > > > same as the current one.
> > > > 
> > > > Fix the superfluous updates by only honoring CPUFREQ_NEED_UPDATE_LIMITS
> > > > when there's a policy limits change, and clearing need_freq_update when a
> > > > requisite redundant update occurs.
> > > > 
> > > > This is neatly achieved by moving up the CPUFREQ_NEED_UPDATE_LIMITS test
> > > > and instead setting need_freq_update to false in sugov_update_next_freq().
> > > > 
> > > > Signed-off-by: Sultan Alsawaf (unemployed) <sultan@kerneltoast.com>
> > > > ---
> > > >  kernel/sched/cpufreq_schedutil.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > > > index 28c77904ea74..e51d5ce730be 100644
> > > > --- a/kernel/sched/cpufreq_schedutil.c
> > > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
> > > >  
> > > >  	if (unlikely(sg_policy->limits_changed)) {
> > > >  		sg_policy->limits_changed = false;
> > > > -		sg_policy->need_freq_update = true;
> > > > +		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > >  		return true;
> > > >  	}
> > > >  
> > > > @@ -96,7 +96,7 @@ static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
> > > >  				   unsigned int next_freq)
> > > >  {
> > > >  	if (sg_policy->need_freq_update)
> > > > -		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > > +		sg_policy->need_freq_update = false;
> > > >  	else if (sg_policy->next_freq == next_freq)
> > > >  		return false;
> > > >  
> > > 
> > > This patch breaks cpufreq throttling (e.g. for thermal cooling) for
> > > cpufreq drivers that:
> > > 
> > >  - Have policy->fast_switch_enabled/fast_switch_possible set, but
> > >  - Do not have CPUFREQ_NEED_UPDATE_LIMITS flag set
> > > 
> > > There are several examples for this in the tree (search for
> > > "fast_switch_possible"). Of all those drivers, only intel-pstate and
> > > amd-pstate (sometimes) set CPUFREQ_NEED_UPDATE_LIMITS.
> > > 
> > > I can reliably reproduce this with scmi-cpufreq on a Qualcomm X1E
> > > laptop:
> > > 
> > >  1. I added some low temperature trip points in the device tree,
> > >     together with passive cpufreq cooling.
> > >  2. I run a CPU stress test on all CPUs and monitor the temperatures
> > >     and CPU frequencies.
> > > 
> > > When using "performance" governor instead of "schedutil", the CPU
> > > frequencies are being throttled as expected, as soon as the temperature
> > > trip points are reached.
> > > 
> > > When using "schedutil", the CPU frequencies stay at maximum as long as
> > > the stress test is running. No throttling happens, so the device heats
> > > up far beyond the defined temperature trip points. Throttling is applied
> > > only after stopping the stress test, since this forces schedutil to
> > > re-evaluate the CPU frequency.
> > > 
> > > Reverting this commit fixes the problem.
> > > 
> > > Looking at the code, I think the problem is that:
> > >  - sg_policy->limits_changed does not result in
> > >    sg->policy->need_freq_update without CPUFREQ_NEED_UPDATE_LIMITS
> > >    anymore, and
> > >  - Without sg->policy->need_freq_update, get_next_freq() skips calling
> > >    cpufreq_driver_resolve_freq(), which would normally apply the policy
> > >    min/max constraints.
> > > 
> > > Do we need to set CPUFREQ_NEED_UPDATE_LIMITS for all cpufreq drivers
> > > that set policy->fast_switch_possible? If I'm reading the documentation
> > > comment correctly, that flag is just supposed to enable notifications if
> > > the policy min/max changes, but the resolved target frequency is still
> > > the same. This is not the case here, the target frequency needs to be
> > > throttled, but schedutil isn't applying the new limits.
> > > 
> > > Any suggestions how to fix this? I'm happy to test patches with my
> > > setup.
> > 
> > Thank you for reporting this. As I see it, sg_policy->need_freq_update is
> > working correctly now; however, sg_policy->limits_changed relied on the broken
> > behavior of sg_policy->need_freq_update and therefore sg_policy->limits_changed
> > needs to be fixed.
> 
> Thanks for the quick reply and the patch!
> 
> > 
> > Can you try this patch:
> > 
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index 1a19d69b91ed3..f37b999854d52 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -82,7 +82,6 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
> >  		return false;
> >  
> >  	if (unlikely(sg_policy->limits_changed)) {
> > -		sg_policy->limits_changed = false;
> >  		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> >  		return true;
> >  	}
> > @@ -171,9 +170,11 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
> >  	freq = get_capacity_ref_freq(policy);
> >  	freq = map_util_freq(util, freq, max);
> >  
> > -	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> > +	if (freq == sg_policy->cached_raw_freq && !sg_policy->limits_changed &&
> > +	    !sg_policy->need_freq_update)
> >  		return sg_policy->next_freq;
> >  
> > +	sg_policy->limits_changed = false;
> >  	sg_policy->cached_raw_freq = freq;
> >  	return cpufreq_driver_resolve_freq(policy, freq);
> >  }
> > 
> 
> This is working correctly for me, CPU frequency is being throttled again
> when the temperature trip points are reached.

Great to hear, thanks for testing that so quickly!

> If you send this, feel free to add:
> 
> Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

I'll do Reported-and-tested-by if you don't mind. :-)

> 
> Thanks!
> Stephan

Thanks,
Sultan
