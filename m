Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFA136327
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744251198; cv=none; b=UMhdvU3X5VlSEfP/0kBuwdWqwyb2QRU5n51tz07UOAYEeUz2he0/6u+ZS/PYK+R8lUKLkb/RM+v3AfGDUljTS/cuKooOhWbwt4Pl2XRAhlt/SghONLFYjqqBlmqPrcErdYrVWTrXVLlkpeieaT2HmFvQAdj2duznfDxo0nijBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744251198; c=relaxed/simple;
	bh=9vAUrxAjKyHJDzRWa1qjDyDCIBOGq8ba6734aYNaDFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9SzC0//nJvRmsCXOu9fUufoQceos8rlQM2WL9BJ3RpoBxM27Ebz9wCyup0a4x+TWthw+Hug7PhSB3gsIEfhp6dL+rhwONB8Rxh0GN+p4DTs91LavowEqIi0oEwg2HOvitiJNNKUcChnQ8auxc0fISumdzN+3rdHWe3pmwVnM0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrGlVnn6; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrGlVnn6"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47664364628so3732351cf.1
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744251196; x=1744855996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVf9MwoCNxP+/cpn16doeRfq5MCUWo9WG7NPQ6gzoE0=;
        b=IrGlVnn6bXfbhdDuY8yOCjM6rRVo5lFbgYULp5OgORPuQUK+DRbHpv52j9VfWWuYC4
         USF12nHnD9REe4BfH0QPowAfpioSJy8I359pM+Im3ShyUU/lqucc0wlEmF27S+JcvnOj
         u3OWkTvLkV9l/XxR5dpOSP/bIw5nt0D70aDJsivKMfNqHyf++HwbsJ/h34sS0rHtm76g
         zjD/fbW1xy5btjRo6Lm5TjBVHLpCzz8WlUwpaJQ0VCVyfNSh9EvD26OBPhVUJ6VSOU7N
         h+tfMGrLcGTLCm57aqWjUgR0WjiBhJrlalflUeXbqGdfnMIR6Hst3feoYmA6XTNJz0Va
         insg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744251196; x=1744855996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVf9MwoCNxP+/cpn16doeRfq5MCUWo9WG7NPQ6gzoE0=;
        b=L/M7B3bb/NOvI3/IHir6l7D3m+wF19yNzKu/2I0iNc9L7HW3e+Xo/YYgD9B/NkyC51
         0lbCT8ejnT1TcLIsOutTzI9BpAlPZRwFBDFPKzVfVFQP35R/oN1bld0wzO2GbOQWqdzR
         vLnAF/vHkczDfoG50Va+fnj/ecIH4F50KlC2B5Uekf7GRr8+grr/MpRFD+RZ6aYLnVAL
         rh0OiuIrSlmjDNoV68Y1nKmih2wDm2Ta0/PcEboAEL70Yd21/UvOSWkRM3fbJ6Wl2DtN
         Aq2qxgMqSX67tbqht+1iJjoB/DfEM3rIHHkvpjqGPSTtPOHskVhuyQcrXfzREi6V5SBi
         C90A==
X-Forwarded-Encrypted: i=1; AJvYcCWdxqnahKkiFOPgkD0iJ3qHofiqfDcv4DTy+urdWjoJDBgZyyCzNHPdZ5MezaXxL8vEWf5B9lRwwZOihQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwndQ7OlbrFhpqmh86aSqTnPoMx/HFRVTid5Kpu6yz8k84fFJ4F
	7aeVlTXc9SGQ4tdYKwDkapcVA7R0Z0O5zMfDu5r4CVOnbmFnaLXd21o2R6YGbDnIuE1fAT99wvQ
	J/tK18wv97qVnQeqDQalUWOAi9Kk=
X-Gm-Gg: ASbGnct7xz6fzfRyciYoBiWQ1DyB11TSLFZOtjB4oNNP4IFjg1+tQSXB6nyxoeyWuez
	e/TUbuy+GYMaW0DWvqdakZRMcAk1Ti30AYXZJ1Gd8u7Q7hQmBGbqlRxQtPDDyTQPfcmt9iTTQ4L
	Vbnl1TV8iwnX4fLUtLh9k5nUc=
