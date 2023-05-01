Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1F18F
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 04:36:54 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso1448398b3a.2
        for <regressions@lists.linux.dev>; Sun, 30 Apr 2023 21:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682915813; x=1685507813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FJ838k1C5SRQ1QpV0bbphF5iaPyZZZtQhPRQozOF0E=;
        b=F4EB75vdxlyBg6SiDCxwOFFk0jHoIqsKC2teM5GNnn++1DACxQXC7cXmCsLFgfZhTj
         KYPjg3DTWK86sw/T257HeoOj38YOWktSytjNIWrJdw6eIl6JWB2wFv24oXQ8gDRPUaB9
         JQfVdC169ZqjJmEq+UkDOjM1i4p+atA1L+loY9E+uGXjebBp9o0AbaYDWCd21K7rhV0m
         dxF83Gi+GeKA7Lo9nS6Qp8XWGQdxkbLXG0X0BnhWv6h0S1GhHiC+uzSzMiQpiC0jhqAQ
         hnjEbvPeiEq2QJNsrh20TB/7DgLChQhj8iv8jtrPciemzQJTABbXU5hKjHrlUbfG7fvK
         M5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682915813; x=1685507813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FJ838k1C5SRQ1QpV0bbphF5iaPyZZZtQhPRQozOF0E=;
        b=QH7iqulXV843iSVIcy5qWIFKbIKYHpR1hbsvw27QysMEMnnWQipfFIJOH4wYitv5zx
         oPmD393Wk4HulxrsXNXfG8R9AQbK7aUYQLWBaPwcYgtkKY2ndYyqcWT4H+7vsQ33sY5J
         Li1SamwzeJbkkpmpXqWBT8k7X/Pky8PFDnumfE+rG0JWeuJkQHrbeGZkJoxyaicSX48L
         ErOBgN3VV2cru7KO5qcWdN13nWQ9ouGvgyET/XnQv1lJEXFxBf6rGmC6qcAl0Ylh5STk
         rGLA9MovmP98EKZRF9lyQdisqTgwjxTg6MSvqYC+lHwfjliC00Q8g20qxHuJ2ih5JtyH
         qOBg==
X-Gm-Message-State: AC+VfDyTcmGWykDxYBskLLh08msPQSB0s13Mn7LpSfp1ZzcefXZBWJtm
	0djtl8VZZWgn5g9k+80NJyk=
X-Google-Smtp-Source: ACHHUZ49A3xDD6h5SJXvoZmv6tt7PFayV/qkvPMH1okiMRZdcD5LOro7oWQinZDqAooNTW9iUU4ZzA==
X-Received: by 2002:a05:6a20:6a1e:b0:d7:3b62:3cf with SMTP id p30-20020a056a206a1e00b000d73b6203cfmr15224013pzk.54.1682915813043;
        Sun, 30 Apr 2023 21:36:53 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-46.three.co.id. [116.206.28.46])
        by smtp.gmail.com with ESMTPSA id k128-20020a632486000000b00502ecc282e2sm16723810pgk.5.2023.04.30.21.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 21:36:52 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 7E4CF10695F; Mon,  1 May 2023 11:36:49 +0700 (WIB)
Date: Mon, 1 May 2023 11:36:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Chua <jeff.chua.linux@gmail.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: linux-6.4 alsa sound broken
Message-ID: <ZE9B4avbDtIXOu4O@debian.me>
References: <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LJ2qQOdS72n8ceav"
Content-Disposition: inline
In-Reply-To: <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>


--LJ2qQOdS72n8ceav
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> Latest git pull from Linus's tree ... playing a simple sound file will
> resulted in a lot of echo.
>=20
> Running on Lenovo X1 with ..
> 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> Definition Audio Controller (rev 01)
>=20
> I've bisected and reverted the following patch fixed the problem.
>=20
> commit 9f656705c5faa18afb26d922cfc64f9fd103c38d

Thanks for the regression report. However, where is your dmesg and/or ALSA =
log
when the regression occurs? What is the playback test file?

FYI, 9f656705c5faa1 ("ALSA: pcm: rewrite snd_pcm_playback_silence()") is
originated as [1/2] of patch series that pokes around the auto-silencer. The
other patch ([2/2]) got NAKed since autofilling buffer should have been don=
e in
alsa-lib (still to be discussed) [1].

Anyway, I'm adding this to regzbot:

#regzbot ^introduced 9f656705c5faa1
#regzbot title Much echoing when playing sound files on Intel Alder Lake PC=
H-P Audio Controller

Thanks.

[1]: https://lore.kernel.org/all/bb342e84-b468-8adc-6688-88da2c857da1@perex=
=2Ecz/

--=20
An old man doll... just what I always wanted! - Clara

--LJ2qQOdS72n8ceav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZE9B3QAKCRD2uYlJVVFO
oybmAP9qZl6m3BGfCju4IYA/iNDLxZpCPY+PPR5V6jt2I12r0gEAiduhNNevDzK/
ts24tNhoskNd+rPICIYUV6L02qtfBwI=
=IYeY
-----END PGP SIGNATURE-----

--LJ2qQOdS72n8ceav--
