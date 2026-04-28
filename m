Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070824501D
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 19:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403512; cv=pass; b=Zg1HwSsu35iMOihCX7vkUWsRQ4Nd9qDRfdSkobyUOzfhRvCI9+C5NIoRfhZOq/wJ9CwDdLijrF+YZNIvttcL94H7GBJ10nVA5Gz+qvioQOFOxSEdaf3yLLKs4JDx+8NPBaYV8t/hqZyqvqugOWyM5vhB1ds6h86TIVctoHBavuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403512; c=relaxed/simple;
	bh=Humb92FTmdxnR1tjgNxmE7FrXLG/asrw1MJD00P+pg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpr8KrtBhtuxqlYIdQLr1ct9J7Yixw1LM9QuXKsOtoeVq8hSv3cLiozGs0LeQpVQG3N1vGgKOvbVsr0NM1fKbCOG74xIZUzLs3tmoaSVAoHljPG24urZ7DPUeSVSd9fkj8gG/dnIpK7eEBRR5gMIlK+pfad5QqH1wxLxVoa3tOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q61ji7Q6; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q61ji7Q6"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba8472c1613so1703199266b.0
        for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 12:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777403508; cv=none;
        d=google.com; s=arc-20240605;
        b=I4Ta4WQ4tkCc2Gm+ax6QfVU37PfWIBamLlh8jipH2EL05ipvcmVlrIkIboAkRsO2Iy
         kxjLFme0Kn0WqUm7OKiVFFPhmDU3K73zkx/W3cEbuLx1l5JUS8aNF6srVSYtKshcuPla
         OlF7WtleakEvdR6ss5dWT4PKse30DbNbk9XdC9obXDCdu0gR0Ze6JT0KXjLJKF5EFg7k
         fXZuQmp21tsI/ncjxKeOl1mRCfo2YmZ3KxyM17Qo/8nyXmZw9I4gJsEI3GfghWI6LuYd
         47OMN+NVZOiBsWKy+MftXNgtakpKLIUWlPRGk6sDlN4RMsegyf3gMaCpeC3XppkXMO9s
         /Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iecOFez/t9e4qazz5GWjB4HvrXVYjjG0JR1pPehAX8o=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=ND1nU82efIJaTG2MYsRofRCWDF930uhrItfDGIEKo/KF2kL8iyqFohKBtL37KVjk4R
         C7d4FdQcn24P84+7S9IXkUFnzPE7MlbU0v9anWxEvw7s7MehgrMIMzDwrRTaduTuKW/n
         7ApIzPtekU3LWi9zQ3iB4zFvVfqf3dKCjGa6OsO6MMPAhbb1Ql2D50Fgy3ypOzjx44TM
         WPlcTsR8exZzR5AwuQIKEpHMiPL59Sn6Es7Z+/9rV1lMgcE+nqEfDyUzwQUsVdT8xm1S
         wRnVyZbHhbeTcuXbcY9vpBeU2QAm7rlvSU/vtaOIayFWRYeFto4uubLcAWHXABC556IW
         wEHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777403508; x=1778008308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iecOFez/t9e4qazz5GWjB4HvrXVYjjG0JR1pPehAX8o=;
        b=Q61ji7Q6u6HCctCMD5PgeK36h/jg/qZhZAmXj3O5UsE2BIVCYSGRvUL2B3q7vexOnv
         BlJDc8fcGnrpIT8pfCm5nO+tIxPxCsBa45yM6rKIciSRToVDdeJc4obqOcs4dFEo/+Ip
         z58iOYkrT8nHhm8iJgSeoyBSmYu0ZmkRZ44O8aAoSBlUXf1Hh8Q1euP88mCL/7MInRNl
         g7lO2FLUlCVAPW+NRF1RUNyHUi1dOPR4N+pZxrkQhm+VwgYtdfxsUKnsGMbivA/M0oP3
         Hq6b4Ws6UAEUlYAB8s2BJp8+ZICli5pdXBYAOllS5MffNor/C8ZA6qCRWT1W2YGMcQ8Z
         Ky7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777403508; x=1778008308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iecOFez/t9e4qazz5GWjB4HvrXVYjjG0JR1pPehAX8o=;
        b=KTzcB4eL/ZWW6p0LIb30Epi36eURd2BeJvRCRbrhd4nuy48CMZ/J2vc8uedZg1a1QW
         i0UsV2mY8Yd17L8j2iNV9cXButb187GsGoh8pa+TYZ/mn2G8faGPD6W3Cr9PUwcbuUUh
         SalU53azrZZ8zydwNXDOrxFzAJWUAWy53hw+p5VBsoMw/yAFHbJxIaZsAuiqNWDij7+x
         Whbx38x8jqgItn0ohSoAovMUcghnltbmEYQfg5ER9ZQ1Pdt8lTr/qDuwTOZt3+/ZLY1u
         I8d+qZjX9CbDpMWi8su0+GaEkBNRInEi+teZpkl/APACQYYVz3h7eC8DCZck8i0uPxJ5
         bF8A==
