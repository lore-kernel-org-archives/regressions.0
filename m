Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F4243367
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470340; cv=none; b=Hq2eXCBFRR+gkw7utrW1dqwnnybYIMoCCxifNISgtGxLHWJpqKfe3UzG7QNeDux8ZdMCD2KM6Dy6vlL+rszNEVr9FX0uSqVRjSWdZbnGE6+UmCVSFbwJVAitScPdPq3mDcQm4LszQ3tBchcAl3g2ui62NqiSYYVJiuivf3ERBb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470340; c=relaxed/simple;
	bh=oCdeyDre9H8fm43h64LOpJvCiKkwI8nR8Ldh8b2BFt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2xd1j4fwgH1cbtuXdLxrxZg0KoUnW6r0a5Iqg/xH/X5E8XXmGsQeUtSIi0IErZ7cnpk7aM/x7hPrS0kz/dbCwBkj7NrvFg4du1mldQRa3SPk/D9HThWTD9PtuMH8kwmAM7iQwyrlnFcai++/3b0d0YgodahuwIPflMTkcHfd0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZ7kkdnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZ7kkdnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9335C4AF0C
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763470339;
	bh=oCdeyDre9H8fm43h64LOpJvCiKkwI8nR8Ldh8b2BFt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AZ7kkdnz7b8K2srmf15WNRCvQdmRItc3pmMNnqQaDp52/arqrG2MghJkXMk2fxoZw
	 2opiyGKO4p5Xap0NCLXTwi4QwtJ8mEGwlFNLBdRAd/WA6B6/vqKV9etF4BIu+jYuzj
	 sMcYyVF3gv9EQDf4DeiBLSpmk90OoN1ANwwy3ZNWWn6yPrUmmR6/CGp12ln69608WR
	 NTYR02wuBlcxxKag5ouW2mvueq+DdvW8cBDW0LfWBa1Q0Gq4vmoqzFCGNOctlBLsm0
	 EGd3wzDSW+eQvZmblIP9/5MkIqhM70d4+g+leYuKIEA3KpQN7FLBvsyCtJ/kHkytPu
	 LbQyGXfk4Q4zQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-656b32a0cc4so797388eaf.1
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 04:52:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5nNOZWw8nTRVSjnbDdEQQ1PVgWTUDd5tYy9t9k1A1ge6t2Wjg59kzJlmzXIy7+vDZvHjpaLZPFgvXuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6jUr8/4rnPmUO5zMxxblgi9ZD21lQfq7zuLXUo5o8UM+e+mI0
	4Cv3v6lXLFhUUzDdiGFVo4tBs4RxExKqAi5kJbRYmp10J4/CTb+mXYOwd5S/835Du8//aslvdFm
	np+dgzKYHZtl4KiFkhbdPaZAlIsKSjvw=
X-Google-Smtp-Source: AGHT+IFR9OXgw8pdu2VohXhDiYPEXXRiTOcSaz6Nri5uJ2ZcrY59pOb20QHoWV8RJiFgyqIXMaC8MvHbYjtgu37moYE=
X-Received: by 2002:a05:6820:1b1a:b0:657:6678:1b48 with SMTP id
 006d021491bc7-65766782056mr650639eaf.3.1763470336991; Tue, 18 Nov 2025
 04:52:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <5940388.DvuYhMxLoT@rafael.j.wysocki> <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
 <12782716.O9o76ZdvQC@rafael.j.wysocki> <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com> <CAPDyKFqBB7gDXSDV-GbMqWDBbT8RMVdc-9+iDOvEdpVV5TACyw@mail.gmail.com>
In-Reply-To: <CAPDyKFqBB7gDXSDV-GbMqWDBbT8RMVdc-9+iDOvEdpVV5TACyw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Nov 2025 13:52:04 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i_-i1EpF0KVforu7gPy_YJ6SzTCaj-1uxFx0sBBzCgbg@mail.gmail.com>
X-Gm-Features: AWmQ_bnwFW9-RQp7EQ4BLzQBfRWOIGfweqvelbeU9JtfNnvwDjK7XUJz7I3QB_E
Message-ID: <CAJZ5v0i_-i1EpF0KVforu7gPy_YJ6SzTCaj-1uxFx0sBBzCgbg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	Rose Wu <ya-jou.wu@mediatek.com>, rafael.j.wysocki@intel.com, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org, 
	"artis. chiu" <artis.chiu@mediatek.com>, "Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 1:49=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 18 Nov 2025 at 13:26, Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> >
