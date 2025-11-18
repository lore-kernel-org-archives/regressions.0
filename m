Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257082D47EA
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468278; cv=none; b=kXDANHq/VdM15sxDrcubqtxrRF53FWbaPYHnIC5ebUSi5ozMvJ0ZRxR1pAC97n01XUr7LSJ/cYlFlw6iHK7x9x5rWxgGfGIdjhukOfMjSW131GhOGwogxm9Ij1xhWsZtU9Q0XNZDQJoyOgyc7jlAzNFuohmBLisfKGpLNg3n/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468278; c=relaxed/simple;
	bh=FNe+kP0p7Di8wItZWzeO7bbNlnk0l60J+PG7Qvastds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=roe50dQdE9DSscDsHXfO7Cv5y8QXmrJ9OtyI/fTDgvqIdmBFaEHALa+znetYmGrWZjyzjpprazwSRFNP1FgFZXhxVcPvEpngzlF7s8L7H48CAUagrAVmMbfQ4ZQHO5vqQmW6TtIMuGQjIJ/1WhNHEG4LUlPRUQDUDALc4yJnRXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MU9tpY86; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MU9tpY86"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63fc6115d65so5148127d50.0
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 04:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763468275; x=1764073075; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKYPCwTfCB7LQ2acnCdecHo4LMsa2525wI+rQ4Lsj0Q=;
        b=MU9tpY86Vc44qK6OuOXn5Ih+8nEks4O11FvldHzXtuEPkOUtrM33gbvA/ZEkhrMi+i
         GUL++AE88Ra29VFgeQk37eZS30afbIbICYwHHyH613qXB9/HYqey82N36+gbIdbDulx9
         8pTzmbKyWQNIj9IwlomB47rWcslloXNoRl334KzZ22M9uOWCF4pTQw5N8uVq+OrkOl9B
         nBULtIfiKvGoA+xvJ7dazSUcne3wnNQoCbUUci77mOVn1I1y0VphMD4UyfxJPQEy4uEx
         tkr5wYR5vJhG1/070XJBcIkqs9/7U/DZ18Nyd0nQGGBWDn9et1IOS2XtveMckIunu2am
         PjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468275; x=1764073075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKYPCwTfCB7LQ2acnCdecHo4LMsa2525wI+rQ4Lsj0Q=;
        b=qMoxoqtotA16LMHuAdkOarhZMG2zEAqariof0gjIVFyZIuggee7nPXoC3ilx97Rdk8
         vZ+d3tz8XLfzPVhMHsCFkqNZt/l4FU0hKP8CuzI9dpgPWV7nVQqTdki/RKQXTeko6rYQ
         0jPlN4uMLJk25T8LDxp5ysTR01+TjZURG1cPqPZGuhZtXxhNtM29+6yLMVUgkwmhFd2o
         WoDs3I5RaDA7tPpg1qxRg4t6Wifk8xHKKxhMBZRk4DjYvHdwv7GqUi9q7vn8WPuj0ZmM
         ZaNAwzwir2boFtmt6T5cy4Um/pmjSmZZ7g+VT7sa4FJh2Qj8JpBks2yRVbH1TCy9RrM2
         OReg==
X-Forwarded-Encrypted: i=1; AJvYcCWBTBmTEXykPF5jQwpsAtxPT3Suo9IHBGtLUM061s9mmJ3lJ8x6yn0MwzkfWWUo5if6c5/3V6w3bEdN8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5kxlZg9VjEtCB1snFtRBVj/In0d1hCGp7eYG+6lYEgbxBFllu
	sd62iD1le403AHfI16gkc7GkAOpPwgvspz3vxZ+6nB82eVScBQFid+F8GdorlbAFGk+4K7Fxvme
	4QTL77zFMYv5O13lIiRJj1C0CYQtPIWBkEWUO8yhmDg==
