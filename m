Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE5305968
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760472799; cv=none; b=hRyIK8nJnR29LSuZ/wGmhjfXPT3jiGPZHo5wF5LQ/g87vXQbjvh+gC0K6b+KmHFXNHEETqBTXd09qIwyPqWaxvr1OvEY7r+Ma3WzVbSm4D18WRgD4CFK5sEDf9YdQoeMS9rQsztM/gueZZ8Zm5g3Fl7UEkCHFnhEWIcq4XTT9OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760472799; c=relaxed/simple;
	bh=/cutkUyT9TzRXiISSRXINEB2viiQ8pGyNBaZSSMuOtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7BzpThZMc53Nkl4paqrxldrhZohXquoGhHZHGYdua6c3tkmmjGwztLIY2wCrcr7DKwaaX1ZK/jMT+GiYxDkcoG95vUC2IsksQg+6SSHCviszE2hKXZyJaPgLiwKLaw052DbilMjFNg0mT3zx3OyuV5CCx4TcXxM+bGZvBHXnUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hL7b6W2I; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL7b6W2I"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso4527730137.3
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760472796; x=1761077596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6UhijKgUcN+fj0joxI9PxxfblSymYfYP7njUr+44ck=;
        b=hL7b6W2ICfklGHp/11JaxPz6GRZTVO7kDz1I9gIevUoUw1cQ/WPqaAHMHER6vwv4yu
         4by3/xDZEwPDXw3tV+h6YgbAPz7W+kfHZAw8iKfNtONp8DrOPSjBC9ZKnCPiWnd8HDw7
         8MVOnbdgrKwmlTi9hEG4d5+ueDS4kBhFA1b6Wlh8bWfv1mlrXt2Eace1gPvnnBD4R4KC
         AHlKZDR8erUk3T4hADGgaIlwzsulfccSml2A9ifzVnaEqqx/PJIjuOPkBb/dcsYqXULh
         0DKAzAG67ioixjg5dtWeDGAL4vxkzY5ehu7/x4hEFP/l0fDfdhOgPugydm2UzP1DAsHD
         Za0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760472796; x=1761077596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6UhijKgUcN+fj0joxI9PxxfblSymYfYP7njUr+44ck=;
        b=F+e0bS1vD3Gf/wYUBnK8PNOxRTzjAReEhvDyQvGpg9PFV1TQvg392pXnYJiNbYq75l
         naUhdz2msSmTGF+jBxg0RtvyF0Rc9L6ochI+aH+hsktDRusvrRkfX7f4Xm/hQMrqMl8P
         I3vl3e73PO8QHWrFczey0ki1y6JEgL3pN2yI4ajtEQmnWZAsdHtNRepzxyUfpbnEAPvU
         Qz7pBgTU8yF0g8+AGl6OAyWhQelUgiZhYZsQ01sCNzf0kF3n4Hn/1a8CMzdaW8DPA/IH
         44BzR6g4sgJUctWaYPHNL2IkDFUrqlZrGjfvv2cXK2lHhSPLprvnngQiLEqV6Kbs2WA7
         GpGg==
X-Forwarded-Encrypted: i=1; AJvYcCUosF3J4WW5kFuV3GdaQOTxjln5cNy8v3SQAiE9zhQ0AUspkQB1SVoLYZCZTKSw3ktS6KGNmbRPz+/NIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhgyPtL2INrh//FHRgNxDAAEeP3Yhu2zeAiSlrxzRIUylXk7pM
	8xpJlMNBF35HohwVEtl8nszuWWCRnPJOWk8IC2lkANjkREk7thZkszL8j76tZb0kVnIgjtXS55C
	3kzw3fKqknLFCT6N4W1MfJL0I9Xd8ueA=
X-Gm-Gg: ASbGncvp/Yv0+TndO0asYqQ7Zk1t9/cwhoxbxl5JKGAqsg+h+t5wGNeOoMkqXlaA7KY
	w8yEkvBgjeK7vU2zKH6hHsf9pCWXGzmr7L3JwbKZ9Xy5V6NGvcGgodvj72W2mQjUQZD/Gw7qYgX
	mPrxgjtH0r+lRWykTQOuN2ao6CcBlkPGIh6U9Zq1ihIRlt3DC7Buq47N/yhkCnQuyydQ+nXu4O9
	2FcN4/rD1D+lfdIRB1gx+J2kke+qsZ6WTR5WbudEKFSZKyvf1Oo7BjXj8Y=
