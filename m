Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077A364A5
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382965; cv=none; b=grv5g3IXSfpTSuYROAA6OEKsu9fIy8fNg7fq/tAcyS4pt+xSffnC04zjUR3Yt62nc80QG3OJmR8O3rixoZp7QpuGGssrJ3rQPeDI/GVzAFBIinD0JIOHzgPcAVPNoUi88MkQiZrpIXPR4p12NprhaLx07fxEXeD9yUrxSHuU3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382965; c=relaxed/simple;
	bh=g5eXfzmytvxfDxP8GFwtbKC0nba1kzME/CxNG4AQwoI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5XID7I0fda/a//RtPQlv57OfftDdTquFflB5PfjiXo/u0LV0nfqLOHQG94b48gLVSTIl+SMxg/t6G6542Vc2Hjc89Q3l+mZPil8mvb5dxFam83M2vRwtmf4Wkmjs/moJGNFJuHnpCp6xBaLZkvb5TKgt8YbXhpPpbI7qHZvobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=R2n/uRl6; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="R2n/uRl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1714382961; x=1714987761; i=christian@heusel.eu;
	bh=g5eXfzmytvxfDxP8GFwtbKC0nba1kzME/CxNG4AQwoI=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R2n/uRl6NaJP6rXLNpY36CCscTUZgGDaXAoHP+1epKWJxmjMEf6t4JbQhrcstcc5
	 2AfTQld7hBZfg3g0QZTXiNRtNNXkNVxJYyqQwmpRDmpIZLbMau1uFdst7SiGkuOFJ
	 Jeu7FQihlm528G90uekGvITDucwJt1EjqP3gbyHkGxw2t01PI0K+11KP3pzdFsYFX
	 6AwWHaFi3Cf6CE1GsURYi+AvNYl9qDafdbPUnTCRldsJpMqlB6nAId4ge65TMebtB
	 rJAxgyDKCnZjwpYI7P5p/yT67/3ok4VLIBj3/nG740AvNF879tmebDqRuvtHm5RUV
	 ajun94mWSnKA0XX7gA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([147.142.150.157]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlfCm-1sRNgC3UkU-00ilND for <regressions@lists.linux.dev>; Mon, 29 Apr 2024
 10:20:46 +0200
Date: Mon, 29 Apr 2024 10:20:45 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <dgzjtlv2bmszzsauw4oeqojru2gbfeg7gnov35nmnn6wm6ctid@xbhom4ky3bwk>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qeava7pyatc43pt3"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:STbtDnXPwovU4HXJ32Jwh79fe8c7iN1aaJzh7mLGsUdJgRwaXil
 cubVJcNFuSMZQ1gqTMYvEUhoRtHAJRJHkl4c4tMLCYFdrJZ+mmMGOyinB07uMpYFundoLnX
 oIVrqIGpDvj/w4/o+JUFB4qZz/JQs9p9l+cfgex+RDGKBRBm8PKcQLfmJyxKjBWLg4lz1sC
 adnwSBZEyRKs0G83FM5NQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EB+B3H0xFqQ=;/5fg1Nf7uNxOIEmpghajiXq+y9Y
 sEl/aSooKod4waEzBoX2dHv6ArbtLpKJMp0GvXUrVLh6NRpgxjiVWQ5H0Ln+r2UVhpzugKaQ1
 fgdQ8O8tBwUEuwdLZTOmavbpnlRv66cimMlrZTp1gmYs4qPIPHQ+SOhNr71fpIVcwQckE6TWk
 RSGv06try3zhF5ReF/Nd6s1U4GBslKrXYFtUELPT/uhS04GV9mCZzcEHzGtk7L2ahA044aYc2
 40E7kQLsoVCGhbL5ZR3jBsmnxc8HPMjZ9tzKsexieSB4kHL3rBYhgBpML3pibZmZAN2Zby6tx
 gvakEwCBH3niQ+X5ZamFW2yd4cgZYEBgElFJbYgA+lDrqS5/aYpmyHTbCPPjZFfPNKnwruJWf
 WwBJDbbqZKoUNhst7y8Al3xB8uN7hr1YPU/xwjWWxwB/cjbg1biea/g6cUEsDPIRU9uV0prj+
 oHbs5Syghrh08hvmtEZMewn3ldJM0zqLJFYt7JaJdU3MPG4cwTA9GedlEF3c1LB7a+SZ7uXwD
 WJ3JOVpSBD/cOiaupFE3SAvsiKWuZ+AFGbv3IdQ7Jk3bTz3r6QsyUErCWqsCrZjGxSuiU5zFO
 FjahPsutDeGOnM2284bQaNaFd4Zor8NJs57LGwRKoG4/m7tmaJXCJJPoxjjKwL5Bf5L6MkqPx
 OEo+62ul8eYys4YJL/raOTe84d9mwoREfmnvN4xIF9zVGt+UnZywyYzfPsdMzqfzSKTo/mQMD
 whKyQ8LhuGZCIn7k2Qq0vQragzbq14rrC0bN+fqY4OFZ9v6vJ7+p0s=


--qeava7pyatc43pt3
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

For some reason regzbot didn't pick up the fix to the regression I
reported. Trying to resolve it manually:

#regzbot report: https://lore.kernel.org/lkml/3iccc6vjl5gminut3lvpl4va2lbns=
gku5ei2d7ylftoofy3n2v@gcfdvtsq6dx2/
#regzbot fix: 682886ec69d22363819a83ddddd5d66cb5c791e1

--qeava7pyatc43pt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmYvWF0ACgkQwEfU8yi1
JYVZyQ//ccanUNAk9xWd+PnCHbhAzv/sTCEEYcoVq/VncV/SXdQEvfsj/Q5B9con
ee7v2qE5kdrqZEAJzNYgjCUZC8SIKggVlvKyeBGTJzOLWOj0T21y7Ng8YoYQHq/0
lN2iQRHtBXRAZ3CL9jY7tjIYDEK5wfFE012zJiLmN1XZJRQGFVtTYcGETve1OccL
hwiz5oN6LhGc6bmE7YIh1oLmgvK8kJeAMCN6hBCEuH3VIFbZE8IAuR+rGbLj8x3K
sWRCbd0NrFfLKFtG7cE5C8mew33rQFxBdU/lo0gyz76kNkMC/HSlGrO/FBByD8HJ
5cYv1jxYFezlNmamgxDsL8xyTwdrL6mTQLEor345mE0ktNqtcxtvhHCDssTl0uX1
gkbO49e16waIdGILLzKSlVum0egcCaCmdNIxZYuqyiuSIFJSgAdBfMcYJSpkl/kO
zihXshTqeoMYEZl+OHuL7jwFVVFPf5K64R8Ww2c3FZ2/CbDsf/7T0tpUEtnZuUil
ozxH9CS5dq7z/zOgq8LH35akw4Pc9w9LzvJRjgziJana5PRW9gjk8zTNXoM5JMl3
kItuMT9ipGhmxAOciQcvBvVpgmCIbuV7dv4aU5JgOOBpV3Z1A8wY0O0YNALuL/Sr
498ZqFyoUDaphcGYbHtE4uolInAEifs5gPVhmseJeYivjCYago0=
=8//D
-----END PGP SIGNATURE-----

--qeava7pyatc43pt3--
