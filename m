Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860723D285
	for <regressions@lists.linux.dev>; Wed, 21 May 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822125; cv=none; b=ZchuyNaFZEQAc08HdX9c5VhWmjSgoQMT1ZOmqwg9ZAp9KQJcJpu4Kcri76VUJj4eSPz6JCypel5mDVMwiDPY7aumDC0bjJjFrKuDex5lo5AmZlNuKnpml7YlyvvTf65DhjsGA35DRIpjLx9nQT39CN9BYTPBRTJLLHtOs3NJmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822125; c=relaxed/simple;
	bh=ZNGSUOdcii+cKMzGlqFP+c7iJmTif4FWJDsPrVxtNrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPRnjXF4SLBs4mUpwYohlO0nq2Ia8NS6Y2/t3L6C5EorRp4rU33NLFRy/KS9/MKlspWHB10I7r1zJlbRNOuIU2nyF9QKV4vIN0J2Jk7r096iDhkKqxSxgdGXENW6eJeaENTCyG/R+b2uSxkhuJGvZOBVZofJFJ2fl0ORJUiDjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=2dU7QpD+; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="2dU7QpD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1747822112; x=1748426912; i=christian@heusel.eu;
	bh=ZNGSUOdcii+cKMzGlqFP+c7iJmTif4FWJDsPrVxtNrg=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=2dU7QpD+lk+8uR0Ti1q/aD4V2Ob066WA6Xe+LUY+LEomKkiI1TaIKWJtDu5JYcTk
	 oy3ccCuPsg1zN5FV5+pqCqjdgcB2tbU+ypQiiN4LGYxr9c+Ode9lA3G10svmrUf1e
	 XvbBXuLQJE1H9064dxQsoLgyA25pNe2aknBax7ww5UrQ1a0s1KzOlqQvzSTdCaL3V
	 SYHnehwmI1IsxckCDBfz11GVGGWvw1c2eISNZsybyj8CGq7z9qWh8CAwg3k0Ipgkv
	 GInCu3es9ITUcnYZ/MuC9B7Qcw+Zud7VxygrgT/VZ6JffvAuD8iG6bz1gRLSo2SUl
	 cROvZmcII1Qpy3E9pw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.42]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mbzhv-1unioB3UTf-00nMR1; Wed, 21 May 2025 12:08:32 +0200
Date: Wed, 21 May 2025 12:08:32 +0200
From: Christian Heusel <christian@heusel.eu>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linus.walleij@linaro.org
Subject: Re: Panic with a lis2dw12 accelerometer
Message-ID: <60a9ea8a-edb1-4426-ae0e-385f46888b3b@heusel.eu>
References: <AM7P189MB100986A83D2F28AF3FFAF976E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <8d249485-61f6-4081-82e0-63ae280c98c1@heusel.eu>
 <3352738d-9c0e-4c23-aa9a-61e1d3d67a50@hotmail.com>
 <AM7P189MB10092C41B59EF58CBCB290A2E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2cmn7d5gfxkbkv6"
Content-Disposition: inline
In-Reply-To: <AM7P189MB10092C41B59EF58CBCB290A2E39EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-Provags-ID: V03:K1:kKV/kZ2L9JUJKSGg+6Wrs3pnVW/3Yi3r6H/kHpAsc0bN9Cgc03+
 oys+nKw76VhMtQkrN5xR0+URcufQ0Znn6Bwc7amzAmyd912eiI0+SH+Jt5wPtx/uURKuYeD
 X9Z/xkZJVJUpGQIK1oZI3nOceqat2YNLLm96rz1q6rf0oEVZOTZ6QyGlwM1gYcneirDaUgH
 OVmm6Kmo98tBGtky7OWEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DfMuGtnVmLs=;l6BibFYsHTIlLWSRnqah510w/Bx
 xruhOLOf6AI4HsStNZR1bq22ov8HdbRNATaSxwy9mc2CP9SykY+8rYLNeIPKd05gOOTeEM++a
 CpJeH6TmHR0FjBlxmNSrUMWiu/k4vMgl6k0CUYzAU//4npM5zREEbJkBKg4kQrX3Ebb5TTgYs
 adPXsd/GmtJGWvToxsk4jpqcFhjNXAbw8HjRRjRYUj6IwI9MRrXOmtoQ3jrnRbvsecsTkMEty
 66lUDLu0w7/WN+t1tp5REN17S/8HSwHResr7MqK9Xpz3EjCIQ7VjzpkiPqqo5pFmRYIgWjDUW
 F9oUq+d906Bz7xLsv32SkN4xj3OWRotCbq6kbF0U47HfcXwd+phl8q0zeOEDW9yEfuWd1VXMo
 QoTZSGdM+6lf3N9nw6vAXVqhFGOyhZU1FOxC7b7Xnn0sJLcIa59hK7tSTTcduS0JyX7LI8Wo0
 6aq2JnPOrFbBF0EHf9w+EjqY36xseHXYo20Fz5/btnJDMehKkvA+bTFNTxb8AnvkcnDUJ6cnS
 zHXdQnufWgeHyfxn2/A4CjycUfeZSMoPYC+UldqXDU1S6QNUgp4uYXrVDJMrMci/duL2J+gHu
 1EiiVpRUxqu2e1OOqPRGlVGvdF0sVMKjQgNZagcLH8jNmyz7ZI3bYy+rZGAQ/i1uCxTqfM/EI
 W8LZdj/2Z+uIEB4prbgo9DTvr4GVRSHLX82UbnCA8bGO+NonE1t8AIpWKSSSPKKrNeCtwzeea
 YpOwjw4VeG/mrv62/+R63ySw5MiDhiNqr/N+bPvPHqDs0+9F1EhVzxFmo+LE20vM1kNfG8ZHR
 mBdKBBg8HdliMz6GjwNcOdJAZd5HGmFtCEruy6AZaw0BUqWdIqcKGtVOuuws3DM1V2gUkILMl
 tErrh3yJO2DHCeGs36LvuDxZurHGT9BVCFdklmrIVevbJb+p1B7OpEqRK6PSMmQqt3lXww5/I
 cROhVBAG4GLfN33INlmYjWAeEFaEqHVpzVPAmcVUP4HR0dKeLmtOzihF1KWHnVvJkT+fnkHEP
 KWUkoccgGaI66bIF1F9TFHGk1jtmVinEmFzqyNGU/Mh2ZYblGloUxGNz2Nv0AKtkRrRzOmg45
 NlPjmK3UDv0oJUlDKMnoSBIEpy8IKtD3ff5XhiqKH14ePXdIxo+XR7ELuog3DNnkm4+XDTn3K
 7EqNHxhH1qjhkEzN6p6lBgve0BjL85Wdx+iutUAjzpUrseUeYd9KC7lt7FTgxotyiaomXs75u
 JC6VszMHguGaY96rEX19rmnkbWWMa8+cu7LSGWIF3mUWBh/l4LoXLsc1XpSETskfksuKCz2T4
 1bDiH46WvnmIFKDx/Xr1quMmzjFhh4b1FKz0l/8+Z0r3VWljJ8ckK4D4lcbYGXs2WXaOU89hW
 aUAbwp4WsWv13RlFfvUtvX8djvN3OQXb1mND2qllNULhzIvwuT6T2DW1yM


