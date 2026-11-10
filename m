Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337416;
	b=itKVDGfXSwIfDe1AO8gW0Q/lZ/7HdpwxOAs+Q44CEOBsEkNV8MM2mtla56DOtIv/ZG2F
	 qc603J+lqSlBvRjLqNhZoKhkTvHr+eqE6pKSHphZ19OdA6NjPH44pxaIha5DhIU+f0PPQ
	 gzK6WzY6W977PZHYLwHF1jZ/PGx5BNqDvBThaiMaQcHK2KdvzOGNrSUt3EnJtqsyNrjjD
	 IAQxE4sG6TWAyrCoxddV6sd+wJtyndhebde4xJiPmUztY5gnvdDRITtMxbTwK4m09gW3/
	 2aLQuIL46xXcQRt/2M8bs09R00WED6lmnVuOvpsEyvg8YCQBsNRSD8SPtFjjUHOS7/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337416;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=katvvgwRpczq24t38tRUc6ZdV3qjt1G9MAIwEzQdqio=;
	b=JLLaRk6xWv+oKJ4LOSkAV4pUC75o8rQ81rOb5ac3WvjwsVM3N2Kn6QEu6ddVNeEUwrNP
	 KsM9oYXiXSudMamhV5muhvDOgxX93mSnin2rDtldVja3O13B9bR5AEjUgDpmY8otQk8ke
	 /3unQgfNFISUIpkQp8umbRyg2nCrfrZOnRUCGY7vLdUyyRPmVhsd+wz/eDP4SmBeUesZ2
	 3pHUz+I5zqJkDhjCsYgtMmjg8oyN7spNDUwzRMU1hftkYYRwoXS7uCW7EuOA11HV2IspR
	 g0PjFR74GkCYzjyW41hySifa4YhAJ2apc+g2+Aw5cIKUuNyQeuSw0H3oaLeSXwCYiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5PyyGOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ADE606A31C;
	Tue, 10 Nov 2026 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5PyyGOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAD11F0089F;
	Tue, 10 Nov 2026 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337415;
	bh=katvvgwRpczq24t38tRUc6ZdV3qjt1G9MAIwEzQdqio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S5PyyGOpXKPMj2JGV8SZpgp67KUZqZ0G+Hu+ZDAHXkfJIUcBv7EnmTXiPYFaMnS6L
	 KfBt3BJtISTJ+ZvUUCnPSQEZwLeOgS8ZZVyMQGbXykSHFJD3k+6BQWcM83LcTzQKu7
	 03EoXhKHGm78+VT+5fZJMZUvknn2Ai88tvayfQg1TDwgPxybi0CvhJeqwD5NIHiA48
	 I5C5OYCpH7sCWwXq4uz6upvp7SPIGAvBQUwKmpRaWSQEVcBaX/6ENAgSxYgvMnFJFD
	 1kiQo5arXQpGoNFAubDKF54P030uhdYs0hQAYhKfPIZDmxj4WIDctwgrY5/FYeIG3s
	 CrPycbs3j6LCQ==
Date: Tue, 10 Nov 2026 19:03:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Rujbin <rujbin@proton.me>
Cc: Linux Sound System <linux-sound@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux@leemhuis.info" <linux@leemhuis.info>
Subject: Re: [PATCH] ASoC: soc-core: reset num_components after flex alloc
Message-ID: <31f1209c-5729-4226-a52a-dbf107d7a09e@sirena.org.uk>
References: <GkiJToEzZhJCPGLofG5evJYV9SQ_rihb4enHtttMHWBS2rm3CBbL1IUumkGqnP3FNceQ0k6MIX2GWUtgmJWOTFp-bPCae4XiTB4Lrsz-Pd8=@proton.me>
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
	protocol="application/pgp-signature"; boundary="SSwi/SHYJ3+YYo/m"
Content-Disposition: inline
In-Reply-To: <GkiJToEzZhJCPGLofG5evJYV9SQ_rihb4enHtttMHWBS2rm3CBbL1IUumkGqnP3FNceQ0k6MIX2GWUtgmJWOTFp-bPCae4XiTB4Lrsz-Pd8=@proton.me>
X-Cookie: You can't take damsel here now.


--SSwi/SHYJ3+YYo/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 10:08:34PM +0000, Rujbin wrote:
> devm_kzalloc_flex() calls __set_flex_counter(), which sets the
> __counted_by() counter of a flexible array member to the number of
> allocated elements. In soc_new_pcm_runtime() that counter is
> rtd->num_components, but ASoC uses it as the number of populated
> components, not as the allocation size.

Thanks, this was already fixed so your patch doesn't apply.

--SSwi/SHYJ3+YYo/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzaoIACgkQJNaLcl1U
h9DbnAf+MvAnsKePDCaO/H0lUXSLsVFw++D93pE7dOLjLxRIwDMlGDUybcG97Y7l
36v8TMsfYjlgJhPZJ9ojWJKqgT64N6VetQyI0ilQ6jNV3dOzE3c+vAmy7T1jwQnB
sDqUsbPumUF1CVxH4qC5JJebOKGGjwLUdwx0Zq5kINwfEVdq657r0uXBPN1lYkmg
df+idrC8jpzbdfXpy7FIKnO0y5D5lTn6QUhTFEjG6zIaihp8XBSV0SoH021yJuhw
EF73D6TvgzwFDaTSbkXoQWEGgamMUXrYtIZlGQFs9vCPOwfBoAj8wf0d7S38l77V
D0F1Gv6ZGO1FS7zXFhYgTeFvBBysRQ==
=55ej
-----END PGP SIGNATURE-----

--SSwi/SHYJ3+YYo/m--
