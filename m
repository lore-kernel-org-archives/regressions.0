Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4862B
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 01:43:34 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68becf931bfso2087781b3a.0
        for <regressions@lists.linux.dev>; Tue, 05 Sep 2023 18:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693964614; x=1694569414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuAvo1OT8MVuKgjI6ukMWZxsj7IgNKAT9aZUnqZFr+M=;
        b=apOP96zAARgEhrHdz1O2wECoHbSx+2y1arro9TdZ1RTX8XowAcm/k+wi+VeQAzMpGP
         jUtJ0O+Wl+X+MT2eUqskYkjd7sl40dkKOLMe7AezcQU5Mb2Zfy0mTeJ9LPxKEmRkSbig
         RMSZy6o8CYahG3yNrcyyQp1dkQ7GXsshS6Zm2j/eh9lnsMRk/ugISMOTge/R1fWdOh6F
         YxJ/f1lQfU7bnYJeSvneUBS5He5MoFZ58/dVlwuIs8a7qfgK7MiAV3bjrHE0chaGT39Z
         6/fGFBh1I0HwH0fbhJ+hfR7VU1Ap1pfxKNyHyGaylfroGzwBYatPyMPV9VJVd6o6M1S1
         9w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693964614; x=1694569414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuAvo1OT8MVuKgjI6ukMWZxsj7IgNKAT9aZUnqZFr+M=;
        b=WBQ5mvPr+U277f5JGjoL3bdUd61CkPUT+FOkZkd87YfNzZP2mLf8OyfGyllhtaFJ1n
         Qj0tUKQ7dLavfCgvZT6rx7PIovk4nW2KWF0QVA3lmdxQhvi8lrJhKUgs1P/AZZrnktP0
         MK6ggFwIz0ScI3oOc3yGQplmSOVj53k7Y78okkQTyo3tComw9DsaTnRpWJWpbyyJq56c
         UPkusmyg6sJ4zcNZ8cGt+vDc1PRvH78nm/H8D1Y0lhZEbzc9Ww6DYxikjpfKrUjpvKxz
         KOOz897LmvNCncrl95lguCCRcgtRlF8O5m0+FKLkTHDwkB9Bsgd0KCbWvKHdqp/FzqGu
         wjgw==
X-Gm-Message-State: AOJu0YywRYyy8cktdZF7IojUdjHdasVO3yxwHuoWvE7pX4NaWnT726xF
	/Opk3/n1iPw8g1TsQYBT+Tb4Wtp84Jw=
X-Google-Smtp-Source: AGHT+IFJJjPDphBBacjDJiqviaz4pVna35tTXOevm3qYLzXqSDsvWahohLQ/fQC29TrRqgfpt1HLiQ==
X-Received: by 2002:a05:6a21:184:b0:153:353e:5e39 with SMTP id le4-20020a056a21018400b00153353e5e39mr2437695pzb.51.1693964613758;
        Tue, 05 Sep 2023 18:43:33 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id v6-20020a170902b7c600b001c0a4146961sm9935388plz.19.2023.09.05.18.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 18:43:33 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 69C1995FE069; Wed,  6 Sep 2023 08:43:30 +0700 (WIB)
Date: Wed, 6 Sep 2023 08:43:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sergio Callegari <sergio.callegari@gmail.com>, netdev@vger.kernel.org
Cc: Linux Kernel Mailing list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Oliver Neukum <oliver@neukum.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Regression with AX88179A: can't manually set MAC address anymore
Message-ID: <ZPfZQsLKG9LKGR1G@debian.me>
References: <54cb50af-b8e7-397b-ff7e-f6933b01a4b9@gmail.com>
 <ZPcfsd_QcJwQq0dK@debian.me>
 <6315027e-d1ab-4dec-acf2-0a77bb948807@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="scPX1xTjP0AyGKKl"
Content-Disposition: inline
In-Reply-To: <6315027e-d1ab-4dec-acf2-0a77bb948807@gmail.com>


--scPX1xTjP0AyGKKl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:34:53PM +0200, Sergio Callegari wrote:
> On 05/09/2023 14:31, Bagas Sanjaya wrote:
> > On Tue, Sep 05, 2023 at 01:02:22PM +0200, Sergio Callegari wrote:
> > > More details:
> > >=20
> > > - before the kernel changes, the interface was supported by a dedicat=
ed
> > > kernel driver. The driver had glitches but was more or less working. =
The
> > > main issue was that after some usage the driver stopped working. Coul=
d fix
> > > these glitches with the driver at
> > > https://github.com/nothingstopsme/AX88179_178A_Linux_Driver
> > Did you mean that you use out-of-tree module?
>=20
> I mean that with kernel 5.15 I could use the in-tree module with some
> glitches (interface occasionally stopping on teleconferencing) as well as
> the indicated out of tree module with no glitches.
>=20
> With current kernels (certainly from 6.2 on) manually setting a MAC addre=
ss
> breaks the interface. Furthermore, even if it compiles and loads fine, it=
 is
> impossible to use the out of tree module because it does not create the e=
th
> device anymore (the eth device now appears with the cdc_ncn module). Being
> this an out of tree module, this is not very important, though.

Then can you please file issue against your external module on that
GH link?

--=20
An old man doll... just what I always wanted! - Clara

--scPX1xTjP0AyGKKl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPfZPQAKCRD2uYlJVVFO
o//WAP4lyG53jKCrxpFwKR6vkhX9eKlN3PbxPE6IOf/+0JpEYwD/R9J0ekHq+OVw
fDL8cHsBGOk6KtZEFRJoTNbldcmwewc=
=YfY7
-----END PGP SIGNATURE-----

--scPX1xTjP0AyGKKl--
