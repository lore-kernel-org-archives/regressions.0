Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6E91C5D7E
	for <regressions@lists.linux.dev>; Thu, 20 Mar 2025 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742465436; cv=none; b=PMkxVLep9eqbJVjdaanUQJbl3Ut3qu5qaPqRpX//PRNKI+SMMQPmbzvmRMOm3F8ox8+430LRaTnG9RmPc3LchMiOY2JHyFNX496Z5LaIpA6arx8g85GfwP3TqtlwkMlwoHNBaBTfeuW508IdbEAFfSzv63d7DpfmYylc3ySwZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742465436; c=relaxed/simple;
	bh=9i4rid+B0a9M1As4dYtLsRM2QicGrXaJS0sxCKnzXNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7Zib2vL039JiPIQdZo9Ym09bWfUGN0c120LdHR+uymBeF/3iCeA/EZbqsxDPwBfPjzWrgakTlLgWycTak5e+dzvf/IP0mh8sL+XponS0lMCY9E2K4F9f1GMWpPeRjaU8z00n8YcNzdkTYYR3FU2On1UbnW+XdhPhm42FpVhP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=z9NVHiNN; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="z9NVHiNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1742465426; x=1743070226; i=christian@heusel.eu;
	bh=O259WitRMnPNf9M/mfci2FGhbtrEcN/0vuq9437Gs1s=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=z9NVHiNNvl56hXy3du3DZBfk0pMh9tOrzWw6g59le2nWp1MpPcNxR4m8bVdK1guS
	 +DvGWuqNTeUzdrewQQuYobTszB/lDsXiU+d/wcW96t9pvYn+ZmWc1P4RdvJXgnZSb
	 67AXV7OaXSGRdep0RYdMN/DioBknOwuoi2j4A/hDYZHMgcwj8arq+NAw/IQJ9k9/z
	 cPtT3OwJtSP+sRNpqP4McrHnFqkJ8y5vJALP3AQ22jBqG3DZ+/V0ebO+E6WsXa9CW
	 /tAxmquufoEDVbakR88ldCS60KFwEzhoAtAPeRM7zNzOOMwRMi5GcBppUV3Qovg7X
	 8nqtYg6u9fZC1zHjWg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGhi0-1tz2XF401K-0060yv; Thu, 20
 Mar 2025 11:05:04 +0100
Date: Thu, 20 Mar 2025 11:05:03 +0100
From: Christian Heusel <christian@heusel.eu>
To: Sergio Callegari <sergio.callegari@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
Message-ID: <38658f1a-216b-470d-99a2-13d66f075c77@heusel.eu>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
 <2025031923-rocklike-unbitten-9e90@gregkh>
 <5e260035-1f1b-4444-b3b8-1b5757e5ed08@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxkrpkjabcczwb7k"
Content-Disposition: inline
In-Reply-To: <5e260035-1f1b-4444-b3b8-1b5757e5ed08@gmail.com>
X-Provags-ID: V03:K1:gOaDmC79hKQhWdK0xwi3mecG6DIwVzHNHUKXV/828rbHLlLDhwk
 2C9O3l/3vA7hScsrZKQV/QOD6IAYwZ6s/8KFCPd81QL0lS84+k7tpTRkl2WMyTZV0m5t2Do
 SxW2oZy8MqT9BzCMSLtaXojK20sXtQxOoylS19TOGqSwuOwiBvVjtmp2LNKTwblrk+v/QUN
 cta7XB/kJYNA682mKC2Ng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AZwipQarY9o=;kXMwyNnskN8p8nLO6fshtNvLaTG
 l/Hq6dwv4z7MnXvKgL8a5E/tq5BdYCTZcacnpMdAjzZo0nr+bi0SepO3jgGg4vV5o62UcfOYw
 Dlk2piU/VWrTgGt7uHQlsGz+i07rjfpWifkZ9lCrQhuZpY/c+9gFsoqKVyjLuV2MCKBUbuZaT
 uucxlapnPnyRGfwVtAzEZTm5SCJ2TGlR3dTLsy5zE0O5oUkX151p2mGUn9pwRqrrL7TcaJpHl
 rnLKOyKZGivFII15LRgxVwTsTRPhewC+CTVAlnNHjeIE1LwTODuc+w1hYmh+RxwkXxgqBcsgI
 VCEA6cTxQYGe3fUXLdqUNADbpexReUVVzOAePRDYB78V1dy764yIfn1tSre2uPtuDz2Q6VAIK
 YvRNZ7/AirtM9roHhv26ZfF5zQBrBV3lpa+ReeMeDVLfwjDEuzrV7bzsx6QE2D/0x4xBbDm5E
 7w9YHu9ipwdKwRv8O90mmPFStyUwmxMrOWjE75EKCKuJVm1C87crh5nOv41YSog/Xv4REraH7
 MiGZVrmtVxO5DRSnGpQrrujWnOTAMNen62E1OGurNbMtMshclECZMhRYgNnrtC8xcqZaymZhy
 nwOUIe7HH3omcyX4q/cBwPKdxOhrl20hfC7YH3GsSEml+Jp6JSgiFbRdfbq7AlfRjLLlmuDtU
 K1XSNfDl44ucZkECA7BrEFyfWMj+/JMvzUFPuw4JNNTPWb8sVF2jJwCIK0xXAm4jaw4EH3hXD
 YHgxP3H9mPInq3dAmhqqHVU2rqS++OIFs6IQY9z76qVc2A7RmyaL5+XGiFF/KT8vELBQgf1EB
 tNrARH3qryME9sft1ulULXVkHeYqBS5p/40zdaHYvWyCTTiVv/DxgdjTL74LmfaGwBN3KBLVc
 n/3i29LLVwRae1FroKMrmQIhgWT/M5cyjOH+Sm728F+Rm8s/WefugJRcDmw8uxHpknttrr8SD
 K8hFmY8ukXBGwiwm3VKr7dIyGNIWRm0sAPqiVz6+xaqEkZqQ0LpbpkULTJaR3sW+sX24A+O0x
 1OHgreiemxVhADWEAQ0E3Nqf7yoaQWAHRMdYZMAY8FEgrUcdRix/T8M893Xra+clLsYrJAyR2
 Sm4LXEhlj3KJrpKQ8q/LOFbPt6zoyRlYMNckeqsjOuvYxtRrysG97f2f7loOpRtTLqHMGMOr1
 3aAdwf1EPGc1qDpMygn4m30g8NT/kG6CIpz8VrndpuPWH/AKgCnTDpPz2CLuSXBbtIfxqxiXm
 CL/mNPKHZRfExQHGaQYJ+a2MnLwhGr8AvLP8Z6GDdUGY5oV7TabjkdH04a9CsKpyO/VpgfPP8
 DzR2SbfLzTliAGe+2SyfBV47GVD4G65JLmQpcw7yzkg41muuiIDXOLyPjyc+ZUoB+77IdS3vx
 OjneHYjoR2jYe6WLfVhOKuplCZ6zav2lu/o/E=


