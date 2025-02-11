Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548A1F1533
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269948; cv=none; b=L6xHRyjDdDFU4n37LHYLTPnxWX7/Ty28uDzzZZABr4D6tX4Hop6raghfy3vO80owDbDMCAVrAs7WLePkhHxZPmRUNfboCNAA/FLlsFZEfm0HoW/DtzwP1q/X036SD2jmTDPQY7HYAMUBSivti1OnIvnBAJXsoCJpCYgEotzgLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269948; c=relaxed/simple;
	bh=w63Y7CdySXiNEBrlXLpVDv44ltZ/eunR/96BkjIzWl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXHiuBmauLf/NSw+FTMdoNQk/m7cjhsCkuh2Rg8hRcJTYGROMKGLKueumb5pSXbCZxsrPF0qr46P+jZakUBnrzQut39uYvQmSJLImsiejV0G2jwMpo/RUEhqP3b6xparUFvmgejwHmg0lNS0vPfQxCCEsKzigxtgiS5GtO1QyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kb2lH/NU; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kb2lH/NU"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-aaeec07b705so848181966b.2
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739269944; x=1739874744; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0yLasoamk0iZKc/1URT52HRA1WbzmjHTzzeFRUfCcY=;
        b=Kb2lH/NUwIZw4B6ZbFrmXczMpkNT1lqVLgvCJCYD5/de8hAeyLV055kjt3uapR/vKi
         c58Ze+PXeW1EkOaol/xGSMp+mqibdvjLR5Pf13LTzIS5XYbdU9d1+i9P4Vfp8c4ZgjY+
         jf9FcRw0AVG9Plpk6WruuquCJTktHMFWHWbCdDRdyq81VISZLxeLhyKgly0NJYJI+a78
         /Ozfw3h9y/7E5AwlvS88rRiczUuE9DWbt0hXac/Ukl/EpYGMnDUFcJGOZiN10rIzDGd/
         qI316PUtO7tmNr+kwIge1GyLCngy/cwwc+vQqE+ulCRLZ9C8ylpasdU8P/LvuaC6DS1e
         7SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269944; x=1739874744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0yLasoamk0iZKc/1URT52HRA1WbzmjHTzzeFRUfCcY=;
        b=sXX28H2cSHWplp5spTY5tHj5l8e/0dePFITy40LNizFOGzbR76MspSkB9MGcTsE7pD
         C6RklnJ7/QGxPFfMrATh+rRixle1knpandow7mf9k6capKcHrZ/jUSnc4iuBDu8pLY0Y
         anbb670wy60pAXxG9l0wopMXZHSNr3l1iGGXnA1Bby8B3LHbv9Ekm+ZBrGfsX8YPg12s
         PmjO6V7D+h9tSL8bFqjVtwTb/h7fFJKcFqO+PgD6ak8A1eBiYruYTp9n8+Ul+aK+lmTh
         3udX+o+zYw6S/gl0IQSbRBsPNh6IVFu38WVCxpOiWzELeZ112O69qKeZP7/X5WZbNWTX
         2yLA==
X-Forwarded-Encrypted: i=1; AJvYcCWblamUvc2P6oYIwrPm4RtskmY+c8kZK4xZIYqBtq5J0PzQTra/XsvV9UyjrdO89lq3cJ4FW646jQbb6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgwPrsZ28Tf2vODdIw8Hq2+qzOxF7B43x6LbwSaw/b/x48voEd
	L9umGBWKK2/NHwTsqb851eTcjzxHLeAukNycGrdjheQQ07x3v2QGuzaa+D/4ks8=
X-Gm-Gg: ASbGncvu9OK0Or2wkD9YZvOAbOcFNA+Xf3FsUV5uN4RRxEi1yvJH+NwTmCXklU0HZQB
	XCxg+cNYPiDkc60jHEBxQpOgADac+JwklE1yaPuXi/o/26P98EhcIYFguFoURPaBMO302FrPyo0
	CWz8wvhNyuhhmCVnqFlnm8VkNBXzEmiIwLRPDAKT5WBVwYtxTYwgcR+DQ0pZ90RcgkLc4pqvjxu
	NdOmgjj3dV+S4UdE6YusvA/4GYVsdHGUcZDogwZPgO0K2S0SxLLsdUyI+D3VAQUlW4UTfZTjCwb
	98w2MwI3zrrys54+wsJvTfbSIE/dPeDIcomFGYhG4ZlO0c+tunQRp1ElSQ==
X-Google-Smtp-Source: AGHT+IGMf65w2KZ71XB7DG3+IsqQbafXRMHudaXgA2XcbRe3nKeXX4+v4pxIqUh75A9POaOb6Z8Wvg==
X-Received: by 2002:a17:907:3da7:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab789aeacd7mr1759262266b.28.1739269943684;
        Tue, 11 Feb 2025 02:32:23 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ced6fe0dsm254720166b.179.2025.02.11.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:32:23 -0800 (PST)
