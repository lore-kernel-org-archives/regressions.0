Received: from IgnazServer.ignaz.org (IgnazServer.ignaz.org [37.252.120.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824465588F
	for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.120.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727400454; cv=none; b=khFlw4Ecnwe25WgE7DGQYzoqXK/MZnfQt60/4m1hBqLJgzJ7fU66STo+jQ0OAW8/W3zFCe7bZUhkK5q71sq/DE5YCmq49vUf02JivT1qBZVQNmW8fKTGHSloYerv5Mrjm/OZoVJpvFJQp7M0NRxPEGI2Um3jaEF+7xVwvSvosso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727400454; c=relaxed/simple;
	bh=5fTduVdUu+6lhmnUyA6edROe3GOGL5qLDHSEtBKqjIg=;
	h=From:To:Cc:Subject:References:In-Reply-To:Message-ID:Date:
	 Content-Type:MIME-Version; b=LIRYbb0ibOZAQxXx69uZEkjDm8tgGehEyGpaY7DCXxM6oEPtCyn2xX0YztPJmQPfVV9Mabn4dzqeKPERHtAH+lbCdPLAXOvREgfmaNe5pdWGMH3uX8TaF847RS7P1P5CKgSrCGWDgkZi/yl80ggtux9fU4ebqM7r9Xlq+21VjNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ignaz.org; spf=pass smtp.mailfrom=ignaz.org; arc=none smtp.client-ip=37.252.120.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ignaz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ignaz.org
Received: from localhost (localhost.localdomain [127.0.0.1])
	by IgnazServer.ignaz.org (IgnazServer) with ESMTPSA id 0903341085;
	Fri, 27 Sep 2024 03:20:02 +0200 (CEST)
From: Marcel =?utf-8?b?V2Vpw59lbmJhY2g=?= <mweissenbach@ignaz.org>
To: stable@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org
Subject: RE: RTL8852BE wifi no longer working after 6.11 upgrade
References: <3784ba9d7af34d41b439b7ee0d9e9f8f@realtek.com>
In-Reply-To: <3784ba9d7af34d41b439b7ee0d9e9f8f@realtek.com>
Message-ID: <20240927012001.Horde.vJNTbT576lzyFGWprtGx7R0@IgnazServer>
User-Agent: Horde Application Framework 5
Date: Fri, 27 Sep 2024 01:20:01 +0000
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Works as expected, thank you very much =)
 
"Ping-Ke Shih" pkshih@realtek.com – 2024年9月24日 11:29
> Ping-Ke Shih wrote:
> > Marcel Weißenbach <mweissenbach@ignaz.org> wrote:
> > > First of all, thank you so much for your time and work!
> > >
> > > I hope i don't cause any confusion and this question may be based on my lack of understanding the patch,
> > > i almost don't dare to ask, but does this quirk only gets into affect, when someone uses the same mainboard
> > > i use? Is this an rather rare case that probably won't effect other people?
> > >
> > > I can't judge that so please don't get me wrong, but i feel a bit uneasy about this. I assume that most
> > > fist time Linux users that have similar (but not the same) platform, where this quirk will not get applied
> > > and they end up with non-working wifi, just notice that wifi doesn't work and give up on Linux and remember
> > > it as "My Wifi even didn't work there".
> > >
> > > As a long time Gentoo user, i have the capability to build my own kernel and provide feedback that can
> > help
> > > fix this issue, but i assume most users don't. I would assume an Ubuntu users will just remove the Ubuntu
> > > partition and calls it a day continuing using Windows. I am a bit worried and wonder, if there maybe a
> > way
> > > to fix that, that is independent on my specific hardware/mainboard.
> > >
> > > Of course, feel free to correct me if i am getting something wrong here, im neither an Kernel nor C expert
> > > and thank you for your time again.
> > >
> > 
> > You are right. I was not aware of that. I will discuss people internally and reconsider the solution.
> 
> With internal discussion, the early chips including RTL8852BE have interoperability
> problem with some platforms, so we decide to rollback to 32-bit DMA for these chips,
> and only enable 36-bit DMA for tested platforms. 
> 
> Please help to test if [1] works to you. 
> 
> [1] https://lore.kernel.org/linux-wireless/20240924021633.19861-1-pkshih@realtek.com/T/#u
> 
>
