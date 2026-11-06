Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959398;
	b=3E0KWEvq9FM4MLRZpZp4gk+3I7VUxjwhkOQe2ZDvjh9cMcAmGtuzcCkRZAfTj75XhvdF
	 83HehF4P2VySgnN/00n6C3wqDfj0QWofHVe3/z42Nr6u9SMZdfPqkyQRaBh2cOEZJ2V61
	 E4tNSJR/qkNxy+dVMe337dkqebuzyrLUU9LbnR2GC4Aady6kBFHOsYZyZJHu+WlPBnOxI
	 SNLANKLqrSWq8QhQ4q7z/gB43zAInSBN4YuC0Hn9+G2I43uxnbzon8SKagiGoycG1TCeS
	 tfsLCEOthVGAp6g9wrJxEKq5sh3tbMHXhP5qU0SRR0iy+yl+X7NzfrG0c1Rzs2MWYuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
	b=ZYlap3rh4Gz3fdrkQsTCW7WPhQaEJV/YyhdDQqliNjrd2IlLSs9jm0mKHdy2JNjRNzxQ
	 G+ZmEA+Y7e/x2NhHffJJRSItqMTzFlbtffHLE6f27+FhobyMxpc/5JpyRvAWzuKWwgMyI
	 U4Sp4QhxGzRYftXPyCaFqmAdRYajtYjD8VBtnHZ+Ipo6lbgJOS9Mq/50UQWqwX+9cIFfV
	 rCcUu3opjYhGMwrsksfxOgjpjocPsjo5u0VKQHsMXYjirhiYZH9o+DvwTiXQlaqV5djiY
	 NoqIpvBnQV0zEkfHXjOsXRg9My9pq8IJeCTwYvaFBRHKiQC7bdnxbP5d6ECf3RCcOTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDMp0Lr8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D1606A329
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 10:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDMp0Lr8
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so165669137.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 02:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793959397; cv=none;
        d=google.com; s=arc-20260327;
        b=jsedDOuEoIu1pbhEEsPqbgkNxVO3wGcoTryTaoU896b3atOcMOQv92hdW5ZtiSYVSn
         BaAuvUeRmpyjBQ665Q1xJogEvkC1eexoII8wgI47WLLw+efd1boYDeO0fQXkA7ANy1i2
         9gshXEJwshuMBScV48xiHBc0ocxWQl05fBJxHkLp22F+qn6b6Asb6L8qdg2UYzIeqEK8
         NC/4BXDHjHqK2Kotu5VDoxY1gIFRPHZl6IjPVCU9SMnN+61KKncsnAgrq72qt+5ufiht
         K1t6VwbQB1LQufXgE0xWh4G31oGj3+5WcqGRbe3H2mEzIR4eVEqWkJww9FWTz3jXhNJR
         LYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        fh=N8U+y8yN5veyRwS/l1GYV00D9O7DFGDBMVEkPuPuEkg=;
        b=VPiP2yVmOBUzK8UUVeiwcc0CY/gptVRwJQeijOGr6PuJKqaoBBURj68sq+0+NLWLKA
         ETiz7yIKVjzkTSP7TUfLoCrvxjf9kpNh4GZMMjqGIHAfMoFRUiEAg7Z9Ky3My4XzkkxJ
         toryMbe6N+90SoINCg6B/T6JrY94+OW1jilseAFUlGJsDxBU9ZT0iNqqumWGmPKA0HS5
         Ng22DANSfD4ALMFju4Fs43emVh5AdO1kCEUsmeco6d/aS99F/VG1gXi+c7o+Mof9+8yp
         JTdDR9nf5fUezU1pjQySZ7zttaKYJ3KhZUyyR6zD9VDb3VQY7+gk+0T9CBa0hdxsIssT
         TB3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959397; x=1794564197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        b=EDMp0Lr848SRqrjZQulel/kmYyMyI7niomyDpGKzKhqwLhimBh7OYkw93Lg3ZansbB
         9mnyujRxGu+iX9c4bWGDIUKRueGumP3E4Tu48oM+zHDdd3Y8N9KNr2pRWMdiAw7C48+i
         r+yX8eNSiRVr1oBdxfs8j0vTrW4u6e5CvYQkMoPMyFjauGteqmxXw+Fo1Q3kb5mM8CLo
         7Kl7qZndgym7lgVoAKliS9T53j8hbiXhBwJ3fmNqJykrgktNvk5TNWE5MZ40BsKjD0DM
         xWrX/FqkIujbHVOdaTEifvw70G7Ql5IfX/yT2ZrCYmbEIKfTY/E1XCuFPXvmAY1ekIt8
         5O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959397; x=1794564197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSZkFkCCDBNxOw/NDUgxZCgowYX4MpqRsB6nquU31yw=;
        b=ORiQ51R5d5q7R8PgO68MjroMCjG9GCLKoeguL+CBkDjBmrkg2ig/2K1kxjamHxXceS
         jzidzP9FVMmac2g6Ez3IcqeJDDyscpPb49py/a7jg+rnhZfjh+LiYYK8efUBiqxOq9U8
         lKsu5qgk6WH44C3oZl25FoCS1AB+6+Tro28I5w88DmGr3P63SAzRVxqLV4Xrl4MCXSzu
         01kx4sdThHqFdmDheyQDC1t8nVUJgPuWZqBvH4A1q70cjkcOX69UuvrBn+5YAU3Kkh48
         9Km3RmVF7tnR8ZzEIy6x/dDVMZeKErz2jraiojS2yQZkxvT6HLr7kHAHYBnkpa1Fsgz9
         ck0g==
