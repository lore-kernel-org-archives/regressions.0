Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1736F91E
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780681527; cv=none; b=uA7mHYqFnHF9uWP9qEoYe9mZx53dIQamLM2bO3ssrBs48ZkJ3QhH4HDGoAJEEKk48Xv+t++++PQn9hlCxZOEv11OGrzOnf5IAR9MHwh3rnqof7E5aQJ6pYz1Aml0n4yGGfn5U4b7StDPluf1VfQlESZeaAJahO03u7TlVQyzOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780681527; c=relaxed/simple;
	bh=oAa5yjjLuDkFVQBmNaR5P/ZCaAUJVVYO+nUMRnoFACA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLP7k8jsvmmzbbK2jiOtCWBQqr/eIDOgYWbus8DItueI3W9HnXB9pw7AELnT+ZylogrsDnPZfjRVRa4a5SyzwcArldu6uBnPeNdTdQVNDc5p+jhdjSm2Z8z755VZVxGPsPhfCD85saWAdExAl6rFNsLB7dek6t0RpCrEy4ZI5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=N/PbCQdS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XdzE1Bkx; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="N/PbCQdS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XdzE1Bkx"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 89B307A00D1;
	Fri,  5 Jun 2026 13:45:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Jun 2026 13:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780681518;
	 x=1780767918; bh=oucv4rs+LVuM33eZtTgvXt/dUX0KClV2K3ryHXKfbSM=; b=
	N/PbCQdSbVya/+UyH2kBFECudeV6LE9XVgqyWr18u1JTDC6DUCKwpEHimILtSrhR
	2bhw965OZueyrD20g1fjBZunqlIXTtIHxV0YasYKAuaxhStt3t0/dC6QpY2UN2I+
	oalK08YEBmB9JTdXoBAd3gAbqJRUHbMOBZ4rTLXL4riLPBB3X0vjAfXnaCuYy2MM
	PRCL8diiOdz0VNI5m9Pi8SWo8jGF7RzJvXZN9E5TPx73rqxi9DgVabC/pZmBF117
	r2YD16OFlB7cbFC3QwIsgegpmCoDtWBxGi4ze/vwTy5V/yD7llWrxCmt0giCeUEW
	hEb1aQVjehDFkGiazUHJdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780681518; x=1780767918; bh=oucv4rs+LVuM33eZtTgvXt/dUX0KClV2K3r
	yHXKfbSM=; b=XdzE1BkxS3IurdhUQIGoxFQufmTr01SEIaR/Fh1i7xtl6XdaDla
	ATBEoW/H/tmZDutzzuVwImBojWgqmNmXvKCXt6WGWcBHypB+n1Ka8W8TYOGZqtH/
	1cYL3r+/hkTZCDyQslBB2BR9LbQBOwSxQtPo+ro2PO8S4+hcZrzBoWU4m5PpPgGr
	Rl16jwo7WS3PsrOYDGMvKmPRH1KRlzGwzZPa+ehyLtpEKMT5zEHLQJwL5vaibUJ5
	69WPRyFxRryxZvt4A/fMQYIA8Wb9XCfJL8tQI6PZfSttEVU1SRej1EWfABQ1ccDG
	bzfhMvFURawH6bfD1Fg6xm+QZ8aoiF6iNow==
X-ME-Sender: <xms:LgsjatP_uHiSLu30uM9cOA27c5c9kF-zfPmFuecU68ZMrPQr3LGifA>
    <xme:LgsjahepwfLyU1sX7WEflreDsIrfFT4Cf0IEKfhwU0XGhZz-ixHCQ3HZ4itEkpLjN
    uYDEmH56iPe5zclM4PHIhKqQ_dto6E2LSqFEGqLLrISL1Vdxg>
X-ME-Received: <xmr:LgsjasVlqWILBjjxzrpgsNv67nvnwB1_oxeNwnA-D5P706CRk-7tGkullCBdu8FDyD38bSm0rFt15Tfv21iRvsxlr6UPJGWVmbg>
X-ME-Proxy-Cause: dmFkZTF2VAH9TkUG6xE+X7/kWoVCMIlxY6bQCrPYlAc+ADGxjGfJJxBm1XRqicoWgDRu3m
    VCC6Uslip5G/yxtv+mLVfzFQkCr0ATGDtk4kqnnnUAD4qI8XiCRLKbmWqh8BIT9XQCY8up
    Tkam/FDmSeqqO34wHDG8D5O2bKZQ7ggGpLUG6WJzvOj2ix7dw7dwTTC67Z+k6/LxaTvw15
    xw2r8UA/jkQ8BY5Khq/WnI58grCwl9oRaG2itJ2nv9p3cWLZVZ2sjJa9rOP9InZwoEY6oW
    tV3co6+buEuQJeAR9hpfEbQktoBYZe5nHxin9+GutLs6hteJvxV2IrTKngWoY4AVf4t4iq
    S1RQSUmcK2RBXNNGJ2e9fJ8fewYHNEwhgw//cn0QgBItYl/uuT8RMQdSBcYv+IRS1WHdcS
    a2ytPX0f9EOhLJPNCoCUpjFDFDaBpNvufmAQDyNYNGRBuY6106BdxteUy+TbNfYox3qEkW
    O3PIMIdYCGrsjMH2GAEdbTup+A3kERf6Y95ezDCvudZFBHAY+GtOvBRl/m3cEK4WihKJB3
    xuBRVMHJyz1ltDTVKWQBTFsbKdLUXS/DZrCI48CtWtXSwwwy4X1q1b8Fd/spSkiUr/2CBN
    6/yRwROj52nFWBXXDDhs3ExGI7gDCxWIPH8IsbTU4FR8Eir8wKZtVAgDiuyQ
