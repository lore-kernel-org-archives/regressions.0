Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDD193
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 00:27:55 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68cbbff84f6so252244b3a.1
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695169675; x=1695774475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ie6MnrazpOqbhMSxGflNURXIp/yTb1DKqFEC2gAgPT8=;
        b=C++AoSirbbB1ytl9v2va9jYz1ZnJmHxBM8q5Nb3iuMvZntgLgAsZ8+CUPd1SuOub36
         Jm6tkv+oTLlXevFuxc/ZNZ2uq22BOd4Wn6HMO9islkFEsE+2twstqSSVjUBiEEo0YTBp
         +xseH3Bp9T/jEw2LMZY8ZDmHkYiMy0NDHx7cVbjwNWaDUpgE6urxGAS/eno06dyAfKrG
         +I2Ca+sJtDaLKT+uAzFRuDyBIOm0MVgbEsqSX8v5zS/GqFa+9h0pclxtRhowKfVcTA6Y
         a6dEqTBO33Fw5kZDxza/FxpfZJetuevSMp9UCZ8592dTiZb74hqAatSjVX72bEHwaNOg
         jZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695169675; x=1695774475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie6MnrazpOqbhMSxGflNURXIp/yTb1DKqFEC2gAgPT8=;
        b=TVWld9SBZRzwH7OIwHT7KSjeK15Fob5/fmQkU2JeJ14pllUva1fgCKZEc+M03hAv34
         eL6P2ImVyNbu8D7OMShJOAI7RFg6b1xvJWpLIFzAK1txTNw6EFkNpfS+3dCxALaRH76p
         4x3nrDw5b111mNYXeI27/OefqPGvw3hUQjibGdrGur5md89Db/t+bca3bO4G/B0t9B+4
         soCo/ee4Ps472sg0cswfXAhPjT+DVG0IC2QlQRgQD6jnHFM7Lsg26buuOxlb4BG7W9fc
         YkqmMzvx774DNMx83gVSf15nuJ0pywDjnJFaSVhnoloZFWsIK+LPPK0X0MZ0/4mqd/+B
         pCCQ==
X-Gm-Message-State: AOJu0Ywq0SOMPX7ObMEwDeg5SIB9/Z1XlJMFR4HdaaATnCZkGx8k57Mh
	6IU0zqqEKL7qKxauhtOfGig=
X-Google-Smtp-Source: AGHT+IGXQumE8qMw/TNJK+DkAeyL1eBRlMTD7Mf3ENW8EYDPgWPyex0v4k0QJJjNO+5uCABXRFjjpg==
X-Received: by 2002:a17:90b:3586:b0:274:8951:b5ed with SMTP id mm6-20020a17090b358600b002748951b5edmr1424479pjb.20.1695169674889;
        Tue, 19 Sep 2023 17:27:54 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a199000b0027476c68cc3sm183810pji.22.2023.09.19.17.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 17:27:54 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DC0AE81A82C8; Wed, 20 Sep 2023 07:27:51 +0700 (WIB)
Date: Wed, 20 Sep 2023 07:27:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: what to do on no reproducer case? (was Re: Fwd: Uhhuh. NMI received
 for unknown reason 3d/2d/ on CPU xx)
Message-ID: <ZQo8hzP-eRjXvtXf@debian.me>
References: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FOGVCOx0mLvph/q5"
Content-Disposition: inline
In-Reply-To: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>


--FOGVCOx0mLvph/q5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[addressing to Thorsten]

