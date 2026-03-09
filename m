Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A913A6EEA
	for <regressions@lists.linux.dev>; Mon,  9 Mar 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057280; cv=pass; b=B2/y0DI7sumcefNF1XEyMmrF7L9yNup6xY2mgSjJtkWYiFy9looTMHjiX5nYGM4XjtREM1AgzkO+H3KACr+drABKdxqOr5FLHtfMm4dk0Qu9vBfQVuXyGHvvxzbY+VTtq7yAGri9X5no8wPndCeXVXbIk4+D+zju5kSjlFOcGVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057280; c=relaxed/simple;
	bh=ZRP4v7PWPX+zmV8EvqiA/mk3c8DRZ7Oi6bAtzLpOn+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL5qYzEhYFfAZ2zeKGQtmmdWgd8SXG9LxfPoAJW2mPp0dnOuY0KLfulqJXJVDFJbAquAXglTL1YWRG336T1loRzrqbkgIPfuBp+czPqlAcq9RwXxCy91051LRKl1pAjiZwmsKzjM7urkOXUHzKXvh+sI4nHiRcc5JQWXzwA7/Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbaaiM6D; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbaaiM6D"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4042905015cso4056986fac.0
        for <regressions@lists.linux.dev>; Mon, 09 Mar 2026 04:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773057277; cv=none;
        d=google.com; s=arc-20240605;
        b=kNxw8OUPOtyWljCaZFUBU9EuqTRZhkKvr5fhMBaxVe9NZBH3JfzXuAOogOjzM/FbZ5
         fsvqT93OcHzyhjANUdN1bWOL0tFre4VEG3NYrScb7Bhg5HpDVMdUXEUKAVwMoWWq77fc
         Bu/x9lyfD0tW6wVSoddffSWxlAd4SyVR/bghGxlI0+8rr55lbfgmMrVAj/R2TCzh7PAd
         cYjcFLLIvs8EVAly6t6ban7g5bwbJLWjQ3CD6VmyM/W5KKuohqIepd3hHWn4PF4QMfYX
         PCa6OaM1763cPrbcjcJg52uZxlyjN0SQ7GON0j0JK7BjWffPMRzWO5LygjZ8TvGqpoFI
         BYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRP4v7PWPX+zmV8EvqiA/mk3c8DRZ7Oi6bAtzLpOn+E=;
        fh=l/l/KzrZpG1UVObj9tm4PcyFrrRNlTjFe3zHPFnR40U=;
        b=Q9kSf3AtGKwbzIFytpbUE8IlohQh6ov5TIw5yBqBOSBKrN+/oCf7eGAO7rgctGSztx
         7TrO1Y0hzFAqE+HFUPOpCNPwSLCLQ0/eWfeLigUUK6omv0EZGNAynI6Eh0MQqyUGlFjm
         Rb8qqlwd6pR0J/QJADz930V4zFUVpdA91ITTW3HH9AS1gYCsrOrE1ZF0rngYzSEHzX9z
         fa7V0tfjZN+aWD0tnGNkFUVdLLivG3EyNoRrPjpajJsC/H19mJpYjEJm7mKoB25qKJhY
         9GtekG8xpfidyfB33cxFUB4j0EyU6hgIbGvr3oSXKWxayb3u7YeYb4R2Mcb80xj7Arj+
         /SpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773057277; x=1773662077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRP4v7PWPX+zmV8EvqiA/mk3c8DRZ7Oi6bAtzLpOn+E=;
        b=PbaaiM6DFKvPjEz3ylan0GC5N5BZ/1Ny8Q2on2qFFsFx/m/2FV9ibJ5JlvqZwKXmcT
         9i3he60ql6M3gQvO5p06DNjMqDL+Zt+/kY/zxakF41KE43GlY5AGlpskQnHQyBKTpNz8
         i6CWJ98IopNz6KBF8wUK+bq/qy2tzCzWur3ZSNR+IlM87GdvfO7oG61v0XFIY4/uqt88
         gkXfiO0Gpv+FwjQBVos5ZJlPoJlFXvi2QJ3j3M8cfcOEegGgGrFqebCBp+ZDrnkSVaW8
         NwbJtV21DkV2f9Fd1b+kEnQcLN5Z45xXwSO2OUeMwC25DH6YUPvnIJg7jwNXV7x5i0uV
         1XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057277; x=1773662077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRP4v7PWPX+zmV8EvqiA/mk3c8DRZ7Oi6bAtzLpOn+E=;
        b=oiOJat/7t93DN/JJ3pUX6SzLQumjeDQaeBeSaMIKMDiKZcF3qbWuoOQzY4j26mLHPH
         wdrojtwUQPVH8uZOc/lstLvy6mR6f3VYn3dXAmz6at2zsPomHgP+IJtTnI5olYoO4Z+0
         WuieW+mG/S2QkyXJPQgIzNyySfCgBXnybIL7UyXJwz5b2rg/HwetpQJZ2WAgUo+n/YTP
         LO8KxKdeUC7wQraQZe6SxazTofOJo34So0JnfbtBIT/LwilENP9wlIRvFrQZdxQ7mvZN
         5nIo2eI3ArXmMC8rrd47YcteqyZxLLRa3g5I7XHw7C4VFjvXqfzhrhHSLHw8CBkX8RZv
         VUIA==
