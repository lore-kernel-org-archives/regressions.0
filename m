Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A3B1E51E
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716370484; cv=none; b=l6nwZ6M2vyi10wcnIj31rq4s6uEw/b2NmF0tawXM6OL+Q0Yia5uVvo6V0okYpkc/LcSIGclrbjinxEJoBoghsz2tdZYOTFvuyR7lgunaUVeaHkFECddOHO7m3UlM+EI9G3y2bpa12ZXmJFJv5KuO42WDEsqy1iSrMSATHtbGAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716370484; c=relaxed/simple;
	bh=mX5vIgRWx9WAOsjeTaBhf88G2r0ZoYliqn7TtU06B+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOo+xOc4PHuojBzWobk4rpNllc5L2ppg9DQ94SKQ2oePQ2nYRPbPkY9p5g3wOyyvgx6DWDx7MOg1lWyG/y8XYy7DsNcxQAN749Yh6jdkvUB49gSsyJnLT6RdUR5DeG+VdqsFIhy3mOBxYWjEQrwh1SXsGcFhipN8n7CvyGPYOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fW+q7v1e; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fW+q7v1e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0ULik29NBLPRrUwg+mqBvlx8JWj5pFQ0AbuABh1uIWo=; b=fW+q7v1eKF9i86BC7a3TFCWCJS
	pp4J5e5sVUH2nEndz39ojCjFGaOqyLglcpN9hTCtq91H9ePbGcWtzeseRil0LY5DHYUROa1VhFa8d
	DtObyI7YPh6BOgsEQN05gFjRG+50l9PR4gFiA7WOtRxOoJgaReLWE0WVFgG/Z1e0eK/V1bFESl0+6
	UMKE1Ns3i2VsOQsgZF69Hnj4FVMZVnPMdspK7jIZyS/L9vtXR1XPKiA/Izbb5pYuDXjZ+FdNwgChw
	jzjQO9nZBwlQ3GoIp0qXB8gPYFCq+ScMReSX8kdfF9KszJMKIsghuRSLiHGzNi6UrUpLPRaiZivYS
	N57WdbAg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45380)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s9iMd-0004o5-3B;
	Wed, 22 May 2024 10:34:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s9iMY-00062c-TZ; Wed, 22 May 2024 10:34:22 +0100
Date: Wed, 22 May 2024 10:34:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Duanqiang Wen <duanqiangwen@net-swift.com>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev
 entries
Message-ID: <Zk28HtN30TJvnZan@shell.armlinux.org.uk>
References: <E1rl62V-004UFh-Te@rmk-PC.armlinux.org.uk>
 <7eda7621-0dde-4153-89e4-172e4c095d01@roeck-us.net>
 <ZkfYqj+OcAxd9O2t@shell.armlinux.org.uk>
 <4ea9cc83-c7ca-47b8-8d43-dab16193108f@roeck-us.net>
 <ZkfqKMqkUc/Sr7U2@shell.armlinux.org.uk>
 <646bd149-f29a-4c91-ab00-4f6d2fce23fd@roeck-us.net>
 <ZkhSOvkaAwsTe7Dm@shell.armlinux.org.uk>
 <44151fe7-1822-4b95-8981-9a1f1884d662@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44151fe7-1822-4b95-8981-9a1f1884d662@leemhuis.info>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 22, 2024 at 08:53:18AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hmmm. Communication problem aside, this in the end seems to be a
> regression that is caused by a change of yours. Maybe not a major one
> that is making a fuzz about, but still one that would be good to get
> fixed. So who will take care of that?

I have suggested several approaches to fixing it, and each time I'm
being ignored by Guenter, who seems to have some other agenda -
because he seems to believe that using dev_name() when registering
the clk with clkdev is wrong... despite the fact that clkdev uses
dev_name().

What I am uncertain about is:
1) whether clkdev is even necessary here, or whether it is pure noise.
   I think it's pure noise.  Why? The dev_name() that is being used#
   to register the clk seems to be the _source_ device of the clock,
   whereas the name given should be the _consumer_ of the clock (when
   clk_get(dev, con_id) is called, dev is the _consumer_ device, and
   this is the device that dev_name() is used internally with.) Thus,
   if _that_ device is not the same as the struct device that is being
   passed to dev_name() when registering the clk, the entry in clkdev
   is utterly useless.

2) why someone would think that using best_dev_name() to work around
   this would be a good idea. One might as well pass the string
   "hahaha" when registering the clk - because if the device name is
   truncated, clk_get() is not going to find it. So, by registering
   it with clkdev, we're just eating memory for no reason.

Therefore, this change is finding bugs elsewhere. Should it cause a
boot failure? No, and I'm happy to make clkdev just warn about it.
However, reverting the change means we're not going to find these
issues.

Why was the change originally proposed (by Duanqiang Wen) ? The reason
was because of this truncation causing clk_get() to fail unexpectedly.

I am all for a _sensible_ discussion over this - not one that seems to
have an agenda about "should dev_name() be used when registering a
clk" that seems to be Guenter's approach because _that_ is not the root
cause of the issue and I've already explained that _that_ is not the
issue here. Yet, Guenter insists on that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
