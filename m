Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30393BF69C
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 23:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591085; cv=pass; b=fp89ojZ+l+9p8ZVtM9WvIIYQnKtmBqyInYisiGjGmUQ5ucVG5ZauCRAZJPMUvaMbGODJBej7GvqdXMlf2oYO/6VfC+bobos0c4DO2440UJ8ZaIDjRSZ3u5vPhIskE7H0k1a504HoPijthSLrBQ+3pva0aWbthS2rTwBG0yjyXgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591085; c=relaxed/simple;
	bh=qMssuPB08Ftixa7cUXrksbDoBvMFkJHrhq6Zs/nyBnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3LeDhbx++nTlbuDQNHj7kirD8wUSZjpmOGZSxk384U1J7gNj/EsTbmIfX3u+LPflOhdb+O+Yh0W/31aSI5hX2DkKsA+j7dhA3RzUdvLjLLGPWnBQlm26fzThy2JuEn0dM0ATYv5Eb06tAsOU+rrsXCQlhoSzCoXRzlMyPW0/k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA/1yNPK; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA/1yNPK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba51e69988aso247716666b.0
        for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 16:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777591080; cv=none;
        d=google.com; s=arc-20240605;
        b=DjrV1ZO7D6I3ApWRfQaAXTneyMMhCZIZX+5Pov3E1b/Wkoqfx0+ORV/8X9slpQCTpq
         55MI3X7JLxS8EFZ3iVl8oif+6fDCHZLtZZ1am3z6pWBBlXI6CEICqigCuTTh9g65fu0q
         gmccjwvt1sHjvoscbwBqWomq38qiZuXAbUyr34Fb54Ylu6P4aiykQ4TbJ6VPSTP9cSff
         v3Rx7NczIcwTrgX+0MFFIg/8E1/xkYa7K4TDB6P6ivDrVYlPn01fPNw6MqtE/2NHnlcl
         ZctB+TtWt3NxuEudDdixMH6NynXC6kRd+vt1ddp/V/wJFtdrg3EQvyv1pmr7dcj4FU0R
         tWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wr4f/O6tnwowWz0YOGfaBNk5o8gSqrjyXSQ8QIaml/8=;
        fh=aNFrgwd+2g2qwBUxxhwD6FiioojO5VxAS5dtacpUOlg=;
        b=GW5XpHCgzAYN04PlWxwW2+AVqc9c+y0iZ5UmLRbqfUzYk0VXxiiYIBPT4rOeickHeb
         qq67DgVMLUeHqg3ge5WGnBMlyo9BHrtkcqAEASoAvwIHX8ZrxsJTIG1XmyN+IJ5o5QfO
         cTsQYGKJE2q99rq8PGvlBreLAn0SlCOyqb3iDrL2934SNMPGEeL0NLOpjGLQSAr/XbSe
         /uZdgvjbF8Xmhtl40UIf49VhBHGnr17ap1EcMd610MPSj6irvRHXnUiMgP7XywBmzuW7
         kX1CmGf37uFrO6X1D02wo47HO6SIN64YUQKv7TW8I1f3t2oMB14+ouuGhxJY7DjqVmNC
         Bapg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777591080; x=1778195880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr4f/O6tnwowWz0YOGfaBNk5o8gSqrjyXSQ8QIaml/8=;
        b=MA/1yNPKWJX2dj5E86suWEayLX6fNS5Ajr+3t8HQzABn5qGPg5nKxf/NnRmUSF0fqO
         LyIUwaRZoNUAtjIN/9AOQv8ipT6qFA4OO1RqBQbWNg6ORYmTMC5PwExGpTR7bR3s5xOm
         q+ea82OBqPhtC/6R/VX6lSY+hDK27ASKEveTftQH3pip8lIiLLp/K6D0+L0ntfCn+de6
         UurKwBcysojWk8BQkDBahitooF8B0kW6HjNCv6VAuQtLtMd66tFglAPQg5K1BrvSs6bF
         n+ltBPDxCf5J9xTqKafp+pJyo3VpUl2wBineMmHQ1rrzOvllONy9Zq9pMl0O8k0vyrKH
         cWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777591080; x=1778195880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wr4f/O6tnwowWz0YOGfaBNk5o8gSqrjyXSQ8QIaml/8=;
        b=cHawXOQ80UmpCdICPooZO5uZle2QMz9NPO6ZSeCS5XnxfDk35GIQGBGIUCM/wqYolX
         V4tCor9pLg71vzAx/cxIbrtGHy5beUIS3XK8dl1ABWzwNabHYQbzRa7O+hYdjXpw6S/N
         hSNCwVWmIxXGSh5TNkivmbodDJ9ZbLWJ0k5MG72NZMA2tIPPlSge0X/jPTlesxSLqwrv
         uyV35i95An+5upE2pADTVTVPZX1hAWo0sjtgPmP07SZSSfwzPSkhmOXfkY9RNfs65G2+
         dd/po9cmbuWM3ZLvy0/2k+rBrRoqcsDMMvvsqemAOWP7E8EYybR6aL5Yf8nZRKx6ZXxd
         uP1A==
X-Gm-Message-State: AOJu0YwH/ieAJpSj0Wjf++soy6tEm5AZ3sVk+JyvkIjk6oR2lSOr6ct9
	grgJxYj952MesDLq/v3cdkK8siK5mPuZo4kSj9HNPCrthOO93LNEAIkXXTb2iLt8gVNTW71j4XM
	RkWZT7S+XDCrwgjMySoKlELryKWHMFE8=
