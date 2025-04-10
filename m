Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C336A33B
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 02:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252425; cv=none; b=j8dTlSHN8hb3twGTGcZBj9mFEct396AcrGTiUQwUOdcqzY3rXPREqpcPJTbXXu9Z+Bb2LZtD4eqdj3JLBq5HOAQRc3w5X7fLmjDJ5bE4nifr6ULtIUnEqb/3sjoQi1gc3PGkss5fVGlznrkMFezMiq81r6WSC3OHENygInWwTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252425; c=relaxed/simple;
	bh=VZ8k/enWyBcu8alYtN9L7N0dxunZbZpvMLdnichYWg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyLW7R4Z+5J7rvV65uHNeyFbSv2/qCaMVhRffEGuln6pNH2x7w74fYn0hoNi6AaOJTBZaZ9O9V2fO/cEV10bAjz2ghLV3EgmCDQ0aMHsY83Ox/dpYzYkaL4Ic7V7sD3AoTz77ePQTVsgIbNUwdpd099TVsPS0N3wkY3TumZ0c+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225df540edcso15083565ad.0
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 19:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744252423; x=1744857223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/IllHKM0oPJ3pBiL3ZERbu3XrJNSX388MQELDIUdTk=;
        b=a6VfV9T876nOR9+yoMwXy6nUXNYzqXNIofGz0CdaJSYc2G5F1k5vJwQqag1/b5z51P
         0OANTOf4iiEOo2fILYBFX5OI2AbCSA/ninV/wvFyaDRhz64DzDBd5FmkD5w12gZoZpXX
         8NoFc2kxFj4031vnEjrW6CkytMy4Kr3BC3L9/lkmHDhPa/pZqDPu7ffytCO1GXGznCuI
         +T56nlmN1CfN/YG3zkPrHfcwdr6UvAjDCKYU0SrZfKaCebqs3HfMpjteMOxQUHzFcRYU
         IWzNBMzy6yfz6o026u8DkAD0xyXAWp4pzl2rvZKpnc+OSbC91tnnA+M3JjOTgJRVaxYe
         kMNg==
X-Forwarded-Encrypted: i=1; AJvYcCWDFXeCzkTMCkX1Non4gd7QfWKEy7NR0R18K6zj3j6BjOpt/pbHMtimqWx/9LxNuioJ3aNZfoZg8qgKKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvEg+JWBlKW5T/a0xac30cyzMGq0TD9+8lTvdSfnCmT4TwVNvx
	IqHhCTmw1VVc27se+x7e8RmO6SvrntgvFZp3eXEBT8q13g73Pk7x
X-Gm-Gg: ASbGncsi6t7AhXi1Bw4GE4Ihb7rcAnDZphQ8X+D0Mxzi70ba5gSRRuWYNSNiqpOXsOk
	12MqR+pvOB4T75JC858fuot9p85bXQZGW70Py1Gq3qkgI92m6zezMwR1AW/B+09WDqVn6o0+WTG
	rR4D5fwm0kmwoQP+7lyKluURStMd+UHBGUx007LY/Bb4eQeTmsxPiBrpAN0O0BTYRjzszwRoLXM
	GIFd9nbAY8d6RFFDpk6YFVPAdK8BR4RlmYeFHirVDnA2tiUxobC3susWg3oEqdDweGUbWTGKA1B
	JmSBSWPknkELCDt/suBGfdty55YLw+Buyh6Pch6LT+OvgBga2yX5TGrYnyI=
X-Google-Smtp-Source: AGHT+IHmohfIX1pwBTdRS96rbF1fkkhDJo9mRFoUMxjxNoxly1b+XtVF34/7CT0NB4AOEMebJW0Ngg==
X-Received: by 2002:a17:902:ef02:b0:215:58be:3349 with SMTP id d9443c01a7336-22b8fd48490mr17868225ad.14.1744252423220;
        Wed, 09 Apr 2025 19:33:43 -0700 (PDT)
Received: from sultan-box.localdomain ([142.147.89.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62973sm19640775ad.24.2025.04.09.19.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:33:42 -0700 (PDT)
Date: Wed, 9 Apr 2025 19:33:39 -0700
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
Message-ID: <Z_cuA3lcewKhj4Rz@sultan-box.localdomain>
References: <Z_U_LN0AtH_n4YtE@sultan-box.localdomain>
 <Z_VTRspvmOUfrawh@linaro.org>
 <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
 <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>
 <Z_cjv0EJ45NShYOp@sultan-box.localdomain>
 <CAB8ipk8WOh5_XvRYJrPi6b6wf8G4=zjoFRWpXk3viv3gkHCn1g@mail.gmail.com>
 <Z_coNmh-CabcfIWD@sultan-box.localdomain>
 <CAB8ipk8AAFFtV3OA4S=g9X9AXsC4Ntr911DLLRkhgQtvMvXAvg@mail.gmail.com>
 <Z_cracmQRfB8hF06@sultan-box.localdomain>
 <CAB8ipk9FdC2X78B4sAnne5=ZS=ZrhZdUKYREEZZk7RQLH8LAwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB8ipk9FdC2X78B4sAnne5=ZS=ZrhZdUKYREEZZk7RQLH8LAwA@mail.gmail.com>

On Thu, Apr 10, 2025 at 10:30:45AM +0800, Xuewen Yan wrote:
> On Thu, Apr 10, 2025 at 10:22 AM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> >
> > On Thu, Apr 10, 2025 at 10:13:04AM +0800, Xuewen Yan wrote:
> > > On Thu, Apr 10, 2025 at 10:09 AM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> > > >
> > > > On Thu, Apr 10, 2025 at 10:06:41AM +0800, Xuewen Yan wrote:
> > > > > On Thu, Apr 10, 2025 at 9:49 AM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> > > > > >
> > > > > > On Wed, Apr 09, 2025 at 07:48:05PM +0800, Xuewen Yan wrote:
> > > > > > > Or can we modify it as follows?
> > > > > > >
> > > > > > > -->8--
> > > > > > >
> > > > > > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > > > > > > index 1a19d69b91ed..0e8d3b92ffe7 100644
> > > > > > > --- a/kernel/sched/cpufreq_schedutil.c
> > > > > > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > > > > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct
> > > > > > > sugov_policy *sg_policy, u64 time)
> > > > > > >
> > > > > > >         if (unlikely(sg_policy->limits_changed)) {
> > > > > > >                 sg_policy->limits_changed = false;
> > > > > > > -               sg_policy->need_freq_update =
> > > > > > > cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > > > > > +               sg_policy->need_freq_update = true;
> > > > > > >                 return true;
> > > > > > >         }
> > > > > > >
> > > > > > > @@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
> > > > > > > sugov_policy *sg_policy, u64 time)
> > > > > > >  static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
> > > > > > >                                    unsigned int next_freq)
> > > > > > >  {
> > > > > > > -       if (sg_policy->need_freq_update)
> > > > > > > +       if (sg_policy->need_freq_update) {
> > > > > > >                 sg_policy->need_freq_update = false;
> > > > > > > -       else if (sg_policy->next_freq == next_freq)
> > > > > > > -               return false;
> > > > > > > +               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS))
> > > > > > > +                       goto change;
> > > > > > > +       }
> > > > > > >
> > > > > > > +       if (sg_policy->next_freq == next_freq)
> > > > > > > +               return false;
> 
> I have deleted the else.

Yes, but your change causes a regression by recreating part of the problem
solved in 8e461a1cb43d6 ("cpufreq: schedutil: Fix superfluous updates caused by
need_freq_update").

Sultan
