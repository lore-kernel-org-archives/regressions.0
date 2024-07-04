Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88E1AC229
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720090141; cv=none; b=YKBQyXSz1FtAehs0RlX9xLRZyVV5VIEUwoMc/z4CjvUdtp0gI//GT9i8jUQOrto8u9qQdrgd/afPtw8/HEzKUlInIWriFSAzQDkpJDnaF9XrT3iSLS+zOkx9AJQjJC5/VeCvgHbl2uLSezWYwvw7D4pvGoKYyLLUI8dC0XHJZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720090141; c=relaxed/simple;
	bh=mtHqDFTlBtadte2NCXM5kXHaYvGqZmcw7tbdCVEx7JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EE1bQp+xVPEZmLPq+v0Ttq96Ap/sH8SJpZVBFgPshM8RDvPgGblSvvf8Zf3HGb04RO6f41AhB8i6tvgdyQKfpTxpcKUEK9fwMKgQvYQ+NwEbANU0tP+k5B6TBEYSd6bIfvT0UXbU/py7sV4mBwQp/yjCk7rOxHtY/ObPGiuYemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPK18-000000008CZ-2DuW;
	Thu, 04 Jul 2024 10:48:46 +0000
Date: Thu, 4 Jul 2024 11:48:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <ZoZ-ClhHUWzAPB1D@makrotopia.org>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <20240703191308.3703099c@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703191308.3703099c@kernel.org>

On Wed, Jul 03, 2024 at 07:13:08PM -0700, Jakub Kicinski wrote:
> On Wed, 3 Jul 2024 00:44:28 +0100 Daniel Golle wrote:
> > +	/* The corrected address is calculated as stated below:
> > +	 * 0~6   -> 31
> > +	 * 8~14  -> 7
> > +	 * 16~22 -> 15
> > +	 * 24~30 -> 23
> > +	 */
> > +return ((((phy_addr - MT7530_NUM_PORTS) & ~MT7530_NUM_PORTS) % PHY_MAX_ADDR) +
> > +	MT7530_NUM_PORTS) & (PHY_MAX_ADDR - 1);
> 
> nit: the return statement lacks indentation

Yes, lacks an additional space to match the level of the first open parentheses.
I'll fix that in the next round.

> 
> but also based on the comment, isn't it:
> 
> 	return (round_down(phy_addr, MT7530_NUM_PORTS + 1) - 1)	& (PHY_MAX_ADDR - 1);

The original, more complicated statement covers also the correct addresses,
ie. 31 -> 31, 7 -> 7, 15 -> 15, 23 -> 23. However, the function is never
called if the address is deemed correct, so that doesn't actually matter.

It's kinda difficult to decide whether it is more important to return
correct results also for values never used with the current code, or
have a slightly more readable and shorter function but with expectations
regarding the input values given by the caller.

Opinions?
