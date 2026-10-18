Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336753D5227
	for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353185; cv=none; b=Thoc+eecbur3z0viESiZR+CiCvY3tYlhKXqZ6mxJmRsURG8rRY5pSskY7h+gcZJ64N2s78zWBtQYRJo1XmI5OEgiMXuqVn2n7r7nfQCeNIqwD9y6m47bHCDVsWhjpz9wP0USrJ86BTbjJPlxnLpCnpW/XFXmZceEBGTIWEGVkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353185; c=relaxed/simple;
	bh=OYatXJ25PGBn/IK2IFH7QyggHeIOnTh0kghBv6Ci/cU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ueh5ervujr2ENL1TJmFu7oMwHSNIqzJJ8n/+CF3POKp/Pj7jzEqjKXsPAbzIfmyJquLjNRaKn6A1qnSb+zfKUZ8FEM41vk+YlsNViY0v7k1PNJreyMyI7+hx9mD9rnoT+KoQOZRYpYT5c5q8EZv2DPbXl5nW7nbJGbX2MWSw6/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MApnRIJ2; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MApnRIJ2"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990a56e5878so11241241.3
        for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792353183; x=1792957983; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=MApnRIJ2oTZ8TfEYNEtnU64m6UpsIKs2luufX3XaMGpaUNTDNdcitDggJPpXFrA9XT
         mxHO/WunMSa/LoxfhZ9ygwNjmycSXwAL2Ayedw2CYGiEKYm/AlecXm5duPHwqc+Q2LNh
         WTWlTwRYh84TKAQs6liAljSDNtcu7mhHqCYAFO/ftDoX4O0yXyIvdDvl0o8F6bHEXngc
         TmX2GTNPsM3oRgA0GM6HNLNckJkdQSNMiMzJfU5P3Dsf2ix+cu5Gg6P48aItzgTXTbKy
         MMm5Mu7MRLM/KrZMUKHSF61rF4B4A/RZHVYwHbe+x4/RAqkIJyDtKOiG5DfK6B4PqLEI
         T92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353183; x=1792957983;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=Q6bBB0aAqm2wTYKL9uz5lR0B8qCG3EpVjocb6S1ItGiWbE5ylHpVSFgkUkbe26h+jf
         ypM9p1r7obMTZbbuAqtAyDkqZEQV4nz6hXKVzcXOpLUMhfkBKuHtNxgSmGYlpOpT1rON
         g1iKfxNL2zXkEP2hBCa74zzSJEjmgIRKzrk7PrIpWVygNMfikfuhlHfQSqioIy5t48v2
         kDwoJwWANT+pwQpAvTGfyfTCCBMUUwZZDnV2kXLuDVy5Qdq6EZIq0aJUkciHwhJdIlsH
         P46j416SjgFfFmKVl1cKmA2EfgI8q2XSa7viFwWqWJfN+MGKZoupq7sWut5QWVh1dpWo
         6rmQ==
X-Forwarded-Encrypted: i=1; AKwUvByv3uzqld+y240G7iNk3OitfRdap19acmgV4TR7+LKfT/VbXKYhDFE0kLIddUrcV65JhuRkoPM9IMN1cQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLA5yxQB8Oe7GqrtMihFzG2vmUX0xlPoOOy4D9Socbqi6rVlMyu
	Ojg91/24Y1N7eA3GqTa3mkGd0dNE9ONmARfTA0cNNe1vnEOhg4FK/mYq
