Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F9B3611E
	for <regressions@lists.linux.dev>; Sat,  6 Apr 2024 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712408940; cv=none; b=Us5tQuG7bbWHN8qDpeCdEwvxi2P3ss3RQwhGWOiBRdLUzvxm35rhn4L8HwZbZI6IqNO9WpFkOmsOSSakNb1yOh01/hlLLTWQhTn5ZWmMmODd4TUpCwHWK3fOLYAnRbKmRyGsXRfjE68MJosd75++Hedzpy/2RSxfDoQbtW93UTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712408940; c=relaxed/simple;
	bh=kaUDzIEbecBFBGUdbUAl78HhXM3LqI9CU5IHcy4ZaXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgAlr7wZzaZVl7qEKiOvAG04ltfW5xzbNRwWC/HU5sUTi8Sj+VmoHNR+p8d93SUTAyK9Q0RJan56YEesbR0Ppl6I6fEKtTu6wyV9s6XkRxSZqcWJ3R2/0TLcM38/neFf786VWUNLrPg+9OMzuGCf1QLIwVxTK802MgqqmbJn6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDu8nB4y; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDu8nB4y"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed150119f6so307143b3a.1
        for <regressions@lists.linux.dev>; Sat, 06 Apr 2024 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712408938; x=1713013738; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJ8WfPeJwP/hN9b5IyWNxIFJSiglqUGmf6rb1vuLbUI=;
        b=gDu8nB4yAtVBtBmIBYS7B6YEsB9Gcq4nuVfuXmRDfRX6IaCy6Ww9vW0wrQpWjjB9pF
         zTHv04jCEz9QCXQWUbqyWH1HCW8G2Ga1dzXOBTfSYxW1KtL7GBl2XusibBDsThNyTvbE
         SlXQ7DwfmxCSgONUZ8DXs9JW7jmsHSrYwsR4rer8OXXazGcCXhIOZpKVapXG7k0gckXp
         u/gcN3i/4rh5x4D2B5d26T+W44rMmLTrKZXY3KEut24uKTo1aUFf69ISLkhcbXXUS93z
         fAdCMknaN/+eXMnrurobVKVx66tlfI9bfPrsHvU9GA3ZUzXEEk+GUZjVjWdNrARqpy/M
         ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712408938; x=1713013738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJ8WfPeJwP/hN9b5IyWNxIFJSiglqUGmf6rb1vuLbUI=;
        b=s9yXB1GSxEN1kQcwKIC6H7FWzFlJT5RoOg4uuW64nDUbCFa5o+O1DPX/goBJ3jRCs6
         VwmXpPNNNEKRed/WcwSJwIJ59OZn2fv3p6UzaThZhaG8YyGJJxdM1KQbZ2+mhJUCEi4l
         vsnyvbjtfDvPC5lU6GoL134ofCZhC8ZHWfo7BMnQVT6d7DKOLNekzYm2ToZsE7bRtsjE
         Hj3uquopGklr4YdrbwaC2SlX5s4skobtNDxz4MfSBbTTGbbMV9m9LG8xuMXiTaZJRynO
         xI0KMvb9tHgMTV3zjTMXC7my4NkYXBCjYt+1eWq/YQ1j+ceXRkU+Cz5UPa8s3KFy5OLm
         o3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1NK3kWL7k1cHekHpraAYLei8F+NsToRmAzX8C6QBZnH8uAmcLs+h9N9Ry37tfggq5Wh8f66WDwsbbTBMNph0Qy6Qk76OXsjSy/sM=
X-Gm-Message-State: AOJu0YxGB7dEOXxfVU6GNcDvfdhJLHlwtLGuFlIAeAoLkOJC+eHL7ZAP
	ogpdXEJXZKqkQ6+1R+u8ZtHHfAhNM2TGkof++9s/+PzHGQ7P1dL2
X-Google-Smtp-Source: AGHT+IGxP6jF9vpvANF2puNlutOZ79gt8X8maKtByPAIHJKls4TeQp6HCDbqkQRi4fwIgO8YzsRC/w==
X-Received: by 2002:a17:903:2b05:b0:1e3:cd8c:d370 with SMTP id mc5-20020a1709032b0500b001e3cd8cd370mr3977830plb.44.1712408938102;
        Sat, 06 Apr 2024 06:08:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090301c500b001e3c972c811sm2688004plh.131.2024.04.06.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 06:08:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 266E0186046F9; Sat,  6 Apr 2024 20:08:54 +0700 (WIB)
Date: Sat, 6 Apr 2024 20:08:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Arun Gopal Kondaveeti <arungopal.kondaveeti@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Daniel <dmanlfc@gmail.com>
Subject: Fwd: Steam Deck OLED 6.8.2 nau8821-max fails
Message-ID: <ZhFJZoful6nEFskW@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YSxOllt9oMHUTSam"
Content-Disposition: inline


--YSxOllt9oMHUTSam
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Bugzilla, Daniel <dmanlfc@gmail.com> reported topology regression
on Steam Deck OLED [1]. He wrote:

