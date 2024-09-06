Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68811E49B
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628369; cv=none; b=tKEoTNjdb03ynQmF61ZkAvUii74U3E9oI8JlAT9gAusV7QZWz6/FIq8S7oHkxYrvm7Y0MolNODaWiHWrJGprfQ3JcG5fPnyp4ipY7DQSO64calo48kqSITh6vpSjTsUXktvMMFQLh+cIfnI5QtbMBxsuesbaXOWQM5Q7zBg4thU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628369; c=relaxed/simple;
	bh=XqhYopJ5NvACmJpib0oHM8IjOYOYp2KGtxKLqFBw8LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O690BuQLQNRiq1xPq8O7A0NT5fzZsmsEIb1hXl/X/Ukax2EoumW76GQE588/PWfrmDaM9orMK0VnJuZjeYSffKOIyI8+SoouX7IEG4DkFwslDd+muvN9n70gSIPOGzYuXC1p8Bsb5d9xF/FtcJ3cGJcxCV0OIiZcfooQoOOxxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=jjxmQlka; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="jjxmQlka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1725628356; x=1726233156; i=christian@heusel.eu;
	bh=XqhYopJ5NvACmJpib0oHM8IjOYOYp2KGtxKLqFBw8LY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jjxmQlkauAH6+85KG+OxSiKNcVNb5TG/eJl28ktvriYwFr4uBO4RBWzs94m2tcUp
	 /h0sQIBUPBIPAwo15LPqbHoQrXtAmdsVjA3TbdoYzOrHCKTxbnEzs+uQxZ+8U8V4W
	 HKkPxZMkOdHls3rIyUYQMOwrdUYVYBniYfADtnRv7g9NBDSWWlpbACJREzGuKrkim
	 q09JBSGcpyjyQER+q5TDGY9atA6bjlQm40TWrfqpppUcx2phD5ZkVX3w/m5SYY9Pt
	 If8SNThQK/imCGHxYlM0o/cQtm/g+zP0/KZxR+Mu7KvUR83hR6qCBHd36CfLLnf/4
	 0hcX9HA0qBYKBYQU7w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([84.170.95.40]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0Fh1-1rrxNE3mLP-00yfSB; Fri, 06 Sep 2024 15:12:35 +0200
Date: Fri, 6 Sep 2024 15:12:35 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <1a7da95c-1d0a-4d76-9f46-6085b456dd30@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xg3m3gp4ofi7cgrm"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:kC4jsjzQ5hlJ6ifHLAbPzGFQJu7kDyZBk1JlMYZDZPJBuzgMvcg
 Dk9OwaFLzVDVEjdONVtXEVHpL+nBh0a/EHPanpq5rkuSTLGzFzF5/i6f5JFYUT/yvPOaPJC
 5kYNuTQ9X/CrKGxN4SMkIpXs3OXe+xp2/36gSZmH0HwAQ54/X6VyEvwpNlBZKZIg8/CMTH6
 +w7F/aLss9NUt4x8JuQoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7mX2o35JWpM=;CYBKai+X3stVS1IrmZ3XY8xrez+
 ivMbS083tr2yRvWAvnF+dHXA3wMNKk1AJwsDZqX9nMeRndxKXgQodi90VX6YWFztszXYFxOWu
 2YVL2qArakz/rP7XO431HCw060kh+19B246sLadTzPvbxERbViyvnKWemIj5E4O5E6HCIigNE
 hWdZSxxbUN2lHuMsXMf6njxqpdlVrm8HUxfiqjd4oEBmdzmlg5yMgoY3L7K1XmXFIXyVe0PoY
 WaaVbn8XhL6xMy4JJ3OOVQQGUyofH7bBEYkkcivYl0lp6MLRN5iHPXDitqpBdmE7jzQEZn3Cs
 ipWJcDREDdEkA46aJI+0AxTIA6ZtbjPGy/CNZXlTuKV8lHwvxtEDIFzHRAh46ucw7Oc5LuNdJ
 62YlxfK/+UPBipzfDdcKEiQLXNHSTfoIGTfB7O9Nshew0Y3mEvoahOeRD/NdLVb0KWvNhG1j0
 Jai2KeULHUH7nqlUVM3KaG28nWyXEO08OcIGhRAClgJcQ9uKch1jNfOnbQf1xpQWjrbNX6OBc
 4sOtgaIEeliVcaEzdDMCfeSkG7tNAJvMJjG3y+Gj7KomwsVwUMXT1z+G/SPiR0hth1VqPVPF9
 txI8yyrKrRq3dJFazAtIvXKHlDLuB+lHEx/P+bXC0ut0H4TlpxbABbVUW3daocdemhiEr7Jv0
 osaHhP/miyI+Sgths1gEWCcAzi045P3bdDMZGbQHSV/ghfPq8l0zHJP/6uaZJy+fPjfQNFWMT
 N6GZvyb4xvmOUtgEbmMWxitDbbgZFOlgg==


--xg3m3gp4ofi7cgrm
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

#regzbot report: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34=
ee2f98@linux.intel.com/
#regzbot title: soundwire: audio broken for Meteor Lake-P HD Audio Controll=
ers
#regzbot introduced: ab8d66d132bc8f1992d3eb6cab8d32dda6733c84
#regzbot link: https://gitlab.archlinux.org/archlinux/packaging/packages/li=
nux/-/issues/76
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D299158

--xg3m3gp4ofi7cgrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmba/8IACgkQwEfU8yi1
JYWXpA/9ETFvZuTybFlPfCbC6tVKgZ8lcMGCCsX8oK7aEtGinB6wrbo939caYIKd
FVxI1xffyFPBFm/JLmuVLMCODIseHn/1HOx6s1pKskcjQpcqFPZkNsEH291e/3D5
tf7eVKOOOBq7NXf1GMndLuDZJulb61DvVkc8XN17lHPtlVUpqnq7kUeyhw8XC7w4
MfrlQUV80umLJ7sTsP0pOh/lNfOzme6+18TRGG4x4wmJHleyo+eB8eX/gY6ZRwrd
ekLIpDINj7RIUe0eDCyy0DkN1CxqYrFyRj0UfvvltThGuoL+ytxRqpovdz6eijIa
0BZgQHfBATWZZtFbdkjUO0OSKeznN4QteUEbDu9yTCybcugc74joOCeNf28cj5Ae
bCPaFsRkDL0TZR0q3q0y35vazZlCuXPxCKKOxexh7BWaIIJMVmIYOBn/OCoPQJd/
FFygO/nTp5GjXdzT+Rg+cmk3Pai3VB0vC3M2N5cv8adXSWO2muwLo/XFlmKPfqG9
w366pHTw7vgw+tQLnDhT4j10PrDM+k1gw2lKbP+j/3ao65L8cOYtqMvLt18QImny
EwPKpRFAKaTVxgvRAwnU2wMGwE2tDmHXlIaggG2PTEXBv6I8BFi2OaUcMnAczB59
osrtwLJpjaTnVz5o55O8qAuyHlDJEHIvYGlQNDgozDtIl6/hCSc=
=iw1l
-----END PGP SIGNATURE-----

--xg3m3gp4ofi7cgrm--
