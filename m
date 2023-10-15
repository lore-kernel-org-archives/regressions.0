Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254B1861
	for <regressions@lists.linux.dev>; Sun, 15 Oct 2023 05:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKZlz15d"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4180d962b68so24380931cf.1
        for <regressions@lists.linux.dev>; Sat, 14 Oct 2023 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697347783; x=1697952583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ef7vv1cgYlTiF0Hvsk6gW7YFSMoM6pwzu7ykklDFFYE=;
        b=QKZlz15diQDvrjY488c/k/Iydj5oO7zngvMgwwZ8toeaoj2GDdO/ocsCVL/VyHdoGr
         4bBFMiwg8GW7gLFgDsP4FJsuTDUq7AxNHCOsME1TPAmOJ0osnWCuHWG6vtFePU3H5LfJ
         I0SFkouSU/WjV/sRBRDGTvvcu8tq20vTXjx2GgacUk/0b99rTFg7n3/zA6qEF1wCRP3l
         iZikHiTFH+Jdg/vuN+Dl0PmR2gbOw4q7hmxrd3bA7icoiYDB6yBFNa+aVdlFMqB+2RQP
         eRjf7RKsQGeBoJaHVSitSNbqR4e7tNKEpNSHMpwQKTMo0QjzFKxPmAevwJwfnJtXk1hD
         Mbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697347783; x=1697952583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef7vv1cgYlTiF0Hvsk6gW7YFSMoM6pwzu7ykklDFFYE=;
        b=D33do0TD7NMTooCQ6oYDWqFBKKLRi9Af8uXNDk7VVSMgDqW8JFt0fxiCSCESgsWf5s
         2P1lg8osRfKrTOtqCS92nxLLe9PxNcFUY0Ofe/OHK/W/AqVABAzExpEkg34tXwQegHbB
         XhFvcgQJJEwiLE4lgS1515ZXnFQpq5ZQ0SSBGvJ4abjOHQjG692VgZ65EqJl3v0icgmt
         Pwkut5hVLftYaNum/L8ZO+BPlUHwUBMXapB9TBfvCy9l6g+x7XBOnmhPm5oGtY1LpvZX
         zYICw4kt9BE6ujAXQaqLWd6WyGTKEdRQuKHeMnTSyspDKW3frIYg5SV7cmjMw580evwf
         NCGQ==
X-Gm-Message-State: AOJu0YxSk3ymJ7Eyhkoi9UKvxOQYuiw0/zJ6WqBjI7ThfzFx/RQzFNUS
	nvr9vl1IbeeFZGmnb3ehZ4c=
X-Google-Smtp-Source: AGHT+IGK9AgNN2mo+ayx7DzybWVY5IbZA9j1H0EJulu1i3mniVi1J+MAp5+3ySwqqtgWzVHtJ8lWgQ==
X-Received: by 2002:ac8:4e56:0:b0:403:ca55:6ac5 with SMTP id e22-20020ac84e56000000b00403ca556ac5mr41157024qtw.18.1697347783110;
        Sat, 14 Oct 2023 22:29:43 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902eb1200b001c5fc291ef9sm6293338plb.209.2023.10.14.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 22:29:42 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0A055A25D313; Sun, 15 Oct 2023 12:29:38 +0700 (WIB)
Date: Sun, 15 Oct 2023 12:29:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Linux Stable <stable@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: Possibly broken Linux 5.10.198 backport spi: spi-zynqmp-gqspi:
 Fix runtime PM imbalance in zynqmp_qspi_probe
Message-ID: <ZSt4wfx1EMeC0lnX@debian.me>
References: <9afe9285-6f46-46d9-bd21-2ea5c4dc43c0@denx.de>
 <ZSjYC_ATX193mJOA@debian.me>
 <ZSrERw6ucvl1wLWX@sashalap>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="77rmlWxZ44xZNn1P"
Content-Disposition: inline
In-Reply-To: <ZSrERw6ucvl1wLWX@sashalap>


--77rmlWxZ44xZNn1P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2023 at 12:39:35PM -0400, Sasha Levin wrote:
> On Fri, Oct 13, 2023 at 12:39:23PM +0700, Bagas Sanjaya wrote:
> > On Thu, Oct 12, 2023 at 06:39:10PM +0200, Marek Vasut wrote:
> > > Linux 5.10.198 commit
> > > 2cdec9c13f81 ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
> > > zynqmp_qspi_probe")
> > >=20
> > > looks very different compared to matching upstream commit:
> > > a21fbc42807b ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
> > > zynqmp_qspi_probe")
> > >=20
> > > The Linux 5.10.198 change breaks a platform for me and it really look=
s like
> > > an incorrect backport.
> > >=20
> > > Dinghao, can you have a look ?
> > >=20
> >=20
> > Thanks for the regression report. I'm adding it to regzbot (as stable-s=
pecific
> > one):
> >=20
> > #regzbot ^introduced: 2cdec9c13f81
>=20
> I'm going to revert it from 5.10.
>=20

OK, thanks!

Don't forget to add Link: to this regression report and most importantly,
Fixes: to the culprit commit when reverting.

--=20
An old man doll... just what I always wanted! - Clara

--77rmlWxZ44xZNn1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSt4wQAKCRD2uYlJVVFO
o2oxAQDemQvJ179CQYJ0coRWaZ55FTtmTVisfsz5uxEM466dXQD/T6GCbeigArv7
b4FJMks1BydkUp6p/pXyyt9OFM9k5Ac=
=RV4T
-----END PGP SIGNATURE-----

--77rmlWxZ44xZNn1P--
