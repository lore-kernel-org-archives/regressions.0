Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A1C135
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 13:38:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C0801C0003;
	Fri,  4 Aug 2023 13:38:11 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Karol Herbst <kherbst@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Olaf Skibbe <news@kravcenko.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 1042753@bugs.debian.org, Ben Skeggs <bskeggs@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: Bug#1042753: nouveau bug in linux/6.1.38-2
Date: Fri, 04 Aug 2023 15:38:03 +0200
Message-ID: <1861943.tdWV9SEqCh@bagend>
Organization: Connecting Knowledge
In-Reply-To: <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
References:
 <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <169080024768.2498.7944943374763908742.reportbug@oma-1>
 <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2154434.irdbgypaU6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: didi.debian@cknow.org

--nextPart2154434.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: Bug#1042753: nouveau bug in linux/6.1.38-2
Date: Fri, 04 Aug 2023 15:38:03 +0200
Message-ID: <1861943.tdWV9SEqCh@bagend>
Organization: Connecting Knowledge
In-Reply-To: <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
MIME-Version: 1.0

On Friday, 4 August 2023 15:11:46 CEST Olaf Skibbe wrote:
> (On the occasion a maybe silly question: am I right assuming that the
> kernel has to be build on the machine we want to reproduce the bug on?
> Otherwise it could use much faster hardware (running also bookworm).)

If that is also an amd64 machine running Debian kernel 6.1.38-2, it should be 
fine to build the kernel on the faster machine.
--nextPart2154434.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZMz/OwAKCRDXblvOeH7b
bt4nAQDPFpmbSLHFD7getdYcWSuA7EjAC7ABRIrg2d1k235hpAEA9blNXwSDoplZ
dNmsvFiDM+/jBGYJnl/qIlH6lCd3Hw8=
=Re8d
-----END PGP SIGNATURE-----

--nextPart2154434.irdbgypaU6--



