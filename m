Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80635525F
	for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 11:54:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i5so7150610eda.0
        for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 04:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679658861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twlyF/fy6hvnHt+ATj2MsbMo4ryoSk0xaykxnuj4cWo=;
        b=qUC7DEaAaZQKkqp95xyzQ9iokqpfjMooZgJ6V4nLkb/79TvbtvWJ7TT/h8z2rXOdQl
         5JOs3StpoTIMY+aY09Hdjq57bS+UXzy52D5jMNRGZOBQ8gPwkqIaCWdnOp++Zj8MSxHy
         Igm4w1ejynV+nTTdO/80UhRER30ai0W3x3Eofp5T3eg8BJwRAt4rtthdRgWuY5UG0Hf+
         R21khimleTt+4ze30iisGFFmDwFGMTAGUFnbZlBp+M6zMPYZUOF4RTH7kauZO/hu3vlB
         hM6CRMjVKT8AavHroSBn6QP/XhoLP78afoOhzWDXo/MfZ+X7NE2+oqkk22th0bUY5bUY
         yeNQ==
X-Gm-Message-State: AAQBX9f2B6lZNdmPY7V4FXgreF5mMkGQ69VUaEPSm80tD1b15BjlsvLK
	cNxTgg30w5H26NcgzPUlPJpJ3CGzXx5Vj5QDw+0=
X-Google-Smtp-Source: AKy350YsX3a9vaoIryHu9YZxOjJCWiBzGVSdKAbHAkaWJkG2KR1n6Dd6mLg1BKi7iQFKhtRsJ0kv6Ll3xOLJArJGXjs=
X-Received: by 2002:a17:907:3e8b:b0:931:ce20:db6e with SMTP id
 hs11-20020a1709073e8b00b00931ce20db6emr1369209ejc.2.1679658861493; Fri, 24
 Mar 2023 04:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
 <20230307093308.m5enhuegm3r4qwvo@pengutronix.de> <220898e2276e4cae2572eb8f006f3a7b.squirrel@mail.panix.com>
 <20230307161005.6m6fpi3oxa3jn2wg@pengutronix.de> <6d97df76de719871c90fb59726f2d6b0.squirrel@mail.panix.com>
 <20230307200843.yxhvnb23tpecjjng@pengutronix.de>
In-Reply-To: <20230307200843.yxhvnb23tpecjjng@pengutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 24 Mar 2023 12:54:10 +0100
Message-ID: <CAJZ5v0j5Fx84Yq4AN=PWWF8iMRwh_Qism=PwYVhuC6B95=UZdw@mail.gmail.com>
Subject: Re: [Regression] acpi: laptop panics early in boot
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pierre Asselin <pa@panix.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, 
	regressions@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 11:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello Pierre,
>
> On Tue, Mar 07, 2023 at 02:31:49PM -0500, Pierre Asselin wrote:
> > > Maybe the following patch helps (on top of v6.3-rc1):
> > >
> > > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > > index 9531dd0fef50..a5a8f82981ce 100644
> > > --- a/drivers/acpi/bus.c
> > > +++ b/drivers/acpi/bus.c
> > > @@ -518,7 +518,7 @@ static void acpi_bus_notify(acpi_handle handle, u=
32
> > > type, void *data)
> > >     if (!adev)
> > >             goto err;
> > >
> > > -   if (adev->dev.driver) {
> > > +   if (device_is_bound(&adev->dev)) {
> > >             struct acpi_driver *driver =3D to_acpi_driver(adev->dev.d=
river);
> > >
> > >             if (driver && driver->ops.notify &&
> > >
> >
> > It does indeed "fix" 6.3-rc1.  Modulo locking issues, which I am
> > not qualified to evaluate.
>
> Thanks for your prompt test feedback.
>
> The locked variant could look as follows:
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 9531dd0fef50..fddca263ac40 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -518,13 +518,15 @@ static void acpi_bus_notify(acpi_handle handle, u32=
 type, void *data)
>         if (!adev)
>                 goto err;
>
> -       if (adev->dev.driver) {
> +       device_lock(&adev->dev);
> +       if (device_is_bound(&adev->dev)) {
>                 struct acpi_driver *driver =3D to_acpi_driver(adev->dev.d=
river);
>
>                 if (driver && driver->ops.notify &&
>                     (driver->flags & ACPI_DRIVER_ALL_NOTIFY_EVENTS))
>                         driver->ops.notify(adev, type);
>         }
> +       device_unlock(&adev->dev);
>
>         if (!hotplug_event) {
>                 acpi_put_acpi_dev(adev);
>
> Pierre: If you want to test that, I suggest to also enable
> PROVE_LOCKING.
>
> Rafael: I don't know if this would work and I hope you're able to judge
> this better than I do. The change without the lock is for sure better
> than the status quo.

It is better than the status quo, but it is not ideal either.

It appears to me that it is a mistake to invoke the driver's
->notify() callback from acpi_bus_notify(), because there is no
synchronization between this and the driver probe/remove, so basically
all drivers setting ACPI_DRIVER_ALL_NOTIFY_EVENTS in flags need to
synchronize their ->notify() callbacks with probe and remove by hand.
The AC driver evidently doesn't do that and I have not looked at the
other ones yet, but chances are that they don't do that either.

However, this is readily avoidable if the handler installed by
acpi_device_install_notify_handler() is installed for all events.

I'll send a patch along these lines shortly.

> I did a similar conversion as the blamed commit for pci that got
> reverted for similiar reasons. See
> 68da4e0eaaab421f228eac57cbe7505b136464af. (Added Bjorn and Robert to
> Cc:) I think the pci code suffers from a similar race even after
> reverting my change.

It is very likely that there is a race, but it may be very hard to trigger.

> If someone is able to find the right fix for one of
> them, that might be transferable to the other?!

I don't think so.