X-Gm-Message-State: AOJu0YwxyPC82cU8AbrV9ZmRTogQwHSZQwjD4jSIgTTwii3Kcs3ASmOU
	DppEwlDgY1oLuB/qsuWfvFBEbJm5d85SXwCMRZmNzgJx2BuqPj0EDltmfy4BR26rqcufeNuXf2l
	uqGbtI4FzufLFVofU/IGMxlMT3VsHJhg=
X-Gm-Gg: AeBDieseh83qD1hM37w1GMavLWROXtCoHGw2tPiXzMbZv3L1KLwDh2Jv5rgxEVlOo7R
	E0t/2czF/De44xWxjzxWAdiNSyE7nDiLFnHDm/jm9COWoubg7M2SwQJFk+GnCoUi1kUyzUU/DR7
	RyPiHtlv0gwk9FuTxBlDh0mh74OSRF0scAjtHvCbF6hPBqd540poOkuQULZkyKc5dyovI87hskf
	2+as4HIJzDWTbrA6l4Hgpr6CRnNaaOaPpgHULsXc3x9Hdmxae7uwVGECAMsMQ3gCo4DppuLfh4p
	99ErIGrL7Tjnw3cmrg==
X-Received: by 2002:a17:907:84e:b0:bae:658a:61af with SMTP id
 a640c23a62f3a-bb8039749cdmr271246266b.23.1777403507717; Tue, 28 Apr 2026
 12:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <6006426.DvuYhMxLoT@rafael.j.wysocki>
 <CAGAxtY2QRhfoP5NjMQOg5WB15DpPcmX3aBWEy70xYKGMveZ_zg@mail.gmail.com> <6281827.lOV4Wx5bFT@rafael.j.wysocki>
In-Reply-To: <6281827.lOV4Wx5bFT@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Tue, 28 Apr 2026 22:11:34 +0300
X-Gm-Features: AVHnY4L377X2QAXx4O0aamxxBtBzAaEfurvlcEiSGehkTu_ruA8b29duslqn8ck
Message-ID: <CAGAxtY1VBXN_6xY0WiraJt-BQiYp_kSdTt8xbPkgP8xPB26=WQ@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the PC froze when I pressed the power button.

=D0=B2=D1=82, 28 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 20:40, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Monday, April 27, 2026 11:49:51 PM CEST Evgeny Sagatov wrote:
> > apr 28 00:48:34 srv kernel: ACPI power button event
> > apr 28 00:48:34 srv kernel: ACPI event status I/O port number: 1024
> >
> > =D0=BF=D0=BD, 27 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 23:31,=
 Rafael J. Wysocki <rafael@kernel.org>:
