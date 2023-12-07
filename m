Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAA1841
	for <regressions@lists.linux.dev>; Thu,  7 Dec 2023 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGCxotPf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cfb30ce241so3951995ad.0
        for <regressions@lists.linux.dev>; Wed, 06 Dec 2023 18:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701916766; x=1702521566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=elG8GlXQstrh+7SbheHvlM9Wbdhuu5GKD5vjQyxAHjA=;
        b=CGCxotPfd6BSAzX2m1k2Vvl7SOptv2ca95FT12/AitQMA4kBAAEpgIN2Di75WVH//x
         0Kfa2cpXLIp7m7KdWPmCeSjmYQS0cryrHl2Kx4Zt1vAGlgAXOtjWAm92DTO7dnUoM+bl
         DRxK27wntseeGqMO95vJSebz5MfDsdXnLruaZQBXE6SvovqoUINTE/XTkuto/DhfI8PB
         zDsY5BATcjSclaCpxaNeTpiND3tjvTpEsFFpy8O5IoB4BtktTxpXqSau72MaALVZH6XP
         0nFB88w8TOv2+mA8+CnKBklz2+jXfdRi1NdGJQnfml5beuGqJ+k+yvwPh1SNyR4se9ct
         XZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701916766; x=1702521566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elG8GlXQstrh+7SbheHvlM9Wbdhuu5GKD5vjQyxAHjA=;
        b=ch0IQkTu/I08204UzDX/8XCEx7YUL8syvemzXgydM9dAPyzgd+z3C3qstLC27jkRq8
         so2XzcS4kEXVok06n4PDyROSpAxxyF08StFTowCZxMaq1w7EaCzxsOaDCb8E7TLVzYLu
         XV2i28fjDXeVP1fwsbfLdRdz1WJXHfFq4SplF4CJsJVqy+f9VtiIIlaXvErI5SQzX3az
         Qbd8/qNP3kW/0MNGmTzHEm7jxhON15AdzX/Mu661xiR2leoxLQhBUJ4NkHdOBCb5BxzI
         Zeu4DM+mHoDIuLgi8TpH6gQX8VCIX/Vm7nrkLajFhsVuUUYiFyPEIA2q50jELo09Iz1a
         ALSQ==
X-Gm-Message-State: AOJu0Yx+o6fHB0ofB0kWop3ljD7LYpGXMJdNoMPH1VdJ1iiPET5uo3UM
	Rz0zZW5tSjFcLzZDC/PkQC4=
X-Google-Smtp-Source: AGHT+IEK+qI5y2AHtPi9fYvkLjo2GmFVrcscUkg3UWuixiW/+HC2JdXhLqGPHnNbolOnqpMcPBpTHA==
X-Received: by 2002:a17:902:dacf:b0:1cf:c42c:cfbd with SMTP id q15-20020a170902dacf00b001cfc42ccfbdmr2468303plx.0.1701916765692;
        Wed, 06 Dec 2023 18:39:25 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902768200b001cc3fae06a6sm149846pll.159.2023.12.06.18.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 18:39:25 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E1D9B1143CC84; Thu,  7 Dec 2023 09:39:19 +0700 (WIB)
Date: Thu, 7 Dec 2023 09:39:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dianne Skoll <dianne@skoll.ca>, Linux Stable <stable@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Pan@archie.me, Xinhui <Xinhui.Pan@amd.com>
Subject: Re: Regression: Radeon video card does not work with 6.6.4; works
 fine with 6.6.3
Message-ID: <ZXEwV_BRROeu84Zh@archie.me>
References: <20231206172220.37ff4df9@gato.skoll.ca>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9mKsw2ilVY5K14MK"
Content-Disposition: inline
In-Reply-To: <20231206172220.37ff4df9@gato.skoll.ca>


--9mKsw2ilVY5K14MK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc'ing also amdgpu people]

On Wed, Dec 06, 2023 at 05:22:20PM -0500, Dianne Skoll wrote:
> Hi,
>=20
> I had to go back to 6.6.3 because 6.6.4 seems to have broken my Radeon
> video setup.  The full bug report:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218238
>=20

Can you bisect to find the culprit commit? See
Documentation/admin-guide/bug-bisect.rst in the kernel sources for reference
if you have never done bisection.

Also, can you check if latest mainline (currently v6.7-rc4) still have this
regression?

Regardless, please also report on freedesktop tracker [1].

Thanks.

[1]: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
An old man doll... just what I always wanted! - Clara

--9mKsw2ilVY5K14MK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZXEwUgAKCRD2uYlJVVFO
o26uAP4pJSbOfEfKR0cpWObUfKDiW5fKckPa8tUO8ExaxMRvWgEAjV139d+uzj2c
9OyU7VsBGW31gkolGGzUhLp5YIce2QI=
=isDS
-----END PGP SIGNATURE-----

--9mKsw2ilVY5K14MK--
