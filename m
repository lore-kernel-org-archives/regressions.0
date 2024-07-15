Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF12188CDE
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046915; cv=none; b=kuBDbwi1/QgXrSFXZHGYR56IhMtN429pQbcpicxA3E+wJtehGee0lT8ttyP+KtkzRTCqJv+y+rJPWm2i6KahD/fai3gb/WR9BtTASrJaSNep/bo8IglkgUWjbXlJn4llkK1KtRRT70m7/P2uyfVMfQcFv3FSIxNi5LwnEGflyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046915; c=relaxed/simple;
	bh=GMFmweos3YSHmk+1Hay5TdDhc6kRkVo+szxFDIAPlwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYQKuBwwD+3fsOUYXgsxCKO0O6LB6HpUnulLS6/xaUpQr3OQL4LteAEgSSuKYKIu7to2x1OFr19H5hcXUF2xaIiGA5IfyZVez4dYylrcBiF5qu98es1huUMWM91ZLmeSYYj1CfSKdREvfV1BE7m9jdQe5Z6vyY9CebVStLZZ+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=NU/pUb7S; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="NU/pUb7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721046902; x=1721651702; i=christian@heusel.eu;
	bh=GMFmweos3YSHmk+1Hay5TdDhc6kRkVo+szxFDIAPlwE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NU/pUb7SjFWQpRu+6jHm/cR2dy71uOguXxvxEbZcnfA1SkuODTNsdcn7PjaI4rCe
	 vm43nR4KwXs9/fM80ZAh60BI6GUl7dOjNpVYxM23u9MG7chXrtRKWf9uO0nCxLMmR
	 RnyCRuEyYw6oxXYdJDxp4AmXbGJzsHK3rV1ICXHQkvDPau6ZMIYPBi0qva50CzOiE
	 aRT6wX16NXy/OzeQ1//QSjh+P+4U5l9XlzAeJY1AsrGVM2XvGSLiPey180F2Jzs+y
	 aQaI7jk0a6WlAoVx2Q8EUx2EL22sfnQvCyv+1d96yUoO1vJb8VjFZxwUjh3PTP4ph
	 BB9qIFBTHS9vqMqQqw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.157.157]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mnq8Y-1s1RwS1M9y-00nPgP; Mon, 15 Jul 2024 14:35:02 +0200
Date: Mon, 15 Jul 2024 14:35:01 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <3db7b91d-2451-421c-8b36-8c05f5b18710@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sl7ia2bcrf44xy6p"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:FRKV193rzHP6EQRug8FWAamrfX+vgT5rvz83McsTQpY6Nqma2Me
 36L5czZbK4JQetO8NEUxvyzuYRcggm00PLtFV3MQy2BIWFUqyTzEHYf/bRRF8BMmwPmc0St
 6KN3DbB4wzozvpxjlaI1ml733xzcwaHbpIoDcHFSKahxsuPcDKwh06PLqh0Rn1exZqjt9S1
 y4RgRpoqvdEyzJOQRQFfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eICtXIwQmTk=;ye6g7u6RR/iE730HcSwYr66BNbM
 8KJABHeIYTNu0g09/bia5TTJigVjdt64LS3WjJCWED4ZsuZDGngkf4UoM4TLwuhYI8pV6hRJ4
 X7LZrha0+BaEjWpHBjZ3A4tuezlsfywHOJ4QNMWoeKfK18kAYsTa5nlWtCno2WKqpVH63XL72
 caAG8qRLuag4Pj7yfvCSasKQn5QffyKCDxYm1ru3cpeXiUqbaDXuyK2ioFfFEmAZv9GwUpeX7
 83YI1wetZxy+8sSvcWQsXDkUP1tR4CnlZxWRmx4MaDLrTOG+7H08t4hPMi0zMR0odmcCI6ftm
 9RHJ47PSjdb5536P6yKfouPGsZr8Rx01BZVSUlfKBLT3RIm28vo1qV36ceT3amysmgQBWxw8l
 AJglsBzXhTl6S9Nd0jDNYaR6UEUSfkF3Ypol5rFoHtdx+qRe1aFJwFjX8mztok5hJN4IZob4D
 h1qgdvhGIaBXHcIZxrIySHcg9rYp3mUZERkFx7rggrHj3ZePG7QUhqhdclQj4hGK5gVJNV2EB
 NH7vfqfdMy8gtSI0dtbUDvohlrR9mbJ+EDiy3VDBLN03yy/ptoumf1ijVMB2Mzl7XgZpewCKD
 7umfynrWnnekG6KomtTk9zluWxpYE/LaA2B5fQxbLSyumYxNx/OnHYrNmEtDGQPsFbNW2jFuc
 oE5hQ74T3VW6r60blJC0nn+s5YAvZalOFJexaTDzJWJtk2EsxV97ndtl+0mXJpWAK3Nd4pYCO
 w7y4rHbET/cZzr1BXux359g0E3EyfGblQ==


--sl7ia2bcrf44xy6p
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

#regzbot report: https://lore.kernel.org/lkml/32fd8274-d5f-3eca-f5d2-1a9117=
fd8edb@redhat.com/o
#regzbot resolve: inconclusive: seems like nobody cares anymore

#regzbot report: https://lore.kernel.org/regressions/172096805546.8.1577268=
8283210394474.379370367@simplelogin.com/
#regzbot introduced: 8117961d98fb2d335ab6de2cad7afb8b6171f5fe
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D297453
#regzbot title: x86/efi: boot failure on American Megatrends 5.11 UEFI

--sl7ia2bcrf44xy6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaVF3UACgkQwEfU8yi1
JYV6ChAAxSXZTNjT1xH9OCXPY0WkRMswyz/s6mAHKdWtTEq1cALfyxHteEV7uX7O
d+xGbqdS02i+nMM6fonB+gdy8HIv2Jlwnx09aHu9U4EpjcxIqj1uHvkcuDrXvrum
+lgdgpOT7kn+b9Z4wDL1/snlGpRDGe8vah85A6YEtPQ7yNt0mNCeTID5FJsZG8MX
D3HuokBYh9LvC4KmLEbyKB7jowfyiTVvk9ff+FmBXwrauZ/Y3zfXOagsWV96N5of
KqB84U3+VtnV+AWne/w/q5fut8CsmsoiYeUEMGYojy0lBnb24v8uIEzss5HERaWC
L2UkFkjJfMLvyTDbno1UrSnO3bwKVXjYyg5AmNMGti1CpucTCtCmfHfveLYRjKF/
sadVE0hKoS2SSg5OD3kco/nQmDB3sBOC+grwUMg/Gb+dEqSqJoiHaaVCWKJ5RgXZ
6tw8uRacUCwAgA3zjiAsJEwrBKDz+vPR4a/ZlIHcEywOtlqGyAAtwOhOe93X7zT/
IDVDvIXI9ZbUW0Ztq9xJ2ncq6qdVu4drwBpjb6jDUHzjbxwyVXnPrdbol8cU4AwU
uxHPhZ1RLx6X6m08oDpfLVxUaDDpcXylNDhzG8eaZSKayqhTPxWlw2UbOo/xj2zH
5Nxtvq1H1Fr28Iaf4OOkQvBPEn1h+voxdrXJIfTK7z9XBFwsRSM=
=uGt0
-----END PGP SIGNATURE-----

--sl7ia2bcrf44xy6p--
