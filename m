Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C1F3A873B
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497430; cv=pass; b=d5j18TbPWDK9EoanMgge0a0Hgsod/7t/V5DMWJplZECG5aakH+iIbWH2no61l8a5MAoSN8yqy5SOGRWKyZwGxT4ChC4nZOg7DVHblZHWCbkj5gHmIR6uNdwpEFgjkV8V7SjQjFraahqz/KcxMafenmgiRLJvdpthkHeqjbW6IsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497430; c=relaxed/simple;
	bh=3bpZh9hQlts0dYs3ZbQFjTJzAxcieL24QZx80d/S960=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sz+wbDsfUHT5nMSBgJBJavaAbMDDAgMAr+q3ivYYFFu+RCPy8vLXt16bkICirSiYu/SfXe34tjCS92K0RS71T8X6BuiG285upC6epwC4VTr9+tafC7fVlKGTGGH2qJn8FsL4xlKJl32ndP6CSBya3XqyBMreRsriJV+26gHIQwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJhk64mj; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJhk64mj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-baebe98afa0so25574166b.3
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 14:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777497427; cv=none;
        d=google.com; s=arc-20240605;
        b=aILv2xeSQzN/K4VL8rkpqnzChPIA+T5R6rUGXUOdObBdBP9AQwoNDJB6hXoa9d3u/I
         q+rhhN+2Ice7qNJmtFM4RRCyb9W8PdLjRLq046E5M945HiHeolbotk8ltCQjniAQ5iGH
         LEh7RRueUhIs2Cp92jBZVF4PcmghbOSurv/phScwREK6M3dV0BamHCryVsBpavIMa9O6
         ma0DjXkhtMN2nnW4Ez6SmsVrwssVqpZ0eVa45It0hCyipaaoRJ1g4+ZE31F9N7gG/oXn
         MqsRhthShGkVZs5I++tFR6E3OyQ+SLaNaZ3tdTnfHnW6raflrW7tDpetVWl5RxnfdVCu
         BGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j3TppP6mq4j0d1qnbCekTG1cdcTHkaYTXo+iqgksTc4=;
        fh=aNFrgwd+2g2qwBUxxhwD6FiioojO5VxAS5dtacpUOlg=;
        b=LdpkrJC3NJNWy3hN9/VpzlHDflu+Q+00HC14zA+rZhYcRuUQyKeQmJ3Q5fO8ghlICP
         XrgAAFQrbexZCw5sqrVm/H9890iN95M/ZPTm3x5sXUwZbOb+t8kJGBYAcUUB3kihKHbT
         no+UtQXCp/zjjUKVyXQuvh6NC1URD7925x1K2uNPepPJGNdtLINlhmNJ3SAdrh8Rp/Qr
         O8L9hAMZ08qMN9mrhgKCoxqXtxDhAwbNsokZlihyydSNSGRmrutwjMsC5ChZZ8xd5tf7
         tnF50AWpI+ZM5FiT+exkylV25L7hxWUnScZq00zKMaf/VvaEj8Icv8lGbNBtZe7NK4WL
         1gmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777497427; x=1778102227; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3TppP6mq4j0d1qnbCekTG1cdcTHkaYTXo+iqgksTc4=;
        b=YJhk64mj/2K9Bi0RaVxb4vaBqx4smNJjFUeqF0UmIfx95p0ZQh1V87ZotPmXl3Fsg4
         EEJ79+glS65BZ4hP1+PJneO4ANJyebR7UYimCpQjvfEMi54UkVQn3kMu3PmCsGf0d1n4
         X0H0CoTB5FTAGAhqhoF0KIgTQvHFk6kuollb7b+YQTZrFW7wmi2qzLrMIbic/drHNhkp
         Ls7efZ1LZgLXCFih4uBhU5fj1kfAa/DeAUScMJU6GzUgqH/1zaXVUBFyuaFxtOefAda3
         dFjoXNBj+9SBkCWfZ5SjcP6HpOEzaOpmK+wlV2JnVJvya2XFyscB27zsZNYUOn9dEidG
         npHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777497427; x=1778102227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3TppP6mq4j0d1qnbCekTG1cdcTHkaYTXo+iqgksTc4=;
        b=TUygpctP96U7GcQIO+aJXknwTlbuGThylF1y8dkkOHOsKGnj6OgtScnimVZRyM+uWO
         9VSn749Wm5qEv/YX0+W4hniYqWdjQAenzgB7pZD3RyTniCzbUmvA5KCNRFEPKV7jUJrf
         UcVX0uVjVH/zQ1otaCh1WaUe5pWMnUCYWOBX3wVGobbPKgbKiMJMgVmKWSpwyhJu2lqk
         nnW7//dE4zpHZBcQqcQ4aHJQIB0qIg8Pbb+cfR+WIVsYzfVi1fI3Rw6PguK6JhgJpVqL
         EJwhFhuvzoXS2urxnC1xdVeiC6rzTt6TLO1XqqivLRoCh2JkGL/kdeXlKj6fRK/40T1t
         oCkw==
