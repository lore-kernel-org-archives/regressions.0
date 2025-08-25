Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503142882CC
	for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756108596; cv=none; b=cEvPA14m5CJL2HrpKrrmasRjNBtDqcijAlOiA6IKBbCj0JsdDp5HNNsyPyPE6MmYx4v483NhRw/7EhFELjVEMbkEcSa5J7wDZHq0cUcRK+Z0dzk+LlsOMsJCB3nHUTGhSxIkVrrdEqiFQXQam+/iJosEi/OyXxxygCtw/jiuO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756108596; c=relaxed/simple;
	bh=LByR8OtkujGJ9OYhVLpYhW2Vetxj0MFIbNqghCz+cLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBVZjdqmoPAeAOa/ZKoi8Qs+AS5r0tDj6OIPIsWH7ATpESnCQAKeqR3BuTybp0JkfOtH3bM3wHBT8CiNopto9CQ+aTNvD0O7BZ6qWebRYkLcaz0VIJEWpLCQqp03Fncn0evxyd2WZhZoVADwJXxLTtf8UrzvOxZ2gG2zFctBqi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=oadJ9aV8; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="oadJ9aV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1756108555; x=1756713355; i=christian@heusel.eu;
	bh=bvMw/hN/dMbt6aDczhjkbAxPwz4eyKouvingsBA2vYk=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oadJ9aV8PbcGWIDkh1B2VpE0Y3phFOOnSkqzfEtrCOlAqNAl8Vo/eAZxUyAsRq5g
	 piMmsg+SEnx5r3CoXmccootGwD/4Vt+V2r1gbF41IEhW906rTScC7HE4Otpio/BJ7
	 oSLD7ZvSh+MWTT34S/LFfiSEijPTePR/mFlE7GI8F8CuDUdDMuyDA1cPMvE0T8hyy
	 MO9K0aUnByCxnbFkV/iE/CClRovlVTe0m2i3v9UQPTKH3+1Rf6Ijxt4YDF4MBd3Ve
	 ja++MNghWzCKIK+cL6zW3zGBYsRXZH4J+ebH2Z81KgcCWE1iT2Mcb8m9j++LA/fMD
	 /Y8mKDt8ia0S7Li5+Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.247]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRC7g-1vBOj02xlM-00Xzmo; Mon, 25 Aug 2025 09:55:55 +0200
Date: Mon, 25 Aug 2025 09:55:52 +0200
From: Christian Heusel <christian@heusel.eu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luca Boccassi <bluca@debian.org>, Zhang Yi <yi.zhang@huawei.com>, 
	Sasha Levin <sashal@kernel.org>, Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	heftig@archlinux.org
Subject: Re: [REGRESSION][STABLE] ext4: too many credits wanted / file system
 issue in v6.16.1
Message-ID: <36950a03-7d6a-455b-bceb-225f9cd28950@heusel.eu>
References: <3d7f77d2-b1f8-4d49-b36a-927a943efc2f@heusel.eu>
 <CAMw=ZnRtmhi8aaO+xsT=kgXYhB8u3sgBdtevrxDWctTLteWYoA@mail.gmail.com>
 <2025082214-oink-kindling-11cf@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suzg447ltmbicq3n"
