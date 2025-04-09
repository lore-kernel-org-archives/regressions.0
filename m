Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1437A218AD2
	for <regressions@lists.linux.dev>; Wed,  9 Apr 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197925; cv=none; b=uzeF/FexuCY47yJ8iQxLI7cfy0SJWMAPgOvMJAwZTF694mS2krlBKQ9RvcY+SK15fKqWWsuRXwS6e3OpEdOEweS8w+4Fgxm4jbGmYp0qJqN6/wKDLMu6shWNKLVIDSDdGejojRKsZarz9e+3M6OmEdA4qs1Eax4cAAF1jUF3x+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197925; c=relaxed/simple;
	bh=RcNU03lrtQuhmutMROPCRXVWbRhoFLtCjP17Vu0QoVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQA21fErupzYvXw4cw7o0MGTbU96LuAAfbaLyIhWaj4ME8mZ45V6hxcJPHh1CIJSD555YArgQCJ3e0Wml6k9HRCvbEPyQzxM+Fn6LyjImh6sf5mNUUtaQaeALk436JL+F5xx14P1x8uKL0t3d66mbNSdqj2ZeBFgMrAClFVQqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKmRYEY7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKmRYEY7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47692b9d059so31878201cf.3
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744197923; x=1744802723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnyLqtBTNJZVUdoCJvAQWi3Um+ZI5CcOSV6TWLhi+rY=;
        b=CKmRYEY7axFGIE0xSlhHAdGXOuvt1Ue2Mf2e3+D+UjGIMHd0Q3BjLpsQiiNK9emVYU
         /C0XTTEqa1NveZtDV+rcsX8CIY6a7CE015/XoTUkLcwubLUNvg1CW0Fc0woltNATSngu
         BxuvI/nGvQmtwZNOMk0SEX8Dp/ZkA766XtEcPx5dT4mBSl71BZoVca7kY8p2I3JZa1pm
         VppYqpj2CgBhIqucZxaQo8gGK2pgMrczzgXN9TuNyf/GUV2l3edF4pkhq/HqOgJ16QWX
         xgHfPSMasgbmsHfnSMQUd2QiLtEGEUolfXUMG/fAE2ZRsfCAHODnChUo9sAUILHqvrFl
         R95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197923; x=1744802723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnyLqtBTNJZVUdoCJvAQWi3Um+ZI5CcOSV6TWLhi+rY=;
        b=qDa9Kj1eUqZcWmSkqmxc15n56PWKKKTpQhHU3njJLXKGfJDDv4h+QcxHwchhAfFq96
         qY9L4+lIi8dHI3sBUrAuDRIDaepfxyXqUKt2LejrZKNYAgqv7TlN7mxshKZxOQP5WiEJ
         eeNxcQNoeoFTnQW8sHBsbexGhYUaaklZHKrr58vwDblI9fGhrJbWG3w26wIMR7MNtVcJ
         1vp8nC2Ld5MVMa+SQvTPcyEfVeGZQQ/CCm2bUU7a4OhTLe1gKuB/eSd4+4IH0KWzAPKt
         nnn1iNVqk48lxx4u3vwZDHnKh861Ezs+zj0TDLkV9mXnAAytnYJhC8plt6EFN0soD6BD
         rSjg==
X-Forwarded-Encrypted: i=1; AJvYcCWceaSyI9NzEe3ZoYclnemmu07WhGTZ6iWb1SEgpi0jS3uVJCtxu8QDmreBpfjY+SqSaPIHK2XTIHUFww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm5QRX4EzPhNV09pjWYSlL5BgYR5daiJ9tiBAwyQu4fiHhL4tW
	5Zj2bW9NUBv3uRiaq0s4Tm1IlMltvyHt40Zp3yF31dBsheoM57edcmsmiGGVwfuTOE5MtciSQU3
	jmGGv1OxfCZsiaLBMHmssvNlcUgA=
