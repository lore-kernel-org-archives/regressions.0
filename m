Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023035CB7E
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477112; cv=none; b=BnxWhSaJh11HIVlI7eOrHXQKWt/MBoNaAmnYs7+cdNQBf7Ba27kUZ7Ex/v1l2qS5ATSv2/3/0vFx7Jv6bCoxKpcACZErNgZdvK4xLKSIKte/CSD02MV6dh2qP4hcWYfkbcKzmCoLIrN/N1D3cJS+iAAVJdTzyTrP6qAdNeR0RIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477112; c=relaxed/simple;
	bh=WenJVCogUnM3pGpFcwziW6Fp+9yd6t1dV2fU7Xi6Alc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoMGU/UEtFN3WMlL6+vwabqub6MTNqxjVBcbj1xK0nVEJD9E+KZc9j2dgDWXPPCQV+1fnKqAQhNKu9J74hIpi4q4ZXwyXeMSVZCtpW/jtZKjvKJEbPeyDP+BK3vPxuYxeoFM8YjK3QtQjtJOvGAQGFS4jMTzGTRyz8kigSobUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwxYCcQr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwxYCcQr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-787c9f90eccso59540627b3.3
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763477109; x=1764081909; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dxv4h7ofkzean2g/SBkB1c70TV7EMeFgRSSskiCZXY8=;
        b=zwxYCcQrfYg9aNKf83bO3WV03YJ75QXIw01xNzhyxUdVCGHdoe6UqZFiTsZhuRI62w
         alReGw6DAuEYKe42Jjq1sli467RMCOaBYF/JYt9MrOEkDjmQArtPkXUtwNrJM321hNw+
         tIlBVJl3RTK6pUhXJ/4Cn02XEJ18wDWrDe3ECY15mCSDHmNyno0QRll494VX/mXbpXyH
         NTClUAmSVXNeylupTSeTywqaagrRRzoF4S8Rn4+cRxtBmUJgJvd66si0/QpH4dRzMH/4
         PifsbpAagN0UJ4UaDZairQf0aAne/fLl7g1ZcaKhVMVrUR1Cktit2+zMoGB6/kERwLM7
         WqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477109; x=1764081909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxv4h7ofkzean2g/SBkB1c70TV7EMeFgRSSskiCZXY8=;
        b=lHdw9u9IxKCefNkIANBJps4KiGrxzbT4iBjfC0Ez9wgxNeDyf8sRHYFqUWGXq6CHeS
         9P8l4LxkVcGjx3ldmRiwr0tex4vr6LRShNYPD+W/dipxJNzWXmvy4gOTb7y9Q1gi3yJa
         hMq7UFobX0g1ArqzAGqMWcs6wtRyGchhqkS9ahQgqB+H/6XBm1H1h7n8ySGeDE53M3bq
         H7FaVf/gEbvneyjv57fW83TkfJaTuPjuggDw9gqMxC08h4HK3qDlqM+EJ3A2BW2iSfS4
         5ulnxF/5tBWIazxL7BDVtd8Qoi0x2HLcqXkhQQMPuE9+qobYGwFgbN+6cNyGVoeKO0mh
         v0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBBIV6x+yx6b1BGV5BYuYmCcOMP/UAgeD1GjnvgvzuQrmh1OrGi4Z+B/vky3M+IzaHQq7KiImqiQwxJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzImauDJvXZTu8SfA3zTCVf9HnDM2nIyg4PDmoHlDzycRiDx0py
	l6BWyK31Pzb0mE3I5f9Oc7RTo+EBzOFX7kax5KSZnIvjNiYPZfCxwJA2CZRWTsIINxYvHx8H8AW
	8MyX+KfJo1bcuFSP3WGoG4DQbTRFQvU4jv4WpQb/wQA==
X-Gm-Gg: ASbGncv+EOzuqjObufFzGtWacd44xwkH3xlV/tL8CORjRS8Vvq12+MKqscsx2DdS8jY
	IdTghLEHokuPhPZAsyrLAvk+6KlepmKSfFzzMheZeg9JlN0splqRsVVTo+kG1sxd9Rbk88zpu4N
	C7WBwyXM7vnQ4WuvuwQmKsp79RxYg7hS0ip1pIE0t6PQI6omxavG9WA+GbNbRYAAZLLRBuQ+qQ7
	KP8RAMQQtUw2SUlNjMIQfAXWqpjQbTO4Hrk9wKYMf0ClPUP7zGHt976UcALpF1Em9XHnVky
X-Google-Smtp-Source: AGHT+IF7dxRUgvG46HM4+Rwc//gSMA7288zU/dLypnRqJ7Ti0QMfdRIpamc5xKZmVlaZsx7Wbl3epvjvS9InQfkzXCM=
X-Received: by 2002:a05:690c:3802:b0:787:cad1:bdbf with SMTP id
 00721157ae682-78929eef73amr146762497b3.53.1763477108864; Tue, 18 Nov 2025
 06:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
 <5941318.DvuYhMxLoT@rafael.j.wysocki> <12784270.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12784270.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 15:44:32 +0100
X-Gm-Features: AWmQ_bn6eOA_VKuMFyefgoEE9Geca2TO4X2U23GfUd5Xp4xmmVMzfrrokKx24cc
Message-ID: <CAPDyKFqByMzQruYZTBL0T47Ww2KTF1Py91K-wrQ9GuTeW3fx9A@mail.gmail.com>
Subject: Re: [PATCH v4] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 15:16, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
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
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronous")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> v3 -> v4:
>    * Reorder the syscore check in device_resume_early() after the
>      is_late_suspended check (Ulf)
>    * Update the changelog to reflect the above.
>
> v2 -> v3:
>    * Also set is_late_suspended for syscore devices to avoid skipping runtime PM
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
> @@ -903,12 +903,15 @@ static void device_resume_early(struct d
>         TRACE_DEVICE(dev);
>         TRACE_RESUME(0);
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Out;
>
>         if (!dev->power.is_late_suspended)
>                 goto Out;
>
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (!dpm_wait_for_superior(dev, async))
>                 goto Out;
>
> @@ -941,11 +944,11 @@ Run:
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
> @@ -1630,12 +1633,6 @@ static void device_suspend_late(struct d
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
> @@ -1646,9 +1643,18 @@ static void device_suspend_late(struct d
>                 goto Complete;
>         }
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (dev->pm_domain) {
>                 info = "late power domain ";
>                 callback = pm_late_early_op(&dev->pm_domain->ops, state);
> @@ -1679,6 +1685,7 @@ Run:
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
