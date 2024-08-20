Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49C18E351
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724197766; cv=none; b=kZ8nnYPRC7GPK/fYsXApsa3k2PPmUYKn5z6wzoHGHBliRdCThe0Zb8AIlGv2kcpnrWqlXFNUG69nLI2jD2K1UWOVHVg6M/rTYajaxCqF0FtTLkNsVEIWrdxdtrpUWB8uQ9Kggi1vjczArOjKpuLhFkGKU7yLp7W1SeHr8guu27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724197766; c=relaxed/simple;
	bh=3xXoEPw0QvtqxRGoUrCgC4DZMIWpcqUSeNKklTgjsGQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzkIQZiK0I35SRhymVV0JOcS4D4tO72HyeqJs2htdPd28bYF98DLG/YsTYblrLYS4xZ7S11i5U/YQTNDLAeLJBU/2POaZChtb95DsEO7QdFsaIJUDhYKU0oGrdCWDnDTcpRGCM+u7otDnV/jkdrhlEOJaZKQ0WPl1SVfL6xm/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=QKRrzjLI; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="QKRrzjLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1724197755; x=1724802555; i=christian@heusel.eu;
	bh=3xXoEPw0QvtqxRGoUrCgC4DZMIWpcqUSeNKklTgjsGQ=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QKRrzjLIMv3oK2TsqoMjraGbzo42lk0SdJwxYgSbP0n0vPVt3PBGgV2XT0POyDSM
	 c8lZ0OcMdNzr2TfBAR7NsRBUikxa+Q5l9XkXS/2IPIiEBnenBWGwj8xbNwfk3LA7g
	 YErwg5Ls0dUD4tQ+m1HdbmHsoO+XZ+6ACCa7XFsQfpMhYAUcgx16bA4vkIp7cDbLZ
	 kQhoumgqIhO8hSaJd98B+zb4jBvPpc8u5ZeFrC3Pb/ngCK1isyspC6vwRUJMaqcGv
	 Pqcm8FiwkYLn9UzQbke06k5G4WhevUJbm+6syDopPxWGyGP7/udjPpIGENqIqWABw
	 AsXrrcLPd/Vjcv/x9w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([84.170.90.59]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MhUDl-1sCBaa091n-00pgtu for <regressions@lists.linux.dev>; Wed, 21 Aug 2024
 01:49:15 +0200
Date: Wed, 21 Aug 2024 01:49:14 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <ea930a4d-1185-4b1b-9bdd-45005ae88872@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h5uiyn7ijaoxwjer"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:FAAS+ft0/iuF+avHyKPDPzLW7Q3oy/MR5Dir6tv90QCOVkv9A1Z
 sEZhXQqCod71j0yddd8LtJRgA1DcP8DV4Qv51sxpA9wIDQh6w/RYuH7k2LXMiy2usJgl4Ew
 Lh/h1NaUForWMQ2f7pAbI7QYtu5ZKfJrj7VVozhe6pqFIBIIy+xoWxr7o2YibtYaL5t6zo0
 lgN9tiA9fxeSQfLufLnfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gHoHONgRjuY=;sdLCsInXyhm5oHxNabgYtYIX+7o
 McPBMUyF60CiCOZ26SLq0LfvI1hNGRMHJc7676nfqlC02awsoti20NgbbDgpctsbKe2BRuejB
 nRJbFhSz/RZgzYNjv/g30uGeCkMI332L+GlNYbYTB0glUyiqsI4J/YPvpq3AuARaLz4Mvunu3
 H1RsEH0ov/uW/1rq36TmLHRRSDKN6osTsNb2Bhz6G725sY56yBYj/7q8coFvijUe7S0Q1su3F
 BjUd62HGkrHL3AjAOnhpgDesEJ3OQuj/uol7cx5ches5Nt3j5JdTY0XWJ88dqyP/DVZtus9Q5
 +5rxl5b8xMrB+thm73b+QC0mHaPT7l0C7n7s3LVwQZw5CLCQWR8YGxZFwTgjcavvfQkg1MgfO
 UoAobbkaG0bE9GgukvPJoGXUIShj6ot37q2l2mtymiHFAAEqycrFSR7fr9RXOwNMYZgmEc64P
 hJvdQetkRejbZna/Pmxy2OZIuTzOE1ddbQUZA0JLSSy5/+D4JMmhRMBO2lLo7OlqF1FajBslR
 0xjDxhM6LDN6nVmbFNE4wqvj6H0m+OdfWjW0mtomVEEuCElRiGyBIVAFC21/2CthI5zP9pWD2
 brj+JSB8tKWgkqdYtGKETd6Av7VlQIg1IBJs+amAUnoaFAqM/wuE3eM1+3atv703B5DA8Zh4l
 GgmhcoY3VHOpVqPxiU8BqKEyO6+2fNifBvyYsjYlRfxJRYNePAYuvcs7spkGZkyjOJDEqLAV1
 Hiu7S7z1tFlr1Tu5kBHp6q9i1e1bm9iuQ==


--h5uiyn7ijaoxwjer
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

#regzbot report: https://lore.kernel.org/all/ZsTh7Jyug7MbZsLE@mdpsys.co.uk
#regzbot introduced: ccfc8948d7e4
#regzbot summary: btusb: driver fails to initialize MT7921AUN on v6.11-rc4

--h5uiyn7ijaoxwjer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbFK3oACgkQwEfU8yi1
JYVC5hAAhFD0T+NV/9H7xH+YfYzqnSG+pg7NgZIJkjpaYyPn8fYeyyJexilcdrCB
tAG0QXRVvlu4yJxEJ/M+ZLlslW3WVM4JH08smy1g7qJ4cnf8vGSVBqngkeeU1ZlT
NzTJMNAGdO1hUi2dbw/+pyJCS8xSXjSK90NvYZLu41O1dURcLn9oXtmQYgso+rAT
tuGuq8l+2Qehy5LY0BqmgwtCmCXKaq9ZABiZRSsTwlE5dwrI8u/bgaTh0h0BXGsz
YbMhjc0vWwBmbZTTua/O6hIYFIPvWFferrvaQbqNf4MSHlElAqZTekdNMWMKn6yd
Gc5ZVd+ZeYPBWxhJVC5zVIeDaPwOS1IvMoRs7ygNfOnrsSW+UhPH5UbyZ3sduC8a
A32xOIJ2m0tDNo47HvmP+4gLDbcYoZ+zgdh/UazLheKFQ4o1yByw7Ld9V6zdc7TK
SC0sOz6jNCdJ3V1ABGZe4qdZ0XPQmWxFm+SqyKkvUcRlXtCVGr3mhkGzs94LgeW3
ouCvpMuGiEoSEChkwOBWFeCrUptx16IPD7qtteQiGbHgvgJT82wfuPnceA6LT/jx
x1JKqB3e8uyR2u0di2v88GhA7s19bxsBFxAZO5w8WS7j+56volHvv14/Dc5IWq6G
2EZFkmCCDm3fUYJkm26/ou4SBrl300H8vM5vcKWSBNEbZAZy+0s=
=8EWC
-----END PGP SIGNATURE-----

--h5uiyn7ijaoxwjer--