X-Forwarded-Encrypted: i=1; AKwUvBzp+8VioXvBhJ0ukPTJnfV9PB+aP9aoLHS6f6nju+hCE/dUx4H9KM+Hkn4rz8RYGSsfGrvQcPln4D4lJA==@lists.linux.dev
X-Gm-Message-State: APuU4Z95rAKEZuPMAfIFd4wV+miNMs0kyLcryPvLuEd3Tc0pm/i9LJFz
	bLx16MsEMp50PGJxNA7ne6yWLWifQPWPTONi6Py9E3UfU+/vSCXexvgfKmbfoatcvaGhISusQPW
	/aI777xrz1CtyCZO0uZc0OtmYBhscsKk=
X-Gm-Gg: AYBFou0x52JijbN0TwMgRxDMAmMBgx3zneTiQsaTXw4wpho/Kvt7922I/exRhUZ+JNt
	JtLcGEEDR5lICrGmWSfpeWDvVFHD5ksR0jJXebwJVmumHqx2lblgNBNLtc2HEMTS2qbElg+JFw5
	Nvy/1fw06obPaETFsdAN0oJXUMW1jaxxyuZo+u7yW/hhbAjXZZoQGG37Pcocz8C3ZW0P2I0PcNk
	MJhutb+tfqZNQlugo9W7Hz7vi8xRAHlZEbl6mwFky/0hmjut9xmBOLnWplu+jn3vy58f+lcrljF
	7FSqyJE6WWJz2YrqBMagBUgVAuh8ZJ0DTCKN08/n5nYteIPEeThSK4IA6yrQUkBONy9KvSKogyv
	fBUJ3DQgyoj0Sst8QY3Dg3dNZHm5QmucfNw+U3LDp0CBDcnHfmoF/fy0t1V0zPB+bbnRU+4eO7i
	Y17bojsEuiVU3N
X-Received: by 2002:a05:6102:160c:b0:7cc:118e:7bfe with SMTP id
 ada2fe7eead31-7d2a15b09a8mr1034594137.19.1793959397444; Fri, 06 Nov 2026
 02:03:17 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
 <79bc006d-1c60-419b-a6f1-c4c4ce329168@leemhuis.info>
In-Reply-To: <79bc006d-1c60-419b-a6f1-c4c4ce329168@leemhuis.info>
From: Krzysztof Wasiucionek <kwasiek@gmail.com>
Date: Fri, 6 Nov 2026 11:03:04 +0100
X-Gm-Features: AclHuK9N5f5DzNykhnDvMUju9NTrbwfTrY_AKgKY7637i8vSoWcML1HoZeYqmYw
Message-ID: <CAMODhBLCdFXpkC1RCJdu5HBbW8TOFy4W7E1P0o5x8kwpPq_YMA@mail.gmail.com>
Subject: Re: [REGRESSION] rt721-sdca: PCM open fails with -ENODATA on 7.3 (AMD
 ACP SoundWire, ASUS ProArt PX13)
