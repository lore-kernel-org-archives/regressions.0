Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AC166317
	for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720711559; cv=none; b=rH0ggeXsStFWGNvMeMI6QnV6QHnYPwmzxmu+Pa8OBe0RJwqAIoNWNo9oEkNpFYhkGsT4aC2GS0DGnucWZOhTjfz/SOnpUs1fYmQaqDoSQaydfc8Y8TgqRHU0lOp3Op+ysBvmofVrCUk7/XNQrKbDrEwLLSFzkOl8ojgF/jXGGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720711559; c=relaxed/simple;
	bh=8QFxYxWDh+5QE92/1KHtuX+530nNg+IcxrBqvUorkAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGWSMHFzjtHYU1phQarBtRAJi6TKzF3kzDnuRaWXTGSmSCjK1zCGoV2ue46yt1VtLHBCdZBRJCdXrSoW1qfUiu6hysLzyY68R0ENih5bFyF5tgrVa0PFSTjYTkekZVxvouyM4YaFhNRFQ3nD2tjf1S2tZZisDeaJkbyab9Dc7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=RkttleH1; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="RkttleH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1720711552; x=1721316352; i=christian@heusel.eu;
	bh=HokDd+hZRcfm0eI5jULh5zyog5RMgXvPsFxjaqhVOtM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RkttleH1SjCjiIw0yKALZOtS2zYqbBjoAmVGoDp9bW8k/CILyY8Lf2tolc0mPh/e
	 LL6Eb8qjDPWaji9uYHW2drlRWkGox6QXgjO+GyyKiuAM1wPyig0uALC3rS3YJPLha
	 cB8/W/dRdpibLf6sZY6ByabNNzpcr6OdwOp1SY29OwLNi9oeHgJyNoJ0IcbJdEWoH
	 YmfsMmDmFETYejXRsbezvu0zAVHsB7/G/g0a5bVFbg4Bc+z6i1Q6XkajvQHcieDm2
	 WVYFnJ179bgn+yS+XlxG1m+Si2JePk+0MIHtebmbe48Bj5o5X49VtZcc0sD7GRWXA
	 hZgUmvRLrCEaaNaIXA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.149.99]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7AEs-1sJy0d0XQi-017tF8; Thu, 11 Jul 2024 17:20:35 +0200
Date: Thu, 11 Jul 2024 17:20:34 +0200
From: Christian Heusel <christian@heusel.eu>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C?= Sebastian <Sebastian.Steinbeisser@lrz.de>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"pc@manguebit.com" <pc@manguebit.com>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Message-ID: <cda8ab6f-0c56-422a-aab6-7e98449b1d0c@heusel.eu>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6i6jblpa35jvrslx"
Content-Disposition: inline
In-Reply-To: <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
X-Provags-ID: V03:K1:WMon4YEFuW/cRgrBF7wbbhi1c1BDDgoYrzVY6m+nfSuJWUHScSu
 OvVZiHvkvf/GJCvIC2oz40YwQbkV65a79itBTDgdKMw1U6hcvJuRP5tLyY1M42N0EX4EE8+
 PvBUWjAm097mb1lhbc4QEwAvBWjML7k02mXnTtodYoqwBRltgj5HfON/hu2DK16PdrK8xwU
 S3XSkhjAqNsYMx9Ivz5Ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:98xR6/9dDns=;Z7PTlD2T/rsBK6MNvziKV7/os/r
 DkQg3jYgJTYYTiF4xP3OEwfHfqY9rnDNITe5tGWSqkQeehVNC+Bxpi2iguqjyMVd6CTlJCbjl
 BrTrYIN7y15Iii5OS6PdYxZWcgx8KTui9kwUaiUwRxFHO/9xz8c9i6CrBe5o+x9COTR3DtpJO
 Sp2CJJfZvgMvRXD5y+YcvzzsY8f/+Hm8HbXK8CKD/YYUuyj4FCy9pv7A5NyjmUjXIfLqmW9/e
 BQUoPeKKrI6udZU0s1/9FFfYsy5j0fdZ5RZ+PYMw0e34c6yXtSTjConRwsT1LCiSzdMAgyA1r
 HkUpplLwLD1d1m5torBQfji+1oRApCrIIHQjhp1uYgbXvU71kussw+IwObe3/ct435xJVhFm7
 n4aaekErnEtWK3BJdeBaP8CL2Q+r+hxHGKiumlN3hBsO7yP27yYNM8oTQVeJ6vPk3aCe1Zirk
 64uV0n2pwYLoBkiBS5FbskijmLIsSCxvP51FMnhusWXq8So9yFxe6k+ACff4oY5bQr9hiRIAH
 cxTI7F6I59yYRRuo6TbaUvjSCAz6KILmm8mIzlkMx+lNFVc3+1BrgZj233aRaAlrm/QaUkdSb
 bNCljlbVgLyTJPuzQ4HMnEZCI+isJ73/ApcJE/XkTbsjLtOzWNQwrjiayYRtYw6dm1emWh0IN
 4P75q8qWSmk9sPXT9DvoG4D5N14svHtXejb163LFQ+GC0gmLCM51hTAHdRRAAnGtaooL30VDW
 KT3Nws3Rc4ZEz4jsG7BJIa/Ij8zMDapgg==


