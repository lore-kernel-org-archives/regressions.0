Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946126;
	b=Nr+pjBFiiFVUKdltswEBbXVBqKmjlrjHRWIzWxVH9yotnoJruFJriEBcqm7uiwZTtNs/
	 sMttr3rPIzT74BlrgXDVnnqMWohUwOiGTM4AM8aicXnsyBYlA7QS+uM7eUs4sPV1fxZ73
	 GMjYuzx/wUMAbmYkaJfFRqJ40FXTeCVLkh0WgjbeG0yXL6g5w7g6M2Hj1rU+xtpt98JA2
	 WhzwB2dQkM0/q1wexlGnHvAeBox/CIYOBvaxwEelo7j5un05HdWR3IzfUlT6H+ruVgmJk
	 lalw6QpCylNbtByunN2T8x8IhrJglhkmbnbiFdAdJ3TXw0iZyfGbjA/XzgLAHhYdNuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
	b=DWOygBZGXu4BCe7cgIE8NSA6T64fTENrYeepNK70xVRxmdG+U9idF3rqH1cVol2PrEeP
	 JSUYbchAimP27f3pcdOZrBAKJ2SFAAimOUISBCft9reNBOhusWEDfh71I+S9g3u8AfGDf
	 momDUK5GakdvZD4tQu91dqS2hZUGlyPSlIjAiZ3wbIymGssNwtYnWgvmu6et1AReSpkxz
	 Q0K01qaS/A2r18nltTxWLHXwwspBz3zvRwtnPQc34FJxha6Mz+AGFKz08Z+3Kh1tfD8p4
	 BmwnZWx33B6NEhB8bxcOIfPJBJ3nes0eaba4gdb4VAgjAN8uCTfM837m4rfMd98Tcxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4OOxSN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D5606A32A
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 20:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4OOxSN
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso502260c88.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946125; cv=none;
        d=google.com; s=arc-20260327;
        b=SnuoZFh9t/Ni8oPnJv2l/Pk3Igc5F2tp2uqE2OB/E8vuDhagMpo8hWqCNvUWKD0NiG
         NS7x3Iydp3Tx4zwFv2Pjew1/HHy+GrgbGYEFScNcVKnAMrp3N0rn5z3xkRP6dFX1YuZi
         3cV4f1/NJfQE3o4BmjLdsfMAltr1NEnHgZJvvBgddg9/xd9u2yn9l07abs1CQBRDKxA6
         AoqdmvMRQv9bAAZhs7Dg1isdKaOHGp6EZCgyvVE9WXeJ4R23L4sBx2Hqr2psllQoS35a
         QQ7FF8mtAwVgFh7+O44YSJy4V08qct26M+XPOj27p3adiYCKFObfVjBz2e/4DW5Z3ukb
         edPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        fh=a+qooh8HH1KKG9GYMAmTocd7/gs3ba6VjOF6ngExVMs=;
        b=TkFu6LocbHEBxbkR7LbXBMldSxClumOFVgkQZgqNn/Cq3AzU7eYwIhXfRhJ0gQaQn6
         tgVui+v6EavKD/ZC4NpXJUleGXjGPwFJSOQR41wYt94AY34eXANAFCUSJ9/yd0nTdug7
         ZIBNog4XVXo/kOSN0VpwJA7aGl4AgdB6rG0pnJW9mBE9JaCvu2cOt4ySB930CrO2RRln
         9KZpEzFcmv7l4GPtV6OG9fBrnIOnp+niqNFBSUox+R9G16pCZP1TLX18Xomn1f9m7QVb
         EiylpDKZNAgahpIOws//DtfsuqivG8IxXk5Qd3C9psfeNKNT/+m6GNggFJC3gsMVkOfK
         nmyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946125; x=1795550925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        b=KR4OOxSNEX1c2Cr1sLtRzbFXJDAs+vXU+nP3k3vVq1DZQg9XGZiYwMkWgNfKrclp0A
         VLFJ2E9ND6t4grvYJbUEQAjevkA2g7oLKe8LsBZE9TBZO7QMotAdUIc8/TMUe0fnmAIz
         gcp5its4EpKdUHZ/xTfxlFdHz54a0uYjoQ9X0hgNcsuYSvncQigNXufI0pre/4vQMYim
         07mGltzVIfWfwnBRqGmvnPJzrdazR3ejG51jqlNLyBwf4wFJsAY5r9BdK4kiBPeJ5E09
         3Sz9C5A6oqBYfw1TB4nt7RE+wdGGQ2N/8j0QOmLhXzIYsf9M55y5XzSqp81v3ZMgBLeM
         4Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946125; x=1795550925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQbxDMA0GPyDW1ffh6WRnp7UyKwaepfSZxSw2JasMVU=;
        b=OJ266t6gGpYTWdONmj2RotSKBHPvWnlasJ81YCIsGikdnx8NVJ5bqXVbKLfBkdeHYp
         moTk88fvA1ZcJ/umCe72Wg8+bpw0eohv9D+G8+fQgdk+lVrMDuL++pNlLuSlZ0POM6eY
         MmJdnVgnGk8izpRBP8X18QMxgHc1nq4UwyhB2CASoSpFBtDYilphVUyztpKgl+E/96rI
         Hi/cH4CjA7ir5qysYcdlbQLXD+Xl2bWn4oUYzKzk0xiKAzzNvY6CotIVZ2621WTEmaem
         VjGKBa0nb0s3onHl0vD4QGr9QczUTW9GVUZ7tmiV5ecwypl7lpmEesLffoxs5F9vwuZt
         vs6g==
