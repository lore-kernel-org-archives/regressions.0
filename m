Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69133DEC2
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680854; cv=none; b=HQZcv+g323/b0jgFzFGO2cfaN347+PuNwUa0BIQkf5JjOvmcHH3fxTk+hko+MGWbofRu5Oy5WrUkZjd+Xsho+gH5NJQVIUbFA+tXhYolIQ4kT/t1zl6LBvE5HIvP4PrVvCZEKI848iKgsdnvHz29dp6WY+oBVRXUGW7/fvL/0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680854; c=relaxed/simple;
	bh=BVNpauIT2sZa0Hcf5D2H+OVTEFzVW21YiEYPhOXXauA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsUUEQ0vmAvQ1+J6MhX8PzneHn3Li3kV4A3/dGSL9uVL8KkRvHdOcB1VrrsXegycztU/sySY1som1Ol8qNBDkT1S4oOf7KI3ak4V0UrhqRfrs/9yY47X6nA9OTtgQ2jVrPX1061sklt8ju1lkYNhZmM1bQ1CS8CrH0RS4V8nGl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=lUn3i5IF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J+y9RWIO; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="lUn3i5IF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J+y9RWIO"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 857ED7A0178;
	Fri,  5 Jun 2026 13:34:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 05 Jun 2026 13:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780680850;
	 x=1780767250; bh=6tzhq1SwcyKMYmQopHUeC4rxcooXGjAosBDI6FGg3Eo=; b=
	lUn3i5IFTTqIU1e7sIqloBWXAWC2esqyk7gFGQAK2K4PZO9X5P5HhlZlCXkkiu/D
	EuRJ/FhaESIFNvliIJtk9GALkvJzkEsmkdMNf14Yr+LNuZrSLyWpOH1wgMw4/FZs
	WqC7qvDt8A5oj+QJZYtg8hisVNxlxM82SVPAtU7Ld9D88E2crykk8hAdmdA4nznW
	o4RN2jI3emc8uwdTbaLKdI0jyzlMEm0MUZeFNXWCeYGmrp0G3KMO3kx963nPknWa
	hqtrrCF2qP1xPqvxLkC6eYM4CmDMctArxLZvcqRjlejtMEZi0puyXnU04pFNwPI2
	vDaMx4+X9pu/J9ExUKnkOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780680850; x=1780767250; bh=6tzhq1SwcyKMYmQopHUeC4rxcooXGjAosBD
	I6FGg3Eo=; b=J+y9RWIOXeeEnWbFvBKc8/dJqM9UU0lC7FSLKQwXuDlQv3uVAzz
	8M0rxAx9SxZHhdxgSZwILhMSMzmJR4b3uoifPGcmsygT6cN8/3FMP8/85el0y6ig
	vRytEfrHngXQ0q7ACP4ljURZfdMCnOtkVDJDdH7XXOpOmI9RzCFqs26TyHXalq+d
	5uq3TU1M2UTlVuHt+U+ZkYgV7x5X8Ns5EH140BlAZBPZWyTYatVRLT8KHpeavZxp
	aRLW/9dLydWRpOm/1FWFTgzdFb6riokyKzCyyB+u8+8Dq4ossFOGfUK63fMy6paw
	lMRSBcFutTuCtwVliVcukOzuSG0ZLwnCmLA==
X-ME-Sender: <xms:kggjanxCgAc5qXkysB600-Ex68DM7gE0quFPvO87kUgdzi1NmaJTaA>
    <xme:kggjagzhSMUW_XBz-4AXjk7Dbu127oY6ClPQIHBqyHVX6h_EF5BJ1TNEJ4gvR8lbG
    gfEA7Q5EvKMJEKzpqQ6AkHtDX4EEmfyJRAVr8zHM9vtW0k_KFg>
