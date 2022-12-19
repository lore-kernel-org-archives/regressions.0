Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBA1398
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 13:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D238C433D2;
	Mon, 19 Dec 2022 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671455059;
	bh=/I4Kb7hC8uOUuswynbcWKvpfRKg1AKsJ8i1itOIMgNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BG2+K+xYYC9R2EJR9LrAcE7VbEA78z7mrhopFIdT+aCu4zUHpmniLrhoMxHYQV0yZ
	 74Ph1aMRO83yS8UAWWUCQv/usAUeB976hfoR5Ug0eqconlMbDogpR9cupYKqtgGzjx
	 hBYiBKOd+MbNKkhB7haTMR+Eu/KWlcujQqAw1nxE2OJ+ACNMthN/WdRE6olT26otJJ
	 hcY3rz2RKWS/8EQXUNXas3QeGh9Hd8q+i1IfXyQl6vT34uzFsdjtuMVG7/aBbIReV7
	 LGfuSiI229qmvNJv2NRi6BSCjDjn+HTpOUw7YIQSdF3E+UfELU364lEk4hwlbARDe7
	 7jsxWAu8gInyA==
Date: Mon, 19 Dec 2022 13:04:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	yung-chuan.liao@linux.intel.com, tiwai@suse.de,
	daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
	lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
	Zhen Ni <nizhen@uniontech.com>, ranjani.sridharan@linux.intel.com,
	Ricardo Ribalda <ribalda@chromium.org>,
	Archana Patni <archana.patni@intel.com>,
	peter.ujfalusi@linux.intel.com,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Message-ID: <Y6BhTWGUp2D5hhbE@sirena.org.uk>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z24uizcIcNefEU/8"
Content-Disposition: inline
In-Reply-To: <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
X-Cookie: Pay toll ahead.


--z24uizcIcNefEU/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:

> * there are no "CC: <stable..." tags in these patches. Is the plan to
> manually ask for a backport? Or how can we get the regression fixed in
> older releases?

Speak to the stable maintainers I guess, or hope their bot picks the
commits up.

--z24uizcIcNefEU/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOgYUwACgkQJNaLcl1U
h9CJiAf+LFKoxKrnzbInjPMtZRBK99rFEvMVdssNVJslU5cTUDwpSv+36pXZuOQH
+dqHk715zIBic2CIlYArrY0jr1Z5eDIGSVgpn9kxTl3GNiOdHH1pIG9+Cf2ZSdL8
m5iUPKQRWAGGqtep02hodZtMatdTBBhN+goepgcnKwudoggltP83SiGHBwxRivvM
Gd/XMN6puIcpXsYe+UWnTAAYshOAHchTandsJ9kmWfPJwtHMIJqzZ5XxVIRRGqk8
kmRRzX1iXq/w5h8fAWIYK/ZZ3aWn/YVXjdBxKQhuVXAc10TCoGIIMxgxY0KDKl7A
7fvb3XroltdaVX33fP/BFYRehJLGBg==
=H6ZP
-----END PGP SIGNATURE-----

--z24uizcIcNefEU/8--
