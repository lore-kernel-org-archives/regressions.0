Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40851E7C23
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 01:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711172; cv=none; b=bOcT5wyKgykQbRq1XYzKAFb1suT+4LU3/RXGh4oZTKBFuG21bbKfQ2c1km38B4eTpzpMePT/aG+rhTkkHkRkZ7iBanXbBm5YraG9ohWCYN2250bbDQ7WkoJ1KuqFc1FjXlESIlRhJRk8RcZJ2xrMn84oRQa4HKcxiopix0M4lVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711172; c=relaxed/simple;
	bh=YSi9BTcIMr7E1FJZP7E7BBJNWVLRgF6RE5Hlpkqw7cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiDTmUGT/JP86zObRiImRdxfWxZmzwXsApG1eW5OOu3N3/v6fqBWyKVW1/Z7Q4rlREnafKDSynxFaX426NHj4V+a/JMyyVdQhJZ0jqZgZ7uOAO/tm1jwK0TIxoIpOsEB2VIJu867OhSWXM9jvUDvbKVuVgwmVwt74UC9IegiRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GoOc+G4I reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GoOc+G4I"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8529440E0214;
	Sat,  6 Jun 2026 01:59:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cUGdt4Jaeeb7; Sat,  6 Jun 2026 01:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780711158; bh=CfkxmemuY7KxJE+g9mokLCZqAk99pzkJADRF5WRoYZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoOc+G4IlMPKsuusomaVp6gefDUmEFHoIOguYttq6YRxOgLOSG1/OP7szQDAeslg9
	 NXaS9H7ynZOgaib+lcJFxjQGxq0X3taibjLQoNIiNdRvyy1Lk1EpXjwWdGZu42FzAm
	 mgBXFsJ+Ix0VtuybcY6ch+1F2Vv54/z5olrL2iO6QNmd0zw2QUg5GtRuxt3Cn2IOh5
	 Yx3C3apHx+SxB+8n7IrlyxfJgb5VPx7MHMvAoN0O4vV4KNC/VUbZ0lsz5vZh2AzYud
	 Nw95SM81fM2DAwKSDdt90H8HLvGotLxhwzd3czwlNkIrNRqDyQmTnjeD2egWJ+Gvks
	 PnSF2Ej+tVPMbA14BsqobK6f7UjC7RTxYI2W8jpHR8qXGiGILSFDdfgeSEsNocOJ4g
	 XOzhZva4PffoEyizo28w5TfgJJNztukSoeSfz5Jp1/HrJxRWp6IK7ZRZdbuT/gdFhn
	 Ye0owe3WlhKqnHSlRqmwJ1ajdmP9h9i4WExP7a/4T9zhBc1CLke+plCvao3bTluGlB
	 atrb+55XlfLu6xNnLnRltm3DVDpkVXZ6GFGrmUFWicZIoNHaGkBiV7m9F18gOnrse1
	 gOg4K5N58T30zjioMa3b2T6rER3DUpHwJWBwl+OSPOeT+WLgET/lcF+FgGDliIRuqq
	 gfKlwrn4fGg/LCwvKfr7O000=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA22040E01F9;
	Sat,  6 Jun 2026 01:59:11 +0000 (UTC)
Date: Fri, 5 Jun 2026 18:59:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260606015907.GCaiN-6_XN_kSXwnHV@fat_crate.local>
References: <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
 <aiNF5HXO4CksO_NE@mail-itl>
 <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>
 <aiNQVHXAvdVhZrZn@mail-itl>
 <20260605230949.GBaiNXPZ2ztjVL7DBg@fat_crate.local>
 <aiNdoGL2JCC1VIiW@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiNdoGL2JCC1VIiW@mail-itl>
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2026 at 01:37:03AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> Is it actually guaranteed to run before PCI fixups? They are done via
> fs_initcall_sync.

Yap, the sync initcalls run after the respective level initcalls.

> IMO it would be safer to guard __amd_smn_rw() with something that would=
 also
> detect calls before amd_smn_init() is called.  Like using smn_exclusive=
 in
> the Penny's patch, or amd_roots in the Mario's patch.

I can do this if absolutely necessary:

static bool amd_node_off =3D true;

and then set it accordingly in the init function but I don't think that's
needed.

> That said, amd_smn_read() called before amd_smn_init() would (should?)
> fail anyway, even in non-virtualized case. So, maybe this approach
> (still crash on NULL ptr when called before amd_smn_init()) is
> acceptable?

Right, then we can hear about it and see who's doing what shenanigans.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
