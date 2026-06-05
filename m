Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3539D3D0
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699225; cv=none; b=BKTEcheF0Y0zZ5si0VjKjrWfzuOx0LAKWJS8vIqZynKylC/d0AUv5oLD9Mzq74vIuVI/rqVRMDJcKFurkWrmoExR6xStrTGPVMBoDytc4BHk51aHAqFW5y3Z0v/eH9I3JXOm732L/9G7opXJhkOxpuKdiaC5DqnFrEHJMY1VPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699225; c=relaxed/simple;
	bh=0mYlsnhwu0+mEjshhzrYaxFcuYcNj9o/xbk/25egxoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI0ACfXt7jTHQLut/ODuBPB3H632EOYnZT8M7t2wQxQXusY1cNnKn46HgA8VSDcKNBAgLvij2Zge9vwVgXb36F5Qi7Br3LyWQoHgYtAssVCsu6WgtaJ0CgJ81H2pjosCnKb71F6PhZX16L+lvsmfUm3E0ysZFtJb79hPxgh0Lr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=WInalkAQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LyiKmMRq; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="WInalkAQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LyiKmMRq"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9EAE81D0012D;
	Fri,  5 Jun 2026 18:40:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 05 Jun 2026 18:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780699223;
	 x=1780785623; bh=yQKtsKdHTEeGy+wBb5lviK3laL978h18PIXdo6tNDuc=; b=
	WInalkAQnODxZVLNTgBeP71AcMq1ctdsJ9JaIQwE6Fq72f71cqDBxQsfymOWklti
	Id4cxVTe46MiYVIa8VTLTQxNGnvzMVryKoMrF6lBIQ4fcjxROfVlNUQNBnfPJZhF
	I4Gs9uoFYEjM6HMqJxaayjV+9hlzaDsdlBRjQD/jzXX+vwEsOfHAvCUDmDijW5tV
	yiuwgieLByHEYWuV1zy5vNgVDIgbzUSyL5g/eBaksShNSdyv3/XqRu6MfjzBHKx1
	bluwDMWkBRH1JUB5fWB+Sdezczo9CXK9Grv/XkKUkI6e3z8v5QoWaBFERhxagWv1
	y1Y0HtZEryd6f+rSzFUaQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780699223; x=1780785623; bh=yQKtsKdHTEeGy+wBb5lviK3laL978h18PIX
	do6tNDuc=; b=LyiKmMRq6nbH6HrSO8Dh56BclAKfuXL77T+PwAFZpXDTQya2Wyy
	45SbAi5/9JRgiydHgB90S6TNU971EtQ9Woe4oUInof8vd04i3C9XTF11oNbqpcRV
	vdoOKly+fgmTcs+kcf5zpPiMCVN2FUk+tb30rxuzKpu9B1zXD7ARzZkfEBDByBZQ
	kMyJlOAFNGUTcDPqLhieZHz9aNYRUqe6ybbakso6cnaKFub1ewhb7TCJOzYQ4ncl
	+IF6+bJ/T6LWVEvpJiOYwrqwww3HyK/Akew02T36qjJVRbyDHHWJsvvsr+rAE2u9
	e+Zo4LC/YmHwwO5PI5hYDUPefg7oqLwTNcg==
X-ME-Sender: <xms:V1AjamO4FBdhhk9fwUeohPzNHvNo4HDefbUIFzuFAQVpUzM7ibUyyw>
    <xme:V1AjauTjrCrV-ByUbqYKvmmyv7efgCbR1djRH4wJLbUtbDmzaLLZVyY_ugY45kNtM
    yq_feeF5HiQoRc1PhSWbJFfyVvT8z7IYNZA4xKgtU0g3-z4ow>
