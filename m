Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8E630CD9E
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955912; cv=pass; b=vGFcCRLtOIpZEO/EIlJ1cegCfTygMzXao55vIpngzeBaoemvGTiHd5IwsPZqIRRRegZZ6UlvkMx3guZEBl1OSMOZqWDl0x++/p7/g549iUV5RPxrCU+NeuqcfqmRwgtcwwlZGytF6DTskU8VtCv7PTKeUG8wlCo8JipwV7Fjcjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955912; c=relaxed/simple;
	bh=Tvt+6PAwQGXnwKvbAByp2cPSTvij5Ijun8m6mGBO50k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY/kQoQRA6BZ3zhyYgnXbSIzcOj4OaSszG8rpZ50uesBCEjkx06ubjoYYV1usuWt+EcXq1NfHMQDEbeRmkLHAoO/r17kROodJKYsY/qXIUhffPEIJkkx4okWTAJiGtkJNaMaifsnVPsyxsLoAS20Mes0JwEY/wMJFqFPQSgXf8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlZ+7HVM; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlZ+7HVM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba922426c5cso130299066b.3
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 07:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776955909; cv=none;
        d=google.com; s=arc-20240605;
        b=X+bb7+hrp7Syl8FdUXTVgREOrAOIQYA1nbioUIlotSbBrV24fOmZLxQxI0+pjgKvfN
         Up3hCV0FVhhH8ZwMx5TS/1ydlQqSGAZ3AYiMoDc3p2mvYmOKLan8OXe5SxakJCOeffkS
         p3byAM8PYzbAbSZkjOKlHxqbKTuqXfAtZPO4PH+hvtTva+v1VD0afqT5YW3p4K/rwafK
         3StPN4OmG+yWbbenTRzsp3elnNWqn+0ZJn+3DuDWZh/nYXgRZefd8oSTrQ+r3sJUe2BC
         h/Z/3NYI9BsMt+38qe2PMEGEVwTSVxYV06dxn0UDBT8DFUmK35WZceIyHHrvRGNnNIf8
         wYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNRA6uaMpTQXVK/P2OTZ4gcm9H3zQjkQ6p6Olm+4n1w=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=PvqKYcwqUgVkLTkrQhHl7/9niSievEJxnR7untfsT51P6R7ifD0GjgrIDdG630ep+W
         F6fGT3jayRaSZS3zwB+ODMx84F6LFIGPn5u/UKyrsUatNv7n7S+DJf5m6zgsc89rVyTn
         dN5DkckGujcsrosKx4b6y7nNJ4KSjb1+Ee/lTYwqvYYZ9L3tvyrmxzP4g04fP3VHhoZr
         Wk0UShmG7TkbTLuT5ZdPlZpSJVWT6htndEAWaMse6YEPr//VQgrxijrUEG7zwyfZl/C+
         Tw9HbIa/NQwyyb0QtoYS5P8rHdXJNZd1SrM07TMw6OnLSERrh4scRvquthlRaL2choVp
         0+7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776955909; x=1777560709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNRA6uaMpTQXVK/P2OTZ4gcm9H3zQjkQ6p6Olm+4n1w=;
        b=JlZ+7HVMQyFkQudjDQW+ERp+2OUPYEDvmPgpwQF514HdVizM33hrymOgxBKsy0foJI
         /+mevm+zdtvZTjWnmbdirluhmW68Se/YpCibhiol93oAcqFAwUxFNSwfqwg75FC1RNNS
         fN9AVwrpzlLjeDn2EztgSQvAwLqmZyi65mzI89oO1n9aWM2wNWlZfOUqgkzG14oObgQk
         L2JRMZmPXZAHhhaJGleYS3X74hILKipIhRE/5WPKe5ZORzsCGGl66bBqkrbP/bjDlu92
         Xik5YvL+IZf4XQkjqvm7DlwSlG+Lc8LgbukQwTKzSEUqFOL3ONnrd6WMNPpvX690+3ES
         4b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955909; x=1777560709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNRA6uaMpTQXVK/P2OTZ4gcm9H3zQjkQ6p6Olm+4n1w=;
        b=Kqmjsi0RQTAwJ68gwTsux/6RKuvtcupdzLXLR21/9yc/L6qLaztlS2IRphCU1GZnS6
         k4dURIQ0SI3q27EBEF0+myDOuJzgv35Bu0ESXNTzeHdcBz3ZgJFWJgvpywCUrKq5/kEY
         XEfZWKEjxpfO7xyftH4320EdMK/pDrYfVI4TuHqzrnO+iOMLT+RcP64sDp6TmcgqrPj5
         3MsBU+vHwo4jYVIQg0XzcdXeXMXbNWwutCjfUWPgajAadKe8ccpQrEJOqzMdbp2KPD5w
         kCMOWs2X3x/3LuopWw2/gzeemIUjJlSJa4osietBZ9HOp8YJ8vCaby3X3BqQTP6ZAKKT
         uIAQ==