--uxkrpkjabcczwb7k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
MIME-Version: 1.0

Hey Sergio,

On 25/03/20 08:49AM, Sergio Callegari wrote:
> Might be able to test on the distro built kernels that basically trace the
> releases and stable point releases. This should start helping bracketing =
the
> problem a bit better as a starter. But it is going to take a lot of time,
> since the issue happens when the machine fails to get out of hibernation,
> that is not always, and obvioulsy I need to try avoiding this situation as
> much as possible.

Which linux distro are you using? If you're on Arch Linux I can provide
you with prebuilt images for the bisection :)

>=20
> Incidentally, the machine seems to hibernate-resume just fine. It is when=
 I
> suspend-then-hibernate that I get the failures.
>=20
> Before contacting the network driver authors, I just wanted to query whet=
her
> the issue is likely in it or in the power-management or pcie subsystems.
>=20
> Thanks,
> Sergio

Cheers,
Chris

>=20
> On 20/03/2025 00:54, Greg KH wrote:
> > On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
> > > There is a nasty regression wrt mt7921e in the last LTS series (6.12)=
=2E If
> > > your computer crashes or fails to get out of hibernation, then at the=
 next
> > > boot the mt7921e wifi does not work, with dmesg reporting that it is =
unable
> > > to change power state from d3cold to d0.
> > >=20
> > > The issue is nasty, because rebooting won't help.
> >=20
> > Can you do a 'git bisect' to track down the issue?  Also, maybe letting
> > the network driver authors know about this would be good.
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
>=20

--uxkrpkjabcczwb7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmfb6E8ACgkQwEfU8yi1
JYXsRhAAtiyY1Lg+xIe2aUbc6YNJoo+YiB+IMbohEVRcluzqaGiGhSWPvRv2JB6k
emHerCCLLSUd+uDuU0yE380AqquXKsb0jikzxkR2BNluCdmF0Q6zxS6PoLUqqh2g
oxp7XwOaJ5VEksLivM9tc/O0s4Tn+V4wfW790P3P0HwPi4lPGFXegrxxE5dykSzF
kPGgUYCE1hmI4nLDQ86jax0CprqfE5THkuiwONfrcQLfSY3Su8sb9Ez4nWFznt8M
cqiL3qBmOCVTGZ68LiRvbRPZ/7jVxNfeE2/fYeq5uxEs0u7eO83mbOv3nenTB6Ac
qH6Vta6mhy0Tp4K7qVfjx7o4nSzX7/GukoVjy4yIcJl0Wp1EqCjP1Y4skadOtKX7
/hopjQCHZbkWWQAi5ncuw0fZHrykqkhb45ZW6sdtn7wro7scYKyqkmJV9QyFj/s7
O1qAIRNd4IAdmtQN0XRTmD3h1vULKzbx7MfkthyPYTynpp4aipXWvewJLEboqkdR
hkU0YyLzlfXcFTNy2EvVJ2DNYYyenYoHLAANvr188od2qeO5L4il9a2eJskuzwlw
fxof4tkjkOj0c8aRGTHLGgF9ZgaFkFrG+uzkoGOWt1fAERIsWwznpIfo4ZJCJB+W
Kqz63UdS7cRPGV6d5mVL6bamGu4a/9VRVtQUI0RKr5hvbSKctec=
=bzAH
-----END PGP SIGNATURE-----

--uxkrpkjabcczwb7k--
