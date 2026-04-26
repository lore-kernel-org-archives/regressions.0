Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB06175A98
	for <regressions@lists.linux.dev>; Sun, 26 Apr 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777236320; cv=pass; b=lxtUKU/K4x2Lc70I92xZGBhbbktvU1KcC1wlIaxPnsTUOHvgR4z8bKi8Phgau1d7isEf1NZq+D8RwymmtUowcPF7e6veT2xYMapg6Pw4WO+PHfSqnaLPN/R/VdF/MfmQzoyBOP8BQEPploOBebbFhr0UPchWbm0K0ptJhh2MZgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777236320; c=relaxed/simple;
	bh=xsCqiLWlmlKEfzOlQLOq2KagHtUsAxco7lxmqPv4vFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFKAXomRm9yHfKEfBbdabjab7+GxIaW0cjHCo7NaempgO13PT9IGSlmcaHj35xYro5zrVYvW24/cwl3M28yCuHu0a97W5sAEb+iz1+iuvGIH0/5sVp6kDhILbm65xO/+U9dXTAOvXP9xE8Vm14hRTArIlmV+1jf6y/juDWp+LhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffyTlVK5; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffyTlVK5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9d9971d059so1353826866b.2
        for <regressions@lists.linux.dev>; Sun, 26 Apr 2026 13:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777236317; cv=none;
        d=google.com; s=arc-20240605;
        b=iX5aeJtrjs6oqpapMQj2ELjVA81DCgpHbHCaKzLiM2Ndc9XCFrOZu6Zt/YcclvA64P
         bzyt+XXXuxsKVLevLR2UptNhtMZMC5NZGOH+eCIdzYOHZcbc8QR5lUF1hcRdPylDyYcu
         4gwvdYtSTcTNk95wIq46MlPWxb6RIYQjfr5FZBQf35D8nikwvYb6GWvJATDkM8/jl4yO
         YxwQA8XepXg0T/EQxuqok3IGSiHCWkkE/7Ijn7vCORUJ62MjKAnM0yphzWc+/mMYHWvQ
         QZmnDSKnR8ukIGMaC63xD9tXevBelIXzEMMECeRwPlqkKhXhj1zzhzX3q3GKeOto1Jpw
         GPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H42zUt22pJHq35qrT9HLLcYii5EQ25Njx0nZAlGKwMA=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=EHZD4Pd5jiuodatgVOjJjXTv5EP7jwJGkQaqQNVLmdxIWv6gIqXjfkBZEOBdyTVkPT
         86i0PW6NvGMjCY/YTZDCCUcyvesvPHmZhEmCukPI1krFN5W5McwSqnaMqffwY7n6nrZd
         dY/MhgIo1MtKXAhPuDSfdMFgtqyqINTNxPjsXtEclWUMywipe3oGKmEtAf9BMK4NjOWU
         XMuCCKc0v8uI9q3dKEWPUlpnQAT+Gx+LcyPtfHAgQyMzQYxps+QBeAwwlUGjX8Ps77f4
         f2KK0z2va7SC9fClDk5/qjDAW2LvEomPgAA36hkopn4t0V7Y05Imz1cxrMNvc7ESmPOj
         RpXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777236317; x=1777841117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H42zUt22pJHq35qrT9HLLcYii5EQ25Njx0nZAlGKwMA=;
        b=ffyTlVK5c5AOuoN3Dl2/0PyI9vur4c+FE7AkPbzGbPkfiVneFnTFeIi0W0iNlgpgRX
         cIOIih/gwb0STmwtHWaykm/TjRjGPkDzDQvlAT6NIbvo0DA28lC/mf30hPS08yL5MHdZ
         dd9YLnXxTcH74A6vdZAWI+NazNrke6SEl31M5IREhfvtt6NJScw4Cgf9JTr2OT/xBOsH
         sL5hApFU4QPpbrWxdOwg1R5LfovXHGq4zhfZQsWpgVCBoN86NJWgfYaPDAnzHpzBjQOo
         jbNyFzFfPLxc0hMo8p8uVk9v5FYRvzn4aXjhhQhCPB8sODJg5SuVpjeHRUIh8VF0t9KO
         yPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777236317; x=1777841117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H42zUt22pJHq35qrT9HLLcYii5EQ25Njx0nZAlGKwMA=;
        b=PpKZF9NSDOyIqNUSahdolA+olhsRGJgo1zMdGIs1nE0AJXkfk0BLM6f2+cKcwCsECk
         xhplRDGmuIMCPjZ6VQCtrT0wyPE8PsRF2MWbZyfcIX7b5eyae7j6t+bmdIlvt2xEFO9z
         kq85SKTdzK+c7eQixjQQmKkasYAucHkD9W69TTQXwUWwXwPcCYowT9g6BvulvzzDLuYk
         gfl+S7uouterknIRb4uFdYpMd3i8X3iP5k5YpepDPPf0zSswhgXE9Vn+S/muwf4OIcUW
         6L7iv+iacGGFfGBkYgJvI3VRCqpIq5V6a64jOPsikn/FdIFSHfUbIpVRrt986pbYh/bq
         Zosw==
