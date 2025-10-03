Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339511F4165
	for <regressions@lists.linux.dev>; Fri,  3 Oct 2025 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759519091; cv=none; b=MDNxavJGe7rHNgJFJhnjJ/qBaddTgxBxqsW9QRjidtwCANBRg8O5qjFCqoRsSy3jUKsyBvFLk3DvdzreFICzG8aJNa83c7FVt/ztE11QFzsF7cgyoyMBcnasmYtMuRTZ7i52oV/gNmgSINE6aPJE3Hqwlm7WpVMNu1SNZAVoAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759519091; c=relaxed/simple;
	bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKcJWdomYHetKXOcXUfYK9cbZuLu+ZAPujRy4nJaRW0xO+H2Qrnbk3Mqb7RWqhV0YfV/kjVMW+peFy8IZQ0KZfpuLlewzHaT4y7GkEErnnWR0ZSOq+6iIgv3/GoKJB6xg6tLGr9C1c5dEjEU3icPUiKZC6ZXX5SNrOEV/rRkgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSRe2reB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSRe2reB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b48d8deafaeso506319466b.1
        for <regressions@lists.linux.dev>; Fri, 03 Oct 2025 12:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759519087; x=1760123887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
        b=GSRe2reBH5hF2cRNRPbqa7kBLbvwFa/onxRsaJwqRykHSFDhnBms0j8c+exDu2Ds77
         QSqmu0weMlh7BCvao5PgC8JqtrZTzZr0NsIy2NL9cJIUQSsi5M+RfkJ4iUZ37rmCvh7L
         v2g4aCfmTCnVd/ZbuYHL15LEDgMUaAXZ6WJ8KJGqAPg7AnLnL20wH+AVMBti28FLN6jp
         quWX0x5e4dM90E6yDXJfx43lcZz9e8a3iPS/Xt96ygsnmEQi/IV9fHOsNkGsGeajFbwp
         VEgjEdJItjKaCG5W/Uyd0GoX/1ZPCPh6/jRukTIdgm9MfL6UEOq7kbhIy5+aAdskhR0+
         u/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759519087; x=1760123887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTh0mPMvFAZJ4PiZxOFYxvOxCcPwBnoecG/kw9TBmt8=;
        b=jYtGrTBurBqxsO1XZczV3YZxJ9nZ635D9JH7BKvu7AvOSXbD3f10GwLZAa9IwexEiW
         HS3E8wEA7gHZHWo8vK7HfOSofHnjcXsIV2KEgWF3FqJau/NdenwS+sG1MXrdU9QWgSlo
         ar78eZ2ZuDhvgX71a3zZiO9rg0sGPlqReBh2VCsKio+89vKwhGvAdsz4BBg+aJ59Rqj1
         cqkezFVsC2gV7QZqSRV762ZwtNEaxgtzFUaSRnbH9tuxXWiYWfRyqmTjsXq4XWKF2BSd
         wIGjo0hw4gkjjQLSvyOyFeYVIg7krMabXP9NxblaVitsKMVRfunf1Nz+euHKnTuJ2+5M
         VqRw==
X-Gm-Message-State: AOJu0YziuR07Qed/itlo9B4op9Q+A5JgdXwjwJhmnTRw14okMKgW5e1N
	o5mszlfrk7HyLRlS+zBUwtj2ClaIcLVROkvY0hz6J8M8T3/w5ZvEG31oaMw2fC4k7CblPt81GUA
	70H6eGqkjXUOt278bSEf9crwebHY8Ds3mZjH24Tp3ag==
X-Gm-Gg: ASbGncuC8bjlk0Pd9LU94nZ3CIVNiyEWSaJ8qy7FeE6WnX1QaxeusnvAOCD1GHzjfxU
	lRtTlLu0ZZ2iAnXoUxYpnCWJXgDFQxe3DKw2k4W5A6kA76kH9Wm2HExByrvcUWh6WGR9oVNv6dZ
	FraawCcj3sL+ba32AuJ9OTWmv3DiPMm4EEF4PQhd8ycRE4Nkl3XL1r4mYXKuQ4kNp1DSFxYoaMY
	7E9pyBoT3m9STACSoXYTLHvm5iiid1snGmlbHBEt6EWOXDHmLpcBPL6j034+Pt4QIeIA5N62MF5
	2IH77VeLI+7krO8mgL8obY6ADKx5Ibirkq6DaFnh5VVtOivK6JQ=
X-Google-Smtp-Source: AGHT+IGDOIEbBwI4RhDZzYph5tS6bdWRRfEmWKBJtyzJ/peaaAqFq5LRzC9YvYETAyKZMd/yrHiOroASHRIONgh2gxM=
X-Received: by 2002:a17:907:3ea1:b0:b41:297c:f7bb with SMTP id
 a640c23a62f3a-b49c3639c42mr483063966b.26.1759519087163; Fri, 03 Oct 2025
 12:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMBK1_QFuLQBp1apHD7=FnJo=RWE532=jMwfo=nkkGFSzJaD-A@mail.gmail.com>
 <2024011723-freeness-caviar-774c@gregkh> <CAMBK1_S2vwv-8PfFQ4rfChPiW7ut5LXgmUZRtyhN=AoG3g5NEg@mail.gmail.com>
 <bf07c1bc-b38e-4672-9bb0-24c16054569a@leemhuis.info> <CAMBK1_Sw8nVSN3Z7WtHYyJ2xWUNVYNcx26UKFx5hy+xQrO=bHA@mail.gmail.com>
 <265839123283304ede6b391bd92340adf77ad0f4.camel@tsoy.me> <8254efed415d6e7faee6b04b88993e7ff35ef8af.camel@tsoy.me>
