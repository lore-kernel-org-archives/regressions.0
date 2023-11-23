Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AD23753
	for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+usmnn3"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso741002b3a.0
        for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700743889; x=1701348689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lua/407sLR7U5g7Ynk/F+LhzLi2h/XJEhubjfBRyzWM=;
        b=P+usmnn3lADDP1hpTUARrKls2k3EvixACW1e63Mtmgk8DmV5yKHUKN46mHkZLIXhov
         D771xr/RdOVsjCz+FtBz0AV9nPZWr0gg3cjjW3V5WvNGzWFCTEwdNA0puTmSGTTHQRoc
         1+XeMzkHUOCRW3Rk6nwC9hh/kZuEQM+i6u0JuiUDQiJub46EZLU77ln3gmiZhgAVh5Ua
         hRnUwJN0fPQb6peWIXrffWTMnbsAvwbvkO8s4oIBDV70pKqvdjrE5xH3MW03avVj1wf+
         gfV/TbUNvPdIxE/2FH++YXCx5a/P7ZgPjFu5OCrqbYiBZOtcUKGyIpIM2d0KK4DahN6F
         ABvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700743889; x=1701348689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lua/407sLR7U5g7Ynk/F+LhzLi2h/XJEhubjfBRyzWM=;
        b=fcaSNBIRU9bZrgr9t6jlcWqSjH+AfINyFaAzd56LB0yZpugLuHRPM7nvzCsz692cJ1
         nR2mnkFSxmCfUoD0XEa875/uQaqNTMNXTulx4AWdw8MPrSQYsIqWxgDPA0pK4k1p5WQ+
         62iqk0XrNJhuSskl2QxLrjFGPfmxyxpGtKdmC+LeVXRpqHr/qucW1vv1hQDff15Rec4U
         ax6TGPj+Z6ZXfBEcEWOVtUJpUgNi6j5OsyH/ZHXDJWrn3YUMzRY9aGz1gFS3VLUDgZYL
         C7BBZp5j+LutwUarhVyHxQREI8XJ6BKZ+pNlv/o4mCUvAqPBsPnjXYEZHI6fn9HXgiQw
         vx8Q==
X-Gm-Message-State: AOJu0Yw672HC15/tEGgdHg+l45nx2l2cAPNZctLW73AwA+Jqy+XmkrnY
	DOAPiW1VS+AlP8lMdfdcJQ9MY06eHRrxjQ==
X-Google-Smtp-Source: AGHT+IHPjfg2D7ucdRYYUKQc6MDSWRv+kQYYT7mIt1RvV6aQz7kIkjD5Y2nMDmRJHpUcwd6d13d8bw==
X-Received: by 2002:a05:6a00:180e:b0:6cb:8c91:682 with SMTP id y14-20020a056a00180e00b006cb8c910682mr6205845pfa.29.1700743888923;
        Thu, 23 Nov 2023 04:51:28 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p126-20020a634284000000b005b9288d51f0sm1285107pga.48.2023.11.23.04.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:51:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 46F561015D896; Thu, 23 Nov 2023 19:51:24 +0700 (WIB)
Date: Thu, 23 Nov 2023 19:51:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Linux regression tracking #update (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ACPI <linux-acpi@vger.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Arnas <arnasz616@gmail.com>
Subject: Re: Fwd: [Regression] S3 Sleep Mode failures since Linux 6.x on Dell
 Inspiron 15 5593
Message-ID: <ZV9KzFGSqFsJl4YA@archie.me>
References: <585dcc9e-7e72-473a-98ec-4f06018d542f@gmail.com>
 <ZV4AP1GY3fHAxmtx@archie.me>
 <bbeb662d-78d0-4157-b062-b061eab66088@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0roWu1Dj6Rps07pF"
Content-Disposition: inline
In-Reply-To: <bbeb662d-78d0-4157-b062-b061eab66088@leemhuis.info>


--0roWu1Dj6Rps07pF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 05:55:20PM +0100, Linux regression tracking #update=
 (Thorsten Leemhuis) wrote:
> On 22.11.23 14:21, Bagas Sanjaya wrote:
> > On Tue, Sep 26, 2023 at 07:25:48AM +0700, Bagas Sanjaya wrote:
> >> I notice a regression report on Bugzilla [1]. Quoting from it:
> >>> I'm having some weird issues with sleep mode on any 6.x Linux kernel =
version - it's a toss-up when I close the lid as to whether it will sleep p=
roperly or not - when it fails, the screen will lock, but it will not actua=
lly enter S3 sleep - it just blanks the screen, but the laptop stays on (an=
d fan does too).
> > [...]
> >> #regzbot introduced: v5.15..v6.1 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217950
> >>
> >> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217950
> >=20
> > Hi Thorsten and all,
>=20
> Bagas, please ask me things like this in private. Developers get enough
> mail already, we should try our best to not increase the amount too much
> with stuff that is just there for regression tracking stuff.

Thanks for the pro tip.

>=20
> > It seems like the BZ reporter is really busy with his college life; IOW
> > he can only bisect in the winter break [1]. Should I mark this regressi=
on
> > as inconclusive for now?
>=20
> Let's put it on regzbot's back-burner.
>=20
> #regzbot backburner: will take a while until this is bisected
> #regzbot ignore-activity
>=20

Thanks for the handling!

--=20
An old man doll... just what I always wanted! - Clara

--0roWu1Dj6Rps07pF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV9KwwAKCRD2uYlJVVFO
o35oAQDoFPGsSeS0PpX/PIJJXi1UPNnPCUCfsAgPSjHS5ehV8QD/ezxLrWj+jpxC
r3pi76SjlUG3gRAWA6s84IJVjT9oPgA=
=mjAB
-----END PGP SIGNATURE-----

--0roWu1Dj6Rps07pF--
