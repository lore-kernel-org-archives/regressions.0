Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A46146588
	for <regressions@lists.linux.dev>; Mon, 24 Feb 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389580; cv=none; b=KHbfp67SLbrniPlFLVWFTUp+ubZP05n+WDYHHGyVIXu2lEX+SLyTvKs3luyomBQzUhGxrQ7GaO9E+XQh/hZiTjWxnhYftrt4fNwl77pvNDbcKrDhLd9ggRglLWORLqrM3OzNlkI5OlP4diLJSRMsJ3qlJiV4NE3mpQVkqYgA75Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389580; c=relaxed/simple;
	bh=0Ohu78Zf/UEpjP9FyBlGg/0cZKd58JmhbgDBP0/Z8Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB9rGNPPSCvW9TWbqvKB3T6Qfyj3Hc5lhq7faufT6PGucCwMdG4TRtFAXqBUFmLcOFPu49FR6v+/1vFAU/F+67M1Obb45Z8tdv4PEY682Tk2yWtPUjH/aw+S1Sa6BxQtViO7GUEFT6T7XEZ2i/XyG2+7gT/pwiXC98NSFOFLlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=CeyKzdml; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="CeyKzdml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1740389571; x=1740994371; i=christian@heusel.eu;
	bh=NrZLRnQZ8ugzVrwD0om47oW/zeqiczYDfHAh63LwAmw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CeyKzdml9xA+u9tpWuxH+y+9+IuviYQTHE6RI1Xh0a29crpfoJi1ri1rgyoSbL0E
	 SZXtnfNbadqXQKfYoZkjUgwtDPdqOjB2X4ttqJk1PfPdB1zyPVp/BGWR96Hd42Rtd
	 iUNe0gnK5D/lmU8Etw3Jmiv5yZEsmuA2H5VzsKTqvAAY2PYTeC8rnsFI/BTIwNLDu
	 6Dnk4lxOYyE46Ei3wVvoKwwZ/NWgUVJGmFukvUQCxKd0TcmryCa5arUKyPm7ntN/U
	 X+tGvG0k0MNko9+ApR33+6CdTNAKfHkXXIQOwHDMP+CkfD7MBGWMMCCTPdiryyU0l
	 3xTpEBSZm5IlT0vugg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPowd-1u0ZDT2CoN-00XcSE; Mon, 24
 Feb 2025 10:27:24 +0100
Date: Mon, 24 Feb 2025 10:27:22 +0100
From: Christian Heusel <christian@heusel.eu>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	quintafeira@tutanota.com, Arnd Bergmann <arnd@arndb.de>, Desnes Nunes <desnesn@redhat.com>, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] SD Cards detection broken leading to boot
 failures
Message-ID: <50e67317-62bb-46aa-a539-54bf6dbb245a@heusel.eu>
References: <1de87dfa-1e81-45b7-8dcb-ad86c21d5352@heusel.eu>
 <2025022429-powdery-possibly-e4e5@gregkh>
 <CABtds-2TDWCHqOa+Di2Yh074RukUrjEhKGC82DWZ_7ysK-NCrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="izfjcqek7qbgaff5"
Content-Disposition: inline
In-Reply-To: <CABtds-2TDWCHqOa+Di2Yh074RukUrjEhKGC82DWZ_7ysK-NCrA@mail.gmail.com>
X-Provags-ID: V03:K1:85G+PFLrSgYtQaEM1qjDE6+iiLg97SEZKLHIA3wiNVoK8rD5lnY
 URPrcto/8beZY+wzYCkYJAKpMmxqjP1brzrp4ds0mTccAHK6br7zAyttqBDyk/KZimhzbrV
 Y/Ey4dJQVm0L3uhgUUbQlsM4qE986xnKlHEDU1VyU83ck8RgZHwjV+/mpf5jy+1fivrkvJZ
 SkvWABdTqNKFJ+Dch+XZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bsj44CUtRog=;/HvghVOXzNjlQfVoeMDHTg7c+7x
 ah9RdDLkUIR/CP/HlgvQ9K6KzMgzZHpGlzj491RqfNVjPp2pjzS1q/UaOi5+hnRhpg6fGeGFL
 wXmYpAuYrPyXz2xARUYvxkliMNeLYzWn1v69eacZDjUXp+4RGNwZTuZlqTZN6G4U47usNMcn+
 xg6w3//5dciTGjGWlVLvKqK+3IlALmNvM1xww65qko3iM7tLzNzSLa7uB+0fC/MYSxeXSNMxF
 DRU5bJVQlI8a0Ke9WjQNZxyYeKBNIgFJYNH5qi+ZhmH4vVpHdmhdyWFPiz+nBIfqf216eHHsY
 nmz4Uq/KwrPmjK6t5qAE1rDHM+4iJtMqzxxxwCAmIID9PCA+ZaH3FQitd3NPTCYauBY+3W30Y
 wTtSCv2tm4tU2yXyanl0uk/IFxNQ5fz0wzfO9uzeLoWdNuAoTy2i5Aq9bZPIKqoUus34a7gNV
 gyPGzGWk++qEIjeDNF9n94qq2uqz+y8d3AzwQEnd2FP2H7HCXDfDf+AWoS9IovyGVnlhyvBSs
 T5sXjHQDNkh6e56z2D9lT5nnBspPIX5AQFEpB4d2UrskOjYUGQUHEteY9T5T38lxKt4NVG7k3
 OuBpEug2N+8twr4KAL0+fqxhNSoligXnkOqVhMU/lQ9i6dP31bZ0QVVJkDoDVRPh06EZuAPYH
 9i5Ozg0lXI9EK02369ApM3Z42o7JsnMwkOmnSAAMHuw+PvfWydwLIDu3CH5FYCOBhq5TDNmMF
 cv0Yy2MdLcwoR/HPoPWnXj782gqDVOamKjn1CVFWJo1nAZtGIUCnEHw5BJDgjXU4DFNx5kQ4O
 B2Ib1eKVdpsHIgLZLMjKaIe9s0u8m4hbKbWiaG8PpNTknPC/IlXzWSqFyye7MPt+kFR6PIVhn
 iWIIdg7QUTbVTdD0UMjgkHq85BntwzVbHocLLu9tE848xg+TgT5xPwIkA+q41qd0EBWQArtXG
 YceqfAaDW9W6q8j+F7SHYiIbICzbRcfluAboNHjik5n6t+uCwc/GSn1GygHa5Q9vp//gg3toP
 sKjdIFCZS/nglw0S5d5Pf4PfpCR0kxwnBxILeYmzCumto2UElggHg/Qgsu/id9UxKu63ufJ2R
 N6kFWOEiPXb+Wguz+lIu1hKOetJzOGvsRqhYSGGlo2a9VFi39Xy9iAxd+iV4Eqe2/YfsTFCMO
 vbY0WN4ba3QlAWtxfwAY+ZDft1zmqgbJroiyi8PefCiUDvyoeDB5K729a1LqMioPCEgds72Cq
 A5Kxc5k/3R4wIytKpc90rv9w+5MQXXAgG68Gkih4vkXmSerkibknw/7QMQ5sG/pHM6R5APyh5
 TLnpkSdIfXhBguHSc3kKtrzvPBmo35ISXIFBDX49nxnCqFFxd7mTOyW3oyU6wU7Rda/N6mqVY
 nEKXK9Ffc3BFwfYA==


