Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2925A2C6
	for <regressions@lists.linux.dev>; Mon,  5 May 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457864; cv=none; b=Vrg+w3GlL9zBqaWTmhN8uHkuFZO4FNJYwGT9hcsV505hUzkbIPFgEwcKFryYI6kGuIy2J9TaLrgYOAj1brj0rKN4RCJF8JujVtWjuepZnL4XcGT0+SS6f2XNmNQdNDFTnwAQPcL0Ga+TREKXon0NIyTy6rV5FLeTlA91DZRYSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457864; c=relaxed/simple;
	bh=pBSU+i+mpQmbCxqb+l45MEZnOucbUsIa1Ybw9DczQzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kz5j8z6AwYCh2/OKxc0+YntqGpLo66rD58g3fu/SYlkCHp8Nh88GNAc17oS3nMLrJYfkCrdLlwWfn75ay1UNJMpBYCBlULHbKsbFevRgKY0YbvFi5Fm1iO8KqR2XhdNkFDnt/ngib57+XNEQVW+YmhZO0d75QU5Vy8v47N2Vf3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnDO+rUB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnDO+rUB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acbb48bad09so838806066b.0
        for <regressions@lists.linux.dev>; Mon, 05 May 2025 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746457861; x=1747062661; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9wML/xLpYYqfIBMOeUqyFoxTmu2U5NAGM6uMVztntg=;
        b=ZnDO+rUBrgKPRUypxugYTiYqEs71XVcGoLvjU5zeReCNM8d1ioziRjzb9qEGf21HfV
         MTC54UoFUE7j5kG5FrJU4eBgSwxtFpsfolsJ58ilI9MMlQxL0PmxYguv0hPnR31K8eoG
         AVXcBMeGQjuJeBPyzPDPMvRjDWQIeDIekC/fmZLcPPIzsYVc25QF/G2kcRc5kjY/FcBB
         jJ0LCPhLB7YGA5Nr+ZdjzC89jImC9HagxiUmsTQvgI8XkoZo5n/bWGB6HnU+JnPetbIW
         h5fyHp0vonDg0H4f9E5CUBpweywH30MdhbDjkIfZxaudOVYf8dV641WjD9SWeYsoWhyJ
         HfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457861; x=1747062661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9wML/xLpYYqfIBMOeUqyFoxTmu2U5NAGM6uMVztntg=;
        b=MsDQxArnww1YOJMswNzdt0UjY5MAHtmv/uUq6Htm3vUrvvB32TPQZog/ErQq8zs/p3
         9SnBnhdNARINMVXsvyZfrs/bH7ZDxeTfNRRnmPuS5rvgjN7SRi5Jc1cWJx8S+Iu2DqIF
         tfOw33QE9F8/cgIEQGrO1aj0zNK6GISFOF08I8LjM+oATrgfOuM3S8sxhFxeN33KYeuy
         M0aw7behnDCJb0+2p1kNUgHHkwW6yEut52IDLqiWsF0sS274GlZJ8zFz3mNRpv22KSOX
         mVXFj9UN/BMClkh2up7Px/IBInu/DNadYWh9/Gt+btMhyNABrUYsUdI6ZbZwuMWp+djq
         nRig==
X-Forwarded-Encrypted: i=1; AJvYcCXXQSD7ynXoV53FAoH42769FS2BhjVrAUzvPkDxWpYeyNIqkAJu6B03iu58VbKLFBGmg7mT+KX8g2pSjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeAEytVlFtzAj8xKtna0O409/GxVa+dHCwC3ZTe9O5gYrqet5v
	aMV6b+A/5xjw9Qa/iOFU0xFIOK3fUMyceIKxznFJNksmDhIskYRh741QhoNinFAP+lNkwoy8VLH
	galySiFOQ01EKPOHu03d/yss+Qrwlz0i42MTkFw==
X-Gm-Gg: ASbGncvTEBMxM0hMUAL87BhMSKxF8c1xRT+tSGAPfI+118kVlHlzOrY4NNxs2sLKa60
	0cvCI5Xpte+/lAX0qhMhcM58t4xr/zDov4ZjKSRMpyDqrlQI6o16Pw5zMHlsTi/eMc9KrP7fQxr
	Q2cELvdKK2XEMDpIlAK4mquOknvlts91u9gFZTwKDbmjRVDDZZnJU=
