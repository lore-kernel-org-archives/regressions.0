Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E17460
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhI6j9s5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ce28faa92dso49609375ad.2
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 23:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701241699; x=1701846499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGeQs6K6JZs7HzSAt9g8E46vii3UWtn7mk9WYlHcgCc=;
        b=XhI6j9s5RoXrJalKobu72NuVLeauU3ynFeF6KoHpPEM5vj0TqvKsbD3NKqZk2ij/Ny
         xgt6sEjZDJv6RdHCVD+BSYwf8s+Ouc0/kF9mEZ4cwqJjmH4yfrOEVSqiJimWyQIqV8pT
         G/7swTg9f+6+3CSwG0VwOmEjmZclaBer2u1qKkjXlfLt0Icav5sGr/mTDZKSLnQbr8s9
         SzPrIguwMvDRL7+ZS6xt2mY7onhFkzn8xSNSQRlaqtWmO18fjbsRPwyL3rVWmcTEKUMY
         mzcjhqHxZv5RFT0zkaManwS79McxWdziccdPuMyB6HY24UzjBOyz2EzKCUaC7+gRw7aL
         TPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701241699; x=1701846499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGeQs6K6JZs7HzSAt9g8E46vii3UWtn7mk9WYlHcgCc=;
        b=d2BpczI+oy0wY6maQhv7cUhoqztQPCa17Vj2lrn1x4e25N0fCIFWvveYP1uvvUq+dM
         6JXH1uwE8/P2DBpHsp+ObFARocP0wovSBpgJn3eHR1j1rYpK76OjuURbZMN94XT5qahU
         VIpXIXSTNIfsR/4+Fm2Os1H3cbB533mHuPqAEopMAJrs5UDXy8vye1ZwRsXdiqVSsepV
         G1HCm5XMIJK+7cJQtwHKEfzsi54SXjMQs0aMw8RInMZLOdT/SOpD1dUtxZkrYBhctB/i
         h1SO+H5R0cMscTDm3Ng+VtOIN/WpEDwT7/DFBSfv/ZJacUmrBF7J7W6+5csXi4SfICU+
         Ag0A==
X-Gm-Message-State: AOJu0Yz8dkyDvFTMX9tHqI5O8tHWw9iM2tMUKVvuyYErEVHD366pRzvQ
	di3LYORU42T00Y+itlE4La/+HydwIrcYuA==
X-Google-Smtp-Source: AGHT+IEmtE4d2YHUZP8MvCwwcIJmwTKIdukzqmgpzHn2Y8zqkaylHrbzGhsPwsdGJsq45PisO4mpEA==
X-Received: by 2002:a17:902:c1cb:b0:1cc:6a09:a489 with SMTP id c11-20020a170902c1cb00b001cc6a09a489mr15604676plc.33.1701241699281;
        Tue, 28 Nov 2023 23:08:19 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c14200b001c755810f89sm11423722plj.181.2023.11.28.23.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 23:08:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2040C10205C74; Wed, 29 Nov 2023 14:08:13 +0700 (WIB)
Date: Wed, 29 Nov 2023 14:08:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Chris Mason <clm@fb.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: btrfs: super.c:416:25: error: 'ret' undeclared (first use in
 this function); did you mean 'net'?
Message-ID: <ZWbjXV85zDXen_YH@archie.me>
References: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IDRMR4pqBVuyAaoB"
Content-Disposition: inline
In-Reply-To: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>


--IDRMR4pqBVuyAaoB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 05:55:51PM +0530, Naresh Kamboju wrote:
> Following x86 and i386 build regressions noticed on Linux next-20231128 t=
ag.
>=20
> Build log:
> -----------
> fs/btrfs/super.c: In function 'btrfs_parse_param':
> fs/btrfs/super.c:416:25: error: 'ret' undeclared (first use in this
> function); did you mean 'net'?
>   416 |                         ret =3D -EINVAL;
>       |                         ^~~
>       |                         net
> fs/btrfs/super.c:416:25: note: each undeclared identifier is reported
> only once for each function it appears in
> fs/btrfs/super.c:417:25: error: label 'out' used but not defined
>   417 |                         goto out;
>       |                         ^~~~
> make[5]: *** [scripts/Makefile.build:243: fs/btrfs/super.o] Error 1
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202311=
28/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/log
>=20
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202311=
28/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/details/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51=
BFjRBS06YQ3U/
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51B=
FjRBS06YQ3U/config
>=20

Is it W=3D1 build? I can't reproduce on btrfs tree with
CONFIG_BTRFS_FS_POSIX_ACL=3Dy and without W=3D1.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IDRMR4pqBVuyAaoB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWbjWQAKCRD2uYlJVVFO
o/9PAQCExT+hJHio+2zC8X6ghL5ooF1kKAJVuc2D/2Vtwh3/hgEA45wQKlrh9VU2
WWNUC4riNE+70XRP2h8xpQoiRBv84Qs=
=fwJk
-----END PGP SIGNATURE-----

--IDRMR4pqBVuyAaoB--
