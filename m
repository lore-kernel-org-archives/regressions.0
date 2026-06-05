Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC9369999
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780691008; cv=none; b=aImejpJo+S9PA/+/RPdbzLNIW96UwO464hZaHXdDFU04Om1CZVq6Uc6CKsl0STCs+2xne3FnFFbXONYYKrBGr9glUTvanA3ByPNy13WXXwGwJKBEfpQzwrBJZ+SrEqdWQcAqTdKjqPSQN6os5Wb67y6O9+BHdRvfA3wzeM59pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780691008; c=relaxed/simple;
	bh=XqToqG4BsooDu9WMwpI/GqIjRSgDm2TzICZZqdfH/bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLEQ3gNCjJhH4mkRd7YUA9vb1G/lXCfedeImy/NpJsj5G0VPqgKrFsd1iB2LtNFOzGOqNtGfgGCxJR6NUxFTpF0FVEcw64/SZrRFVOvjW9EkmULFxRjLL0ZGf+6jZL8EFADq7AXVwKpN9HTG1Gan0MoOVPVE6W4lD5YJRnHbizU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=vPlxGV4P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BTYrkCDk; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="vPlxGV4P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BTYrkCDk"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 43BA07A00C8;
	Fri,  5 Jun 2026 16:23:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 05 Jun 2026 16:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780691001;
	 x=1780777401; bh=jSx63nC4ZcXLcoouCkiMDv0lr3rzkoxOQyEJFoa03Ps=; b=
	vPlxGV4P1vVVuHE1MXX9mmPcVnDheNRkGB9r7bxD/f6+DroTpss2P29jihUo6/ef
	uIohRvQZNHf4qEMety5y8L4/X97AIYwJDLDjHSgHlykKRtTVMB7b6t1zx0j/T+xT
	kS1QxQK+vCtZBKNnQOXdCMedAG5R/PSf/zZtNGvOTj0Zf7eS1jjrzu2IJbng8gJn
	zLiWQJfY24ZhWWqZsBVrzhWvpJ3KtsheIBJtHn5US10R61tEl/NIEdI/YcWD26TF
	rCvUZYXS1hsPUUR6fiVQfY2esbTQ52ivMeLnNRh0vCnbey8sU83WsxH3+CZalPpr
	9rFEnNG4PFfniTGSgphL4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780691001; x=1780777401; bh=jSx63nC4ZcXLcoouCkiMDv0lr3rzkoxOQyE
	JFoa03Ps=; b=BTYrkCDkLrGaSOylNfWMcCtixKIuEYIDFGP7Bqorh/I6AHvVQCR
	qDfi7rh3j8Iv7t0sGF4sHtslCS5Tl/yB8zjzjo41v3JjPvy5kZ6xXxXsfC5jMtuN
	IU4bSaOUDwUofT4sb3XMcempPeY9snY6KwyywQPGgDHV0yxxG9hMvh2WvfU64dW9
	omrBJgiZCALQ4hIcef86zJOWm4EavLJ5hmAnO8r0RX8rjj0V8/hCsw/CFDGndB8O
	TDD/3OYUXBeHH1N+S+TiMlyWLjd8Czd/XrdB1F4XKEt68IS4lMfwdAmArY2Qkd7V
	NkQEhKym7YYnqhUEhohPZvxP3gk8+L6kxhA==
X-ME-Sender: <xms:ODAjatnmBCf3UgZCMG1wuuCRyPguDrk5cckiGJaM3vjmrbTsygiHXw>
    <xme:ODAjaqVqKogM3w1wgwSAp9qbO5KUIdY23LFD2ZFMU8L85_171mu0gIsoSv1xkcaqi
    2Il4KQbXcol6GjIZ853TxIQMjQPCuLTrxwft7LDbVxPKCJeCKA>
X-ME-Received: <xmr:ODAjajtjEbEK1Pq8b_vg1Jhf3bKzkYAjG18FRJSjTn2UEDXNDWle0d-h2k0HzXJfU7SPIAnm69igNeWi9XjpDTM5Gdxe-IqmB04>
X-ME-Proxy-Cause: dmFkZTGRn7U7nlDd7dS7ixPO0eb37VzaivzndUY9brZKFBhDakNeAeBq9Dlv/wyksKlU/H
    Ndyy/Lop8uFgklAG+o4qW5oh2JzJ/+Hm1gajzXzEoA2YYd+TRLW4RbII/E874I7Y1kqTVv
    +zFJn9yw3j0QOrlaOT20WD1fTiptgbapEJTBAJJVwhbnmGLj/O9xz4mNzVzcVhOAMwvukG
    xLgDxOKUbL6WPLPnxFQklQAgUUhvLxlQ7tykQ/WXrezroLnCdivx1RYd7k4WWrzKn8B2pF
    FNtBgxFhrOH3kSDdWuv074IZCtCDkIlScG2pzHw0ad2TQXriqoT4YSpJQwFDBry5owL2mL
    VtNsjYKuy2KtzgtD0vasPXEztrpeRiuXqxif0OfcFW3ybTGB/ZUJcrsZGLtQliZhR6v4oL
    K5qoUYbqiOEctK0pLDX1zm2P7WSeeXWDBeKEW+oheb++NL4tR5UUNurrKqFnZ+li4lCSKP
    KSQGYwFzM8cveYtDTB3foecXeI38LULZxLp7DXikBVQc732XhhTQFGk85yoNHzQUF13Zwu
    TpBp5+9293qPLQjfWrS+PYu1BBgs2lKwdfAA+Ttc/BtPkTHkxWZsnaK2OAyCMUW8i6MFdA
    rapl0RhwkY1wCXpFeOMt1ncW59x6piC3b7Q6BpyILsKnoY1MdZbGWE35GDcQ
