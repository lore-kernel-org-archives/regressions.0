Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795533523;
	b=izopBKIG8m4ywx/5ZyptjhY6G66ec13Io/EgymazuHpgWPxNPDqadgPlqfw1vZj70p1X
	 yuvDqlfoPiOGp1NNJnK/uegatPwqxX6HgdNjqj59TIRAzH8ScDNPZtOjELpA33DKDE9RF
	 efMrebxPd7GFEW3hHMw+g4OCvHLyWHaQkHueuUzW6TYMzwHgB5cVnEV3AVQsy4PhnfQQn
	 HX6NXgp4gASLO1LUkUPV4bg8NOuRyk30oqoRE8FXPmLV/lW3OqbjUODxoCRlYTD86jcUN
	 WekxJZuSMfri+rLqdJbVoM905McexSose2ndqVG1Ck+vqYOHKXUIIYFbex/dzQU+EXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pMeAUfyQKs21PQxhTeThPehL8F0f2FfcH9tAVVckmCI=;
	b=aZ9U+6eN9DqUO3bycK8WDxrYoahfb37+E/J0rGhcByDwoeB8Aj1J4cfE5YBgDQ/7iBDp
	 7AzToiV53a3gN61EN0Eux8E99dwfcwygXcVH/rGHYaPHX0g8ShjdZqJUZ2SQeMYAfSrIV
	 CWdsbPpW34/h1o2yuLiwDEQTeMK2IvlTkMTC3Gs8emkr7T6o0P3TK2nR7WgBQDl9E8WlJ
	 kizmYGrGrrh7lFCt1+d+7Sk7nWuG1Wjg92hjbu5O814O0x8UeWDn3wnD+i+GGqwQBJZwm
	 b5GnFgeSPnXzD3arTACQRBGffXZpFoOtJrry94C2SmZMvT9am791A1BGZR0v/DugsuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SKW8EYJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BF606A321
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SKW8EYJi
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so6122027a12.3
        for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 07:18:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795533521; cv=none;
        d=google.com; s=arc-20260327;
        b=cI2jsKp5t6/WgAa27cEl5B4b94dipjFe/BgdeT320K7C3kIKl0rpI6mgBOZByyqAcN
         mebjT6K/8Kxds2yitiAn3THEp5D7PK0qVodWQknuEg2pcvD8n+pQXcF/pwpkGkbV6qls
         iKgw+P9Llxq7ISlrFePEYckoN7+Ew7RbLf8ZJy8c+QuAluLiQqHjngrFw9xbWqQzb5QX
         tmE3Gn52gGENtWVqPRmGxtC03iMvJzgOk5T7Tg/iOZ/KKwQst6PTeb7IANNwpTVxkqYf
         3mqej+EDKE8XbJbuYoiZKyKJIjBpg0xcjlFgJ4Bf4ULl5VSn1HS9gJmzyoGqeCU3g7A5
         Ir3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMeAUfyQKs21PQxhTeThPehL8F0f2FfcH9tAVVckmCI=;
        fh=za/KhkfNgEZfQ7pQbmMf1saZiDP8Nb0zAG3dsqhkRd4=;
        b=pri4zJ3w/gymT0cwvhS1YEDese2kic6FVIZ++ecCLiGCpnJhnwNt4PIrny4EO385zn
         QWEO4GoA5L83dnIilfaejYhfCuZCP//gvTuNtY5q2qMpDKZMD9G58BcJaTHcefWRDnB+
         qZL30WBp0KKPJU/NrmdIgfDdTpfXg6kM/VimZUAHlM7xGJXyhYncmqpLW149NH3GTvJV
         is6CSWobUPFWGjNYf59j413IfRnaT5NqPkFgeCeZuHJkXs1QDyFUAwyQY2ALt2C6XLRK
         C/PphBcDZGbVIwxmSX+4A7XYS01FWtHGKrnXB2D07OJPifc0b8h1D6bodb7fuFShgKsp
         Uujg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795533521; x=1796138321; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMeAUfyQKs21PQxhTeThPehL8F0f2FfcH9tAVVckmCI=;
        b=SKW8EYJih1eW+jyBRucoDaB+0XWzcpZXoKslKk2/bUWnryiIZfDxipGvIFl3zKPdlK
         i4KL/COT8NYW9UpbfRMwkKO3p90BVSMaQQ0AfuSkwdeOkuTtD512i88RmDoPpdMDPd9B
         heHf4IUOFFkCxCM8fGeZipdY5F5730xXrdrA5ienIWxyRXQUVTEcqVwiFub/wyxrfnoz
         EY6PwRqhPwZVvIQWGB3BgS/Lm2vwU+OEuag2tqv2S/QCVRkFxPMJFDc1xfJLoBuT4T+C
         +j5TehdR9K5SfoWkhij/INkkCphaVSZKWgQHkruwtOCjjVymtKSW4RzQi/b/OaT8F6sj
         AQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533521; x=1796138321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMeAUfyQKs21PQxhTeThPehL8F0f2FfcH9tAVVckmCI=;
        b=eQ7xCIBisK1uDAf+ArwoADdvooKdONl4Neuo91bYJaq7u8bts+wKyXCnRYHU74OOge
         +3RYP4TPJtszfAx0bjqOL8WkSuERxJyqgQN0ZDkLnjgtZDlP3yX6g+l5QMXNzhNmIF+s
         lYX+BqgkBBNSKIhrSgMBazy3qM2xK5OIMW46i1y3CsK40j9Bi5kTKtUW5g5n5tk9GbpB
         +uKSO9S0NJcU/zV3k/VCcMIN5mmaYKd70/1UA9z+lFubGhpW4nh/WmNkEXGRg12IJY4z
         eB5Zv+EMBQ6dGiR1uUF9raHeWiTygVXOhX1m9m73gTU91A7x6QiLcEVJPOVXGnZ0un8H
         HWKw==
