Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56942142E7C
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130896; cv=none; b=FSwDUGs/clJs7ji+DytYHhssrYkLLxuJUfjW/l+um8X3IjW9XWgGt9FKvA951Sfl/00VZiVYjESqPN4INi/4/vvkRHZaWRmfmZvIM9AnK+RrEH6TPkf78WO4VDIXpWL/HHE5JMdzIcSYjzmUiddRXCO7Y1zZwoOZlNSJNQtbYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130896; c=relaxed/simple;
	bh=lTrymym2rrGYaqBy9yJd3cPCcu5Ep4WurEWujyQcWLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPd7x+tZeotTBsxMpDhmEL1Xl9nihY/HvJBB0z+4Jn3CXz5X2S8kR2KT6lxrofDc0Bobq4acmuSjPFNFjBbQrw25wDuLNBnqRBvA99KoUrLUB69KAlVMOp2zdKJv0UNadkHOYt34+arIf9Km4MAQworkT3cWtN/Rw+HAcQJNyb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lK4uKd4k; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lK4uKd4k"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so5455748f8f.2
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744130891; x=1744735691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TH69wZLBWd1Oynbh8Im74vg1R73prpWDquGK8HkahZ4=;
        b=lK4uKd4k2XChZbMWMV7XODOeOjU7gHy2NARm8b1kNiPq+mU7b/NqAKwCpFWviILWlY
         w8ZQdpt2hjIWP6qpOEoLAJeIJL3wmTaVdTUQEui/4j8EU+FcFQCNsOgnG65OuAIoEF02
         UjnP20R0vfcbsf7s/3VKlRzAiL1TWluWPUo2U9PYMVI4ewCI2APJkclIqzxiB2WiF7nj
         Pu9I1H6MSWSGkbzaG2pf0c3RcY5X2wSs4ilE1pl5H/FRrsSDQXFr5pux5DoG75g4EbF1
         9OU1UEKZJQpC0/YE76jDmQzTjBluOSuIfMGTUlxSicc7mHyn5ZzzK9ulC6D1hgdmdRf2
         OPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130891; x=1744735691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH69wZLBWd1Oynbh8Im74vg1R73prpWDquGK8HkahZ4=;
        b=I4lgqRJ3VohvZuZgy3IjQp195ExEbfveJzbVoNIc7qG/i57yhNSD19AOqrQM8RE+ot
         13zZC/zc5yybqcwOCItFS8tOt6faLHWtiy8R2sQzz57tbnIKL7WStzj7HgCCZLy0YWKp
         VXyZE6eslFsrVgd63vG6xeIvRp5JT3LLPV8X0Inb7sp4+4NTqApLXU4Z+vAvYScg87OI
         C76NYLnihI+weqnZmd5xQS6DkBxuiH6ZYYRuaNtInDabsfne9U5uoCdS8P7PgA8wX+0v
         MNx9/bcJCus0jZwMsHf02HjkCznOn0fTai9ix48yTjjiwrOZ173fcEUnwTF0i2zFE5+9
         18jw==
X-Forwarded-Encrypted: i=1; AJvYcCXaEOEUaILJMMxt3ZNT/SdjoKBCuQ+w4iEBHUvT+TKrO1IkN3g+9/JURBm/5HyJLotMmKtrEwRvk+7BDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJxZCNQROBdf6DQb2YI6WEIg55Gm6Ot7xqjE+qP3vvGBZ8te8C
	7bdymetK5NVnRKsDUJgV0rZinoy9A03nPIaGbcC/O3K/V9Y/fNkioB1GfQxI87k=
X-Gm-Gg: ASbGnctkuhiV9VtSEQVyg0rSgA2anXolFM7fMwiw2cJWRt5ddevX3qiyI0kDgo4wLG5
	4iRB5zig8ewFP+X1hfR/GAvytRQiMypMkoYJgd9x/KYzC+lx2bVMcmJzLM3lzCaMPJGK/61lwi6
	es4s7XZedg/Do5fGohkT47LXJ0yo33f6fg7EshkEkq+2mGCEIOBkcYU4538ppys/YUfmK/u8OpQ
	9+s6vcHzehhFI8strLfbnB0i9hyBcVb3/l8jUUQJDF4UtssNbOhuXycejTBap3kGgCMvN/yfqKp
	WL6EoaQCyHR6ux5/BrRIcwrUKcgoJDPBkHLbxXPgxuZxkkyZX1d9DRm7U1dI5OtqUA==
X-Google-Smtp-Source: AGHT+IHSzK+dGRzFBDxjG+Uj3o+//o2NWHxEIylC5K277J2t1PoewelaAf/YIHhbKuxuCTDG/s0cgQ==
X-Received: by 2002:a5d:5f48:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-39d6fc4930amr11405943f8f.17.1744130891381;
        Tue, 08 Apr 2025 09:48:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:49a4:221:16c1:a5bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm15531713f8f.12.2025.04.08.09.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:48:10 -0700 (PDT)
Date: Tue, 8 Apr 2025 18:48:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Sultan Alsawaf <sultan@kerneltoast.com>
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
Message-ID: <Z_VTRspvmOUfrawh@linaro.org>
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com>
 <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>

Hi Sultan,