X-ME-Proxy: <xmx:ODAjatab7qtXqZuAV2Pi_kzJJa0LfkPVTMkvvY6Gd9nDxC7sojLywQ>
    <xmx:ODAjaiXmGygzfU974k2CavfMTg4gg26XGLdIsi7X5_r_N59nw8KX5g>
    <xmx:ODAjaiR9M1za50nLObjyYbgVuXZzpc0aMu22Natx-mqZ78jurX6pzw>
    <xmx:ODAjagP7TWLyt3lFIfWul9PVQyOhWuc_ieDpT59eewnccMTXqKCr2Q>
    <xmx:OTAjaqTxFZo3ywrG2URwVnAyvAD_TA3dBigUAph-o-J8-YG-6zrL8zrj>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 16:23:19 -0400 (EDT)
Date: Fri, 5 Jun 2026 22:23:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiMwNrdwzlowZDNP@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pb0aw0SUQmAYmZ9b"
Content-Disposition: inline
In-Reply-To: <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>


--pb0aw0SUQmAYmZ9b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Jun 2026 22:23:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jun 05, 2026 at 01:54:10PM -0500, Mario Limonciello wrote:
>=20
>=20
> On 6/5/26 12:45, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jun 05, 2026 at 12:36:29PM -0500, Mario Limonciello wrote:
> > >=20
> > >=20
> > > On 6/5/26 12:34, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
> > > > >=20
> > > > >=20
> > > > > On 1/12/2026 7:01 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > I've got a report that kernel 6.17.9 crashes when running a Xen=
 HVM domU
> > > > > > with AMD Raphael/Granite Ridge USB controller passed through.
> > > > > > It worked correctly in 6.12.59. Between those versions, I don't=
 see any
> > > > > > relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() fu=
nction,
> > > > > > but the AMD node driver did got some changes, so my guess is on=
e of them
> > > > > > is to blame. I know the good-bad range is huge, but there aren'=
t that
> > > > > > many changes to the AMD node driver in this range.
> > > > >=20
> > > > > Is this perhaps a case that only the USB controller was passed th=
rough but
> > > > > that the root controller wasn't?  That would lead to a case that
> > > > > amd_smn_init() was never called and thus amd_roots was not initia=
lized
> > > > > properly.
> > > > >=20
> > > > > So it would be a NULL pointer deref.  If that's correct, somethin=
g like this
> > > > > should work to avoid it.
> > > > >=20
> > > > > diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_nod=
e.c
> > > > > index 3d0a4768d603c..894823b444d47 100644
> > > > > --- a/arch/x86/kernel/amd_node.c
> > > > > +++ b/arch/x86/kernel/amd_node.c
> > > > > @@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u1=
6 node, u32
> > > > > address, u32 *value, b
> > > > >           if (node >=3D amd_num_nodes())
> > > > >                   return err;
> > > > >=20
> > > > > +       if (!amd_roots) {
> > > > > +               pr_warn("AMD SMN roots not initialized.\n");
> > > > > +               return err;
> > > > > +       }
> > > > > +
> > > > >           root =3D amd_roots[node];
> > > > >           if (!root)
> > > > >                   return err;
> > > >=20
> > > > Thanks, I finally got confirmation from affected user that this pat=
ch
> > > > fixes the issue. From what I understand, adbf61cc47cb ("x86/acpi/bo=
ot: Correct
> > > > acpi_is_processor_usable() check again") was not enough.
> > > >=20
> > > > > > Original report at (with full kernel log etc): https://forum.qu=
bes-os.org/t/yet-another-usb-keyboard-thread/38355/8
> > > >=20
> > >=20
> > > There's another patch being discussed.  Could this help?
> > >=20
> > > https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_cra=
te.local/
> >=20
> > Especially with 2/2 patch there, yes, looks like it would help too.
> >=20
>=20
> Can you try Boris' inline proposal specifically?

Instead of the series? No, that's not enough. amd_smn_read() is called
=66rom quirk_clear_strap_no_soft_reset_dev2_f0, so it would still hit NULL
at amd_roots in __amd_smn_rw(). But if you mean instead of the first
patch (but apply the second as is), it should work. I don't have
affected hardware, but I'll ask the affected user to test this version.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pb0aw0SUQmAYmZ9b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojMDYACgkQ24/THMrX
1ywz8Qf4zzEFdJT+Q80rnzqD+H+YPyFWTViPsKtSYSzIDQdWi2w76LGFAIrIc2mc
Tw1m2cH+2MTCZaWNsEBJkem1N4kSz1AM1kIK3zIf8QQrm7E62+Qljq6JfG3vQLPC
HZLJciv9VwcDqK/tchQDejnvsRzcOIphE+FyWPqWvdXzomO0bYWOlNRZ1iyAxFZJ
kxtdXg7OEor4CH7kBsnku5/zD7Q15IHKdQbqQdXg37m6J8PsqgvhQKwjGPP3dt+j
hYIu60Vgv94pE5M7dO5eGuI3tFsJL5WHgrnQKPJM8vifue7SImCj3gG+v7MSVe6j
nyTzQLuzJ7KOznBnT/6pbumXT8zM
=8QNm
-----END PGP SIGNATURE-----

--pb0aw0SUQmAYmZ9b--
