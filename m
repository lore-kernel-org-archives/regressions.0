Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226E37CD33
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694168; cv=none; b=fN+h816KIh75W8ZXgwiOKQMutnaqM40GDWfLicX2e6s2uEjNiEleHKyvm+peyLzMu65X/RARmf2aY17htgIuZypu1dQ83Tdzij+liWUam9NseGsrVRZCQao+fTlZLLEitI2j2W//+OHl+jbBoeM1jsn4TYdXNcxoa851tkpxOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694168; c=relaxed/simple;
	bh=1t11rXGUNmQoM3PJ7rW3JaEff5NIDUUcp8HsF1rR7kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnH8qxeq0QFoR/0ejxU8f85T1Z9HQzNiS71wMyrEzKTyqbSnqhATx5hFmH5PPdhzYdixSFE164YwwIP0r4Qv6VYhvQTdJwsXtjg1SWqfwFzDxF+Sjsoh1m62vziw+A9joNoe1IJxdfR47PBBJvjGd4BkmhcUmOVSB77O3LZwt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VKD12HG0 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VKD12HG0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1B5840E0202;
	Fri,  5 Jun 2026 21:16:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D1DdttV3wucl; Fri,  5 Jun 2026 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780694153; bh=8moplmh5I4bS2hsjaNHs/G/eIt9txBXLh2E+Smekugg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKD12HG02DVwHVNl6/B3AgWb4UKcn0ACEckAuX3PQp0Svig8nXcK55d5ovLj5JX6P
	 657+FzTNKdxlxJMaqqNvTnwzb9MBnIDLy50oGHa6jcY71Z6hD3qzEGSPjlrKTW7+Bu
	 dBAyWNx+FprTpzGHNTIYrlQUS/+BsMaBxi9L5B28RgzxqHKEikFPY6k5Ye/4xcIOn0
	 b9dDsjz4jFed8ZGXd3TUjkwbgsR82W3BzhCu91iCv+n8ikbUMlgG3JFIb5I5hla6ov
	 RfEgg+RwYtv0pe1Dh/KrkuyxwHu1IM5yN7iiWk1siI+HneKevyTI4DvSLo/BGHxwfj
	 XuCaNvddwtHSl/D1ldUjmVmcYLgBAka272g6YTKPkRtRh44B9TSLRBfW00tG79GPu+
	 z85xblN222ySqaTTQyUDws92drJ9b2V7jsJ1ENlDB8KnivmWDpIyQ66c2LfjnqjtWR
	 r2WzCkmrWcM4h3MyYwQK+7dUX5yGNLOv/SaBndVf2BzmdPhKJK+E+/Q//DbHj5rEHz
	 WudvvxULW/SNXpvq5ewSTMlt2VmzT9C0CNbp0bvAzjTqx+yVQQEASXO0lC6F/lrWXC
	 yiPXrdqn4AST1XWn9He8X7r4NzjkH7qkSZIzjEIQRhrTCwKn+Yee3TwoCFuWj7YnS0
	 ME1Ay5nVlsuoGg/ZLshWA0sU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 385B540E01F9;
	Fri,  5 Jun 2026 21:15:47 +0000 (UTC)
Date: Fri, 5 Jun 2026 14:15:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiMwNrdwzlowZDNP@mail-itl>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 10:23:18PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> Instead of the series? No, that's not enough. amd_smn_read() is called
> from quirk_clear_strap_no_soft_reset_dev2_f0, so it would still hit NUL=
L
> at amd_roots in __amd_smn_rw(). But if you mean instead of the first
> patch (but apply the second as is), it should work. I don't have
> affected hardware, but I'll ask the affected user to test this version.

amd_smn_read() should not happen in guests. It is that simple.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
