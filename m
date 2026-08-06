Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037830EF6C
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 00:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974918; cv=pass; b=jKokzsyJJNyndTdZh5nSi1kb7b4jRLq/4+xoeq6gTyDTXyckXNulp0l8lC40H5OoOqU0qYR8DKL6T3Ry5k2dfKIJtip0oQpCVodP85I8OxS9rSLaP8CiZ0zG+3qwBI0x7dHJuqGqcUcQN7tho/AQCTlTVjgN/m0um2xSg3nrqXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974918; c=relaxed/simple;
	bh=1iu5d+I5/K4BVPrMkCaJZCHy0u+IaD5kCta9cXPqI9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBQXyBj7bIGxRSouGyw150nSf8/AkhuEnva3aVlNmxzgDBQuAj4R8+IkUUHU6PFRdzKpTvw2e4EvvMdYO14nQ+jkDi4S/9qJ3AWf/6YOg6M62qELvvl/hVlPjd3xgBlrLK34uKOPJ8RWzQ9At4jCgCmdoaE11+1NEdbSFnbxwh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4NU9Ub4; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4NU9Ub4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1733591a91.0
        for <regressions@lists.linux.dev>; Wed, 05 Aug 2026 17:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785974912; cv=none;
        d=google.com; s=arc-20260327;
        b=hU+4WZOZU+GkeS+yK+EpqiuPoH6IJE1TRZBZ1unKuCX3BA7m3PrU1GAycVKHtAUHEd
         wveKUoPFrj9znb4mgbxofl1RZ4abGeAsHgS6uH2t3qfUcLvzHYO7BJrYZPmhImS65nM4
         oCxxk/wnSI8DE35l1Ul0ERczBFcGanXjK9tR45ERNz0QNORziBhMxo3T2zhuLJrR7CTj
         TTc6b/Kpnmt79mzNhyDm/5gB0L4JjdcBK+H9IQonvU5VFa/MedQjpxtpkJ1JdwbqBlaa
         W7vzhgqEtaUTL9lPcBPtXUIzm+kWHPEiagMm1QLAEze8dZ+UCx3p4EOnbFo7Yt7YMr33
         6niQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        fh=WbXiq8W4Vyna4dtR+Wc4MfZ5Okj3ZY8XReKi/P3HnW4=;
        b=stOFRCtfGMuKSrb4mJKegWtd/tFhWLrEREMRw5ATAq/JIHLRTPjAVx9s/mcS415elg
         wq/eiFC+XMOD35hviB30tpIWNkOzWnwWL15QAGQeA2FR9NqBzlZ7DzNk514KyEdPUdoy
         Xc1785EOq+zQswRKmkcPmT8pC78Bb4wYiQ1QSzBwfU0njKOl3RB0yiXtJ6AUmoON0/wb
         XowB4U/QJck7OgVa33ju23/bDl3+1BFW59sEPOuAUAtIzsz+GIIJLx1IiBbH69aBu3kK
         PHw8OWdi6UIjDrt6Zwz6DSJB8p8DywvqRceWkTyvk27cdp9qjwIHDy+qEL2MSdia/Nkk
         FCxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785974912; x=1786579712; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        b=D4NU9Ub4a3dCd55boXgG8PIDGBFSu7HVwwfsPmVtNYPJq3z9t6hjA4l25J4mgHL9yl
         J09P03VgRSQEaZqQJ7OMYGsVgheKZ7s9TOJ8lfSUXsAI02gSJv2uM95IM8HPc9I+fmvx
         NHkPK5eq5EXAi5pTGCen2T65RvnJ75/wUZITiZS/j0NurkRSAZATVsljPZZuuvh27zhw
         /5SmczrV84rXlxf8yx2r9WOiBSvMuADG/U4kIQROBHOkZx42FNgSTVEfAyUflLsQvGcb
         FSHmCr+jJxbKV6wQ3mF+kCF6dyFcvRzNmL9zK43yMWoWh7hLlgbisXICuh0IC9VDwZn2
         cpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974912; x=1786579712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        b=iQuF691fM1SuCoEhNwlk0a7sM2r0V8v7H+oqvCvfsbISY2aTBfR19kFf1rZzxM2qEJ
         hgjaLbdIFO72VHNWLpoweI0ZcOGZPNxAPFLeFBoNqtgXubczT5MTf8Ihv7PtWByt5Y+6
         oJFiGv32DTx1wKswNsdMd2OpdyQ0ZEmdTwexc9ZCWeKLGMCvCDYIayvJcxXUv7UJI2q6
         2taYhFMC1JieCjsVYYghxrzudajrUm9Qq7j+Lfw42VS9N66M350qNkr822kAvQdYSMzT
         8HxhPIGksyDYlHYFbljBt5whqVj0W/0Wt0I1KCrOE/w4neKR2EsJB51ErLjNQ9+WWJ3n
         xetQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXQh27z7PNxtuy3PDTi2Tcb5slBAvS+YYPPQgmCu3En6lunDViQp7c4BZYm7EbaNFW/UpZB0UN/5NMoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW+40M8zhSIM+cKZ4PcQNNLEWBPAjCLYg//DO5OiYqdiXXz5Nb
	1Kxin68LUkAkUiFRpxvc3oqHRjuLoWz0Cm5CNBjLfgY3aR2Pj/ySYLdNbteOBNdD3jDaSMoX1Xx
	LR5D3JNOf8Z6vk3330lsqw8985i2QQ8Q=