X-ME-Received: <xmr:V1AjakivAbXKGqWPgzWW9yWsc2Sh4NKAE8TXT_RfjgcoCbtOxY4mtVA1lqlZbsCd3vjX6GW6wOyOlxBLYxMWzW4xiZp4ulvFNGk>
X-ME-Proxy-Cause: dmFkZTGWJCuU/pZQJEZTt8f57xCxq8G+d/Rk4uxFup/BC+yeQwILaA/kECNUFzhUOn5+Y+
    jaLsZiPm8G1lAVWJYWxHmzHusPgHUKhiAHEbp9ObGhHlbWKIg9EBgaf8FH47IZxylRhc2Z
    Ab4ERpobkBofgbcrZXyFsNSWH+3W54Qdz9pRFiQsZigdVSmeg68VBldR592vnwuJO+4VBD
    LXbauIlcHFofBrotAYo9Y+OHsG93gykQn3Pj2YJCfJpA2GZaQlMYmpIMrRT3fjVCYpBKFl
    UnRn1oVYC/isv6R3zSVfx9hNsNTFGul+A/n5VCjzW4RxYNwUrDoU90O3POa3LcFyTaNDNx
    JXr+6OjEoH1bg1nIuM30eZuoJy2O8WlMGc2xQQ2hlV+lal/zA6jKk0MQouanNK9TbwRUN/
    +p9yRHpz3iL755f+4wUpqFhDcq6dMNcoZGXOsQ+uvoyGncEr6BOxRXoNQHTtFmSmbMWnnq
    Kr0gSCpWzKovErgsA9s3cCf6Q4E6Ke372OekXd33ngyppco16Wsmb+/eBhbYvhhNqwgVXK
    nLraaOf8h4YX7jboUXlL8nyyXxZTDLIQnI4bSsjQAPOmHru/MMaM8NP1ow2UQvxCQnl2Zj
    6NLoEBEXhyesTm9CfYmayjjSiOKfeOk967Mssq1uaWqYoF2q24A4KcHHGcrw
X-ME-Proxy: <xmx:V1Ajan9wwir9lTXE7F3xBx0TUgXbS5iUhNBPIbCBUrYB1XtLeCidOg>
    <xmx:V1AjarF2-MqhmjAjBiPC8MtlJy9wD8fWmeclqL-_h1KauCjn-3pUCQ>
    <xmx:V1AjaqmTZ47bJ45TLMdz_co06IGFC4iKvhaUZf_T5CfKQ8qh8lfDig>
    <xmx:V1AjavaQ00m1emCZL9eJt-Vx7ivg6BY4tSVFDZSPQa8JkCBu9TUlDw>
    <xmx:V1AjaomBWhT8wZvLmYzdhQtvFf9g_nz0Bk6qzld_jXjJJk05b1mdIyz0>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 18:40:21 -0400 (EDT)
Date: Sat, 6 Jun 2026 00:40:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aiNQVHXAvdVhZrZn@mail-itl>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
 <aiNF5HXO4CksO_NE@mail-itl>
 <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PvbObVgcOlmlUPOG"
Content-Disposition: inline
In-Reply-To: <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>


--PvbObVgcOlmlUPOG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 6 Jun 2026 00:40:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

On Fri, Jun 05, 2026 at 03:26:48PM -0700, Borislav Petkov wrote:
> On Fri, Jun 05, 2026 at 11:55:47PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Well, it clearly happens, see the call trace in the first message of the
> > thread...
> > Do you suggest the fix should change
> > quirk_clear_strap_no_soft_reset_dev2_f0()?
>=20
> https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_crate.l=
ocal/
>=20
> That thing should return an error so that amd_smn_read() is not even avai=
lable
> on guests.

What do you mean by "not even available on guests"? I'm talking about
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/x86/pci/fixup.c#n876

    static void quirk_clear_strap_no_soft_reset_dev2_f0(struct pci_dev *dev)
    {
        u32 data;

        if (!amd_smn_read(0, AMD_15B8_RCC_DEV2_EPF0_STRAP2, &data)) {
            data &=3D ~AMD_15B8_RCC_DEV2_EPF0_STRAP2_NO_SOFT_RESET_DEV2_F0_=
MASK;
            if (amd_smn_write(0, AMD_15B8_RCC_DEV2_EPF0_STRAP2, data))
                pci_err(dev, "Failed to write data 0x%x\n", data);
        } else {
            pci_err(dev, "Failed to read data\n");
        }
    }
    DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x15b8, quirk_clear_strap_no=
_soft_reset_dev2_f0);

There is nothing here that would prevent amd_smn_read() being called
inside a guest...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PvbObVgcOlmlUPOG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmojUFQACgkQ24/THMrX
1yyWlAgAiccjo553UfT+FGtfbu8EqSLSqOG6HQ3UKXHL7RMJTudc7nerYKj+v1Jm
ByLOtNslDoVkj66XXU9vh5bexRltovgM5ETnxi3nXHnAbXKfeSMLFAzy5dk0h/Wv
xqZdxBR+OsxyUWaFueC3e15Um2kRCAvzVjsJM6D2OKG5Q5CGSiRrc1kGvVwqiXF/
fJ+qORbwilU77RJEhRgwgnv9SKansS7hx3yFUIDAcWdInOw5gIeSVnyKWxhWjG08
DYpssK0HXKMIr7k4l5E8RNod/mwGmztyZft+hr3/+PbhOCCorKYQPbu/iNvO4OcK
M8BwHJ2oTHs4L1EG9ko7cNJmIqcG6A==
=dkI0
-----END PGP SIGNATURE-----

--PvbObVgcOlmlUPOG--
