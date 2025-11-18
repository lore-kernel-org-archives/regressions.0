Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924B273805
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470700; cv=none; b=Y3Zfhy2KGofDogID5kI8V3gNqfvmk6cjjlDW8lR4tBIXqc+bmQHU7zfh7diSVY09O12aQEgDuqNOqRb2W7GvhQ5Bguu1uf2NdUM83sF9fsnhZq3nNjongRbyi2T7JdydugpqJLnZbz+I8REi0kLQcOi938UKht+YEgTlYeNqMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470700; c=relaxed/simple;
	bh=vunG3p49R3uL/D0Tt/iA3+TjnwZdFItykJHKlgb8h/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPjDxDIJVHqVi3ImYAxDu2eZ6whq84F1olL9IrQcfPTQpmOfQ5OMvohy9wf9zcgtpq8n2uq3xdNUx2y1LoGX1bR6p5Wpgru/TmIP7Kv4MVRqzTEMIUPBNhxdg9pYRmSJKtHe6lSsTxDZ6I4tSgJEN262IbPr2qs3UC0Rlt8M+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKBE9xx5; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKBE9xx5"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787e84ceaf7so59966467b3.2
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 04:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763470696; x=1764075496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHDPLEl16Ugwq6B02rj9o+d8nk15yY0zPwOk9KTdur8=;
        b=fKBE9xx5VFUgm6I/kQ4GJJfgriIGJESMrlult8sHeKfSmGEgC+9hYkVIaSmxkIt+9u
         Y/OQI++xCwyya4OlczsH5KdojprV4IAaViYdfrfrbG4lHJDwGKN2B0sl1wpxbnwT6Aa+
         Tg3Pn5CCquESxS0PRPUyloHVSaZ/+EDkL537xWqApjN6bX81ykEy8S2emfS5iW09uLM1
         f1vtmKnrUSTdxomhvJdYjcpXjZ728QDeowYGjQwDow3rU2ecE/oPgW/mXYKS/7ylwAlh
         rU/hsUIr7NT2DbBv7JLliS+689xliVVT5q07keMu+mpPhyJvQfuqfZ4S9fAB4k8ovSzI
         EAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470696; x=1764075496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHDPLEl16Ugwq6B02rj9o+d8nk15yY0zPwOk9KTdur8=;
        b=OPjMAyrbTBJmFJ7hq/xa+TJZJexiREOdoOkbZsGH59FaeGcgIEXtnfwEoY0qDgfL/x
         ajCh8DMCIJOYZwJKzUjaHcADrNM3+MdGyQb2c9A4fa9fzOCBbvEFWSz9+NuGMmxlLV0Y
         qATkhBle9BWhg8z6rj75W8owBTOSyQwDna+Sxfdm5CJJOdJsNkh6/Ky+ell6MKyPT+eR
         rV6GZ58jyaVsOHW1awkEeg4AFZjDpyMu2d30SCykfYYh2k5RYNxdJCfjdwi9pTcRRcBZ
         glm4oST7BK3/A0oisBw7n6a5FkUdenjJTmNJBqxO3qhMVe2SkivAASGeI48URpcyh/bW
         Xl/w==
X-Forwarded-Encrypted: i=1; AJvYcCXxOnCi58DJIcKrG2QeFSXikOsmi8eM+CzrUgmDGccnsuiUURieQ5JbBv7qHaxVlvtonSkf7kXvhUO2Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yymq6QK3nVIzm1zQ9YIIE3f5ezH1M+nu5X0rxeNlglKtXlYbfOM
	BZ9ozVJiaO4Ya+PsAuJJPsvq7Nz0irf65+5G060zkSHeEHBcORv5RLYzdgerQWQiWea5Imngle6
	ppk0uamgbG1bckRq1XKaVP773u5wqKn/fA1/n6HnSzQ==
X-Gm-Gg: ASbGncvN4MZFn8X/KA/h1dtcREanIRuP9rzAKVH2KJ0PTdZFCVoMo9/JSMDPXhkfZCF
	w7aS56DMtUnnJcjD5hFkxRpXxiycR+Jn+IFwAqxLoYgPLZWeWZ8rmLGUCvgVWPbqCC1N4DPpKYE
	j0lEEcce0n55g81Nw8A6JtxOjLHxNuUYkCShe+P5hZ+hyfIRtHHqtOnQb4KIOMxv8cZyY70DrD5
	d8dQk7enkpRjMEJL1YV2M2GnS88AjXs2JcT9vNQoYEKEqvna5bOlXzutb5tHRCxJzfHSUHRbCqd
	gDMsCxs=
