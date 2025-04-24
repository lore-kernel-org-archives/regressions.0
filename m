Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E027B4F8
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511707; cv=none; b=QTqUvN4c53haPt3DT0TvYYtSl47lJ8E77EGK6FIaBgRuSzahd62RtiMt7jORTp5NOZR7LNiW3dAxIXQsGLpVfpJ2kC18Y4SUhVXz4Bi7TcPG5LzsBlUp0xovHF8megbZcPG4Cu89mkXZOjclE6yCG3KIt2OMKsM6AVg1POhHVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511707; c=relaxed/simple;
	bh=N1LvDqlaHJwix0L58K+uG0murbc8Z9oJ6R1h7Z2kM1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzHEu1o35eEQaw8nVOdNnLbpb7EkJNlVK+s7gQnMiLbicigzgidalT4PfEZjPLIg1b8m3nK5R1jf9VTBOzoDgHiX6cb9Rxx777OGsXWl4r8eeSbkwBaSFlCI6Yx6HVlW5OPFo9kX/NEWbsWQ/iaL1MCiiRRiM8uwskOvz+zcO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iqLV59mH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqLV59mH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3b12e8518so226112466b.0
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511701; x=1746116501; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhyruI8H4WvEtqRFSbUpsDUEBq04DUJcZn9mG7FKACg=;
        b=iqLV59mHKg9TfoRaIlpCXTb4zx5O19w4QEyLAGY04DR+YIrAdOcEbBLEGh8rUC8uhB
         ht9Qq1X2iO2gJFA4J8b9ozpC4d5obzBFogaLHOOD1TFkiOaa3r7ZUO6kAFFcUJLfGZYo
         REWUYjoqCtlR0ZUR+24ChYR18M/9nWdfEs660Bwkvz/f6n3xLBhSMtVQ2Y4efzsXHXJr
         IfNc6fJOnf412MqM4ioHpQRmYAWldeKo2IFPwEn/iIMpebbSnfBQL58iYqVej0JK8+2N
         wKm6+Fa0N88w0QDwtvjhV4s8NPX/Xy5tEHaJbQpIkxIgJy7o5KPF61MW6usb0eB6nXg8
         J0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511701; x=1746116501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhyruI8H4WvEtqRFSbUpsDUEBq04DUJcZn9mG7FKACg=;
        b=XWVHK1Wo3Q+Y7TZ+oQa/YcbGUFSQMtZXVKF2cDcHguuGfiQ7GSQpVKP20Bb7uw5R/4
         VT1Jc0A2ovk9cn3NmPi2xETWSbrvGaAtW5v7NMPGeJKD6vW5D8JvCMIu2iT82KpH1HeC
         3mSPeY4bO7ShUeGDDNFG84tZpf3xg9bFu96mgPunZV1eBFGOV7Epo1MdW9t7V22+VgQB
         SRIvhrslIjj6/07Ced3iKg7Yn1+1iS6o/eUVhOOKdgTlyBp3poKOBaXlPqwv8iNUcMnj
         tWUEN2s4T+9JE0N8IfPNN3SmCkxjPqdyMlAIpcFeNEPQPKcQt6VQDZT27gZppvzs2BVP
         oW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDfccvp1BYZ65U4WPw67h0PGrTBzwKlOAcqqGEQ3LHb8Zmi5E3Y/f+LMalY16w/7DZvqc5SB3DO9lCog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyaf7hQdGYODvNtHmBz1ju2EO+g5vI1h4//CCG/AoLSeugoKALG
	xEFsjlm3OH9bzeYMdAYhBduURXTKDvUdt3G3plwh/bYQFgbOENon5p+F0kO5Yug=
X-Gm-Gg: ASbGncvx7OLZb4sjMwkJDVAtLtnf/nTFljCEhv5lw/rZt5dcG1GOOziaNtKKJuEZPXc
	52jQUFLmbwiAoXeuuCJyd9cHwJ4wqAOc5nBmzoEeSberJYMIS+WPUbtY/IgVfgcFXqCWjqIVrbM
	7lwLTdNLLBBCJwPrXv4qupQv9rkNdQztUxKDMCj40AygXDYAzKZSSjrUfJ7Cn+N4vYgIFPmyk0m
	USp8qsXAHkCjx5nvbC88B8PONY0OkBGro3uYcb6+P1kKFu+EPgJH0zR8vkxTzAmIqXCgJL6sn7n
	oZh5QPBaTJ+YLhBCN7SbwzZW/kwiGNI4J07gb9882/QvDmWVBg==
