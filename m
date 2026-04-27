Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1267B2FD68B
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 20:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320771; cv=pass; b=cXmjMuZOut5Ulvnu88123Dz/Z5STNiewi4RIHkRwoHKJxJmPN2WC9Ou7rCUOdaKtOFZxCl+wII51fie5NRnCeGGD5rrTrptuA2UwJ6wLFTS+i6k/9phYCYumz88g18gVqCZ0c5jTOiI4uTu5h61ooULVsJ1RtKCXksAzdcaahRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320771; c=relaxed/simple;
	bh=9vW/3lbk7DRjYsT62iTadU0jnqJlWuda0DAKNWjxLyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4zifSKSq84hJh6fge4XAdIgmctrOQ83MZH4QBx5B7DIo/jkI1Peny1YNnMPckNSV5iD4KMCF5mrfrdQuAmB15OAsVC9CFVuyAp1fu9v1sol8xJyXArjr6A5T0w9ASvU2ox6KlMS8XWPg8S9RzOibrhN1PpuZ/gw36CAZQC/Bys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYKAseaw; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYKAseaw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba6838e76f2so1071438166b.2
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 13:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777320767; cv=none;
        d=google.com; s=arc-20240605;
        b=i95hNYPsNGbj1DGqw/kw6uPJFDkjmJ5GrUF+jxK7YXOyjTr/0T6H1X15UnUfqRzu2I
         NVkQlLbCvtiClEbB8Fq3DM/Yv2jXWhoHYLi6sE0W1eTWDkmg6nfInECJTQ7Fw62P5+e+
         sETyRZVEWL5SudahOPGnfNs+RPKPKDtSYMOnjGpHmCahc0GugFG65SeMD3JZqAf7NlwR
         QMkElc0v3IX3D0fL6MivNN+Y7zMAaoUJQ63u4iABnON5pjwuUBEuqeGDLiaOr/IrPqNu
         AtYG3mzrpZ3/+D1nH46xs5ylxeHbuaZcRx2jkudXaRnx5W1cpGAsq4zmUvZJuXeaLd+P
         AwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COXxo1EcXVAZxC6kJw+zQp1hv6Gelh8PpeiNjEsxWao=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=Z3b3pQuJ915tsBRAOUUVsWj1hIbZdOTMlTjP7WcPWle0xHhNEazBxKfIkoYZiryCXD
         QnceG27TRjNzfvM7gNRGxj3ZubB+h8tnFXXCpoHDzHR44n8u25Jlkzr4Sc0L3xXCcwpm
         y5CqZa5EzQGH07USpw+wS/WaAArMTHIxdu9P9p1ukR70YRjaCsFfwEArpEZckK4TxZAf
         CaFNuXQbFpYmun4fPmgKOTpkeOG6jetrgJKZB7iMS4zcB3H/y45Nu4YqMfDbFSMEGJ2w
         0LaSY/GAx7o6LpQzA7/oc2TP9g6ntktbRtVMXrBTQOKXO2UzQse322rLAHuN9s2BwLBc
         havw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777320767; x=1777925567; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COXxo1EcXVAZxC6kJw+zQp1hv6Gelh8PpeiNjEsxWao=;
        b=WYKAseawmq86AkIsquZRnB7NilUyH0lZWPcqtiA4PHv7izhIpM8wPJYIWgj8UPUriV
         CtqypHHfvsgYpxGevtArPn+f1Lk3qtT0CDzOLvwrsQicwmgpLELImt/OUic1KCD8KtWm
         OS8nv4VeWQrroYyx8kXOaxrwrXvtSXS25K7sEdmAD5tEExRo0KiL6nwlnRWDqbANIR/N
         AkbS06EOcTqhRWy2frSr0hDoCGLH5RjaetRfZoMxGxRUB/12ybmcswn0UMgNCrcvr/Og
         23+OEyfBxT06ngKhsXo+jeQD1FV7v63eS4Vqs2XhLERaXjwv23DF3Tevw0wCPBuAFmcM
         pIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320767; x=1777925567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COXxo1EcXVAZxC6kJw+zQp1hv6Gelh8PpeiNjEsxWao=;
        b=WN9e3+sS06THGDMBLZGF1ofgWsDkaDBK2ZoaOSWBiiq8PTRwhaDRHV33md+Zqd7bra
         O6YikKqLsyk5wszDcqFq+E8mOEy4n2MYxLP600bAH2cGi9WVO8s6N5iHZAQwJVTc00lX
         THwz3xYsp957FvzLomvbaCkuZhXIvFpR8whe0y9/krgbWe3T7OCbQyU4yGhGLC5Tmf6F
         lOQc08ysPepCM+Rqz4pnvsk8e1OeACEEfJwaK7TtE1H4gon2mBXx9JO9C1j3OvX8CYhY
         wfvGOSxCVD9cxPaRhFrIb1o0LldJtm8EXNt2IZ1qfYQpo4uZMTxdWvp/FvLws3Ax0ZE8
         F5eg==
X-Gm-Message-State: AOJu0YxEagIVMOJcdeMrectMFsiM/LckesjZ3NKS7VBF4NtIR0R+im5v
	tME+OAqBtUYe6vGdkGyS+43pp9p1sppLjLY8NEAxdV34VKsTxrL60AwIoD3P/nR3lm6DvfSNO6R
	Ua9rgEz61etmfhCtd04QE/U0PCWPR2D/x9ZRa
