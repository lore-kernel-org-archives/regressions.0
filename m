Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A350270028
	for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 23:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613597; cv=none; b=rWIZ58tE3YrMlcn+Vg7ViYzMea3mZzWt52EQoaLSx6Z8cVJlFbOjnbjXNJAIIc/CcBXbL4Jaf6+0qdL872jY+4FT0XGopzIHR2OPgCVoa0YQvNqlgwyWUelUVVzWnSCO6EGgL7Ryn5lBJPvY13WSqK9R8mT/rhTchlU15jirEmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613597; c=relaxed/simple;
	bh=xmIq/W+6KTZJx0jkgAcBnkZ10aGBzJKf2J/843j1erk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBjMXGBjzoPPVnemweY/x0kSA0FbQu2RFxzmNMZY9cCReKkM0R+mUEhYc8mDZ/SfstBsiJ4aV+l33Vu2pMwAaqKe/B9KI4L5MzyGoqFUdnMyzWfW31yP/Yg7htxj8MNS63wSHYC3o6NibkxBYwADhuNuZnmJaDWdYXNI6j9P0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=BP41/Xs6; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="BP41/Xs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1740613577; x=1741218377; i=christian@heusel.eu;
	bh=ctqQsUfu4Pqg3mtV+bUnrVknuC4ZOOdHjvbmVoAs19w=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BP41/Xs6dVBij8JWWS18tzHgPZoQJRbnJBU4p8XsgtLl/3LUWwLMirC/pmtLkAyj
	 F2fhLz5oku7lzbyeenmQKRdqHAiqH4gn41cRRfeQL/EHYAjnct8dWbK0clyl3XlC1
	 Wd2OjAHRRspH72q46AmTRCJG1Iw3V59HrF5vK5GqvJOZMLTY3QiJ5hZv9BqHdYqa+
	 31Aot+nO1tUzSySeaGEHlbEUacvFyCNbIfp7mi0ZBS+O2UYVVKm4i6muBT9Wc++Nl
	 UBK6pjvmFSqc+mi8FrsQXDBN5b2cf0RE6t6xAzGRKrxDVrJUrY1py0XLSXm4TqA2w
	 Klop4FM8JEAEhn/oXQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPK73-1tx9KX4B5R-00XkME; Thu, 27
 Feb 2025 00:46:17 +0100
Date: Thu, 27 Feb 2025 00:46:16 +0100
From: Christian Heusel <christian@heusel.eu>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	quintafeira@tutanota.com, Arnd Bergmann <arnd@arndb.de>, Desnes Nunes <desnesn@redhat.com>, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] SD Cards detection broken leading to boot
 failures
Message-ID: <b80dc39c-cfa5-4064-906b-4cbc2ae8fad3@heusel.eu>
References: <1de87dfa-1e81-45b7-8dcb-ad86c21d5352@heusel.eu>
 <2025022429-powdery-possibly-e4e5@gregkh>
 <CABtds-2TDWCHqOa+Di2Yh074RukUrjEhKGC82DWZ_7ysK-NCrA@mail.gmail.com>
 <50e67317-62bb-46aa-a539-54bf6dbb245a@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3fekkihnptrywhs"
Content-Disposition: inline
In-Reply-To: <50e67317-62bb-46aa-a539-54bf6dbb245a@heusel.eu>
X-Provags-ID: V03:K1:uPSfHjWljAB02VWFSZFx9t8NKq9J7nWMyM8Ak69djMLuqRtTYqz
 UzABhDOFif3MsGVpkKwL/M1WRpFaKo8EnTjma3AhzBQzCyRtYuZImpGNe6IWYrrTCwzj+hZ
 PdUwKIO9AgdTeIdnpo2jzAkWmw5Ov1nBnR+YgkASpII/VIF48knzTErjEv+yj9oN9WFQUFa
 D1lBBbM6yL52rjiP/qBTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tIfZPVB8hoc=;9QPFQv+81lDnTTuxwuwkvka1h4l
 oQMzY+6/FBUUF1JXdH3WFoRuQv7MNTZMWaaa1lbcOHfp38huSaeSx0C766zYEeOWzmjdhljQd
 GaqQmfbOCS2BESLJVsenYIGsoKqeJaTijCth4vORPdIhNM8sHRPn6zZRHfIQNmS7aQF41DVpO
 JCdAU1WvI1wmTyny6kFe4MhucXe8Cms8ZYgCYaxcBxS0rYkV/cb/UbdHtkV6csX7P6i+8d4HA
 68MydEQMm4NeNmPL+1WZXSgYYrVbb/d86I9KUY5rBSAJ8HjsPZ1sSKoJxTfKBQ5jUO071hsii
 i27fT4tvvypMdnnssR8txQSlx9s4ICesRZn/eosi2Vv7xGtLMEqV0Lh5zN2tGJRmQCcOd1WVV
 O6BTcJ/gXn213/eb7I/mZPTNEQiVauf0+IsjNhR2/wtOA6OUkfpxDhK7EeYIdeORKBq7AZHTN
 vQiH99D3ae8nyZ+cLrmEiqXt/WKC9KohyHPgedjCsAjpYzm7rQsU6VInqVdDPHcqIIqrG/8ur
 wrdxZ4IgfcQEfzvbIRkZa/xg+K6REcyb3j7Gpv+erysUMIaCdoxKWl/Kno1GVFzIIOoBFLrBS
 HpVV2XK5ZK3VGoA0sGZN88FGUUNLKA9MbhzX61wItwIDCPOAkWttVtYy0cMcuVpaEpZHF3yuG
 SvdcWeeD52aUJFAi6H1ElxbszR439m4NXAM7usb2QlKgXXWr5QBHx4HX+8uzsYpQ4vfDrWh3c
 ua9fnvMZvdG9XY8XCIt8sllvhEywQxl01Bk9YmP1KPanEql9w/NPBBFdbKr7WfzXk4VgqrXRy
 VTwCn/tszj5g/XkT+O2AlderoCXIOknl0lnwk9jDrviA7lMkZoKlFWRXBANxMz8o2rcdti3LU
 C5SExF0bw/ZFWCGlELWqMvHdJ9BM7kWASU835HqsFQKe97WwACGmnM2rGtTTyY4z5RccqbmUJ
 qMB2yhVq140/zoYx3nOp4Hb/msVyzZuEaP6vUO3iLj7ixMxFgf7qYRAlAxrq1ZHbuKYbNIRMv
 9N2jajGtyi6+rR2k8WCguO2DC3c7aSjFP7BPux3wWjxPauo6cg37L5s79eEcyNQ6WoUXHjcZx
 9hJI160sCxJ6ws+ldaqzSImFa7UBC/J81P9NEWzyMqBPKz/5cRhrsnt0teNs3Kaq05+FP1A/F
 PrtK3v150HwcNczbick0xuKEFiuPrk2HBb2w6CFdOFQw7mKqKTW/qL54gsciYnNHKcEQaC/MA
 i+m6QPqJBA3qETnhLLlkMfTUva//7M1B5iMk9oH4cLJ3IBAal9lHa5UAaYiCp7vmZ13jcx2E7
 BLRq5nw+BewlviXizKzymWJH6rpFhJU1lpJTcAb5dDF8S3I76pjrADeLgrQcDMhG7KsW4UI5t
 ZkcafnmIr3DiatvA==


