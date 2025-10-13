Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC102E6CAE
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338524; cv=none; b=TOh2+K6xjuIqymhLttX2nSXLNCUpFL0TjeiPCC4i96PWcP9a7ZmqDtOGW3OicbqTbscSXJQYEO5pyKk3psUFhNFWEqUASAtSurTRmbnkUpOsdL/KCmKprS0An0EKjarbhXM+X0fbPBEo8XxuX2ls2n+Bjm3kOoBcYeT5NAj5du8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338524; c=relaxed/simple;
	bh=Mcf4k2Eb5y4ExxZYFmPUQtYFXmFaCUqStDbFVKSkiyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ancHuEmG3Yt4YaotI1ZK0zTK+aHySHNiO5jkYuSLqD81rrwaCn2823iw5IizeMyYiXh3znWFWuUmWh7ZdSvpLVFd32/V+zVuw17bHT4kpj6vyVmPkyqDNp0ecF1Dig42TihBIubXgzWxfQ2yPdRPO6igDgmZ9QieYqPy9v/URC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2yRTyPN; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2yRTyPN"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54c0a10990fso1164202e0c.2
        for <regressions@lists.linux.dev>; Sun, 12 Oct 2025 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760338521; x=1760943321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxpYz31WTohbhJuOp5dj13ArRLPeR7dWLB0V/ZD3iF4=;
        b=l2yRTyPNiPrZwUYGdbEdKseERx+A5EXmxKLRfnDj2VhH9UVvj+/zUjx/9wCyQzJww2
         zrepe7fbIQW6JL/avdh5BmM8nbLJja3ZhKsONB/9XS/aRBAmY7bWQT5Zaotg9nq77zk6
         eqAbEpEO6EARHVQjXlU2PvgkvNcNlCd5w4mXR/zZmV52fTyuWgWvxNEQkBaSUPUMK9+h
         XrmoB3cDKmtDrFgc+ndmwR019VHnsuwpYkzpEnoshUsg079OdZ7JMP0r+hRJCMEAAfTB
         isJSIFU+DYkFO9EDHYF4aECTVZi1glUAaghkgKJCG0keDwEgH6HQcGY8ByET/Kr6chzk
         Grmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338521; x=1760943321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxpYz31WTohbhJuOp5dj13ArRLPeR7dWLB0V/ZD3iF4=;
        b=NSkOKKv01m2X6WiTMufissHvY8bdGL5K0qpDgmJvR/TbpIDnXt9hsKsh4Gft40Fffa
         HUATeQSisVsBpxuZTfF9Cxlqv8lb8PLVxhxvc1Ag335fsoqpZSu0SzNuC3MFUjyBPWPk
         gQenHQantwgUiQm30LdcIP8tqxPzaZX60s97rIAolOVyMNZn0nigEMFpcM+azSNq0+Mo
         Kfehx6ROZZsUyNRjm6Gk8M0GWgeS1Ko6sErS4NhkQ5njTyZHEKHUVmZLkEwU0rxr4L0V
         hG5J2CikhxuO7J0rKw6Ucj4/WCnj86qbw2A/b+O7A+l4Tdjf/776slaxaTFvHFFA0ZiL
         1jYw==
X-Forwarded-Encrypted: i=1; AJvYcCUlSCueyq7a5hpArBq9rp4LRjH6YFd2GhE4u5ckotSwThL7B2Js88Ho3RvCSnWcFv0A4fKPHGrKqHp2/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJrFRJTnqOJaEYFIdZbYEKb5mdHABwhpnybt+O0r//z5ApVm9U
	uJVUg2k+fSZFT1YespJ11SdjbVJ2RQ+sB4bQG8DjnYl5KLxODnYeV3G+3o2zU1aR+B8VD9lXWPv
	W76tpo7praAGhBwzeMrYQtIBgffYJUb0=
X-Gm-Gg: ASbGncs8RILrAmCoI9CVi5zFqBwLZwLzLjSUxMS2Y4A0dyHlsAfI2qBJOhW2Wr7Cl4i
	4inUGX2tOaphg9eV2zKoVsonS2PMEF9hsUNEHtlpLbfNIKXLK9WL93T3hyuic/2YLE8cCm+AXBm
	O1swCs4hzpCJVORbCUiqnHANN/265HIZ/omI9HIAhnJshj/RZ+3hNrq57F30dqyhb+quNnNWrfp
	WYdtY3pyWNx+1s6bHsznd/w2ymABLWB61OCe9fpF7Vb6B7fukYGydByNG6tfkxouUXmkw==
X-Google-Smtp-Source: AGHT+IGOMc6+OPWoHO6gIAQkEJ03P+HPqmvDc5UtZHoVumqD2rBUYak0kFEk3JXPSfK/KAJ38UkZ5IpqrXXe7FWoo04=
X-Received: by 2002:a05:6122:d93:b0:544:87b0:d1d1 with SMTP id
 71dfb90a1353d-554b8b03084mr6224895e0c.6.1760338520677; Sun, 12 Oct 2025
 23:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHPNGSQpXEopYreir+uDDEbtXTBvBvi8c6fYXJvceqtgTPao3Q@mail.gmail.com>
 <8aed5e69-57b1-4a01-b90c-56402eb27b37@linux.intel.com>
