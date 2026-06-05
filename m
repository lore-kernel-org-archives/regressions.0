Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387213370E4
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696553; cv=none; b=Z56SjJhJ8x1+RaVLbuGzOCPdsWdszq1qcNBitD+/T7mdcf2NY+1fRQcg4PGtEuFHSQaWvGu5Kwc9fVemS8oX+3IRgZDx0tLITav2l+2JUdHMfDz7Ck79fRZaTMunIR8kFZxVHlQAyYXCBNtULH/zC80fWOvCrpUT6bgSPljX/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696553; c=relaxed/simple;
	bh=UweiP+CcwXyn6zakY9yh/GQ8m0ZGw9+MqgNVtNezfyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTt93Y+jIApRIRFjLJzFqizubLFImjLIVTlSu9q/8Sp3X1ykP51TQKLeD4QfrL+BEc51OgY/rYF188vTUnICL5uYiloyQZz7L+0EJKiKAcJ4Ex7vjgwKMH5D0yl/2fpr4PjXfSqrSkDYzsPtTtgliWqMgHYQwPh5U4al7WUH/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=3vxYcC7t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gy5l6keS; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="3vxYcC7t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gy5l6keS"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 790B97A015F;
	Fri,  5 Jun 2026 17:55:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 05 Jun 2026 17:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780696551;
	 x=1780782951; bh=KehjRnMpHuckF4NP7tGeEjBiS+ufbuCPt7Qn8b04YvA=; b=
	3vxYcC7tXxxDHG01ncz2qol0TygqyVcwp31jaD0KzgR7kvRyoqbD5IsFgbQ2aQTr
	BM+TmP+O6747+byZsAIJSWxmz9M0pzEIepJ8n/C5KJokVala6EFRs4QXvQIiVyds
	Qd3bP7cLgvHI9TCIBjVwtaKRz7snICDw0gkstA0bh8QbBgQzcU6PzRDa3zK48PpH
	Q2JbZF5/jIJsKcFCU4SqeD7wZTCFhtMBjnHgWtgGbotrl/babglKAMwh0Bt+5/iG
	t6NLcM0Z+70O412UL3lCn7N+8ZM+ojC2ZTyfagoq7Y3UBHcuTR5ndDAvfoSFR0Dx
	QmJFDDG7tD1zDClZFuin7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780696551; x=1780782951; bh=KehjRnMpHuckF4NP7tGeEjBiS+ufbuCPt7Q
	n8b04YvA=; b=Gy5l6keS5MMEhK8o1Qkg4PDoipHA8p02cU+mv+0Rby5Zw/iMR3d
	g9m/mn/u8IIPMdG4FTITzkr4T7tYcXWeJbTybtqCpFcYV1C79j9CyFYjW4bBCLWN
	FfrzY4eceszjWP3ZndmELBZVolk8JS8Oh1kVztrAcntCYFDyJJF62JH/45E4e4+c
	FWKvfPL9k0Cb4/2sxFnpy90MnU9VXOJB9a7oPh8BL96z6cPfH2+8aJteZBNX8O+O
	mtixvQbKCqKm+2m5EOYbsewaJXcu6muGanXxyYFZ1I81WqaQXY6fYHwdDO9At9RS
	HLLJe2wTCTcFUBB0TsClC6Oo3xe2SxHIPIQ==
X-ME-Sender: <xms:50Ujait3AQX_Zpz1Tt-qyjmkkpmCsBU5pGXPGvyRwLypDt_Nkyt8Mg>
    <xme:50UjagzPQXwJUs1CVxZKWFhbvV5KYBRmD5S9tJEi3XPe0EwfIg2Ukg647etCVLQ2k
    0euShG32-cvc7hxSV0DsYTx_Y8tY4EThacmPVIujB0SOpvRBA>
