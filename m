Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F7239E81
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550758; cv=none; b=e2ASxK1Pa4G/i6z95vuQz+VChtLiFOZA/gwojE18xwAKzmLCE5j3B6nGGFY47cQKQ+T/+7MOT82h6xG/GlUjiLgcAAUwkPvntJQMmV67iJ+gy7Fog9PffkidI665bxwqJXA7D2dDv1B0YIkrXt8j3Z4HftFSHVFPjs+yDEGtzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550758; c=relaxed/simple;
	bh=n59BeDrL4HSPtPJyV0ptjeluRyQyupGojePWptoCaEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaEbrrdHUhi0QL8WwbX0P3HSBfhki7Dcd11vR2/QZ6xsfnITJpp0I/kfkWN5ZJX8HfzflBg8OBfq1wi5JzzUFDVqBJwAVtIZgTjvAv9xCvv3YG2GRCCeeUmWC0S7A9+/3Yi1G9ySsMog+eFuJGxMVg0yh2Lcz5DGbwB3kmtR4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=tfIgc5Ug; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="tfIgc5Ug"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2A78A1FC15;
	Wed, 19 Nov 2025 12:12:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1763550746;
	bh=Evpn582rewV8ICdjVNbb5HT4uOHRJK2maDIvA+T80ew=; h=From:To:Subject;
	b=tfIgc5Ug4zuBzJzH0fqoTPHeQi917sNIqQBnbMEaoQiEQSsJgFvVyxkq4wzZ1uFqX
	 YZFsZqCM25a5z5N68j2dq/6fxGFYqmrrSZ7ZlNiJTewIMqJu8rufD19e3WNTRWDBv1
	 gvbdL/41Z3FsbUO88Z+DgS8ZA+sO+y/utq5LEcIar3apBRXGBeTVaC4ZBLzMA3eX5F
	 Eas3KPuwmh630+gu+f2RM9zdK3CWVJzF/9b+nKMNN5YdpodIpP2a9LkBzEF1hOplSb
	 i+PhpA/PhetRCJ2Rv2ofpNcT2SHhxaqkxdCbNYViM+CFxc6sqf8TaOYUJezZWq4dgy
	 p72/mAmHQDjjQ==
Date: Wed, 19 Nov 2025 12:12:21 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <20251119111221.GA18602@francesco-nb>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
 <20251113084950.44a09e8e@bootlin.com>
 <20251113091910.GA15538@francesco-nb>
 <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
 <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
 <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
 <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>

Hello Luca, Herve