In-Reply-To: <8aed5e69-57b1-4a01-b90c-56402eb27b37@linux.intel.com>
From: Octavia Togami <octavia.togami@gmail.com>
Date: Sun, 12 Oct 2025 23:55:07 -0700
X-Gm-Features: AS18NWAoz9Ux6LSe2hLCMxTynHVe4LPr0SYtTvRflAzfg_SGNukc-9z4G8Cp-ns
Message-ID: <CAHPNGSTgahRhAg5eM=pnn45rw=TJzTz4AfeckcB2RcsPvxCeGg@mail.gmail.com>
Subject: Re: [REGRESSION] bisected: perf: hang when using async-profiler
 caused by perf: Fix the POLL_HUP delivery breakage
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Octavia Togami <octavia.togami@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That change appears to fix the problem on my end. I ran my reproducer
and some other tests multiple times without issue.

On Sun, Oct 12, 2025 at 7:34=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 10/11/2025 4:31 PM, Octavia Togami wrote:
> > Using async-profiler
> > (https://github.com/async-profiler/async-profiler/) on Linux
> > 6.17.1-arch1-1 causes a complete hang of the CPU. This has been
> > reported by many people at https://github.com/lucko/spark/issues/530.
> > spark is a piece of software that uses async-profiler internally.
> >
> > As seen in https://github.com/lucko/spark/issues/530#issuecomment-33399=
74827,
> > this was bisected to 18dbcbfabfffc4a5d3ea10290c5ad27f22b0d240 perf:
> > Fix the POLL_HUP delivery breakage. Reverting this commit on 6.17.1
> > fixed the issue for me.
> >
> > Steps to reproduce:
> > 1. Get a copy of async-profiler. I tested both v3 (affects older spark
> > versions) and v4.1 (latest at time of writing). Unarchive it, this is
> > <async-profiler-dir>.
> > 2. Set kernel parameters kernel.perf_event_paranoid=3D1 and
> > kernel.kptr_restrict=3D0 as instructed by
> > https://github.com/async-profiler/async-profiler/blob/fb673227c7fb311f8=
72ce9566769b006b357ecbe/docs/GettingStarted.md
> > 3. Install a version of Java that comes with jshell, i.e. Java 9 or
> > newer. Note: jshell is used for ease of reproduction. Any Java
> > application that is actively running will work.
> > 4. Run `printf 'int acc; while (true) { acc++; }' | jshell -`. This
> > will start an infinitely running Java process.
> > 5. Run `jps` and take the PID next to the text RemoteExecutionControl
> > -- this is the process that was just started.
> > 6. Attach async-profiler to this process by running
> > `<async-profiler-dir>/bin/asprof -d 1 <PID>`. This will run for one
> > second, then the system should freeze entirely shortly thereafter.
> >
> > I triggered a sysrq crash while the system was frozen, and the output
> > I found in journalctl afterwards is at
> > https://gist.github.com/octylFractal/76611ee76060051e5efc0c898dd0949e
> > I'm not sure if that text is actually from the triggered crash, but it
> > seems relevant. If needed, please tell me how to get the actual crash
> > report, I'm not sure where it is.
> >
> > I'm using an AMD Ryzen 9 5900X 12-Core Processor. Given that I've seen
> > no Intel reports, it may be AMD specific. I don't have an Intel CPU on
> > hand to test with.
> >
> > /proc/version: Linux version 6.17.1-arch1-1 (linux@archlinux) (gcc
> > (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #1 SMP
> > PREEMPT_DYNAMIC Mon, 06 Oct 2025 18:48:29 +0000
> > Operating System: Arch Linux
> > uname -mi: x86_64 unknown
>
> It looks the issue described in the link
> (https://lore.kernel.org/all/20250606192546.915765-1-kan.liang@linux.inte=
l.com/T/#u)
> happens again but in a different way. :(
>
> As the commit message above link described,  cpu-clock (and task-clock) i=
s
> a specific SW event which rely on hrtimer. The hrtimer handler calls
> __perf_event_overflow() and then event_stop (cpu_clock_event_stop()) and
> eventually call hrtimer_cancel() which traps into a dead loop which waits
> for the calling hrtimer handler finishes.
>
> As the
> change (https://lore.kernel.org/all/20250606192546.915765-1-kan.liang@lin=
ux.intel.com/T/#u),
> it should be enough to just disable the event and don't need an extra eve=
nt
> stop.
>
> @Octavia, could you please check if the change below can fix this issue?
> Thanks.
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 7541f6f85fcb..883b0e1fa5d3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10343,7 +10343,20 @@ static int __perf_event_overflow(struct perf_eve=
nt
> *event,
>                 ret =3D 1;
>                 event->pending_kill =3D POLL_HUP;
>                 perf_event_disable_inatomic(event);
> -               event->pmu->stop(event, 0);
> +
> +               /*
> +                * The cpu-clock and task-clock are two special SW events=
,
> +                * which rely on the hrtimer. The __perf_event_overflow()
> +                * is invoked from the hrtimer handler for these 2 events=
.
> +                * Avoid to call event_stop()->hrtimer_cancel() for these
> +                * 2 events since hrtimer_cancel() waits for the hrtimer
> +                * handler to finish, which would trigger a deadlock.
> +                * Only disabling the events is enough to stop the hrtime=
r.
> +                * See perf_swevent_cancel_hrtimer().
> +                */
> +               if (event->attr.config !=3D PERF_COUNT_SW_CPU_CLOCK &&
> +                   event->attr.config !=3D PERF_COUNT_SW_TASK_CLOCK)
> +                       event->pmu->stop(event, 0);
>         }
>
>         if (event->attr.sigtrap) {
>
>
