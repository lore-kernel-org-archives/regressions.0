Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18F238166
	for <regressions@lists.linux.dev>; Sat,  8 Aug 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228254; cv=pass; b=slcuSbTgl/F7xeUAzf08wAzfNlGYq0FMjrZgQGG5S5urUIHdJsfV1z21bl8xb3mSqV7bbyTcoJ2bXXNWsMYouA4ImEpU/rgqb7t7RtscjsIg3YC0o2FtHoFOe9bX3z1NrJZ4TxaQ1Y2qhSiEKiZTMBZXur1TwAKW1S8NfOv6kVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228254; c=relaxed/simple;
	bh=u/aR+YgPWxL3SaP0F+G6mRY9b3B2c1OpPs6Kao85gCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtgBsqkPtES97+UYma8pZbBI/t0SVa0jSTJIcPO+JSq5NK8zww8WYUGt6OZdzEF5L+TSY48lbLCj9Tjj4t57HIA01WdzQFLAd2PoTp/kJKZ9Hx7i3or2LuktMZymD/hifItU+a3fWFz6IjJl+vOoCcvWuEymFgXvyA8hLyHGp9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Els+QK; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Els+QK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so5908995ad.1
        for <regressions@lists.linux.dev>; Sat, 08 Aug 2026 15:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786228253; cv=none;
        d=google.com; s=arc-20260327;
        b=AvK5YTlxOP7DBUlrkDlugtV6C5p4aAZJJulD3joMaaLYJ+euHMJM+8EjNMDYrCvPlV
         CdUVgr0Zecc+s4VMYwD0oyupfjuVs0LpLVuxQ9Feld8OJBNFbro9c0O/GYj2qTEwpuUw
         t78E9nUm5LSwyN/afhXsNGxAVh6ICvddRBOKZP7G3lp17fhpUdvkL6sMd2hdTB2KyCxV
         UBqDDbNDq+KAjLGCeJLV/U4SFUgmzRSBv6pnEyJ5Urz0eF1wnLwcS+2A3IM+sBCKq1e2
         Ee4Sdl76vnuQAXoOrD+a/t/+ba5WdRWs017+/aHSTcQF/i9XEBve+Ts8Dt3xBQStjixJ
         iPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        fh=Y+AwasM0iQzgVKYMGmb8P/0VxqobUuDNdSMehGDRgeU=;
        b=DktIpyy83aq43RyVthAmtJbqphO45oJbPrfsmG+5/nlWuZ3Uw94Y0OMjLGjafzDWSq
         IUwqa7V1pvYIH38iyKUQiJMWOZoDE0ZlQO31Zv4rzZx1HNUd7gjqhaJ+bUkXIaFnNfGC
         Kfy95asOdXF7fwEy//FL/OoQ2h+biuG+1o9q7bS+gjawON1QmCCMlGFCAi2yoioB9d6U
         U2uzMQy5KGvxUR0zzFRZooLNX7UXN/zfI5rIlccxR0r8Smc/L5u6od21kAHtLKISbCvR
         oSNiQtL+X/m2bsWazJouP7a0y2aIxUQDe6MN9xeak2skkU59K/hWVeF30/CvdGvRvnzV
         r5vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786228253; x=1786833053; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        b=B6Els+QKOE3/5bGTUsRPLQ4IfRFdmg4R8YQjyvf4PMpkZUC2kv3dakBLWDEigXkazh
         krhDENaVLQWVzhyh4lBQRSU+dmxO6pLq6ziFKsvv0LnDnsWzEXh+4NYdJb8OBwTqJidt
         9ITYRN/HxtVnL680ojEesAvJ4fUFh/e62r1/CCjIM+aW6D37xlDODZ0TiH/fxm5HGZAb
         TcoeZeuVBGnKHtXEyvi6+30knyOpVtD8bjA0w5BHM0MR7ikyjh8xxEMGJNVp25P04NM7
         q4A7hr2CNd33t9HP48JwVcSxvemFGaN3bbvhAy0kdSadIZbA7iuilEBFcz4BATQa5V93
         Q4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786228253; x=1786833053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        b=pSPqx94ZG+MbnYRdfZTGVisKhcRn1pkZUXwYpflrZtvDKkA5Xu3dHnFdh5aAUSrwyQ
         NyIDbchsuVPDAeJlob2QUbvTWLqlRs/lyl5vqCmjHaaeedDzeG1BBPsq41B+c4mdOrJM
         vGkzeiCvA0dMFSSYCorSqZIvABKC4xl1BAChCxg0nOn1IMBKNSYDTQ9313s3ObvYuKNy
         054IqX3X0PzbuutAHkr6tsCF1WUrZ17Ox1OYtxqm2iS/i5iVzcGrs27A8j6nQRy1o77q
         aVduyS4zLOz5PG18zifkNJT4ZPspHGiO0x1kYFTSKTPwkjwaA8tERht0ydy9p67qiHJ/
         /6qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4XgX7LavBOudHR82eXPw4ZaaC1vvFl9yDQ7jUA5A6Hy9L/y5yGHLOCLmLDBjfFHafQvCls3Ur85Vr7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBjjRfaq3Oa7yGCTalxjjbb5jgxQsyaKDlUGDCNhLYS5Jx8Y6Y
	yrvsmpadqQptkaBjIUolCyWxGhXBduNmTHaPVmZUHchPqEWoEHE+6Rrl3qq5BxK3M1yGMqD4LsL
	GtFXGOXu9ZnKg3A2cucR9LIL9WpdvThU=