--izfjcqek7qbgaff5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION][BISECTED] SD Cards detection broken leading to boot
 failures
MIME-Version: 1.0

On 25/02/24 09:09AM, Sean Rhodes wrote:
> Give me a day, two tops please; ideally we can just push a patch to fix t=
he
> trivial issue and keep the major fix :)

Sure this is fine by me, I guess you can just hold off applying the
revert patch that I have sent after gregs comment.

If you need any testers for new patches or debug patches I'll happily
build them and send them to the reporters on the Forum.

Cheers,
Chris

>=20
> On Mon, 24 Feb 2025 at 07:07, Greg Kroah-Hartman <gregkh@linuxfoundation.=
org>
> wrote:
>=20
> > On Sat, Feb 22, 2025 at 10:22:34PM +0100, Christian Heusel wrote:
> > > Hello everyone,
> > >
> > > on the Arch Linux Forums[1] multiple users reported issues with their=
 SD
> > > cards not being recognized during boot or that they needed to re-plug
> > > them in order for them to be recognized.
> > >
> > > One user tracked this down to the following commit:
> > >
> > >     235b630eda07 ("drivers/card_reader/rtsx_usb: Restore interrupt ba=
sed
> > detection")
> > >
> > > They have also created a report on the kernel bugzilla[1], therefore I
> > > cc'ed them to this thread. We found that reverting the above commit on
> > > top of v6.14-rc3 fixes the issue.
> >
> > Thanks for the report.  Do you want to send a revert for this, or do you
> > need us to create it?
> >
> > thanks,
> >
> > greg k-h
> >

--izfjcqek7qbgaff5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAme8O3oACgkQwEfU8yi1
JYWemg/8C/m1ZwOLVXB3Xh4+m6dPW9xDvTG5fINVTGtdtFapK05tLSBsQhsuP/xu
eFL9xJ/9kzvhyUhaWqflWTl85YDtXIiLiGbWX6F7c3jo5VRjm2ucdjz8dez9KviS
3jr0uUfOL3INXNgQrvrUXbMO3VP3hvEBJCgEagtn2F6CIbjNzkfTACBCwPAOPk6z
SjwauibKwppxq93KyVvVxKCa1LdtLj2/FgEOAVvPEUkHPOFTas7PDDKRrAnFbfNt
i+LiWv0HCxpTy51v/ozWTR5W97iWEycF3jDFgQgdJp7GgyDrky4k3HSTq/T9d54E
VjzpwVgSxsvOsWWqCbVTWXwElnXr510v0NwEsd84JH2oY27z1/ci8jaGi+sdkS4v
d0lkFQwowp3Oz/Oxy5pm26qtnEMNFuSWkLws8H1WgmHzHc3nSKHWDrx1Ce9IRrNT
d0E3aCNnBgTH2XbPBC7JZK/KcsbY3UdUtq7eoyHKcJmMQtT9PPo60AcvzDaYkolx
yKY3qE4aaTxeb3hWoYT8+PAN+uAAiGTvMdXwH+lYbvAZdsf4XFMKOyP61tO9RyLm
cL91diKLZ6E6gCGpnW1JQAJs1T322lN5Gz8+jIq6jWxAUILc3Y7Nz6sH/vphw1uv
Fzj2Nj+IpqZfectwSdZA7psIvxZL98DIPvvuuj5sH+2sw8gD96o=
=wV/P
-----END PGP SIGNATURE-----

--izfjcqek7qbgaff5--