> > >
> > > On Monday, April 27, 2026 10:12:33 PM CEST Evgeny Sagatov wrote:
> > > > dmesg | grep "frequency scaling"
> > > > [    8.552380] acpi_cpufreq: CPU0: Using I/O space for frequency sc=
aling
> > > > [    8.552386] acpi_cpufreq: CPU0: frequency scaling I/O port numbe=
r: 2176
> > > > [    8.552478] acpi_cpufreq: CPU1: Using I/O space for frequency sc=
aling
> > > > [    8.552480] acpi_cpufreq: CPU1: frequency scaling I/O port numbe=
r: 2176
> > > > [    8.552584] acpi_cpufreq: CPU2: Using I/O space for frequency sc=
aling
> > > > [    8.552586] acpi_cpufreq: CPU2: frequency scaling I/O port numbe=
r: 2176
> > > > [    8.552668] acpi_cpufreq: CPU3: Using I/O space for frequency sc=
aling
> > > > [    8.552670] acpi_cpufreq: CPU3: frequency scaling I/O port numbe=
r: 2176
>
> The I/O ports that play the role in this issue are separate from each oth=
er in
> the address space, but that need not mean that they are physically indepe=
ndent.
>
> My current theory is that accessing one of them while an access to the ot=
her
> one is still in progress may cause the platform to lock up, or there is a=
n
> access pattern that causes that to happen.
>
> Let's first test the simplest variant of that theory and see what happens=
 if
> all I/O port accesses in acpi_os_write_port() are serialized, which is do=
ne
> in the patch below (it is a replacement for all of the patches sent so fa=
r).
>
> In addition, that patch causes schedutil to use the slow path for updatin=
g the
> frequency because the I/O space is generally somewhat too slow to be used
> from the scheduler context relatively often, but that should not affect t=
he
> behavior related to I/O space accesses.
>
> Please check if the system still locks up after pressing the power button
> with this patch applied.
>
> ---
>  drivers/acpi/osl.c             |    9 +++++++--
>  drivers/cpufreq/acpi-cpufreq.c |    9 ++++++---
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> --- a/drivers/acpi/osl.c
> +++ b/drivers/acpi/osl.c
> @@ -700,8 +700,10 @@ EXPORT_SYMBOL(acpi_os_read_port);
>
>  acpi_status acpi_os_write_port(acpi_io_address port, u32 value, u32 widt=
h)
>  {
> -       if (!IS_ENABLED(CONFIG_HAS_IOPORT))
> -               return AE_NOT_IMPLEMENTED;
> +#ifdef CONFIG_HAS_IOPORT
> +       static DEFINE_RAW_SPINLOCK(acpi_os_write_port_lock);
> +
> +       guard(raw_spinlock_irqsave)(&acpi_os_write_port_lock);
>
>         if (width <=3D 8) {
>                 outb(value, port);
> @@ -715,6 +717,9 @@ acpi_status acpi_os_write_port(acpi_io_a
>         }
>
>         return AE_OK;
> +#else
> +       return AE_NOT_IMPLEMENTED;
> +#endif
>  }
>
>  EXPORT_SYMBOL(acpi_os_write_port);
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -878,6 +878,10 @@ static int acpi_cpufreq_cpu_init(struct
>         policy->freq_table =3D freq_table;
>         perf->state =3D 0;
>
> +       policy->fast_switch_possible =3D !acpi_pstate_strict &&
> +               !(policy_is_shared(policy) &&
> +                 policy->shared_type !=3D CPUFREQ_SHARED_TYPE_ANY);
> +
>         switch (perf->control_register.space_id) {
>         case ACPI_ADR_SPACE_SYSTEM_IO:
>                 /*
> @@ -887,6 +891,8 @@ static int acpi_cpufreq_cpu_init(struct
>                  * unknown and not detectable via IO ports.
>                  */
>                 policy->cur =3D acpi_cpufreq_guess_freq(data, policy->cpu=
);
> +               /* I/O spcase is too slow for fast switching. */
> +               policy->fast_switch_possible =3D false;
>                 break;
>         case ACPI_ADR_SPACE_FIXED_HARDWARE:
>                 acpi_cpufreq_driver.get =3D get_cur_freq_on_cpu;
> @@ -912,9 +918,6 @@ static int acpi_cpufreq_cpu_init(struct
>          */
>         data->resume =3D 1;
>
> -       policy->fast_switch_possible =3D !acpi_pstate_strict &&
> -               !(policy_is_shared(policy) && policy->shared_type !=3D CP=
UFREQ_SHARED_TYPE_ANY);
> -
>         if (perf->states[0].core_frequency * 1000 !=3D freq_table[0].freq=
uency)
>                 pr_warn(FW_WARN "P-state 0 is not max freq\n");
>
>
>
>