X-Gm-Gg: ASbGnctgradG5QQtsMHo+X7ifOoGuES6c/cyiTq/uZzvqR4nRPdrRk3ukZTMbCxiqkd
	6NEK89J4kDVAQVVpXcGCfubbflAWspo8vRF7co8EjBh1wx6b2Z8fWHCgHmOYWoEBnxiQO38LMwq
	MzYTOzfE/ZG6NXZMUSksQK/bE=
X-Google-Smtp-Source: AGHT+IGdiIrEZJnGuWVnUKG4etRiEutplJRSBSm9MCLkg2DuvhKn3FBarw29Ide8aUJcGksVXizG9+RfvLzOTuWj2BA=
X-Received: by 2002:ac8:5dd1:0:b0:477:dcc:6c18 with SMTP id
 d75a77b69052e-479600a2faamr27545171cf.14.1744197922803; Wed, 09 Apr 2025
 04:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com> <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain> <Z_VTRspvmOUfrawh@linaro.org>
In-Reply-To: <Z_VTRspvmOUfrawh@linaro.org>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Wed, 9 Apr 2025 19:25:10 +0800
X-Gm-Features: ATxdqUHOE1vmAS5iu3NM1Du1EdGsUY0tFO7YrFDtFnHMDS5wAjZf84trNC65A3g
Message-ID: <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sultan,

On Wed, Apr 9, 2025 at 12:50=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> Hi Sultan,
>
> On Tue, Apr 08, 2025 at 08:22:20AM -0700, Sultan Alsawaf wrote:
> > On Tue, Apr 08, 2025 at 10:59:31AM +0200, Stephan Gerhold wrote:
> > > On Wed, Dec 11, 2024 at 05:57:32PM -0800, Sultan Alsawaf wrote:
> > > > From: "Sultan Alsawaf (unemployed)" <sultan@kerneltoast.com>
> > > >
> > > > A redundant frequency update is only truly needed when there is a p=
olicy
> > > > limits change with a driver that specifies CPUFREQ_NEED_UPDATE_LIMI=
TS.
> > > >
> > > > In spite of that, drivers specifying CPUFREQ_NEED_UPDATE_LIMITS rec=
eive a
> > > > frequency update _all the time_, not just for a policy limits chang=
e,
> > > > because need_freq_update is never cleared.
> > > >
> > > > Furthermore, ignore_dl_rate_limit()'s usage of need_freq_update als=
o leads
> > > > to a redundant frequency update, regardless of whether or not the d=
river
> > > > specifies CPUFREQ_NEED_UPDATE_LIMITS, when the next chosen frequenc=
y is the
> > > > same as the current one.
> > > >
> > > > Fix the superfluous updates by only honoring CPUFREQ_NEED_UPDATE_LI=
MITS
> > > > when there's a policy limits change, and clearing need_freq_update =
when a
> > > > requisite redundant update occurs.
> > > >
> > > > This is neatly achieved by moving up the CPUFREQ_NEED_UPDATE_LIMITS=
 test