Content-Disposition: inline
In-Reply-To: <2025082214-oink-kindling-11cf@gregkh>
X-Provags-ID: V03:K1:YaulqtulJauBgdHn8lwwfoPijOs88eQhsj20fFMsFs+2ABxLlw8
 Ch6TDCa8AiWjM5bildqNlnwwZXVC/OSQS2OkrftBvteZR15BkuqdbAXbfcJ8k/0tV2Ye/fu
 IxbKKu/daO0qa8sDJFWai5fHkKqVCrq4eSGz5aGqiGqkiy6jQ3PEqlBSR8axQKpXtsb9gGx
 s/bLeupm/FGY7ypAAk+Ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FG0sM/nnftc=;nZo6cmonfESuLuY2yZ56np8aezv
 Pl7mI/2H+ccz9SbGpHJMAQBY82fyo0wIrAig4a2WXp0S/s35fjPthPvJ0UaulG7hMh5BdisLu
 KxNeuFPnUkzm5av9/IPPtb9+eL+AgKy6RdN/6A2Oz4mAAa8zU1Cr+zpbXVmc+utPGE5pj+/mP
 AsJwQxhpdhJML0uy5BdjFa1t3FklE+BYcP85jSEOgW4EtrLxjIAiPGJoEK5XgCWTo1yW3zz5Y
 wakIy/w3dJ5F4cY0ZWO58Y3GDx4h9Mlpv9thNlV25tfMGd4+4nLU5AuJcQPbjXAvO/oZSY2Zc
 1DvJJBHBSG8PgXemyfcu/EOi4okjBjY/k5oXz/x1qCSpKnZaVBX+WDbuVzA0+C4sZfnK2Unye
 IGNEXtiXtnqsxdwnLyko3iLiYR3yj+VVI0V4bRf4XkNLOenrCovd6+NSD9aF/AZNZptXZNT7O
 fVoksO3dz+mHmMKDtXmiUqvOfdqbEfNlzkyR1qrGcacxhZUgOwZsL5H9scciEENd0wODjygSg
 3UV63paFW7kXGJzIOZ4LA4gca4eF5Zf4hOtBP460LlFAavoYz/7svWTv4HjwwM8P+qZhnkzhg
 jQGG40Byim/l6zNAmnr2pffxpDfsXHL4e9SZbvvYWsod3mnjf4z0m9qBD62ZZ9czd6nYZenvi
 BTY3If0En/MlItRCHF2mKf/SpvIiA+KrgFjPbUxiw+loH6ftP0NWq7ZAMZyzJ5LhWyhmGZSEq
 R71h61YnHOskFHLj15xfB/oncFFBOoA52/ZfdW46x7EjS+bqNHSBCJpuCexyaupgyjba/nB0k
 PelfM5w4TufMkVsHh/0tvyiTG5YcRfa6GoKrYgJBjEFp3OCO0MMggwcaNds2Kr6QC8AOSnqLb
 1RoglVavrnV2q93d0Zv43neye8B+xdGqLifMxB2osDG39OZOyrsqNEo/JiKMdEAARAL1sbET6
 oYcfa8kXD+SrJxu8m32UJTBgWJv2hkAZcgEjnfOFOxvnOd4SN3WTY94hl3xFrce40XAQdEN7l
 ypwDsQOndT/zkvdSSpOUi51Nr75w1QU8P43vAbj+Z8Eljk1dMvm2jN9qmJBeCYPq9c0aZV7kV
 qO89Wsz6w1hpTvMWIGrpBe/NPvWfmN4rK5MnJxFnS0o+JhNichZKCH3VuFXCpgw5n3255sDFg
 6B6nUKD5ErMfsYpFsfuQz8/96HU6K+QLGZmx9cMdY9zL/mTqY3IpcChnab4vUnt5gdSauJoFq
 wqOOo/ALXJq08GUZy5rGxhpcXjNL7l5zuel8gTXM5Vvs+T/V5TNb0Y2hBWFqxF0yTD3iz/cQ9
 kuXm+I4WP75RXvqGUm4Y5N3a2OwoOVVHS7CWRpWZnK4N2E8xIZd9WFX+YtbcUN4H3+VR6rPqW
 tW7ZjL3l2CuPiFHIX3U97xKrgywXVEsvaGafpIPS2sKn47qND3wMI/67A1WtJs2682ImE1Iz/
 EQMApkRca5QEwtSXSz7n3cDEiNCXC1VMX50KDzQ2j8GZCP5MXtV5y83TItApztr2dPOGArrbs
 p/RqSBfDYMgA+JSIWKhFtv3zMO/VSJIKl2mqn+28VvYs3vTCtTB1j68HWnxFnZktFVq3XaQKx
 nQ5nyMhgdlPVg8jsmuFPONFd7WnqWA4bj8t8hnIcOvueCL/TH3cE5OQ3VlpNO2qrMkmwfIWUK
 RTI3zJbOsWOIbv9Y7iaGFu


