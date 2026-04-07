Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1D2C326D;
	Tue,  7 Apr 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586606; cv=none; b=ENuSyA8nI+wejbrfWNIeluxQW1pScpE0i2AFloOJPEGuFuR3XmVYPhugqGUli1oEygU/YZ/tp2BxQmxh01fa58VbFiX4MNeWjYoDbygTDk5McTGbV/TO4Y6tjCRbVSwWV9U2yNcIlRmWZXYtyK0PkwepfxVCsXsY7niWPBi8OJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586606; c=relaxed/simple;
	bh=8FB2sFzjoutc4xyAnWoPEMZS+46e7vwR/FgftQEhT7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmi6s6SWc4aXuZlnuuFv6e1fK1iwI9eeFVGWij0qaJRQaWB64Ep7uWB6FGbJgGI6SWZBDO6gu+lrU9pBHhu1L4mYnuiNh28IMPSPaOtC5Im/XgA/O5XqLwbXNv2gZzd5smbbJYEOpldD034TnpPz6XtGUYP7ORv5yQAbpGjoCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/wZeUp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/wZeUp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A80C116C6;
	Tue,  7 Apr 2026 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775586605;
	bh=8FB2sFzjoutc4xyAnWoPEMZS+46e7vwR/FgftQEhT7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/wZeUp+3h5lVIG4/qXG1ww2NN6skOjqhxR6NocSLBBTRm/MCGvCbn/n3IV/kVVwv
	 YJTD0x5UYMEuNYi1zRvkh1r3KTZo/VuTNAw0dxz87T3hboM7smFiSrmu4nHBjP2KJb
	 +C/bNnPAijSgk8wnDvSQeAecyhPuwpGPDFK3qj5ejR8G1FhNizq1yXNk6hM2fh0dDa
	 DlasOzboFS1OdrjL2v7Tzi52eE0Fpag2iPfqO4Bbj7ZYQCCudPei24dY6PUSo2P7V6
	 PlctgpYSUHl1LwwY0wCMuXP4rKHR0h9MWqCKU/ZtUcXOnEHcvnvL+TC0/IuvemlSf5
	 /3Ygep+LJArbg==
Date: Tue, 7 Apr 2026 19:30:01 +0100
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, bot@kernelci.org
Cc: regressions@lists.linux.dev, gus@collabora.com,
	linux-next@vger.kernel.org, Ben Copeland <ben.copeland@linaro.org>
Subject: Re: [REGRESSION] next/master: (build) ./test_signals.h:15:10: fatal
 error: 'asm/hwcap.h' file not found ...
Message-ID: <747dd81c-dffc-42cd-b7ca-f8fea2a99280@sirena.org.uk>
References: <177558474358.2474.8332387727108206093@8692ffc4d55e>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WjDc6eO9CpZXbxci"
Content-Disposition: inline
In-Reply-To: <177558474358.2474.8332387727108206093@8692ffc4d55e>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--WjDc6eO9CpZXbxci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 05:59:04PM -0000, KernelCI bot wrote:

> New build issue found on next/master:
>=20
> ---
>  ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found in tes=
tcases/fake_sigreturn_bad_size (testcases/fake_sigreturn_bad_size.c) [logsp=
ec:kbuild,kbuild.compiler.error]
> ---

This appears to be something off with the tuxmake build, it's building
kselftest with:

  make --silent --keep-going --jobs=3D8 O=3D/tmp/kci/artifacts/build INSTAL=
L_PATH=3D/tmp/kci/artifacts/build/kselftest_install LLVM=3D1 ARCH=3Darm64 C=
ROSS_COMPILE=3Daarch64-linux-gnu- HOSTCC=3Dclang CC=3Dclang -C tools/testin=
g/selftests install

which ends up with clang trying to use x86 headers rather than arm64
ones for the system libraries, plus trying to build x86 headers, since
it seems to be trying to do an x86 build: =20

  /usr/bin/ld: cannot find /usr/lib/llvm-21/lib/clang/21/lib/x86_64-pc-linu=
x-gnu/libclang_rt.asan_static.a: No such file or directory

I would not expect HOSTCC or CC to be set for clang builds, I'd expect
if the binary is configured it'd be done with LLVM=3D/path/to/llvm, or if
we are doing the above we should be including the relevant arch
parameters to clang in the commands.

--WjDc6eO9CpZXbxci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVTSkACgkQJNaLcl1U
h9DMQwf9GtknNcakZ7b2vSc7D225RnTdseDYJ/Hdd861lvZRbysbGf8y1qFSvXws
sm8cLgUlIED/+THQLeIGpsUYxLaSjrFfuPK/Ih6je7JanoItl3QnsS8yEHbJo1ZE
e/8HRGdFALbpOF8e3Y3orA+M+xg4t1VXVtNsyi2lSTG4vwKZd/Ng8SZ3SxZ2m+gV
FO+Rvu2QiiuUqU5MwxF3wQ8sHAPkp05spcv9QAqr+o249/N0pnE/31gnF0VADQQG
nCVm/+9eCzPfPbAyLQ8VzwD0xwV3tNE58yonkD171S4C/aKTisKmfEeSVwjcCJ01
hzmg6IWKUk8lbRhgXnhfgcG/FQMtfQ==
=cQYj
-----END PGP SIGNATURE-----

--WjDc6eO9CpZXbxci--
