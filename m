Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EC439F60
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581280; cv=none; b=FaOGUzsavKP3Weyax6qcd+mVVgufkRteBrAce7nzFU7ZALY80KJFgvvI4OH/Ge0pGi0hrX8seWNDYLJN1qb8ibiZRmt88Kxdh6ta+T2YriS1FYWV28XTuYUln+Yxm4mRqmnbfkp5oviJB4FAY1TDXulCNPQgHtX6diXudYk1Thc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581280; c=relaxed/simple;
	bh=vI7Cdgul3v34w+f/Iz4PVL1AClNazMdkTgUHq6yAxKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0LZeSas5gKy6CPWJVXXvKfALJQicA9+Pwha1Zf/mre2KCaUyU5QYIqakpbt9cBinni0tyTCEmjVRbjCmzm9hqxvkg9q6yioPz2X5nlArcbO6jqr0tMWbEjrKdNI74p2tk6JCvrDAH7PR5rC3YwjYG+fqIoN/P5gl5BrjjlgDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UanfX7oZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UanfX7oZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5E2FE40E01DA;
	Mon, 24 Aug 2026 14:21:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LzNTmVnQVH8u; Mon, 24 Aug 2026 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787581264; bh=t/e3PpeaK5U5W4RUHXokLB2sTjS30zI1NNFQptTXikg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UanfX7oZ2ZFw/3sXBjtsg/+UhPYwDAw620awwueeX2K4PsnVlOd0Y+urAQaR3Z31C
	 dMWn+kCZNnA6m8wg4VAGqYAEvcA4JDAilb6j0AYZuruDq1dp8TlM4cZsh4xTqPD8Lr
	 NPIFoML1IjJuFasrIMWfvojJSVLxvfjUeMyKOQHh9ZTWOhhE/HvcRz4pj90eYBzUvr
	 ix5xbnLzU7mKboLPD83sHNvVXIxOJG6tBoukWhRV+t4Tt/obRuQWjoN0KP54uVHoJl
	 EbfUyPHeot8VLEo7E7nUSSb2m1yunqq4HYOK5mjGxSjTF9QvA0YwW+EqlkwgMM7vuO
	 lZLOzM7LStqQdL+a19ZkRZgclcQBhCWCMDvie3vHNYqAKSEaH75/sFmwXNDuEHmBBC
	 S9PbZyftDzsqw1q8nSdx5hHLzdH0XLlDPd4WBHzxGenmpvQIXDysPfIVetamlMz5wP
	 dUDLLAL6TYSf6rFRKrBHaK68RrKo9+gBNoJGAxPfi6/mFhhijl67BmSGAGoMSYaKaK
	 vskhGBL9RagruMHxV0zOKnnm3BcFvxLUWw8Bksghe92P/R3tanZM/a19qzwddhqM6V
	 UbrTjuNdCuDpTDsye02+ceyX9zxm/H63o5aipbNF5VnXnagVZPzPA7Bl1LGAFN9whK
	 NJFvVr/eu64paiQVu7H++X/I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D5A4340E016E;
	Mon, 24 Aug 2026 14:20:50 +0000 (UTC)
Date: Mon, 24 Aug 2026 07:20:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Fabian Franz <fabian@isomorphic-ai.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"Xin Li (Intel)" <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
	Claude Fable 5 <noreply@anthropic.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH REGRESSION] um: Fix cpu_feature_enabled() build breakage
Message-ID: <20260824142048.GBaoxTQKUUtmflxuyB@fat_crate.local>
References: <20260823201521.2576344-1-fabian@isomorphic-ai.com>
 <a02b160a-874f-491c-987b-4d7eb0d35a9f@leemhuis.info>
 <20260824092300-3e9a9d58-b273-421b-a4bf-5609ccb9ab49@linutronix.de>
 <CAKbYdNEK0TUy+W5g_yGuP-JCC9CQwmeO0q95rYhcebZYB9vLUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKbYdNEK0TUy+W5g_yGuP-JCC9CQwmeO0q95rYhcebZYB9vLUw@mail.gmail.com>

On Mon, Aug 24, 2026 at 11:22:33AM +0100, Fabian Franz wrote:
> >
> > Thanks for this pointer.
> >
> > > https://lore.kernel.org/all/20260819-uml-timex-fix-v1-1-f690b514fc9f@linutronix.de/
> >
> > Indeed, both our fixes seem to be for the same breakage.
> >
> > Personally I prefer my patch, as it reverts the specific change which
> > introduced the breakage into the tree. Franz' change does not look incorrect
> > but is a larger change and should go through a regular release cycle.
> 
> I also prefer your patch. It is much simpler and doesn't require
> changing the cpu flags at all.
> 
> However, getting the minimal patch for um in ASAP would also be good,
> as a broken master is not nice for development.

It happens during the merge window.

UML folks, you wanna take Thomas' patch or should I route it through tip?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
