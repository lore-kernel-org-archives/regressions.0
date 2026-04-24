Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96DA33D512
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050427; cv=pass; b=FCnAJOTxcxekDeD4K1aUReMD+QGcfzTvqjGGGd+W8G2cS8E1v2679cwinjfRQYjN2ktlY9MIelSR6crq8sPifOz5QM1k0VW+qQlpHPHzzrjcaVR39TaOSrLYkldJ3p3HWp/IHX8eeU1zRREDfC85U8PiZ8iTFV65abvO24zphPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050427; c=relaxed/simple;
	bh=24Zfv+qvRFEUO3TUOKmBVNj0oMoEPk55Nlkrv/OpgNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpytEpYxQlnAewUULQcO0V1p1DYRx/TDCv8oc3IsBOsK3bBEYl+BvDJHm3caW8VMjQiAZ0APfjAPGk9LNc/EGnuVYzUXrfey1e+VdeIbkpn50O/dqSJHrRWr3RQwqvMA+fzejJJiHgZOsGN/jHrAySLqpk259aGP1edGUh6IIMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfDmVZj9; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfDmVZj9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358dd7f79so310660966b.1
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 10:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777050424; cv=none;
        d=google.com; s=arc-20240605;
        b=KRp8W+b0yvuGVoWmulGnbCf3wL5M1ce6fN+Eo0V4v7TTg7yZz49SHEWSJMjY9pwaqj
         MQ1la1nGPll69aj5x1f7UAgEBeV7q2bezBLahYOgMJMRDpO+ENfperWciRAmyPB8MCJu
         SsNNJH8iPedefI2EayBsR/X7jpX8C1/ANV/keDN1PmIrTiXJD393cRwJkq790YptaOig
         fiWX65UpfpetVPHbpZHLeDHk3tuU3qm6HFiQJT27T03+JDdrCBpp+p+JglpXg99kR5zU
         vTiXsGNydTPLrtTGaptpjIexE4QyM++k3Wk0LGQBQG+cYxmcRZ0WOBu+hEClbOOV78Dd
         DiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USoxp0h405rV0N6lkVHBax6uv3vDEH6jVbUSziMSuKA=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=S89fvHVMYIBEnttnsP9mt85xITstJaV0+vm4eiR7IEZfpo0ZHAJrnL4vNO77uvDsNe
         MW0jzvJ7XS1rCmEHN9ob204ex4deVM0xqQI2FU/QTi+yNdKIceXMPn58li3mCCw0Eogi
         iN6ngPKsT1egh81xzs8h75mdxofmya5YA+YxuNASHCDnCOj5PkvrwbHsS+jKQqR07V48
         OwFgAgusmtylKlaUfwauI9D/1TJ/+5KmHA9otcOUOriKE0fqbvKErrAgUu7F7sKcaWUK
         UXe9SsZ/7tmLpbcQRt6HJXWmobGvfJhZdQAsesHXEMFSyQ4jRVpYLchKBz22JhYnCNAU
         bMqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777050424; x=1777655224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USoxp0h405rV0N6lkVHBax6uv3vDEH6jVbUSziMSuKA=;
        b=gfDmVZj9FsnTiEl0XAJsJW2Dik2g4rjWX08Za4RD8251pUfgfRYNgXkx+dEpdrRXTP
         rrpooT/44bS+JjC9LNekRUTg6ddGSOdsYq49spJH0fGOzuPnG1e6SDaGLp/c0/X4BmX/
         SWdiQus6b81JOLA5sMb1A0NleDbRX8I13VSseLeORW3FbsLriPKCTWrFd/ds0jGcXZLH
         Ff2l6psM4JRlRQACoCKL1oG2p/UW4yBfx80+b2mJZlC3RwQrVWfAqh7wcvW0xcAmsC0/
         ZfERasP+EIm66P7w9FYyxCj7cVetj/HjT6sl50XWyEEbe3F8eeyJc7zqqYcjAesViXT6
         ihng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777050424; x=1777655224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=USoxp0h405rV0N6lkVHBax6uv3vDEH6jVbUSziMSuKA=;
        b=aOP3fwYeV8OayYUiFwemljqId8dvsNBchFmsxLCU9xvFTbUgk2aSK3aRYEHMH7S2of
         8h3oFq6PvLkH4NQUDMLOvGB0kSwtyGZBO8uA3QYVZlldtelI+e/Xot705xgyF3KFr/U1
         KfIA0MbqkTe/Ysdeqn11RZxfjJuXCNWqItkFu/3zTgXCyineAbWVguxLliQGev69CjuR
         fM2i00VkqQevaHBJvnNpLlgSraCXYJ1YKfOTCEK5lxFLY6gdbOfOYsDuXjvzYH3pHm0R
         Icb83qYHzMmXwv1/u/GD/D8MkGd1Z7DI/x+RfrVPPiBzvumXjgCzRBhyV/42HfigVGgO
         4G7g==
