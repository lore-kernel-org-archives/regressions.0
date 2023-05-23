Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253722069A
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 19:58:52 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
	by mail.gandi.net (Postfix) with ESMTPSA id C838220008;
	Tue, 23 May 2023 19:58:47 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, m.szyprowski@samsung.com,
 m.tretter@pengutronix.de, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
 kernel@pengutronix.de, regressions@lists.linux.dev
Subject:
 Re: [PATCH] media: verisilicon: Additional fix for the crash when opening the
 driver
Date: Tue, 23 May 2023 21:58:38 +0200
Message-ID: <3187393.mvXUDI8C0e@bagend>
Organization: Connecting Knowledge
In-Reply-To: <c034db29-b664-793d-35e0-406fdfe2b145@collabora.com>
References:
 <20230523162515.993862-1-benjamin.gaignard@collabora.com>
 <c034db29-b664-793d-35e0-406fdfe2b145@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12717958.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart12717958.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Tue, 23 May 2023 21:58:38 +0200
Message-ID: <3187393.mvXUDI8C0e@bagend>
Organization: Connecting Knowledge
In-Reply-To: <c034db29-b664-793d-35e0-406fdfe2b145@collabora.com>
MIME-Version: 1.0

On Tuesday, 23 May 2023 18:36:09 CEST Benjamin Gaignard wrote:
> Diederik, Marek, Michael,
> I have tested this patch on my boards and I see no regressions on
> decoder part and no more crash when probing the encoder.
> Could you test it on your side to confirm it is ok ?

With this patch I'm (also) not seeing the crash

Tested-by: Diederik de Haas <didi.debian@cknow.org>
--nextPart12717958.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZG0a7gAKCRDXblvOeH7b
bj0yAP9KYJLoy9vZ9roO3p8+OR3Ir5PuJaJnsd/GM2+SOpRTCQD/S7jY/xWKhHDL
fZBXe5F+v3qj2eg2F5MF2Hf6WE44MwE=
=7jRZ
-----END PGP SIGNATURE-----

--nextPart12717958.O9o76ZdvQC--



