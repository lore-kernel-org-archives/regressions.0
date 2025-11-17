Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F32459E5
	for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393259; cv=none; b=lqvU7AZSBXBRPGtEHBA0Lrkj4C+MJoEWg7iRLrFUTW5pwMVlKEYe9yGqjciJCdx2rVxsD3aaXEUZTgoP/dYbk5iwwpv4sScEiXiSQd0NwwrWGNcCjS4N0BYXimG3uCl341rWfCBIdDWpWvBqMN2taCkdfWGE6tXAsFUEw8qhQeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393259; c=relaxed/simple;
	bh=yChAV3bLel1GwytrsC+IHbIIM2M1SlkMv3zbZl14Px4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=c8FHIiCxBkvcdVNVnT/LI+itW0OWvBNNCrj9Vd6ft4/WUWAW6AAd0IIlxbq88YhPThd0ZibfEBdgbLy6PBuKpo7wUt9xik7nz81XbdtgA9vQ7XmLFwJk7wSMR1IMbTDhDv/GdpK40P27HZ+bxYXffWk3qqWgn7irgBjFxBDRhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0jhgLIOz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0jhgLIOz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 238311A1B76;
	Mon, 17 Nov 2025 15:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAEC2606B9;
	Mon, 17 Nov 2025 15:27:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D86E10371CC2;
	Mon, 17 Nov 2025 16:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763393253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qza+sSnR16rEwDN4TZWSsp4tVqYbXvmlssiq0pPiU0E=;
	b=0jhgLIOzE2EQRz/BAhDap8Brk+vUxlvBy9aybvl1wSw4XI/P48bbzL2oKoKnosE9ytT/90
	/nyU233GSt/x+A/DBwGhPgHQKDJ8FvyX5WrQntv2wSfL5yCtbIg5/FHwqkj6yeaYNkN1mx
	QGO8oZLR+v5Fozw84GpuCXvbENnEeNXxeiHlCB3y+cjOqTKsnxS64f5qgQoyMDFNqrM2zX
	KoypUJf2/NnTYfWV23NHDxen/OW7pSelXfXV86/BwldZwLwunZ1iGAhPr2HfYgnl5BHazj
	LTPeTPOxSYeBtMwabsyfaKj7D1BQa+93aDe69+IwS0m+5looOvbWMSQupJszqQ==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 16:27:28 +0100
Message-Id: <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
Cc: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>,
 <thomas.petazzoni@bootlin.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Herve Codina"
 <herve.codina@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42> <20251113084950.44a09e8e@bootlin.com> <20251113091910.GA15538@francesco-nb>
In-Reply-To: <20251113091910.GA15538@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3

Hello Jo=C3=A3o, Francesco,

On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:
> On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:
>> On Mon, 10 Nov 2025 16:03:51 -0300
>> Jo=C3=A3o Paulo Gon=C3=A7alves <jpaulo.silvagoncalves@gmail.com> wrote:
>> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
>> > recovery mechanism"), our DSI display stopped working correctly. The
>> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and wit=
h
>> > the change, it keeps blinking on and off because the bridge is being
>> > reset by the error recovery mechanism.
>> >
>> > Even before the change, it was possible to see the message below from
>> > the driver indicating that the bridge's internal PLL was not locked
>> > (register 0xE5, bit 0 in [1]):
>> >
>> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
>> >
>> > However, it was working. After the change, it stopped working. Masking
>> > the PLL error makes it work again:
>> >
>> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/b=
ridge/ti-sn65dsi83.c
>> > index 033c44326552..89a0a2ab45b1 100644
>> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi=
83 *ctx)
>> >          */
>> >
>> >         ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
>> > -       if (ret || irq_stat) {
>> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
>> >                 /*
>> >                  * IRQ acknowledged is not always possible (the bridge=
 can be in
>> >                  * a state where it doesn't answer anymore). To preven=
t an
>> >
>> > Any suggestions on how to proceed here?
>> >
>> > #regzbot introduced: ad5c6ecef27e
>> >
>> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
>> >
>>
>> The PLL should be locked.
>>
>> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the stat=
us
>> is checked at the end of the initialization sequence and the sequence ha=
s to
>> be done again when the status register value is not 0x00.
>>
>> Even before monitoring (irq or polling method), you have an issue with y=
our PLL
>> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" messa=
ge.
>>
>> I don't understand even how your panel can be correctly driven with the =
bridge
>> PLL unlock.
>
> We'll try to figure out the reason and see what's the best path forward.
>
> Whatever was the reason it was working before, and it should stay
> working

I agree with Herv=C3=A9 that using the chip with an unlocked PLL looks dang=
erous
and totally out of spec. So I encourage you to investigate what is going on
in the hardware looking for the root cause, checking whether the PLL is
really unlocked and how to get it working properly.

The driver should be definitely be written focusing on the nominal case and
handle out-of-spec cases as an exception, not the other way around.

I also agree your hardware should not stop working when upgrading to a new
kernel, so this investigation would ideally nail down tha root cause and
point to a solution in a very short time.

Herv=C3=A9 has matured quite some experience on SN65DSI84 error management,
leading to his error recovery patch, and I also have a board with that chip
on my desk. So we may be helpful in discussion, as well as reviewing and
testing patches.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