> > On Tue, Nov 18, 2025 at 1:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro=
.org> wrote:
> > >
> > > On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> w=
rote:
> > > >
> > > > On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > > > > >
> > > > > > Make two changes to address this problem.
> > > > > >
> > > > > > First, reorder device_suspend_late() to only disable runtime PM=
 for a
> > > > > > device if the power.is_late_suspended flag is going to be set f=
or it.
> > > > > > In all of the other cases, disabling runtime PM for the device =
is not
> > > > > > in fact necessary.
> > > > > >
> > > > > > Second, make device_resume_early() only enable runtime PM for t=
he
> > > > > > devices with the power.is_late_suspended flag set.
> > > > > >
> > > > >
> > > > > My concern is with the error path in device_suspend_late().
> > > > > If a device fails its dpm_run_callback(), it appears that its
> > > > > power.is_late_suspended flag is not set, potentially leaving its =
runtime
> > > > > PM disabled during the resume sequence.
> > > >
> > > > Right, pm_runtime_enable() is missing in the error path after calli=
ng
> > > > dpm_run_callback().
> > > >
> > > > ---
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > Runtime PM should only be enabled in device_resume_early() if it ha=
s
> > > > been disabled for the given device by device_suspend_late().  Other=
wise,
> > > > it may cause runtime PM callbacks to run prematurely in some cases
> > > > which leads to further functional issues.
> > > >
> > > > Make two changes to address this problem.
> > > >
> > > > First, reorder device_suspend_late() to only disable runtime PM for=
 a
> > > > device when it is going to look for the device's callback.  In all =
of
> > > > the other cases, disabling runtime PM for the device is not in fact
> > > > necessary.  However, if the device's callback returns an error and =
the
> > > > power.is_late_suspended flag is not going to be set, enable runtime
> > > > PM so it only remains disabled when power.is_late_suspended is set.
> > > >
> > > > Second, make device_resume_early() only enable runtime PM for the
> > > > devices with the power.is_late_suspended flag set.
> > > >
> > > > Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more async=
hronous")
> > > > Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> > > > Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a=
7dee7edaaffc33.camel@mediatek.com/
> > > > Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >
> > > > v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error pa=
th (Rose).
> > > >
> > > > ---
> > > >  drivers/base/power/main.c |   15 ++++++++-------
> > > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > >
> > > > --- a/drivers/base/power/main.c
> > > > +++ b/drivers/base/power/main.c
> > > > @@ -941,11 +941,11 @@ Run:
> > > >
> > > >  Skip:
> > > >         dev->power.is_late_suspended =3D false;
> > > > +       pm_runtime_enable(dev);
> > > >
> > > >  Out:
> > > >         TRACE_RESUME(error);
> > > >
> > > > -       pm_runtime_enable(dev);
> > > >         complete_all(&dev->power.completion);
> > > >
> > > >         if (error) {
> > > > @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
> > > >         TRACE_DEVICE(dev);
> > > >         TRACE_SUSPEND(0);
> > > >
> > > > -       /*
> > > > -        * Disable runtime PM for the device without checking if th=
ere is a
> > > > -        * pending resume request for it.
> > > > -        */
> > > > -       __pm_runtime_disable(dev, false);
> > > > -
> > > >         dpm_wait_for_subordinate(dev, async);
> > > >
> > > >         if (READ_ONCE(async_error))
> > > > @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
> > > >         if (dev->power.syscore || dev->power.direct_complete)
> > > >                 goto Complete;
> > > >
> > > > +       /*
> > > > +        * Disable runtime PM for the device without checking if th=
ere is a
> > > > +        * pending resume request for it.
> > > > +        */
> > > > +       __pm_runtime_disable(dev, false);
> > > > +
> > >
> > > Moving this here means we are going to keep runtime pm enabled for
> > > syscore devices during system wide suspend/resume. That's quite a
> > > change in behaviour for a fix for a regression, I think. Not saying
> > > that it can't work though.
> >
> > syscore devices can be a special case, but I thought it wouldn't be
> > necessary to special-case them.
> >
> > Do you actually know about any of them needing special casing?
>
> There are a couple of clocksource drivers, cpuidle-psci,
> cpuidle-riscv-sbi and a usb driver that marks their devices as syscore
> devices.
>
> It *probably* works to keep runtime pm enabled for all of them, but I
> am not sure.

Well, all of the syscore devices with enabled runtime PM are potentially bu=
ggy.

Anyway, please see the v3:
https://lore.kernel.org/linux-pm/5941318.DvuYhMxLoT@rafael.j.wysocki/