In-Reply-To: <8254efed415d6e7faee6b04b88993e7ff35ef8af.camel@tsoy.me>
From: Serge SIMON <serge.simon@gmail.com>
Date: Fri, 3 Oct 2025 21:17:39 +0200
X-Gm-Features: AS18NWCe32Ldm4hs8tE1RbOVqIom7vBxOU-D-F2UlS9sWPDuO0-UdOCd5ilTOk4
Message-ID: <CAMBK1_SSkpDXUrs6LU3dCc5nYsyLC1rV2+X5=C4c75UtAmQB_Q@mail.gmail.com>
Subject: Re: S/PDIF not detected anymore / regression on recent kernel 6.7 ?
To: Alexander Tsoy <alexander@tsoy.me>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So i've just tested this, and ... you were definitely correct / on the
good track.

Once back with 6.10.16 + that "snd_hda_core.gpu_bind=3D0" kernel parameter =
:
- my S/PDIF output is detected again (and is working as before)
- surprisingly, it seems i'm not able to select the HDMI outputs (of
the monitors) under GNOME settings (i now only have the S/PDIF entry)
... however a "cat /proc/asound/pcm" is correct, and is showing
everything ... but to be honest, i just don't care (the point was to
not use the (crappy) monitor sound outputs)

Extra information :
- indeed i was bypassing the iGPU (also activated at BIOS level) to some VM
- by the way, i also had the "intel_iommu=3Don" parameter at kernel level
- latest dmesg from today (for reference / just in case) :
https://gist.github.com/SR-G/ef22e46e96bfb300c3689cf8ea073098#file-dmesg-6-=
10-16-log
- current "cat /proc/asounc/pcm" is back to :
00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
00-01: ALC1220 Digital : ALC1220 Digital : playback 1
00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
01-03: HDMI 0 : HDMI 0 : playback 1
01-07: HDMI 1 : HDMI 1 : playback 1
01-08: HDMI 2 : HDMI 2 : playback 1
01-09: HDMI 3 : HDMI 3 : playback 1

So a big thank you for your analysis and for having taken the time to
investigate into this !

--=20
Serge.

On Fri, Oct 3, 2025 at 8:32=E2=80=AFPM Alexander Tsoy <alexander@tsoy.me> w=
rote:
>
> =D0=92 =D0=9F=D1=82, 03/10/2025 =D0=B2 17:57 +0300, Alexander Tsoy =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > =D0=92 =D0=9F=D1=82, 03/10/2025 =D0=B2 15:20 +0200, Serge SIMON =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > > Hello,
> > >
> > > I still encounter this issue (and every month i test the latest
> > > kernel, each time with the same results) :
> > > - i do have an ASUS B560-I WIFI (ITX) motherboard with a S/PDIF
> > > output
> > > - everything was working flawlessly until (and including) kernel
> > > 6.6.10, and that S/PDIF output was perfectly detected (under GNOME
> > > SHELL, etc.)
> > > - starting from kernel 6.7.0 (and newest ones, including 6.16.10
> > > tested today) the S/PDIF output it NOT detected anymore at boot
> > > time
> > > by the kernel (so is not selectable any more under GNOME SHELL or
> > > COSMIC, etc.)
> > >
> > > With old kernel (example :
> > > https://gist.github.com/SR-G/0e86d917716acff0d31cad0365f0b500#file-gi=
stfile1-txt
> > > )
> > > :
> > >
> > > % cat /proc/asound/pcm
> > >
> > > 00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
> > > 00-01: ALC1220 Digital : ALC1220 Digital : playback 1
> > > 00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
> > > 01-03: HDMI 0 : HDMI 0 : playback 1
> > > 01-07: HDMI 1 : HDMI 1 : playback 1
> > > 01-08: HDMI 2 : HDMI 2 : playback 1
> > > 01-09: HDMI 3 : HDMI 3 : playback 1
> > >
> > >
> > > With kernels >=3D 6.7.0 (example :
> > > https://gist.github.com/SR-G/0e86d917716acff0d31cad0365f0b500#file-dm=
esg-6-12-6-log
> > > )
> > > :
> >
> > Did you disable intel iGPU somehow? Try to add
> > snd_hda_core.gpu_bind=3D0
> > to the kernel cmdline.
> >
>
> Ah, I see:
> ...
> vfio_pci: add [8086:4c8a[ffffffff:ffffffff]] class 0x000000/00000000
> ...
>
> You probably passthrough the GPU to VM so the i915 driver is not loaded
> on the host. Thus you really need snd_hda_core.gpu_bind=3D0 kernel
> option. This is a consequence of the following series:
> https://lore.kernel.org/all/20231009115437.99976-1-maarten.lankhorst@linu=
x.intel.com/