X-ME-Received: <xmr:kggjahZXXo7NNgKZAw6SiZrjkSp-50Qv5a2Z2eDSidAx1-RPtuB6pCbb0u2i-76ZL4syMudCHKNsRHa2S_miZQ3ahlDk89_0SeI>
X-ME-Proxy-Cause: dmFkZTF91e7K9nE0dC6I/m/tq/1ZQIMe0MssjxlBzysNCGfvyutshszay2r1UMGas/i/7R
    yZn1JGGrJm8B1cO0pJXSIZ8Qjx0zJ++Ag7uRfCtp4C7Ggfott61VKeBXKhRW3WkAuSyHv/
    YbYYm9D5xXH9eE44fwC5PslYj2GqiMtfIV1Q2/6ZqnyNbmlm6mXIPuGehGWBRecjCspEhA
    78uCx62IeEg0m0enBP8Y2KO4peeSpc+6DSqHmodaA/KTnHg3fIWsbX0jADYQmrMHQcgN5q
    pFwKLfFUEbQFk52jivZ7SeXA5aS2ZXHmYgEdWuOEdy/T724Z9LALBUqeuXFVtmQMWOGlVy
    +PqqMKldUFHLHz9ezjBSabA+R19Be0gX/ugiQztaY6+VUK420BoEEGEJYSSq0I+k+GqI1i
    VvLLLuMRpoqUlVbP6MmDEk9TIakf4MdPAHFzkz5WTrY29eMc07oDciZq3lsluT+tr2y06A
    kysDNc5XD1JYDA6jHtYis3bt33dmQDq2I5q2Xby3oi1aSusnzlOGglUpg9eYo3O2NOH7U5
    u+NPaglYX38pkQ0tyedu/2G/ZaAffaWpoparkZxqMZeEU2/cMdfalfiyE1Elrpw65/ePSI
    Hj7juxliWsRVWcAz73Eh6HAVXfzi7yUjlKl7/701sYvDJwBn4NeDnt9GWKdA
X-ME-Proxy: <xmx:kggjahUyrcC_wUTVv2wDd6kPBnaS3EJ59S8v419Cy92C0O0dK9bsGg>
    <xmx:kggjavh4UlyZX2wyzW9R5jDx3hSycaTPc8QwkH2bOE8DH4EBsUtp4w>
    <xmx:kggjavuS3fP7bwTjlswC-UEZ3bCy1-14V599vBYrwgj90wcvlcNmBg>
    <xmx:kggjao5xjFmlc7LaX79LZ0MQEX38nw6scq_MaEj0UKJz5lXwnxK_Aw>
    <xmx:kggjaiOBZ2R5F7KIOX5ylxpqDhGTfgYxiIkR4jO7C5OtyvRDcDqLIZJp>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 13:34:05 -0400 (EDT)
Date: Fri, 5 Jun 2026 19:34:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiMIiOzJejNV1tCL@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uImcWHheh5RHcjOk"
Content-Disposition: inline
In-Reply-To: <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>


--uImcWHheh5RHcjOk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Jun 2026 19:34:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
>=20
>=20
> On 1/12/2026 7:01 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
> > with AMD Raphael/Granite Ridge USB controller passed through.
> > It worked correctly in 6.12.59. Between those versions, I don't see any
> > relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
> > but the AMD node driver did got some changes, so my guess is one of them
> > is to blame. I know the good-bad range is huge, but there aren't that
> > many changes to the AMD node driver in this range.
>=20
> Is this perhaps a case that only the USB controller was passed through but
> that the root controller wasn't?  That would lead to a case that
> amd_smn_init() was never called and thus amd_roots was not initialized
> properly.
>=20
> So it would be a NULL pointer deref.  If that's correct, something like t=
his
> should work to avoid it.
>=20
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index 3d0a4768d603c..894823b444d47 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, =
u32
> address, u32 *value, b
>         if (node >=3D amd_num_nodes())
>                 return err;
>=20
> +       if (!amd_roots) {
> +               pr_warn("AMD SMN roots not initialized.\n");
> +               return err;
> +       }
> +
>         root =3D amd_roots[node];
>         if (!root)
>                 return err;

Thanks, I finally got confirmation from affected user that this patch
fixes the issue. From what I understand, adbf61cc47cb ("x86/acpi/boot: Corr=
ect
acpi_is_processor_usable() check again") was not enough.

> > Original report at (with full kernel log etc): https://forum.qubes-os.o=
rg/t/yet-another-usb-keyboard-thread/38355/8

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uImcWHheh5RHcjOk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojCIgACgkQ24/THMrX
1yzzhAf+Iogj+9gfdBQuxwl4pGyWGFXAiJz1gEVKYHbtWX0ib7w+emSzELpQ5rWb
yT0U0sqUIG7X4QrpSu4wA7x4RoA9a0EQ8dl5PdILGy9X5cxKKnuZ2S6G2sFUKrGh
j0uAo6nyuXeVTqxl3RNeMUyzjzPLItK8EopJbegj6C3+FnUDBR3QqpDBKDkwzrku
mPKLxcE+aj1/mH2Lmn3dhcMic60UJna0Fq5Om4GC926d0TYkd8eWgqkS0WUSjkQu
TrZXn/weKhCv7JdAI6oPJYAa/S62+lTi6WsabYRBFfhCilj8T2T/Gad8vsTvdg3G
+DqW/cuy/J0b9xUC84Mryzz3I0wL+A==
=Ivh3
-----END PGP SIGNATURE-----

--uImcWHheh5RHcjOk--
