Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA23BFAFC
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698433; cv=none; b=j1BKHIerhdqEKwYHEdkAn/ZAx8yl35hzdzNG7jmHVxECpXgaEKvoAS1ZYHNtgHroNXSoOnxj18RTCbwwFD2fu3TV7Km4gHkzoytawUw9H6s6XCVGdLP8bTg49pM+OZ/tQL0qTaXhLQx0oSdJ7EGFMbqJIu2AFsDtCPtewR+Pdjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698433; c=relaxed/simple;
	bh=cW8f+NOxfjFoBHymnVZSIKSGAl+ehnmrvv8EDG/m5uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhlcsqdloNAmJlN0Niz5TZ8aLmxfuKYUCz3Dnf6N+oYFxogGJTdeovKzEHHyyj8fbNBdyilSN9+nYJWgZcay5eRmCgNiHDp7IJZwJ7/Sy3jWBL3nSy/YaOiE1G+EU6i8llrPbAna/RIIkSpNmgn8ZJjZZh9Lj13KJV3Rzxh6VV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AMrs5cAo reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AMrs5cAo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 11BBB40E0202;
	Fri,  5 Jun 2026 22:27:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6iD7aiATJXHx; Fri,  5 Jun 2026 22:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780698418; bh=QrInxLrsqHZJmGGRnDaJOyDyiuHk5dUGn5rqovOgtXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMrs5cAop8+H5bqEXNUdrsohDBuDIUmdBoBKvIBO+U9PXcfRxydkoS0OoFlcndCDn
	 ywB70XEqEyJ4Mv+1XiuGOV8OyAUwdt+uAT3cgKb8hK6/R6iPvhLuukJovbk7hcBQka
	 GoK7pwsdVPVtUEL7GL83F31Rk3UFUKF57svKSu6CM8Z3E1maemKTTXfAHuR1um53hL
	 RVftTLi/byenMcSoztVOjgQAEU2rf/I3yCF2fUYZIV/s0+O/2mLBdlNzJnorco+a8k
	 fVahOPCOP//hhQ5tlNxSklALJowoNzKPo57fNv+w022ec80oQIQ9FDo+FNvMShFZRp
	 e8RoFWdok5POCqFeYKCZRJtGgJlYI+1v/qr+X+z5bgxT5sL0vwG8S8Wwm+bpeX0TCv
	 3UyS0dGp0Zyl/9xHDndt0gd2kG7B6r6DAq8z3F1c6c8xsNsHfBPSk0b5GczGReaTNN
	 YQ7kek23+Pp00/wxGiVTQTqwYDPCscGjqzTCMsYuIGKWrXf4r8VCJ3IFOEwfbCI/OT
	 gdoweME0BU7Nto0NJpgFKKPlQEunqPwxcZoQ65XmVZVHXCBUJGhsa40Bv3W5MuDydV
	 eaR5ArSy6MxANJYWl/X7qyXglbAOqFO3mZ8tBk+Du41XZ9PNY+NR0/9kNMcjpEUsXT
	 t8AhCfwTSCjtV9xXcqeAjVug=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3247C40E0031;
	Fri,  5 Jun 2026 22:26:52 +0000 (UTC)
Date: Fri, 5 Jun 2026 15:26:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
 <aiNF5HXO4CksO_NE@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiNF5HXO4CksO_NE@mail-itl>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 11:55:47PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> Well, it clearly happens, see the call trace in the first message of th=
e
> thread...
> Do you suggest the fix should change
> quirk_clear_strap_no_soft_reset_dev2_f0()?

https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_crate.l=
ocal/

That thing should return an error so that amd_smn_read() is not even avai=
lable
on guests.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
