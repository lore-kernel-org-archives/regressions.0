Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B4B7BAE3
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720435902; cv=none; b=Q2DdwmkLJgguZ0K9cGSiu2nEpbS79JSK87onBIpyjqHWwsw3GK6kxFMOF/za6SwPHlDGXJ/QzgxsJxIpoj3nFAc4yQnk5YdcEZblYbPBLmerne/X/HGAlBr+o/fAPFNImhKfxNp+98gyxPsKUuPUo4TVlBQFA/3/xIRYtZogJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720435902; c=relaxed/simple;
	bh=W0TnYPLcDi2hTBgTU0mQfsOpdHfRaHNf+GyFDxn3wVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7bNVys140o2ybQvm7/Iwvks2uvNypLuyUGy9VTrF0U7iCysOlkYOER80aDi01twJzDVBDqCkcDLek9oQQOAljS+cs4+YVAldBrGD+g6skfe4r79oTU1Qk0IAoB25qtHDFYksx9LhGzisaWyRLZFtgOzTrUDWDkVzui2374truE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=aVWlnOL9; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="aVWlnOL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1720435889; x=1721040689; i=christian@heusel.eu;
	bh=W0TnYPLcDi2hTBgTU0mQfsOpdHfRaHNf+GyFDxn3wVY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aVWlnOL9RsetxKuUwiKRAVRC6Srag3HtBcmGfTyGbXD7rb5xIAS4JQn+VY+RG/Vy
	 WsBH2oo+jQUZSXWNzqMGNz5SNMSLJq3zY16j3tqxR3YqzS1VXjmTmf9VqIHNEJeMQ
	 XTwLEZGjaCLkbOnvemBiV5wp1Q4pNggXjf5csA/ehcG6XiUvKKTUFNnAyMY0UQarV
	 XHsq+tRtg7ThNWMmBrk6t0/KD9tg8z9CXxRwcAH6dGw798qjVsyr+wD8m7DySn1nC
	 dKgi7ZNl5tJPQZIDorAuTxKsnDECLXPPerdDCB67grT829LDOGJSArJF4a/a1l295
	 ak4J8vLE+yGxlBbr3g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.131.151]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mq2rM-1s48iR2aXq-00g2z3; Mon, 08 Jul 2024 12:51:29 +0200
Date: Mon, 8 Jul 2024 12:51:29 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: dm-crypt performance regression due to workqueue changes (was:
 Re: Thread for updating minor properties of tracked regressions [consider
 ignoring it!])
Message-ID: <84ea4156-74b6-4a8d-8101-92d212015def@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
 <26f1b4f8-c78b-4aff-b748-58abaa01671f@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6q2skbf6s2eemjx2"
Content-Disposition: inline
In-Reply-To: <26f1b4f8-c78b-4aff-b748-58abaa01671f@leemhuis.info>
X-Provags-ID: V03:K1:tMWYR7K/BNeoVK0EX1zeCZPRIFuXeII189m68gKJR96jLQF7j+S
 kccDWprPR5sX93T6KMxv49Idm2uOpKjadjYuSnByxQ80ZKmGdREQ8jqQjil7G9w4AjRq/Ih
 28sJF++c1wrWFBvAIajKBBAjBpuBfORD8gPUzGkXvSztWLrCfI+kOhydECeYm2bIqMqVL0s
 4C2yOE87MoE6Jxy91XR1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5la1gIn5NwU=;DPqkSpJUOje4i7qKFlqVH9FC8bf
 plr7dNT6VuUftj/EMpsySBqn7tu9loL2pfggKJlHcQqEoNF4CyCzueHJLa2mFVeKJhcCg+Jzg
 jrdM4435PDHWuDdOX4hH+k8GwNk/8jHLp3ZjFvOg8FxvwhNtSI9zhT/XYtvzJkzlSEx+K7stU
 poaTOBs9lBg8INsETWOfxybDfgSbw6Ki2l6GiUuTyVRubCGitpyleDlBnjNQFxxeiOBd7ijl5
 i7YJZU5VbBJusDgEpbEP3vlprIckcrQGY7mqF67hSEr5E/f+C/e7G9YA5bh+8Ni3ZNnh6I8u1
 wR0CLzo8bR+DS4lWso/Mqd00mZENMusEcJrTc/L2NG3Yu7hmO7gXXPoBrOnJv30Rikl/dDHkS
 t8dDlDwodcjooXndbmRkx9wjfbQfOGsknvnfad/YwE8ULD+ZhKoDMond7VABl5WQAfMYP7Kfs
 6XrsxFVqqy0YDZ9QL41zF0lZKEPJwEVs89TldigjTx9YKXBBZZbjRJe+mPQGh3MjTbOVRFU7h
 3/haFO8rUZA1TUo1nn2mGJYoMhgAdLngQjb0XIo3tvAj1xkKlKl48vER7z5L1guVBE4fe1s/n
 5Az/pX7LtqF754VNPA6IDI+nLvvI/RSPOuMe9EyUSQvUKF2k74plywOs5FqG16jMDVPv3TEMg
 NI/bJQR2x1irDOhMFT+O7MvnW+MP6/BtSxyqXdSc6M6W7ECroHb+h8RFOTciYOb2jdSb1MVOI
 NsdosCd72Ig2tlAPWBhsBz7ephy3W/iiLhuYuk061R6gldHUqS1ywA=


