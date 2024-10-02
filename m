Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34D1D0E28
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 20:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899935; cv=none; b=G54/CZz1LAVs6sPKpvVJQh7/9FHyWjUbOodFVQxw2veRyQU5m8yrf96XdiJzBQViXJT6gxXPtth/aYDANfOdYTQOSTqhZYuHAGHV2v8R1pI+Vlp/p5sOKPRcVTL9JQsZgipUm9sx2v6f7ZjZcandYJhef+iXkgXJcU8yKSC1fJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899935; c=relaxed/simple;
	bh=LpMBEnkfFmmVfKsmVjw0nJX5x5VOZmtrENQcjW3KXIE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3gAwTJ7NwW9uD42LyS2tcok2PKSl+eohgsL2/56sZ9+FD4BW/Um2Z+jLkfLRYp7iyUsKmZeMW2JY7CvN+y7B61Vuki7fyfoa76x58GV/JXALJa6NoxsLoYGeDkhvtMQdR4Fp97+ilzo4ts0vF8kwN7CRy0hJq/ga/z54aOut80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=SNvreULi; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="SNvreULi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1727899923; x=1728504723; i=christian@heusel.eu;
	bh=LpMBEnkfFmmVfKsmVjw0nJX5x5VOZmtrENQcjW3KXIE=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SNvreULivAS7ZE5ukNSqIzMPkLendOrEFXyorIIFhtX/UoEx3BWpQqtsr/E2bQ2w
	 ALUWS+YHgWP7Ia6+uSl4Gr6/nGqjkWZUfsw8zI4XOHsJhFl/ikd1Ne/kZTIRd+QyP
	 LVsYSCNJhj0VGx/Mqqo9iDb17AsoNXwP1efShZXxgtPMqUwMe5ie0RMoxTTVWZgfd
	 NbkGJHxKIiDDQZZrekXb+uoyJTJfXwjsjZ4iEsL4vJ/Kw7QIotZNWy8MSYLQKTKbi
	 3OoYN3dWi++hbNcgB05jIPC64QwcrF1FHzRoTqykFJUR7ssQO3scrZSkJwaIXmSwg
	 OQgGCVqWUhai7XQo9A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.149.59]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MtwIW-1s1vFX0MMW-00xDN1 for <regressions@lists.linux.dev>; Wed, 02 Oct 2024
 22:12:03 +0200
Date: Wed, 2 Oct 2024 22:12:02 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <143da137-db62-4357-b342-594a86b9d156@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fulz7omgvjqhybx2"
Content-Disposition: inline
In-Reply-To: <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
X-Provags-ID: V03:K1:k90kOMv5Ha3h1siwZef7goWcLer+QlMpEY/QEBTDIGW45T6kZwp
 Q/IC0GJ7q/g1Dq+pMR72q2ebWiusABJCkqHEDNRx8ftKiImskZ8BPL5Vc6pPvRQgNZ1u1Mb
 hoSjy44lnA3peEJeNH7siwxqTHhDuQWhFqy8y3asBM2xXhFiD2PIsp26ilAT53GtMv2v4Z9
 4/im/GoU6K9pstRK6G6eQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N6YDz+G7IE8=;oSJSdK0jNejaNTuPBARarTT6ZGH
 SSDxrWcFneGK4YRw6yAHhhIVQ6UMx8sHgQSeAsw2PO1pfviBP6utB6mdmF+dJ8WlBjUw1B+DB
 80dxAnDXtNzshiFf6lYcFTvaffIhOR0xmmemFzbiKfGOfof7d/7OtFL0Atdcz4H01JS8xht08
 z04IPWuh0hIlF7pa5GjJyfOQ8azmkEEL3HIoVsyLnRh76sZHc4DTbeFpICmq7HBTrIWqhGtit
 E/V4BBhCA/Sw4UZ/kRgbb35Pvj+9RE8h2hKqJ+7OEcURPEiouoVISkGWORZe+p+jsaI9lvoCD
 2udHKiTW48mZGqA93bziwtNoOEW8hWuOoRzItuRiftrBV467+NgjYWWewrlNLH7ZaB4F6j6co
 zOAUlKtRBl79U4XHfjbMN+P8/Pr800J8YSufTbfgigHBx3rethU4RyFKG8bPRAu7ZqxtCy1Uq
 eeNzLF+gL5Jnqkq6/BatQKkvqjhc+CBBcch+f9ybWvdHZ1kk+v3vluKAoEwupN8kUbOKdhyeW
 lDRxn5Vl06vl050t9vcar3jnIVQOW575v/FORTmRl5ICMWkQE8Wtf1Xli9EtveItLD1eNgxxw
 v0FoKvkdMicR7MaS/CUge8U6AqmUn3MbYonLK5zi50vGzowxZAJlzz+g5t3MMAecn1RivVoTh
 FZxIFixYgbCKcF5AyEXRRssUmlQhPjen8DFeYm2Ie2/i/OxFBNxDmayS4wl01R+vFSARDATrm
 bb/ju5f1qStTVi33OvOm5zdqlHZZsE3lA==