X-Gm-Gg: AR+sD11ULum0+iiV50JFP8T04QbFkT5nwfZqb4gwoGCfQCQIq6VbDhmB//2ORuWT9EW
	Z85dLDbOIz9blI5hzAm5NuF86KalGos93k08jwiWTO9dJuPCvuX8jG8/cQvONUVp8BuGdO8EO11
	6rxfTwS0y9X1rvL14lYvg5Bgna8gqg0plif4K6VefSEoEKahCiL7lPFgGVHMmywsbIx3FNeZ9JY
	VY5+XwnK3/Ou2oxl6cm53WGQ3R+81hT++AbWsYOP4ykgO/00FCk2beh3nrIx37UKwC8pcBlg7ae
	9BZ1sZ77OBTieff1bq6IutztRDMoOo37U4vyKd48kN2hWXl6NpkQcMwkVe3phr3Y6pi472fK/UP
	YZH6DO4+Yw/YxvLlYybeSz57sIqIm3eIu4vjt7IOYuTHWNUreZ9vJbDdPnKk=
X-Received: by 2002:a17:902:ccc9:b0:2cc:db7a:251 with SMTP id
 d9443c01a7336-2d2b2d8ec9emr100184405ad.2.1786228252650; Sat, 08 Aug 2026
 15:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch> <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
 <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
 <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com> <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
In-Reply-To: <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Sat, 8 Aug 2026 18:30:40 -0400
X-Gm-Features: AUfX_mxXklcd22HO6HDonbWutYlV7pvODMMT9yPLiMD5KmmDZ5Por3aKpq8ARgE
Message-ID: <CABWMpWSSYWusBTvxC8ciHR4FAY4zo=sON5fBWr-B=uefyqAw2A@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, jikos@kernel.org, bentiss@kernel.org, 
	regressions@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: Re: CyberPower LE1000DG (0764:0501) - Further testing results

Thanks again for all of the help and for the patches you provided.

Unfortunately, I did not get a usbmon/Wireshark capture from the
LE1000DG before returning it. I wanted to send an update before going
any farther with the kernel git bisect, because some additional
testing changed my thinking about where the problem may be.

As discussed previously, I tested the LE1000DG across a number of
kernels, including:

- 6.0.x
- 6.18.40
- several 7.0 kernels
- 7.1.5
- 7.2 development builds

I also built and tested the patched kernels you provided, including
the USB/LPM and reset/resume changes.

None of those changes made the LE1000DG reliable enough for normal
use, so my next planned step had been to begin a Linux git bisect.

Before doing that, I installed a separate PCIe USB controller using an
ASMedia ASM1042 chipset so I could eliminate the Intel xHCI controller
as a variable.

The LE1000DG behaved poorly there as well.

It enumerated normally on the ASMedia controller:

    Bus 003 Device 003: ID 0764:0501 Cyber Power System, Inc. CP1500 AVR UPS

and the kernel identified it correctly as:

    Product: LE1000DG
    Manufacturer: CPS
    SerialNumber: QBKRP7001634

However, usbhid-ups was unable to reliably retrieve the HID report descriptor:

    Unable to get HID descriptor (Pipe error)
    Unable to get Report descriptor: Resource temporarily unavailable
    No matching HID UPS found

lsusb could still read the normal USB device and configuration
descriptors, but the HID report descriptor remained unavailable.

The more interesting test came afterward.

I temporarily connected an older CyberPower AVR1500/CP1500C UPS that I
already own to the same Proxmox host.

It uses the same VID:PID:

    0764:0501

but is an older USB 1.1 / low-speed device:

    Product: CP 1500C
    bcdUSB: 1.10
    Negotiated speed: Low Speed (1 Mbps)
    HID report descriptor length: 387 bytes

 this older CyberPower UPS worked normally with the same NUT 2.8.1
usbhid-ups driver.

It has been polling continuously with successful quick and full update
cycles. For example:

    RemainingCapacity = 100
    RunTimeToEmpty = 5407
    Input.Voltage = 121
    Output.Voltage = 121

The driver continues to receive HID input reports and complete full
updates without losing communication.

This seems significant because the working test uses:

- The same Proxmox host
- The same current kernel
- The same NUT 2.8.1 installation
- The same usbhid-ups driver
- The same CyberPower VID:PID 0764:0501
- The same Intel xHCI controller

and the older CP1500C works while the newer LE1000DG did not.

I also tested the LE1000DG on the separate ASMedia USB controller and
saw essentially the same communication problems there.

The LE1000DG reported:

    USB 2.00
    Full Speed (12 Mbps)
    HID 1.11
    504-byte report descriptor

while the older working CP1500C reports:

    USB 1.10
    Low Speed (1 Mbps)
    HID 1.10
    387-byte report descriptor

With the older CyberPower UPS remaining stable on the same host,
kernel, NUT installation, and Intel USB controller, I became much less
convinced that the primary issue was a Linux kernel regression or the
Intel xHCI controller.

At this point I suspect the problem may be related more specifically
to the USB/HID implementation in the newer LE1000DG, or an interaction
between that implementation and usbhid-ups/libusb.

Because I was still within the return window, I decided to return the
LE1000DG rather than continue troubleshooting a unit I could no longer
return later.

Given these results, I am also wondering whether there is still much
value in proceeding with the kernel git bisect. The fact that the
older CyberPower unit works reliably on the exact same system seems
like fairly strong evidence against a general kernel USB regression.

I do appreciate all of the time, patches, and troubleshooting help
everyone provided. This turned into a much deeper investigation than I
originally expected, but I learned quite a bit from it.

Thanks again for all of the help.

Jamie
