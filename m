Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1474BE1
	for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742065350; cv=none; b=FFWYPg0S032DjCmmiHJelGeqb0Cb5K93UlofULGRDJLdyTSE+GDrrDOcp5tl2p54yz8VWcQ6HLk2uXLWrcYnMSIecbDtQ/EYKQu9IezUlW3LBmf2/ZIkIsiKFQJ1Q3/uVsy5hAKjhuWZ3dALVlb1p3DG2x7H1IyBiEZWycRAmrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742065350; c=relaxed/simple;
	bh=71CjRHIpw54JBgqdUxxb2Cl/A6YlemzRQgjRVfuKBXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVSCkw4wvEcZ8UJ8P5gNuqgO3B/GfZYdVQJRKxuplK0bDXPRoXt1ptPq1x2KaUil1Z4/P1gkizgphvJfBOguGF8o6kj9ienecXPfPdKwSBAyShJQ7gz9lUhCd6cz8pTGdD9IlR5Z1yhQIpho49FvBz1EsdSL0Wzbrn1dH3xhFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bS1qcqZQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bS1qcqZQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AFD0740E020E;
	Sat, 15 Mar 2025 19:02:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BeBB1RCU3h3i; Sat, 15 Mar 2025 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1742065339; bh=mJGsn+ELPKNDcw6yAk27uYsmNui69uyib4cqIZmNscw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS1qcqZQ4zK8i8olGDOjbq2/RaCc+ldP5aLioeqGw298On9zbN/eb42bavOGuHqVd
	 Vf5pf3oP2z0px77P7fmYr9y8wptkJv+zY7ywsE7/ut1SV6aC8eXPq6kT+qb4nYkjZl
	 mQ5FfUsuu09WdMKRrG5z1fX5mr9q2ODxcnYw7CQHU6gGflt0LzzoIEsMjmQHohp+/h
	 XOnV4isxnP+mTnNgdYt2Vsk5ZtZlbpCyKPbDbtuzM/Iw5T4ySD0/o0SBCYLuhmXMbo
	 aG6HUXnpjqow9+wnKrgVWCRlDJ2gqmRd+tI9aGAsJuViM2WVY7IdmUvEqzYev2D9/I
	 Cnij0QtROGCxM2lxPZVxJNq9bUKk8rZzoYl1v8uvNq2TLcEXCfCjxCslrzwmCsGjOJ
	 XVGUCNXZ8CfFWtaY2AZXkdnZqH+Dq3iHSmKnskhdU1Tzxpv3zTODxBOrzS1Wnen7qq
	 87rGQs0/IfvFdvRk+FIxHFeDTNaVn7dZtJE4gCxcGa+c1g8vrkGdyUpTAyFOzGuGmD
	 cGqn+o9XpKLPNLRYEWCxlGXQkV02ejL1ED6THxqZm1drcyw899+iQojhWO2KOtLaM8
	 xkbBnMIjezeH7mOMfC1bWSpMTL+fSxLnstnXn0nQFgu2gu0cBrbgrUsr1SbJZuuMoA
	 /h1e7JaFZixkIiksIsuEauT0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 01C2540E00C9;
	Sat, 15 Mar 2025 19:02:12 +0000 (UTC)
Date: Sat, 15 Mar 2025 20:02:06 +0100
From: Borislav Petkov <bp@alien8.de>
To: Akihiro Suda <suda.kyoto@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux x86 <x86@kernel.org>, aruna.ramakrishna@oracle.com,
	tglx@linutronix.de
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
Message-ID: <20250315190206.GEZ9XOrrYHC2wDSpBn@fat_crate.local>
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com>
 <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
 <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
 <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
 <20250315134844.GDZ9WFPFK2TlHEoDzJ@fat_crate.local>
 <CAG8fp8R7t7waSbZ5KfF=WZNMNKTxkg3TNksFCAA464KEfPUFZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG8fp8R7t7waSbZ5KfF=WZNMNKTxkg3TNksFCAA464KEfPUFZw@mail.gmail.com>

On Sun, Mar 16, 2025 at 12:10:32AM +0900, Akihiro Suda wrote:
> > Why is it so hard to add a cmdline switch for something which is clearly
> > broken?
> 
> This is quite hard in practice, because there is no good tool that
> mounts QCOW2 + LVM + ext4/XFS/btrfs/zfs/... to modify grub.cfg (or
> whatever else) inside it.

I don't buy it that all those linux kernels which are loaded on an apple HV
all can't handle supplying cmdline options. If they can't, then tough luck.

> This might be questionable, as not every vulnerability is exploitable
> on every environment, and an update may potentially have a regression,
> or even have a new vulnerability.

What's questionable is your argument here - all those gazillion apple users
out there do get updates installed automatically, I guess, and no one's even
asking them.

> Actually we had already added such a fix in the past, for another issue.
> 
> 36e4fc5  "efi: Bump stub image version for macOS HVF compatibility"
> https://lore.kernel.org/linux-efi/CAHk-=whKJoDVuUNhf3U7gPXKu4EeZRv-iwwhL0prQ=U3n8PHiw@mail.gmail.com/

This is actually proving my point - apple didn't fix that crap back then and
the fix remained in Linux because, well, Linux is the only thing that is
flexible enough and no one at apple cares about compatibility with Linux or
whatnot.

IOW, and IIUC, nothing will change. Apple won't fix their HV and we will
have to carry crap like that in Linux simply forever.

I don't think we care, frankly...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