X-Forwarded-Encrypted: i=1; AJvYcCWBZMyIquKiwpZBilzjctDNgiYmPfd4SQOlcrthVR6eq8LfmVs1pZ8d67qTjsIGA9SLE2i2L5K55WhWJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZjYImlrjQ/RyV6ITKynHaw06fTvc+OhWTRG5RBGg50gIPQg32
	tNTW8PXN11dERx8xWKwE23fIyM5V7PblImQIDj3AAuzJb1+8FP5kcHy3F5phMkXUAv5AlUZ62EG
	s5pfTA8Tk+0j1EU7u54muQ5B8ltvGBB8=
X-Gm-Gg: ATEYQzz3mxMIi5oz+8/dgsq1+WTAA/iDIktEt9gxy9pzhgxtaP+OmDdlazp1YyWu0xn
	5gTPf7kvmRoSItMpEDI0RsasXbccQwJ7g9lIvUR9W2y4oenNMK0Prxsy4cTIazpWftsNSnSPIPP
	mFcfFcwDoUR9r9w79imbxjz6kYaBh67aKfjo85pIKInE2RokLitzvLImFHJQJU7d3UqSgPc0INV
	qBePnvl6zCF/ULknogDx/5FcwxlvZACqWt1jd5NdTZq5w39UkvRq7cwcUzRzzG5HKEfA5oaRy92
	4bqS1jKVkf4kzG/09tjN
X-Received: by 2002:a05:6870:37ce:b0:3d2:4319:38eb with SMTP id
 586e51a60fabf-416e448be4amr6727108fac.47.1773057277508; Mon, 09 Mar 2026
 04:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANkKV92bTD11PCXYzz60WSxcP-0UCM8xtnY4_WraEwQx6TMjaw@mail.gmail.com>
 <CANkKV91Zfp_Bn_koM=Tb5vHQbog2Ja72C819aL-49kQ6PWA_Ow@mail.gmail.com>
 <CANkKV93wfs7oxU8kiyPWeafOs+ugpZSPLQrea7wtoSuGEG+pPw@mail.gmail.com> <68d90523-33dc-451f-a825-72eaa1c4bcb8@leemhuis.info>
In-Reply-To: <68d90523-33dc-451f-a825-72eaa1c4bcb8@leemhuis.info>
From: =?UTF-8?B?UsOhY3ogTcOhdMOp?= <raczm0812@gmail.com>
Date: Mon, 9 Mar 2026 12:54:25 +0100
X-Gm-Features: AaiRm51LDGipFhqZVVF8l-P-IJc1_ce37qNAFaXZWS4J57r1zOIpXrOgouSBTr0
Message-ID: <CANkKV91attPiZ4+6DQKcgG10apUbF6k5hs7aJBrfsnfc5jQCew@mail.gmail.com>
Subject: Re: [6.18.] ThinkPad T14 Gen 2 AMD (LEN2073) - Synaptics touchpad
 remains PS/2, intertouch=1 ineffective, lost sync events
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

Thanks for the response.

I have not yet tested with 7.0-rc, but I will try building and booting the
latest mainline release candidate and report whether the issue is still
present.

One additional observation: the touchpad PNP ID on this system is
LEN2073. I noticed that this ID does not appear in the Synaptics SMBus
whitelist in drivers/input/mouse/synaptics.c.

Because of this I am wondering whether the device might simply be
missing from the whitelist rather than this being a regression.

I'll first verify the behaviour on 7.0-rc and then investigate further
(if needed I can also attempt a bisect).

Best regards,
Mate

