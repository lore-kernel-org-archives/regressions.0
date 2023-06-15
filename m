Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2F6AA8
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 13:26:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9900CD4146
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 13:12:34 +0000 (UTC)
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9E3B1BF20C;
	Thu, 15 Jun 2023 13:12:24 +0000 (UTC)
Date: Thu, 15 Jun 2023 15:12:23 +0200
From: Cyril Brulebois <cyril@debamax.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Salvatore Bonaccorso <carnil@debian.org>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Michal Suchanek <msuchanek@suse.de>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230615131223.3jlzyjl27v5q42eh@debamax.com>
Organization: DEBAMAX
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
 <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wakbenit2xnt2vww"
Content-Disposition: inline
In-Reply-To: <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>


--wakbenit2xnt2vww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> (=
2023-06-15):
> No reply to my status inquiry[1] a few weeks ago, so I have to assume
> nobody cares anymore. If somebody still cares, holler!

I still care about a proper bugfix, for upstream and for the Debian
distribution, and so does Salvatore. But fixing kernel regressions isn't
my day job, so I haven't got around to working on it.


Cheers,
--=20
Cyril Brulebois -- Debian Consultant @ DEBAMAX -- https://debamax.com/

--wakbenit2xnt2vww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEHoutkuoaze1Qayc7lZpsmSeGm2EFAmSLDjQACgkQlZpsmSeG
m2HkXg/9E+QcBfG/Y0jj9Eb6MxbHHf8hyR3pRsmuOX1DA5zQMcxRJV0KVknZKQzn
tuLBjgzupbWcEscBel+FT28pMM3HKxTc9wU2iBRhfHpz8nx5412Gp6Sba3E9K22X
domUmIjCfj1RgV3fjMnGxukaLWdkE2qzE0iewN/hTgkG4oA1US/j0rNCW29PNir2
7nKdp580PfhgEbCNPOPt0US2bdYZ2XhAjZpBmd8PtOBWXH2BWnwYoab+oqykiUBj
vBjODSWLpoHe35wK4WOJt1u0Dv5eFid18ZagHNviFqERKT7CQduBszH3yajMACkl
rrBrfDGqmNb8rZeGbcOajodRekRNHf8sUZ/nuZ5sLEUcXysLl6sgr1bRaW2W1oJj
cohmtvFPcDC4LgGWT9bAMfjvm0rGDjJsFOkvnuehrw+Ae7aMpQ9yGV20GDZpjBBp
4zKV2PpihZ5GCJ0c57Jzr1SOy2+HhYRZ9m5RVhZ/bu35SR8rVOfIMNb0fRwYxqA/
Iuo2PBmWdrR0hefOQBP/2O/T/g6Fcs6dTfPnayUYvbkAguBPQXaanphBm6bZ4YbQ
ebDTRFJJx1QH4KZhoRANEPGhpa/xfsjHZQ1y6kEZQp/mN8H2cyOVPUKuayf2w4R9
8YCNdcizJt62boDEXkwjCYtU3o+cyOAWGMC9vanHlDUHEvYXkDQ=
=/K9h
-----END PGP SIGNATURE-----

--wakbenit2xnt2vww--