On Wed, Nov 19, 2025 at 11:08:23AM +0100, Luca Ceresoli wrote:
> 
> On Wed Nov 19, 2025 at 9:40 AM CET, Maxime Ripard wrote:
> > On Wed, Nov 19, 2025 at 08:51:27AM +0100, Herve Codina wrote:
> >> On Tue, 18 Nov 2025 17:56:36 +0100
> >> Maxime Ripard <mripard@kernel.org> wrote:
> >> > On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
> >> > > On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:
> >> > > > On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:
> >> > > >> On Mon, 10 Nov 2025 16:03:51 -0300
> >> > > >> João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com> wrote:
> >> > > >> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> >> > > >> > recovery mechanism"), our DSI display stopped working correctly. The
> >> > > >> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and with
> >> > > >> > the change, it keeps blinking on and off because the bridge is being
> >> > > >> > reset by the error recovery mechanism.
> >> > > >> >
> >> > > >> > Even before the change, it was possible to see the message below from
> >> > > >> > the driver indicating that the bridge's internal PLL was not locked
> >> > > >> > (register 0xE5, bit 0 in [1]):
> >> > > >> >
> >> > > >> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
> >> > > >> >
> >> > > >> > However, it was working. After the change, it stopped working. Masking
> >> > > >> > the PLL error makes it work again:
> >> > > >> >
> >> > > >> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> > > >> > index 033c44326552..89a0a2ab45b1 100644
> >> > > >> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> > > >> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> > > >> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
> >> > > >> >          */
> >> > > >> >
> >> > > >> >         ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> >> > > >> > -       if (ret || irq_stat) {
> >> > > >> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
> >> > > >> >                 /*
> >> > > >> >                  * IRQ acknowledged is not always possible (the bridge can be in
> >> > > >> >                  * a state where it doesn't answer anymore). To prevent an
> >> > > >> >
> >> > > >> > Any suggestions on how to proceed here?
> >> > > >> >
> >> > > >> > #regzbot introduced: ad5c6ecef27e
> >> > > >> >
> >> > > >> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> >> > > >> >
> >> > > >>
> >> > > >> The PLL should be locked.
> >> > > >>
> >> > > >> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the status
> >> > > >> is checked at the end of the initialization sequence and the sequence has to
> >> > > >> be done again when the status register value is not 0x00.
> >> > > >>
> >> > > >> Even before monitoring (irq or polling method), you have an issue with your PLL
> >> > > >> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" message.
> >> > > >>
> >> > > >> I don't understand even how your panel can be correctly driven with the bridge
> >> > > >> PLL unlock.
> >> > > >
> >> > > > We'll try to figure out the reason and see what's the best path forward.
> >> > > >
> >> > > > Whatever was the reason it was working before, and it should stay
> >> > > > working
> >> > >
> >> > > I agree with Hervé that using the chip with an unlocked PLL looks dangerous
> >> > > and totally out of spec. So I encourage you to investigate what is going on
> >> > > in the hardware looking for the root cause, checking whether the PLL is
> >> > > really unlocked and how to get it working properly.
> >> > >
> >> > > The driver should be definitely be written focusing on the nominal case and
> >> > > handle out-of-spec cases as an exception, not the other way around.
> >> > >
> >> > > I also agree your hardware should not stop working when upgrading to a new
> >> > > kernel, so this investigation would ideally nail down tha root cause and
> >> > > point to a solution in a very short time.
> >> > >
> >> > > Hervé has matured quite some experience on SN65DSI84 error management,
> >> > > leading to his error recovery patch, and I also have a board with that chip
> >> > > on my desk. So we may be helpful in discussion, as well as reviewing and
> >> > > testing patches.
> >> >
> >> > I'd say we should do it the other way around. If that patch breaks
> >> > systems that were working fine so far without a clear reason, we should
> >> > revert the offending commit, and *then* work towards a solution to
> >> > support error recovery that doesn't break that system.
> >> >
> >>
> >> I have the feeling that the broken system has an issue from the beginning.
> >> Why its PLL has been unlocked ?
> >>
> >> I would like to understand what happens but, of course, I don't have the
> >> hardware to investigate.
> >>
> >> Could the issue been on a component before the SN65DSI83 bridge?
> >> I mean the component in charge of generating the DSI clock can be a culprit.
> >
> > I understand what you're saying, but it's not the right way to think about it.
> >
> > Let's change perspective.
> >
> > Your work laptop just got a kernel upgrade, and its display doesn't work
> > anymore. Would you be happy with the answer "it was broken all along, we
> > might be able to help you fix it, maybe not, who knows when we'll have a
> > fix"?
> >
> > It's frustrating, you might not even be able to debug it in the first
> > place, and most importantly, broken or not, it used to work just fine.
> >
> > If it used to work for years, how can you possibly argue that it was
> > broken all along?
> 
> Fully understood, and we fully agree on the principle.
> 
> My hope is that João/Francesco can investigate and find the root cause, and
> we can find a solution that works for both cases in a short time (say, this
> week).

This week it will not happen, unfortunately :-(. I have no time to look
into it and João has no longer access to the hardware.

> Without that we'd of course need to revert, but the next minute we'd still
> need to find a solution to make error management work in the nominal case,
> and I suspect we may end up with an ugly "works-without-pll" quirk and keep
> it forever.

So, it seems that the actual DSI clock is the root cause, and from some
check yesterday it's not possible to fix it (limitation on the clock
generation). In practice the display is working fine with the PLL not
locked (quite some people is using it without any issue).


> João, Francesco, on what hardware do you observe the problem? Which SoC?
> Which encoder, any previous bridges?

Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi

There is a DPI to DSI bridge in the module, tc358778, it has a 25MHz
reference clock.

TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 -> Display

From a preliminary investigation this is a HW limitation, we are not
able to generate a "good enough" DSI clock, see tc358768_calc_pll() for
the actual code implementation of it, I believe that the datasheet is
not available without NDA.

Maybe the ugly hack "works-without-pll" is the way to work? It will
require a DT change, but this seems doable.

Please note that this is the outcome of a short investigation done
yesterday afternoon, so maybe I am overlooking something, unfortunately
I do not have the bandwidth to work on it more this week.

> Which clock rates?
71100000

Francesco