--e2cmn7d5gfxkbkv6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Panic with a lis2dw12 accelerometer
MIME-Version: 1.0

On 25/05/21 12:03PM, Maud Spierings wrote:
> On 5/21/25 11:48, Maud Spierings wrote:
> > On 5/21/25 11:29, Christian Heusel wrote:
> > > On 25/05/21 10:53AM, Maud Spierings wrote:
> > > > I've just experienced an Issue that I think may be a regression.
> > > >=20
> > > > I'm enabling a device which incorporates a lis2dw12
> > > > accelerometer, currently
> > > > I am running 6.12 lts, so 6.12.29 as of typing this message.
> > >=20
> > > Could you check whether the latest mainline release (at the time this=
 is
> > > v6.15-rc7) is also affected? If that's not the case the bug might
> > > already be fixed ^_^
> >=20
> > Unfortunately doesn't seem to be the case, still gets the panic. I also
> > tried 6.12(.0), but that also has the panic, so it is definitely older
> > than this lts.
> >=20
> > > Also as you said that this is a regression, what is the last revision
> > > that the accelerometer worked with?
> >=20
> > Thats a difficult one to pin down, I'm moving from the nxp vendor kernel
> > to mainline, the last working one that I know sure is 5.10.72 of that
> > vendor kernel.
>=20
> I did some more digging and the latest lts it seems to work with is 6.1.1=
39,
> 6.6.91 also crashes. So it seems to be a very old regression.

Could you check whether the issue also exists for 6.1 & 6.6 and bisect
the issue between those two? Knowing which commit caused the breakage is
the best way of getting a fix for the issue!

Also see https://docs.kernel.org/admin-guide/bug-bisect.html for that,
feel free to ask if you need help with it!

--e2cmn7d5gfxkbkv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmgtpiAACgkQwEfU8yi1
JYVN4Q/+Iu7REEHHAYr03kANWHoMO75OQSdByTLWR0Jd7qCqurhNj3uBJkcxsANd
whpEJbISJvk/qATKzvXFv5rq3KjEFJy+369DD5N2Ou8/PkUh3brrZ5v1wXxqFCde
xGmbtUNbHPyYO5ldI3MLsBnqWMM3kPTyiamRVGrxBsUUU0jZASSMpxGLoRLT/s3n
QS0wJFgZehSb94gqgksKjtNsdXECUQtljBBORXizY+zE4JTNNCRitAeUAfnfSNsB
See6q+pqEm3ouAvIe+4TE12hDxPpcZ4UgRFnUnQnyxbLN5ZSv3qxexLRnCGiVsIi
ClEpD4PQ+nVfHE/+LTFc/2KM5x39/aKSzf6nIDVvWggiTy2sO5UWOXPIzstO6VXt
ev8C7W4aSMgESrskF+T5ylzLQ/ESS3WRVyYKho1i9Cz7yXQjWynuSXpZuf3y/pTi
fmn7HtQD2l9dooyh8Hs4znBQn2FZllMFtYXDUhG8/e/1g7veHoCA0mveGdXO8T5m
/80jpmMXKeW0pX8wZFd4qoOYxLmKwiZZkdgiBCHNyVhEq/0uAil2lpRiBwC5XJBr
/3sssUr5gE4jWDQSkL0DwpX+IXDMdOiz4WFj5NNidUVJPdTIYM5y+N9k5tVDXxzK
B0SjStteN6UiRLSQyP8PIyecXDkC6VAKY8Fzw8J1b4hkn3iYXrw=
=pP8S
-----END PGP SIGNATURE-----

--e2cmn7d5gfxkbkv6--