X-Gm-Gg: AeBDieuwrMVApv+JdOCb4eeshzw+MsTSIYzPPHUuoAaq7Wt0+5pLWGZNqMvMqWLkC+G
	YmHoxdF4K+pHA1wWlEg+7vokHJBq5gE0O+X2X7X5g+TcojlDpt1lzMtepFq+LLB4r/wd94nVzdm
	A0XOVi4d1U/ZwCmKrC9CbSgRVl0HTlUL5qwCisoN1kfYjXimLL2N7pcmc5EeLSmCV+vbWpJGWZC
	MGRhBFEl8wA6EZM8HLDo+hJ8N8bW5I8GAETSB80UkOm2TnK3Vxz1mMyRKylnDFmG4jwwewjoWO3
	l81gZLMHw21HeGcNog==
X-Received: by 2002:a17:907:3e82:b0:ba7:e65:a5f0 with SMTP id
 a640c23a62f3a-bbebe614a46mr27887066b.5.1777591080209; Thu, 30 Apr 2026
 16:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com>
 <CAJZ5v0ixuF=AQf0_VcPH=4jo5X-HbEB3WvJAnk8_fZes+bjyLg@mail.gmail.com> <12909238.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12909238.O9o76ZdvQC@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Fri, 1 May 2026 02:17:48 +0300
X-Gm-Features: AVHnY4Jqj25Kx5PBJv7oNLRVP3qU3f7s4xB1XbA1jZxGD5_AcSNv8SeOCrXOIeU
Message-ID: <CAGAxtY2J3vBJ9oUh1nt1c9ytRE_o=-rwk7nLKuDN==jW2kodbA@mail.gmail.com>
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

Rafael,

I'm leaving on vacation today. I'll be able to conduct new checks
starting May 17th.

Thanks for helping with resolving the issue!

=D1=87=D1=82, 30 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:42, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Thursday, April 30, 2026 3:57:41 PM CEST Rafael J. Wysocki wrote:
> > On Thu, Apr 30, 2026 at 1:41=E2=80=AFPM Evgeny Sagatov <evgeny.sagatov@=
gmail.com> wrote:
> > >
> > > I noticed that for powersave mode, I'm getting the following values:
> >
> > I guess you mean with the powersave governor.
> >
> > > cat /proc/cpuinfo | grep MHz
> > > cpu MHz         : 2798.689
> > > cpu MHz         : 1999.659
> > > cpu MHz         : 1999.797
> > > cpu MHz         : 2741.103
> > > Also, there's now no difference in the single-core benchmark between
> > > schedutil, ondemand, powersave and performance modes. The benchmark
> > > always gives a very high result.
> > > This wasn't the case before; the modes had different performance leve=
ls.
> >
> > I would expect schedutil, ondemand and performance to give similar
> > scores, but for powersave I would expect the score to be lower.
> >
> > With the same patch applied, can you please switch over to powersave,
> > reset the stats and then capture the output of
> >
> > grep -r . /sys/devices/system/cpu/cpufreq/
> >
> > Also, I'd still like to see the output of
> >
> > grep . /sys/firmware/acpi/interrupts/sci*
>
> Additionally, please remove all of the debug patches sent so far, apply
> the one below and send a dmesg boot log.
>
> I want to check if all of the CPUs use the same control values when
> they write to the frequency scaling control register.
>
> ---
>  drivers/cpufreq/acpi-cpufreq.c |   12 +++++++++---
>  drivers/cpufreq/cpufreq.c      |    1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -887,9 +887,14 @@ static int acpi_cpufreq_cpu_init(struct
>                  * unknown and not detectable via IO ports.
>                  */
>                 policy->cur =3D acpi_cpufreq_guess_freq(data, policy->cpu=
);
> +               pr_info("CPU%u: Using I/O space for frequency scaling\n",=
 cpu);
> +               pr_info("CPU%u: frequency scaling control address: %llu, =
bit width: %u\n",
> +                       cpu, perf->control_register.address,
> +                       perf->control_register.bit_width);
>                 break;
>         case ACPI_ADR_SPACE_FIXED_HARDWARE:
>                 acpi_cpufreq_driver.get =3D get_cur_freq_on_cpu;
> +               pr_info("CPU%u: Using FFH for frequency scaling\n", cpu);
>                 break;
>         default:
>                 break;
> @@ -898,13 +903,14 @@ static int acpi_cpufreq_cpu_init(struct
>         /* notify BIOS that we exist */
>         acpi_processor_notify_smm(THIS_MODULE);
>
> -       pr_debug("CPU%u - ACPI performance management activated.\n", cpu)=
;
> +       pr_info("CPU%u - ACPI performance management activated.\n", cpu);
>         for (i =3D 0; i < perf->state_count; i++)
> -               pr_debug("     %cP%d: %d MHz, %d mW, %d uS\n",
> +               pr_info("     %cP%d: %d MHz, %d mW, %d uS, %u\n",
>                         (i =3D=3D perf->state ? '*' : ' '), i,
>                         (u32) perf->states[i].core_frequency,
>                         (u32) perf->states[i].power,
> -                       (u32) perf->states[i].transition_latency);
> +                       (u32) perf->states[i].transition_latency,
> +                       (u32) perf->states[i].control);
>
>         /*
>          * the first call to ->target() should result in us actually
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -473,6 +473,7 @@ void cpufreq_enable_fast_switch(struct c
>         if (cpufreq_fast_switch_count >=3D 0) {
>                 cpufreq_fast_switch_count++;
>                 policy->fast_switch_enabled =3D true;
> +               pr_info("CPU%u: Fast frequency switching enabled\n", poli=
cy->cpu);
>         } else {
>                 pr_warn("CPU%u: Fast frequency switching not enabled\n",
>                         policy->cpu);
>
>
>
>
