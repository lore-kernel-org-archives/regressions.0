Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED11885BF
	for <regressions@lists.linux.dev>; Tue, 14 Jan 2025 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872842; cv=none; b=AT3kiwtWkp5BYXvV+Ab810DPEMBaB39/njuq0Clk6j7WgtNVYus8UQLYXLCeE8/+frkxH4KdGGNeFrL/aiH4zHyliHzDLQ5TlsenySFGmtBF3brcX8yq+L8XPzb6U55eOBo3CZYShRICBj69Vd9N+mxQlZBc8CIubLW3w+8Z8yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872842; c=relaxed/simple;
	bh=4Ww6OB6L3VaADeKLXpxhHhwWl/zI3yHYx7PJzqKx/NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNGGsckS6zYhiv4R0wlz/uZm1vKAJ+HPth6ly5GVxO2O2FUETFWOxN4prrgTBcj2LdmAMcembW6w4FRDLFv150ZiAbP/U3AxnqqR3CMCnu1BDj2u7KbiTQj3BBOoAYlPrvQ2sBM+MRI2qu3WaokS7/mWUGnRFHrcWIcTHaX+qXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=UJ4xXpBt; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="UJ4xXpBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1736872814; x=1737477614; i=christian@heusel.eu;
	bh=4Ww6OB6L3VaADeKLXpxhHhwWl/zI3yHYx7PJzqKx/NE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UJ4xXpBtgTrqmSFhd0TX1JjahnQOke18ebuhUM7hAzPmNfaDnzFFagaK4onWGmah
	 CSDpQWLb3Q12IUDRMaeRyUFkrjPaffWXTbubo0+pFpHDot0dVuWKBDYPNIPnZ6cfP
	 ZcAJBhJv3Hxov7wWzzdgdaB+Ze5MruauyFKiiEHQoAsQUADipLRIezm5QhEGgSR39
	 V35u3kFQ54tC0kErQh0Y6D9jSU/4oOMfWoa263KQxg7lsXBWGvEvcC+tkMggObQw2
	 VhmTfkoJESwls5db/6ePGe9auxmj4ZCLgvpZgCr5VQ7fw7110BLDHOtarEjqPTWZI
	 2xeywtAZI+vuausvAA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mj7yt-1t1xz10lFt-00nEM5; Tue, 14
 Jan 2025 17:40:14 +0100
Date: Tue, 14 Jan 2025 17:40:12 +0100
From: Christian Heusel <christian@heusel.eu>
To: Niklas Cassel <cassel@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] BU40N Blu-Ray drive broken since
 7627a0edef54
Message-ID: <5232263d-5836-402d-9c5e-e3c601181080@heusel.eu>
References: <e2be6f70-dff6-4b79-bd49-70ec7e27fc1c@heusel.eu>
 <Z4EDf4ecHyfTq3Hp@x1-carbon>
 <69589dad-c0c8-4a72-9f3d-c1b0c29c96c1@heusel.eu>
 <e167b28c-94a2-45bf-8330-2487baf7199b@heusel.eu>
 <Z4U-rc3VUeegHGAg@ryzen>
 <Z4aLWmt1Y2jL1-pD@ryzen>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7cnc46tonprs2m5"
Content-Disposition: inline
In-Reply-To: <Z4aLWmt1Y2jL1-pD@ryzen>
X-Provags-ID: V03:K1:8BGG6VpEEVCyle+SNBNEMAWPgf6YrYXeqB1YTd+jSH4TF9h4pDq
 ZssZHVOzPpni9wqbsEKtOEoRDXCKW4kTB1/DbZzOZFh8cfl/7Nz+KNibo6h2QKq9I35Q1qt
 Ekt5XF3yu+KKxJzJtZw25baSG4jbRd3jwGLf1T3hh9+BCdojedwWoaF+f+/FqsWNLIdEbBj
 iDKAWVGlblRY+CrrBN1Zw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TxNZ5Y3jAFU=;5C4XnQms+SMckVtXIBWhF9vPagj
 nvEbRFqX6wZFDueYwYpjDTy8FK8ZgU8rwP907hwpbK7FnDIhThzb+HogoTf0ZJeY2N0+lLr7Y
 APTdoPIzvajB42r8z4ozNL+Et5ly+hes80rm8+LN3hsx++gZZH0e9FRzVHIQyfBvWSGGw2Go3
 IixerEzw1TDcuo/gveuXelwIRj50garV03QGJ1GSMMcfFPIAXhqyyFH9Qm9Dlq75gT/KbVaRf
 Xb3Hd35eJkbXDAdaXdtabKFVIxy3KQtwJtnB8tiYPHJYkLqdCBoldUt3blJXCPrBkPmlBspbs
 HIDmY6GnTAAkNOq9p/geEYWct4yHLoEW60mZ3k6N43SFx42RN430QVhF8U3Snl7+THd4NIiNp
 3lNc+/XzXESHM+PShswVZN4JyCPtY18kFFNOhmP8Q8VS//lNWIMlDVA53/KD/P4BBpalN3n3/
 wLLPooZCe+ffq2GmZei8aCcsJqIqfr+f42iN9HAkkJuMu/i08DEAFBy6tOwy7eiIYDDbe5i4c
 +kEgNKym+Te/1XRicVnzFwMnUkMUGaalPD77lledJQ5abRy4xf6hKhOT/atL9hs0ApbyFzIVT
 pdaYP4v7RrLNy+XkpXe/4UqY36mJpCJ3/eTahKcmH22DDgJVUv5Qt3OYYwgsDVyRk82HVE587
 sFXMbW6T5R+SZ50JjiOdM6PhK8J8au7ATeY0eOd1WQ7DrYORqBTRwTeKvyJtzoPySr3C9j4cP
 B19bNuxHnLmGEGL1dgZK5NsFltog5eByQQ58VBMrsaqnG9wt7Li+lpLjZjNLpCDowIDea6/lj
 ZHSJ6jbPNc20ehvb8VXSVJO/7kTfKsRBDm17rK9CDmXpXW/5MQ7DHWQ20FPe1S83OunfEOy7z
 j9qMz1HSCcPi7BbSMBNENpZUWbXqMy17Pw9u6fbktZOBFArsxGoFeqYGkXtj3ocQz1mcyaMc+
 yclP9hw2vEoqkBGDXBwSFUb/nc/yabla2jcdIbUdOQXRfLORwJBz7/xeG5pc1HniWY9+Fb1is
 2Up3AfGlY1T3evDWpc/C/KU1tUVcfLD9kcx5eZm