On Tue, Apr 08, 2025 at 08:22:20AM -0700, Sultan Alsawaf wrote:
> On Tue, Apr 08, 2025 at 10:59:31AM +0200, Stephan Gerhold wrote:
> > On Wed, Dec 11, 2024 at 05:57:32PM -0800, Sultan Alsawaf wrote:
> > > From: "Sultan Alsawaf (unemployed)" <sultan@kerneltoast.com>
> > > 
> > > A redundant frequency update is only truly needed when there is a policy
> > > limits change with a driver that specifies CPUFREQ_NEED_UPDATE_LIMITS.
> > > 
> > > In spite of that, drivers specifying CPUFREQ_NEED_UPDATE_LIMITS receive a
> > > frequency update _all the time_, not just for a policy limits change,
> > > because need_freq_update is never cleared.
> > > 
> > > Furthermore, ignore_dl_rate_limit()'s usage of need_freq_update also leads
> > > to a redundant frequency update, regardless of whether or not the driver
> > > specifies CPUFREQ_NEED_UPDATE_LIMITS, when the next chosen frequency is the
> > > same as the current one.
> > > 
> > > Fix the superfluous updates by only honoring CPUFREQ_NEED_UPDATE_LIMITS
> > > when there's a policy limits change, and clearing need_freq_update when a
> > > requisite redundant update occurs.
> > > 
> > > This is neatly achieved by moving up the CPUFREQ_NEED_UPDATE_LIMITS test
> > > and instead setting need_freq_update to false in sugov_update_next_freq().
> > > 
> > > Signed-off-by: Sultan Alsawaf (unemployed) <sultan@kerneltoast.com>
> > > ---
> > >  kernel/sched/cpufreq_schedutil.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > > index 28c77904ea74..e51d5ce730be 100644
> > > --- a/kernel/sched/cpufreq_schedutil.c
> > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
> > >  
> > >  	if (unlikely(sg_policy->limits_changed)) {
> > >  		sg_policy->limits_changed = false;
> > > -		sg_policy->need_freq_update = true;
> > > +		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > >  		return true;
> > >  	}
> > >  
> > > @@ -96,7 +96,7 @@ static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
> > >  				   unsigned int next_freq)
> > >  {
> > >  	if (sg_policy->need_freq_update)
> > > -		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > +		sg_policy->need_freq_update = false;
> > >  	else if (sg_policy->next_freq == next_freq)
> > >  		return false;
> > >  
> > 
> > This patch breaks cpufreq throttling (e.g. for thermal cooling) for
> > cpufreq drivers that:
> > 
> >  - Have policy->fast_switch_enabled/fast_switch_possible set, but
> >  - Do not have CPUFREQ_NEED_UPDATE_LIMITS flag set
> > 
> > There are several examples for this in the tree (search for
> > "fast_switch_possible"). Of all those drivers, only intel-pstate and
> > amd-pstate (sometimes) set CPUFREQ_NEED_UPDATE_LIMITS.
> > 
> > I can reliably reproduce this with scmi-cpufreq on a Qualcomm X1E
> > laptop:
> > 
> >  1. I added some low temperature trip points in the device tree,
> >     together with passive cpufreq cooling.
> >  2. I run a CPU stress test on all CPUs and monitor the temperatures
> >     and CPU frequencies.
> > 
> > When using "performance" governor instead of "schedutil", the CPU
> > frequencies are being throttled as expected, as soon as the temperature
> > trip points are reached.
> > 
> > When using "schedutil", the CPU frequencies stay at maximum as long as
> > the stress test is running. No throttling happens, so the device heats
> > up far beyond the defined temperature trip points. Throttling is applied
> > only after stopping the stress test, since this forces schedutil to
> > re-evaluate the CPU frequency.
> > 
> > Reverting this commit fixes the problem.
> > 
> > Looking at the code, I think the problem is that:
> >  - sg_policy->limits_changed does not result in
> >    sg->policy->need_freq_update without CPUFREQ_NEED_UPDATE_LIMITS
> >    anymore, and
> >  - Without sg->policy->need_freq_update, get_next_freq() skips calling
> >    cpufreq_driver_resolve_freq(), which would normally apply the policy
> >    min/max constraints.
> > 
> > Do we need to set CPUFREQ_NEED_UPDATE_LIMITS for all cpufreq drivers
> > that set policy->fast_switch_possible? If I'm reading the documentation
> > comment correctly, that flag is just supposed to enable notifications if
> > the policy min/max changes, but the resolved target frequency is still
> > the same. This is not the case here, the target frequency needs to be
> > throttled, but schedutil isn't applying the new limits.
> > 
> > Any suggestions how to fix this? I'm happy to test patches with my
> > setup.
> 
> Thank you for reporting this. As I see it, sg_policy->need_freq_update is
> working correctly now; however, sg_policy->limits_changed relied on the broken
> behavior of sg_policy->need_freq_update and therefore sg_policy->limits_changed
> needs to be fixed.

Thanks for the quick reply and the patch!

> 
> Can you try this patch:
> 
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 1a19d69b91ed3..f37b999854d52 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -82,7 +82,6 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
>  		return false;
>  
>  	if (unlikely(sg_policy->limits_changed)) {
> -		sg_policy->limits_changed = false;
>  		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
>  		return true;
>  	}
> @@ -171,9 +170,11 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>  	freq = get_capacity_ref_freq(policy);
>  	freq = map_util_freq(util, freq, max);
>  
> -	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> +	if (freq == sg_policy->cached_raw_freq && !sg_policy->limits_changed &&
> +	    !sg_policy->need_freq_update)
>  		return sg_policy->next_freq;
>  
> +	sg_policy->limits_changed = false;
>  	sg_policy->cached_raw_freq = freq;
>  	return cpufreq_driver_resolve_freq(policy, freq);
>  }
> 

This is working correctly for me, CPU frequency is being throttled again
when the temperature trip points are reached. If you send this, feel
free to add:

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks!
Stephan