X-Google-Smtp-Source: AGHT+IFWkNtGAga6J16A8HKiYJ4SY2/o0Msa04cQUJk7YPbvTNuKFTsMbSZxQChXOVr5+3LUR9RdojulzJSqTTqNRDc=
X-Received: by 2002:a17:907:1c1d:b0:aca:d83b:611b with SMTP id
 a640c23a62f3a-ad1a4a8d3d5mr716977766b.43.1746457860528; Mon, 05 May 2025
 08:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AA29CA6A-EC92-4B45-85F5-A9DE760F0A92@ateme.com>
 <4c0f13ab-c9cd-42c4-84bd-244365b450e2@amd.com> <996ca8cb-3ac8-4f1b-93f1-415f43922d7a@ateme.com>
 <3daac950-3656-4ec4-bbee-7a3bbad6d631@amd.com> <CAKfTPtBovA700=_0BajnzkdDP6MkdgLU=E3M0GTq4zoLW=RGhA@mail.gmail.com>
 <de22462b-cda6-400f-b28c-4d1b9b244eec@amd.com>
In-Reply-To: <de22462b-cda6-400f-b28c-4d1b9b244eec@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 5 May 2025 17:10:47 +0200
X-Gm-Features: ATxdqUEpRr0s0YMR4bSumWKWv0-Woy7WG2WhTlTCQARD72sKZ0DENvnoHm-LHds
Message-ID: <CAKfTPtC6siPqX=vBweKz+dt2zoGiSQEGo32yh+MGhxNLSSW1_w@mail.gmail.com>
Subject: Re: IPC drop down on AMD epyc 7702P
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Jean-Baptiste Roquefere <jb.roquefere@ateme.com>, Peter Zijlstra <peterz@infradead.org>, 
	"mingo@kernel.org" <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Valentin Schneider <vschneid@redhat.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 14:29, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Vincent,
>
> On 5/5/2025 3:58 PM, Vincent Guittot wrote:
> > On Wed, 30 Apr 2025 at 11:13, K Prateek Nayak<kprateek.nayak@amd.com> wrote:
> >> (+ more scheduler folks)
> >>
> >> tl;dr
> >>
> >> JB has a workload that hates aggressive migration on the 2nd Generation
> >> EPYC platform that has a small LLC domain (4C/8T) and very noticeable
> >> C2C latency.
> >>
> >> Based on JB's observation so far, reverting commit 16b0a7a1a0af
> >> ("sched/fair: Ensure tasks spreading in LLC during LB") and commit
> >> c5b0a7eefc70 ("sched/fair: Remove sysctl_sched_migration_cost
> >> condition") helps the workload. Both those commits allow aggressive
> >> migrations for work conservation except it also increased cache
> >> misses which slows the workload quite a bit.
> > commit 16b0a7a1a0af  ("sched/fair: Ensure tasks spreading in LLC
> > during LB") eases the spread of task inside a LLC so It's not obvious
> > for me how it would increase "a lot of CPU migrations go out of CCX,
> > then L3 miss,". On the other hand, it will spread task in SMT and in
> > LLC which can prevent running at highest freq on some system but I
> > don't know if it's relevant for this SoC.
>
> I misspoke there. JB's workload seems to be sensitive even to core to
> core migrations - "relax_domain_level=2" actually disabled newidle
> balance above CLUSTER level which is a subset of MC on x86 and gets

Did he try with relax_domain_level=3, i.e. prevent newilde idle
balance between LLC ? I don't see results showing that it's not enough
to prevent newly idle migration between LLC

> degenerated into the SMT domain.
>
> >
> > commit c5b0a7eefc70 ("sched/fair: Remove sysctl_sched_migration_cost
> > condition") makes newly idle migration happen more often which can
> > then do migrate tasks across LLC. But then It's more about why
> > enabling newly idle load balance out of LLC if it is so costly.
>
> It seems to be very workload + possibly platform specific
> characteristic where re-priming the cache is actually very costly.
> I'm not sure if there are any other uarch factors at play here that
> require repriming (branch prediction, prefetcher, etc.) after a task
> migration to reach same IPC.
>
> Essentially "relax_domain_level" gets the desired characteristic
> where only the periodic balance will balance long-term imbalance
> but as Libo mentioned the short term imbalances can build up
> and using "relax_domain_level" might lead to other problems.
>
> Short of pinning / more analysis of which part of migrations make
> the workload unhappy, I couldn't think of a better way to
> communicate this requirement.
>
> >
> >> "relax_domain_level" helps but cannot be set at runtime and I couldn't
> >> think of any stable / debug interfaces that JB hasn't tried out
> >> already that can help this workload.
> >>
> >> There is a patch towards the end to set "relax_domain_level" at
> >> runtime but given cpusets got away with this when transitioning to
> >> cgroup-v2, I don't know what the sentiments are around its usage.
> >> Any input / feedback is greatly appreciated.
>
> --
> Thanks and Regards,
> Prateek
>