X-Forwarded-Encrypted: i=1; AL+hErG2tiwueM0ALtGoR/Ci2k0V0SbrNyTK6GSbq7RCPACh6TpdGpXozSDBDRxg2ZAhUvDksfBul0Dvhhssmg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+RISsQAZBbHsoAedXrFK34LGQ67NBeV3sOFsHBnHx7yi9jSAvw
	jTqh8qmVfl/IpW8nhmtzMKW6LqmN6Gt9kBXRjIkCw5B1E8HoKEjDHc4VuXFIc9si38EqZk2InuC
	0buQX3Q9AHC2CrpY0vC17KJoG7R7blQN5Tn5sTxUCOw==
X-Gm-Gg: AZFdTZdlhAUYmMoXQY5l1IPiz3zy0sIb8dYAY0ahpKfMZ2N6cULJqnYIiIx9mquW1L4
	eyROhemvNXj90/cHLDZSenYfer5qSidMY41Zl0KnhfJHtTwcnHnOXVXiS5g9gcepJEPOmaNikos
	agnmlEatKm6xVg83q2YBqZfiMColVlRUZhq/a7eHQWi4dQoj1CVefN4s2EyQ8DWs2u6DUsziDtq
	tpOQWYSpynI5n/3A9ss9dN+boMDTm2T39d/gHR6XZxd3LE67uS7MPhlrssQtjR3WYfOQpyyJRxe
	EgZ7jRW7shKn32vp9zeJ5q3K/KLV5puXsY3IkpU1kZrgdW7CUz4W7NAXwNw9v+LjfOL8AEr7nCQ
	Gs8jPeteXH4R7+B0R5B8omFNUIQPsdgUj0Skm4obqy2KmwJf3tykJOHMbo5f2ejfYIBvafg==
