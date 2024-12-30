Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D015E8B
	for <regressions@lists.linux.dev>; Mon, 30 Dec 2024 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735592877; cv=fail; b=g4seVmg9jvsEIPRtNDcCu2cDx2ntE+Yqa2WbZVyDtjYyS0hnjke8dI2JnjUm4lipHQ2jE+OTYSbBqI5UHpG+kGQLrpbb132YSsfKarmr+WsMdBWVsCwVoyCi0iQJmmh8uYqpmbclAJwX/s3QyfhkseeY24/Jju0helaY/VwFik0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735592877; c=relaxed/simple;
	bh=XjFUZodtXp452T8oly0e8dvW6e218lBgL7vbYtLrWdM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTMkdV5VhYXKDyNX3AeEDSG9zx1QuBHOXAyp+p6wrYqCtaL7yzYMaIINBfSXr68ntU96tg6vu8D/Xl95CJEwnRP+JfB0aqwJ651a03zOshXw8vaD6BUqG8Zm29Kn8lFd5HzK86ASaUtWH08hD4Ajsel60EDxQD2yz6TyPb5C5XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=PAYxfxPk; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=oxDPjySA; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="PAYxfxPk";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="oxDPjySA"
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 15F824800BC;
	Mon, 30 Dec 2024 16:07:54 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1735592873;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=XjFUZodtXp452T8oly0e8dvW6e218lBgL7vbYtLrWdM=;
 b=PAYxfxPklxbXy2uu6KhqMyibTJXyAHJks31A5COSMmMWsx3Ea5z0Qnb6RWtogZNgYZMMn
 CAc9SAzcB7w+E+DAA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1735592873;
	cv=none; b=HEjVAcuIjXRfkD8JCAanMPuu2lsH81Q4l8a481IqJyJSuh1wGkC7QM0GWJDxZ82a0a3Uf0i4tjcl/68DujJU40tXkenNhxEKdNmqYIHqMusb/SPjib2dhQPnsTXh0fdXKL6PzLKQuu0WMYNeJcu/5peOa/a9mhlAJ+wxrJG+t4tEBQhtZxE3YVK76hu/HjUASmQ8dXprWDLpDBMQcg4T23KB/0vOGZndUtVCze9U06WBGM6bP19nuFlVEnJ9tHtNt9m8iC6IUBViyBk1HKxFH+a2y+zWQQI8TLBEQ8dZySCsbqsMSfYwvbVyb2yXTJA9bIGb7Ha8YrN+B+PKM4p82w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1735592873; c=relaxed/simple;
	bh=XjFUZodtXp452T8oly0e8dvW6e218lBgL7vbYtLrWdM=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=g5vv1E1egNiTFDHymIxlZj7eHAp0lUGNENDyiWbcNRIgTH2hthcEWEStY/4FGURwXm0M/2YYj9Yj+DBiNeLQbMfY8ZZLfxH2TqLYPsNzlRmhju0qutmfy7m00UbluVDJftSu/MgDdS3DHFcVi5CNIym50bVc5spjYxz8HZCvRd9kK45vLKZOQNigPDU/wN3v5hHVNb/L0u5jbvaOVOIolGlFHlQ36eFkSW9qjjvmF47+wUnmwItGiASjNPQ3ozsDTCU+GR7WANXCAwyMO47IT6dmYqop3+k3jTbkYRCrT47eysexujeXa8Uz87L9iIIJ4nIjPmxL6D37TvTYw3VeDA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1735592873;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=XjFUZodtXp452T8oly0e8dvW6e218lBgL7vbYtLrWdM=;
 b=oxDPjySAeCvJhfDrSGkNoGz9k+tDJk1eRRF0FaffQT+EVyG/dxM6w9FLg05XSd6j+AU2U
 EVBCpByqf+IfdKY8vjnCFnePiMZLDpd+HKeWZ6Pd245FIeppQSu2iQQYQNac4v9PV6FEfF0
 fQtEKzu9S1DEeO7+x3VZWk0gIqTmHPM0ZfNUNwUQm7bUR06Q7Qx4RzyoxwreeoH25QYf4F4
 QQHkme4UOpnGXWl/zsi/gyBZyrCW/xvWw+DS+vxGK2eW7tGCeTUyxAJm5BYYfuYARBj/7mZ
 oLm3jxdf/4M4MGqjGr5gOuNK0Xe2trCL3P+9fuf53jQ2h4QepYcs21fcAqLA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id D767E28001A;
	Mon, 30 Dec 2024 16:07:53 -0500 (EST)
Message-ID: <0ef755e06b8f0bf1ee4dfd7e743d6222fd795b70.camel@sapience.com>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
From: Genes Lists <lists@sapience.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com, 
	thomas.hellstrom@linux.intel.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Dec 2024 16:07:53 -0500
In-Reply-To: <20241230160311.4eec04da@gandalf.local.home>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
		<9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
		<20241230141329.5f698715@batman.local.home>
		<20241230145002.3cc11717@gandalf.local.home>
		<5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
	 <20241230160311.4eec04da@gandalf.local.home>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-WX3m8VPcXb3GDxT44Qo3"
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-WX3m8VPcXb3GDxT44Qo3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-30 at 16:03 -0500, Steven Rostedt wrote:
> >=20
>=20
> I'll start making it into an official patch. Can I add your "Tested-
> by" to it?
>=20
> -- Steve
Terrific thank you and sure:
 Tested-by: Gene C <arch@sapience.com>


--=20
Gene


--=-WX3m8VPcXb3GDxT44Qo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3MLqQAKCRA5BdB0L6Ze
22KaAPwMO3hFpNy4DRwYG5BNy32kSf10VvzXFy8BHqvMhev3/QD8CkrNrTxMgY9z
iPqqUXH6El8RN/z8TqA+2cn3KDMIhwA=
=dVY6
-----END PGP SIGNATURE-----

--=-WX3m8VPcXb3GDxT44Qo3--
