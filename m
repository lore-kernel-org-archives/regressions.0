Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463FA51
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBojAyoP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6cda22140f2so1350649b3a.1
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 15:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701213532; x=1701818332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJfb8Ev4FQngJNMWt60qDvQUzvZyIitYBuhtl7HB7ms=;
        b=LBojAyoPXZstmv/IP9epyT+nHUgvD24Bwsffd1sHPCThMOyGfBjpglw6+kSNakHe+/
         KtYs9YOd6QopoYtm+W1OvTXe39agR132BCMx32Ucs8ftXBPtlYPqdZCIJ09g6SW6uiy3
         w13S/6uBDV3N6463cyTpZcZK9C9uV1W9Ddf8I0nDgz3PX9F1wR5PhKQF3QPXxHouu/uk
         jOBolVjrPDcp4A1zr4jrr3tUZStjg2pR7nugoRf0kvCytTpZlhxtdezypUuDuSnYxZRY
         u+mddjappP5O1gIVk8RD/mHSzTmAfuW+xfYDCwFEdsNorkeYnTWrTcfk9uYYHXzkoyuk
         IElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701213532; x=1701818332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJfb8Ev4FQngJNMWt60qDvQUzvZyIitYBuhtl7HB7ms=;
        b=nTibTHrthjBniU+WDb873ejkmn4PCF9IAP+3WB3u3dHE0/ZDcR2SFQo7yfPM6vSfXx
         CWCiSqsokyMYvA01u7ND9uKgsva59FUw20itBCOcbG3PMlgpy70znnQ3dAcjjeCBegGP
         /V4/tbXX52j/fv+CzBRoVlUUBCx/tpRGiJ8Ise9vz86s1TmZF8T5szMltp1RIa6DIUSk
         GrTtuOsAhEelEqdDZZrCDWNtMCth4Ggn2YIJrfafRn3idKcEks1bCc7aQIh9URw4bZhy
         4ZcdOSe5pdMVDIzeZke4tqTahsvj1VpYzL9t+Xfg3xuZCgk+qIq5sGod8VY43Bh4y9v+
         w51g==
X-Gm-Message-State: AOJu0Yyhw6k2Qmjr8xfyDuJFPPBO5WwihlOCU4uYri/c4f3I4mG9JmIy
	KPTnqDYLGmKTzsQmr0nMtP4BtoxG2lYJ/w==
X-Google-Smtp-Source: AGHT+IF/plHB5gXIJkREqoI4DCoI+v2816GheXyYF8KwECvmk0TEo2cNkYm3UK5WRVa3n6ChbtP0Tg==
X-Received: by 2002:a05:6a20:42a3:b0:187:ce5a:2a90 with SMTP id o35-20020a056a2042a300b00187ce5a2a90mr24569662pzj.51.1701213531926;
        Tue, 28 Nov 2023 15:18:51 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id y3-20020aa78043000000b006933f85bc29sm9404108pfm.111.2023.11.28.15.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:18:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 789751025EE67; Wed, 29 Nov 2023 06:18:49 +0700 (WIB)
Date: Wed, 29 Nov 2023 06:18:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Pawel <pawel.veselov@gmail.com>
Subject: Re: Fwd: 6.5.5 hardware access timeout / HW error / GPF in iwlwifi
Message-ID: <ZWZ1WYWp-vigRNN7@archie.me>
References: <9fa3c04b-bd98-4fde-9bfd-27d83132e766@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CjzFAuf1OzzSKykF"
Content-Disposition: inline
In-Reply-To: <9fa3c04b-bd98-4fde-9bfd-27d83132e766@gmail.com>


--CjzFAuf1OzzSKykF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 06:11:35PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217963
>=20

#regzbot resolve: fixed by distro (Fedora) upgrade

--=20
An old man doll... just what I always wanted! - Clara

--CjzFAuf1OzzSKykF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWZ1VQAKCRD2uYlJVVFO
o8CAAP0XlrWdIRMofAZO/oiL8cPLqdo5cDTJ3OYGXpM4zZuKmAEAuld1gxhIiTjs
LCOPaRJ+LB6+n21SNyaGaYzuWk90twI=
=3HvI
-----END PGP SIGNATURE-----

--CjzFAuf1OzzSKykF--