X-Google-Smtp-Source: AGHT+IH4K2DgTClVeZ9XiY7Y0e4sIzBbX+qBGQyiLw3YUv9MNAM6xIwxW8sgShmKrvQfr9ZnTQhHrg4oCI51vtgcC/A=
X-Received: by 2002:a05:6102:a4e:b0:528:92b8:6c3e with SMTP id
 ada2fe7eead31-5d5e21ce95amr11293034137.1.1760472795886; Tue, 14 Oct 2025
 13:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHPNGSQpXEopYreir+uDDEbtXTBvBvi8c6fYXJvceqtgTPao3Q@mail.gmail.com>
 <8aed5e69-57b1-4a01-b90c-56402eb27b37@linux.intel.com> <CAHPNGSTgahRhAg5eM=pnn45rw=TJzTz4AfeckcB2RcsPvxCeGg@mail.gmail.com>
 <ad3ef789-3f12-4107-abad-cf7b4775e38d@linux.intel.com>
In-Reply-To: <ad3ef789-3f12-4107-abad-cf7b4775e38d@linux.intel.com>
From: Octavia Togami <octavia.togami@gmail.com>
Date: Tue, 14 Oct 2025 13:13:03 -0700
X-Gm-Features: AS18NWBIAx4E_zYNl4uSTgPaysqtlF63sUqPuVdyfBWUpeSLNWk5hHfxyt-i2YI
Message-ID: <CAHPNGSTmv7qxMYOs6h1uevB4Rjiy9R+-YTt0gZ2D1tVh7-cuxQ@mail.gmail.com>
Subject: Re: [REGRESSION] bisected: perf: hang when using async-profiler
 caused by perf: Fix the POLL_HUP delivery breakage
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Octavia Togami <octavia.togami@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That patch is also working fine.