To: regressions@leemhuis.info, oder_chiou@realtek.com, 
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/5/26 16:52, Thorsten Leemhuis wrote:
> Not my area of expertise, but is this maybe the same problem that is
> discussed here:
> https://www.google.com/url?q=3Dhttps://lore.kernel.org/all/8a12a2d9-1b56-=
4e00-8ccc-cf31325f8366@crazyrussian.pro/&source=3Dgmail&ust=3D1794045716621=
000&sa=3DE
> [...]
> A fix for that is here:
> https://www.google.com/url?q=3Dhttps://lore.kernel.org/all/20261027-rt721=
fix-v1-1-42cd4b1711d2@realtek.com/&source=3Dgmail&ust=3D1794045716621000&sa=
=3DE

Thanks Thorsten, yes, that is the same problem.

The patch does not apply as-is to v7.3.1 (context differs in
rt721-sdca-sdw.c/.h), so I applied the same six line removals by hand
on top of v7.3.1 (PDE23 REQ_POWER_STATE default, MBQ defaults
0x2000046/0x6100006, 0x2000046 in the MBQ readable/volatile lists) and
built rt721-sdca as an out-of-tree module for a 7.3.1 kernel.

Result on the ASUS ProArt PX13 HN7306EAC:
- no more "ASoC error (-61) at snd_soc_pcm_component_pm_runtime_get()"
from rt721 after boot (count 0, previously on every PCM open)
- PipeWire/UCM HiFi profile is available and active again
- internal speakers work in normal desktop use

Tested-by: Krzysztof Wasiucionek <kwasiek@gmail.com>

It would be great to have this in 7.3.y stable as well, since the
Fixes: commit is in 7.3.

Thanks,
Krzysztof


czw., 5 lis 2026 o 16:52 Thorsten Leemhuis <regressions@leemhuis.info>
napisa=C5=82(a):
>
> On 11/5/26 16:17, Krzysztof Wasiucionek wrote:
> >
> > after updating from 7.2 to the 7.3 series, the rt721-sdca jack codec on
> > my laptop can no longer be opened at all. Speakers (TAS2783 on the same
> > link) keep working at the ALSA level, but userspace loses the UCM HiFi
> > profile because of the rt721 failure.
>
> Not my area of expertise, but is this maybe the same problem that is
> discussed here:
> https://lore.kernel.org/all/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrus=
sian.pro/
> See also the other two msgs linked near the bottom.
>
> A fix for that is here:
> https://lore.kernel.org/all/20261027-rt721fix-v1-1-42cd4b1711d2@realtek.c=
om/
>
> Ciao, Thorsten
> > Hardware
> > --------
> > Machine : ASUS ProArt PX13 HN7306EAC (Ryzen AI Max, "Strix Halo")
> > Card : 1 [amdsoundwire]: amd-soundwire
> > ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
> > Link 1 : rt721-sdca (sdw:0:1:025d:0721:01)
> > 2x TAS2783 (sdw:0:1:0102:0000:01:8 / :01:b)
> >
> > Kernels (CachyOS builds)
> > ------------------------
> > Good: 7.2.7 - UCM HiFi profile available, jack and speakers work,
> > no rt721 errors
> > Bad : 7.3.1 - see below (7.3.0 was installed in between, not tested
> > separately)
> >
> > Symptoms on 7.3.1
> > -----------------
> > From boot, every open of the rt721 PCMs (hw:1,0 SimpleJack playback,
> > hw:1,1 SimpleJack capture) fails:
> >
> > rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
> > snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
> > SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open()
> > on SDW1-PIN0-PLAYBACK-SimpleJack
> >
> > $ speaker-test -D hw:1,0 -c 2 -r 48000 -F S16_LE -t wav -l 1
> > Playback open error: -61,No data available
> >
> > The peripheral is enumerated and attached:
> >
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/status Attached
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/device_number 3
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status su=
spended
> >
> > Writing "on" to power/control does not help; open still returns -61.
> >
> > TAS2783 playback on hw:1,2 works on 7.3.1 (speaker-test plays both
> > channels).
> >
> > Userspace impact: PipeWire 1.6.10 / ACP rejects the whole UCM HiFi verb
> > ("Profile 'HiFi' mapping 'HiFi: Headphones: sink': output PCM open
> > failed"), leaving only the pro-audio profile, so the internal speakers
> > are not usable in a normal desktop setup. Same userspace on 7.2.7
> > gives a working HiFi profile.
> >
> > I can test patches or provide full dmesg / additional debug output.
> >
> > #regzbot introduced: v7.2..v7.3
> >
> > Thanks,
> > Krzysztof Wasiucionek
>
