Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D495E1FFC75
	for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046545; cv=none; b=PaaQaVYdy8taodwjW1ynPd90XzhVu8H9E9pOOU7hdVTMClA2FrvnZm7oou314uiOY/D4Dmgs38F00A5mafYkbQFEgCC8Q3bxMRji1Rfg0ayhyRA4DSWPlTkxKt5+XscHJcTc03DWZF3NNVy/n2E9LOGyPSwMkVfgOO+Od+sFOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046545; c=relaxed/simple;
	bh=oiPMnk0GT9qfHUWnOYqDNI0wXmlwVL1HNHjBhlGNges=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KR5RUyi7ucWTlbGqaiLmU/+RiTujHNBsYsTt88GHAqcdeK/WlGjyplFuFFPV5F2av9jtefEO2RMx9nf5fWE0FDJvC0+s86j0R0ya+8byy1RXVuUQQnTNmG4zjDbG7S92Vc3oRYHlKCA/knNaPKTXag6gYAst8jnwtSC5zhL2nGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fz2NXoTX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fz2NXoTX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 68FF340E0213;
	Sat, 15 Mar 2025 13:49:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gPxkR299QIZO; Sat, 15 Mar 2025 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1742046536; bh=cdRkDQKKU+qocWdcOLnMtkQSxX+L7I3XE1WxX1PemYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fz2NXoTXLkPqxHl5FlL//wwsC2NEUtLp/KP2GsS5+lAn2VhuUMDIKtcYdHOQzIgAU
	 tD7Diyg6XsR2F4q22MXkWkWmFAmHmNVrWcMyTbEfzz+6TSQX822HRvQ9RylbMKXarC
	 MbWjDzUgDXSYalzdRDP3oQGYM8jUYYUCSkI6RyUF+MjA0F/s0vX/OBMdBLj5dEk8wa
	 oTXoepZCikHfYrAqBazm3O047qnfZXpOusQhC1kYW3vPDE4cjeg1dRYQTFPkTKpCxF
	 iZrQ/24EHN+qZjU5nSOjUPLF2sFCKwCCkmDg/rOIL+zbWffFwx5PEKkJtIhAbYjgx9
	 Oixm2sB3BRyxibU0WW43HgDVwDwXHG9Sl+qXMLD4aXz0B6KuCAShJhiQ5TENtgwVkC
	 +LaXeqR6mpKqhuE1BME4Efef/l64klV5WRGcWNN06YZwMKw/pte0i8CsGTLm/2a4sr
	 Jl0KoJazFORAfHJ1b14twb4pzUuYGuxVLIR7dLWfWuSO2whXa/wutCzQWT1q9TjYXI
	 qflfy5I0fbzD1Xm9DBkF+8UUMqtJosRRMp+cm8mCfKk3Vpe0SFkHOkIdcftMG6MIh3
	 7i1dAG5yAQy/+iL37c6m1MUpbCzV+oVZc8sWvQ1xB1ooTrq9go8/Qhe/CQfz0jnFte
	 IbfXILRfxpMM8XLP1QDsigXU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 73B1940E0196;
	Sat, 15 Mar 2025 13:48:50 +0000 (UTC)
Date: Sat, 15 Mar 2025 14:48:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: Akihiro Suda <suda.kyoto@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux x86 <x86@kernel.org>, aruna.ramakrishna@oracle.com,
	tglx@linutronix.de
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
Message-ID: <20250315134844.GDZ9WFPFK2TlHEoDzJ@fat_crate.local>
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com>
 <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
 <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
 <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>

On Sat, Mar 15, 2025 at 10:09:29PM +0900, Akihiro Suda wrote:
> There is a huge demand in the macOS community to run Linux virtual
> machines without modifying the kernel cmdline.

Why?

Why is it so hard to add a cmdline switch for something which is clearly
broken?

> Also, some users do not want to update the host operating system.

So if there are security updates, they don't want to update either? I guess
their problem...

> So it would be nice to have a workaround in the Linux guests as well.

What do we do the next time they mis-read the architecture? We add a fix to
Linux again because the kernel is apparently the most flexible component in
such a scenario? IOW, we wag the dog?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
