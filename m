Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDD40B369
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780702629; cv=none; b=hc+Q3L5E+WL5mlRySxV1rVefIhKMQJB30fMIczMMZyx03gGlhlawfLRIeon5DkpW+0zp1eeqejSUuFKGeasDYB30uqJ+TX9CCA6YX3JNLH0kIm1z/8HbjGscvvE9aa4l+aRGaAX4Adx/9zxHq4S52Vo9hW5i0vVkB84NrYyygHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780702629; c=relaxed/simple;
	bh=c1A6tYpTwDdGSZk5IPgK4uAxXItZinzcJNs5yD3ebS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UU8+AJtuQ+hqGZKzrrdi7XkiDr9Dlcoa+yr5bQL9+xG76RMp5FYIIXBrjQzlXuulh9CqI8n2XdLiVEsAAQtZxEUjfuatuLhDdjY2j9tAhn8NAfVOcBpCpgtXtweDeshYxHG8Wz2vxEutGUj0gRbjRYhE1zufa+Z2LzjGn7PcdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=0+rgMI1/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k+ae0SYl; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="0+rgMI1/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k+ae0SYl"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 340291D00117;
	Fri,  5 Jun 2026 19:37:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Jun 2026 19:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780702626;
	 x=1780789026; bh=IeHxejRgErDLvP2FxIb7l7ZuRh6N++wFALrrnqAXuq4=; b=
	0+rgMI1/yr55dQxc0DgSlQc8+IapcV1ihirinNbQ3rwwZSWJJXjnQeIMVIWsck0s
	QoOeqSrr/s9+hHw5s2lpbr+n998RuFiXDyrK9yvjlvcSomQa/hUIMUi/zpKTL6SN
	4osQv/wB5WfkTWJkj4eJewV6EYETbfXr1k4ID7RVsYuM8xucQbUC7cqxie8cl2TX
	2CBjDT5FnBHVBJTWFEz4XcGYbjar+MDuhWTyri3xn3B8BlQFabskgLb0DUqz8CqG
	vjF0eoX7oOatcKklaAdCAiVCCZtNr55TY1dLgGURBwP0gj6VYWjB53sn/G/8aQBP
	FPeVdkx/aVraSeKuN96FCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780702626; x=1780789026; bh=IeHxejRgErDLvP2FxIb7l7ZuRh6N++wFALr
	rnqAXuq4=; b=k+ae0SYlQKhFAM42hUs+pT7QX1MUys0PClSuOVLXIACvD4i7SXj
	LUeW0hh/aq3OxQy/4xqwr0YVLrYDpVgc9ejjI8UZOuzashU9GbPP3VTXKGDBMoWn
	x6N6+ERM0kOqvP1sdbZEftkS4qtxhFxiHzF6RDtL3aEM16L9pXFAy1ztVBKmdCus
	mM9aQemOaTl4bup8y/8RFE5at4TS5Sla0x2TVhqbN2IWX/z3wFfb8Lk44iGOtAck
	T0tJqK7AWTHDU4CBEq/s3reufdXnXLGNE2PEeUCEiOOji7QJd9vkuuQhJLy8tqvB
	jwXqfYhD0qeY2ngnM7/cis96M6kZL6livTA==
X-ME-Sender: <xms:ol0jaoQ87g-qddCQOZIOam0_N8LyHYi5WMXorXW3dCokM1Qn-f05Ww>
    <xme:ol0javHLa_h_6DS25ePDZyDqzf8mCr1mlXkMJ4oQv0ukVsIVZ0kP4PDnCpGqHILCs
    EQXP1Kz65_6aC7MAwnC-VSJkqCBaBtKstm_Sf-7msLs4kjEUw>
X-ME-Received: <xmr:ol0jatEqwgVyqbIT6FNIQF2wRU4gfVJJy9bKsMNJGBB_bUUpTRVDhrwW-n2tnoSURB-XK9AP98tb4fBepqHS8qQ3-UyHcb24pr4>
X-ME-Proxy-Cause: dmFkZTGanBTS+IrENPP64Q3hDnyJiEw075DLSD1JIZXSSCKMeo5uHW5ZDESO8iwicH2vui
    /PY1XNhn5dol0VymmGSzyfzCkqDnQkKa644ZirfrCYo4qNV9hJrXm/VcTfC3HXsrbaoZlh
    Oi3kCZMNSReyDgISx/NzL9O6clWlg+G1d8Us4sIrtJ9I2DO5cpRpwnfRzbibgdWMx2GepV
    qHAnH3Ms5ippMyhVsbhn+qHOPBkCJmjpAfzhBqf/GkefFQfxufvzwhnwDEme6PYcY3dh5a
    4hn+VlLBXbfi93qKaJ8D4ewsh+gfiOfWh4Css8qFz5JAjPa/VONV3VxqWEKhZnjXrb+wP8
    7ra+xZ2A37BHXWbh1qB9lfiJn1PsFZLG+97eZbZi/9JIYTty+U1mq05faBp9X+lIDHYD0x
    FQYjHO+8Xs1YSn3WMBp6WtuNd82osfHZFu75nIfUWcB8k0cHUpMm1E4jtHUmOLnVp+d4GB
    AQ8PeoDPoI9xSm5cNMwD5JdrDqQoxNm2XypjKDAb18Qrg/O4tLbWKdjY9nGKaNLZW4rGt9
    B91rn9IFOFoOw+Qsnk4+//Z6V9S+hzBDd8w0IjbSp0XFzml/X2WHD8Oww0vIWZsHgUgD45
    16Zd704Jh6Mu4qZPkArFr3qFZkouovK/HhkXwnJLRsxkinRDNsJACneACWPQ