--suzg447ltmbicq3n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION][STABLE] ext4: too many credits wanted / file system
 issue in v6.16.1
MIME-Version: 1.0

On 25/08/22 02:41PM, Greg KH wrote:
> On Tue, Aug 19, 2025 at 11:38:11PM +0100, Luca Boccassi wrote:
> > On Tue, 19 Aug 2025 at 21:53, Christian Heusel <christian@heusel.eu> wr=
ote:
> > >
> > > Hello everyone,
> > >
> > > the systemd CI has [recently noticed][0] an issue within the ext4 file
> > > system after the Arch Linux kernel was upgraded to 6.16.1. The issue =
is
> > > exclusive to the stable tree and does not occur on 6.16 and not on
> > > 6.17-rc2. I have also tested 6.16.2-rc1 and it still contains the bug.
> > >
> > > I was able to bisect the issue between 6.16 and 6.16.1 to the followi=
ng
> > > commit:
> > >
> > >     b9c561f3f29c2 ("ext4: fix insufficient credits calculation in ext=
4_meta_trans_blocks()")
> > >
> > > The issue can be reproduced by running the tests from
> > > [TEST-58-REPART.sh][1] by running the [systemd integration tests][2].
> > > But if there are any suggestions I can also test myself as the initial
> > > setup for the integration tests is a bit involved.
> > >
> > > It is not yet clear to me whether this has real-world impact besides =
the
> > > test, but the systemd devs said that it's not a particularily demandi=
ng
> > > workflow, so I guess it is expected to work and could cause issues on
> > > other systems too.
> > >
> > > Also does anybody have an idea which backport could be missing?
> > >
> > > Cheers,
> > > Chris
> > >
> > > [0]: https://github.com/systemd/systemd/actions/runs/17053272497/job/=
48345703316#step:14:233
> > > [1]: https://github.com/systemd/systemd/blob/main/test/units/TEST-58-=
REPART.sh
> > > [2]: https://github.com/systemd/systemd/blob/main/test/integration-te=
sts/README.md
> > >
> > > ---
> > >
> > > #regzbot introduced: b9c561f3f29c2
> > > #regzbot title: [STABLE] ext4: too many credits wanted / file system =
issue in v6.16.1
> > > #regzbot link: https://github.com/systemd/systemd/actions/runs/170532=
72497/job/48345703316#step:14:233
> > >
> > > ---
> > >
> > > git bisect start
> > > # status: waiting for both good and bad commits
> > > # good: [038d61fd642278bab63ee8ef722c50d10ab01e8f] Linux 6.16
> > > git bisect good 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > > # status: waiting for bad commit, 1 good commit known
> > > # bad: [3e0969c9a8c57ff3c6139c084673ebedfc1cf14f] Linux 6.16.1
> > > git bisect bad 3e0969c9a8c57ff3c6139c084673ebedfc1cf14f
> > > # good: [288f1562e3f6af6d9b461eba49e75c84afa1b92c] media: v4l2-ctrls:=
 Fix H264 SEPARATE_COLOUR_PLANE check
> > > git bisect good 288f1562e3f6af6d9b461eba49e75c84afa1b92c
> > > # bad: [f427460a1586c2e0865f9326b71ed6e5a0f404f2] f2fs: turn off one_=
time when forcibly set to foreground GC
> > > git bisect bad f427460a1586c2e0865f9326b71ed6e5a0f404f2
> > > # bad: [5f57327f41a5bbb85ea382bc389126dd7b8f2d7b] scsi: elx: efct: Fi=
x dma_unmap_sg() nents value
> > > git bisect bad 5f57327f41a5bbb85ea382bc389126dd7b8f2d7b
> > > # good: [9143c604415328d5dcd4d37b8adab8417afcdd21] leds: pca955x: Avo=
id potential overflow when filling default_label (take 2)
> > > git bisect good 9143c604415328d5dcd4d37b8adab8417afcdd21
> > > # good: [9c4f20b7ac700e4b4377f85e36165a4f6ca85995] RDMA/hns: Fix acce=
ssing uninitialized resources
> > > git bisect good 9c4f20b7ac700e4b4377f85e36165a4f6ca85995
> > > # good: [0b21d1962bec2e660c22c4c4231430f97163dcf8] perf tests bp_acco=
unt: Fix leaked file descriptor
> > > git bisect good 0b21d1962bec2e660c22c4c4231430f97163dcf8
> > > # good: [3dbe96d5481acd40d6090f174d2be8433d88716d] clk: thead: th1520=
-ap: Correctly refer the parent of osc_12m
> > > git bisect good 3dbe96d5481acd40d6090f174d2be8433d88716d
> > > # bad: [c6714f30ef88096a8da9fcafb6034dc4e9aa467d] clk: sunxi-ng: v3s:=
 Fix de clock definition
> > > git bisect bad c6714f30ef88096a8da9fcafb6034dc4e9aa467d
> > > # bad: [b9c561f3f29c2d6e1c1d3ffc202910bef250b7d8] ext4: fix insuffici=
ent credits calculation in ext4_meta_trans_blocks()
> > > git bisect bad b9c561f3f29c2d6e1c1d3ffc202910bef250b7d8
> > > # first bad commit: [b9c561f3f29c2d6e1c1d3ffc202910bef250b7d8] ext4: =
fix insufficient credits calculation in ext4_meta_trans_blocks()
> >=20
> > The full kernel warning (immediately after the ext4 fs stops working):
>=20
> I've pushed out a 6.16.3-rc1 that should hopefully resolve this.
>=20
> thanks,
>=20
> greg k-h

Hey Greg,

6.16.3 does indeed resolve the issue, thanks for fixing :)

