Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC5D222589
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102782; cv=none; b=djWvVTvc06Ljs4g1j07y4SNouqHn0m0nn15ASyY6CYiBX7Yf2VF91iyLdJCgqYyfGGY4S+eEf8ZntcvisHUz24dMas0vjh7WSywxFQIWye665JCsYomonPVbdZrnsziyPsCxCZavV/rqnJPM/8AZu5mLoPXXWNh3a+yIpHxwiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102782; c=relaxed/simple;
	bh=9GDIO++JNka8swO6s9giWNyq+Tl4y4O2HaqtgHOSTTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gm5L7XKuzKWD6Okn/pVm6CSspKX8knOLzIWnDV1feWAhBQ2aRXBGxC6OYRxtmAySfZjcjKyVsZdS/eKc393XPjHHrGb+6t42YVCaQg68t7DIjDk8SxCfA/U19Fgrj4kOnUkn8kssD4AZd1Wi2iA2fvIQgxOl93DgtDG47EOBje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGYbjRbq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGYbjRbq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so30193345e9.3
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744102778; x=1744707578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UW5UEBIC2fvLgEE7aqaeWlqxDj1Xfvs+TW5wbP5DlME=;
        b=zGYbjRbqzyquY4XlStH43npBhSSAt7AX1VcWYWBZNNw7adX61WXvhSrIo0/wo4R7L7
         G4dGegg57OnpVmNFGHswTMvRrCYs1+W8bcdgGiu4cKERjB0bXj9k6O3NFVo3/IlX4+xy
         LLjbAhuiZNVRjdTmYMPpXogC1aesbrmVYlFCL4o0r81EXPA6eFtBgliob+r6bAqDh+8A
         YT7i3qlhBklkvJsISZZFmvsYvaG3rDbhrrghWou0y87eaOmL9BanGf0Fy0Xi9xdyBNUB
         wk2r/jceRTd0dN4WV8JtfT9pdTv5th4Ux39REwh2JIF7iHZ9gtaR4HFkea/zBrtXOWI/
         2qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102778; x=1744707578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW5UEBIC2fvLgEE7aqaeWlqxDj1Xfvs+TW5wbP5DlME=;
        b=Z2C1SsjCp8p8tHTux3gV3LoUfnI/7l1DKGAWs0P3W26doscqQzof0go15aYnFq9oVv
         3sJsMt7LHT4ooaFB45pyZ5U+Khfdw9AuzHL7mZr4rqqDRYI6Y73IcciQ0ryBkxMlSZn0
         /RvX6PZAVwuX3xu3lTiJdNCXV7T0n+e0f+y3XAZvKlZB/3vwuwC95iW0e+Obh7ppWsMq
         64R6L1qDTNlIeBkUe3+ysTwtejjsMqBLFYDOmv1+CsAul68LTzsGa6Lc4nCmGilyYW/t
         L91lywkexco5myRcR0thaODJ7zV12E9T6BoXxJYzUJGON34X0daq7WcGQLU+kGKboOe3
         bQxg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ25xDSIEryaKFVQYMtGI9NCLh7irjA4ZaOlBjnifDk5f/e5+aSvUXxihD1gtOGM3N92E0jgImwig44w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpS1bV+rMP8MzR1o9LasucOqQnQvsHw+aLIrvyv2OhqAgKgxLd
	vs7J7mEP020Bdj0doYeHlBld0xjySjWrxwU9DX6wvKYpSDQe9SS1L6w0HgGu6bE=
X-Gm-Gg: ASbGncv8evgcDwew89vrdOfeGNroV3LaK7G2zpFW5nZmo70HNYhg1iENcuHalNzqaYh
	p+qYOhY+DeG/vMevFVIW+8suP30/5Z26Ek0MooWxdqtQ7JwQd1HDyRf9gCLGLASfWvSqPnRc53+
	3jkqFifznssQulD4OTwud+A510mbJ/kdTq+i5xWHS0AyuMKXstT1ieuHRrePdt8RUsQpIQnLaV+
	tvxssDG91XVgzB+7yHBYt88TfAv2FQILbiRbPqhAdoXZKqif1u7O6gXSuU3Vf9kaIOGSY9zQgEV
	41hMBnhVzz+sgxlm1Cyvv07osFtjobXDwkgqRRvT3w93+YihZc9zLzM=
X-Google-Smtp-Source: AGHT+IHEfD0DEw0nhPMBkT/vzIF8/zOBJoBPD+hGdZb0j1wbN2G+PRbTcfFssvpUFnD8uApO8cUzMQ==
X-Received: by 2002:a05:600c:1e23:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ecf81c304mr140398715e9.5.1744102777838;
        Tue, 08 Apr 2025 01:59:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:5d6b:d01c:7ee:e98f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b8a3sm156634925e9.19.2025.04.08.01.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:59:36 -0700 (PDT)