> I'm adding this here, I hope it's the correct place.
>=20
> Currently the Steam Deck OLED fails with Kernel 6.8.2 when trying to init=
ialise the topology for the device.
> I'm using the `sof-vangogh-nau8821-max.tplg` file from the Steam Deck OLE=
D and associated firmware.
>=20
> When I manually patched support for the 6.6 or 6.7 mainline kernel it wor=
ked fine.
> Now the official implementation fails as per below.
>=20
> Do we need an updated topology file?
>=20
> dmesg info...
>=20
> [   12.844720] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
> [   12.846177] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio cl=
ient
> [   12.853045] max98388 i2c-ADS8388:00: MAX98388 revisionID: 0x41
> [   12.854798] max98388 i2c-ADS8388:01: MAX98388 revisionID: 0x41
> [   13.049834] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci000=
0:00/0000:00:08.1/0000:04:00.1/sound/card0/input10
> [   13.095674] input: FTS3528:00 2808:1015 as /devices/platform/AMDI0010:=
01/i2c-1/i2c-FTS3528:00/0018:2808:1015.0003/input/input16
> [   13.114799] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci000=
0:00/0000:00:08.1/0000:04:00.1/sound/card0/input11
> [   13.115023] input: Valve Software Steam Controller as /devices/pci0000=
:00/0000:00:08.1/0000:04:00.4/usb1/1-3/1-3:1.0/0003:28DE:1205.0001/input/in=
put19
> [   13.120952] snd_sof_amd_vangogh 0000:04:00.5: enabling device (0000 ->=
 0002)
> [   13.167809] snd_sof_amd_vangogh 0000:04:00.5: Firmware paths/files for=
 ipc type 0:
> [   13.169329] snd_sof_amd_vangogh 0000:04:00.5:  Topology file:     amd/=
sof-tplg/sof-vangogh-nau8821-max.tplg
> [   13.171103] input: FTS3528:00 2808:1015 UNKNOWN as /devices/platform/A=
MDI0010:01/i2c-1/i2c-FTS3528:00/0018:2808:1015.0003/input/input18
> [   13.171619] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci000=
0:00/0000:00:08.1/0000:04:00.1/sound/card0/input12
> [   13.172518] hid-steam 0003:28DE:1205.0001: input,hidraw2: USB HID v1.1=
0 Mouse [Valve Software Steam Controller] on usb-0000:04:00.4-3/input0
> [   13.172556] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci000=
0:00/0000:00:08.1/0000:04:00.1/sound/card0/input13
> [   13.173623] hid-steam 0003:28DE:1205.0004: hiddev0: USB HID v1.10 Devi=
ce [Valve Software Steam Controller] on usb-0000:04:00.4-3/input2
> [   13.215330] snd_sof_amd_vangogh 0000:04:00.5: Firmware info: version 0=
:0:0-7863d
> [   13.217053] snd_sof_amd_vangogh 0000:04:00.5: Firmware: ABI 3:26:0 Ker=
nel ABI 3:23:0
> [   13.234447] hid-steam 0003:28DE:1205.0004: Steam Controller 'FYZZ34102=
C64' connected
> [   13.242606] input: Steam Deck as /devices/pci0000:00/0000:00:08.1/0000=
:04:00.4/usb1/1-3/1-3:1.2/0003:28DE:1205.0004/input/input20
> [   13.289530] snd_sof_amd_vangogh 0000:04:00.5: Topology: ABI 3:26:0 Ker=
nel ABI 3:23:0
> [   13.291262] hid-multitouch 0018:2808:1015.0003: input,hidraw1: I2C HID=
 v1.00 Device [FTS3528:00 2808:1015] on i2c-FTS3528:00
> [   13.291402] sof_mach nau8821-max: ASoC: physical link acp-bt-codec (id=
 2) not exist
> [   13.291500] input: Valve Software Steam Controller as /devices/pci0000=
:00/0000:00:08.1/0000:04:00.4/usb1/1-3/1-3:1.1/0003:28DE:1205.0002/input/in=
put21
> [   13.296647] sof_mach nau8821-max: ASoC: topology: could not load heade=
r: -22
> [   13.298510] snd_sof_amd_vangogh 0000:04:00.5: error: tplg component lo=
ad failed -22
> [   13.300270] snd_sof_amd_vangogh 0000:04:00.5: error: failed to load DS=
P topology -22
> [   13.302008] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at snd_soc_c=
omponent_probe on 0000:04:00.5: -22
> [   13.303785] sof_mach nau8821-max: ASoC: failed to instantiate card -22
> [   13.305586] sof_mach nau8821-max: error -EINVAL: Failed to register ca=
rd(sof-nau8821-max)

See Bugzilla for the full thread.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218677

--=20
An old man doll... just what I always wanted! - Clara

--YSxOllt9oMHUTSam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZhFJYQAKCRD2uYlJVVFO
ozOYAQCjC7dhB6602A9unTbLpzRAaaU92jOL0oZmwdjl1KJciQEArrbM5YcBR87U
Y525Kboh1Hms20eiwZ28oKuh/ESpEAM=
=Kj2s
-----END PGP SIGNATURE-----

--YSxOllt9oMHUTSam--