X-ME-Proxy: <xmx:LgsjapisJ9933ANYyraISLOVav4wsZS4rKjvlcnFKklu0cH1tn7mDw>
    <xmx:Lgsjar9UTuu9Fg9t4ed8oS6w58OHms8T9hVh9lqdfDPPr5C-ziKeQg>
    <xmx:LgsjarbwAkp6kY8wVmX4Y82O_XP3SigbLc_AP7DB3vtoWTgWWX14zw>
    <xmx:Lgsjai1cDyxARWYQ_asfSxb-yDTevMudnmFNN4f9qQDLwKbojL4jGQ>
    <xmx:LgsjauZ_gmKdi1b0AZaG0GCMtUW5f5d9Y18M4svBzo7sBXlEGDBQxh8F>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 13:45:17 -0400 (EDT)
Date: Fri, 5 Jun 2026 19:45:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiMLK1Hvk0Fmyimm@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IjUa0iNkCasjSUIX"
Content-Disposition: inline
In-Reply-To: <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>


--IjUa0iNkCasjSUIX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Jun 2026 19:45:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jun 05, 2026 at 12:36:29PM -0500, Mario Limonciello wrote:
>=20
>=20
> On 6/5/26 12:34, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
> > >=20
> > >=20
> > > On 1/12/2026 7:01 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > I've got a report that kernel 6.17.9 crashes when running a Xen HVM=
 domU
> > > > with AMD Raphael/Granite Ridge USB controller passed through.
> > > > It worked correctly in 6.12.59. Between those versions, I don't see=
 any
> > > > relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() functi=
on,
> > > > but the AMD node driver did got some changes, so my guess is one of=
 them
> > > > is to blame. I know the good-bad range is huge, but there aren't th=
at
> > > > many changes to the AMD node driver in this range.
> > >=20
> > > Is this perhaps a case that only the USB controller was passed throug=
h but
> > > that the root controller wasn't?  That would lead to a case that
> > > amd_smn_init() was never called and thus amd_roots was not initialized
> > > properly.
> > >=20
> > > So it would be a NULL pointer deref.  If that's correct, something li=
ke this
> > > should work to avoid it.
> > >=20
> > > diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> > > index 3d0a4768d603c..894823b444d47 100644
> > > --- a/arch/x86/kernel/amd_node.c
> > > +++ b/arch/x86/kernel/amd_node.c
> > > @@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 no=
de, u32
> > > address, u32 *value, b
> > >          if (node >=3D amd_num_nodes())
> > >                  return err;
> > >=20
> > > +       if (!amd_roots) {
> > > +               pr_warn("AMD SMN roots not initialized.\n");
> > > +               return err;
> > > +       }
> > > +
> > >          root =3D amd_roots[node];
> > >          if (!root)
> > >                  return err;
> >=20
> > Thanks, I finally got confirmation from affected user that this patch
> > fixes the issue. From what I understand, adbf61cc47cb ("x86/acpi/boot: =
Correct
> > acpi_is_processor_usable() check again") was not enough.
> >=20
> > > > Original report at (with full kernel log etc): https://forum.qubes-=
os.org/t/yet-another-usb-keyboard-thread/38355/8
> >=20
>=20
> There's another patch being discussed.  Could this help?
>=20
> https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_crate.l=
ocal/

Especially with 2/2 patch there, yes, looks like it would help too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IjUa0iNkCasjSUIX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojCysACgkQ24/THMrX
1yzTgwf/UvhLPdvx9+R09bwcO8tat1gTx6fT/kJGtTtN5tGL8K621az2TJdHnWQg
5PHim6m+2m3EIJV5ws7zz47GbsyzJq2R4/bpL4sLjEgm/yEFYFNy5EElnjsNqOTL
+b8rSSWOFK+aKA9eOYh76vUW/P5UE9Phjcy9tRk7S93TDabIqWnlFkkQdM/D3hv8
I2ZnPTTY1bkUET922x1yL29zPzhyWRfSY1g8ZPPj5FOEgn9vx+5kqEREJf1Qj8DW
qC5fBqzTjQ58odqKnxdJDLOa7WzbvUloX/qYtpDqw7jfQSPst9jzGkloEosSoPRQ
QF4o4Ylc0V78yg+VOY5eNDoZ+/UjxQ==
=a3ky
-----END PGP SIGNATURE-----

--IjUa0iNkCasjSUIX--