> > > > and instead setting need_freq_update to false in sugov_update_next_=
freq().
> > > >
> > > > Signed-off-by: Sultan Alsawaf (unemployed) <sultan@kerneltoast.com>
> > > > ---
> > > >  kernel/sched/cpufreq_schedutil.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufre=
q_schedutil.c
> > > > index 28c77904ea74..e51d5ce730be 100644
> > > > --- a/kernel/sched/cpufreq_schedutil.c
> > > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct sugov=
_policy *sg_policy, u64 time)
> > > >
> > > >   if (unlikely(sg_policy->limits_changed)) {
> > > >           sg_policy->limits_changed =3D false;
> > > > -         sg_policy->need_freq_update =3D true;
> > > > +         sg_policy->need_freq_update =3D cpufreq_driver_test_flags=
(CPUFREQ_NEED_UPDATE_LIMITS);
> > > >           return true;
> > > >   }
> > > >
> > > > @@ -96,7 +96,7 @@ static bool sugov_update_next_freq(struct sugov_p=
olicy *sg_policy, u64 time,
> > > >                              unsigned int next_freq)
> > > >  {
> > > >   if (sg_policy->need_freq_update)
> > > > -         sg_policy->need_freq_update =3D cpufreq_driver_test_flags=
(CPUFREQ_NEED_UPDATE_LIMITS);
> > > > +         sg_policy->need_freq_update =3D false;
> > > >   else if (sg_policy->next_freq =3D=3D next_freq)
> > > >           return false;
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
> > > frequencies are being throttled as expected, as soon as the temperatu=
re
> > > trip points are reached.
> > >
> > > When using "schedutil", the CPU frequencies stay at maximum as long a=
s
> > > the stress test is running. No throttling happens, so the device heat=
s
> > > up far beyond the defined temperature trip points. Throttling is appl=
ied
> > > only after stopping the stress test, since this forces schedutil to
> > > re-evaluate the CPU frequency.
> > >
> > > Reverting this commit fixes the problem.
> > >
> > > Looking at the code, I think the problem is that:
> > >  - sg_policy->limits_changed does not result in
> > >    sg->policy->need_freq_update without CPUFREQ_NEED_UPDATE_LIMITS
> > >    anymore, and
> > >  - Without sg->policy->need_freq_update, get_next_freq() skips callin=
g
> > >    cpufreq_driver_resolve_freq(), which would normally apply the poli=
cy
> > >    min/max constraints.
> > >
> > > Do we need to set CPUFREQ_NEED_UPDATE_LIMITS for all cpufreq drivers
> > > that set policy->fast_switch_possible? If I'm reading the documentati=
on
> > > comment correctly, that flag is just supposed to enable notifications=
 if
> > > the policy min/max changes, but the resolved target frequency is stil=
l
> > > the same. This is not the case here, the target frequency needs to be
> > > throttled, but schedutil isn't applying the new limits.
> > >
> > > Any suggestions how to fix this? I'm happy to test patches with my
> > > setup.
> >
> > Thank you for reporting this. As I see it, sg_policy->need_freq_update =
is
> > working correctly now; however, sg_policy->limits_changed relied on the=
 broken
> > behavior of sg_policy->need_freq_update and therefore sg_policy->limits=
_changed
> > needs to be fixed.
>
> Thanks for the quick reply and the patch!
>
> >
> > Can you try this patch:
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_sc=
hedutil.c
> > index 1a19d69b91ed3..f37b999854d52 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -82,7 +82,6 @@ static bool sugov_should_update_freq(struct sugov_pol=
icy *sg_policy, u64 time)
> >               return false;
> >
> >       if (unlikely(sg_policy->limits_changed)) {
> > -             sg_policy->limits_changed =3D false;
> >               sg_policy->need_freq_update =3D cpufreq_driver_test_flags=
(CPUFREQ_NEED_UPDATE_LIMITS);
> >               return true;
> >       }
> > @@ -171,9 +170,11 @@ static unsigned int get_next_freq(struct sugov_pol=
icy *sg_policy,
> >       freq =3D get_capacity_ref_freq(policy);
> >       freq =3D map_util_freq(util, freq, max);
> >
> > -     if (freq =3D=3D sg_policy->cached_raw_freq && !sg_policy->need_fr=
eq_update)
> > +     if (freq =3D=3D sg_policy->cached_raw_freq && !sg_policy->limits_=
changed &&
> > +         !sg_policy->need_freq_update)

We also should add the limits_changed in the sugov_update_single_freq().

> >               return sg_policy->next_freq;
> >
> > +     sg_policy->limits_changed =3D false;

Maybe this should be add in the sugov_update_next_freq()=EF=BC=8Cbecause, b=
oth
sugov_update_single_freq() and sugov_update_shared(),
the sugov_update_next_freq() is after the freq check.

> >       sg_policy->cached_raw_freq =3D freq;
> >       return cpufreq_driver_resolve_freq(policy, freq);
> >  }
> >
>
> This is working correctly for me, CPU frequency is being throttled again
> when the temperature trip points are reached. If you send this, feel
> free to add:
>
> Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Thanks!
> Stephan
>