X-Gm-Gg: AYBFou15fPl5zjgSKDWNkqEC8o5NaqBPenIsLv6O8ze9zVSwH0edjIwC+N7x6BLp8yd
	lw11Nf9HBc7KwmCjeQ8yEztf2hBJoNqBzFUDpM/BjN+naF8qC9Og2771V/jiKVrOyqsWwwtdQ9T
	av1lEyRXCxn7267go5wIQ03cbRy7mM6mq+v6k0c7Hw+gmiyUa1rzbrrhkjztwI/gOTS8DkR9XOu
	fRMvgodg4YMtqzNhC9EBDDe9vNg5QjOCFA88b6ZvOnk3GX90y44Mn5fJ6o4wPwdzpBb4EYLuTM4
	/BA3iP2t6GhKGGdley4GY2E0cAJhVzIDO4t4BiDDcxGiCDfHFcuLi3KoXDidLa0CT08B5iSOQ9Q
	UV7SWP9zSHQPI822Pvqc0yNmA2nGVTYR8NQAtIGGV7aK6Q9ivOmyTBNOePEeiRPY4yP7xp46u4E
	9IvBZA9rTqaBl/2cQzvX4ifKAGT/9qIU7XXYEbP8kUgaHq59Z2T0ovEZHSEBOa2Af3
X-Received: by 2002:a05:6102:418f:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc3675493amr1035152137.1.1792353182908;
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:109f:2ff4:4712:873])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1987900fsm8043946137.10.2026.10.18.12.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 16:52:55 -0300
Message-Id: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
In-Reply-To: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>

On Fri Oct 16, 2026 at 6:00 AM -03, Martin Wetterwald wrote:
> On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.c=
om> wrote:
>> Hi,
>>
>> For Raspberry Pi Zero v1.3:
>>
>> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>>
>> Test setup:
>>
>> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c=
5
>> - Setup: RPi Zero v1.3 connected to a HDMI monitor
>> - OS: standard raspbian with the desktop environment enabled
>> - Driver built both as a module and built-in.
>> - The following command was run to test the sound: 'speaker-test -t wav =
-c 2'
>> - Result: Both HDMI audio channels worked correctly
>
> Hello Gaston,
> Thanks very much for your test!
> It's great to have variety in tests because I don't have the Pi Zero, and=
 I
> didn't test it through HDMI, I tested through the Headphones jack (which
> doesn't exist on the Pi Zero).
>
> Did you also also reproduce the bug without adding my patch?
> If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi =
and
> bcm2835_headphones are both not present. And you should see this in the d=
mesg:
>> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' =
because the bus was not initialized.
>
> Regarding your test: there are two ways for the sound to go through the H=
DMI
> port:
> - One is through the bcm2835-audio driver (using VCHIQ)
> - The other way is through the vc4-hdmi (bypassing VCHIQ)
>
>   # cat /proc/asound/cards
>    0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
>                         vc4-hdmi
>    1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
>                         bcm2835 HDMI
>    2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
>                         bcm2835 Headphones
>
Hi Martin,

cat /proc/asound/cards shows only 'vc4-hdmi'.

After adding the kernel command line you pointed out, the bcm2835_hdmi
interface now appears.

The default interface seems to be vc4-hdmi. I could switch to bcm2835 in
alsamixer, and repeating the test in that conditions works. However,
speaker-test seems to take the vc4-hdmi interface nevertheless.

Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
thinks seem not to be working with that interface.

Im trying to debug what happens in that condition; I will need a couple
of days I guess. So far, this is what I could check.

Any feedback on the test or debugging would be appreciated.

Regards,

Gaston


> Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
> If your sound happens to actually go through vc4-hdmi, then you are not t=
esting
> my patch. If you can't see the bcm2835_hdmi, you just need to add:
>
>   snd_bcm2835.enable_hdmi=3D1
>
> to your kernel command line if the driver is built in, or to the modprobe
> command as module parameter.
>
>> I=E2=80=99d be happy to run any additional tests if needed.
>
> It would be interesting to test other "clients" of the VCHIQ bus (because=
 I
> only tested bcm2835-audio).
> But I've just noticed that bcm2835-camera doesn't exist anymore (it was u=
sing
> VCHIQ via VCHIQ_MMAL).
> If I understand correctly, if VCHIQ_MMAL is still there, it's because the
> bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, b=
ut
> there is not current "client" in the kernel as far as I understand.
>
> The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV)=
.
>
> Thanks again for the tests!
> Martin

