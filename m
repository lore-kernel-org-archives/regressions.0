Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193FF15217A
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458559; cv=none; b=LD0iJO/EGCTLXTI2as5zeK9UuKDRlp/80NKR3HGMJcwbzTQZA3MxZn1bKiHFB7XXhNzOtXce+x/CYNPUB9haHRqiAPN9meDCUWzS1sGePxo9hOsf1KbxXeRj3HXXU+lhuxUaiof9i0O6+dDVPgJS21rt+fSTcTS7Kb5IVW0hj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458559; c=relaxed/simple;
	bh=KmUE88Sot7G1np7qjrV9+Eu8x2SGk2DBq3q8tIVzL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii7rMhuqdguUcTtq9x2/rrrzmeR3gIX65DJboohPrUg03SizCStKY0PBqfL0L6ir0iqDM2hh7qVk2C0NoZBqGNRQdexX4jQZL3qYTeG84P3S6RDfjUJbXsxo0SGqBGqDAD5XT5NkTd+JpRDN/13coEHqOsQFz6qEj/bUAw6XYng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=1TrdYICf; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="1TrdYICf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1720458555; x=1721063355; i=christian@heusel.eu;
	bh=KmUE88Sot7G1np7qjrV9+Eu8x2SGk2DBq3q8tIVzL4o=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=1TrdYICfNIS6OjUBxqb8yfdzvEVQIcpivhVnMXKlHTp2aX4YzTl+Pr4s5PBT8jhT
	 GwVnmjzkztx2q0mZYP2CXrf89nb9COUZ/5KCHKBlP6fU3BkeXNEmaufprE+XVEPCt
	 FnJ89OgKQt7xCXy8pZ0kOINPdshTm0vu9J4lRvfaRrNZowAOCQHJdd1ib8NPs39XI
	 DPPJlP9G/6w8wzBwQ2/mI1s8hsdLGm6ECCsqxZfkQvq3N+OeaBeAhsoqD7WEUz+sy
	 WHzE5MfgKgoFw6MoctaS2E2uJG/PNUVlAmnwOUbM7bbZZCsdW/8vXICiL9pDxdyHM
	 Efxcutrd0Zae8zXjdw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.131.151]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MaIGB-1suvbl2Dsz-00QHyi; Mon, 08 Jul 2024 19:03:56 +0200
Date: Mon, 8 Jul 2024 19:03:55 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: dm-crypt performance regression due to workqueue changes
Message-ID: <0176fb44-8209-4b18-98fc-f10a0626fd13@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
 <26f1b4f8-c78b-4aff-b748-58abaa01671f@leemhuis.info>
 <84ea4156-74b6-4a8d-8101-92d212015def@heusel.eu>
 <75ccb99c-a42f-4866-9550-f3d9dae2e554@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlteznn3sdyrfd4l"
Content-Disposition: inline
In-Reply-To: <75ccb99c-a42f-4866-9550-f3d9dae2e554@leemhuis.info>
X-Provags-ID: V03:K1:LC/qBzU457Nq08WoKvURNh87DMB9l2qLO2EDFH78nGIIBWYzebe
 f7ivnyCycGaCJ7l917kmJZ7RNm7ylt9Vns5u3H1YBuJN3ETZq7davA0oyQGvfYlr3Z30vHp
 aJFjkPmVd5DHgzgrzTwPWQ3hR7fBS6AWyJ9PECcj5F7VLBj88Z27mWRbJzuz2kkmYLuj11M
 eQpLnm/XQjmi8XFtdXPfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BDSgwjx2Qrs=;/wQ5ql5Pfyb3AS3sptXIci14boy
 48zTHgDfIeTSqugGiGgw6s7CKWN09Eql+4N/X9CWvBNAz4w0II1lFODzZ/aFfrz/o3wnaKrlD
 cgksmL6iyWc+yzY5RYo8BW+KSEnFXmRL3LQfB10Ux74WjubVKQgk2ISVGLY7DJjU/k7hoIXUt
 giY2dXpq7B4JXPKjXr/eV6io4Izx6Wyl4Ilyr6qZMgwgr7cO7lGFshzBNC35aiZP6kYT/gsBw
 Qm/HXL40oKZqc+3M/6XaoRLM0YSuazqaMTADx9/9B/MzZ5DEsDZ7iZr82y33sAChavCxkPW2+
 t2RdJLR2E9v0hEP7ROVNL6N95zfVBHAoCP78RUU+bbUUcKTmHxtGt/nj0p087mnnHQzkzriPr
 kfW3LVRrP0OZrW7ujYHx6FJqF0fRaACbcwD3TWt51s0RmW4AidL67ML3i2cUP98cEsszGKWas
 pYZCzfZzJCuGjgRSNfbURsvYDgrRuyuaYZ+HF3evWAz+Q1BE+rRpsKTotogPjlVvda1GNsSVB
 IF0/c5WpBUG6d8ICOMSCyK/RPJICSAIIzSKFDisoP/xVP9v+ncLV5hzmXpVJ+xbXavd322YgC
 gVJ6BEh9DJVK6Vvmj1PaNnhKW3Fhjz7DbgeYpFNOcp3h/QURaNOBkjribO/CGjATWU/CxJWRI
 LSEyaqerAGS+jsM2fyfKLvxeHiDancZN45iyY82f4afFXLRQOB/OagBfFHeBHZe/1lLED0X68
 2MpE3r2eM5F25nkWUe8QB0CnsV4JkIi3pVFGkeRuEhpNFXPDXZ33qY=


