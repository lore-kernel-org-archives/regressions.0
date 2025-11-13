Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64A28C00D
	for <regressions@lists.linux.dev>; Thu, 13 Nov 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025567; cv=none; b=K+1BIjxiiUk9bmlIeXQGiSmQ5nh6xLoG8h25nQLLvdlMNajl+EX5ANtpwy/kw1//BeXObfcg1cTZzSs5nBq1s6nMCJistdJz3AdoV20OAedGTZwCSG9Su7h1R1duG58hzGo3aWolvT6wB+RXbvUtxEIgRQxE6OXePVclNhJz1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025567; c=relaxed/simple;
	bh=8T+Vlo9lPT5az9h3+Xkrh1Vrop5dlx1WECtZFo+T5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ga+LbmSCijVxNPi0DTbxSVxiNC+PjwExhGZziLuHj4ccH3rdKcOMBiNzKy8m8GbcsSWG0aOe5a2QBq8gVGRHCN4KbvP/AaLnXfW61o3A6Yfqz1c+v3ZGXqxfqA/18megR9hT+QIX3lVji6lJUGOPiK3qAR97PPzZnTQGNj9/ofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QaTcbIYf; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QaTcbIYf"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1B1271FAFB;
	Thu, 13 Nov 2025 10:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1763025554;
	bh=pHnnYYkSyfYO1qmzrJ98WQdoEtzPFRlm+L8Z3t85uAk=; h=From:To:Subject;
	b=QaTcbIYfzO9FToC8CB+mUnU4N2N8a4LBayWtthtCeD+JPSgxQ3eMfIETur+YuFZWk
	 zsiqsgr+XDwxRyt9DZLQX5HdYfGnJ1Ap+ebaA4NHjQ0cDVMGGJe8sfFPco8eHj1EEg
	 KSlBNcvh7PGv/GXa8V7MkkAGiGTtxSQQAVMddkb9FztMaCS1SMcGZ0cPrnJWAoJOLe
	 9xQpDAaa8eOXXzKs39B0mOMiKRPeE7LT/ByFUBZ+17FT3WaANmr/u441Xj4De/UlZW
	 IAK2lMM00sNIgZ2+sekBpJ1ApIzrSqenIqg0kj67xOI5IJy6WrllcuadIesuVoOhF1
	 PZ4vkWmVT7/Cw==
Date: Thu, 13 Nov 2025 10:19:10 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Herve Codina <herve.codina@bootlin.com>
Cc: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <20251113091910.GA15538@francesco-nb>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
 <20251113084950.44a09e8e@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113084950.44a09e8e@bootlin.com>

On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:
> On Mon, 10 Nov 2025 16:03:51 -0300
> João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com> wrote:
> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> > recovery mechanism"), our DSI display stopped working correctly. The
> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and with
> > the change, it keeps blinking on and off because the bridge is being
> > reset by the error recovery mechanism.
> > 
> > Even before the change, it was possible to see the message below from
> > the driver indicating that the bridge's internal PLL was not locked
> > (register 0xE5, bit 0 in [1]):
> > 
> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
> > 
> > However, it was working. After the change, it stopped working. Masking
> > the PLL error makes it work again:
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 033c44326552..89a0a2ab45b1 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
> >          */
> > 
> >         ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> > -       if (ret || irq_stat) {
> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
> >                 /*
> >                  * IRQ acknowledged is not always possible (the bridge can be in
> >                  * a state where it doesn't answer anymore). To prevent an
> > 
> > Any suggestions on how to proceed here?
> > 
> > #regzbot introduced: ad5c6ecef27e
> > 
> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> > 
> 
> The PLL should be locked.
> 
> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the status
> is checked at the end of the initialization sequence and the sequence has to
> be done again when the status register value is not 0x00.
> 
> Even before monitoring (irq or polling method), you have an issue with your PLL
> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" message.
> 
> I don't understand even how your panel can be correctly driven with the bridge
> PLL unlock.

We'll try to figure out the reason and see what's the best path forward.

Whatever was the reason it was working before, and it should stay
working

> I don't think that masking the error would be the correct solution.
> The root cause has to be identified. The "sn65dsi83 2-002c: Unexpected link
> status 0x01" should not appear.
> 
> Can you check your clocks ?
> Does your hardware use the REFCLK external clock ?

No, REFCLK is tied to GND.

> The driver expects the clock from the MIPI D-PHY channel A HS continuous (bit 0
> in 0x0A register).

Francesco

