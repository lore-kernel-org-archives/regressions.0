Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A421523CD
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 11:38:45 +0000 (UTC)
Received: from 213.219.160.184.adsl.dyn.edpnet.net ([213.219.160.184] helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1oP0Ke-0003FT-Gc; Fri, 19 Aug 2022 13:38:32 +0200
Received: from ben by deadeye with local (Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1oP0Kd-000b3h-39;
	Fri, 19 Aug 2022 13:38:31 +0200
Message-ID: <9395338630e3313c1bf0393ae507925d1f9af870.camel@decadent.org.uk>
Subject: Re: [PATCH] x86/speculation: Avoid LFENCE in FILL_RETURN_BUFFER on
 CPUs that lack it
From: Ben Hutchings <ben@decadent.org.uk>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 1017425@bugs.debian.org, 
 =?ISO-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>,
 stable@vger.kernel.org,  regressions@lists.linux.dev, Daniel Sneddon
 <daniel.sneddon@linux.intel.com>,  Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Date: Fri, 19 Aug 2022 13:38:27 +0200
In-Reply-To: <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net>
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk>
	 <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
	 <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nQrCdQRVr0v9wcLsIe/Y"
User-Agent: Evolution 3.44.3-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 213.219.160.184
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-nQrCdQRVr0v9wcLsIe/Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-08-19 at 13:01 +0200, Peter Zijlstra wrote:
> On Fri, Aug 19, 2022 at 10:47:21AM +0200, Peter Zijlstra wrote:
> > On Fri, Aug 19, 2022 at 02:33:08AM +0200, Ben Hutchings wrote:
> > > From: Ben Hutchings <benh@debian.org>
> > >=20
> > > The mitigation for PBRSB includes adding LFENCE instructions to the
> > > RSB filling sequence.  However, RSB filling is done on some older CPU=
s
> > > that don't support the LFENCE instruction.
> > >=20
> >=20
> > Wait; what? There are chips that enable the RSB mitigations and DONT
> > have LFENCE ?!?
>=20
> So I gave in and clicked on the horrible bugzilla thing. Apparently this
> is P3/Athlon64 era crud.
>=20
> Anyway, the added LFENCE isn't because of retbleed; it is because you
> can steer the jnz and terminate the loop early and then not actually
> complete the RSB stuffing.

I know, I corrected that further down.

> New insights etc.. So it's a geniune fix for the existing rsb stuffing.
>=20
> I'm not entirly sure what to do here. On the one hand, it's 32bit, so
> who gives a crap, otoh we shouldn't break these ancient chips either I
> suppose.
>=20
> How's something like so then? It goes on top of my other patch cleaning
> up this RSB mess:
>=20
>   https://lkml.kernel.org/r/Yv9m%2FhuNJLuyviIn%40worktop.programming.kick=
s-ass.net
[...]

That should be:
https://lore.kernel.org/all/Yv9m%2FhuNJLuyviIn@worktop.programming.kicks-as=
s.net/
(the redirector unescapes the URL-escaped /).

So that puts the whole __FILL_RETURN_BUFFER inside an alternative, and
we can't have nested alternatives.  That's unfortunate.

Ben.

--=20
Ben Hutchings
Beware of bugs in the above code;
I have only proved it correct, not tried it. - Donald Knuth

--=-nQrCdQRVr0v9wcLsIe/Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmL/djMACgkQ57/I7JWG
EQlHpg/9FbaeEJKro9Qcmw+qk86shNJCNfyfeGVeLs0aiM6KgDOp17SaTPzAleea
Y4UeZYgu36lGTPh+RnK9Llb6bJgqlG3ad90VyUO0fBcY7uuJF/uTxHtNQVRNYRHL
pqmH36qNzJ8FGsHYbl6ikhpIiw5Ail4js4WbCiW0f5eL8BWyAKj2seKHkRpIkd2I
eq8/Ux9YXRhGhGnPj+1XRhl/nqw7Hb1KUMjtGqUwKIjp/1NkubbzFnqRsQPL0w0i
fLi/dbdtepWlcg8zy6xKa9B1xHqfPOnjldD4G2CDLrpprWacjkTZIoHY2WJmqv4+
aU+q3XinoxZHODeqxD2DJ+r7TzJcBiSj+ypf3HxwR8YHReQVjUbdMLmMe6bXYX/f
EyDNw1OaJUaxbbEPQM1dJaJOLKGPHGUgKQuucMJq1R6kcKqhnLfWIoPBaL/gKbHk
xo6Tyg2WAMN14UzzDFzqTFwndU5zlA95J/Xi1RiS3muKdNkcpu33NnbEG45tpEiM
P+N/xqZr1dvJ9BYYWlkA8OAdDcSnmL9vkHxuzWuHTyh1gxnW99C6IWosr5sIVc2G
REAhuTXssLSMXsfm3plqmtPyXaJIm7vHSmB/d1OV9LylZOCOcqsGjmE1H0CbkVf9
dPdEFxXudTWbOb9965rEzhQYMn3OWsv6Ik17S3S3ZAdeo4hMDEY=
=P7Kd
-----END PGP SIGNATURE-----

--=-nQrCdQRVr0v9wcLsIe/Y--
