Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49227131E49
	for <regressions@lists.linux.dev>; Sun, 26 Apr 2026 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777182612; cv=none; b=KaQXJxLaGCFZUm3z8IsJABE8icQi7Y96k9C/X528rIRRuKZQ30p7kpbFQK4TbQ3/fJd8jWdg4dzWlJevYee5esxb0ypTHKRPM7TonZaGcpyCzJgmtdrU10jKip2GEbZEQbi4eJkM4ge40qloBZB1OmM6u8D3YEMM9ozCzcohvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777182612; c=relaxed/simple;
	bh=v7x/tLdwYsj6Bs1Uowi3wn8HGwLSofx62wH0FPyjBBY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHuPHKuldifjx7Nf4m8690xWv7c0K/vkOko9NWZ8uRd9wEBeymD2poo2rPnoqtFHhVzipFSmtSCUwAMxTqadWZ616jkNCbEzQcyyXq6hE9w3gPYRFN1VkEXeFLdpdJfoql1pULmBKmZGVV4HuVyzCyAC5ysAOTf+269vQ4P/QF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 598D4C30;
	Sun, 26 Apr 2026 07:41:20 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2638460CBE30; Sun, 26 Apr 2026 07:41:20 +0200 (CEST)
Date: Sun, 26 Apr 2026 07:41:20 +0200
From: Lukas Wunner <lukas@wunner.de>
To: regressions@lists.linux.dev
Subject: Re: [6.12.y regression] Regression with 58130e7ce6cb ("PCI/ERR:
 Ensure error recoverability at all times"): echo vfio-pci >driver_override
 does not work for DVB Adapter
Message-ID: <ae2lgMRLPDQZSzI6@wunner.de>
References: <177373189751.7987.7156982489427825197.reportbug@obelix-trixie.bs.de>
 <acfZrlP0Ua_5D3U4@eldamar.lan>
 <f0054ecb-2524-42e5-ac1d-ed8ab114bcef@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0054ecb-2524-42e5-ac1d-ed8ab114bcef@leemhuis.info>

#regzbot introduced: a2f1e22390ac
#regzbot introduced: v6.12.70..
#regzbot introduced: v6.18.10..
#regzbot introduced: v6.19..
#regzbot title: PCI VFIO passthrough broken if BIOS assigned incorrect BARs
#regzbot fix: 'PCI: Update saved_config_space upon resource assignment'
#regzbot monitor: https://lore.kernel.org/all/acfZrlP0Ua_5D3U4@eldamar.lan/
#regzbot link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131025
