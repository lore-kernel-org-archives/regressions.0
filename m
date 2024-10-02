Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567019580A
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727905185; cv=none; b=TOFZFwSYbdxzXNoOOXtgGNGeGWXVzD/AKEt5m0Z14O1CsKA4oK4UHOuIKgmhA8vDVr66nAf5KLzOLztND7i2xDSG5zo1Z5HNAVNmQdZl0/nOMFfDDL/ES5S5LZ97+m7j5rWjEAO2SREbqjvKV3B2+ysARJ2EjrCRxHR/iaEufI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727905185; c=relaxed/simple;
	bh=nh3EDzNFEQKMQ54bK8QeYQTFHlMFuPDMgqScS0vlh4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcbAJiFNq6To96T5pMnD6e9ZllK1AMx1n9VCrwPysX8RRihuGM3KpFelOxqTJg9S97KZHafDOFGYdDVPZE/2i4B9OIUvdG9KDd1OzkR5+cpmT7d6xI2ztgisPxkU918OHMS/dnqd1TStdvlVmKRUnOAM+zLMl/aodYXkYn2DdIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=vicR9Yo8; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="vicR9Yo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1727905178; x=1728509978; i=christian@heusel.eu;
	bh=/V6fiQgVoMCWMmxF32MZFQSs3bjrYimtBF0SDOOIe4E=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vicR9Yo8cjlkPIs7Fh2hDNhqgcAfDxdj1Tpe73J3ZKTUc4KibGMI1D9BfGEcpIww
	 gxYIU56WqsTyIATFLWZTY0/SdL2TiSY2p9C5Bgj9qETCtO36Z0KiKgTcZsiaABdIj
	 9hHxwx+SZFnO9zcyqrjqry3E1w86VVCx4vyGdWIlteftxY7X4CimUZkxdVUE17tZy
	 xBKSMarEZFoV2GjdHSuGqESkERnec6BbSMjLakpRw4FjLmg/zP8F6v9YpQO008N/l
	 /CJcfOKC3s0gTKkQkUeudRrnUUFdWdaSM+vnCRWrsANPHNRMOsrbT2pcD1rGze3vY
	 boJy2KIQYb9PDwCwfg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.149.59]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJn8J-1sc6aA0Vuz-00LHlg; Wed, 02 Oct 2024 22:57:07 +0200
Date: Wed, 2 Oct 2024 22:57:06 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <7ea8c528-6ee8-41f2-9dff-701579464fda@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
 <57da0956-db6e-47c2-b489-404795c3c6bf@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6xghz24qxuth6il"
Content-Disposition: inline
In-Reply-To: <57da0956-db6e-47c2-b489-404795c3c6bf@leemhuis.info>
X-Provags-ID: V03:K1:MXu68YFBzvUYdvteB/L9nEK1NKKPyVCYxc4Mb4asPvmWEsro6om
 aNV7z4qzGbqpujRFf/iRpzgpKGhphkqe2VzcbuAIlhDhbEH+QhufbVP6SKaRghGlsCZbH/r
 cdxc/YA5W5qbC0skNP+KqgqUv8Kjxisdb/3l+/nPM18w1oNN0tDahUGk4tTCZAa9RvMeDny
 klRQtLuwpQ9oLJhEPA8uA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZplibJyvMrY=;2HBMpjAywT1q7R6rDTzs9Fmq+5s
 5Ke9F8mAwpRTrRLZ3hCDynTmZ8DjQQp1FglatqyZv28b8g1ssTgfZt0YD6nkAB49YBqyn34Ph
 mZT8utMXIWU7U06hjykgkVkotrFDIvVjojpvM7quSl/++zZDLQqv/Q9lODDh0fgcgi0ukxEc5
 bTeoyfkgV+ysmRjKtXkCBgiPXxKKRfLxQjdLpW5zLbEx4dzBCA+bzLNN19Ry7L0DQNwr4wCIr
 5339g1U+xjJ0OqKrPfu9Fs3jAQedMk61DHQfTRuHi/JctMvqU72IAhtsdw8vHpuKtqFNFalEa
 c4dv0Nu5z1khqZ/Kndvso0kAqVFXT+pbP2K2NgIdbM8S2/gQSBxMQqyw12hJJv/4q7an545Cx
 fZvTD+/J0JoS/e2TU3halGL6hT1wvGtMyx80TJvj88eNANPGXiouVPkFpNO0oF+t2XY+9On63
 SwrrT7h7nfPNKJJubS41VWyB7SDmXcmehZgfsDVS7POLIzwJXslutf3TrSqJMV7APJa93fFHG
 P4cEpXPOw3i1CXEMTAN/cVN4rqqMeXEiDRGd2fsn4Zbwhdn4yoC5/aIzMw2Ry06XnQW5IO0tZ
 ZqRFeuowASAHn+krm+bmgCebmAYGfQ9mri2bj1wJ1q7ZX1SvBBGb8pnvl8/fZeBDCpLsHG1ZJ
 BpHEh5aRjA7y8BCwJe1n/eJhoipMRu2U3PjIEmzljjKSRMcmN2MhTXVHozVEPFfclleiCbjjp
 QV7unHsQAtyiE45BUpICuQU6B8EwR6p/g==