X-Gm-Gg: ASbGncsNW2AsIdLn+deXmhgDtkTmmAIYQ5zHHgLcUKSjtWF2eCYbpvVdnR4zLEO7AOo
	6x9MpmJDZB5GUyAA8ByCjynQCa2lUXawEqC5mpSV5JYYtI5Q4xYzySkUmCPre4OfwyG31XBdByq
	q2jEot9BP4H6xobAyvqKl91lU1etsesjijN7kPWfJuv/KmHSB2wooCKkKuCYmnW8x0kojv0zo4I
	aDpGFDqBmQk8U770XCvQdKFwgm6bBB65Ddre0IwXCoUZ/2bHomcG/SlRsxlGFc6KkCTo4sF
X-Google-Smtp-Source: AGHT+IH5vkW38a0isCVA2e5T5WYOS8uIIq20npmgKu3RFPtWa3i0ZtmInZUSNURmsnwULuvyfghDcOs4ottSeTikfjQ=
X-Received: by 2002:a53:d048:0:10b0:63f:b922:eda7 with SMTP id
 956f58d0204a3-641e74df9efmr11495816d50.23.1763468275130; Tue, 18 Nov 2025
 04:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <5940388.DvuYhMxLoT@rafael.j.wysocki> <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
 <12782716.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12782716.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 13:17:19 +0100
X-Gm-Features: AWmQ_bmVtAxNobSpolx7esNrHBiYpoTIJhpwBf5EtPC4hxdNMXHJAkDPR0Y0clA
Message-ID: <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Rose Wu <ya-jou.wu@mediatek.com>, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > Hi,
> >
> > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > >
> > > Make two changes to address this problem.
> > >
> > > First, reorder device_suspend_late() to only disable runtime PM for a
> > > device if the power.is_late_suspended flag is going to be set for it.
> > > In all of the other cases, disabling runtime PM for the device is not
> > > in fact necessary.
> > >
> > > Second, make device_resume_early() only enable runtime PM for the
> > > devices with the power.is_late_suspended flag set.
> > >
> >
> > My concern is with the error path in device_suspend_late().
> > If a device fails its dpm_run_callback(), it appears that its
> > power.is_late_suspended flag is not set, potentially leaving its runtime
> > PM disabled during the resume sequence.
>
> Right, pm_runtime_enable() is missing in the error path after calling
> dpm_run_callback().
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
> device when it is going to look for the device's callback.  In all of
> the other cases, disabling runtime PM for the device is not in fact
> necessary.  However, if the device's callback returns an error and the
> power.is_late_suspended flag is not going to be set, enable runtime
> PM so it only remains disabled when power.is_late_suspended is set.
>
> Second, make device_resume_early() only enable runtime PM for the
> devices with the power.is_late_suspended flag set.
>
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronous")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error path (Rose).
>
> ---
>  drivers/base/power/main.c |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -941,11 +941,11 @@ Run:
>
>  Skip:
>         dev->power.is_late_suspended = false;
> +       pm_runtime_enable(dev);
>
>  Out:
>         TRACE_RESUME(error);
>
> -       pm_runtime_enable(dev);
>         complete_all(&dev->power.completion);
>
>         if (error) {
> @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
>         TRACE_DEVICE(dev);
>         TRACE_SUSPEND(0);
>
> -       /*
> -        * Disable runtime PM for the device without checking if there is a
> -        * pending resume request for it.
> -        */
> -       __pm_runtime_disable(dev, false);
> -
>         dpm_wait_for_subordinate(dev, async);
>
>         if (READ_ONCE(async_error))
> @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
>         if (dev->power.syscore || dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +

Moving this here means we are going to keep runtime pm enabled for
syscore devices during system wide suspend/resume. That's quite a
change in behaviour for a fix for a regression, I think. Not saying
that it can't work though.

Although, perhaps better to call __pm_runtime_disable() a few lines
earlier and use a separate flag to track that we need to call
pm_runtime_enable() in device_resume_early()?

>         if (dev->pm_domain) {
>                 info = "late power domain ";
>                 callback = pm_late_early_op(&dev->pm_domain->ops, state);
> @@ -1679,6 +1679,7 @@ Run:
>                 WRITE_ONCE(async_error, error);
>                 dpm_save_failed_dev(dev_name(dev));
>                 pm_dev_err(dev, state, async ? " async late" : " late", error);
> +               pm_runtime_enable(dev);
>                 goto Complete;
>         }
>         dpm_propagate_wakeup_to_parent(dev);
>
>
>

Kind regards
Uffe
