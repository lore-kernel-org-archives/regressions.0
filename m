Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F4531770B
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763577639; cv=none; b=bjI3KvlfMOGKgHyh0Yj9Vur1C86MOxy6/RTLGq6NUXhPpKSXnP2rBaCx34MA1/JtuQqhcv36b3WtiisALebI5ZHG/+IVDM6oUZBRalCnSWQfsNq8bhxm+iH4x4FPVqdgDqmvpwVhRxOq8FtYh4vH1vo19X/OKPEyWsmFv6qzAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763577639; c=relaxed/simple;
	bh=CHFWBqvF9n4VZBOoD7tQ1LXeg/LJjeWLOQMtp3jd9tI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVqMsvceCm0cewSMl3vQeycDItalkX069+L69mGMp7WetEfa13vSdjT1rSN4Cmt6wzL9afebipgCf+jJZaguOBFwInS2Gjpc0TMzOKhJEDLuatiwWetWu6wDO4yK+ip4irRaTjc8Sz3rQMoKDhldVzv3b0Erf3JAF8VUE/j/WNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i6xuEDQc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i6xuEDQc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 85E8DC11194;
	Wed, 19 Nov 2025 18:40:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B127060699;
	Wed, 19 Nov 2025 18:40:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3F1E10370C29;
	Wed, 19 Nov 2025 19:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763577630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MgtrbSfxBNKB/XJlVL6MyNDjXKundLZ1g49jeFfodeI=;
	b=i6xuEDQcjFLlwlfgOupGzHb6O3Xx50Sp1U/85Wc8KblGz0PGdRxRAnAB11dpMKcWk1LCoC
	22lDNXSt4y8WHFuDAB/0Xe9XgLSux2ChXEgjMiBqILc90R0Uh5ZDRuH6cJe2zYp+JoyB49
	mYkWABqVi1NmdN2/dQp6HJ7t6BCbMSyS3zIxCOexk3ej6oScwQOMgo1/GeNQsHRSA5KaFU
	N5WszZLp69QVoqxo6aQN6QQPquw0q/bnqHUEhf/nCqwmhaFnQowMDuEW6RLllYszF5ZQ1Q
	skjzjA7av2BPttUOuDp1ileWPgcA4B7fRffXMfry+cltSjH0F3vUEWkwaZJxMw==
Date: Wed, 19 Nov 2025 19:40:23 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Francesco Dolcini"
 <francesco@dolcini.it>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maxime Ripard"
 <mripard@kernel.org>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?=
 =?UTF-8?B?cw==?= <jpaulo.silvagoncalves@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <joao.goncalves@toradex.com>, <linux-kernel@vger.kernel.org>,
 <regressions@lists.linux.dev>, <thomas.petazzoni@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
Message-ID: <20251119194023.6239d397@bootlin.com>
In-Reply-To: <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
	<20251113084950.44a09e8e@bootlin.com>
	<20251113091910.GA15538@francesco-nb>
	<DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
	<nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
	<20251119085127.6e3e429e@bootlin.com>
	<gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
	<DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
	<20251119111221.GA18602@francesco-nb>
	<593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
	<20251119122443.GA29208@francesco-nb>
	<DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca, Francesco, others

On Wed, 19 Nov 2025 18:27:38 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hello,
> 
> On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
> ...
> >> I might be mistaken, but I don't think the PLL will work if unlocked...
> >> But maybe the case is that it unlocks and lock again right afterwards.  
> >> >> João, Francesco, on what hardware do you observe the problem? Which SoC?
> >> >> Which encoder, any previous bridges?  
> >> >
> >> > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> >> >
> >> > There is a DPI to DSI bridge in the module, tc358778, it has a 25MHz
> >> > reference clock.
> >> >
> >> > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 -> Display
> >> >
> >> > From a preliminary investigation this is a HW limitation, we are not
> >> > able to generate a "good enough" DSI clock, see tc358768_calc_pll() for  
> 
> Thanks Francesco for the feedback!
> 
> I'm not sure I completely understand the issue described, but if the TI
> bridge requires a clock that cannot be provided by the hardware, then this
> actually looks like "a HW limitation" as you wrote, due to a HW integration
> limitation/bug/issue/whatever. In case this is confirmed, I think quirks
> are an appropriate tool to handle HW integration issues.
> 
> >> I haven't studied the docs or done any testing, but I would think that
> >> it doesn't matter for the PLL even if the incoming DSI clock is a bit
> >> off, as long as it's continuous and stable.
> >>
> >> My first thought was that the DSI is using non-continuous clock, but at
> >> least the driver has code to drop the MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
> >>  
> >> > the actual code implementation of it, I believe that the datasheet is
> >> > not available without NDA.
> >> >
> >> > Maybe the ugly hack "works-without-pll" is the way to work? It will
> >> > require a DT change, but this seems doable.  
> >>
> >> Revert is easier than adding new hacky DT properties... At least until
> >> the problem is understood.
> >>  
> >> > Please note that this is the outcome of a short investigation done
> >> > yesterday afternoon, so maybe I am overlooking something, unfortunately
> >> > I do not have the bandwidth to work on it more this week.
> >> >  
> >> >> Which clock rates?  
> >> > 71100000  
> >> It would be a good test to try out with a few different clocks.  
> >
> > 50 MHz works, for example.
> >
> > It seems that the issue exists when the actual display clock is different
> > from the dsi clock. And this can happen for the reason I explained
> > before (the DSI clock is computed starting from this 25MHz reference
> > clock).  
> 

If there is no way to set a correct clock, I agree with Luca a quirk should
be the best solution.

For instance, in the dts:
  ti,pll_may_unlock_quirk;

In the driver, mask the PLL unlock status bit from monitoring (polling
and irq) if this boolean property is true:
 - Mask IRQ PLL Unlock bit in REG_IRQ_EN when IRQ are enabled
 - Mask IRQ PLL Unlock bit in REG_IRQ_STAT in sn65dsi83_handle_errors() to
   avoid a recover process on PLL unlock.

Best regards,
Hervé
