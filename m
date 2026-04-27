Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACDB39FCAF
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326609; cv=pass; b=mnl3fEvwJ6GhytSpSf3++RvlhNdRFxYpb/U/Jyfy6RS6zXuPjhdjjHOdVkpIbunlRQYkgY1rXWczk/BpZ1n4OoLCAMo08K9eCh8TSlYisT3rdxaTF1BeTTqKAFjnDaQwUedtQj6bpIeZ8VaA9WGgG8h8/4LBiPTqGqCysDKyQSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326609; c=relaxed/simple;
	bh=L7xa02X7WdX9x9vHRITtqt4+zXkzCD26OYMMG+OjAXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZManF3lkcw3iPmFMJdIRPw+CV0mhcapO0pb+L/7106L7cGja+zIZDbdk8i90rA4NwrASDvfjdPgQq1zcZcm1MoZlvkpKtREsZQ/CjeG5gmkTuOOd2KKuRKwDfKwbck9sXVDWHK/GkAEweebR3Gf8bgbUWnIMCUQwO9Bf+CHN1Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH17PN+/; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH17PN+/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba92146cc86so1161656266b.1
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777326605; cv=none;
        d=google.com; s=arc-20240605;
        b=ahG5LV5JBYos3t/iUL6qWwC3nzBhTvSQw0SaN83NQf2Zm3oQ7wIRq5pmSHlf0Rutfk
         efXaM0Okpv+fV8CPZLViMA1DeDkIFdNcC2zeZ+8h7mvjFuI6UfpdVsky85uLQAJGuALd
         unKsUxY6UIzgyWq1rkhKttzYWsu0gFQUX04CFHZp9Vd4Idrsj6+zzD9EftX69Wb9bp+u
         QJcpdv0SMLRb1aZCVMXCY5XWZUy2nCbt46zfEu8QtHNHiNNwBhPnOi+EuVCLgr4pJ5fG
         Nu6bTlx78HJA6xgtcMGaBVMhK+rWVXeEWVxxtJacVpLGe9+DtOdHtmrhpHTQA+oAkWyj
         m84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXNTkuokTYZhJ+ynIL21Ir8zjvS3sW03jWnhSBy68kg=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=ZLF2Rn1VnVnW8IqVml/4lsu7qJm5eLnC20O90g9rcTRAgKInAVy+aF1FAYuNwserFX
         CKykav9waY3E/tJ284UX7eQxqHK8yZEOuUlnmt/8+OH/QYsNx63Bovh6a9XtYyyPz8BG
         BLKVpW7ckeEq5S5bsqBtsxt88T0G/G2GfG2uA0kjFstOrLc65Lt0lBHoM7wiN8l0sZ0I
         5kCyBq1Pw83l5nzF2fBQZDJo4id28iViMGOVImC1DNNTaeRnI3X0hwBo4ZGoGDddl+N0
         Y25m6dpIblP1Zn4bGUAFxtCXiJmGmt4GT0AZyfauVmhwvWlKGyLIggTdNVgPYlCY5trj
         f8nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777326605; x=1777931405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXNTkuokTYZhJ+ynIL21Ir8zjvS3sW03jWnhSBy68kg=;
        b=OH17PN+/+2m5wGIx22aze0FVohLS0DWA025bLdLeYUie8MyH/4iqnVS2XAJf4tRESO
         ce6dbRzI7nAhoAadLQ3h+re5DvjM21nwFB2hlqjlQaAoCvxcBWNPsf2ybIDKVBpDD72E
         i8pvF/45NBHawSgu3qH8MDdzjDUtdnJ7apyDF1Kiw0xqekazfsAz9DGllcBJ+LO8rnDz
         B+SS0c5eXtwM1v6L8K5fvm418KtrU1Pu5AfXhqyue8BKS+N7Rd+FKk+PQv6zNWLUpY5N
         3ersKyA7KDHezMld1cydqM/VPIgyFBethD/+3Kq8yWC0iHQ8Fb1DK+OTCLnD71KULcwJ
         4FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326605; x=1777931405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXNTkuokTYZhJ+ynIL21Ir8zjvS3sW03jWnhSBy68kg=;
        b=b9rUhOpeKoUBZJh0X59G+c5UlTpNkD5BVlarUZ5DFHKgRM7DDLWYmDxqGX8sUi84rF
         PGKWVCUKEO0krEqd6Lk6x3WKDtUFcgtQ3wFG12i6LUWvtRGaDJJNEx3ciZwM2drA+DoP
         n0rYj8rvgW3f5NdUS9Dgh71WPeQG3OpqcDQJEUszjTgHZvp65ek44KQyQRTM1qMSO5H4
         YUIHpIqysaCva54htULs2NVMbI0LyJxnm4nsBrXfaZxPg9mD9BBkLykvU/Yzy7Q8pD6c
         cpmBPGpQ/MDFDEb8UxTGGoY0uDtAoSSdcU+S+YV3oZ1TMNtzj2F2O/+J3HOWSJh0oZax
         /+Nw==
X-Gm-Message-State: AOJu0YzegkeB+EAmt2xpaSFl7MFtAMZFc3K4s4ABLNjAFEmxKiRNjvEK
	ry0EkemPMBfa4HmUI9e07MX/F8CKz+0u/Tc9WpM1Q/EbGT/IYk+zZ4YUdDH1QVD3Ucn4OCcvTH4
	20FC01I5qdKbl2jdyFW3NhiGiF9x9Fvs=