X-Received: by 2002:a05:6402:3212:b0:6b7:28f:a3ac with SMTP id
 4fb4d7f45d1cf-6ba37d18d11mr10185076a12.7.1795533520984; Tue, 24 Nov 2026
 07:18:40 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
In-Reply-To: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 16:18:29 +0100
X-Gm-Features: Aa3M54rPc23BD9JMCDfXBfEKa5k3TiaEoPqaYqWowySdm3smTxn0fkcqVx8it1w
Message-ID: <CAKfTPtDBk=V+ApVCxGHQ0A+juE-rwid-hBxAF_KoeXbg4Vn5nw@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: James Buck <jbuck2005.linux@outlook.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi <arighi@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Nov 2026 at 12:56, James Buck <jbuck2005.linux@outlook.com> wrot=
e:
>
> Hi,
>
> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_id=
le_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LIT=
TLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking=
 threads are placed on idle little CPUs while idle big CPUs are never looke=
d at.
>
> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capac=
ity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mai=
nline to behave the same.
>
> #regzbot introduced: 61ea17a63719
>
> System
> ------
> Orange Pi 6 (CIX CD8180 "Sky1"), 12 CPUs in five clusters, ACPI boot, no =
SMT:
>
> CPUs     capacity
> 0-1       1024
> 2-5         279   (little)
> 6-7         905
> 8-9         866
> 10-11     984
>
> The firmware's PPTT gives one MC domain over all 12 CPUs. It has SD_ASYM_=
CPUCAPACITY(_FULL) and SD_SHARE_LLC, with a CLS domain per cluster below it=
. The kernel is v7.3.5 plus the out-of-tree Sky1 SoC
> driver patches the board needs to boot. None of them touch kernel/sched/;=
 the only one in drivers/base/arch_topology.c adds a helper that updates ca=
pacity_freq_ref when boost is toggled.
>
> Workload
> --------
> llama.cpp llama-bench, Qwen2.5 1.5B Instruct Q4_K_M, CPU only, 8 threads,=
 pp512 / tg128, tokens/s:
>
> 6.18.64                           123.5 / 36.5
> 7.3.5                               109.0 / 29.5
>
> 7.3.5, taskset to the 8 big CPUs   121.4 / 34.7
> 7.3.5, NO_SIS_UTIL at runtime     122.1 / 35.9
> 7.3.5, patch below                       121.7 / 35.7

I have something similar on radxa O6 and 7.4-rc4 with latest tip/sched/core
- 7.4-rc4+tip : 124.4
- 7.4-rc4+tip NO_SIS_UTIL at runtime : 136.3

I'm surprised that the newly_idle and/or periodic load balance doesn't
pull the tasks earlier onto a mid/big core. It takes around 15/20ms to
migrate a long-running thread to a bigger core when it runs on a
little core whereas misfit should trigger an active load balance at
next tick. I wonder if the Cluster level could slow down this
migration.

>
> Sampling each worker thread's CPU every 5 s on stock 7.3.5 showed one to =
four of the 8 threads on cpu2-5 in every sample, with big CPUs idle. With N=
O_SIS_UTIL, or with the patch below, threads only make brief visits to the =
little CPUs. That costs nothing measurable, and 6.18 does the same. llama.c=
pp syncs all threads at a barrier after every operation, so one thread on a=
 279-capacity CPU holds up the other seven.
>
> Other things I ruled out with runtime toggles or test builds: EAS off, ll=
c_balancing off, the performance governor, NI_RATE/NI_RANDOM, the 6.18 misf=
it logic, and restoring the old sd_init() rule that cleared SD_PREFER_SIBLI=
NG on the child of an asymmetric domain. None of them changed the result. T=
he slowdown only shows when prompt processing is part of the run, where the=
 workers block and wake far more often than during generation, which points=
 at the wakeup path.