X-Gm-Message-State: AOJu0Yw89WqCd3bze4rMpIsJIps/GTBXpi3E9pB8cwikhWXHR6VPDDbG
	Y5aNuTEljcMvcWaVNdz65n69Ao9ihZdSnaDBAyLjLNFxPIHqufWU4UPPNaAWYEtFNjvU+7/bRZo
	z4ox1SaaH4XYRus+dsfyYWggDY4QL/zc=
X-Gm-Gg: AeBDieu+5esypRS7pWlgWtVrsj8cjTk5IlwVHbrfwbWn3vGWiqk0pJ9Jh5a40g4PuKy
	nTmFMDi387vI3OBOPs2URq/XGywA8lgYscEd+uKjL+QWn97N7nneJoGVDiy0y4LohwEssIZsBh2
	lbApc9s5zpwxLq1RUQycWpLlBgF7HGV0G4MYYBxhgCyyXeNwthPxRDIUNIkszA+Vtiwb5rLrGf2
	7HBswOxeO3MbXJviO2CedQwuqvQXVLyFretY/rQM/v7yofhUXcguBlDIqp4f23Funqg9ts8F04l
	d78srzWBzIphI71cNQ==
X-Received: by 2002:a17:907:9729:b0:b9c:30b7:770f with SMTP id
 a640c23a62f3a-ba41b5d2827mr1521834466b.34.1777050423823; Fri, 24 Apr 2026
 10:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <5996744.DvuYhMxLoT@rafael.j.wysocki>
 <CAGAxtY2vstAuswt0b6sS_0Gi1=S6fd6cetskjfOEKnWqmMZBiw@mail.gmail.com> <5107109.31r3eYUQgx@rafael.j.wysocki>
In-Reply-To: <5107109.31r3eYUQgx@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Fri, 24 Apr 2026 20:06:50 +0300
X-Gm-Features: AQROBzCcsjsysuspgm4qM23t34TrUa56IeiNQj-n1rHW_AyJrvCF0ma597wuQqA
Message-ID: <CAGAxtY0av_gAk6Up9W8RHjrzWurHEou4RBNnv5wwSEsTUNT52Q@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg | grep "Fast frequency"
[    8.903099] cpufreq: CPU0: Fast frequency switching enabled
[    8.903181] cpufreq: CPU1: Fast frequency switching enabled
[    8.903247] cpufreq: CPU2: Fast frequency switching enabled
[    8.903316] cpufreq: CPU3: Fast frequency switching enabled

When I pressed the power button, the PC froze. Nothing in the log.

=D0=BF=D1=82, 24 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:40, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Thursday, April 23, 2026 10:07:39 PM CEST Evgeny Sagatov wrote:
> > This patch doesn't change anything. The PC remains frozen when
> > pressing the power button.
>
> Well, thanks for giving it a go.
>
> This at least means that the issue is related to certain activity in sche=
dutil,
> and the specific values used by it are most likely irrelevant.
>
> This time, I'd like to check two things in one go.  First, whether or not
> fast frequency switching is enabled on your system (if it is, it will exe=
rcise
> a different code path in schedutil) and second, whether or not the power =
button
> press processing gets beyond the clearing the associated event status bit=
.
>
> For this purpose, please apply the patch below and (1) after booting the
> system with the new kernel, run
>
> $ dmesg | grep "Fast frequency"
>
> and let me know if it produces any output (and what the output is if so).
>
> Then (2) press the power button and see if that still locks up the system
> if schedutil is the cpufreq governor (if it doesn't lock up, a message
> will be printed to the kernel log every time the button is pressed).
>
> ---
>  drivers/acpi/acpica/evevent.c |    5 +++++
>  drivers/cpufreq/cpufreq.c     |    1 +
>  2 files changed, 6 insertions(+)
>
> --- a/drivers/acpi/acpica/evevent.c
> +++ b/drivers/acpi/acpica/evevent.c
> @@ -243,6 +243,11 @@ static u32 acpi_ev_fixed_event_dispatch(
>         (void)acpi_write_bit_register(acpi_gbl_fixed_event_info[event].
>                                       status_register_id, ACPI_CLEAR_STAT=
US);
>
> +       if (event =3D=3D ACPI_EVENT_POWER_BUTTON) {
> +               pr_info("ACPI power button event\n");
> +               return (ACPI_INTERRUPT_HANDLED);
> +       }
> +
>         /*
>          * Make sure that a handler exists. If not, report an error
>          * and disable the event to prevent further interrupts.
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