--v7cnc46tonprs2m5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION][BISECTED] BU40N Blu-Ray drive broken since
 7627a0edef54
MIME-Version: 1.0

On 25/01/14 05:05PM, Niklas Cassel wrote:
> Hello Christian,

Hello Niklas,

> Looking at the Arch Linux thread, it seems that the person reporting the
> problem says that even on a working kernel, you only see the device the
> user presses the open button on the Blu-Ray player.
>=20
> This suggests to me that it sends a hotplug/PhyRdy event when the user
> presses the open button.
>=20
> In Linux, if we don't detect anything connected to the port during initial
> boot, and if the port is not marked (by firmware) as either Hotplug Capab=
le,
> or External, then we mask the PhyRdy interrupt.
>=20
> We could reconsider this, and leave the PhyRdy interrupt enabled even for=
 a
> port that is not Hotplug Capable or External, if there is no devices dete=
cted
> on the port.
>=20
>=20
> However, a device should really show up after a COMRESET... A device that
> does not do so seems to be non-spec compliant.
> It would be nice if we could understand why this device does not show up
> after a COMRESET. (If it did, we most likely would not need the workaround
> suggested above.)
>=20
> Could you please run with this debug prints, which might tell us what is
> going on:

Thanks for investigating this further, I was typing my previous mail and
sent it just after yours because I didn't see it x)

> diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
> <snip-patch>

Building a kernel with the patch applied just now! I will get back to
you once I have heard back from the user.

On a sidenote it seems like your mail client or something converts the
tabs to spaces on these inline patches, which makes them quite hard to
apply for me (I had to manually apply and format-patch).
Could add them as attachment in the future or reply via git send-mail?

> Kind regards,
> Niklas

Cheers,
Chris

--v7cnc46tonprs2m5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmeGk2wACgkQwEfU8yi1
JYUfgxAAhR1uKAdukCdNrArWkOWMz/D2cGcLjEFI3jBGTPxa7VM3o9dQBAvqufS2
DNd89R9a8Tq1/S6PAYWNDS8Fl7aJyO8capQFj6uPvBJtYGkGGaVaL0HYVLyefgxx
fTc6/W59OoRFVb1SxWiSfMMwXsmsFVq+jB/sH8BlOQz7qmJmRMfaeB096OeFA/9Y
fa7jDiae6GfJnHlg8SoQt//KsE45XEqMA03eRrsIlcQa5kY1MXGk2eYSVsGWCKXm
1raAvhZRNOkbhWYQooGyohevXf0Oeujipj7As3XOJMVLd2Ddlwh9b/sh0i3e67Kf
bHqTSXN+6mMmiHzpw08YoArk/g+/2XRqNoYE964eKBE5H54xSNWIQt13wgl76+3R
tJVqApPWt313zu6+jZT8BLkOzyQRb4COmqY2WvgN9JNwqy5ihYH5jBLjxIax9JC3
GKFYdrDD7GSu/qT8QfQPCx7/ZTyQ1pGrPOfQlYJkehsAePrk0UDnxfEWvbGJETix
0uMwqGcJChYt9HYJmeGm1PH19haX4PftKq6Z1nI0sIFIU975CQJ9Pf7AW6Z8PLsu
imD38hQPr7y9fLDRTE0Y7vVZfX3+SkQudJRF4j8P0ZF+m+y+upfdk7XYyk4WzwN9
cecrUMGHM7uIC6jTlWnoDoKAZlTRH5aCV99CGMhDUR5Wk6gF0DY=
=pSaz
-----END PGP SIGNATURE-----

--v7cnc46tonprs2m5--