Date: Tue, 11 Feb 2025 11:32:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Message-ID: <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oui4r6js4wl7mw6b"
Content-Disposition: inline
In-Reply-To: <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>


--oui4r6js4wl7mw6b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
MIME-Version: 1.0

Hello,

On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> The subsystem status is currently reported with --role(stats) by
> adjusting the maintainer role for any status different from Maintained.
> This has two downsides:
>=20
> - if a subsystem has only reviewers or mailing lists and no maintainers,
>   the status is not reported (i.e. typically, Orphan subsystems have no
>   maintainers)
>=20
> - the Supported status means that someone is paid for maintaining, but
>   it is reported as "supporter" for all the maintainers, which can be
>   incorrect. People have been also confused about what "supporter"
>   means.
>=20
> This patch introduces a new --substatus option and functionality aimed
> to report the subsystem status separately, without adjusting the
> reported maintainer role. After the e-mails are output, the status of
> subsystems will follow, for example:
>=20
> ...
> linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> LIBRARY CODE status: Supported
>=20
> In order to allow replacing the role rewriting seamlessly, the new
> option works as follows:
>=20
> - it is automatically enabled when --email and --role are enabled
>   (the defaults include --email and --rolestats which implies --role)
>=20
> - usages with --norolestats e.g. for git's --cc-cmd will thus need no
>   adjustments
>=20
> - the most common Maintained status is not reported at all, to reduce
>   unnecessary noise
>=20
> - THE REST catch-all section (contains lkml) status is not reported
>=20
> - the existing --subsystem and --status options are unaffected so their
>   users will need no adjustments
>=20
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
breaks one of my scripts that I use to semi-automatically determine
recipents for patch series.

It works as follows:

	$ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-i=
ts-clocks-through-cl.patch
	#!/bin/sh

	addrecipent \
	-t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTE=
NED DEVICE TREE BINDINGS) \
	-t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE=
 AND FLATTENED DEVICE TREE BINDINGS) \
	-t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE AND F=
LATTENED DEVICE TREE BINDINGS) \
	-t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:ARM/Amlogic=
 Meson SoC support) \
	-t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlogic Meson =
SoC support) \
	-c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogic Meson S=
oC support) \
	-c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(: reviewer=
:ARM/Amlogic Meson SoC support) \
	-t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - SOC LAYER /=
 DYNAMIC AUDIO POWER MANAGEM...) \
	-t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC LAYER / DYN=
AMIC AUDIO POWER MANAGEM...) \
	-t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
	-t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
	-c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS) \
	-c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/Amlogic M=
eson SoC support) \
	-c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic Meson SoC=
 support) \
	-c "linux-kernel@vger.kernel.org" $(: open list) \
	-c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER / DYNAMIC=
 AUDIO POWER MANAGEM...) \
	audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-through-cl.p=
atch

the output is usually redirected to a file that I edit before running
it. The additional line in the output of

	scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-expo=
rt-its-clocks-through-cl.patch

with your change breaks that script.

#regzbot introduced: c1565b6f7b53ea1ea3e757538832e12d7d13d949
#regzbot title: get_maintainer's subsystem status output breaks custom scri=
pt

I can cope with it, but still wanted to let you know that people use
get_maintainers for `git --cc-cmd`-like usages without --norolestats.

Given that I use scripts/get_maintainer.pl from the tree I currently
work at and sometimes that is based on next, sometimes on linus/master
or -rc1 and sometimes even older trees (e.g. stable), the introduced
`--no-substatus` option doesn't help me because when run from a tree
without your change I get:

	$ scripts/get_maintainer.pl --no-substatus audin-patch-v1/0001-ASoC-meson-=
HACK-let-AIU-export-its-clocks-through-cl.patch
	Unknown option: no-substatus
	scripts/get_maintainer.pl: invalid argument - use --help if necessary

so I cannot use that option easily until all the trees I care about get
your change. :-\

Best regards
Uwe

--oui4r6js4wl7mw6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmerJzIACgkQj4D7WH0S
/k5YVQf7BAdWhLgXujonyzFFsaUOISFGzCkJyJvs50VgUIBiTkZ5JbdWlS1L7qmB
N7/9b+VwK0Kl2lDY29kaVk7VmzfcragO919FOrNdHBXl3oWArj164euH0v4lNo1S
8K3jL3QbFxcqzih2MlBzZh8kzwYhs6A8C9sfbh7XVsb1KmFddS5v3+CbUsZXYiUl
dDDID96hhkyXN3Vbfray7mYCfHbRcdEUSTLEYhOFjNf0/opHNYVnqGA4zGJq01n1
opI/4grFdZ+hHKQbFhT/e9cqRNg5UO71bE14kmGCJsJS/NKKTQjSdv4Y68Zv+taS
IZRag81HuVa6dcm3OnFUf6Q4P5bA1A==
=/Bv0
-----END PGP SIGNATURE-----

--oui4r6js4wl7mw6b--
