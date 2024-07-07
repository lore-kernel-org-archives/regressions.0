Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03238BEF
	for <regressions@lists.linux.dev>; Sun,  7 Jul 2024 22:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720392901; cv=none; b=RW7fHbvCfnQuuaupBjIWCoaEDEi4rwd6eHFzESdMo9KFFBTyrNdRTO0lFhUs86PGuEKSYpnMdzGwHvzA2XfJl/nNmkanGecBzoJhJnCsZZOJpFDj4YWff+OiniSYZifWDxqjnoPHtDLrXhft9bRz9zrScnnZX71Qezbt1twg0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720392901; c=relaxed/simple;
	bh=eOFktLONr/+Ya3ae294AwwKc7bRELhJw3YO/9AsLcSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THiQhcbZ9ZQ6KF9iG83nfW3Ya8QY+2h4OL/2PAmZU7/xXZ4A6RzEURRIetl3jMSvV4ALBbdadSCfWwMHI7xuwnAJ/Y3cWnjUeJAVjKgbIEK7hVpe0TMiX69Za1PTgLn/0FtnyhkQdxYBEQQOKqVSkg9rc3TbyYmG7Z4g9t/lS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=QH0VIWmz; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="QH0VIWmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1720392888; x=1720997688; i=christian@heusel.eu;
	bh=eOFktLONr/+Ya3ae294AwwKc7bRELhJw3YO/9AsLcSc=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QH0VIWmz5WNfKGsxIAK2IdB/3HXcbpjz31Ng1r+jo38OfXaMtkY/SVhfhcsiyF6Z
	 oINV2EWaaTTj9V+al6Ko2ssiY+EHHpZMzgIQLgI4B2xPpDQtOoUQFBMdor25BmbYj
	 usY4yLJ5GnylZYpoGEX/3h0k26AXD/3ALfABM3Jh1kY+JkeBQCDIxvemBthCMh9Oi
	 YUKQdIkfbfpO4QgFSoKC2NKhs7xo8c+j+lo62lo6vNmiWykOa3gdo5+pxXg8lGghj
	 Vd42PVRPeABj6SwQ+1t8Lyq2mGQcG+wLpZKAT2BLDHbybo6nTVW5ENUERKpEg6Klp
	 I+jqNDzTPgzXE0EqXQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([84.170.80.140]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Ma1D8-1swZWG2Rs4-00HyWH; Mon, 08 Jul 2024 00:54:48 +0200
Date: Mon, 8 Jul 2024 00:54:46 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="luufe4zaf3viyg2y"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:ukRaYYL/cOD6vSPk1t0/AjLIucDFcw0hFdcp8RNnuR9DjlDNHpY
 yEoQjSN3gx1rZIKDceDxhRNEq8g1oyQ3bCM9hnztu/s93+cjbLMI/uqKJShZuquumy5m41Q
 nXdbHUWWT+pH5iNv4/kZ6WvWXZ9iUpOIe1lwwPMVY7hQMVGCTVYRd9LWLl3+otq6XMkPqJo
 z6F/B8bBD+sBvuKpNljSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tXOY0rVx2/8=;a5jvstMfQKx2YGli6/6DGMBNwym
 nAmWnnzNU8PVXXfXoxMI5XahkImYMVTzu0K1f1oPrGF5vkmffQ0WXfEikFwKNXIimaX8sM6vX
 Enw/CRmXwQ/Zsl7KSwhhJILNeSZ6uAkxfkh5hWHRW8xdG53RDnM2wcGxjCt+uZhiiqz8MRxyp
 nOOOAZOMjTdCNtieua4r+AY9yI3jDCRovaf82tWYnHfZSNzNryVkcAOPlUVRbziVBRUDXdsU0
 S2kSpF0F4zVxE+3z2jH+TyV4gps9Lg6OcSNZ570u7tTvoJz+hr1PLtZ6S6BeClDzByz9hHnFU
 4400Jooqofi1AXF7WcWXk532lEu35B9QURbTvM+y3wQpM2yU5c+Ey8MFwR8vgsmHG3FoyJcqX
 QrSHh3euSBGRB2FekUJGxXfzy2gYc9hYetv0G0dvjwoSxHx5FtbZ5csUwiLFl6nay6uXIVGm3
 3WMK6yfgAQEEDZvi6H5RFRVi6j691LvV1qXxEhAnlIOfQbQtnfb5ybovUfjCaPy3G86rg13cb
 vqcnsBSfo7VpwPv6AWFeJemMr17Wz8ZJmzqjSSSha6DWVwuw1rdPCAjJRti/jB8bI3CJMeC8q
 joMTokKPmSFyjsHm/IAw/wm6ul7i3xM9xLdUYVXz5oLXX2ZdMNM8QpZYlJc8nVHL55xGhbMvy
 hW3l/8OMBsG+Hp2dsSdsev+NsthNHZ64W8bzgTRxM4pA4/9ryJlYq7RmD5rlzT74g8gwWrNCt
 4iBccC9Vm7EDgXRgDzi7FKc0k/tvjuMhF00+1a2gcaF89lWh1C01GM=


--luufe4zaf3viyg2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
>=20
> Interacting with regzbot from arbitrary places is a recently added
> feature of regzbot usable via the new '#regzbot report <url>' command.
> The indented use of this feature is for updating minor aspect of
> regressions already tracked, e.g. "change the title" or "tell regzbot
> about a related discussion". Such things until now had to be done using
> regzbot commands in a direct or indirect reply to report -- but there
> they would mainly be noise for most others and just add to the huge
> amount of mail people already get. It's also takes a more time to send a
> lot of individual mails instead of preparing just one.
>=20
> The new command will be documented on
> https://gitlab.com/knurd42/regzbot/ once it got a bit more testing.
>=20
> Ciao, Thorsten
>=20

#regzbot report: https://lore.kernel.org/linux-kernel/32fd8274-d5f-3eca-f5d=
2-1a9117fd8edb@redhat.com/
#regzbot introduced: 63c5484e74952f60f5810256bd69814d167b8d22
#regzbot summary: workqueue: dm-crypt performance regression

--luufe4zaf3viyg2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaLHLYACgkQwEfU8yi1
JYVwHxAAzyf9xuuVqe1mCbYprGYPORzksnyqzA+pF018cdfTC6r8c7yFDQucBnKH
DAivLS2pWNyxQwfRcU+tuo6JV1yp4+IAp7uyujjK5tSYXxIeIv+BPeb6Zlbvh23B
DIQmlvInQjbmNEApwajmLRtdv1G9Y/nFLL3F3GA3ZFcaYeTUmyu1Mpl6uC4I9t7H
Kw91wXBc3JEh1ven6orTpazYfKvaZHq0ilSw40nAZ6hKjQBkAB6icK5iQMPtbRws
9oK/ow3/eyab+T+JdYNNb14lWAOrTUET+68+ERcNUoCUQKpnTCpEyyVZFBtBnb+l
mGw1SkDIOhPC4aJHEUOGHSv5Bb7pda0Vy0aSLTDotClEMdjcxqm3hsrqDcrcOLs2
TfoeW8eHEsn3IeHlvpSpBqmx4VJoHvg3N8UUZk6PXYHssBOZ7Qu4gnGrv2JYhrIp
HOQIkin4AThee++CUFBFBfLTURIfTbPzte7jnmKVAiHXtwIi0AJ35En5kzK27NKy
nd0iYS1G+dQ6A/yqQy/629ja7VGlQyXdhJ/Op/5UMO3gWj27gfWZ6dwCIv6X+W05
VXTx7jjQ1ImD58A+qeBwbCkrt1MN1540M5t/KBAT/TN/+/0DXH9jVmKW9Hue9RpK
GMXsRK9MEggAzWYwQyv9Ma0DVkRWlNOZXdbQQ6v40YGnWqLJwXs=
=s0dC
-----END PGP SIGNATURE-----

--luufe4zaf3viyg2y--
