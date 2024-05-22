Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6879B84
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716362753; cv=none; b=Vq+wMtF4x8qv27ENfssNx9YIE4WdUy0y7UY4dgVyazlSZkpRS82CWs2WLgVDtsHnONf3y13iTfDczpfuFcRXV2F6/5izhY5hYLLP+kAvIgAgKXSrA6hr8myTjO+oUn2rcztBlY4DgVQdUONWVEI6zstv+k5FKvBEraxFtARZfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716362753; c=relaxed/simple;
	bh=jdyuM8KLD2F53/3g7ZX87b07SpSLllWzyyvZeCDwObg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY4FO/l1q18uNQ8hFoNcbhRATXeh3rffCm7NV/Nbcpd/pLmntzORVcK0GTVzrO2Jon3wGCdqnbjr1jUSF8pVjplLi3E6RDQ4FaQd5XJxGVdQBz6wqUMcSRQWF1Q4GZhP1b5OksF3OIhGgV98iHwEjbLijBSEPE5yJvwtNen3n3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9gM2-00049d-Bt; Wed, 22 May 2024 09:25:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9gM1-002UeL-B0; Wed, 22 May 2024 09:25:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9gM1-009now-0n;
	Wed, 22 May 2024 09:25:41 +0200
Date: Wed, 22 May 2024 09:25:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Nicolas Schier <nicolas@fjasle.eu>, 
	Masahiro Yamada <masahiroy@kernel.org>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: lib/build_OID_registry: Bareword found where operator expected
 at ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
Message-ID: <ttezegxuyqnc5jejvr6oriards5etmgilkaluqcmwkr7rxbdmg@k5eeiv7koojc>
References: <259f7a87-2692-480e-9073-1c1c35b52f67@molgen.mpg.de>
 <dgj2ghmghasb5drrjof45ji7jus52yonnvskcmhrvbfenphs37@lknclpncrwmb>
 <5906e1b4-8c9f-41b8-967f-df838dcec89c@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ukbbdyr5xoyiyykb"
Content-Disposition: inline
In-Reply-To: <5906e1b4-8c9f-41b8-967f-df838dcec89c@molgen.mpg.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: regressions@lists.linux.dev


--ukbbdyr5xoyiyykb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 08:47:25AM +0200, Paul Menzel wrote:
> Dear Uwe,
>=20
>=20
> Thank you for your reply.
>=20
> Am 22.05.24 um 08:28 schrieb Uwe Kleine-K=C3=B6nig:
>=20
> > On Mon, May 20, 2024 at 08:36:18AM +0200, Paul Menzel wrote:
> > > Your commit 5ef6dc08cfde (lib/build_OID_registry: don't mention the f=
ull
> > > path of the script in output), causes the build error below:
> > >=20
> > >      Bareword found where operator expected at ./lib/build_OID_regist=
ry line 41, near "s#^\Q$abs_srctree/\E##r"
> > >      syntax error at ./lib/build_OID_registry line 41, near "s#^\Q$ab=
s_srctree/\E##r"
> > >      Execution of ./lib/build_OID_registry aborted due to compilation=
 errors.
> > >      make[3]: *** [lib/Makefile:352: lib/oid_registry_data.c] Error 2=
55
> >=20
> > I cannot reproduce that and wonder about the build bots not reporting
> > this issue. The patch you report as broken is in next since >3 weeks.
> >=20
> > > gcc (GCC) 12.3.0 is used.
> >=20
> > Given that the error is in a Perl script, the version of your Perl
> > interpreter would be more enlightening.
>=20
> Good point.
>=20
>     $ perl --version
>=20
>     This is perl 5, version 12, subversion 1 (v5.12.1) built for
> x86_64-linux-thread-multi
>     [=E2=80=A6]
>=20
> And that seems to be it. Using Perl v5.34.0, the build succeeds.

Some more details (found by Ahmad, thanks!): Non-destructive substitution [=
1] is
only supported since Perl v5.13.2.

If you drop the r, the expression has a side effect (i.e. modifying $0),
but that shouldn't hurt. Alternatively we need something like:

	my $scriptname =3D $0;
	$scriptname ~=3D s#^\Q$abs_srctree/\E##;
	print C_FILE " * Automatically generated by ", $scriptname, ".  Do not edi=
t\n";

Hmm, given that Perl v5.13.2 was released in 2010 I'm not sure we should
care for older versions. I wonder about your build environment, even
Debian oldoldstable has a newer version :-)

Best regards
Uwe

[1] https://perldoc.perl.org/5.14.4/perl5132delta#Non-destructive-substitut=
ion=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ukbbdyr5xoyiyykb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZNnfQACgkQj4D7WH0S
/k7W0Af/Z/fee/S2i/6i56Uk0njc2ObwRu/Uv7BUL0XJRjmQylDVlN1PkjyYSpEy
PYtUvNQJGRY15RMjkwV0nnRmxeg23t0WemSdGCJr+kUvX7WnPWpMfZEyYugnYcJo
iby9n79qkRy4FwFWvIXuYhNzuFBcnYe1NAorZ2hvr3VjDPGuITlzO7nA6wM1AxZI
MueOeKr0FTFIwPiWgo68XXh3hFMMyEfGB6olJgHZw5rmMhegZN4vRBQjL406R8ac
FsNIPuH8EACDXTiAPAHeJxucT/txVbwTekpuRwhw9YHzbgwZgF6AUzYjM0SGffSj
VZKTCIO7xdUMRPO5/m6Ye014o5XcPw==
=h0mM
-----END PGP SIGNATURE-----

--ukbbdyr5xoyiyykb--