X-Google-Smtp-Source: AGHT+IFBuPsFqWBVaxD0NkHLCf/0KgIji9RD8TCmgZElYimVI+psaaD+Mb0B6Zu0J/2A0rbOBZFv6w==
X-Received: by 2002:a17:907:2ce4:b0:ac7:391b:e688 with SMTP id a640c23a62f3a-ace6b5daee9mr20560566b.58.1745511701167;
        Thu, 24 Apr 2025 09:21:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d677:e5de:3a6:836])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c25b01sm127421666b.129.2025.04.24.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:21:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:21:36 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, regressions@lists.linux.dev,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3] cpufreq: Avoid using inconsistent policy->min and
 policy->max
Message-ID: <aAplED3IA_J0eZN0@linaro.org>
References: <5907080.DvuYhMxLoT@rjwysocki.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5907080.DvuYhMxLoT@rjwysocki.net>

Hi Rafael,

On Wed, Apr 16, 2025 at 04:12:37PM +0200, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since cpufreq_driver_resolve_freq() can run in parallel with
> cpufreq_set_policy() and there is no synchronization between them,
> the former may access policy->min and policy->max while the latter
> is updating them and it may see intermediate values of them due
> to the way the update is carried out.  Also the compiler is free
> to apply any optimizations it wants both to the stores in
> cpufreq_set_policy() and to the loads in cpufreq_driver_resolve_freq()
> which may result in additional inconsistencies.
> 
> To address this, use WRITE_ONCE() when updating policy->min and
> policy->max in cpufreq_set_policy() and use READ_ONCE() for reading
> them in cpufreq_driver_resolve_freq().  Moreover, rearrange the update
> in cpufreq_set_policy() to avoid storing intermediate values in
> policy->min and policy->max with the help of the observation that
> their new values are expected to be properly ordered upfront.
> 
> Also modify cpufreq_driver_resolve_freq() to take the possible reverse
> ordering of policy->min and policy->max, which may happen depending on
> the ordering of operations when this function and cpufreq_set_policy()
> run concurrently, into account by always honoring the max when it
> turns out to be less than the min (in case it comes from thermal
> throttling or similar).
> 
> Fixes: 151717690694 ("cpufreq: Make policy min/max hard requirements")
> Cc: 5.16+ <stable@vger.kernel.org> # 5.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
> 
> This replaces the last 3 patches in
> 
> https://lore.kernel.org/linux-pm/6171293.lOV4Wx5bFT@rjwysocki.net/
> 
> v2 -> v3:
>    * Fold 3 patches into one.
>    * Drop an unrelated white space fixup change.
>    * Fix a typo in a comment (Christian).
> 
> v1 -> v2: Cosmetic changes
> 
> ---
>  drivers/cpufreq/cpufreq.c |   32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -495,8 +495,6 @@
>  {
>  	unsigned int idx;
>  
> -	target_freq = clamp_val(target_freq, policy->min, policy->max);
> -
>  	if (!policy->freq_table)
>  		return target_freq;
>  
> @@ -520,7 +518,22 @@
>  unsigned int cpufreq_driver_resolve_freq(struct cpufreq_policy *policy,
>  					 unsigned int target_freq)
>  {
> -	return __resolve_freq(policy, target_freq, CPUFREQ_RELATION_LE);
> +	unsigned int min = READ_ONCE(policy->min);
> +	unsigned int max = READ_ONCE(policy->max);
> +
> +	/*
> +	 * If this function runs in parallel with cpufreq_set_policy(), it may
> +	 * read policy->min before the update and policy->max after the update
> +	 * or the other way around, so there is no ordering guarantee.
> +	 *
> +	 * Resolve this by always honoring the max (in case it comes from
> +	 * thermal throttling or similar).
> +	 */
> +	if (unlikely(min > max))
> +		min = max;
> +
> +	return __resolve_freq(policy, clamp_val(target_freq, min, max),
> +			      CPUFREQ_RELATION_LE);
>  }
>  EXPORT_SYMBOL_GPL(cpufreq_driver_resolve_freq);
>  
> @@ -2338,6 +2351,7 @@
>  	if (cpufreq_disabled())
>  		return -ENODEV;
>  
> +	target_freq = clamp_val(target_freq, policy->min, policy->max);
>  	target_freq = __resolve_freq(policy, target_freq, relation);
>  
>  	pr_debug("target for CPU %u: %u kHz, relation %u, requested %u kHz\n",
> @@ -2631,11 +2645,15 @@
>  	 * Resolve policy min/max to available frequencies. It ensures
>  	 * no frequency resolution will neither overshoot the requested maximum
>  	 * nor undershoot the requested minimum.
> +	 *
> +	 * Avoid storing intermediate values in policy->max or policy->min and
> +	 * compiler optimizations around them because they may be accessed
> +	 * concurrently by cpufreq_driver_resolve_freq() during the update.
>  	 */
> -	policy->min = new_data.min;
> -	policy->max = new_data.max;
> -	policy->min = __resolve_freq(policy, policy->min, CPUFREQ_RELATION_L);
> -	policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
> +	WRITE_ONCE(policy->max, __resolve_freq(policy, new_data.max, CPUFREQ_RELATION_H));
> +	new_data.min = __resolve_freq(policy, new_data.min, CPUFREQ_RELATION_L);
> +	WRITE_ONCE(policy->min, new_data.min > policy->max ? policy->max : new_data.min);

I've tested the cpufreq throttling again in 6.15-rc3 to check your fix
for the schedutil CPUFREQ_NEED_UPDATE_LIMITS regression I reported [1].
The CPU frequency is now being throttled correctly when reaching high
temperatures. Thanks for fixing this!

Unfortunately, the opposite case has now regressed with this patch:
After the CPU frequency has been throttled due to high temperature and
the device cools down again, the CPU frequency is stuck at minimum until
you reboot. policy->max will never restore to the maximum frequency.

I've confirmed that this causes unexpected slowness after temperature
throttling on a Qualcomm X1E laptop, and Johan has confirmed that e.g.
the ThinkPad X13s is also affected. I would expect that most devices
using cpufreq cooling in the kernel are affected.

Looking at the code, I think the problem is that __resolve_freq() ->
cpufreq_frequency_table_target() -> cpufreq_table_find_index*() and
cpufreq_is_in_limits() are still using the old policy->min/max value.
In this patch, you have only moved the clamp_val() usage directly in
__resolve_freq().

You can see this in the following debug log. I started a stress test
that increases the device temperature until the CPU frequency was
throttled to minimum. Then I stopped the stress test, the device cooled
down, cpufreq_set_policy() was called with the new max frequency, but
__resolve_freq() still returned the frequency clamped to the old maximum.

  [  149.959693] cpufreq: handle_update for cpu 0 called
  [  149.964782] cpufreq: updating policy for CPU 0
  [  149.969411] cpufreq: setting new policy for CPU 0: 0 - 3206400 kHz
  [  149.975842] cpufreq: new min and max freqs are 710400 - 3206400 kHz
  [  149.982347] cpufreq: governor limits update
  [  149.986715] cpufreq: cpufreq_governor_limits: for CPU 0
  [...]
  [  161.219209] cpufreq: handle_update for cpu 0 called
  [  161.224291] cpufreq: updating policy for CPU 0
  [  161.228927] cpufreq: setting new policy for CPU 0: 0 - 710400 kHz
  [  161.235238] cpufreq: new min and max freqs are 710400 - 710400 kHz
  [  161.241635] cpufreq: governor limits update
  [  161.245989] cpufreq: cpufreq_governor_limits: for CPU 0
  [  221.253253] cpufreq: handle_update for cpu 0 called
  [  221.258322] cpufreq: updating policy for CPU 0
  [  221.262946] cpufreq: setting new policy for CPU 0: 0 - 3417600 kHz
  [  221.269418] cpufreq: new min and max freqs are 710400 - 710400 kHz
                 ^ here the new maximum is not being applied
  [  221.275839] cpufreq: governor limits update
  [  221.280195] cpufreq: cpufreq_governor_limits: for CPU 0

Any thoughts how to fix this properly?

Please Cc me if you send a patch with the fix. The Reported-by: tag from
me on the fix for the CPUFREQ_NEED_UPDATE_LIMITS problem didn't Cc me
when sending for some reason, so I only learned about your fix when Greg
sent out the stable backports yesterday. :-)

Thanks,
Stephan

[1]: https://lore.kernel.org/lkml/Z_Tlc6Qs-tYpxWYb@linaro.org/

#regzbot introduced: 7491cdf46b5cbdf123fc84fbe0a07e9e3d7b7620
