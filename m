Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB18488
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 11:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F04C433C8;
	Mon,  2 Oct 2023 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696247532;
	bh=mD0QT0lkuP0r4ZV9BxCcQ5Sp1u63ujom7VHA8vIIfnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Axrne4HGDwfESYO2ByS4rSXEtSHeXhf9vW/ONBjwi6qspv5IbIE0zKhUoG0DYzCLB
	 84YMqwGTgFdOWWA/NcIeWt4G6F+YjgR4tAj0hp51BQX+BGGSfxE5/Te8Wbq5pO1/dB
	 HiM5dVdMCAmE73sW6Ji0OwjSEgotKJjFNSdjs+3kgJ1T6PqnknFEIGnNwWeGd0YmbD
	 kImsO0h8bP6jtcBvw9GzM1rtMnXdUdFr5bnBEDgxkv4nw4WqeNIuGwaRGBDOjdeuNy
	 kT2mklnaBQroIIW0k3OH6+cTGGmmN1rJrVVPVJ5nv6WOmYD1rMe2oc2F4VK5GEZ9F1
	 vASKikm+Wttyg==
Date: Mon, 2 Oct 2023 12:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, mario.limonciello@amd.com,
	git@augustwikerfors.se, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Message-ID: <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KGb+AMvjQ5LP9ojj"
Content-Disposition: inline
In-Reply-To: <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
X-Cookie: Postage will be paid by addressee.


--KGb+AMvjQ5LP9ojj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 02, 2023 at 11:32:48AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:

> Makes me wonder: How many more such quirk entries will be needed? Will
> we have all machines listed soon, or do we expect that future Lenovo
> hardware will need entries as well? If it's the latter: are quirks
> really the right solution here, or do they just hide some bug or then
> need for code that automatically handles things?

x86 firmware descriptions are terrible, it's just an endless procession
of quirks.  The model for ACPI is not to describe key information in the
kernel and instead on Windows load device specific information from
separately supplied tables.  On Linux that translates into these endless
quirks, on Windows it's platform specific drivers for otherwise generic
audio hardware.

--KGb+AMvjQ5LP9ojj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUaruMACgkQJNaLcl1U
h9Bx7wf9FRyZSTh2EDOh9DlJhuxaY0I/WglGW1OTL05cnsL/2aJB17tn/OXVh6kV
63H5ZQ7Pkeb2JjyglqakUciSCmVUFP3wZAj1m/OOuUyNB1RiVvtWe6JQJDfzEsIX
QJoHO2nm2SGOmGy0JVOUcWDWXKxHo1L88+cimo7Sfj7yTLHBuRUMSqxpODOho1p6
Y0KAYgGtzlgAhGLTc5mRkWep5r05zosEpTHVSmx4lpVVTMb8+vzYGym+py/ghoux
G5b/wmqdWrVA69eGeyi5znMCXre8tzN0EujVE5C9Out07VJ4vpKG9tm9dMcSFNEg
jiLZrMEwNviwo0TkT2n8pfasqmsXbg==
=pKIL
-----END PGP SIGNATURE-----

--KGb+AMvjQ5LP9ojj--