--6q2skbf6s2eemjx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/08 09:08AM, Thorsten Leemhuis wrote:
> On 08.07.24 00:54, Christian Heusel wrote:
> > On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> >> Hi! This is the start of a thread I'll use for updating minor properti=
es
> >> of regressions tracked by regzbot. Consider telling your mailer to
> >> ignore this thread, the replies are unlikely to be of relevance for yo=
u,
> >> but done here to ensure a public paper trail.
> >=20
> > #regzbot report: https://lore.kernel.org/linux-kernel/32fd8274-d5f-3eca=
-f5d2-1a9117fd8edb@redhat.com/
> > #regzbot introduced: 63c5484e74952f60f5810256bd69814d167b8d22
> > #regzbot summary: workqueue: dm-crypt performance regression
>=20
> Christian,=20

Hey Thorsten,

> thx for adding this, but please allow me to ask: what's your
> intention here?
>=20
> Is this something like "I have seen a regression report and all
> regressions must be fixed" or "I or someone else I know is affected by
> this and we think this should be fixed".

I have come across the linked report on Social Media[0] and thought it
would be good to have it tracked by regzbot since it looked like a valid
regression, so its a bit a mix of the two.

Is this creating significant overhead for you or anybody else?=20
AFAIU the report will be autoclosed once a fix lands, so I thought
giving it some visibility on the regression overview wouldn't hurt.

> Because the thing is: the former might not be enough to convince
> developers to fix this, as that thread are mainly developers debating
> the change and the culprit is in the tree for a while already; but the
> latter case mentioned above might be. At least that's how I would assume
> Linus stance would be in this case -- but I might be wrong there, hard
> to say.

I think for a case where I need this fixed myself I would just get
myself involved in the discussion directly.

> Ciao, Thorsten

Have a great week!
Chris

[0]: https://chaos.social/@rfr@tilde.zone/112724184490069659

--6q2skbf6s2eemjx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaLxLAACgkQwEfU8yi1
JYUyZxAA4ISpOLpH8Hds4MXEiwvSzaoLXetdvhuDZEXufHiiZUibFjqthZxS//31
AleCxP0DhoIiqBkZpagNPU61BXWMKb1N9/h7jWluwFzWqyulnww8PjhucaaASX04
HznvWmjRc23WILkqd2GRVL7wF/IcdmLD5hDkRUce0DubXJyNtuehKRePVxZrNBYM
9PBqvF57fNedoKjWZX/9FQdLHMWideui1sWsTg/tpx8IZe1eIHLCBZ6ERAahPb61
wBuApHq3xaFVothYBJ1YUeOi9azA4NWk0i7FmpKEGjU0d8wYuvDCpagcOgqzLARi
ZHOySSnRKiOYC4MsTgaJNR61uwHzt2MZSSLzGMgILWUj6Hk8jiy7CWYn7Y5JPF4Z
AfMPoH+xxqkXIc6teZznXvahiQxLSixOvC73UqarD99IVeGDc3GEM7ppsP3z5SMs
8IAagooPG2+tGNyrhBJwHVI5RB43XO++v5HEZ3zjZQ5NYZ5+iqDDHCjeUsHHtUIy
G/mfHWVXnj1wPyVQD9unwqcLe/odyNsUOVZLHM0lXLOsu5/TNV3F7RQ4qAQHEubv
qGccOyu/S6Jk8fSvX99NVf+8k/49Fr7weu1ykusebNrz8tsPpzsFOP+yo/wbQQUt
t4kThXSNSt2KQhhxkN/g7oEM6bBhYxSgN3GdQ+TfEI8tOfx15GE=
=sBrN
-----END PGP SIGNATURE-----

--6q2skbf6s2eemjx2--