X-Gm-Gg: AR+sD11khqLwGIvka9ewhU2OYlGaLgMY9t5/TyN6gv2sB0bpK0DK4ITMedkQcVwSfdV
	AjH2bn6q7Jiu5I+UcR84yxu/wTXD5s8ImDHmVd4DqeUzURu1gSc1Fw3i38y1rrnSk6t5Miu6Kki
	F/Ly2sC7JuoLVR8/cOHuNXYZIWGkW+6xxBJTsN1F1ViLXwDa2pvhivA+ZYM2xVN8nEbL6SD2JDq
	LyYTtUQSqAk4/aziUfHpxBJ4+OgAEjKnw1JVxAVGLNdGHaFXMFuNpP4GShVq+ceW+YfRxgXqPM8
	ZhfbsGzouVL9U0cNHFFo6fxZDLQ3iJGHC2+gzJOtxzad8LbFuuGcYsFGpQSfGDyxiTUai098aZ+
	jHyAyPEzLSNHGyAlUDtRll+eew+Z96M06E1OP4aij818KEO57GQNhOZWFX+Q=
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-3903c5b9f70mr9408859a91.13.1785974911569; Wed, 05 Aug 2026
 17:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch> <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
In-Reply-To: <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Wed, 5 Aug 2026 20:08:19 -0400
X-Gm-Features: AUfX_mzWccQa-XGJ0eOY4WMfNWGqgAW-Qd5A9IgdUUwdNC3nZgowQzhwzISJkns
Message-ID: <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks again for all of the suggestions. I wanted to provide an update
after spending some more time testing.

At this point I'm no longer convinced this is simply a kernel regression.

I've now tested the UPS across multiple kernel generations, including:

- 6.0.x

- 6.18.40

- 7.0.2-6

- 7.0.14-8

- 7.2.x

The behavior varies somewhat between versions=E2=80=947.0.2-6 gets the
farthest=E2=80=94but none of them provide stable long-term communication wi=
th
the UPS.

On 7.0.2-6, the driver successfully:

- Claims interface 0

- Reads the HID report descriptor

- Detects the UPS correctly as a CyberPower LE1000DG (VID:PID 0764:0501)

- Retrieves battery charge, runtime, voltage, load, and other values

- Completes several successful polling/update cycles

Eventually communication stops. At that point the running driver
repeatedly logs:

    libusb1: Could not open any HID devices: insufficient permissions
on everything