X-Gm-Message-State: AOJu0YxHZKFBkHw0F0mTRj7rJRpCtY4rXE6cAkTQPEvqgqjrC/JsAlKu
	J9kQ3lTt+TGP55Z7onXI8gdOYo/Qfy+SH2Zx7M2Ea2RVzW3Sw5auAYFXaMcBs5ZtFyftHIwLVXb
	qLDFAP4XN0v2YpeAq/orcn6ZxhJaqzr8=
X-Gm-Gg: AeBDievPTQiGwriLx1zjv5sNjX7e7nnjvwhT5Hn02eUr7+5oycoH6WZUqiUlMp2x1qb
	BME6TOXelMzEcCXOeT9Smnume9R3ht0LuggiV/FrMRCHxm+b1UswWGf0IulM4CsDbjLo2DZ+suL
	iDYHSqYyMTQut9KYW//tDqdjhQ1p+Zgq10zga5yy/XTCynsvsgQ0v2yvgLM1tCC/Dw+vNpJYZgD
	yLrX3wetyoklgJVn/R/sa/QIu3U2EF1+TjUYYK9k3M4PuFPjNhHpj9Gggp4UZ+jhtCgSLC3A9Uo
	XahztlMW9BJ+JxJ9Ww==
X-Received: by 2002:a17:907:a286:b0:b9c:5cf3:50a6 with SMTP id
 a640c23a62f3a-bbac7e84109mr21464166b.30.1777497426616; Wed, 29 Apr 2026
 14:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-5ZGq7Je6Q@mail.gmail.com>
 <CAJZ5v0ikAeu7cW9K6sfKYbbsVK51GOsFrX-qv3KJ7cVr-gRHew@mail.gmail.com> <6010375.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <6010375.DvuYhMxLoT@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 30 Apr 2026 00:16:51 +0300
X-Gm-Features: AVHnY4KQuLV8jtSJgaT06T0eu5vZOeUPrvaMqIdpG3nAv6ESCUXOtpijMALDXbk
Message-ID: <CAGAxtY2N-=3taOBCTFZzEmm4NqJ-KhtsWq0fNts_tn3nAxpkTA@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
 (schedutil involved)
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The PC froze when I pressed the power button.

grep -r . /sys/devices/system/cpu/cpufreq/
/sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us:240
/sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:perform=
ance
schedutil
/sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_governor:schedutil
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:2834000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies:28340=
00
2000000
/sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:1999759
/sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupported>
grep: /sys/devices/system/cpu/cpufreq/policy0/stats/reset: =D0=9E=D1=82=D0=
=BA=D0=B0=D0=B7=D0=B0=D0=BD=D0=BE =D0=B2 =D0=B4=D0=BE=D1=81=D1=82=D1=83=D0=
=BF=D0=B5
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:   From  :    To
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:         :
2834000   2000000
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2834000:
      0       844
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000:
    843         0
/sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:1687
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000 1164
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000 14130
/sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:160000
/sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:1999759
/sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000