X-Gm-Message-State: AOJu0YzPmJKxKf+drNTqqPVQcERyQqkeDdXnk+xuZYZKsMy2eVRLXthi
	CKmn8C8d6a02uGOw2LuExkw2rRq8QxWfkaPsJIOITiqnWfXxIaHoy+Kc2Nr2FnmRmkwD2KLwQcB
	2oHT2HjtAh9C2IHbZwqEdT/2HgiJhwuMGinKj
X-Gm-Gg: AeBDieuyewQSWgKMmLqOJ8r81t2zmGfjec3AVLpFaW9scH/NUvPWKabPMSKZF4Oc0rP
	2fP3V9R31faqbstZ5OZmng6sTkNVOo67b6fvjRTUdyxNJLWgy322W90CofBwqmKP+Jcj/EjSwut
	mRZot7M2oGK7TiW4ad9Oi5NOnfFoJbxNjyrdvZz9sVtygAgNZ8c+8xOOozCWA54XP5IW9czL0Lv
	qVFI5MqbP+7/W56PirHADkRtM5QWvECWRf0HtkdsJka18w0lKgnfYDsxSTAQLbgULeXrSpaA989
	v8XgC6ile60K4suZVA==
X-Received: by 2002:a17:907:d03:b0:baa:2d37:cbf9 with SMTP id
 a640c23a62f3a-baa2d37ce1bmr1034416966b.1.1777236317215; Sun, 26 Apr 2026
 13:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <12895688.O9o76ZdvQC@rafael.j.wysocki>
 <CAGAxtY13R3F6M4HFiwwsx8SEbcUsu5mQKJrayaCGFp14cEB2wg@mail.gmail.com>
 <5112068.31r3eYUQgx@rafael.j.wysocki> <CAJZ5v0ivGuRESW2B1_+8s1=YSm9YV4FAuc1CB9FGTdwHZuGZNA@mail.gmail.com>
In-Reply-To: <CAJZ5v0ivGuRESW2B1_+8s1=YSm9YV4FAuc1CB9FGTdwHZuGZNA@mail.gmail.com>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Sun, 26 Apr 2026 23:45:03 +0300
X-Gm-Features: AVHnY4JCKXiEdZaeifSP1mB5o8qE3MJnXWsD_ALENnorm_5WHY2xGSdQErODl3U
Message-ID: <CAGAxtY3HF3iOV7ZKq9-LTjyA-p3jNVHKSi5CBM8AJ38LYUdXbw@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg | grep "frequency s"
[    8.622778] acpi_cpufreq: CPU0: Using I/O space for frequency scaling
[    8.622806] cpufreq: CPU0: Fast frequency switching enabled
[    8.622869] acpi_cpufreq: CPU1: Using I/O space for frequency scaling
[    8.622888] cpufreq: CPU1: Fast frequency switching enabled
[    8.622938] acpi_cpufreq: CPU2: Using I/O space for frequency scaling
[    8.622955] cpufreq: CPU2: Fast frequency switching enabled
[    8.623006] acpi_cpufreq: CPU3: Using I/O space for frequency scaling
[    8.623026] cpufreq: CPU3: Fast frequency switching enabled

When I press the power button, a message is displayed:
apr 26 23:40:36 srv kernel: ACPI power button event

The PC does not freeze.
The single core performance benchmark shows good values.