X-Google-Smtp-Source: AGHT+IGUaVRogYY/RbWrwXu+vM8fj7R/fzWaN5dRzy1h60AIkHce0jX3fDgAQ37xwlVsCyGyuiMFRFdo1Yn/mBaE2Zc=
X-Received: by 2002:a05:690c:9218:10b0:787:fa8f:beac with SMTP id
 00721157ae682-78929f151d1mr120389357b3.46.1763470695975; Tue, 18 Nov 2025
 04:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com> <5941318.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <5941318.DvuYhMxLoT@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 13:57:40 +0100
X-Gm-Features: AWmQ_bkALcTZ8SHotDoSduUQ_Xd_gA_888BZ3hciQvrrXdUj5aqrgjY-IgODggE
Message-ID: <CAPDyKFq9boy3xTZ0Zy55QMgNu9MFH50FQeJp8buu4q7WowgFLg@mail.gmail.com>
Subject: Re: [PATCH v3] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Nov 2025 at 13:45, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tuesday, November 18, 2025 1:26:06 PM CET Rafael J. Wysocki wrote:
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
> In any case, below is a v3 that special-cases syscore devices.  Fortunate=
ly,
> it is not much more complicated than the v2.
>
> Thanks!
>
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Runtime PM should only be enabled in device_resume_early() if it has
> been disabled for the given device by device_suspend_late().  Otherwise,
> it may cause runtime PM callbacks to run prematurely in some cases
> which leads to further functional issues.
>
> Make two changes to address this problem.
>
> First, reorder device_suspend_late() to only disable runtime PM for a
> device when it is going to look for the device's callback or if the
> device is a "syscore" one.  In all of the other cases, disabling runtime
> PM for the device is not in fact necessary.  However, if the device's
> callback returns an error and the power.is_late_suspended flag is not
> going to be set, enable runtime PM so it only remains disabled when
> power.is_late_suspended is set.
>
> Second, make device_resume_early() only enable runtime PM for the
> devices with the power.is_late_suspended flag set.
>
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronou=
s")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7e=
daaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> v2 -> v1:
>    * Also set is_late_suspended for syscore devices to avoid skipping run=
time PM
>      disabling for them (Ulf).
>    * Update the changelog to reflect the above.
>
> v1 -> v2:
>    * Add pm_runtime_enable() to device_suspend_late() error path (Rose).
>    * Update the changelog to reflect the above.
>
> ---
>  drivers/base/power/main.c |   25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -903,7 +903,10 @@ static void device_resume_early(struct d
>         TRACE_DEVICE(dev);
>         TRACE_RESUME(0);
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.syscore)
> +               goto Skip;

This will enable runtime PM for a syscore device, even if it wasn't
disabled when device_suspend_late() wasn't called for it.

> +
> +       if (dev->power.direct_complete)
>                 goto Out;
>
>         if (!dev->power.is_late_suspended)
> @@ -941,11 +944,11 @@ Run:
>
>  Skip:
>         dev->power.is_late_suspended =3D false;
> +       pm_runtime_enable(dev);
>
>  Out:
>         TRACE_RESUME(error);
>
> -       pm_runtime_enable(dev);
>         complete_all(&dev->power.completion);
>
>         if (error) {
> @@ -1630,12 +1633,6 @@ static void device_suspend_late(struct d
>         TRACE_DEVICE(dev);
>         TRACE_SUSPEND(0);
>
> -       /*
> -        * Disable runtime PM for the device without checking if there is=
 a
> -        * pending resume request for it.
> -        */
> -       __pm_runtime_disable(dev, false);
> -
>         dpm_wait_for_subordinate(dev, async);
>
>         if (READ_ONCE(async_error))
> @@ -1646,9 +1643,18 @@ static void device_suspend_late(struct d
>                 goto Complete;
>         }
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is=
 a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (dev->pm_domain) {
>                 info =3D "late power domain ";
>                 callback =3D pm_late_early_op(&dev->pm_domain->ops, state=
);
> @@ -1679,6 +1685,7 @@ Run:
>                 WRITE_ONCE(async_error, error);
>                 dpm_save_failed_dev(dev_name(dev));
>                 pm_dev_err(dev, state, async ? " async late" : " late", e=
rror);
> +               pm_runtime_enable(dev);
>                 goto Complete;
>         }
>         dpm_propagate_wakeup_to_parent(dev);
>
>
>

Kind regards
Uffe
