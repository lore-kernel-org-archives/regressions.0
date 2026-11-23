Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456392;
	b=KlJ6Y6zKT9FaKboFAKONVz3DSip04xrlqDkYGLMkMn53p9SzM/U709Th9xyr91TYDY8D
	 7x4E3dkwWYXfuiGHFOI0ZnjWWI2YFE1j4H1VWMjcp8Ud373kbXOHLToQS8EVHtOj+7NkU
	 DlTSAkaNWshsCeTtK0MhGAusmBrEBNQ2kF0FPg/ypUVQ/j47C06pgqFTRpkNy9EuwxIZk
	 dj1khugpVowCbgRxv+GnQAYEyR1euM9UwtSudx5diE5gOnNnuU2GA2mdY7YwP2U804pIg
	 KERtwqdfG6uKg+2CqJNlPqRSEndwtbm4SQbaUOrXD1bEY5EHW1vI+fsf9YQjV9qkpaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456392;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=8WnTv1HBk9dlmkKUsXGz7ii0QGOLHi892CNESnAnsnk=;
	b=OMtkU/NThrktU3DY3mBCls0YO8T4vTuRFgZdNmhLNhoWY4Lcs1YecsDjLhU6g1Lgnak8
	 q0ZZxP4bgl3pFGxXfrkFPN/sXhHcxBaG2PUjxORtyZa8CrAdphlM8q6mwCJwcwU0Kswt0
	 9hrlTHbUoy+Dj0JVRGS06MyHyWntzKKEQ5qA9uVZTXv7JK+bZQbHZYMCabx+AS0KwiW0G
	 0Fes/w2SZaJKg78wVhmhCant6WC2UIwaExIdFUxF7DJwNugd2p4n4cE17oJugaEk3nMh/
	 ECGLcOLsd3NnpFSkWms1JD0Wm6lEufH5UGKICezDIjNhxxlPMwTMcAOj/W6CQvAhwtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH5EZzsg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7AB606A31A;
	Mon, 23 Nov 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH5EZzsg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A52C1F000CF;
	Mon, 23 Nov 2026 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456391;
	bh=8WnTv1HBk9dlmkKUsXGz7ii0QGOLHi892CNESnAnsnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UH5EZzsg2LDWKI+WDFZW3g0CPFPkZjxMIQlsC8qKStivUl5EJjs7TDgeGVd9PfU2v
	 18jVgr6s64ZMHrrr17pe7jvM14BLiORcFUb7X8oI1wY0xjWKUxgX7J0R7ASUv2rISO
	 cTn1By0rcIazUI6f/O6RDAxnt+mx0xygAEUeMStYj/DGc58lCs2a9ARLoOewYLUjIx
	 H3iwb4m+05Hibo859QNUPilzwOPzv2NMXpyJm+LHvVgYSWmLyFSkzoTr/W/0FDU9aN
	 qhW5Oy2twGuY00bHutg9GxtyRp9dMrAgTMUmvu8Tvhtr2O4DvyqSyhwyMxVZwaqd5/
	 PYEOyKhbmqTfA==
Date: Mon, 23 Nov 2026 17:53:06 +0000
From: Mark Brown <broonie@kernel.org>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"antoine@montane.tech" <antoine@montane.tech>,
	"andrey.golovko@gmail.com" <andrey.golovko@gmail.com>,
	Lee Mann <leepaulmann@gmail.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"matthew.schwartz@linux.dev" <matthew.schwartz@linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [EXTERNAL] Re: [PATCH v7] ASoC: tas2783-sdw: add firmware
 download status check
Message-ID: <09840b30-e249-41e3-89a0-666e099d2b39@sirena.org.uk>
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
 <20261113124358.11823-1-leepaulmann@gmail.com>
 <52ec243f-5d13-4260-86cf-57800e1b887a@leemhuis.info>
 <075d49a5-8595-4fc2-9180-b7e98a4dfefb@sirena.org.uk>
 <8e3ca22e2bbf4cfcb6b807d5f1c3b058@ti.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgTgiE2ho4N/7w4w"
Content-Disposition: inline
In-Reply-To: <8e3ca22e2bbf4cfcb6b807d5f1c3b058@ti.com>
X-Cookie: Truth is free, but information costs.


--bgTgiE2ho4N/7w4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 03:42:37PM +0000, Xu, Baojun wrote:

> Please accept my apologies for the late response. Unfortunately, the patch
> failed to function correctly on my 4-AMP platform, so I have reverted the
> changes. I am currently looking into the matter and will provide an update
> shortly..

Can you send me a patch for the revert please?

--bgTgiE2ho4N/7w4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEfYIACgkQJNaLcl1U
h9AH4wf9HCeTqk2BV0Erd6UOKQK3F2kEUG506S/56dNtyJzOxJpAGTAwki1Bs/Rp
xNEiPoJiR/82OkreO7JuoC2S9xRlQn3J0YslYNfrZxpMA5fFU/INyTP9biz/JVEF
5WWgmJt00nnrX6LOAVh6nkgcZEYcLfeqAwWS75eWRWR9kLQeFavBdohC3ac5bfkH
Z4sEMzcICkGJDpVr5NJVkyQ6KqWX2bDMQez6CbZK7ujjwv758s0DQvgNzut7Icaz
mD2bluoany+1WNcCadOZitLR/wssI0jzy2BVovex9OamI/MICL0TnS3vBg+UFr/p
yQljwzgT78W1iG43SDIBF0nmnRwvyQ==
=vIaw
-----END PGP SIGNATURE-----

--bgTgiE2ho4N/7w4w--