Cheers,
Chris

--suzg447ltmbicq3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmisFwcACgkQwEfU8yi1
JYX46A//a6hajRTv75g9ySWeqW+eZy767mmrv1saz+e1tw+RRu5VHYX8qUdOPpZH
Oc6hLJOAvxDjevCKE4lRjP9CQQ7ub+uMDtCfZ2kFowEWEilB62RPZUsrMU14CN2x
pQMhyR0MVR9QkddQSnHX1bhFxszhcANl2bNWoEs7WtJk5TJ3P2bPl6ast+Lp7hIg
u3s8ppOgSNdbfzAIAum2t/dpGQvYJC1o7XXa8YtfP4/3aMqLbn6rPQSUFWxlPMyN
TzzFACqoBrCeg98ab7kDCDMRHNnbrebPLEiT6jnT503zY62b6isOAf67EnZX4m7y
+1Wqm/3x6JgTxBuDKpIZMppIIjEEIPUutBX+dA1ca2GD+2y1wS6UIw97Mm3zHko4
p4+62tump8ymGHVlw3fx3WJmkWPjsKdti4RdAQ884hdmHCBTIx+LGiy+GaKZP6As
f4AZkuEHkJFLcRBFISIZaeeOUdQdBKHqa0cyDwekRG1E6mYvp3XMFHiczsJhaYBd
IOq/JAvhhW6c4X0+/SYunpvv6TiAOhf+zw75DoCnsq7c5FQpqvuMtpcEgUwqRCzE
EM9zCG7bqHpi3rSE7eXwFZ3wTtRGeS371z+RcPLVJMM3CAZnRWV3oZiXUe2czk9B
3HG1WPrHU7oQPSVy8IE6xSmSeM/vDGYiEJEkcKDOsufNT+ZiNWg=
=x8w0
-----END PGP SIGNATURE-----

--suzg447ltmbicq3n--
