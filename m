Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63C32ABCC
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538705; cv=none; b=ANfChPFSfaGt7/12nu8JW55SKfqwZpQXBUfX5vGPlUzfNw3V6qhiiFeciX0Jh104oj817akihJrHzWUB0qsqpnNvdLhVg9tjnY86t2hSax08YicH3RGXXMK6+F46nkIL/MZxZz6I1D823ievq12sY0v+/0c+ssyx+MwPKqe3T+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538705; c=relaxed/simple;
	bh=moSIdXxGWZRXK/4e3ifdRRRrO2/+z0PC55fcpnq73iU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWPjhUWOryMfiDwwyE0VF92rjn/7uSAz/ud+/MV6xrgU4+JwJ1HVuNUepWkqUZUsh3Ux1x1w2Pxcg7oQP4cWdYjzLvJFim6UMd74TAl0WJ1sdUCs7ojad6tvSfYEFvzegVojufctFYvTKpU7cnrXXO2zEzOMrbQWy02GCOzCESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xH3Gv52k; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xH3Gv52k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17698C11183;
	Wed, 19 Nov 2025 07:51:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 389D060720;
	Wed, 19 Nov 2025 07:51:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B0B91037173E;
	Wed, 19 Nov 2025 08:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763538694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iVf+LJruwHFR7/Tcw+BVkEQRrQyALRUQTsQf2AxoGQA=;
	b=xH3Gv52kuMSEZ9IgF0S8hVbpRpSQN5ofwfLcIQHcr9xGK5gZ+I4O/3Pr3uAJZOu3FyMUOT
	dDes3aCFo5FqJPxR4oJHqhlZ0xFGVyj24y/O6Ohua4zc/N4qdyvQZWvmE7eHkqnecA/IA+
	rr3TRhAnzuvICAoL37wb4VFK4vkh9UTTJWWEJGGWDOg//pClIQ5k4/PgUoUganDN930o78
	RMQnFpe+VQhLI0QfzMKFZZcIRb5b5HOitFPa+e2t16T7onTgK979XR8pbbRMYE38qJ8jcR
	22/9kUhaOux2/v+g3DNoVGwDEDaNUQW6OG+qAJK8XCbfeDOCb8jWaEM2Y/ON0Q==
Date: Wed, 19 Nov 2025 08:51:27 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Francesco Dolcini
 <francesco@dolcini.it>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?=
 =?UTF-8?B?cw==?= <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <joao.goncalves@toradex.com>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
Message-ID: <20251119085127.6e3e429e@bootlin.com>
In-Reply-To: <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
	<20251113084950.44a09e8e@bootlin.com>
	<20251113091910.GA15538@francesco-nb>
	<DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
	<nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
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

Hi Maxime,

On Tue, 18 Nov 2025 17:56:36 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
> > On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:  
> > > On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:  
> > >> On Mon, 10 Nov 2025 16:03:51 -0300
> > >> João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com> wrote:  
> > >> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> > >> > recovery mechanism"), our DSI display stopped working correctly. The
> > >> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and with
> > >> > the change, it keeps blinking on and off because the bridge is being
> > >> > reset by the error recovery mechanism.
> > >> >
> > >> > Even before the change, it was possible to see the message below from
> > >> > the driver indicating that the bridge's internal PLL was not locked
> > >> > (register 0xE5, bit 0 in [1]):
> > >> >
> > >> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
> > >> >
> > >> > However, it was working. After the change, it stopped working. Masking
> > >> > the PLL error makes it work again:
> > >> >
> > >> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > >> > index 033c44326552..89a0a2ab45b1 100644
> > >> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > >> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > >> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
> > >> >          */
> > >> >
> > >> >         ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> > >> > -       if (ret || irq_stat) {
> > >> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
> > >> >                 /*
> > >> >                  * IRQ acknowledged is not always possible (the bridge can be in
> > >> >                  * a state where it doesn't answer anymore). To prevent an
> > >> >
> > >> > Any suggestions on how to proceed here?
> > >> >
> > >> > #regzbot introduced: ad5c6ecef27e
> > >> >
> > >> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> > >> >  
> > >>
> > >> The PLL should be locked.
> > >>
> > >> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the status
> > >> is checked at the end of the initialization sequence and the sequence has to
> > >> be done again when the status register value is not 0x00.
> > >>
> > >> Even before monitoring (irq or polling method), you have an issue with your PLL
> > >> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" message.
> > >>
> > >> I don't understand even how your panel can be correctly driven with the bridge
> > >> PLL unlock.  
> > >
> > > We'll try to figure out the reason and see what's the best path forward.
> > >
> > > Whatever was the reason it was working before, and it should stay
> > > working  
> > 
> > I agree with Hervé that using the chip with an unlocked PLL looks dangerous
> > and totally out of spec. So I encourage you to investigate what is going on
> > in the hardware looking for the root cause, checking whether the PLL is
> > really unlocked and how to get it working properly.
> > 
> > The driver should be definitely be written focusing on the nominal case and
> > handle out-of-spec cases as an exception, not the other way around.
> > 
> > I also agree your hardware should not stop working when upgrading to a new
> > kernel, so this investigation would ideally nail down tha root cause and
> > point to a solution in a very short time.
> > 
> > Hervé has matured quite some experience on SN65DSI84 error management,
> > leading to his error recovery patch, and I also have a board with that chip
> > on my desk. So we may be helpful in discussion, as well as reviewing and
> > testing patches.  
> 
> I'd say we should do it the other way around. If that patch breaks
> systems that were working fine so far without a clear reason, we should
> revert the offending commit, and *then* work towards a solution to
> support error recovery that doesn't break that system.
> 

I have the feeling that the broken system has an issue from the beginning.
Why its PLL has been unlocked ?

I would like to understand what happens but, of course, I don't have the
hardware to investigate.

Could the issue been on a component before the SN65DSI83 bridge?
I mean the component in charge of generating the DSI clock can be a culprit.

Best regards,
Hervé


