Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0643169
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+wvdzJN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c398717726so4682044b3a.2
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 06:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700575441; x=1701180241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXE/wSY7rxsEQtyGCU8Vo4ysURLqqemytpp2DMRejDM=;
        b=M+wvdzJNmH40JuVXi2yWRiyjxYTZIaBMbTmxNnx5h0WAeHOHKe1kFjjs+LHKmwJCiw
         OCozrayUiC+A5RkBnEGTu933jjmfmYIPoAAIpvgwWaN0IMjBW1ANo5Su+Cq4wJdu8b2t
         7GSxgzA/TUGBUySWcZ8Vy6Smr2kVozsarHby6yyn8xQii7p9nD73JOb7xu4c5Ch1UciZ
         XkCKfIaf5c1EGEu1UWSK8g8JYFW/7Jw1Z9zxr97mgYV1Oan8ouqjMeOm0slf9qyHDTyS
         5cf6JLHMXRNiDrZDu6yb1lnj1tM7eFlrJJq82u0XiYuj7jQeu7qRvY99tDjWiqzNzMls
         46Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575441; x=1701180241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXE/wSY7rxsEQtyGCU8Vo4ysURLqqemytpp2DMRejDM=;
        b=bNnD3x/0LdS6BFSsKy25dCj/ryBWxZIXi0eF+PayBlnIAh+bhxuAo4guprYJRaU3ZW
         7SfKA68fINMVmzRj5mtmtTWFCNw0QOEoxHXe/XZDeC/Ky8PeI1JRszsxZ2Er7fv6bUrK
         cL/wmNJyWBHCGN9yV5FQ8dHyZAwregpLxcqE5o5nYPcydCTnutsKMJR7LLUIPIMgLalo
         sOTTitrQFEs6L5oTCtkNdOElez6cOAzxTKQpJAeuxnkf0wfpIIRz7v9v6cv1z2dzJSEe
         kuDv009T3Iu6WgQYQG3Bn/tTSHgjHBfG1v6NjjlPVpyTX/Pe8eTqdNNPPD8CA1RqoBUh
         79Tg==
X-Gm-Message-State: AOJu0Ywcmfy4+2RsY3uqlbF+5TTidc65PBh1iyqpO++upmS2fRsD6i45
	sKbPXXVPvjcDz2OuWMCgVaE=
X-Google-Smtp-Source: AGHT+IEh4zH4UY4YdBn32K7s1Y6nH6BG5UROVv7myOkk8sqazLdYJs4o3x7Qu/siDjrbnw+khPLUgQ==
X-Received: by 2002:a05:6a00:4286:b0:6cb:835a:8606 with SMTP id bx6-20020a056a00428600b006cb835a8606mr7433156pfb.4.1700575440845;
        Tue, 21 Nov 2023 06:04:00 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j12-20020a056a00130c00b0068fece22469sm7906337pfu.4.2023.11.21.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:04:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1E86010207145; Tue, 21 Nov 2023 21:03:56 +0700 (WIB)
Date: Tue, 21 Nov 2023 21:03:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	LinuxCat <masch77.linuxcat@gmail.com>,
	Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <ZVy4yzbN6-ak-TPI@archie.me>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
 <ZVyr-of1X4RudpWG@archie.me>
 <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info>
 <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82F1+VoXxx3lD9u8"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>


--82F1+VoXxx3lD9u8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 03:00:50PM +0100, Jiri Kosina wrote:
> On Tue, 21 Nov 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>=20
> > I guess part of the problem is that Bastien got reassigned and might not
> > care about the kernel anymore.
> >=20
> > Another part of it is that Jiri was CCed, but Benjamin was not.
> >=20
> > Ideally of course Mavroudis Chatzilazaridis, the culprit's author would
> > look into this, but from a quick search on lore it looks like Mavroudis
> > is not a regular kernel contributor and thus might not even know how we
> > expect situations like this to be handled.
>=20
> A comment from Mavroudis just appeared in
>=20
> 	https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
>=20
> pointing out that indeed the report descriptor of the device he is workin=
g=20
> on is different than the ones from the reporter.
>=20
> Until this mess gets figured out, I am now pretty sure revert is the way=
=20
> to go for 6.7.
>=20

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--82F1+VoXxx3lD9u8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVy4ywAKCRD2uYlJVVFO
o5QtAQCvCeR2G8h32Yb8lh3PpeX+7/ey4sJROo4PU4Pa445r0QD/ZUL1oS6lFhFw
UN6HQu7S0B6JJCnknxUk9dV8J/hzgQQ=
=42xF
-----END PGP SIGNATURE-----

--82F1+VoXxx3lD9u8--
