Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D377E3E494
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIf6KhyD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cf74ad87e0so1074845ad.3
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700572159; x=1701176959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRonvrrZshq+dDW21ZOXNCiG05dY/dcLFuvkusN6s5c=;
        b=UIf6KhyD6dAspbH33mULbIgPwjLL/tLz2cmrV7NSeFWppIogq8mhXiBpLPMMsBjh58
         GnCUurAQz32SGhW1D3qQ/S5SkC8Zs0mRcE/fRXbJNeJtPyoOEbDuiQ8AWbv48Bd5mhuz
         WWo2SvXrs+pcdRUBiy1ArwNCswkO6A/jtDCMm1ov+WSgR+69BUFxRaH8FfVvpN995rfO
         E8x75rT3vFLpqRQdXpGMCuV28q1PTOQ/GGjOajgM0dzq9m9a+2hQPwpUOATos/wduZ89
         vyKo/TKSDvDCim63DxHYZ1hNzb4v3KRihRy4+eJydSD8Ra5i0QKOX5N0MXIlKFqWY1Ua
         vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572159; x=1701176959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRonvrrZshq+dDW21ZOXNCiG05dY/dcLFuvkusN6s5c=;
        b=DiQtl+3x4IrXgzgVXHwc5n85j/hrkIFan1DgPdeh3OUy5taNem6pWf7DRgLuiRsbuG
         xrh8NWyO/M3KMbZrdC86nm4ZhqGqjwKb8x1imoEovvFLvylfejVR0tE2T/taOqESzXld
         uTeHmR0aefrEcqkf1KdZVeUIiiJQyBHwzzx83PbKeo/6m32QWp5p5vKxK+i1fHEJMw6h
         U/suoN4Au+f9UEv2mPgVqKhrnYUI/4/6IrM4mXp0Pvu0Vhj+M9fch6ZxV2ksppYiup/X
         zTDz1uTLOrDZ+hS6+ut5e0I776BJbhig4ywSGhnOM4951DuWJXypT6/EpiJgo8LoHfUn
         gVpg==
X-Gm-Message-State: AOJu0YxuaYqeQGog7GJCJ0y0sSOma7Rzg3uWxNkI1Jp3O+cMlhdemITE
	YC66h4opAPXS5smPt2QJz6g=
X-Google-Smtp-Source: AGHT+IEujS85pCBDH1UZ5g499eRM4PJrMP5yuw+mXaV6wQyBAnHSimi8om6o0CRvw7ZiZOoSPQIJYw==
X-Received: by 2002:a17:902:dace:b0:1cc:50ea:d5db with SMTP id q14-20020a170902dace00b001cc50ead5dbmr13859038plx.4.1700572158777;
        Tue, 21 Nov 2023 05:09:18 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b001c625acfed0sm7847696plh.44.2023.11.21.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:09:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CCE6310DA7619; Tue, 21 Nov 2023 20:09:14 +0700 (WIB)
Date: Tue, 21 Nov 2023 20:09:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jkosina@suse.cz>,
	LinuxCat <masch77.linuxcat@gmail.com>,
	Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <ZVyr-of1X4RudpWG@archie.me>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PkRtFTNZI60zkr4T"
Content-Disposition: inline
In-Reply-To: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>


--PkRtFTNZI60zkr4T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thorsten and all,

On Thu, Nov 02, 2023 at 09:11:42PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > Hello,
> > After upgrading from 6.5.9 to 6.6.0, my keyboard started acting really =
weird in its wireless mode, key actions sent are completely wrong, see vide=
o attached.=20
> >=20
> > Most keys are perceived as either E, 3 or F7, with F8 and <, as well.=
=20
> >=20
> > Modifier keys (CTRL, ALT, ALT GR, Shift and Super) are working normally=
, as well as media control keys (pause/play, previous, next, mute and sound=
 up/down).
> >=20
> > The keyboard works as expected if it's wired.
>=20
> Another reporter bisected the regression:
>=20
> > Bisected to=20
> >=20
> > 9d1bd9346241cd6963b58da7ffb7ed303285f684 is the first bad commit
> > commit 9d1bd9346241cd6963b58da7ffb7ed303285f684
> > Author: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > Date: Sun Jul 16 18:23:44 2023 +0000
> >=20
> > HID: logitech-dj: Add support for a new lightspeed receiver iteration
> >=20
> > The lightspeed receiver for the Pro X Superlight uses 13 byte mouse rep=
orts
> > without a report id. The workaround for such cases has been adjusted to
> > handle these larger packets.
> >=20
> > The device now reports the status of its battery in wireless mode and
> > libratbag now recognizes the device and it can be configured with Piper.
> >=20
> > https://github.com/libratbag/libratbag/pull/1122
> >=20
> > Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
> > Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> > Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > Reviewed-by: Bastien Nocera <hadess@hadess.net>
> > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> >=20
> > drivers/hid/hid-ids.h | 1 +
> > drivers/hid/hid-logitech-dj.c | 11 ++++++++---
> > 2 files changed, 9 insertions(+), 3 deletions(-)
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding this regression to regzbot:
>=20
> #regzbot introduced: 9d1bd9346241cd https://bugzilla.kernel.org/show_bug.=
cgi?id=3D218094
> #regzbot title: Logitech G915 Wireless Keyboard key event only detects fe=
w key codes
> #regzbot link: https://streamable.com/ac6l8u
>=20

There's no reply from culprit author nor linux-input people (did they miss
this regression?). And on Bugzilla, other reporters replied that reverting
the culprit fixed the regression.

FYI, there's similar Bugzilla report on [1].

Also Cc'ed Linus.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172

--=20
An old man doll... just what I always wanted! - Clara

--PkRtFTNZI60zkr4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVyr9wAKCRD2uYlJVVFO
oxGlAQCojjy1tLoM65BFLE3n8cQxebxqvL3Bg/FqfAHAUlLWNgD9EcDhn5h7Akxe
fX+GsQutxubddAt3tS4xMsnhdWWi3Q0=
=ySw3
-----END PGP SIGNATURE-----

--PkRtFTNZI60zkr4T--
