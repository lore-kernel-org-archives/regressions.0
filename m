Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476729;
	b=gNLUiEPDKtWxo1em33RIYz+Llhvb6mGfywwA9I5X1q6TI6sCSPWYn8ifgtXyXnD/3X3m
	 8hxCw4PXMpjs6bQHl2liP4bVwCkKyky1vTqbmZdoP3rNcT32Ju0zySkaFTb7TckDZT/0h
	 G+lFgNVxklqqT4iSx2WTtMo9pmDGwSbG0JtKjNXOZuraE+JAjv4Ngu6x0IwKnA4Aje9WA
	 TVmACSBelM9e16j84uLbALoy1XZ93eUOvImp0sOTxNf9bS7vLR20Yc5epvt4tiVAI8UpO
	 Wl1EPkkXX3InCC0IMYqM7A11bAsahh40bG3r/xihhFn+9ZBLWIAY/JCjIml3kUbW+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476729;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uKwkGpbKTSm+TeC+5PE4mVU5+tF0hJnI8MkhBwgF5Is=;
	b=op27FrpiRLy2CiaoOxHQD2R0X7w+ZLylBXAfOJmPBWrvUxC52ejKsi5S60gKhxneCbKt
	 oFwi/hOEorlAPX78f6ojcyWZKbEegfVYKqNt47O1ITVsKqKUk3lURQvo0FHwS6+tyqY3c
	 iblAm9mB8i5it9yZJULWhgSptF1hPu10Ks04n2ID8PnpZ6vRxudaOgWRu8ggX9S05Uteo
	 puiDyVaCXOozjzvPGYmX7fEuzdYDbnBvVn1MkPXyQyXGT1pf3PJ/vBfHpOQjPqR/FDmTd
	 XPiG0jbTUJQykj/Dffc0Rjfa4md64t7wLvK7gLMVNebX7e/sI+1eF52Ai/+1Gae1GwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=nYIwTd1T;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F3606A327
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 09:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 145F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=nYIwTd1T
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 038901FB1F;
	Thu, 12 Nov 2026 10:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794476719;
	bh=uKwkGpbKTSm+TeC+5PE4mVU5+tF0hJnI8MkhBwgF5Is=; h=From:To:Subject;
	b=nYIwTd1TXIHzMzyjHUt6ACpVqDRCGfeI3oXz1tIdjri8GqMNB+v5D1HAyRabie0V/
	 JRUaLA0OVVPSW1Sb+6IM0MZXNPv/QCMNanBGHX3iABB5ccTtWB7voffjip+Gvt3Bty
	 8S91W3X7zqfdvc58FcBd6HL7JlA6qphkaKLRPsuaFbnHFrHZWIJQLeHYN4i8BKlKJe
	 Nn/EJ8eJFihGH0bKk5HSOwE3GPQ55ccioJYFqBJwAeaJfg7tSt4LFpDSImsNOyk2OD
	 +hW6Wouyfgh1FckyEwan3n9ArSga7l7TU/eDwU2QNh/97YDg6Y4ED2psE7dUAXegO6
	 r23KhXIseXyUA==
Date: Thu, 12 Nov 2026 10:45:15 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	regressions@lists.linux.dev,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
	Aristo Chen <aristo.chen@canonical.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] phy: freescale: fsl-samsung-hdmi: initialize default
 rate
Message-ID: <20261112094515.GA47236@francesco-nb>
References: <20260903054811.9720-1-aristo.chen@canonical.com>
 <13219248.O9o76ZdvQC@steina-w>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13219248.O9o76ZdvQC@steina-w>

+regressions list and Emanuele

Hi,

On Wed, Nov 11, 2026 at 08:11:39AM +0100, Alexander Stein wrote:
> Am Donnerstag, 3. September 2026, 07:47:58 Mitteleuropäische Normalzeit schrieb Aristo Chen:
> > The HDMI PHY clock reports 74.25 MHz when cur_cfg is unset, but does
> > not establish that rate in hardware. The common clock framework caches
> > the reported rate when registering the clock and skips a first
> > clk_set_rate(74250000) request because the rate appears unchanged.
> > 
> > Consequently, a display whose initial mode uses a 74.25 MHz pixel clock
> > can leave the PHY with its bootloader register state and receive no
> > TMDS signal. Requesting another rate first avoids the issue because the
> > set_rate callback configures the PHY.
> > 
> > Program the 74.25 MHz table entry with the reference clock enabled
> > before registering the clock provider. recalc_rate can then report the
> > configured rate, and a skipped first rate change is safe. Also enable
> > the reference clock when restoring that configuration on resume.
> > 
> > Fixes: 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY")
> > Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
> 
> Unfortunately this breaks my platform (imx8mp-tqma8mpql-mba8mpxl.dts).
> With this patch applied I get the following errors in kernel log:
> > fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
> > fsl-samsung-hdmi-phy 32fdff00.phy: error -ETIMEDOUT: failed to configure default rate
> > fsl-samsung-hdmi-phy 32fdff00.phy: probe with driver fsl-samsung-hdmi-phy failed with error -110
> 
> Reverting fixes my platform and HDMI as expected.

Same here on v7.4-rc2, on all the Toradex i.MX8M Plus boards in our CI
(Verdin iMX8M Plus on Dahlia, SMARC iMX8M Plus), with the very same
three errors.

#regzbot ^introduced: c01ccf91b257
#regzbot title: phy: fsl-samsung-hdmi: i.MX8MP HDMI PHY probe fails with "PLL failed to lock"

Francesco

