Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9837D
	for <regressions@lists.linux.dev>; Sat, 27 May 2023 00:52:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b021cddb74so3676135ad.0
        for <regressions@lists.linux.dev>; Fri, 26 May 2023 17:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685148734; x=1687740734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqkO7yVvjMS1BWs3C1WLar5VeHqBA/1UnI9oAGTzQQE=;
        b=P8vq8sLu2bFKc8UsxYkitq/sgjgMcnPUSMuz1Mw9mjiqjoWUQoDlxyT4J6caGcrV6M
         7qQl/aQ581yNRgvJLmzQuPAu2oVyCRKthMFaKTzus1pKYzPmpd9+RP5My58hkbLqQ0R5
         p098Xr8EWV7vf3hTRfB5EMBeSCIw5GCQlMbqldGmpQrzs6LPgh8V47AVV2ypswy7/FBI
         jIHWFYzKW7s2H9gYnWLP9pCQLYT1InsyzO/4FKyX5D+XrmQpVfCk5/CkSHrCiPRM+F2W
         c+Pf8KMW4EkYTpk/A6NcN727pVsxmBec47k5lkwD9VG3NN6++sOKpD3csp+6icQWWXAJ
         0+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685148734; x=1687740734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqkO7yVvjMS1BWs3C1WLar5VeHqBA/1UnI9oAGTzQQE=;
        b=VcY2H5ilH45PjLRVuo7ZhDCj6dpHEP7Qi1ZNIJ7fxq5WQU6N+CYwfhapbJYpRKGA9c
         H7x0jEyOulrKrD+Fo7XmvNHgEBncEsWR68eCvyeAD4dW8WbpDiPx0f3mp7m5IK1yIlXZ
         DT6MteRD7ng9HvfudUuK5M18nkUGMwyN8Pf1TsKZH3xkd+eDBh4MQUP+qNLF4MzlXTtg
         AohmwdpoBOewTy+cvbXjRRf+c1d9Xfvz8XJ7YF5XIh38uz5GVMGJLWqixqrdw/qKk/2u
         NluQr1HJ+9ANJLgYEhE+GDHJW7jH5qbMY2wniZXqZg4Sqmni2By3JYHHfIiGmPaHPjMz
         zTQw==
X-Gm-Message-State: AC+VfDylm6JwGnzoDMQyjE+Fe5euWibl74G2KAYv08VMIxctr7ChIY5W
	QNpxEJaM6CIgdGnOrl879m4=
X-Google-Smtp-Source: ACHHUZ5nIRKsjq94KzBGwXFtbG10R4QvnX3zyhZWD1lfGQ7g9mrRE71OzOCh1NpeM28NCd2Eq873Ug==
X-Received: by 2002:a17:902:ecc9:b0:1ac:7245:ba5a with SMTP id a9-20020a170902ecc900b001ac7245ba5amr3985873plh.61.1685148733816;
        Fri, 26 May 2023 17:52:13 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-7.three.co.id. [180.214.232.7])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001ac2c3e436asm3784686plg.186.2023.05.26.17.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 17:52:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id BA8691069DF; Sat, 27 May 2023 07:52:07 +0700 (WIB)
Date: Sat, 27 May 2023 07:52:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Samsung SoC Support <linux-samsung-soc@vger.kernel.org>
Cc: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andrew <quark@disroot.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: Fwd: Does not work backlight on Chromebook XE303C12 with Kernel
 version 6.3.4
Message-ID: <ZHFUN2G0AEUgMaaF@debian.me>
References: <288db372-9797-540f-e8bd-794a23648573@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0CF+YdvXQiittFm"
Content-Disposition: inline
In-Reply-To: <288db372-9797-540f-e8bd-794a23648573@gmail.com>


--l0CF+YdvXQiittFm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 08:46:32PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > I did check it by flashlight. Even with all available backlights driver=
s compiled as modules it does not work. With Kernel version 5.15.106 backli=
ght works fine.
> > Kernels for Chomebook uses dtb files that have some backlight config se=
t (used gpio), like exynos5250-snow-common.dtsi and dmesg of 6.3.4 gives so=
me gpio warnings. Maybe cause in it.
>=20
> See bugzilla for the full thread and attached dmesg & kernel config.
>=20
> Anyway, I'm adding it to regzbot:
>=20
> #regzbot introduced: v5.15..v6.3 https://bugzilla.kernel.org/show_bug.cgi=
?id=3D217489
> #regzbot title: Chromebook XE303C12 backlight stopped working with gpio w=
arnings

The reporter confirms [1] that he doesn't have this regression (for now) on
v6.3.x (not reproducible), so I mark it as inconclusive:

#regzbot inconclusive: not a kernel regression

Thanks.

[1]: https://lore.kernel.org/regressions/288db372-9797-540f-e8bd-794a236485=
73@gmail.com/t.mbox.gz
=20
--=20
An old man doll... just what I always wanted! - Clara

--l0CF+YdvXQiittFm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHFUMQAKCRD2uYlJVVFO
o1dHAP9i3Y1Q9Z9UK75qteVCtUN8EaXGcyM6iapNxeiEqlEmsgEAu3wSeP7M1YrU
nKZEj5rAJFqAS1yIOPf6lpbLNzWW1gk=
=5PFI
-----END PGP SIGNATURE-----

--l0CF+YdvXQiittFm--