X-Gm-Message-State: AOJu0YyY+/GA5v3VL3ebHcIIMilT6s1YW++n/mRdZups9q9Hh5Kq1yiQ
	97v4ivokrLqhfspa0cgHDp65pqsRu47LI6NhUM87s5ORqKRRQYYB0u++sb6q7L+K+5jc6HXIJ9p
	Q3v2srZPOp1eR2EYDUUMyu4GwxXKFNXw=
X-Gm-Gg: AeBDiesnvx9ikHtqspUdT00XJAz6WlP59Yly0Ez/NcmdwZjEecDbQ8gN2B9fDl6yqVK
	yyLgpv4N1TATuSr51ys4wjnWesAfXKFDYVEtdGM2B4p05sH+VygT0r9AO7moKfbjtNvXw7l8Udz
	usZUHl5gYllqkWfoPG9ig1kdh0y050b9ib/fUbaowiW2jPkyyNoIzW5Q11Hkq13jN9AXraF70UB
	1Bn5fommCf88f8AeCJmZ2xB3DNZIOKjkDSrMDY+ZGZg3YNKQWWPEPC2mY8QybAnPogKBYT1R+A8
	FDbYe+7FY3ddSp/7tg==
X-Received: by 2002:a17:907:c302:b0:b96:e593:fd24 with SMTP id
 a640c23a62f3a-ba419658d6fmr1680530166b.15.1776955908482; Thu, 23 Apr 2026
 07:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAJZ5v0j+WO2yP53nvjshFfEo+ETWiyCo7LohoN2DoORVd_NFbw@mail.gmail.com>
 <CAGAxtY0tgWJ=QQ48=aYTiQd994Z+9e=BAFN1OFTvzP9KE46t8A@mail.gmail.com> <4738258.LvFx2qVVIh@rafael.j.wysocki>
In-Reply-To: <4738258.LvFx2qVVIh@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 23 Apr 2026 17:51:36 +0300
X-Gm-Features: AQROBzA2BZiK1Q9Er7MrjKmDBu_kHDu7iP8s-fNdIhrgHAoUpPhoFZHF0rW7jmQ
Message-ID: <CAGAxtY1eVP5y6GTDoLM2xVDt2KF7fCKxDx0Mo9QO3afTA54GgQ@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I removed the previous patch and installed the new one in kernel 7.0.0.
schedutil - complete freeze, no messages in the log
performance - log message when pressing power button, doesn't reboot
ondemand - log message when pressing power button, doesn't reboot

Log: apr 23 17:40:04 srv kernel: acpi-button LNXPWRBN:00: ACPI button event

