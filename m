Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D22376A0B;
	Tue, 18 Aug 2026 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070532; cv=none; b=HGIAfTEACRNnuk2W8lS6RvbmXEX4bEcZdCBMHr1xwLUAUlGMmt4udR38N/zRBlcVOPWGdV+heRGOvdDbcJ7XDcjxh+nbvdfgRvedp0buPckeqIsx6FAZJ3BZtqNBW+IFaI8Xgun23/5MX0LLNtWaheSuOVlCkfd77MJXQSDeDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070532; c=relaxed/simple;
	bh=j3easfOWcCD+tQlcxQPkq/5gQUTUS4t6JnvjgDDW4mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ5CQLpz+PT7ISV0cQSUx0clCtsjeMo0q7atYBVQ1E1s0Ofv094WRMUX7m0i/m65hML0KKYw49XYK0cHdLrnnuIWHHKPRNU42Yvku6Z+FwNDUEBtkwi6XF8ZtDgV1IhroNv4AQenHm5LHysUwt5M09fwR2U9cW/6+cxaKmZCd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWV4QKGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWV4QKGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141071F000E9;
	Tue, 18 Aug 2026 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070531;
	bh=ypjP4WKCUE+7Og1zvWDncb3673tWlrD9mca/KmqJxo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lWV4QKGTXJBReDCwNUU70GlIARcn1hx/BQ43zAFyXNcwbn6JxiUF7PAK/jN72O/r+
	 COd65QLoVfAYyBx3D3iFVkHTh9TyC4vWJPoMqoSY9Vbq8ekR6INMkF3L39FK5owIn6
	 4X6t/hmb/LeB2ISldU/gmbAvL+PcUp37DhhUm8THj5e+j3JWXwNyEHXT6jXSKR0/VF
	 GZ6+brSR1dLIU6HtpXpEtMlnC000EXz/SGa88NCwqVWdUdJhXzOMbkN6cP6+9oUpWh
	 3j6Wn9sVCNTAsvpDF3s6gZ3v32eSj0m8pRVhK6ExFFGxmirH50BvwuNpLgnh+E38dg
	 kWlT4QvvFjIBg==
Date: Tue, 18 Aug 2026 17:28:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev,
	laura.nao@collabora.com, shreeya.patel@collabora.com,
	kernelci-results@groups.io, kernelci@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
Message-ID: <b8f7b3d3-9ee4-4a51-b0b5-c99ff8aba4ed@sirena.org.uk>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d+esWg6JOuYiafvY"
Content-Disposition: inline
In-Reply-To: <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
X-Cookie: Smile!  You're on Candid Camera.


--d+esWg6JOuYiafvY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 09:19:04AM -0700, Nick Desaulniers wrote:
> On Mon, Aug 17, 2026 at 11:00=E2=80=AFPM Thorsten Leemhuis

> > Nathan, Nick, do you still care about clang problems like this?

> Yes, from the logs, it looks like ARCH=3Darm allmodconfig with clang-21
> (perhaps, there's a funny warning about the compiler version in the
> logs).

It should be - that warning is just saying that tuxmake didn't directly
invoke docker/podman itself, this happens with KernelCI because the
builds are run in Kubernetes.

> What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whatever
> was being tested is probably missing that patch.

The original mail has:

| For complete logs and details about the environment used, see the issue
| on the KernelCI dashboard:

| - dashboard: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e50f=
54dbe70a37c03
| - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
| - commit HEAD:  ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45

which is a recent merge in mainline.

--d+esWg6JOuYiafvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEiD0ACgkQJNaLcl1U
h9D6oggAg6SG+AlszsTrVtRz3Vg5bLRmukc8B9h/B3dEevuKuPrJYxRrdSlPgOAH
+pls+UQXN8yXE5rBLUp5mIoDcsGkLfaGRMhRUr+lT6OVVV+je9xxbH6SlRAT4F86
apJD5JDXasQOoTW5KuqB1g/D8R/EZwaeH6+nB2DwIYijD8GKBN0ZSkRlXyhznxta
d4heEk1YiV1wkEA4d6Y/qXLq2OBL7JkJbgIUurYIzB1J5YsE5YrqX2NmgLDXrIxN
c882vaviP0YtvN0qtW1HpMBA9VeDZBFP7QLydENgExp8X1omS7RQWozS3DR5kGDq
PgGNLIIfayl++mNxoDDhfGYvVZFk5A==
=lLhO
-----END PGP SIGNATURE-----

--d+esWg6JOuYiafvY--