X-ME-Received: <xmr:50UjalC_j7VwMPuI18vW6tj12bH3SUdlfV8IQKD-vX2pUibJg7CCkS8u1s7dDIjrJ0TmLCXF0k0BAIL6WL-AsDFRCs3DUW6Ohkw>
X-ME-Proxy-Cause: dmFkZTFIyVdIQMJQQXE1OEwHG7zouR8FR9FKGA77aAqfGj5BMPuoY935irSXkDObFeXyrF
    fbyYVj+PBs9NLFkyKWgcgTscGoHleVtCm2BZTqbbRSiLEGoixXmI38soFoPs92hhdFo/ej
    o5yBoZN5mPU3ni/sQx0wcqARTJ9mJMjD/WdYIzI49qU23p9Z1Dzj6RqXCYgDCFqbQlaWlQ
    Zpo/sWr1vjKq4B7ta4vDsFzwxOoXZLyzEefBP6cz/s8F/red2usEoKpeVFS/FytaBE0F1n
    0DsTaWU8bmnPX9GhF+GAtwhLzHSScsA7mb7BknVCLZcLL7faevStCWViVz3nmk5+SQ5LSN
    6mjogtxKIYV7vGnkETRM0LTYNtW7y/8/8Idgwq8WjhGZXqRFvte5w0xh1V6gXbN4xLynjC
    5t5AF5ILa2PXeNWj69MJONez6rXbETWDr1g9trHP1swjiTdsHz8g4K53A3VpDn5+N33gOz
    JQSCN3V9YdxxabvpREF3W8+9EfnM4omqNqfA7ty+dpNt708D04ZFOuXxkH/1p3m3ZiqBQF
    LxZ+DEviH86emEzJuFNcvY/Ldl2dbMqhrKEwoVrix82nW2d7J6hqBQVE8T2agZyTc0nofM
    QI7UIbTeqqRHxRaeRNPtnVZ5MVYNJpIhCS0ykLXsud1vm84TQS/rU/Fx8V3A
X-ME-Proxy: <xmx:50UjaudzBsEa_fFagoizuisjpAhymzxRtiAZiSESUXnbWguRFCfr0A>
    <xmx:50UjavlZ3TRd1yG3M0UbUeIL12sgrZ_bIkmRccSN5Le4eZdaXtO2PA>
    <xmx:50UjalEJbz-KDOg-3NEOGT2jXGE0z6qp58ABmOkyQnYzI_xOJRl7UA>
    <xmx:50Ujan6ZlYTDy0g5Ybf3Srmc3WiaFA-r59CDbmrnVNGyQ_tV6WXtaQ>
    <xmx:50Ujauz2LoPSNnS5_Sw1o5DVmcDli9liozXJe6hIsjGTr6TWrGojUmTw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 17:55:49 -0400 (EDT)
Date: Fri, 5 Jun 2026 23:55:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiNF5HXO4CksO_NE@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gXO73+U0q5fmh4uv"
Content-Disposition: inline
In-Reply-To: <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>


--gXO73+U0q5fmh4uv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Jun 2026 23:55:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jun 05, 2026 at 02:15:43PM -0700, Borislav Petkov wrote:
> On Fri, Jun 05, 2026 at 10:23:18PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Instead of the series? No, that's not enough. amd_smn_read() is called
> > from quirk_clear_strap_no_soft_reset_dev2_f0, so it would still hit NULL
> > at amd_roots in __amd_smn_rw(). But if you mean instead of the first
> > patch (but apply the second as is), it should work. I don't have
> > affected hardware, but I'll ask the affected user to test this version.
>=20
> amd_smn_read() should not happen in guests. It is that simple.

Well, it clearly happens, see the call trace in the first message of the
thread...
Do you suggest the fix should change
quirk_clear_strap_no_soft_reset_dev2_f0()?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gXO73+U0q5fmh4uv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojReQACgkQ24/THMrX
1yxDJQf/XRyqtYhx+fwvFXRKHvxjqx9H7F1a+VVKnhzWlqc5SF6a7GFCZMNOwtLZ
W6ywU582sAv8lYqT0zKlZ6+8m3RtLOKmQSGwAjgpbVjsODAhCu5C09Kb1m3nHolO
qyrQj26sHb3WzXYWK6+7r2MR6/PUwMN8AkgCy/+0TVT0acYDFxWSaSpLC45yODqh
RGgzCfTvpWDW2jLRBPFDnB7VwBYlPYcRKvczR9R6tQ7XDwEpXeUcjzTzuw8QoJNq
Lh6a1IcoJD4i7fDRXhzNojCuoogacXnfsVIxrkTY0e+EQOftTxjLZZd/mqYtcc9O
dK9H4H7FInS5Ncn7+XR2LdK5t3sLJA==
=KNKR
-----END PGP SIGNATURE-----

--gXO73+U0q5fmh4uv--