--fulz7omgvjqhybx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/10/02 08:57PM, Christian Heusel wrote:
> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> > Hi! This is the start of a thread I'll use for updating minor properties
> > of regressions tracked by regzbot. Consider telling your mailer to
> > ignore this thread, the replies are unlikely to be of relevance for you,
> > but done here to ensure a public paper trail.
>=20
> #regzbot report: https://lore.kernel.org/all/cf45e722-144f-4d06-8dd9-2f7f=
54283fbc@amd.com
> #regzbot introduced: f1bfb4a6fed64de1771b43a76631942279851744
> #regzbot title: usb/acpi: boot hang on Thinkpad T14
>=20
> #regzbot report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@m=
bosch.me
> #regzbot introduced: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e

#regzbot report: https://lore.kernel.org/all/20240923183432.1876750-1-chant=
r4@gmail.com/
#regzbot dup: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@mbosch=
=2Eme

#regzbort report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@mb=
osch.me
#regzbot resolve: duplicate

--fulz7omgvjqhybx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmb9qQcACgkQwEfU8yi1
JYU6fw/+LUsAgveeeE2Hs8/rc1ZjD4Bnm1NOnrs4314iuEL5iaNW2QqHKu8H3X8D
qkEGYaz+llxGrYUwER4laUMM+vaUGe+FSjubA7GELUpP+ydNUxFpya4rNO0HAel8
RPL/1KKqoz0Bi3aXSlxqFbUoThWLmovWS09EcdZeIK5Yrf3wkpCteq0VcAqFQrlM
xhrhE7lyzZxWu33bhnoVaepe8N/Uh7RUBL5Hh6ANcCqtuddAxAmm8pU+RbAEo3aI
gwO+QyZOzjv1sHT0E9npaPrPHv3r1w6UGWhlZQMyPhVIjV9Jnzv8D5Jmx9ao6XPo
LIgyreo0YC590Z80ySFr2uoFgo5+7eUw9BIqBtp3R7tb25RcpMU4e6N1AuFdx6r8
2QxKwGNZjUT9lJUQAf8Tq3EuBUYWEgoOGZwtnmOXf7qh30ieK4FsfeB5CtRAWHsx
5qYWXsb8l/4EDpWgLBhkyKRD1313+3EEV7quJnhuapjPT+unFVdI0hg9YwbmHe89
2XT1Za6HUGdnFsFBHbmxlYIFvGa1ToY9h9/tHaCTQma7F0QSL9g6alc9BkYhZjq7
JP6Fo+vPaG37hZJC5vFKJl/+eOUTgKtQj9hIp/L4OIFXnHqrfePU9UTjKlE/NI/O
o/PplHxxcjKgj95POYm21tqdrXhyIaFQJ+J5tRVBms2WH/Uypqw=
=5jEe
-----END PGP SIGNATURE-----

--fulz7omgvjqhybx2--