On Mon, Oct 13, 2025 at 11:41=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
>
> On 10/13/2025 2:55 PM, Octavia Togami wrote:
> > That change appears to fix the problem on my end. I ran my reproducer
> > and some other tests multiple times without issue.
>
> @Octavia Thanks for checking this patch. But following Peter's comments, =
we
> need to update the fix. So could you please re-test the below changes? Th=
anks.
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 7541f6f85fcb..ed236b8bbcaa 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -11773,7 +11773,8 @@ static enum hrtimer_restart
> perf_swevent_hrtimer(struct hrtimer *hrtimer)
>
>         event =3D container_of(hrtimer, struct perf_event, hw.hrtimer);
>
> -       if (event->state !=3D PERF_EVENT_STATE_ACTIVE)
> +       if (event->state !=3D PERF_EVENT_STATE_ACTIVE ||
> +           event->hw.state & PERF_HES_STOPPED)
>                 return HRTIMER_NORESTART;
>
>         event->pmu->read(event);
> @@ -11827,7 +11828,7 @@ static void perf_swevent_cancel_hrtimer(struct
> perf_event *event)
>                 ktime_t remaining =3D hrtimer_get_remaining(&hwc->hrtimer=
);
>                 local64_set(&hwc->period_left, ktime_to_ns(remaining));
>
> -               hrtimer_cancel(&hwc->hrtimer);
> +               hrtimer_try_to_cancel(&hwc->hrtimer);
>         }
>  }
>
> @@ -11871,12 +11872,14 @@ static void cpu_clock_event_update(struct
> perf_event *event)
>
>  static void cpu_clock_event_start(struct perf_event *event, int flags)
>  {
> +       event->hw.state =3D 0;
>         local64_set(&event->hw.prev_count, local_clock());
>         perf_swevent_start_hrtimer(event);
>  }
>
>  static void cpu_clock_event_stop(struct perf_event *event, int flags)
>  {
> +       event->hw.state =3D PERF_HES_STOPPED;
>         perf_swevent_cancel_hrtimer(event);
>         if (flags & PERF_EF_UPDATE)
>                 cpu_clock_event_update(event);
> @@ -11950,12 +11953,14 @@ static void task_clock_event_update(struct
> perf_event *event, u64 now)
>
>  static void task_clock_event_start(struct perf_event *event, int flags)
>  {
> +       event->hw.state =3D 0;
>         local64_set(&event->hw.prev_count, event->ctx->time);
>         perf_swevent_start_hrtimer(event);
>  }
>
>  static void task_clock_event_stop(struct perf_event *event, int flags)
>  {
> +       event->hw.state =3D PERF_HES_STOPPED;
>         perf_swevent_cancel_hrtimer(event);
>         if (flags & PERF_EF_UPDATE)
>                 task_clock_event_update(event, event->ctx->time);
>
>
> >
> > On Sun, Oct 12, 2025 at 7:34=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.in=
tel.com> wrote:
> >>
> >> On 10/11/2025 4:31 PM, Octavia Togami wrote:
> >>> Using async-profiler
> >>> (https://github.com/async-profiler/async-profiler/) on Linux
> >>> 6.17.1-arch1-1 causes a complete hang of the CPU. This has been
> >>> reported by many people at https://github.com/lucko/spark/issues/530.
> >>> spark is a piece of software that uses async-profiler internally.
> >>>
> >>> As seen in https://github.com/lucko/spark/issues/530#issuecomment-333=
9974827,
> >>> this was bisected to 18dbcbfabfffc4a5d3ea10290c5ad27f22b0d240 perf:
> >>> Fix the POLL_HUP delivery breakage. Reverting this commit on 6.17.1
> >>> fixed the issue for me.
> >>>
> >>> Steps to reproduce:
> >>> 1. Get a copy of async-profiler. I tested both v3 (affects older spar=
k
> >>> versions) and v4.1 (latest at time of writing). Unarchive it, this is
> >>> <async-profiler-dir>.
> >>> 2. Set kernel parameters kernel.perf_event_paranoid=3D1 and
> >>> kernel.kptr_restrict=3D0 as instructed by
> >>> https://github.com/async-profiler/async-profiler/blob/fb673227c7fb311=
f872ce9566769b006b357ecbe/docs/GettingStarted.md
> >>> 3. Install a version of Java that comes with jshell, i.e. Java 9 or
> >>> newer. Note: jshell is used for ease of reproduction. Any Java
> >>> application that is actively running will work.
> >>> 4. Run `printf 'int acc; while (true) { acc++; }' | jshell -`. This
> >>> will start an infinitely running Java process.
> >>> 5. Run `jps` and take the PID next to the text RemoteExecutionControl
> >>> -- this is the process that was just started.
> >>> 6. Attach async-profiler to this process by running
> >>> `<async-profiler-dir>/bin/asprof -d 1 <PID>`. This will run for one
> >>> second, then the system should freeze entirely shortly thereafter.
> >>>
> >>> I triggered a sysrq crash while the system was frozen, and the output
> >>> I found in journalctl afterwards is at
> >>> https://gist.github.com/octylFractal/76611ee76060051e5efc0c898dd0949e
> >>> I'm not sure if that text is actually from the triggered crash, but i=
t
> >>> seems relevant. If needed, please tell me how to get the actual crash
> >>> report, I'm not sure where it is.
> >>>
> >>> I'm using an AMD Ryzen 9 5900X 12-Core Processor. Given that I've see=
n
> >>> no Intel reports, it may be AMD specific. I don't have an Intel CPU o=
n
> >>> hand to test with.
> >>>
> >>> /proc/version: Linux version 6.17.1-arch1-1 (linux@archlinux) (gcc
> >>> (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #1 SMP
> >>> PREEMPT_DYNAMIC Mon, 06 Oct 2025 18:48:29 +0000
> >>> Operating System: Arch Linux
> >>> uname -mi: x86_64 unknown
> >> It looks the issue described in the link
> >> (https://lore.kernel.org/all/20250606192546.915765-1-kan.liang@linux.i=
ntel.com/T/#u)
> >> happens again but in a different way. :(
> >>
> >> As the commit message above link described,  cpu-clock (and task-clock=
) is
> >> a specific SW event which rely on hrtimer. The hrtimer handler calls
> >> __perf_event_overflow() and then event_stop (cpu_clock_event_stop()) a=
nd
> >> eventually call hrtimer_cancel() which traps into a dead loop which wa=
its
> >> for the calling hrtimer handler finishes.
> >>
> >> As the
> >> change (https://lore.kernel.org/all/20250606192546.915765-1-kan.liang@=
linux.intel.com/T/#u),
> >> it should be enough to just disable the event and don't need an extra =
event
> >> stop.
> >>
> >> @Octavia, could you please check if the change below can fix this issu=
e?
> >> Thanks.
> >>
> >> diff --git a/kernel/events/core.c b/kernel/events/core.c
> >> index 7541f6f85fcb..883b0e1fa5d3 100644
> >> --- a/kernel/events/core.c
> >> +++ b/kernel/events/core.c
> >> @@ -10343,7 +10343,20 @@ static int __perf_event_overflow(struct perf_=
event
> >> *event,
> >>                 ret =3D 1;
> >>                 event->pending_kill =3D POLL_HUP;
> >>                 perf_event_disable_inatomic(event);
> >> -               event->pmu->stop(event, 0);
> >> +
> >> +               /*
> >> +                * The cpu-clock and task-clock are two special SW eve=
nts,
> >> +                * which rely on the hrtimer. The __perf_event_overflo=
w()
> >> +                * is invoked from the hrtimer handler for these 2 eve=
nts.
> >> +                * Avoid to call event_stop()->hrtimer_cancel() for th=
ese
> >> +                * 2 events since hrtimer_cancel() waits for the hrtim=
er
> >> +                * handler to finish, which would trigger a deadlock.
> >> +                * Only disabling the events is enough to stop the hrt=
imer.
> >> +                * See perf_swevent_cancel_hrtimer().
> >> +                */
> >> +               if (event->attr.config !=3D PERF_COUNT_SW_CPU_CLOCK &&
> >> +                   event->attr.config !=3D PERF_COUNT_SW_TASK_CLOCK)
> >> +                       event->pmu->stop(event, 0);
> >>         }
> >>
> >>         if (event->attr.sigtrap) {
> >>
> >>