=D0=B2=D1=81, 26 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:54, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Sun, Apr 26, 2026 at 4:50=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Friday, April 24, 2026 11:18:02 PM CEST Evgeny Sagatov wrote:
> > > dmesg | grep "Fast frequency"
> > > Nothing was displayed.
> > >
> > > The PC froze when I pressed the power button. Nothing in the log.
> > >
> > > I applied this patch after deleting all the previous ones. Is this co=
rrect?
> >
> > Yes, it is.
> >
> > > I received this message when applying a patch. Perhaps we have
> > > different versions of the source code? I'm using 7.0.0.
> > > patching file drivers/acpi/acpica/evevent.c
> > > patching file drivers/cpufreq/acpi-cpufreq.c
> > > Hunk #1 succeeded at 895 (offset -17 lines).
> > > patching file drivers/cpufreq/cpufreq.c
> >
> > That should be fine.
> >
> > We've switched over schedutil to a different code path and the problem =
is
> > still there, so it appears to be related to hardware accesses.
> >
> > To test this, please apply the patch below (which is a replacement for =
the
> > previous patch) and collect the output of
> >
> > $ dmesg | grep ""
>
> This should have been
>
> $ dmesg | grep "frequency scaling"
>
> (pressed "send" too early, sorry about that) but sending a complete
> dmesg log (which would be produced by grepping for an empty string)
> would work either.
>
> > after a fresh boot.  Please let me know what's there.
> >
> > Also, the "Fast frequency switching enabled" messages should be back.
> >
> > Then, check what happens when the power button is pressed (if the syste=
m
> > doesn't lock up, a message should be printed to the kernel log every ti=
me
> > the power button is pressed).
> >
> > With this patch applied, schedutil will not access hardware in the fast
> > frequency switching path, so the frequency scaling will not actually wo=
rk
> > (this is roughly equivalent to running the "performance" or "powersave"
> > governor all the time).
> >
> > ---
> >  drivers/acpi/acpica/evevent.c  |    5 +++++
> >  drivers/cpufreq/acpi-cpufreq.c |    6 ++++--
> >  drivers/cpufreq/cpufreq.c      |    1 +
> >  3 files changed, 10 insertions(+), 2 deletions(-)
> >
> > --- a/drivers/acpi/acpica/evevent.c
> > +++ b/drivers/acpi/acpica/evevent.c
> > @@ -243,6 +243,11 @@ static u32 acpi_ev_fixed_event_dispatch(
> >         (void)acpi_write_bit_register(acpi_gbl_fixed_event_info[event].
> >                                       status_register_id, ACPI_CLEAR_ST=
ATUS);
> >
> > +       if (event =3D=3D ACPI_EVENT_POWER_BUTTON) {
> > +               pr_info("ACPI power button event\n");
> > +               return (ACPI_INTERRUPT_HANDLED);
> > +       }
> > +
> >         /*
> >          * Make sure that a handler exists. If not, report an error
> >          * and disable the event to prevent further interrupts.
> > --- a/drivers/cpufreq/acpi-cpufreq.c
> > +++ b/drivers/cpufreq/acpi-cpufreq.c
> > @@ -479,8 +479,8 @@ static unsigned int acpi_cpufreq_fast_sw
> >                         return next_freq;
> >         }
> >
> > -       data->cpu_freq_write(&perf->control_register,
> > -                            perf->states[next_perf_state].control);
> > +       /*data->cpu_freq_write(&perf->control_register,
> > +                            perf->states[next_perf_state].control);*/
> >         perf->state =3D next_perf_state;
> >         return next_freq;
> >  }
> > @@ -887,9 +887,11 @@ static int acpi_cpufreq_cpu_init(struct
> >                  * unknown and not detectable via IO ports.
> >                  */
> >                 policy->cur =3D acpi_cpufreq_guess_freq(data, policy->c=
pu);
> > +               pr_info("CPU%u: Using I/O space for frequency scaling\n=
", cpu);
> >                 break;
> >         case ACPI_ADR_SPACE_FIXED_HARDWARE:
> >                 acpi_cpufreq_driver.get =3D get_cur_freq_on_cpu;
> > +               pr_info("CPU%u: Using FFH for frequency scaling\n", cpu=
);
> >                 break;
> >         default:
> >                 break;
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -473,6 +473,7 @@ void cpufreq_enable_fast_switch(struct c
> >         if (cpufreq_fast_switch_count >=3D 0) {
> >                 cpufreq_fast_switch_count++;
> >                 policy->fast_switch_enabled =3D true;
> > +               pr_info("CPU%u: Fast frequency switching enabled\n", po=
licy->cpu);
> >         } else {
> >                 pr_warn("CPU%u: Fast frequency switching not enabled\n"=
,
> >                         policy->cpu);
> >
> >
> >
> >