X-Forwarded-Encrypted: i=1; AL+hErE+AsRuDbpLuJlUk/CdEKicrRAO4WkEatDsGw5AR5+VJMgQYYkEpEfPLn4J/Dw65E9FHXZvrpsap1KR1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Cdo0AmwBJrVlPiIojPb6YSdjyo5RVihL/Pcb+IVKItyB4Bb5g
	AI2HrpEDtzftJdbGd+DlGcUXwmSQOXJNTabOTg6tUkw/Pz1ToCKgF4n0Vvb172VA4ntS0wf5J4Y
	5ZvhjlDOeF10xG0q/RIaqfv3bdzsCLww=
X-Gm-Gg: AYBFou1dFiB6FilLXGDDqRjLvxvYJ7ABSZg1OV+MIPdUMLvCYxPySQRLy8qdWXWqRzj
	8GqrOzVAww1MptlrP8tgiLNWKyk5Fu4p0PBS7NiBbCPtMaih1EKj8pOvd1N4Jd5IsAfENjDf2Sj
	wZ/8gmldxVkZXnYdKiZRKOc0T24tn70qm0X0bmwkGJEwhVAfhnH+LFzCy4b+uRIMeqU8GUyZ4ut
	LRHSnSrPCMy45FaaUEhtEYzk8cQXL4DJqAGKmGtfViZvv3yxbh54zGoTm2YPlVzulzcA6Ik2y+S
	oiEG3pN0LcRWvKwlGVNkoHYOMK7S7f2wZJwa+PQwTGqyZLCc5FMwvd+yRtFCcEW64i/nFpbD+4s
	tdpPHSDOcnHwLrhvT9PXG+eSlC9zwKvS28bko
X-Received: by 2002:a05:7023:a8b:b0:151:2e62:fe5b with SMTP id
 a92af1059eb24-1b543c12c96mr654633c88.22.1794946125077; Tue, 17 Nov 2026
 12:08:45 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com> <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
In-Reply-To: <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Tue, 17 Nov 2026 22:08:32 +0200
X-Gm-Features: AclHuK9zM_Ls3MCzLaCDnl8n-_yZmMi5OFpkqnXIKOSPNu4QJjDT3wDoWJvAC1U
Message-ID: <CAKWEGV5XEncchpzBJWjjYh+cXE4ZSSiBvEDUdN-3nLw8tA4W5w@mail.gmail.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: johannes.goede@oss.qualcomm.com, Ted Vera <tedvera@gmail.com>, 
	linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Cc: Maurizio who continues my YogaBook porting work.

=D0=B2=D1=82, 17 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 19:3=
4, Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev>:
>
> On 11/17/26 11:54, johannes.goede@oss.qualcomm.com wrote:
> > Hi,
> >
> > Note adding Yauhen the author of the troublesome commit to the To: list
> > (why was this not done in the first place ?).
> >
> >
> > On 16-Nov-26 22:24, Ted Vera wrote:
> >> Summary:
> >> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> >> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> >> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> >> appears in devices_deferred, no RT5677 ALSA card is registered, and
> >> only HDMI audio is available.
> >>
> >> The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b ma=
ps GPIO
> >> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> >> device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jac=
k detect
> >> and mic-present), not Yoga Book-style external reset and power GPIOs.
> >> The driver requests the mapped GPIOs before registering the codec=E2=
=80=99s
> >> GPIO chip, which appears to cause the deferred-probe loop.
> >>
> >> Test and result:
> >> I built a temporary module against the matching Fedora kernel source
> >> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> >> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> >> card appeared, and laptop-speaker audio worked. Secure Boot remained
> >> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> >>
> >> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> >> resource layout matches the Yoga Book, rather than applying it to
> >> every RT5677 ACPI device.
> >
> > Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
> > a DMI match of the yogabook sounds good to me.
> >
> > DMI strings can be taken from:
> >
> > drivers/platform/x86/x86-android-tablets/dmi.c
> >
> > Note there are both a X90F/L models which ship with Android and
> > use a different BIOS, as well as X91F/L models which ship with
> > Windows (same hw, different BIOS).
> >
> > Yauhen, I guess the ACPI mappings where for the Windows X91 model,
> > since on Android I expect the GPIO's to be hardcoded in the driver?

For Android tablet (X90) I used x86-android-tablets module to create a
ACPI-independent mapping via GPIO properties, see
https://github.com/jekhor/yogabook-linux-kernel/commit/4e3c2f5f7c74305d4825=
bd1c031fdb3bd16edefa
,
was submitted as
https://lore.kernel.org/platform-driver-x86/20260611-x86-tablets-yogabook-v=
3-0-de407672e4df@gmail.com/


If GPIO mapping in the ACPI entry for RT5677 is not generic actually, then =
we
can use the similar approach for Yoga Book X91 also and don't use ACPI
mapping et al.

> But the open is whether those GPIO mappings belong in the codec driver?
> Back in 2017 (!) Andy moved the Samus mappings to the machine driver
> bdw-rt5677, why not add those YogaBook mappings to the cht_rt5677
> machine driver?

I actually cannot remember why. Intel's SoC subsystem has so many similar t=
hings
made in different ways... AFAIR, I didn't find any mention about other real
devices with ACPI and RT5677 so tried to apply these mappings as generic
and belonging to the rt5677 driver instead of tricky management in the
machine driver.

>
> Looks like the addition of those mappings for the YogaBook didn't follow
> the Samus precedent, now we have two different ways of doing the same
> thing even though the codec is the same...



--=20
Yauhen Kharuzhy
