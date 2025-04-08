Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80811C2324
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125747; cv=none; b=XoGek0VGAQiK3oifEmVneH9p5Ghoa9omMwtun2zSPkL3C3HVEHI8iqyjFbrm0g0zViGOqTDW8y7ULMSGe6FJQglaUPWtlOm7MWyOLFzUgiGum21vmHOggLGnb/FcgN0bPQEvnJOZ2YGHQSHoE8e9+qAXO3H1nAjSxn3caRtQAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125747; c=relaxed/simple;
	bh=Zd9NWY8CeLpfatz1dGJTJYTsqlKS4JB6NgIxmQhqYb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/X032tUHJFrM8X6LsU3IJriuQ1tWLBUik2yN6jbzIbnKfC0DJQQ4bMQ12x8w6JcP3ig/HoJcJDRrgZLe9GVzExcUs6iBX+1OE77ON14FwpdWuJsWi4G4R1LuI5hu1R3IVUXS/+N50lpjtFgRUBkHT4KlfMr0PlMFFCHst3Zd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22401f4d35aso64705435ad.2
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 08:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125745; x=1744730545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lm+t/vI8lVFf9WHLlENTbYY2NK46dgivCLq/xG2L0k=;
        b=uymVfxNy/y4i8JnaYXUvMBj8imDhQGRjQs2/FTTuzXfaTW+DZULiTAm9Mm2rdb64z0
         YaveXVsxz7EjlDu5G0hoIRn5DisRIaNx1x4Pofg4/WBESWLG5CJZ/xgBp5rtIkdHlYl1
         QfBD3xN9AVenR+8hBxLSKay/uIvYQeMvarGlBw1fy6ltTMo4k05DRsuqDw6FW8rl88ap
         CxoTB1rPZUDSZM0zBtJb0ca81H5UhODDHiU6qEx8UMvd7dgZRi1xgDxRtmXoGKlbiYuJ
         K1Ibeh7Cgus6Hf6eV87aNcBy8F1j/PFB/naZlP8UmOgh3qWhCWQKy1h3VLK/10FZNOgy
         EusA==
X-Forwarded-Encrypted: i=1; AJvYcCUwiQ2oHCXCvyq4JipPZy/V1qIU0zPQNQXozwpKJ/SbyYwEuNe2ekqcaityvPL0MmDWJc3iRtht6Zf1Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz11Nr1RPfVL+6o3at2aWhIhi+uUOkvTHtFEek/FK3WJDKEfOBo
	wKjsA12ZFYXhT6IMlkyuSxdbNCelDLEcAOpVgbos5fXyENIozRP/
X-Gm-Gg: ASbGncs1aoAhP6tlcBV7QrGYUXbESd5oted0iy4rcpEy6SjrCmT40GCcuQRlLbwxQJm
	NCj/RanKyT2zG6CFYdU6+IXxk94asgNrybkE6P+4GTBDWpyNZA1g6pTQfcGkq1jAhhELKoMD1Zn
	m4nPegXNokqYRnTB686OYhLs5NIxtQciRaMoBL3uzQurYRvmtBT0NXkeax/QUT8A0MLYgZARaBL
	zg38Yq7qSBc6OWDhfKAOGVej33m2HDH1eyd+jg50QQyVidYPmOzEbIzkIDAUVG4kxfE0hw6h1Z1
	pBrF4f4924lQUcsuxClMnkdLhhgXG1O7LncagH09nw0FReRBMZAu84LhGYU/N8eRpSJnozUdlw=
	=
X-Google-Smtp-Source: AGHT+IFinU7HdbOjTqhDEfAVUeUY/1h2L7SL99XFLsfwYhOW3YO5nfnKCUYKpUDfuOdjnSMmkDy6zA==
X-Received: by 2002:a17:902:e785:b0:224:1d1c:8837 with SMTP id d9443c01a7336-22a9552b138mr193548115ad.19.1744125745135;
        Tue, 08 Apr 2025 08:22:25 -0700 (PDT)