--d6xghz24qxuth6il
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Thorsten,

On 24/10/02 10:13PM, Thorsten Leemhuis wrote:
> On 02.10.24 20:57, Christian Heusel wrote:
> > On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> >> Hi! This is the start of a thread I'll use for updating minor properti=
es
> >> of regressions tracked by regzbot. Consider telling your mailer to
> >> ignore this thread, the replies are unlikely to be of relevance for yo=
u,
> >> but done here to ensure a public paper trail.
> >=20
> > #regzbot report: https://lore.kernel.org/all/cf45e722-144f-4d06-8dd9-2f=
7f54283fbc@amd.com
> > #regzbot introduced: f1bfb4a6fed64de1771b43a76631942279851744
> > #regzbot title: usb/acpi: boot hang on Thinkpad T14
>=20
> FWIW, it nice to get some help, but if you want to do me a favor,
> please wait for at least 24 hours before adding reported issues to the
> tracking.

Will do for any future reports!

> Often it will turn out that the regression is know already and a fix
> already pending or maybe even mainlined already. And then somebody has
> to tell regzbot about the fix as well -- which in the end likely will
> fall to me, which right due to the lack of funding and available time
> might means that the load gets so high that I might have to give up
> with regression tracking completely.

Oh no, that sounds like I'm putting quite a burden on you, which is
definitely not what I want to do! I also try to stay on top of the
things that I have added to regzbot, of course with varying success.

If you're interested we could maybe synchronize on how to make this a
collaborative effort (via mail or some conferencetool) so it instead
makes your life a bit easier. This might especially make sense due to
the lack of funding and time you noted above. If this is not something
you're interested in this is also fine for me :)

> > #regzbot report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW=
@mbosch.me
> > #regzbot introduced: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e
>=20
> This is likely such a case -- I even replied (which you might have seen)
> and deliberately chose to not add the regression to the tracking,
> because I suspect the fix is already pending. At some point in the not
> to distant future it might make sense to add such issues to the tracking
> nevertheless, but right now it makes things harder without any gain.

Yes, this one is definitely on me, I missed that there already was a
report added for this commit .. I tried to mark it as a duplicate in [a
follow-up][0], so I hope this clears it for now. I'm also not too versed
in the bit more advanced regzbot usage, so I still might make some
mistakes that are quite obvious to you.

> And don't worry, if this turns out to be a different issue after all,
> then I would have added it to the tracking.

I didn't fear it would go unnoticed, I just thought it would maybe take
some time until you might get to it with the upcoming holiday in Germany
and related work hours, but given your first paragraph regarding the
funding situation I guess this also was built on wrong assumptions on my
side.

> Ciao, Thorsten

Cheers, have a good one!

    ~Chris

[0]: https://lore.kernel.org/all/143da137-db62-4357-b342-594a86b9d156@heuse=
l.eu

--d6xghz24qxuth6il
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmb9s6IACgkQwEfU8yi1
JYWg2hAAz3CURk+uirjkDFdsfucqBMg8tRl5LfkY1WQQeNjl86B/tYotTjrndgGh
DyH8aCDeKMR3z14JZSCstPTZWg8VGKCTkWJVbw5aLLec/2PHL2zBCAB5o/cSFXbh
qZXw4wbKf7bJDqxUDZ/kKZv2dWjGqMHmDfRLkzI1fObC2KZfSf1pLVe05LRh1VBu
VHHhgEj+xxlEWwVIYMJ6JC17Mlr6QuQov7oJY4iGthcit4pQIajR8ajzAVVaAu8P
EXi+eWOaPzIOidCKJOTqyFI+KCY/fNCa88lHw80KzykaYB2RNhvd9JO+kfdyCLMY
PI6qs6Aqci5WDimc0FUoiGvL1z6fRlMy5K/66qcWGJYqG0VRp6TUg7tB+vCUYBZG
5htN4J1FmFeXQz9Z2XmnXh9qIULP9ZbnRDTnM1/N3v4TlUHyZxEmPVjvXizsHsNV
hTzOz07KghCvPwX+XSXwf5XT46kpqx2sNn61jILX6d7ZQW34zvPxoRD7BsiXNYMY
O4btRqKDySnZ0zRsBCdnEGX6mh/x79XriSLnQKdAKAe3RlxvWMFdxJ8GoWpmhq9r
srZ7CpxKgddmzPVSjkyVFu19wsCFobuWol66bejWuA0RpnMPpveRvK8uLMmQjCxM
Zy/zitY/s0ZmpaFnkUehA9ZRDNLlb7jnUGdVmHKCdrXeadN2jMY=
=ul6W
-----END PGP SIGNATURE-----

--d6xghz24qxuth6il--
