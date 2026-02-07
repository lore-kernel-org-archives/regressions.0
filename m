Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236AE330679
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770429464; cv=none; b=hcj9595Oy23U3AtIJd3II7rcNaBNyZMYJj8egQ3d9Vr6ZCCEaS0dVkk5OIMQTYwlHlf2oIIbK15/uxTE/XD7QgzS2Kf3HXv6E9DsISQkTZQjO8WA9xTYSvr0Q1reUnuDxuicJWq2YdUauwf7LFBQMjPoDfHbCOEsbVASUKjUpNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770429464; c=relaxed/simple;
	bh=MzlqmlMqFe6mqnskofNZfewcsgDXQww+sGSfqR7sq/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=We+/Y18bcMULkL+d3heFfbrkGbupWia6Uzy+SeqMD5kKyeizSWmYgTMUj9UOIy4iFiAmmu4fnuOH8vnkgirMUE7MdF9yV5W8/dd9c0hfkBjhxjwSj7EAaA3oQEOCTKWKEYlRUQ0+jtTuuw6FCHvYDmu8bgkm/wWIkbF5EAk42Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=O39dkXgP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bNOnebxL; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="O39dkXgP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bNOnebxL"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 324037A0113;
	Fri,  6 Feb 2026 20:57:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 06 Feb 2026 20:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770429462;
	 x=1770515862; bh=cmQTkP4/3762YeXKHkyZmWDoHhTvhIHj+3rMaZwRR60=; b=
	O39dkXgPNXJCXYglgsDeciPmy1v2WIcEU01cgKR3DNPY0XDXFPTZeg6FiTZKAbk/
	OwCjxj/SNL8gftJymyZQfTyuIOEXFD11T60Srpx3dqOk4KdFFh0fYulXTXvwyWrq
	C97NE2sq74CKY6/bDR+2EcvpINqMilysKMiZOZZgfs4s1viXyLKJbXXL6+r4nfqy
	CFwmHdL3wGJ+hlCOHDT4PptxN6Gy5OFUFmzYY55eVG87LRuzwfLxsEANvW1eU1RY
	KFRqTzuxtou6Hg3dB1vJFFfO9nj1wXIg2pCZEqIN8lbvsExVAfVxYWOyUt6cdOR7
	ZP/L3Wr6stUIktRYpDa8MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770429462; x=1770515862; bh=cmQTkP4/3762YeXKHkyZmWDoHhTvhIHj+3r
	MaZwRR60=; b=bNOnebxLBGP/N8w8JbxAK7EfjZanlxfPjd1QxRmbxI/XvjXr8Xe
	+JuWbqkPerxhia33VH2seb4iKJC4NJt2CLz6LvuCtcj9ic7wJoZxFNcp2XEb1JZp
	JUlBkfjbWfXDAx8Y2VcoL5+yiOgXyGpvU+S6C45GR4eRSeseQkRXloj1pfoMazmm
	Uo1FD9kTlJqcsmlkox+z7MF/akqpzJIXq9U9NWHOIbD6+EgrZAmySxsXpdEWZWUN
	u1jE+wFx2pLltF4gz5mRvUOD6NJb+auZSjhHIgU0FlTJjOFL2tbPsOLpi8oAe2Nw
	1ZSBBD88ObxSVtxAN5E65di6vFNTqU9E6hg==
X-ME-Sender: <xms:FpyGaXssFLrn8vAM1ecbcYKFKdSZucErJYrrV83hbLNer5pHCxBWvg>
    <xme:FpyGaZ-ckotzX7RFnrGLnUkgUnCsPyQ5RxMR3_O4eHFQG2yZcGlrDWMfYFjw5-pg6
    DITx4pzLHrDSBXO11tUkgs354v8rNkvI2fNwfnlNrfzUFdw1wQ>
X-ME-Received: <xmr:FpyGaa1GzZ9Mh1gx8fEJd_EPn3amf7pzEEm0OZuHmljOK2n4LOdXehM3YsD7ekTyM8jfLpdDaGloCFAawBmY9zbbCG06XOBaK14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeljeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueefuedt
    iedtvdeltddtieejgefhueejfeeiteelleeugeetkeevtdeifedvfeevnecuffhomhgrih
    hnpehquhgsvghsqdhoshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeihrgiivghnrdhghhgrnhhnrghmsegrmhgurdgtohhmpdhrtghpthhtohepmh
    grrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopeigkeei
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhs
    thhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:FpyGaWDfXqky2ycdwontB4D4vHUq0Kd2sOfsytObO0aO1WG1jRNQbQ>
    <xmx:FpyGaeejztxvUFFRwG8U4TO03x8lnkYjDyB-tve72mFriFlMxdfyEA>
    <xmx:FpyGab6Uog2TGAoOkFmQFVOW_PnGRNHrUXU2y1mdpT9YwjVjrA7Guw>
    <xmx:FpyGaZVjxwtoWt6mJSXUAM6r8JUfKKKnQOujpyBPzL9lZU0EJzzgAA>
    <xmx:FpyGaa74jVqO5SAENTcGElzH19L5KLbfhjXvcrvmaESRavq8POS0Fhuf>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 20:57:41 -0500 (EST)
Date: Sat, 7 Feb 2026 02:57:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aYacFOY-u_PDtagq@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <20260130165953.GA1618638@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pbzYgq6OSHpPmuJj"
Content-Disposition: inline
In-Reply-To: <20260130165953.GA1618638@yaz-khff2.amd.com>


--pbzYgq6OSHpPmuJj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 7 Feb 2026 02:57:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jan 30, 2026 at 12:01:06PM -0500, Yazen Ghannam wrote:
> On Tue, Jan 13, 2026 at 02:01:34AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
> > with AMD Raphael/Granite Ridge USB controller passed through.
> > It worked correctly in 6.12.59. Between those versions, I don't see any
> > relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
> > but the AMD node driver did got some changes, so my guess is one of them
> > is to blame. I know the good-bad range is huge, but there aren't that
> > many changes to the AMD node driver in this range.
> >=20
> > It's running on Qubes OS 4.3, which uses Xen 4.19, and does PCI
> > passthrough of USB controllers to a dedicated VM (HVM).
> >=20
>=20
> Hi Marek,
>=20
> Can you please test with the following patch?
> adbf61cc47cb ("x86/acpi/boot: Correct acpi_is_processor_usable() check ag=
ain")
>=20
> This is in the TIP maintainers repo and linux-next.

FWIW I asked[1] a week ago the original reporter to test this, but
unfortunately no feedback so far.

[1] https://forum.qubes-os.org/t/yet-another-usb-keyboard-thread/38355/20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pbzYgq6OSHpPmuJj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmGnBQACgkQ24/THMrX
1yw3aQf9Hy20zmtNhr64EpajLgXYV6HR+PpW+KYag7HOCZBOVo40+ykcUe4a7RKG
rMw+Yfdi88W9hz8ki8AowtxXYrpm34HIXGUpDsFvMEwBM4tHNZGB039QAqTY7k66
alI8ydcchROQZWqFQlDgYvlD43B9I7YvnzNPlY8iwFCYN5n04wqbkDxobkB/zKCU
xgC3zhDZbR7kuC976F85Q24Sd9VWnGD4JXQ2d7oQwIDR03sHtGe5obgebPhC8t9P
ePfgejX3G4yJbk7O8p4d1tJ5uUWJmQAW8MpsEo4tUMwi66NrjfB45okSEHjuqbuB
njiul8T8XjK+yYrPhHsoqdyNQ9x++w==
=Tg4K
-----END PGP SIGNATURE-----

--pbzYgq6OSHpPmuJj--
