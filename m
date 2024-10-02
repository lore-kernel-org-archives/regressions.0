Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6AC433A9
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727896234; cv=none; b=c8pgvD0aSl0qpRWCshIUy84TUR/aPUUVZ8u0By5iM/19qL2ObMsmB5Mzk6C/PriIvmjpxkGaPexMHWDtRWntVDDnEUzLa55Bv+cqUqUB/6sX/3rQtb9sPEHSJLM2SCrRK9gl/bp6tzGb/pdUTR7EffRNrHkPhEdH+CjOs524FUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727896234; c=relaxed/simple;
	bh=WzOfzK61w5NyvyPGXCkG1DjULa0zo8YN0MVy/vryZNs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CU3Se/5nwLTmEx7mLTxOhOD/ZNEQiW+EwQAq1xlTOxMeIo9xur210ACAa8UAImsEPBmElJ4NAuX5PJmyBsS5CnWF6fznr8jzqQSMtd7qA2CGrKb+JtKcd1g+uq0a/D2vrtL245xN5OPa6GXrpqbMRLJBeaunJYK88a8Ep3yod6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=TCPh4Wd6; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="TCPh4Wd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1727896228; x=1728501028; i=christian@heusel.eu;
	bh=WzOfzK61w5NyvyPGXCkG1DjULa0zo8YN0MVy/vryZNs=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TCPh4Wd6xEfhaeKWtannTTVSSMGxV955m6XTY7WVEd3uoZUneNm7RHVtr23mKG60
	 zgJ1C4HgR1mBI4uV4PF7lsSljstZIKbVAmQZxD3HSeuc1As8Q6HEdejoSmJvv6QqX
	 CjCj0epY31NAQgqlPbaaehtIigngeV+zkVLAEpQtA/d4HSzvDotad7gtcDSMEKqfO
	 +VcHSA4MO0r+oKdgVf5eR244KzTFC1UjVYSO5patyVLfq3iy4YyBtf4b1VVt047A0
	 QWktJzQfXGN+UE2CppNcT6dhvq2XnP/lz3cWXlqV3ccrrDEVsjwx2KZmPvXjsmtf/
	 Ro6clJxYuNdJwXgbBQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.149.59]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3bjH-1rwiIE2bMB-016KSU for <regressions@lists.linux.dev>; Wed, 02 Oct 2024
 20:57:29 +0200
Date: Wed, 2 Oct 2024 20:57:28 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kmcgexion5w36hwj"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:N6+eBCD+pjj2SgQJpZQ0WriL/3QJSHtx0aWv0zP4Kb6kD6+K+e3
 opFNyKz8G9boJGewvv7c5/UiGwcgLKuPmrTsPVdSsXIMv5W9tbUINPQC47j5LmmDUMt1oW0
 JVQcLMJy/847Nx5tvZGCPWzK0JynBsjEwrvvyk1qVTj7bo9zfg+Pyr20hVnxumfusYPoScS
 xH27bjkXahuLSfGybHw+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pBFlsizlqJE=;90BXF+FrXGM8zYzynw0ZazgEZqK
 bblgq4MXHdnJNHg0HqfxA26kCdYe1tcBVvK0/ce0aKTiUl2NBryaDCdiHvt1v2BZDMdaj1lN+
 Gj5faW+GHp2itHJsOLYlrp9dnjYwUhP73bPMkMiyw4OfjYxetos6xWOiZTqhDm9G+nji9QJco
 S8Wu2CRZkN3aLb+daSUoiYh5k6cDJaxHObmhnflmrfKXwX+rWYT/H2cbE+YMJujHgW7Nhjiu/
 mSS7IZzBz8zMuGJ8imPaWZFMAcPbazWhie4JDAg9RGpHm1fK6lxvhsJOAG40pWfV1pq8regQv
 90kLUM1zlXy/+jA1/IdtjmRAqIkzkxsKNHXqmEv3p2pbi8FOmiXFroEjizhcyrPJBzEiXGUNz
 0fx14j8cPI+jSMv4cTPT4gmXF0AivqnArkwAmcPFWZApFO++TURWE6+ThYBMLvm+to/XhDsql
 saXB9CeU1Bc0kWgI5LOt+xv4TxM+v4aP705uRq28zsiwNwlPGRQZUNetO5r6ReJCpzSn5UpFr
 wPq5dzNuYSY1r8kjkbOMoFoZd55VWuyXwT7xbYuLicHyUsXNFrFANPCJtyzMOyEpZiWs3u0wm
 IsEjEavG3YGtabWcK3PoDfoLIyHFBEiZXvpbvSWYvooj2CzCEh2xq8Q4YYseL9533WbiBLs/J
 nrgbbnjLPxnkhIyD9tkDH4QFwrBaCGKzAZtLZG0d5Rs1P8p0CWdGnLg1NAfOrlmjbTuhbsZ7Z
 dY9u26V+WMvBOKdnX3WcTJxr9xD5IIi4A==


--kmcgexion5w36hwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com
#regzbot introduced: f1bfb4a6fed64de1771b43a76631942279851744
#regzbot title: usb/acpi: boot hang on Thinkpad T14

#regzbot report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@mbosch.me
#regzbot introduced: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e

--kmcgexion5w36hwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmb9l5gACgkQwEfU8yi1
JYXiQBAAufjCL8xk+Vzs2fR2qefH5KHdTRPB1c2TwlpZI6dD2f6RDUiggDttcGmK
RuYgGHEF2YtKiYAPh44rdY2Dky+38srhNc51NvvNNRPG3/5kw/t7/Dj+UnMCOaAg
HGTmMYsyNjxYZ6zbJgJmLPsp7juqXkaouBFYaoEX2EtvFbkQpucIuzVY58VJHKaQ
wq6A/QtZxM2yyZyOcc8+NTFUDfPcG9zT23VNUWr4c7DduZMvwY+dvMBY3z5iQv3p
S6yx/SQ855CAjkIgR14arfVoZ3GYYlS5jUIoX3c1hFfhNnaS6N42EgEX78S06bh8
1WkRMALh5+RrSG5Z/62f0yZfNVvTwiyIlVaYBsl6LdgF4APeYk53tWYnukYXGohB
H02SAg5DVFWSzu3ixbkHk1C7nBta5WKY5QYjfdSPcvopdRUAPrJ1G1GnpRKDfKNM
OUV2Wqyu2y8c3rBc7+f0PGRMZOrmbnkoD1zBY8y10aigGkyjHysy1aWBtHmycd59
Qh9Ql6Am3tyXbi3de4qMwUb0pUYEOfmts11i1Xfm7ZW+VhaoAAHb3sgxFCWVeFcP
3HRURjon1kJzXHojW1FBDp+IA23tTGf6lxX6vpzjzq2Q54lt/wMEq3m6q9OUaUFV
6pHmGvlyPHQsO4/zg6rhsPrpAsmhd5nkVFd31SZMth4ZchuNJqg=
=zw7y
-----END PGP SIGNATURE-----

--kmcgexion5w36hwj--