X-Gm-Gg: AeBDievk9OvnDH3tsNq/77A69zsreFnN3X0ybjK3DNa+cPnnsG9uDe5u+wN6+JmC1Fs
	QBginVNDYr+FhP2blEmep9ija9jWdVhwgvWdGvEdV38Fd+awhnIZA00q9S9GlwEMGftoWrr6hKu
	//T747uftOlbQYwI3ZTkfTBDEXwHGOkmuVljN7FJU8qORFs36UoWlV0Y24DkLPKIW8IiO0q2hXH
	UOOfddlDujnobrgdXx3IvoIbfwvVBBBql7OuMQ1MyBznFAQ7UxqXsIavzxUsYx8oAaqjhPobhD2
	AzDaap1iawLjwq5ZNA==
X-Received: by 2002:a17:907:5c4:b0:bb7:e621:1fb7 with SMTP id
 a640c23a62f3a-bb803d65610mr27224366b.36.1777326604854; Mon, 27 Apr 2026
 14:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <6005325.DvuYhMxLoT@rafael.j.wysocki>
 <CAGAxtY28bho6+PRoEypepAK1UpmGQ8WzkvPnUEmGvx7vWqkHeA@mail.gmail.com> <6006426.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <6006426.DvuYhMxLoT@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Tue, 28 Apr 2026 00:49:51 +0300
X-Gm-Features: AVHnY4LYfieYFEwFkIH9vT0bp_c4_c5sUBtPRqiCRcUPccxdXq9Voy4SegmRU2I
Message-ID: <CAGAxtY2QRhfoP5NjMQOg5WB15DpPcmX3aBWEy70xYKGMveZ_zg@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

apr 28 00:48:34 srv kernel: ACPI power button event
apr 28 00:48:34 srv kernel: ACPI event status I/O port number: 1024

=D0=BF=D0=BD, 27 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 23:31, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Monday, April 27, 2026 10:12:33 PM CEST Evgeny Sagatov wrote:
> > dmesg | grep "frequency scaling"
> > [    8.552380] acpi_cpufreq: CPU0: Using I/O space for frequency scalin=
g
> > [    8.552386] acpi_cpufreq: CPU0: frequency scaling I/O port number: 2=
176
> > [    8.552478] acpi_cpufreq: CPU1: Using I/O space for frequency scalin=
g
> > [    8.552480] acpi_cpufreq: CPU1: frequency scaling I/O port number: 2=
176
> > [    8.552584] acpi_cpufreq: CPU2: Using I/O space for frequency scalin=
g
> > [    8.552586] acpi_cpufreq: CPU2: frequency scaling I/O port number: 2=
176
> > [    8.552668] acpi_cpufreq: CPU3: Using I/O space for frequency scalin=
g
> > [    8.552670] acpi_cpufreq: CPU3: frequency scaling I/O port number: 2=
176
> >
> > Messages that appear when I press the power button:
> > apr 27 23:07:33 srv kernel: ACPI power button event
> > apr 27 23:07:33 srv kernel: ACPI event status register ID: 3
>
> Of course it's a power button, so the register ID is 3 and the register
> is PM1.  Sorry for missing that previously.
>
> Please apply the slightly update patch below (which replaces the previous
> one) and send the messages printed to the log after booting the new
> kernel and pressing the power button.
>
> ---
>  drivers/acpi/acpica/evevent.c  |    8 ++++++++
>  drivers/cpufreq/acpi-cpufreq.c |    8 ++++++--
>  drivers/cpufreq/cpufreq.c      |    1 +
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> --- a/drivers/acpi/acpica/evevent.c
> +++ b/drivers/acpi/acpica/evevent.c
> @@ -243,6 +243,14 @@ static u32 acpi_ev_fixed_event_dispatch(
>         (void)acpi_write_bit_register(acpi_gbl_fixed_event_info[event].
>                                       status_register_id, ACPI_CLEAR_STAT=
US);
>
> +       if (event =3D=3D ACPI_EVENT_POWER_BUTTON) {
> +               pr_info("ACPI power button event\n");
> +               pr_info("ACPI event status I/O port number: %llu\n",
> +                       acpi_gbl_xpm1a_status.address);
> +
> +               return (ACPI_INTERRUPT_HANDLED);
> +       }
> +
>         /*
>          * Make sure that a handler exists. If not, report an error
>          * and disable the event to prevent further interrupts.
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -479,8 +479,8 @@ static unsigned int acpi_cpufreq_fast_sw
>                         return next_freq;
>         }
>
> -       data->cpu_freq_write(&perf->control_register,
> -                            perf->states[next_perf_state].control);
> +       /*data->cpu_freq_write(&perf->control_register,
> +                            perf->states[next_perf_state].control);*/
>         perf->state =3D next_perf_state;
>         return next_freq;
>  }
> @@ -887,9 +887,13 @@ static int acpi_cpufreq_cpu_init(struct
>                  * unknown and not detectable via IO ports.
>                  */
>                 policy->cur =3D acpi_cpufreq_guess_freq(data, policy->cpu=
);
> +               pr_info("CPU%u: Using I/O space for frequency scaling\n",=
 cpu);
> +               pr_info("CPU%u: frequency scaling I/O port number: %llu\n=
", cpu,
> +                       perf->control_register.address);
>                 break;
>         case ACPI_ADR_SPACE_FIXED_HARDWARE:
>                 acpi_cpufreq_driver.get =3D get_cur_freq_on_cpu;
> +               pr_info("CPU%u: Using FFH for frequency scaling\n", cpu);
>                 break;
>         default:
>                 break;
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
