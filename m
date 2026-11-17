Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958762;
	b=GXrHR+UVvqjH9bcux+MiZ63BFxpBFonmEiVzyELok8yAOVjt7+6pQ2K1n1Q+tVWPP8X7
	 Ul0H/n1YrIl7GDmIHkztW0IfU37FrXRGY+r0Ns6N4bSiuMYOHN12ss8yUnh6e/CFcEsug
	 kTkyRoUQBWcyhk6xnETMyh+IZ6xwzHSx5IXYoAjK8Gj/O1H7sCWPX4DCZBc5eCbxkfcbK
	 0ZkENm2oaH/pttCp9YGPkq3IUi55bvMH33nV6s89fefv5bzPTxovf0usQaeoQ/7iJHOiF
	 xkFcdjfgDn+ViBM+Rg4xoo8Ngo3MCRuH6Qm29BL8q1pqDU7+OscTjbjtav37b4UrnDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958762;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=wkFBKPQXTtUyZziZ1ANq/sgDTGMxbX4P5wGnOw/2HDw=;
	b=u83rQgSitu3/3/9IVygLBsi0g22uGfgvJJQyPhB6RwqxwP8t1NT9E4MFyKEEwxH80baU
	 uwZ/ctg/Dfl0vLlkGc8NYb+5B23irnyiYbdcgcRbQhw957MRa+Ks6xVglF0+SkgImAYLt
	 V0p4N7Lp27eh9M2I8UxDB+j8/C8izvv8VssfrHSOcwlyCge98l0E0Ad+w6cwnmy8oFzdy
	 yojwH2fR37gHk1F8HpyRcb9QuG8YilzjZLusNPZUc6y8aQai6mRKfvjQ4EpKxYHr9pqfx
	 Xd5yuFoN3K7L/viqZgHcVbeiMEXkoD3t/FamZ9/dzbQFaTohdLzujzdohi5HtCZX0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz27g2RL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D003606A31C;
	Tue, 17 Nov 2026 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz27g2RL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D98C1F000C4;
	Tue, 17 Nov 2026 23:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794958762;
	bh=wkFBKPQXTtUyZziZ1ANq/sgDTGMxbX4P5wGnOw/2HDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hz27g2RLMQHpLHwHyl8zLPWJobmOAbmeJyum5J3YQgBThZJqFGaSKAL45IRRe54BA
	 4+sefngXTsZMNuUWI1UBCTVT9nA4NQItirkXGnYHTWODm9ZNJCP7YsmUEDN548fg0L
	 aXRNFSEmInI0FTH/WHNbRKl3pLqIz7+XWVzl9qDEHtq81IUvVuiVJnP8bi+WYKRc9E
	 AfQARqRfpd+fO2gKcgijojor7sQskF56om6vbbvlI2TTV6+Z4Z+f3AwFlXuIGmXIpD
	 F4eI2kMDMY8GWgYCfDdPnnlDoNSJB9xige8Fa+kd0ALzIcfaB6W2nsI3KlNGn+WRsF
	 2RYJqf2XUr+JA==
Date: Tue, 17 Nov 2026 23:39:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: johannes.goede@oss.qualcomm.com, Ted Vera <tedvera@gmail.com>,
	linux-sound@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>,
	regressions@lists.linux.dev, oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
Message-ID: <51903d75-8831-4e2f-9b25-92deb979f5a7@sirena.org.uk>
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
 <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
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
	protocol="application/pgp-signature"; boundary="SjdPSLczvmqMTBs+"
Content-Disposition: inline
In-Reply-To: <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
X-Cookie: Marriage, n.:


--SjdPSLczvmqMTBs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 06:34:24PM +0100, Pierre-Louis Bossart wrote:

> But the open is whether those GPIO mappings belong in the codec driver?
> Back in 2017 (!) Andy moved the Samus mappings to the machine driver
> bdw-rt5677, why not add those YogaBook mappings to the cht_rt5677
> machine driver?

> Looks like the addition of those mappings for the YogaBook didn't follow
> the Samus precedent, now we have two different ways of doing the same
> thing even though the codec is the same...

If the GPIOs are for LDO enable and reset those sound very cleearly like
something the CODEC should manage, the CODEC driver needs to know what's
going on there and those devices are used on non-ACPI platforms.  So too
do jack detection signals, but possibly the GPIO usage here is intended
to be as extra interrupt signals since it looks like the device has
integrated detection?  That'd mean a separate per-platform mapping.

--SjdPSLczvmqMTBs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr85aUACgkQJNaLcl1U
h9A2Gwf8D4EKk70pupTjkgmJDPNl6uX67k9wZaLEj1G+SkItsKPsDGhKxjcqvj3i
5cZuFPcU5naDPdhPKxYVziEyBEHrcLxrUw+Xd7ltaOJK+8XKspX4nxYcQpL058iq
ryO21QROwCbcss5oR8Ymxiu2mzts4qsv2xy37gwt2KURLQrHBGHZe2QVPRPRtvD3
ER+gv3D6/5181H7UDyRza2UcqaRJNl7Oc43GjWlqaCcXqmtpxS4L8wUwdqGBiTYU
7kHNWMKFaLSSnPEdkzakzy5MOL+b3UBy1XfqKOYYelVhIt5tLv9032h5PtX+jp3z
XbBcVbwfHf5dQ4n2FXBze49iWeME2Q==
=rJdv
-----END PGP SIGNATURE-----

--SjdPSLczvmqMTBs+--