X-Google-Smtp-Source: AGHT+IFJvzycvA5vUmXv5irTcljyr+BVoSet8VToDY4cRxKU3iryBsHi2s0tUv1NJpc+zXaqMfk14OdXqDOQhzDLmPE=
X-Received: by 2002:a05:622a:20a:b0:475:19cc:a81a with SMTP id
 d75a77b69052e-4796cf08fcdmr17056041cf.21.1744251195738; Wed, 09 Apr 2025
 19:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com> <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain> <Z_VTRspvmOUfrawh@linaro.org>
 <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
 <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>
 <Z_cjv0EJ45NShYOp@sultan-box.localdomain> <CAB8ipk8WOh5_XvRYJrPi6b6wf8G4=zjoFRWpXk3viv3gkHCn1g@mail.gmail.com>
 <Z_coNmh-CabcfIWD@sultan-box.localdomain>
In-Reply-To: <Z_coNmh-CabcfIWD@sultan-box.localdomain>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 10 Apr 2025 10:13:04 +0800
X-Gm-Features: ATxdqUGiOybZ38qHE7UOBf3S7FIMeI6dQZvOR5vocfUu62Ttg_9QZjGSl_fRVik
Message-ID: <CAB8ipk8AAFFtV3OA4S=g9X9AXsC4Ntr911DLLRkhgQtvMvXAvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:09=E2=80=AFAM Sultan Alsawaf <sultan@kerneltoast=
.com> wrote:
>
> On Thu, Apr 10, 2025 at 10:06:41AM +0800, Xuewen Yan wrote:
> > On Thu, Apr 10, 2025 at 9:49=E2=80=AFAM Sultan Alsawaf <sultan@kernelto=
ast.com> wrote:
> > >
> > > On Wed, Apr 09, 2025 at 07:48:05PM +0800, Xuewen Yan wrote:
> > > > Or can we modify it as follows?
> > > >
> > > > -->8--
> > > >
> > > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufre=
q_schedutil.c
> > > > index 1a19d69b91ed..0e8d3b92ffe7 100644
> > > > --- a/kernel/sched/cpufreq_schedutil.c
> > > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct
> > > > sugov_policy *sg_policy, u64 time)
> > > >
> > > >         if (unlikely(sg_policy->limits_changed)) {
> > > >                 sg_policy->limits_changed =3D false;
> > > > -               sg_policy->need_freq_update =3D
> > > > cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > > +               sg_policy->need_freq_update =3D true;
> > > >                 return true;
> > > >         }
> > > >
> > > > @@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
> > > > sugov_policy *sg_policy, u64 time)
> > > >  static bool sugov_update_next_freq(struct sugov_policy *sg_policy,=
 u64 time,
> > > >                                    unsigned int next_freq)
> > > >  {
> > > > -       if (sg_policy->need_freq_update)
> > > > +       if (sg_policy->need_freq_update) {
> > > >                 sg_policy->need_freq_update =3D false;
> > > > -       else if (sg_policy->next_freq =3D=3D next_freq)
> > > > -               return false;
> > > > +               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_L=
IMITS))
> > > > +                       goto change;
> > > > +       }
> > > >
> > > > +       if (sg_policy->next_freq =3D=3D next_freq)
> > > > +               return false;
> > > > +change:
> > > >         sg_policy->next_freq =3D next_freq;
> > > >         sg_policy->last_freq_update_time =3D time;
> > >
> > > If CPUFREQ_NEED_UPDATE_LIMITS isn't specified, then there's no need t=
o request a
> > > frequency switch from the driver when the current frequency is exactl=
y the same
> > > as the next frequency.
> >
> > Yes, the following check would return false:
> >
> >  +       if (sg_policy->next_freq =3D=3D next_freq)
> >  +               return false;
>
> But what does that change fix? In fact, that change causes a limits updat=
e to
> trigger a frequency switch request to the driver even when the new freque=
ncy is
> the same as the current one.

We set the sg_policy->need_freq_update =3D false instead of
sg_policy->need_freq_update =3D
cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS),
to fix the original issue, and then add the
+               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS))
+                       goto change;

to allow cpufreq to update when CPUFREQ_NEED_UPDATE_LIMITS is set.

>
> Sultan
