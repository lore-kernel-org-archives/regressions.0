Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B41494DB
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249798; cv=none; b=c9JC0uhFMle4mH+boRUN2zD98r/GY2HosRFufT+2u0yjRudb26YdoYTA3ZQludom6JtGsN5ev6532vQBoFbv9Pm+5OmN6KUftAzryFdO6yzotbWHDGkg7nw+FibZxn/7sTdivv4923qBZ5g7IEMg3doUTmWNm4vLvb9uRqg7exQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249798; c=relaxed/simple;
	bh=TRieDUtur6tqD7TIt0P1Qte9Dz0Gk6EhBPkKkaNJCY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUr06jejQ+g7dGhPrZNGgBhNujyW9htiVxUvlF/yOLV62OOIhR1GyBKDpE7qGKgh4CLpoWk8Dwc6HNtf6daWrA7uzQd3QeH/0krGdBQnkZW2G4nLogGKYZXmLAH9Pqp0Nx0vbL0jz6OlAH9Bpq/2RvYdJRUPB5eV0nlafktcM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2241053582dso3667775ad.1
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 18:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744249796; x=1744854596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7dWhYptZ9ctxRSNQwcxIzgQIhmZf3lcZn2X/1Zf550=;
        b=d96/z/+YM+o2oWdstoT2z+J/X9UhXCAZzYT1oCGmptxYd+00PDVftHMZf5VkyYcvg2
         dZ1EpiO2J4vl7WCx3q+Q6Ret47WTzR4PInfYP5tdBsjKPn6Vr4TO7UyDaDV+JEvn56Jv
         9U27WvjuwebZHlRRbgQWXF4m1VJJ8jt4RDrDZx0vapzJZF+7r5QOd3dMVD0cgOzHYZP1
         336gUfs6mPHr64zivsOVyMIzYtWtiKY536+Jh8eYf1tc+gRCqddSl3oNbBMt7rsx9La9
         8AS/lOVgg50CAcWTXPthA6I0XVTSujBisjPqENEMEQwUSXXJ9FlOIldNmZLxuSxlW3kX
         xHhg==
X-Forwarded-Encrypted: i=1; AJvYcCVvJNohFhc2uq1I1CGdYKovyKb+mg1WJt2YSJ6gd97Ybw2CS184ZnAnLvWPEMv5kAZINNrI624m1iUbVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeiG7130K+G7BAQr37DMvGl7Bf9tvmeoQGfrkzxU2OE9RGGUNg
	usJnLQCl/s/p+ZrOqdmSO5YrhJQ0xY/XFW7b0owMKCXU2At8yMm4
X-Gm-Gg: ASbGncsZ5zrb5d+z1MKscxpy9tuovg124KASKx3jNWcUpY9i8l8DWHRUjpfB+LpOh9Z
	3NEg1irTBYPHZpELw5e5H1PwZ7rfw4/yWfzhhVehJviDvCzaGyhZcQ+SahIvmHLfMaByu0Mwj/g
	oV3HtJf7ipGBMxYm/MgF3+2oVroLIM5AoDWi2JyTNh4YuAZzupqEdsVMWIYTbDtVNELo8JYa7RM
	bfrEG4EQC2JPlDwjC43Q6CuLUXqCBptANK9sEUG6ls/AM5fcIILqLDJJa0Zov5JCqHCysx+BSZs
	abgYcpqTpLSLjGt/l+s18eepqSVH6iy4ANA5B05nN5ImoJuJkNr9E+u8rs8OUTKTj/wHfg==
X-Google-Smtp-Source: AGHT+IGFOB2CKqiyD7Ajpyrvetj6hIb+Umrmi2qGvVFlK+1gaeRNXIHddC2nryxnGzRUIBjpb1oAAw==
X-Received: by 2002:a17:902:d48c:b0:21f:564:80a4 with SMTP id d9443c01a7336-22b42c43a84mr12676685ad.33.1744249795671;
        Wed, 09 Apr 2025 18:49:55 -0700 (PDT)
Received: from sultan-box.localdomain ([142.147.89.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm19118255ad.122.2025.04.09.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:49:55 -0700 (PDT)
Date: Wed, 9 Apr 2025 18:49:51 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
Message-ID: <Z_cjv0EJ45NShYOp@sultan-box.localdomain>
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com>
 <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>
 <Z_VTRspvmOUfrawh@linaro.org>
 <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
 <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>

On Wed, Apr 09, 2025 at 07:48:05PM +0800, Xuewen Yan wrote:
> Or can we modify it as follows?
> 
> -->8--
> 
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 1a19d69b91ed..0e8d3b92ffe7 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct
> sugov_policy *sg_policy, u64 time)
> 
>         if (unlikely(sg_policy->limits_changed)) {
>                 sg_policy->limits_changed = false;
> -               sg_policy->need_freq_update =
> cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> +               sg_policy->need_freq_update = true;
>                 return true;
>         }
> 
> @@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
> sugov_policy *sg_policy, u64 time)
>  static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
>                                    unsigned int next_freq)
>  {
> -       if (sg_policy->need_freq_update)
> +       if (sg_policy->need_freq_update) {
>                 sg_policy->need_freq_update = false;
> -       else if (sg_policy->next_freq == next_freq)
> -               return false;
> +               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS))
> +                       goto change;
> +       }
> 
> +       if (sg_policy->next_freq == next_freq)
> +               return false;
> +change:
>         sg_policy->next_freq = next_freq;
>         sg_policy->last_freq_update_time = time;

If CPUFREQ_NEED_UPDATE_LIMITS isn't specified, then there's no need to request a
frequency switch from the driver when the current frequency is exactly the same
as the next frequency.

Sultan