X-ME-Proxy: <xmx:ol0jatQfACxGOYUZfi8YUIEvUHWK0CjiB0qDrKYt2NqyEidhNQjNwA>
    <xmx:ol0jauJ7HhYh4_Zq9bJuxEHGyaDOfY-r07j7oV7I6AjD51VXhi1CZw>
    <xmx:ol0jaobPbf1Iz2A0yqqDBIjaGgFjhzr7aTu0PG-K4rXt9W0Cn8GYAw>
    <xmx:ol0jag-c__7bWsnVZidiKMQFt8PK8ou4DRl1m7fIr_CgWYlxC5XTfw>
    <xmx:ol0javLpYGfsSL5MjteU2VUxwEv-XVyIqY0ikvDLWRD1AnYdVcgL_EKR>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 19:37:05 -0400 (EDT)
Date: Sat, 6 Jun 2026 01:37:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiNdoGL2JCC1VIiW@mail-itl>
References: <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
 <aiNF5HXO4CksO_NE@mail-itl>
 <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>
 <aiNQVHXAvdVhZrZn@mail-itl>
 <20260605230949.GBaiNXPZ2ztjVL7DBg@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysrED8OdaRdFsXQO"
Content-Disposition: inline
In-Reply-To: <20260605230949.GBaiNXPZ2ztjVL7DBg@fat_crate.local>


--ysrED8OdaRdFsXQO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 6 Jun 2026 01:37:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jun 05, 2026 at 04:09:49PM -0700, Borislav Petkov wrote:
> On Sat, Jun 06, 2026 at 12:40:20AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > There is nothing here that would prevent amd_smn_read() being called
> > inside a guest...
>=20
> Yah, there should've been...
>=20
> Anyway, something like the untested below, pls give it a run.
>=20
> Thx.
>=20
> ---
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index 0be01725a2a4..52eff7fac667 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
=2E..
> @@ -311,6 +324,10 @@ static int __init amd_smn_init(void)
>  	smn_exclusive =3D true;
> =20
>  	return 0;
> +
> +err_out:
> +	amd_node_off =3D true;
> +	return err;
>  }
> =20
>  fs_initcall(amd_smn_init);

Is it actually guaranteed to run before PCI fixups? They are done via
fs_initcall_sync. IMO it would be safer to guard __amd_smn_rw() with
something that would also detect calls before amd_smn_init() is called.
Like using smn_exclusive in the Penny's patch, or amd_roots in the
Mario's patch.

That said, amd_smn_read() called before amd_smn_init() would (should?)
fail anyway, even in non-virtualized case. So, maybe this approach
(still crash on NULL ptr when called before amd_smn_init()) is
acceptable?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ysrED8OdaRdFsXQO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojXaAACgkQ24/THMrX
1yylhQf/bi9udZKsz55ESML7pTNGlwliUgrQvzgCii6iA16A19QZfkp4S+KXOzHp
ppW56RlvhG/6nol92xp4M1K1adfFpLuTf8bt+LXNWm7AHnwBWcmQEEDxnsw5WSGf
TFjlTgUpTerARvHj37PsRXzunBtTllbATmc7+rL/gG/FVbJWUDNKu7k2ISge3S8x
1whJ0d95tMBr7sYPykMGWOPPGzp14EPkitCxGyVsMhgXK62QBUrRKLncHt4wOZ02
h3YgXp+VphDP5cfuSwvFJ3haCfRufljjlu3plMwTfgU8SFIW2EsL9RlJqb2FYjbX
LDyBW4Fl1hgwAg9UYCYIoWEyH1l/1g==
=EMRC
-----END PGP SIGNATURE-----

--ysrED8OdaRdFsXQO--