X-Gm-Gg: AeBDieuJ3fVnK2/+FfjaRh9bVnQnFIaNvwT/JT5CyST50gvk2NmR3YsBgJgqFGAqXA1
	xTuC5j0b2ZwQ+7DjP8eRUNNWDDQk9aM6/gh9GhvehtBHrarHgZsuU8TbykAClXQA0km9KhSaL1c
	4VJXpR+H1S1aFTpTZ5CrmPhlHxeh/Pg0HtNTZwZCLDRTY+V+BtjUz49+TM157z8voWjj2dtXjDv
	vgDD5IjWSYh0zlZE9TgPFG1cGlRI+On2IPNHQj2L8CsXZ8CC3sLYVB7opbsvpMzHAuPQ3a1C+zq
	P4BbHZx8HahDHdDTaQ==
X-Received: by 2002:a17:907:c80d:b0:bad:9363:901c with SMTP id
 a640c23a62f3a-bb801ad745dmr17228366b.17.1777320767005; Mon, 27 Apr 2026
 13:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAJZ5v0ivGuRESW2B1_+8s1=YSm9YV4FAuc1CB9FGTdwHZuGZNA@mail.gmail.com>
 <CAGAxtY3HF3iOV7ZKq9-LTjyA-p3jNVHKSi5CBM8AJ38LYUdXbw@mail.gmail.com> <6005325.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <6005325.DvuYhMxLoT@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Mon, 27 Apr 2026 23:12:33 +0300
X-Gm-Features: AVHnY4K1H0QdQfslenLzI8QP0Rb2KcBnE4tILgx6uOQOuGCNKAaG_1hI1lBixqo
Message-ID: <CAGAxtY28bho6+PRoEypepAK1UpmGQ8WzkvPnUEmGvx7vWqkHeA@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg | grep "frequency scaling"
[    8.552380] acpi_cpufreq: CPU0: Using I/O space for frequency scaling
[    8.552386] acpi_cpufreq: CPU0: frequency scaling I/O port number: 2176
[    8.552478] acpi_cpufreq: CPU1: Using I/O space for frequency scaling
[    8.552480] acpi_cpufreq: CPU1: frequency scaling I/O port number: 2176
[    8.552584] acpi_cpufreq: CPU2: Using I/O space for frequency scaling
[    8.552586] acpi_cpufreq: CPU2: frequency scaling I/O port number: 2176
[    8.552668] acpi_cpufreq: CPU3: Using I/O space for frequency scaling
[    8.552670] acpi_cpufreq: CPU3: frequency scaling I/O port number: 2176

Messages that appear when I press the power button:
apr 27 23:07:33 srv kernel: ACPI power button event
apr 27 23:07:33 srv kernel: ACPI event status register ID: 3

=D0=BF=D0=BD, 27 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:48, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Sunday, April 26, 2026 10:45:03 PM CEST Evgeny Sagatov wrote:
> > dmesg | grep "frequency s"
> > [    8.622778] acpi_cpufreq: CPU0: Using I/O space for frequency scalin=
g
> > [    8.622806] cpufreq: CPU0: Fast frequency switching enabled
> > [    8.622869] acpi_cpufreq: CPU1: Using I/O space for frequency scalin=
g
> > [    8.622888] cpufreq: CPU1: Fast frequency switching enabled
> > [    8.622938] acpi_cpufreq: CPU2: Using I/O space for frequency scalin=
g
> > [    8.622955] cpufreq: CPU2: Fast frequency switching enabled
> > [    8.623006] acpi_cpufreq: CPU3: Using I/O space for frequency scalin=
g
> > [    8.623026] cpufreq: CPU3: Fast frequency switching enabled
> >
> > When I press the power button, a message is displayed:
> > apr 26 23:40:36 srv kernel: ACPI power button event
> >
> > The PC does not freeze.
>
> Good.
>
> > The single core performance benchmark shows good values.
>
> That most likely is a coincidence.
>
> The above means that the issue is related to HW accesses in the I/O space=
.
>
> I don't actually think that the writes to the I/O space outright clash wi=
th
> each other, but the timing between them may be somewhat overly aggressive=
.
>
> Let's first check what I/O ports come into play though.
>
> Please apply the patch below (which is a replacement for the previous one=
),
> run
>
> $ dmesg | grep "frequency scaling"
>
> after a fresh boot of the new kernel and let me know the output of it.
>
> Then, press the power button and send the messages printed after that.
>
> ---
>  drivers/acpi/acpica/evevent.c  |   12 ++++++++++++
>  drivers/cpufreq/acpi-cpufreq.c |    8 ++++++--
>  drivers/cpufreq/cpufreq.c      |    1 +
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> --- a/drivers/acpi/acpica/evevent.c
> +++ b/drivers/acpi/acpica/evevent.c
> @@ -243,6 +243,18 @@ static u32 acpi_ev_fixed_event_dispatch(
>         (void)acpi_write_bit_register(acpi_gbl_fixed_event_info[event].
>                                       status_register_id, ACPI_CLEAR_STAT=
US);
>
> +       if (event =3D=3D ACPI_EVENT_POWER_BUTTON) {
> +               pr_info("ACPI power button event\n");
> +               if (acpi_gbl_fixed_event_info[event].status_register_id =
=3D=3D 0)
> +                       pr_info("ACPI event status I/O port number: %llu\=
n",
> +                               acpi_gbl_xpm1a_status.address);
> +               else
> +                       pr_info("ACPI event status register ID: %u\n",
> +                               acpi_gbl_fixed_event_info[event].status_r=
egister_id);
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