=D1=87=D1=82, 23 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 16:17, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Wednesday, April 22, 2026 4:48:41 PM CEST Evgeny Sagatov wrote:
> > > There are two cpufreq governors to choose from.  Have you decided to =
compile out the other ones on purpose?
> >
> > Powersave is compiled into the stock Debian kernel as a module, so it
> > does not appear in this list.
> >
> > I changed governor to powersave and pressed the power button. The PC
> > shut down normally.
>
> Interesting.
>
> Can you please also check what happens if you change the cpufreq governor
> to "performance" (on all CPUs) before pressing the power button?
>
> The difference is that with the "performance" governor the CPUs will be
> running at the highest frequency.
>
> > =D1=81=D1=80, 22 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:04,=
 Rafael J. Wysocki <rafael@kernel.org>:
> > >
> > > On Wed, Apr 22, 2026 at 3:34=E2=80=AFPM Evgeny Sagatov <evgeny.sagato=
v@gmail.com> wrote:
> > > >
> > > > # grep -r . /sys/devices/system/cpu/cpufreq/
> > > > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us:240
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_min_freq:2000000
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_available_governors=
:performance
> > > > schedutil
> > >
> > > There are two cpufreq governors to choose from.  Have you decided to
> > > compile out the other ones on purpose?
> > >
> > > It might be useful to compile the powersave governor in and try to
> > > switch over to it (on all CPUs) before pressing the power button
> > > (without any patches applied).
> > >
> > > > /sys/devices/system/cpu/cpufreq/policy2/freqdomain_cpus:2
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_governor:schedutil
> > > > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_max_freq:2834000
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_available_frequenci=
es:2834000
> > > > 2000000
> > >
> > > The frequency scaling on this CPU is quite limited (only 2 states to
> > > choose from).
> > >
> > > > /sys/devices/system/cpu/cpufreq/policy2/related_cpus:2
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_cur_freq:2000088
> > >
> > > Interestingly, this number doesn't match the available choices (maybe
> > > due to a rounding error or similar).
> > >
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_setspeed:<unsupport=
ed>
> > > > grep: /sys/devices/system/cpu/cpufreq/policy2/stats/reset: Access d=
enied
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:   From  =
:    To
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:         =
:
> > > > 2834000   2000000
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:  2834000=
:
> > > >       0       762
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:  2000000=
:
> > > >     761         0
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/total_trans:1523
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/time_in_state:2834000=
 6606
> > > > /sys/devices/system/cpu/cpufreq/policy2/stats/time_in_state:2000000=
 248733
> > > > /sys/devices/system/cpu/cpufreq/policy2/affected_cpus:2
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_max_freq:2834000
> > > > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_transition_latency:=
160000
> > > > /sys/devices/system/cpu/cpufreq/policy2/scaling_driver:acpi-cpufreq
> > > > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_min_freq:2000000
> > > > /sys/devices/system/cpu/cpufreq/policy2/bios_limit:2834000
> > >
> > > The fact that acpi-cpufreq is the scaling driver may be related to th=
e
> > > power button issue in principle.
> > >
> > > I'm still going to send you another debug patch for the button driver=
 though.
>
> So the patch is appended.  It causes a message to be printed into the ker=
nel
> log every time the power button is pressed if all goes well, but the syst=
em
> will not shut down (it is also not expected to hang).
>
> Please see if that happens with the patch applied (it is a replacement fo=
r the
> previous debug patch).  In principle it should work without changing the
> cpufreq governor.
>
> ---
>  drivers/acpi/button.c |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -473,14 +473,12 @@ static void acpi_button_notify(acpi_hand
>                                         event, ++button->pushed);
>  }
>
> -static void acpi_button_notify_run(void *data)
> -{
> -       acpi_button_notify(NULL, ACPI_BUTTON_NOTIFY_STATUS, data);
> -}
> -
>  static u32 acpi_button_event(void *data)
>  {
> -       acpi_os_execute(OSL_NOTIFY_HANDLER, acpi_button_notify_run, data)=
;
> +       struct acpi_button *button =3D data;
> +
> +       dev_info(button->dev, "ACPI button event\n");
> +
>         return ACPI_INTERRUPT_HANDLED;
>  }
>
>
>
>