--vlteznn3sdyrfd4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/08 01:16PM, Thorsten Leemhuis wrote:
> On 08.07.24 12:51, Christian Heusel wrote:
>=20
> > Is this creating significant overhead for you or anybody else?=20
>=20
> It does, as I basically go through the list of tracked regressions every
> few days to prevent something along the lines of "regzbot is yet another
> bug tracker where the data does not match reality and where nobody is
> podding stalled reports when needed". And every entry obviously takes
> some time.

So what would you suggest on how I should deal with this in the future?
I have no problem re-reviewing the status for the ones I have added to
regzbot, but I can also just (fully) leave adding regressions (that I
did not report/debug myself) to you.

With regard to scaling properties it would maybe be good to get some
more people involved, but I can also see how it causes some extra work
=2E. So what I want to say is that in general I'm open to help but only
when it's of actual help and not just causing extra work x)

> > AFAIU the report will be autoclosed once a fix lands, so I thought
> > giving it some visibility on the regression overview wouldn't hurt.
>=20
> If it's fixed with a proper Link: or Closes: tag, yes. But from the
> discussion it looks a lot like this is a bug nobody wants to address.
> Without a proper "I'm affected by this" report from a user (not sure if
> Mikulas reports counts) it might not be worth trying to change that by
> prodding the developers.

Alright, thanks for the feedback!

> Ciao, Thorsten

Cheers,
Chris

--vlteznn3sdyrfd4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaMG/sACgkQwEfU8yi1
JYU09BAAmRVt9MGpXi6rq5gqcU/QxOh5bBq52mw87erGy444k4QGMkL6b707kYHN
Vv9BATb9sVMQ4Qh1Cl0ZQyoXC99MFJdEOJEUxzvHNwso1e2euKKBdMdXlKjbcA4Q
w9q9xVI93XSIZVOLVR3qraCtXYXD78MfsLD5tuVUZi+l3VTxY7wav+CWWyHRUK6Z
fZuirJ5ryU42BC1mqAGdmef+jwWxOiGcd/+tCyRBX59hl+VdRBn6NbLRQBjgm0rf
VGC2GkVX7RpMm+ltuif3dC4jfp3IxvkSY2SHe8UxB1wSJOoqMz8V9rkJpz/obWCw
PCaWqI7iVOEhAuFHK9ZgO+Uaemu7njxBLokSD+lDKscQ72IL+jfe+lVYw90PmQIH
yR4xakoenlNCCf6aTCF5JeWxBqSXjyXD67g7EN9DBsyDwnTRIZTOPxy3c/6Gss/+
rT/YMrrGFFe1h1IUWiXFcx7v9W1LFFSjB33eMjXgVpMQaIVIvXPQ50iYmJ14t4ql
ORS+Kgj0tDllM/Nj/i8xjaTcTZzXQ2EHrXtmME37kMd2EeA9T4DiGFFzTU4Oggi8
wp3qTInAn/WMw1r0gXysC7e2upM1wDHVxeENg9AEJPMwvxWfV+SWPcjK1CFH5w4B
EdmpE8EaznCvlhRTn9Axp4U2pokvbyposEz1TlKilXqmnSrjTIE=
=gL2Z
-----END PGP SIGNATURE-----

--vlteznn3sdyrfd4l--