--t3fekkihnptrywhs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION][BISECTED] SD Cards detection broken leading to boot
 failures
MIME-Version: 1.0

Hey Sean,

On 25/02/24 10:27AM, Christian Heusel wrote:
> On 25/02/24 09:09AM, Sean Rhodes wrote:
> > Give me a day, two tops please; ideally we can just push a patch to fix=
 the
> > trivial issue and keep the major fix :)
>=20
> Sure this is fine by me, I guess you can just hold off applying the
> revert patch that I have sent after gregs comment.
>=20
> If you need any testers for new patches or debug patches I'll happily
> build them and send them to the reporters on the Forum.

Did you already have a chance to look into this or should we go with a
revert for the time being? Just asking because you wanted to come up
with something quickly :)

Cheers,
Chris

>=20
> >=20
> > On Mon, 24 Feb 2025 at 07:07, Greg Kroah-Hartman <gregkh@linuxfoundatio=
n.org>
> > wrote:
> >=20
> > > On Sat, Feb 22, 2025 at 10:22:34PM +0100, Christian Heusel wrote:
> > > > Hello everyone,
> > > >
> > > > on the Arch Linux Forums[1] multiple users reported issues with the=
ir SD
> > > > cards not being recognized during boot or that they needed to re-pl=
ug
> > > > them in order for them to be recognized.
> > > >
> > > > One user tracked this down to the following commit:
> > > >
> > > >     235b630eda07 ("drivers/card_reader/rtsx_usb: Restore interrupt =
based
> > > detection")
> > > >
> > > > They have also created a report on the kernel bugzilla[1], therefor=
e I
> > > > cc'ed them to this thread. We found that reverting the above commit=
 on
> > > > top of v6.14-rc3 fixes the issue.
> > >
> > > Thanks for the report.  Do you want to send a revert for this, or do =
you
> > > need us to create it?
> > >
> > > thanks,
> > >
> > > greg k-h
> > >



--t3fekkihnptrywhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAme/p8gACgkQwEfU8yi1
JYVnIxAAqLpoG+XE60RF+L5eoOT/wMj8bv+R72pnVogrISgDYGIdkpFKjvWZrhlK
if7IpyofhELQPYU5GojKKOZl6zwEzOl0JdTYllly1AGj+f/HsjXHsUdB2rkWaeeS
ZyVLz3d3S1s9s/ajgAwmiv050ySbHLgwJZ7hgo6kk5iSbNqVRWnHmYX4UovlJlcy
AgiQo0beS/o1ESmipiqMFx1GPMSqGOS8vdszgicH8nKWSf+YESun46p8DXCVHmhN
NDwIdhaPWFOiBrLqsQpcIdqwTMJ5khCumD0oUPudflUb0lormId4wMHdNnnH8Gxm
8i0g0avJv6fUiMa1QHRc7V50ap0rWa/LEDyTxDLBDKW4UlvO6phtZA2q0JA/B/iX
lsy8OC9Aa/eGneDNdQJ3vqRtJWBGGioikzpp7GjHZD9Cnz/nvLi7dHlgvnpWCje0
UUqHxvRaQO+Q3eSh2tNIh+BW2rVOCCePz3Se9dBAwkA76tThLbIhfHy02U2Vl3jA
Wk3oH4Sd386KI0YnH2S77YfDrL5d0s8mfv41X3JUHer8SXCj6TTL7ZwPofIE0Hya
U2xhd9+k1y4zyGJAh9jSGSDPIQQrr+w6He5gaqwJ4xzrcfCix9ZRbRw9JQ7wX3Ow
U0ojC/bK+3BNFngmDkluuEjqdks4lpLoj23toxPTkEdNCBNpNTQ=
=tFe8
-----END PGP SIGNATURE-----

--t3fekkihnptrywhs--