Thorsten Leemhuis <regressions@leemhuis.info> ezt =C3=ADrta (id=C5=91pont: =
2026.
m=C3=A1rc. 9., H, 9:12):
>
> Hi!
>
> On 3/5/26 19:07, R=C3=A1cz M=C3=A1t=C3=A9 wrote:
> >
> > I did some additional checks on my system with kernel 6.18.13-200.fc43.=
x86_64:
>
> Have you tried if 7.0-rc is still affected?
>
> And if it is: could you bisect? See
> https://docs.kernel.org/admin-guide/bug-bisect.html
> for details. Without a bisection developers developers from both
> subsystems involved (i2c, input) might not look into this, as everyone
> will suspect it might be some change to the other subsystems that causes
> this.
>
> Ciao, Thorsten
>
> > 1. Kernel configuration (relevant parts):
> >
> > $ grep -i "RMI\|SMBus" /boot/config-$(uname -r)
> > CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> > CONFIG_RMI4_CORE=3Dm
> > CONFIG_RMI4_I2C=3Dm
> > CONFIG_RMI4_SMB=3Dm
> > CONFIG_HID_RMI=3Dm
> > CONFIG_I2C_HID=3Dy
> > CONFIG_I2C_HID_ACPI=3Dm
> >
> > 2. dmesg output (filtered):
> >
> > [ 1.615300] psmouse serio1: synaptics: Trying to set up SMBus access
> > [ 1.618151] psmouse serio1: synaptics: SMbus companion is not ready yet
> > [ 17.949336] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
> > sync at byte 1
> > [ 17.962506] psmouse serio1: issuing reconnect request
> > (repeats multiple times)
> >
> > 3. libinput reports:
> >
> > $ sudo libinput list-devices | grep -i SynPS
> > Device: SynPS/2 Synaptics TouchPad
> >
> > Interpretation:
> >
> > - The touchpad is recognized as a SynPS/2 device, i.e., fallback PS/2 m=
ode.
> > - SMBus/RMI4 driver stack does not get loaded, despite the kernel
> > config enabling modules.
> > - The "SMBus companion is not ready yet" messages indicate that
> > psmouse attempts SMBus access but cannot reach the device.
> > - I2C controllers are functional, yet the touchpad does not enumerate
> > as an I2C HID device.
> >
> > Workarounds:
> >
> > - Using psmouse.proto=3Dimps avoids lost sync events, confirming
> > fallback to generic PS/2 handling.
> >
> > Observation regarding previous reports:
> >
> > - Unlike the 2021 report on ThinkPad P14s Gen 2 (AMD), I do not see
> > any "bad SMBus base address" messages in dmesg.
> > - The kernel attempts SMBus access, but fails because the RMI4/hid-rmi
> > stack does not initialize. The device simply falls back to PS/2 mode.
> > - Therefore, this does not appear to be the same base address issue as
> > the earlier P14s case.
> >
> > Conclusion:
> >
> > - Behavior strongly suggests a missing DMI quirk or regression in the
> > SMBus detection logic in combination with i2c_piix4 on this Lenovo
> > ThinkPad T14 Gen 2 (AMD) with LEN2073 touchpad.
> > - This is reproducible on multiple 6.18.x kernel versions on Fedora 43
> > stock kernels.
> >
> > I can provide full dmesg, libinput outputs, and acpidump if required.
> >
> > Best regards,
> > Mate Racz
> >
> > R=C3=A1cz M=C3=A1t=C3=A9 <raczm0812@gmail.com> ezt =C3=ADrta (id=C5=91p=
ont: 2026. m=C3=A1rc. 4., Sze, 16:02):
> >>
> >> This might be related to the earlier report from 2021:
> >>
> >> https://lore.kernel.org/linux-input/3d6f7f74-3214-4c03-b352-a2a0d27ea4=
2b@amd.com/
> >>
> >> and a similar report from 2025:
> >>
> >> https://lore.kernel.org/linux-input/b2d0af40-876e-4a2d-99a2-236b583e94=
97@gmail.com/
> >>
> >> The 2021 report describes incorrect SMBus address detection with
> >> i2c_piix4 on ThinkPad P14s Gen 2 (AMD), resulting in RMI4/SMBus not
> >> functioning correctly and the device remaining in PS/2 mode.
> >>
> >> On my system (LEN2073), the behaviour appears very similar:
> >> - intertouch has no effect
> >> - "SMBus companion is not ready yet" in dmesg
> >> - device stays in PS/2 mode
> >>
> >> It seems possible that the same underlying piix4 SMBus detection
> >> issue is still present.
>
