Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4418E13
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO72/gxT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cfb4d28c43so34556655ad.1
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 02:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701252328; x=1701857128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpQndnRiODx+tos8fdE4dhL+06RTmhorpUhO5hT0DMc=;
        b=EO72/gxTCT8SJU/dEYHYxsZ1Q7r51i8slzc+vquXbAEdEBlSEshK+sZmiCdcbu/pqr
         CrbGwY296Luwoab2/LG1wtIpGrfB0tCK6ceIk7w4kgj8J+h4xDVgj9AxoFYN9DNkpSBP
         l05ehd7qjpAe7EmbnRbHNylvRSzB/V3E+VTQrMaYyb3qm9Uje6UFsuiIkNMePRb2hPsg
         XpKj7alkU6ezs0ZNmCEBvQzxR9V8vxjLzyI/j7ioXIdi03y1lxC2dOd5IQkhHZKweXhC
         Ehm6J4DZ8N7sARv++7bapQCOjg1DJ2E4pZvEKGCMQMHC1wvjIS8a5qE7XA/X69IQPfwr
         40yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252328; x=1701857128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpQndnRiODx+tos8fdE4dhL+06RTmhorpUhO5hT0DMc=;
        b=PaVUjUJ5OeKWYtMete79w+kbK17dWltzN5/aPavonb2P4pORwVY4325nzK5/3xXBxK
         fPaf4KGugpbgWHVXxEDG4ku+m8mVYYLzaZhxHuoJOLP+FEAL+SzV7D8+gGkINiCiynpB
         OvloyxH6r4kKVZnjRO97aU5SKjXFVxZrH+pfIQFddxHUi3lLUFSWeZVhpbxqvcqP2YfD
         QBosiRkZZPJpJlesDj5iBasUd8Z/JnPwLgBcous2vYUrY/4Y9eqbFxuGRvKsK75+xpNH
         wOcw/i/fwvDbmed8YjWRwf9RqaC+JYz+SJwZoDc8fGli/CZVqHSdIoT+jYKQUIYalC5H
         +pxw==
X-Gm-Message-State: AOJu0YwJ/2oS0EdqzS3PWZ32xrEjL6/XgO1NRol8s5SO3EsP+mhw8jAv
	u/suL0GPvbWmqvhFSlhonsU=
X-Google-Smtp-Source: AGHT+IFHz1EOBr29DpBEQyHQO01oqfVMNvqkP1ezQq262jWCjWECYCTqM2o+9jGXSDx+XO+Xey/PSw==
X-Received: by 2002:a17:902:f687:b0:1d0:e37:8c14 with SMTP id l7-20020a170902f68700b001d00e378c14mr3871818plg.34.1701252328212;
        Wed, 29 Nov 2023 02:05:28 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902bc4800b001cc131c65besm11862520plz.168.2023.11.29.02.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:05:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C6DF71140D81A; Wed, 29 Nov 2023 16:58:36 +0700 (WIB)
Date: Wed, 29 Nov 2023 16:58:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Chris Mason <clm@fb.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: btrfs: super.c:416:25: error: 'ret' undeclared (first use in
 this function); did you mean 'net'?
Message-ID: <ZWcLTJB8wrLUwuVf@archie.me>
References: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>
 <ZWbjXV85zDXen_YH@archie.me>
 <CA+G9fYtByCCzrbM-a4du2b5rJVn_UaCz1HaMZMcBAcfyUBXPSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8g5cYfr1bA2m8oZD"
Content-Disposition: inline
In-Reply-To: <CA+G9fYtByCCzrbM-a4du2b5rJVn_UaCz1HaMZMcBAcfyUBXPSA@mail.gmail.com>


--8g5cYfr1bA2m8oZD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:29:42PM +0530, Naresh Kamboju wrote:
> On Wed, 29 Nov 2023 at 12:38, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On Tue, Nov 28, 2023 at 05:55:51PM +0530, Naresh Kamboju wrote:
> > > Following x86 and i386 build regressions noticed on Linux next-202311=
28 tag.
> > >
> > > Build log:
> > > -----------
> > > fs/btrfs/super.c: In function 'btrfs_parse_param':
> > > fs/btrfs/super.c:416:25: error: 'ret' undeclared (first use in this
> > > function); did you mean 'net'?
> > >   416 |                         ret =3D -EINVAL;
> > >       |                         ^~~
> > >       |                         net
> > > fs/btrfs/super.c:416:25: note: each undeclared identifier is reported
> > > only once for each function it appears in
> > > fs/btrfs/super.c:417:25: error: label 'out' used but not defined
> > >   417 |                         goto out;
> > >       |                         ^~~~
> > > make[5]: *** [scripts/Makefile.build:243: fs/btrfs/super.o] Error 1
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > Links:
> > >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20=
231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/log
> > >
> > >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20=
231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/detail=
s/
> > >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54=
ID51BFjRBS06YQ3U/
> > > - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54I=
D51BFjRBS06YQ3U/config
> > >
> >
> > Is it W=3D1 build? I can't reproduce on btrfs tree with
> > CONFIG_BTRFS_FS_POSIX_ACL=3Dy and without W=3D1.
>=20
> My config did not set this
> # CONFIG_BTRFS_FS_POSIX_ACL is not set

OK.

>=20
> Do you think the system should auto select the above config as default wh=
en
> following config gets enabled ?
>=20
> CONFIG_BTRFS_FS=3Dm
> (or)
> CONFIG_BTRFS_FS=3Dy
>=20

Nope, leave it as is.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--8g5cYfr1bA2m8oZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWcLQQAKCRD2uYlJVVFO
oz05AQDW4tcs+qseWAL5BBtuPRoexDBDprBofv0Ia95ssWcdqgD/Y3FQpjWSjs8q
d7X5Lsdki4Ydbwkio5K/IdQJQ6O8qAE=
=xISu
-----END PGP SIGNATURE-----

--8g5cYfr1bA2m8oZD--