--6i6jblpa35jvrslx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/11 06:20AM, Steinbei=DFer, Sebastian wrote:

> Dear Greg,
> Dear Paulo,

Hey Sebastian,

> Have you been able to take a look at the logs I sent?

It seems like so far nobody from the developers had the chance to have a
look at the issue you have reported. It reminded me about [another
report][0] about failover issues for CIFS failover issues, which may or
may not be related (to me it looks unrelated, but you never know).

After some back and forth they found that a fix for their issue was
already in the mainline tree (7ad54b98fc1f ("cifs: use origin fullpath
for automounts")).

> Is there any additional information I can provide?

I think doing as Greg initally requested and allocating the resources to
bisect the issue would be good, especially since the mentioned commit
range is still pretty big:

  $ git rev-list --count 9a49e221a6411..539aad7f14da                       =
                =20
  32044

As with the issue I mentioned before it would also be intersting if the
issue also exists with the mainline tree and only misses a backport or
if the issue is currently still unfixed.

> Thanks!
>
> Best
> Sebastian

Cheers,
Christian

[0]: https://lore.kernel.org/all/ZnMkNzmitQdP9OIC@3c06303d853a.ant.amazon.c=
om/

--6i6jblpa35jvrslx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaP+EEACgkQwEfU8yi1
JYUoeRAAw6MY/i7oZrGLMGNdXXhHuAUJhNHRyFFJb1XJ+3X9xpvY8ezfO7iMyLAK
JsZo6JumL11lwTjDaBoeq21sizRSzkkCAwYoofOVrwcrze/SoWimZl/K/sBhERRN
0W1iBXqb+LZtkDv7zZuzjbuf2PNl9vVNMRyvAcw20t2+GKY3jEW5jjvjNYCncPeJ
zEV925eW4A35hhHFWPQj1rI1+3fTYAhKuJmarfBG1qHprrScQ4tL4+3kNZC1wnKR
1CviNf7C4hp5aM/BZc2z8tM1K8p+fImvruKoOb2GGk0YEumzn4JYS+CPPrNoBSt3
7r/zz+N0bdP56eztRrtFLfR8TdhTXNkQ1Zb5yqOpDArsFxCe0TuTUNP0mxS11NRg
jR+y/0xzKyZcgJff2Z0jRiGaTTRcTKJu0atcQj0bVbDG7lyTIJhdWZOJgA1mBYT3
8z/95N7fNmPm2aYfYBn2pJF9/VUG17WKV8DDd0vddp2mlZrmHf8b0melEv94Chrx
z97+GDJ3REi7ndjaD0nLzL4D9bT15mDoXK8aM5NkXqcamm38JFG2X6IaFSD/IhGS
mgGJxPb+444yIVOhLqPaqm4ZOvG3gNIv/+BZvXB2qfeydFT8rqGFnVYcUjEO6Uim
vGv+jD9pnMY8yJSgLBcq86oZKCK0nflKbxNnyrzNNtcAoT13iDU=
=XCBU
-----END PGP SIGNATURE-----

--6i6jblpa35jvrslx--