Date: Tue, 8 Apr 2025 10:59:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Sultan Alsawaf <sultan@kerneltoast.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <Z_Tlc6Qs-tYpxWYb@linaro.org>
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212015734.41241-2-sultan@kerneltoast.com>

Hi,

On Wed, Dec 11, 2024 at 05:57:32PM -0800, Sultan Alsawaf wrote:
> From: "Sultan Alsawaf (unemployed)" <sultan@kerneltoast.com>
> 
> A redundant frequency update is only truly needed when there is a policy
> limits change with a driver that specifies CPUFREQ_NEED_UPDATE_LIMITS.
> 
> In spite of that, drivers specifying CPUFREQ_NEED_UPDATE_LIMITS receive a
> frequency update _all the time_, not just for a policy limits change,
> because need_freq_update is never cleared.
> 
> Furthermore, ignore_dl_rate_limit()'s usage of need_freq_update also leads
> to a redundant frequency update, regardless of whether or not the driver
> specifies CPUFREQ_NEED_UPDATE_LIMITS, when the next chosen frequency is the
> same as the current one.
> 
> Fix the superfluous updates by only honoring CPUFREQ_NEED_UPDATE_LIMITS
> when there's a policy limits change, and clearing need_freq_update when a
> requisite redundant update occurs.
> 
> This is neatly achieved by moving up the CPUFREQ_NEED_UPDATE_LIMITS test
> and instead setting need_freq_update to false in sugov_update_next_freq().
> 
> Signed-off-by: Sultan Alsawaf (unemployed) <sultan@kerneltoast.com>
> ---
>  kernel/sched/cpufreq_schedutil.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 28c77904ea74..e51d5ce730be 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct sugov_policy *sg_policy, u64 time)
>  
>  	if (unlikely(sg_policy->limits_changed)) {
>  		sg_policy->limits_changed = false;
> -		sg_policy->need_freq_update = true;
> +		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
>  		return true;
>  	}
>  
> @@ -96,7 +96,7 @@ static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
>  				   unsigned int next_freq)
>  {
>  	if (sg_policy->need_freq_update)
> -		sg_policy->need_freq_update = cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> +		sg_policy->need_freq_update = false;
>  	else if (sg_policy->next_freq == next_freq)
>  		return false;
>  

This patch breaks cpufreq throttling (e.g. for thermal cooling) for
cpufreq drivers that:

 - Have policy->fast_switch_enabled/fast_switch_possible set, but
 - Do not have CPUFREQ_NEED_UPDATE_LIMITS flag set

There are several examples for this in the tree (search for
"fast_switch_possible"). Of all those drivers, only intel-pstate and
amd-pstate (sometimes) set CPUFREQ_NEED_UPDATE_LIMITS.

I can reliably reproduce this with scmi-cpufreq on a Qualcomm X1E
laptop:

 1. I added some low temperature trip points in the device tree,
    together with passive cpufreq cooling.
 2. I run a CPU stress test on all CPUs and monitor the temperatures
    and CPU frequencies.

When using "performance" governor instead of "schedutil", the CPU
frequencies are being throttled as expected, as soon as the temperature
trip points are reached.

When using "schedutil", the CPU frequencies stay at maximum as long as
the stress test is running. No throttling happens, so the device heats
up far beyond the defined temperature trip points. Throttling is applied
only after stopping the stress test, since this forces schedutil to
re-evaluate the CPU frequency.

Reverting this commit fixes the problem.

Looking at the code, I think the problem is that:
 - sg_policy->limits_changed does not result in
   sg->policy->need_freq_update without CPUFREQ_NEED_UPDATE_LIMITS
   anymore, and
 - Without sg->policy->need_freq_update, get_next_freq() skips calling
   cpufreq_driver_resolve_freq(), which would normally apply the policy
   min/max constraints.

Do we need to set CPUFREQ_NEED_UPDATE_LIMITS for all cpufreq drivers
that set policy->fast_switch_possible? If I'm reading the documentation
comment correctly, that flag is just supposed to enable notifications if
the policy min/max changes, but the resolved target frequency is still
the same. This is not the case here, the target frequency needs to be
throttled, but schedutil isn't applying the new limits.

Any suggestions how to fix this? I'm happy to test patches with my
setup.

Thanks,
Stephan

#regzbot introduced: 8e461a1cb43d69d2fc8a97e61916dce571e6bb31
