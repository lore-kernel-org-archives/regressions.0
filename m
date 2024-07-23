Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6514D711
	for <regressions@lists.linux.dev>; Tue, 23 Jul 2024 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731287; cv=none; b=QXGQXqReDo9TbTdGOa4Kpx7k+jQJcPZAOGajUxixkau3/nCjHypluZdXFe4d3PaUbHMtTp7P2wIcVLoASuethCypqYR5QU1ntseo9aUNW51YS32qyfpggQpUnlPEbwJ6SnDh19acG3OGaUyHUE2b2TpgS7nJG6urUTTY/mwbBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731287; c=relaxed/simple;
	bh=J4aGyZH9malrZyVg1ogOAYd7nQP1Lo0aQg0LyYKJtgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0Smuff3eS+R9ZAFk9FbrmOmEDlJyTLUCHEbWIi3nriSF8ZVES8Xpxy7PM3XfcE4cRjalbSt/yFe5QMF6fg7ZDUnEhZp12IXHpXgNRG2ZYDy12zqGpoQwYXcNg1O1XkEB1TlVYgelUIQCnKB9ewF29lVVbC058V765dFcpiA7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=rW6XNd1x; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="rW6XNd1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721731274; x=1722336074; i=christian@heusel.eu;
	bh=J4aGyZH9malrZyVg1ogOAYd7nQP1Lo0aQg0LyYKJtgo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rW6XNd1x00jlA9ziGcc0h7T5xreuGBRuDBSTm02+xKvXqXlqO5oJFS/UJNE9/God
	 EVahpOXfCBCtNJFCU5KWbmJbwz4REAMkiI+614yWicKcVKoA+fghnkhdlwH3ZVZFS
	 dCEPO5enj42ereyP9jQNdtqGVw0PPBuvAdv6k6GCv/ykeCma6oApI1BtwwZBqmfLl
	 OgFcyHj+4KsAxgdZgmXRzCRGj27FX341rmYSS5PvQqHNo2qQYghpEsFCoRM/MxhUJ
	 S2xBZ2OA4JXQHPaIucqnNcp39RrdqXVUFB65uHeKnor8WGg1EVEeASIN6Gvz+jUtt
	 kdtORAyd7zfFTpF3zA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWRe1-1spIRu2qiJ-00Xsu9; Tue, 23
 Jul 2024 12:41:14 +0200
Date: Tue, 23 Jul 2024 12:41:11 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <a31a2c22-f73e-4129-a5a5-428c4107b475@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2pxdphaorzlmynq"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:a0zD/mnbkkmRib1gFTBrHkefNlRwplgcBi4sutfdJA81HI/q53A
 TMvsyOBOd1K9R0sVWur/41zxD19j+8YKamoDbEY77wigf2RTFBErPZLtrJwGiEUbH4aya8m
 +7OsBAcG1JVg552lziAcJLvYMF519p63h2dTbHEv0v7AS31PANbLiCI27lSQeS483fzf81Q
 AN0H3TZHDCiqjL4HaVH3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BiHHMmOa2Og=;Rw3tlxsVvtF2Tk0Yca5cQjXGNpH
 CjZHyAwn5BJwWqHrFmy3V+er7rSSjBuk/k1iwDvB4Gl1CkXcI0zB0IC4lAv6NkG2gEid1AKSa
 eitUuA0iwhOEHhzgCe2k/62ft4nM1r5jaYnvXGgWd48AM+4dCHn6EqOy0MrRO7XKPPVhSaLht
 gmxVmnPSt5uqqWsuemDGTck39iZCz6a4V5gcbsAnew3bQ7erGa8C3krO04jxeyqwFjcK/cZcS
 IoqPK2ipgkaFQiOMNon4kQi2Ci/qbv/PR3tYbsAifRCJ/KmPpyyoy0gcCfVRy5yhOYFQR14Yd
 daamflQE906UtRW27Lw5OpeXXL75KN5IZg5BXmaMvdcuuvJPV1Oi9TicPbiLX4BuuWvpHQF8h
 +lSsRncTCN8y3OTdTY3BbDOSwWD3VJK8QDjUztO7bLc2Q29xQjqfNYe/P1AQ3TuJKpmkhvUD4
 xeuA0+9bgxcQh3quR0LgM3HP1kUjLYa6rFAXJnk/HZxjbAc7+ZmWs+rmI7zlRnGAfLQV2EH09
 qgjigfKcBRz6yA3G3ZnKhh5FayiiC1oluuJgDftrAO/g27E69Eg22TpBstrSNwy16PYgRUQRP
 XHlQSTNrnXivRCkwkWiVMmF6Ki3A3FrlH1wYkI3Ga47D1Akls4YX9IBvBMoNcYxvr9CQTs+Jj
 rqMMf7r3EbIELXJBwQtd8dXwJABW81rYvUJUqBKesxo7ElyZ4BKvT46k8Y1+TCR9d4yZZxC7p
 q3j+dm2Qt+KU0Ytobu/h5ULCFqsbr0/VQ==


--f2pxdphaorzlmynq
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

#regzbot report: https://lore.kernel.org/all/CABXGCsPvqBfL5hQDOARwfqasLRJ_e=
NPBbCngZ257HOe=3DxbWDkA@mail.gmail.com/
#regzbot introduced: c1385c1f0ba3b80bd12f26c440612175088c664c
#regzbot title: x86/ACPI: deadlock due to recursive locking detected on boot

(sorry thorsten, first mail only went to you)

--f2pxdphaorzlmynq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmafiMcACgkQwEfU8yi1
JYWxrg/7BB/XMazS2eFyOVSJRxc+ZmC9MkonpA09aGg5c0GavjU/0avmvJKJ13/s
00LM6hUqqmSMkSNdVskZNfnvjRe7Dxrpqfsffo7mdX8uC7KlmFy+WpfNQB16Pk+D
v5EYZDslLTTs4niJlKAbKr26NYW7FoLXCRtSgh3ig0FNnjqteYDJPxU8mDVK764f
eZXAiCpvLkpxtYnQ3kGjRTMNCTOPwQ6AdA+0J7mlJerA1uKqPaWY8lY1pc0JFcW2
X4EI0C6IMLgWa4bjjoMww7+zQTcUezE1I7lTjLXKiL2RXpUhN6b3zz3Sij0keISv
GOhnC9wQukvCL4apXUhLwika0XKQaDWQZKMGvVx1gC2lF7T1TzlEGxM/0D9A7q/k
6G9RWhMzMIphnLzKXqoCGZbYkaefjBktK0c25yhvzwOsQeIi7XGgCWjJSDdDAQTM
EQAU/2ouBRMnD8mSYNzZao0xxO2qOvKKHIyuJT7tvN4TqyEzqyk3QACVBaQYBv61
AVtZo25yrKchxEzeHiuVLIpMyv69omesaNEHQ/4K/muz63QP31jRCGH3S8lSvT3Y
c9L5CDZDWfqdGtyXxJXY9hwEV6zZp7YWleB7PHVv/dokWaUSvWGB7faIXxCRnUe4
yrEBCzU4QjiKmaOKxchADC+9Y7tzjarufwLe7USnvrXjROoDLIc=
=b6Wv
-----END PGP SIGNATURE-----

--f2pxdphaorzlmynq--
