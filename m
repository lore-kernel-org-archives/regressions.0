Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC05C8FC
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359314; cv=none; b=KTbDX6o8+AEadezQuLmOO987sAgOgWR62YmU/mmhpm7AbVPang5+o2P/379btVbWEnCbFWpRYouSULOjsVjbI+2TcAuxD2DSu/BCaYRFsKBt0axYX5iNq0ZaHejkkfUnFSZaVLyySki/IkwFetx8js3B2OwPv7jYWwhsvaMyhc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359314; c=relaxed/simple;
	bh=oO+XckPs8XLXz35nJeyTPDNCEzLYihdVqAOU+eLpwXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVRhCBm1FIXNErLub3GduPhvjWTpaTcO+sxb8VjiwMtw6h9E2A1XArbJFiERImH24087vEE8qyVZSUgct4pxR1alMCPQ8zsheIm/vS4QhehFNxk51YqHknLw7DYnKBI4h/adtBJj7xiFs7kWecI/pWNfsfE9fPYlArujwarT4eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fSX-0003gW-2O; Wed, 22 May 2024 08:28:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fSV-002UJC-Sx; Wed, 22 May 2024 08:28:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fSV-009mJF-2b;
	Wed, 22 May 2024 08:28:19 +0200
Date: Wed, 22 May 2024 08:28:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev, kernel@pengutronix.de
Subject: Re: lib/build_OID_registry: Bareword found where operator expected
 at ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
Message-ID: <dgj2ghmghasb5drrjof45ji7jus52yonnvskcmhrvbfenphs37@lknclpncrwmb>
References: <259f7a87-2692-480e-9073-1c1c35b52f67@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5qlgnbiqdhgnplr7"
Content-Disposition: inline
In-Reply-To: <259f7a87-2692-480e-9073-1c1c35b52f67@molgen.mpg.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: regressions@lists.linux.dev


--5qlgnbiqdhgnplr7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Paul,

thanks for your report.

On Mon, May 20, 2024 at 08:36:18AM +0200, Paul Menzel wrote:
> Your commit 5ef6dc08cfde (lib/build_OID_registry: don't mention the full
> path of the script in output), causes the build error below:
>=20
>     Bareword found where operator expected at ./lib/build_OID_registry li=
ne
> 41, near "s#^\Q$abs_srctree/\E##r"
>     syntax error at ./lib/build_OID_registry line 41, near
> "s#^\Q$abs_srctree/\E##r"
>     Execution of ./lib/build_OID_registry aborted due to compilation erro=
rs.
>     make[3]: *** [lib/Makefile:352: lib/oid_registry_data.c] Error 255

I cannot reproduce that and wonder about the build bots not reporting
this issue. The patch you report as broken is in next since >3 weeks.

> gcc (GCC) 12.3.0 is used.

Given that the error is in a Perl script, the version of your Perl
interpreter would be more enlightening. Also I'm not fluent in Perl, so
if someone with more Perl foo could assist, that would be great.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5qlgnbiqdhgnplr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZNkIIACgkQj4D7WH0S
/k4SPwgAqI7YsomDas/acOLkQbznUXjTV1cqtazVBkTZHS/AVVojtQslKtxIZhYS
1WTzyinojKXpdYH9i9vfnOeSnzcXH6iBTUENKUYHm2OVyHC0VqQvL35V1zK92qrY
Nkdlmo+vTF/mwAGxxgolK6raFQnfwHJjqq5k7mJnwL2111kG2joXILYd1GFFpFIA
imZfNJqR6BayzcJHLGL+DGsBPhnxO93h6SbkR0PT1tgF647CZkV5EZYjAqGqmJDj
XzA9ExEXIrF80JMFIaRoslOFZmzaFU1aF1W8dsxPxfL8m3No6UAIiCh3OaVUTrCJ
LfTabIK8b3Q/ZXCAMoLnNNXp+lw39w==
=E1fV
-----END PGP SIGNATURE-----

--5qlgnbiqdhgnplr7--
