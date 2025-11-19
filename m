Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9AF2F656A
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546916; cv=none; b=To6Z9aaHMievWC/pfhksgV348L+qEHF90ic8GAM0Qy4d97Na2ad+5HOwWlcb6UZv9IqFJaJ5XQksgoMq+I4Ftf+2WuGU5olhDbnHif8K6yamDJb4kZKbl6PinlDuWs+NatDokv+Po43JN5MfBhXueoLrTRw6uZLcqqFCDmJVF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546916; c=relaxed/simple;
	bh=Wci6XdDEQakq/5T7qNl5Wt+wJoNwxPhusP8jgCKlP3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=IIjn/7mK0m3XVOdZWKrLZmH2niQR6oBVMeJ3yEkppr/s32mtoyBxgqZiBAzerAO5Vs+4hDvZijT6F8qyB93XYR/XbnCLYN9bFsb9qrY2rFHORtnPW/0KuHh1ISbmZCuBrG51hPXKAT2wKSCV4L1B2N/DWoytWzhqXMbtLXDoe20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zkNDF/5c; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zkNDF/5c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CAE7EC11185;
	Wed, 19 Nov 2025 10:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0454460720;
	Wed, 19 Nov 2025 10:08:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F35E10371A28;
	Wed, 19 Nov 2025 11:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763546910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TfOXHTfXpnjPBB9Q78F+aYGhiK4ZT2XUm0yrZgxB5AA=;
	b=zkNDF/5cD1yzdr2a4SgfSbSXZbpck3K/dyB4tMKFkQBKYaIgMWUk8ohextUVGWO59THg9m
	Ltt8IfKg8wHvXnX9In/FO9LSNsUoy7M3/kjuSUGCfb/wCN599LRB2XPiH/Bb6M2FCRQwes
	j5liopWDBv/Sq1yLAQED+FRW1OmZdGlLoKLpRBe0T9mHfXAaZ1Rtc93UvzlsfVnb/akGzF
	cUF2jR+TVXB+fvXc+lHVd+sZTFpDUHSwkNa+QY9ZyaKAq+I3uNs9zcF2ZzEPB23K2x+lqk
	IHyBFqad+Gor10YzgOdBpMthbt4vD9JoLef4nPbGxA9YFEQBeWB2O7OBQhzpfA==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:08:23 +0100
Message-Id: <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
Cc: "Francesco Dolcini" <francesco@dolcini.it>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>,
 <thomas.petazzoni@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Herve Codina"
 <herve.codina@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
X-Mailer: aerc 0.20.1
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42> <20251113084950.44a09e8e@bootlin.com> <20251113091910.GA15538@francesco-nb> <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com> <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn> <20251119085127.6e3e429e@bootlin.com> <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
In-Reply-To: <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime, Jo=C3=A3o, Francesco,