=D1=81=D1=80, 29 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 23:22, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Wednesday, April 29, 2026 8:24:02 PM CEST Rafael J. Wysocki wrote:
> > On Tue, Apr 28, 2026 at 11:05=E2=80=AFPM Evgeny Sagatov
> > <evgeny.sagatov@gmail.com> wrote:
> > >
> > > The PC also froze with this patch when I pressed the power button.
> >
> > Which means that the issue is not simply a matter of the lack of
> > synchronization between different I/O space accesses, so most likely
> > the problem lies deeper.
> >
> > Let me summarize what we've learned so far (and expand the CC list some=
what).
> >
> > For those who have not seen the previous discussion, it is at:
> >
> > https://lore.kernel.org/lkml/CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-=
5ZGq7Je6Q@mail.gmail.com/#r
> >
> > 1. The issue is basically that the platform locks up completely when
> > the power button is pressed
> >
> > This is reproducible 100% of the time.
> >
> > The power button processing flow is that, if the power button event is
> > enabled in the ACPI PM1_ENABLE register, pressing the button causes
> > the corresponding status bit in the ACPI PM1_STATUS register to be
> > set, which in turn causes an ACPI interrupt (SCI) to trigger (both
> > PM1_STATUS and PM1_ENABLE registers are accessible through the I/O
> > address space).
> >
> > The SCI processing involves reading both the power button status and
> > enable bits and clearing the former if set (this needs to be done or
> > an interrupt storm would start if the status bit was not cleared).
> >
> > We don't actually know which of the steps above specifically causes
> > the platform to lock up, but that doesn't matter too much because all
> > of them are necessary.
> >
> > Clearing the power button enable bit in PM1_ENABLE prevents the issue
> > from occurring (but then the power button obviously doesn't work).
> >
> > 2. The issue only occurs if the schedutil cpufreq governor is used
> >
> > If either the "powersave" or "ondemand" governor is used instead, the
> > issue doesn't appear.
> >
> > Also switching over to a different cpufreq governor (on all CPUs)
> > before pressing the power button makes the issue go away.
> >
> > 3. The issue didn't occur at all before commit e37617c8e53a
> > ("sched/fair: Fix frequency selection for non-invariant case")
> >
> > Reverting the merge that introduced commit e37617c8e53a into the
> > mainline makes the issue go away.
> >
> > 4. The issue occurs regardless of how schedutil invokes the cpufreq
> > driver ("fast switch" vs sugov_deferred_update())
> >
> > 5. The cpufreq driver in question is acpi-cpufreq and it uses a
> > control register located in the I/O address space (the same control
> > register is used for all CPUs)
> >
> > 6. If acpi-cpufreq is not allowed to write into the control register
> > at all, the issue doesn't occur
> >
> > 7. Synchronizing all of the I/O space accesses in the ACPI-related
> > code (via a spinlock), including acpi-cpufreq, doesn't prevent the
> > issue from occurring
> >
> > So overall, it looks like the control register access pattern in
> > acpi-cpufreq that results from schedutil's use of it after commit
> > e37617c8e53a somehow puts the platform into a state in which a power
> > button event causes it to lock up at the hardware level.
> >
> > While there are a couple of things more to check, I'm afraid that
> > there may not be a viable way to address this issue other than
> > replacing the schedutil governor with ondemand on this platform.
>
> Below is one more patch to try.  It should cause acpi-cpufreq to use
> one shared cpufreq policy instead of 4 per-CPU policies which is
> more adequate because the CPUs share one control register.  It should
> also cause acpi-cpufreq to update the control register only on CPU0.
>
> Let's see if this changes the control register access pattern sufficientl=
y
> to work around the power button problem.
>
> In any case, please send the output of
>
> $ grep -r . /sys/devices/system/cpu/cpufreq/
>
> from a kernel with this patch applied.
>
> ---
>  drivers/cpufreq/acpi-cpufreq.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -743,7 +743,7 @@ static int acpi_cpufreq_cpu_init(struct
>         if (result)
>                 goto err_free_mask;
>
> -       policy->shared_type =3D perf->shared_type;
> +       policy->shared_type =3D CPUFREQ_SHARED_TYPE_ANY;
>
>         /*
>          * Will let policy->cpus know about dependency only when software
> @@ -751,9 +751,9 @@ static int acpi_cpufreq_cpu_init(struct
>          */
>         if (policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ALL ||
>             policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ANY) {
> -               cpumask_copy(policy->cpus, perf->shared_cpu_map);
> +               cpumask_copy(policy->cpus, cpu_present_mask);
>         }
> -       cpumask_copy(data->freqdomain_cpus, perf->shared_cpu_map);
> +       cpumask_copy(data->freqdomain_cpus, cpu_present_mask);
>
>  #ifdef CONFIG_SMP
>         dmi_check_system(sw_any_bug_dmi_table);
> @@ -913,7 +913,9 @@ static int acpi_cpufreq_cpu_init(struct
>         data->resume =3D 1;
>
>         policy->fast_switch_possible =3D !acpi_pstate_strict &&
> -               !(policy_is_shared(policy) && policy->shared_type !=3D CP=
UFREQ_SHARED_TYPE_ANY);
> +               (!policy_is_shared(policy) ||
> +                policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ANY) &&
> +               perf->control_register.space_id !=3D ACPI_ADR_SPACE_SYSTE=
M_IO;
>
>         if (perf->states[0].core_frequency * 1000 !=3D freq_table[0].freq=
uency)
>                 pr_warn(FW_WARN "P-state 0 is not max freq\n");
>
>
>
