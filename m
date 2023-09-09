Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC517C5
	for <regressions@lists.linux.dev>; Sat,  9 Sep 2023 05:28:26 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a41035828so2334694b3a.1
        for <regressions@lists.linux.dev>; Fri, 08 Sep 2023 22:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694237306; x=1694842106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AhGcYIVxPZwLXUPMQ7arLtBywPpQ4z3xctSy6TWk6XU=;
        b=ZMpVhjpxeN4osdnNQBxpYrh8CPyAMIpXw5L3IfNhRa3MGttpFIiZleHXZQ6Fs7LkNF
         FSydPB4xjuHBZDKYWok8i0COuXP5oDT9R9kHq/VQWUTYX1xY91mGUO4d6Nw/wj/7eTyo
         y41yHC4oRIzQnr3ewMmVwExkEnObZHDbGXB4TuYwsuMJ60HtS2w2ZjrbyssX4DRL+xGI
         CiOjn/AvimX3/oDxDGD2kt0OpZiEHyLCIYiKTbW40V4NSIKozgKCjNtcdR1O4cUJeYx3
         +PopSjhQ8wsC0/eek0S6t5uzBCBquuN2K/6prgX71nTuYFyRl3W+20k6PmaF+7XnQw4n
         sn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694237306; x=1694842106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhGcYIVxPZwLXUPMQ7arLtBywPpQ4z3xctSy6TWk6XU=;
        b=MhD7Yz4hRKqGs5iRUwvz90n3YLL5AZIr0YB4Y7+gY0cCIhIVA7b16TTRy3le/fak26
         xSYObhBnXy0MbYOpBrSAeoi94iW18HuD4G5K1ZwN6IKYinVK9TI+E+2d/psNSfPSko7O
         WZxgL11CP0/fg3JMLdYVOKttdMk+MHdKjoTbid+zSCHICkBEB6XJizTz/cvDtFLDYJ2Z
         pOE50tHU5cCyabeRAYP1HYCg1EcUnCeRfl+V9fgcpX/dJ5cEOG0haXLpNQj6oBYchaRj
         pqDxxXceQHTfAFwlpLrFPYVJL4MX6zbFqIqyRG6nM1sufximola+dZ7HwZ689G4auZEl
         5h2g==
X-Gm-Message-State: AOJu0Yyj+C9J8++xHfM1dnjP9b9hac2DHz/xn6S2xd6ZJAt1tOBGQ+rM
	einBLje9qpSy6j0WoiMSf0w=
X-Google-Smtp-Source: AGHT+IGw0ulupui94qNdMz252mwrFm6dOVwPF7ntkmtDhRPf3eauIShtH1mkNSqQIgh2r194qOvtMA==
X-Received: by 2002:a05:6a00:15ca:b0:68a:4dfa:ea63 with SMTP id o10-20020a056a0015ca00b0068a4dfaea63mr4581797pfu.19.1694237306156;
        Fri, 08 Sep 2023 22:28:26 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id n26-20020aa78a5a000000b006828e49c04csm2088013pfa.75.2023.09.08.22.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 22:28:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 89ED6803A58F; Sat,  9 Sep 2023 12:28:21 +0700 (WIB)
Date: Sat, 9 Sep 2023 12:28:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	TatriX <tatrics@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Subject: Re: Fwd: Bluetooth LE scan doesn't show device name
Message-ID: <ZPwCdd6lnOTbcDS0@debian.me>
References: <97224321-c839-c0a7-52dd-3fb6e52fc15e@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yHJYS4swNGsW/wbV"
Content-Disposition: inline
In-Reply-To: <97224321-c839-c0a7-52dd-3fb6e52fc15e@gmail.com>


--yHJYS4swNGsW/wbV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 08:44:36PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v5.9..v6.4 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217773
>=20

#regzbot fix: 52bf4fd43f759a

--=20
An old man doll... just what I always wanted! - Clara

--yHJYS4swNGsW/wbV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPwCbwAKCRD2uYlJVVFO
o3YPAQCu8g+OeR/FT4e0bLiH5epWupufFcZnNZzU0y5VYqsNqQD/Zy1WqYyTeb3n
nOxfRLCWsV9IJ3KNPiTfR0i2jHbzKwU=
=TM2y
-----END PGP SIGNATURE-----

--yHJYS4swNGsW/wbV--