On Wed Nov 19, 2025 at 9:40 AM CET, Maxime Ripard wrote:
> On Wed, Nov 19, 2025 at 08:51:27AM +0100, Herve Codina wrote:
>> Hi Maxime,
>>
>> On Tue, 18 Nov 2025 17:56:36 +0100
>> Maxime Ripard <mripard@kernel.org> wrote:
>>
>> > On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
>> > > On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:
>> > > > On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:
>> > > >> On Mon, 10 Nov 2025 16:03:51 -0300
>> > > >> Jo=C3=A3o Paulo Gon=C3=A7alves <jpaulo.silvagoncalves@gmail.com> =
wrote:
>> > > >> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add erro=
r
>> > > >> > recovery mechanism"), our DSI display stopped working correctly=
. The
>> > > >> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, =
and with
>> > > >> > the change, it keeps blinking on and off because the bridge is =
being
>> > > >> > reset by the error recovery mechanism.
>> > > >> >
>> > > >> > Even before the change, it was possible to see the message belo=
w from
>> > > >> > the driver indicating that the bridge's internal PLL was not lo=
cked
>> > > >> > (register 0xE5, bit 0 in [1]):
>> > > >> >
>> > > >> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
>> > > >> >
>> > > >> > However, it was working. After the change, it stopped working. =
Masking
>> > > >> > the PLL error makes it work again:
>> > > >> >
>> > > >> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gp=
u/drm/bridge/ti-sn65dsi83.c
>> > > >> > index 033c44326552..89a0a2ab45b1 100644
>> > > >> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> > > >> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> > > >> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct =
sn65dsi83 *ctx)
>> > > >> >          */
>> > > >> >
>> > > >> >         ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_sta=
t);
>> > > >> > -       if (ret || irq_stat) {
>> > > >> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
>> > > >> >                 /*
>> > > >> >                  * IRQ acknowledged is not always possible (the=
 bridge can be in
>> > > >> >                  * a state where it doesn't answer anymore). To=
 prevent an
>> > > >> >
>> > > >> > Any suggestions on how to proceed here?
>> > > >> >
>> > > >> > #regzbot introduced: ad5c6ecef27e
>> > > >> >
>> > > >> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
>> > > >> >
>> > > >>
>> > > >> The PLL should be locked.
>> > > >>
>> > > >> Also in the datasheet, in 'Table 7-2. Initialization Sequence', t=
he status
>> > > >> is checked at the end of the initialization sequence and the sequ=
ence has to
>> > > >> be done again when the status register value is not 0x00.
>> > > >>
>> > > >> Even before monitoring (irq or polling method), you have an issue=
 with your PLL
>> > > >> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01=
" message.
>> > > >>
>> > > >> I don't understand even how your panel can be correctly driven wi=
th the bridge
>> > > >> PLL unlock.
>> > > >
>> > > > We'll try to figure out the reason and see what's the best path fo=
rward.
>> > > >
>> > > > Whatever was the reason it was working before, and it should stay
>> > > > working
>> > >
>> > > I agree with Herv=C3=A9 that using the chip with an unlocked PLL loo=
ks dangerous
>> > > and totally out of spec. So I encourage you to investigate what is g=
oing on
>> > > in the hardware looking for the root cause, checking whether the PLL=
 is
>> > > really unlocked and how to get it working properly.
>> > >
>> > > The driver should be definitely be written focusing on the nominal c=
ase and
>> > > handle out-of-spec cases as an exception, not the other way around.
>> > >
>> > > I also agree your hardware should not stop working when upgrading to=
 a new
>> > > kernel, so this investigation would ideally nail down tha root cause=
 and
>> > > point to a solution in a very short time.
>> > >
>> > > Herv=C3=A9 has matured quite some experience on SN65DSI84 error mana=
gement,
>> > > leading to his error recovery patch, and I also have a board with th=
at chip
>> > > on my desk. So we may be helpful in discussion, as well as reviewing=
 and
>> > > testing patches.
>> >
>> > I'd say we should do it the other way around. If that patch breaks
>> > systems that were working fine so far without a clear reason, we shoul=
d
>> > revert the offending commit, and *then* work towards a solution to
>> > support error recovery that doesn't break that system.
>> >
>>
>> I have the feeling that the broken system has an issue from the beginnin=
g.
>> Why its PLL has been unlocked ?
>>
>> I would like to understand what happens but, of course, I don't have the
>> hardware to investigate.
>>
>> Could the issue been on a component before the SN65DSI83 bridge?
>> I mean the component in charge of generating the DSI clock can be a culp=
rit.
>
> I understand what you're saying, but it's not the right way to think abou=
t it.
>
> Let's change perspective.
>
> Your work laptop just got a kernel upgrade, and its display doesn't work
> anymore. Would you be happy with the answer "it was broken all along, we
> might be able to help you fix it, maybe not, who knows when we'll have a
> fix"?
>
> It's frustrating, you might not even be able to debug it in the first
> place, and most importantly, broken or not, it used to work just fine.
>
> If it used to work for years, how can you possibly argue that it was
> broken all along?

Fully understood, and we fully agree on the principle.

My hope is that Jo=C3=A3o/Francesco can investigate and find the root cause=
, and
we can find a solution that works for both cases in a short time (say, this
week).

Without that we'd of course need to revert, but the next minute we'd still
need to find a solution to make error management work in the nominal case,
and I suspect we may end up with an ugly "works-without-pll" quirk and keep
it forever.

Jo=C3=A3o, Francesco, on what hardware do you observe the problem? Which So=
C?
Which encoder, any previous bridges?

Which clock rates?

Which is the board dts?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