On Sat, Sep 02, 2023 at 07:20:55AM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > seems to be a regression since 6.5 release:
> > the infamous error message from the kernel on this 32c/64t threadripper:
> >> [ 2046.269103] perf: interrupt took too long (3141 > 3138), lowering
> >> kernel.perf_event_max_sample_rate to 63600
> >> [ 2405.049567] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2405.049571] Dazed and confused, but trying to continue
> >> [ 2406.902609] Uhhuh. NMI received for unknown reason 2d on CPU 33.
> >> [ 2406.902612] Dazed and confused, but trying to continue
> >> [ 2423.978918] Uhhuh. NMI received for unknown reason 2d on CPU 33.
> >> [ 2423.978921] Dazed and confused, but trying to continue
> >> [ 2429.995160] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2429.995163] Dazed and confused, but trying to continue
> >> [ 2431.233575] Uhhuh. NMI received for unknown reason 3d on CPU 36.
> >> [ 2431.233578] Dazed and confused, but trying to continue
> >> [ 2442.382252] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2442.382255] Dazed and confused, but trying to continue
> >> [ 2442.725076] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2442.725078] Dazed and confused, but trying to continue
> >> [ 2442.732025] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2442.732027] Dazed and confused, but trying to continue
> >> [ 2443.666671] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2443.666673] Dazed and confused, but trying to continue
> >> [ 2443.756776] Uhhuh. NMI received for unknown reason 3d on CPU 39.
> >> [ 2443.756779] Dazed and confused, but trying to continue
> >> [ 2443.907309] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2443.907311] Dazed and confused, but trying to continue
> >> [ 2444.004281] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2444.004283] Dazed and confused, but trying to continue
> >> [ 2444.207944] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2444.207945] Dazed and confused, but trying to continue
> >> [ 2444.517408] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2444.517410] Dazed and confused, but trying to continue
> >> [ 2444.946941] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2444.946943] Dazed and confused, but trying to continue
> >> [ 2445.573807] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2445.573809] Dazed and confused, but trying to continue
> >> [ 2445.776108] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2445.776110] Dazed and confused, but trying to continue
> >> [ 2445.969029] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2445.969031] Dazed and confused, but trying to continue
> >> [ 2446.977458] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2446.977460] Dazed and confused, but trying to continue
> >> [ 2447.044329] Uhhuh. NMI received for unknown reason 2d on CPU 46.
> >> [ 2447.044331] Dazed and confused, but trying to continue
> >> [ 2447.469269] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2447.469271] Dazed and confused, but trying to continue
> >> [ 2447.866530] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2447.866531] Dazed and confused, but trying to continue
> >> [ 2448.456615] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2448.456617] Dazed and confused, but trying to continue
> >> [ 2448.509614] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2448.509616] Dazed and confused, but trying to continue
> >> [ 2448.758005] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2448.758007] Dazed and confused, but trying to continue
> >> [ 2449.093565] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2449.093567] Dazed and confused, but trying to continue
> >> [ 2449.227344] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2449.227346] Dazed and confused, but trying to continue
> >> [ 2449.770534] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2449.770535] Dazed and confused, but trying to continue
> >> [ 2449.955594] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2449.955596] Dazed and confused, but trying to continue
> >> [ 2450.077872] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2450.077874] Dazed and confused, but trying to continue
> >> [ 2450.190844] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2450.190846] Dazed and confused, but trying to continue
> >> [ 2450.561450] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2450.561452] Dazed and confused, but trying to continue
> >> [ 2450.604498] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2450.604500] Dazed and confused, but trying to continue
> >> [ 2450.814451] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2450.814453] Dazed and confused, but trying to continue
> >> [ 2450.923171] Uhhuh. NMI received for unknown reason 2d on CPU 49.
> >> [ 2450.923173] Dazed and confused, but trying to continue
> >> [ 2451.084612] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2451.084614] Dazed and confused, but trying to continue
> >> [ 2451.793342] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2451.793343] Dazed and confused, but trying to continue
> >> [ 2451.793662] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2451.793664] Dazed and confused, but trying to continue
> >> [ 2451.926819] Uhhuh. NMI received for unknown reason 3d on CPU 48.
> >> [ 2451.926821] Dazed and confused, but trying to continue
> >> [ 2452.502583] Uhhuh. NMI received for unknown reason 3d on CPU 49.
> >> [ 2452.502585] Dazed and confused, but trying to continue
> >> [ 2452.675633] Uhhuh. NMI received for unknown reason 2d on CPU 61.
> >> [ 2452.675636] Dazed and confused, but trying to continue
> >> [ 2452.974655] Uhhuh. NMI received for unknown reason 2d on CPU 48.
> >> [ 2452.974657] Dazed and confused, but trying to continue
> >> [ 7065.904855] elogind-daemon[2461]: New session c2 of user janpieter.
> >=20
> > according to dmesg, this happens without any special reason (I didn't e=
ven notice)
> > some googling points at a ACPI C state problem on AMD CPUs a few years =
ago
> > in 5.14 kernels, I didn't see it.
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding this regression to be tracked by regzbot:
>=20
> #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217857
>=20

Hi Thorsten,

This regression looks stalled: on Bugzilla, the reporter keeps asking to me,
for which I'm not the expert of involved subsystem. And apparently, he still
had not any reproducer yet (is it triggered by random chance?). Should I
mark this as inconclusive?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--FOGVCOx0mLvph/q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQo8hwAKCRD2uYlJVVFO
o3RoAP4/n3inTFfPKTOhDU+kLCGJd6L8TIujALrvfOAk+36N4AD+Ltm+naWfyGan
wyxsHva3zUQseoBRh4K3brADBIEcsAg=
=/F1/
-----END PGP SIGNATURE-----

--FOGVCOx0mLvph/q5--