Received: from sultan-box.localdomain ([142.147.89.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865bdaesm101468625ad.111.2025.04.08.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:22:24 -0700 (PDT)
Date: Tue, 8 Apr 2025 08:22:20 -0700
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
Message-ID: <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com>
 <Z_Tlc6Qs-tYpxWYb@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Tlc6Qs-tYpxWYb@linaro.org>

Hi Stephan,

On Tue, Apr 08, 2025 at 10:59:31AM +0200, Stephan Gerhold wrote:
> Hi,
> 
> On Wed, Dec 11, 2024 at 05:57:32PM -0800, Sultan Alsawaf wrote:
> > From: "Sultan Alsawaf (unemployed)" <sultan@kerneltoast.com>
> > 
> > A redundant frequency update is only truly needed when there is a policy
> > limits change with a driver that specifies CPUFREQ_NEED_UPDATE_LIMITS.
> > 
> > In spite of that, drivers specifying CPUFREQ_NEED_UPDATE_LIMITS receive a
> > frequency update _all the time_, not just for a policy limits change,
> > because need_freq_update is never cleared.
> > 
> > Furthermore, ignore_dl_rate_limit()'s usage of need_freq_update also leads
> > to a redundant frequency update, regardless of whether or not the driver
> > specifies CPUFREQ_NEED_UPDATE_LIMITS, when the next chosen frequency is the
> > same as the current one.
> > 
> > Fix the superfluous updates by only honoring CPUFREQ_NEED_UPDATE_LIMITS
> > when there's a policy limits change, and clearing need_freq_update when a
> > requisite redundant update occurs.
> > 
> > This is neatly achieved by moving up the CPUFREQ_NEED_UPDATE_LIMITS test
> > and instead setting need_freq_update to false in sugov_update_next_freq().
> > 
> > Signed-off-by: Sultan Alsawaf (unemployed) <sultan@kerneltoast.com>
> > ---
> >  kernel/sched/cpufreq_schedutil.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index 28c77904ea74..e51d5ce730be 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
> >  
> >  	if (unlikely(sg_policy->limits_changed)) {
> >  		sg_policy->limits_changed = false;
> > -		sg_policy->need_freq_update = true;
> > +		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> >  		return true;
> >  	}
> >  
> > @@ -96,7 +96,7 @@ static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
> >  				   unsigned int next_freq)
> >  {
> >  	if (sg_policy->need_freq_update)
> > -		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > +		sg_policy->need_freq_update = false;
> >  	else if (sg_policy->next_freq == next_freq)
> >  		return false;
> >  
> 
> This patch breaks cpufreq throttling (e.g. for thermal cooling) for
> cpufreq drivers that:
> 
>  - Have policy->fast_switch_enabled/fast_switch_possible set, but
>  - Do not have CPUFREQ_NEED_UPDATE_LIMITS flag set
> 
> There are several examples for this in the tree (search for
> "fast_switch_possible"). Of all those drivers, only intel-pstate and
> amd-pstate (sometimes) set CPUFREQ_NEED_UPDATE_LIMITS.
> 
> I can reliably reproduce this with scmi-cpufreq on a Qualcomm X1E
> laptop:
> 
>  1. I added some low temperature trip points in the device tree,
>     together with passive cpufreq cooling.
>  2. I run a CPU stress test on all CPUs and monitor the temperatures
>     and CPU frequencies.
> 
> When using "performance" governor instead of "schedutil", the CPU
> frequencies are being throttled as expected, as soon as the temperature
> trip points are reached.
> 
> When using "schedutil", the CPU frequencies stay at maximum as long as
> the stress test is running. No throttling happens, so the device heats
> up far beyond the defined temperature trip points. Throttling is applied
> only after stopping the stress test, since this forces schedutil to
> re-evaluate the CPU frequency.
> 
> Reverting this commit fixes the problem.
> 
> Looking at the code, I think the problem is that:
>  - sg_policy->limits_changed does not result in
>    sg->policy->need_freq_update without CPUFREQ_NEED_UPDATE_LIMITS
>    anymore, and
>  - Without sg->policy->need_freq_update, get_next_freq() skips calling
>    cpufreq_driver_resolve_freq(), which would normally apply the policy
>    min/max constraints.
> 
> Do we need to set CPUFREQ_NEED_UPDATE_LIMITS for all cpufreq drivers
> that set policy->fast_switch_possible? If I'm reading the documentation
> comment correctly, that flag is just supposed to enable notifications if
> the policy min/max changes, but the resolved target frequency is still
> the same. This is not the case here, the target frequency needs to be
> throttled, but schedutil isn't applying the new limits.
> 
> Any suggestions how to fix this? I'm happy to test patches with my
> setup.

Thank you for reporting this. As I see it, sg_policy->need_freq_update is
working correctly now; however, sg_policy->limits_changed relied on the broken
behavior of sg_policy->need_freq_update and therefore sg_policy->limits_changed
needs to be fixed.

Can you try this patch:

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 1a19d69b91ed3..f37b999854d52 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -82,7 +82,6 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
 		return false;
 
 	if (unlikely(sg_policy->limits_changed)) {
-		sg_policy->limits_changed = false;
 		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
 		return true;
 	}
@@ -171,9 +170,11 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 	freq = get_capacity_ref_freq(policy);
 	freq = map_util_freq(util, freq, max);
 
-	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
+	if (freq == sg_policy->cached_raw_freq && !sg_policy->limits_changed &&
+	    !sg_policy->need_freq_update)
 		return sg_policy->next_freq;
 
+	sg_policy->limits_changed = false;
 	sg_policy->cached_raw_freq = freq;
 	return cpufreq_driver_resolve_freq(policy, freq);
 }


> 
> Thanks,
> Stephan
> 
> #regzbot introduced: 8e461a1cb43d69d2fc8a97e61916dce571e6bb31

Thanks,
Sultan
