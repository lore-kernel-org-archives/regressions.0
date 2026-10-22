Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675911;
	b=OjCi4N4hoHhZemmJqoN6VwoH8FkZ6jSsNraRnX3nukfURUytEaJthSM9mFDSsT6RIU0h
	 opfbF0ibxojn97tP4Cz7zsbMe1fTwZBlR/wdXFe9E0Yv1Jpt2+iTIhnTY9H1+abqK+d+Z
	 cbAd7DDy4BwVWR+vJnky8rsNyXaZ5RppW/voYQ2rSmpai5Amqgqjl+bFFgRaENZCWQWmj
	 LdL1eu6kC5YtST9XriwK+vIhS6qch9SR4ijeATkG8IsdUeYRTXPP3bkjicaatKnY8ID83
	 TJ/8q6G9K27sTJyx+gFMBqxLQWnrxORr6g4ZYXLf4CpsWu2c7lXVjrQH+5/mtWyhZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675911;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=unVAESJai7F1UmJzEHO+wzlvQnnF/1GINQlY378qHu4=;
	b=BhX0Pvhsob6D4mG8rzcLluEnD0IdKwTObOj6dLwYdXczRm5fNNowMvKBuJO1++uTTM3D
	 7Y+gXlJt06TaaCXJtPW+5TUTUmtXi7ORC1gmfBv+m2obir6H7pKvlLBVLlOkUhhh9+yVV
	 +SENlHwX74GBk/ERDY5vFWmhIQKswx6dHAdv4U20+boue/FfM9LObmNB1wpkrFFAT9wDB
	 rGPmbGKevZ1gH1Xt1WNT7weMTWHqp/CNRaQXLAqXICfywrcndNhwjo7ziA4YjpoKTjuQZ
	 2OYq+9ZFAZoz4TYEyuxWWt+03KwG7lLsGupwzqjezA//Qu3BzK/bA3J3aqBm2IUuQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NFz4ABAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479A606A33B;
	Thu, 22 Oct 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NFz4ABAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1498E1F000C1;
	Thu, 22 Oct 2026 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792675910;
	bh=unVAESJai7F1UmJzEHO+wzlvQnnF/1GINQlY378qHu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NFz4ABAQp2vbr4lZ5nTkFb80iPDOMnAyr1zQfTCQfpZitXEgi8Vo/Wue0YC80WX6F
	 63nxqfyOgmF+WB5jPDHiFnMhPWWI8HpGfjlwZCdgPB5LnBbZmYXq86Co7tqfKIKeQw
	 FUv8/eV6PIYj+kLeeTNUNo9uxO0HQIVY9Wf8a3b8=
Date: Thu, 22 Oct 2026 15:31:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Wetterwald <martin@wetterwald.eu>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
Message-ID: <2026102218-vowel-plutonium-629e@gregkh>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>

On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
> Hi Greg,
> this is a regression introduced by aa125180c673 (via your tree) in
> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> staging-linus would be great. Thanks!

This is not a staging driver anymore, please route it through the proper
tree after -rc1 is out.

thanks,

greg k-h