>
> What I think happens
> --------------------
> The workers' util is about 850-1018, so they fit no CPU, not even a 1024 =
one (the limit there is about 819). select_idle_capacity() therefore never =
returns early. It returns the highest-capacity idle CPU among those it scan=
ned.
>
> With 8 of 12 CPUs busy, nr_idle_scan comes out at about 6:
>
> x =3D 7200 / 12 =3D 600
> y =3D 1024 - 600^2 * 117^2 / (10000 * 1024) =3D ~543
>
> nr =3D 12 * 543 / 1024 =3D ~6
>
> So the scan stops after six CPUs counted from target. From cpu0 that is c=
pu0-5. With cpu0 and cpu1 busy, the best idle CPU it can see is a little on=
e, and the idle cpu6-11 are never checked. From cpu10 the scan covers 10, 1=
1, 0, 1, 2 and 3, with the same result. Once a thread is on a little CPU, i=
ts next scan starts there, so it tends to stay.
> Above about 85% load nr drops to 1 and the function returns -1 at once.
>
> The CPU numbering here (littles between two groups of bigs) makes it easy=
 to hit. But the effect looks general: for a task that fits no CPU, a scan =
cut short by nr returns the best of a partial set. On a system with the lit=
tles at 0-3 and the bigs at 4-7, a wakeup with target on a little CPU and n=
r <=3D 4 sees only little CPUs.
>
> The patch below (drop the limit from select_idle_capacity() only; select_=
idle_cpu() keeps SIS_UTIL) is what I run now.
>
> I'm not proposing it as the fix, since it gives up what the commit wanted=
 on large asymmetric domains.
>
> One option might be to keep scanning past nr while nothing has been found=
 that fits. I'm happy to test anything on this board, and I can send the to=
pology and sched domain dumps, /proc/schedstat, or traces if they help.
>
> Thanks,
> James
>
>
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9049,7 +9049,6 @@ select_idle_capacity(struct task_struct *p, struct =
sched_domain *sd, int target)
>         int fits, best_fits =3D ASYM_IDLE_THREAD_MISFIT;
>         int cpu, best_cpu =3D -1;
>         struct cpumask *cpus;
> -       int nr =3D INT_MAX;
>
>         cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask);
>         cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> @@ -9058,28 +9057,17 @@ select_idle_capacity(struct task_struct *p, struc=
t sched_domain *sd, int target)
>         util_min =3D uclamp_eff_value(p, UCLAMP_MIN);
>         util_max =3D uclamp_eff_value(p, UCLAMP_MAX);
>
> -       if (sched_feat(SIS_UTIL) && sd->shared) {
> -               /*
> -                * Same nr_idle_scan hint as select_idle_cpu(), nr only l=
imits
> -                * the scan when not preferring an idle core.
> -                */
> -               nr =3D READ_ONCE(sd->shared->nr_idle_scan) + 1;
> -               /* overloaded domain is unlikely to have idle cpu/core */
> -               if (nr =3D=3D 1)
> -                       return -1;
> -       }
> -
> +       /*
> +        * Scan the whole domain, as 6.18 did. Do not cut the scan short =
with
> +        * the SIS_UTIL nr_idle_scan hint: on a busy system the hint drop=
s to a
> +        * few CPUs, the scan then stops at whatever idle CPU it met firs=
t, and
> +        * a task that fits no CPU (util above every capacity margin) lan=
ds on
> +        * an idle little core while an idle big core is never looked at.
> +        */
>         for_each_cpu_wrap(cpu, cpus, target) {
>                 bool preferred_core =3D !has_idle_core || is_core_idle(cp=
u);
>                 unsigned long cpu_cap =3D capacity_of(cpu);
>
> -               /*
> -                * Stop when the nr_idle_scan is exhausted (mirrors
> -                * select_idle_cpu() logic).
> -                */
> -               if (!has_idle_core && --nr <=3D 0)
> -                       return best_cpu;
> -
>                 if (!choose_idle_cpu(cpu, p))
>                         continue;