and upsd reports:

    Data for UPS [ups] is stale - check driver

One thing I find particularly interesting is that the UPS never
disappears from the USB bus. Even after communication becomes stale it
is still present in lsusb:

    Bus 001 Device 007: ID 0764:0501 Cyber Power System LE1000DG

There are also no USB disconnects, resets, xHCI errors, or other
kernel USB errors after the device has initialized.

What makes this especially confusing is that this does not appear to
be a normal permissions problem. The driver clearly has permission to
open the device initially=E2=80=94it successfully claims the interface, rea=
ds
the HID report descriptor, and communicates with the UPS for several
polling cycles before failing. Once it enters this state, however, it
repeatedly reports "insufficient permissions on everything" until the
driver is restarted.

Since I can reproduce essentially the same failure across 6.0, 6.18,
7.0, and 7.2 kernels, I'm beginning to think the kernel version only
affects how long the driver remains functional, rather than being the
underlying cause.

Over the next few days I plan to test the UPS using a dedicated PCIe
USB controller based on an ASMedia chipset to determine whether the
behavior is specific to the Intel xHCI controller. I'll report those
results back to the list once I've completed that testing.

Has anyone seen this pattern before, where usbhid-ups initializes
successfully, polls normally for a short period, then loses
communication and repeatedly reports:

    libusb1: Could not open any HID devices: insufficient permissions
on everything

while the USB device itself remains present and enumerated?

Thanks again for everyone's time and suggestions. I'll follow up once
I've completed the additional USB controller testing.

On Tue, Aug 4, 2026 at 8:01=E2=80=AFPM Jamie Stephens <jamie.stephens@gmail=
.com> wrote:
>
> Hi Lovekesh,
>
> I have now tested 02-resume-reset.patch separately on Linux 7.1.5 with
> the CyberPower device 0764:0501.
>
> The patched kernel was active:
>
>   7.1.5-ups-reset-resume
>
> The device was detected by lsusb, but USB initialization still failed:
>
>   usb 1-3: new full-speed USB device number 4 using xhci_hcd
>   usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501
>   usb 1-3: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=3D2
>   usb 1-3: can't set config #1, error -71
>
> The UPS therefore never attached to hid-generic and NUT could not use it.
>
> I then returned the same USB cable and UPS to the PiAware NUT server,
> where it immediately resumed working normally:
>
>   ups.status: OL
>   battery.charge: 100
>   input.voltage: 122.0
>   output.voltage: 122.0
>   ups.load: 23
>   driver.version.data: CyberPower HID 0.8
>
> Results so far:
>
>   01-no-lpm.patch: did not resolve the regression
>   02-resume-reset.patch: did not resolve the regression
>
> I will proceed with the requested git bisection unless you would like
> any additional targeted logs or tests first.
>
> Regards,
> Jamie Stephens
>
> On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
> <lovekeshsolanki00@gmail.com> wrote:
> >
> > Thanks for the report,
> >
> > On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > > sudo lsusb -v -d 0764:0501
> > >
> > > reports:
> > >
> > > wDescriptorLength     504
> > >
> > > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> > >
> > > cannot read device status, Resource temporarily unavailable (11)
> > >
> > > As a result, usbhid-ups is unable to reliably communicate with the
> > > device and NUT cannot reliably monitor UPS status.
> > The lsusb failure and NUT seem to be seperate, lsusb failure could
> > simply be device property.
> >
> > Few possibilities I can think of worth testing:
> > 1) It may be related to LPM, the device may be advertising this but may
> > not be handling it properly.
> > 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports =
to power off)
> > lets acpi managed ports be powered off even if hub does not advertise
> > power switching. The UPS may be sitting on such port and its power coul=
d
> > be cycled out and leave it in a stale state.
> >
> > I'm attaching two patches to see if they have any effect, please apply
> > and test them seperatly and let us know the results.
> > And, as per Thorsten's advice above, run git bisection regardless.
> >
> > Regards,
> > Lovekesh
