Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443106;
	b=jfGrEMXt79+HjNzuKWpNB6OsBnRbUoRJpZ4E2CErA3504k+PmIs2pSidTGmLqUluNZQj
	 qgq30Gi4jBKc6aj9ySO9jJaNj0lZIl6b7gcQFJLHYbYGjTFoLCI3FjX7M82QpoCCTaYax
	 1u2jK46N2uPbhcyDYAuMAiVgEjMAgns+F1hYZNP0FVaRwI5qRY3CaYyMMTn67DZW27/iA
	 gvsY7NIprlsh+l+RU7SemRgFDh+dNd+DXy7zw8KxoVXVgCrsiAwuf8VzM8ZcO4xO/Y71O
	 WcIeZb0V0ZLSn0PXABXGNFwoSQ7AIvRN9zL3A65QWdV452YENiLvOYz1tpMLsPjP8kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443106;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=NueWahyDGMfI3RvpaEUF6x16vV5jPcNxaZVgcca46YQ=;
	b=Op+Mcqwf0qY8Pj585JI218dGaAzy2eGPvFBjpSMWJAUXLAnvSGY0B0ABvrhOkvm+T12F
	 sEZp2x+9In5KgkPBjEPMFoqK7dG/XZr5G/E+v6otC4VfmlYNS/v2kqs9pjtIMU7Y08li4
	 fmMeCYA2pVcn0zNP5Rpstebk6gjTOZqOW5w54NWmJs4vlPkQE3oe8c1o64CzajZcLebzB
	 9/Oa5uLplONAiduzvVaMPrlTFkYRrPKuaeHvVcna+pv0tC22g8tNyVPwL8MkH5MeSlBVV
	 Rl8D8OV/UnKGUfnlfMzWJWszOvTmfXKRxOv6x55BBCJqVKIx26tmxn4VDVHGG+lr/Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB7vDJoY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B705606A31F;
	Mon, 23 Nov 2026 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB7vDJoY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7381F000CF;
	Mon, 23 Nov 2026 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443105;
	bh=NueWahyDGMfI3RvpaEUF6x16vV5jPcNxaZVgcca46YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BB7vDJoYEDRFvCRFVYCkTAMclKyYqS284p1mMpwmtUeVmLwHBriu9CNxq8y24A7eS
	 cD/qUqLsbqyxhjO6CoH3nwKCfs8ksNbfAJSacuVXw0miCAM1usRvMZ5DVKmgczAOVk
	 H2yhw4wGE/WfLPjfM6pGIz1LSxwGlpL6WMxIYQCpfRgOFbqx+FcN5z4rzYESoz2t+k
	 BxcCrWbiLnsazrCWvmlqF7Xel3+U3kNTMAoRmdUT/mE3mxOi7BWQ+p4HOq+2WeZU2Z
	 xodz06cduBylCuQ/8uhgzZao21/aRVeZQEvOkz6MVA407HurcJWcXwCriGzBd00QXF
	 lb6+QgdcIscbA==
Date: Mon, 23 Nov 2026 14:11:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: baojun.xu@ti.com, shenghao-ding@ti.com, niranjan.hy@ti.com,
	antoine@montane.tech, andrey.golovko@gmail.com,
	Lee Mann <leepaulmann@gmail.com>, pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev, linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <075d49a5-8595-4fc2-9180-b7e98a4dfefb@sirena.org.uk>
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
 <20261113124358.11823-1-leepaulmann@gmail.com>
 <52ec243f-5d13-4260-86cf-57800e1b887a@leemhuis.info>
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
	protocol="application/pgp-signature"; boundary="06JOfe4KAt2g940H"
Content-Disposition: inline
In-Reply-To: <52ec243f-5d13-4260-86cf-57800e1b887a@leemhuis.info>
X-Cookie: Truth is free, but information costs.


--06JOfe4KAt2g940H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 12:24:40PM +0100, Thorsten Leemhuis wrote:
> On 11/13/26 13:43, Lee Mann wrote:
> > On 11/13/26 13:07, Thorsten Leemhuis wrote:

> >> But if not: Lee, does a revert of the culprit fix this?

> > Yes.

> Hmmm. After more than two weeks still no reaction from Baojun Xu so far
> afaics, neither here not in the ticket mentioned below. Lore also
> doesn't find any other messages from Baojun Xu since early Nov.

> Mark, do you know how to bring this to the attention of the right
> developers? Or should we just revert the culprit for now?

I've got no better way of contacting them than anyone else here; if
someone wants to submit a revert explaining the issue...?

--06JOfe4KAt2g940H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsESZsACgkQJNaLcl1U
h9Dwewf8CprjBZkq6hWBKKak8wJ7g4GRJXbwexkPpk6GnGFQBV/DWVRhaWsUq3yz
9Eg14Q1ckBlBZ6EMoqFMVDJ4hLv0jjeu/6yn8kPH86ekqJ+SnSyJnTvxCJSaN63W
C952MJ0EUyesGVHUZES3iV47aa4COwVPd+qorCJCRYs/FHU7oKeNRMKz0Gh1TKJ0
zAyawCyPp8vXVn/Nz3An8ezVZd0ufrpsL2Kstr1vf3vZ69tSFL7cKFPym+agrj/6
qArUvwvqImfQmSVH/VM3CAf5zwH7lYyGFQL/Pb9cUijBL0PnEThfhdxlpkTnAJUg
wIRYdVItHgbMRzWlIJEb8kFiNWwdtA==
=n9+Y
-----END PGP SIGNATURE-----

--06JOfe4KAt2g940H--
