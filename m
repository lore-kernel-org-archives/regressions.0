Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222F30E828
	for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993594; cv=none; b=dS+NGDOHtGuNjCEU9Zy6+FGt2vlNd7/t+0XK75yAp5ERnVrUnqKrV79gXG7hytWPvkJmqbor5OVWSKkeO8mgKUzTAnnBb8MPTPoC3MQLdfgkOVLMISO8L+MZ2P6pcVFVMb43PmlddXK1Zy5uG9CmFC/iXsWSKhVOEduHqCxDatw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993594; c=relaxed/simple;
	bh=TtbwjTu39xIVLbAdsXL2o4Uzyg3R7+pWeQt65UNXR7Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=NeLgMqTA26cmOvdZF3H6Lii+gFI3tY5CG/5Ip8SMdOCRiEyTloiv4LufRtg31ba6EGuBO3oK2+hBXnZwkpIk8yil4YmQhsIWQqjVIzHEYctnE9N27RhznweOrUap9xW8UBunXyKSpj5pygv+MM79YRNyOWiTAzM581x6ycy5ZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yOCTaPDC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yOCTaPDC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 69E984E4189E;
	Mon, 24 Nov 2025 14:13:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3944C606FC;
	Mon, 24 Nov 2025 14:13:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 560A910371CD0;
	Mon, 24 Nov 2025 15:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763993584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MI+U3tcVYl5turZVLvCHHkdsfpdDTwhfGiy1eCgNK84=;
	b=yOCTaPDCH5ViAnRplzmWKpPaZ9OMZU+psonqo/OpfGA0mA4vucEvLZcpLSpOvvJLOWVD4I
	j9KB6j6A89nC5r6RBNApKQJ282n/j/n8AgmKhZAP4ULwwdNxoSUee7tqCXaBYHY4KNmpHy
	0P1D6ICsc4mKiW8o3/D1m7cWSdgQp3OvFgv0iAAg76vnJZJlWb4zIejEbUSiIi4V7iPlGn
	aF6bGAFtQsZ3qguiSYeh/3ZNOcaMGDKd/zGb+qjCKuBf23eEovvCdnMXsU+ab1pES92eah
	g67q3ZlKoQogZNbLqyffX7buRR1d0LcgCbrtuiYaA74+bGXHW0qkN/1/Fu6K4Q==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 15:12:57 +0100
Message-Id: <DEGZJAA4DU9K.374YIT813KDWZ@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
Cc: "Herve Codina" <herve.codina@bootlin.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <joao.goncalves@toradex.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Philippe Schenker" <philippe.schenker@impulsing.ch>
X-Mailer: aerc 0.20.1
References: <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn> <20251119085127.6e3e429e@bootlin.com> <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n> <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com> <20251119111221.GA18602@francesco-nb> <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com> <20251119122443.GA29208@francesco-nb> <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com> <20251119194023.6239d397@bootlin.com> <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch> <ko2ghflyddv2igj43wkwsaaoneg2jwpdxldlfsix4cllzspdbj@w4fhabuwm5wy> <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com>
In-Reply-To: <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

sorry, a typo below.

On Mon Nov 24, 2025 at 1:12 PM CET, Luca Ceresoli wrote:
> Hello Jo=C3=A3o, Francesco, Maxime, Herv=C3=A9,
>
> On Fri Nov 21, 2025 at 10:58 AM CET, Maxime Ripard wrote:
>> On Thu, Nov 20, 2025 at 09:50:27AM +0000, Philippe Schenker wrote:
>>>
>>>
>>> On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
>>> > Hi Luca, Francesco, others
>>> >
>>> > On Wed, 19 Nov 2025 18:27:38 +0100
>>> > "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>>> >
>>> > > Hello,
>>> > >
>>> > > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
>>> > > ...
>>> > > > > I might be mistaken, but I don't think the PLL will work if
>>> > > > > unlocked...
>>> > > > > But maybe the case is that it unlocks and lock again right
>>> > > > > afterwards.
>>> > > > > > > Jo=C3=A3o, Francesco, on what hardware do you observe the
>>> > > > > > > problem? Which SoC?
>>> > > > > > > Which encoder, any previous bridges?
>>> > > > > >
>>> > > > > > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
>>> > > > > > verdin.dtsi
>>> > > > > >
>>> > > > > > There is a DPI to DSI bridge in the module, tc358778, it has
>>> > > > > > a 25MHz
>>> > > > > > reference clock.
>>> > > > > >
>>> > > > > > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
>>> > > > > > Display
>>> > > > > >
>>> > > > > > From a preliminary investigation this is a HW limitation, we
>>> > > > > > are not
>>> > > > > > able to generate a "good enough" DSI clock, see
>>> > > > > > tc358768_calc_pll() for
>>> > >
>>> > > Thanks Francesco for the feedback!
>>> > >
>>> > > I'm not sure I completely understand the issue described, but if
>>> > > the TI
>>> > > bridge requires a clock that cannot be provided by the hardware,
>>> > > then this
>>> > > actually looks like "a HW limitation" as you wrote, due to a HW
>>> > > integration
>>> > > limitation/bug/issue/whatever. In case this is confirmed, I think
>>> > > quirks
>>> > > are an appropriate tool to handle HW integration issues.
>>> > >
>>> > > > > I haven't studied the docs or done any testing, but I would
>>> > > > > think that
>>> > > > > it doesn't matter for the PLL even if the incoming DSI clock is
>>> > > > > a bit
>>> > > > > off, as long as it's continuous and stable.
>>> > > > >
>>> > > > > My first thought was that the DSI is using non-continuous
>>> > > > > clock, but at
>>> > > > > least the driver has code to drop the
>>> > > > > MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
>>> > > > >
>>> > > > > > the actual code implementation of it, I believe that the
>>> > > > > > datasheet is
>>> > > > > > not available without NDA.
>>> > > > > >
>>> > > > > > Maybe the ugly hack "works-without-pll" is the way to work?
>>> > > > > > It will
>>> > > > > > require a DT change, but this seems doable.
>>> > > > >
>>> > > > > Revert is easier than adding new hacky DT properties... At
>>> > > > > least until
>>> > > > > the problem is understood.
>>> > > > >
>>> > > > > > Please note that this is the outcome of a short investigation
>>> > > > > > done
>>> > > > > > yesterday afternoon, so maybe I am overlooking something,
>>> > > > > > unfortunately
>>> > > > > > I do not have the bandwidth to work on it more this week.
>>> > > > > >
>>> > > > > > > Which clock rates?
>>> > > > > > 71100000
>>> > > > > It would be a good test to try out with a few different
>>> > > > > clocks.
>>> > > >
>>> > > > 50 MHz works, for example.
>>> > > >
>>> > > > It seems that the issue exists when the actual display clock is
>>> > > > different
>>> > > > from the dsi clock. And this can happen for the reason I
>>> > > > explained
>>> > > > before (the DSI clock is computed starting from this 25MHz
>>> > > > reference
>>> > > > clock).
>>> > >
>>> >
>>> > If there is no way to set a correct clock, I agree with Luca a quirk
>>> > should
>>> > be the best solution.
>>> >
>>> > For instance, in the dts:
>>> > =C2=A0 ti,pll_may_unlock_quirk;
>>>
>>> I followed the discussion only loosely. But I once worked on bringing
>>> up the SN65DSI83 and from what I can remember is that there was a
>>> frequency range of the input clock where the PLL of SN65DSI83 just did
>>> not lock at all.
>>>
>>> I couldn't explain what was happening since the clock I fed was within
>>> the limits of the documentation I had.
>>>
>>> What I ultimately did was to just choose a clock that works. Given that
>>> experience I'm not sure about adding quirks on TI side.
>>>
>>> But anyway I'm not very familiar with the topic and it's a long time
>>> since I worked on it. Just wanted to point out this experience I had,
>>> maybe it helps.
>>
>> If the frequency is predictable, can we disable the error recovery if we
>> know we programmed the bridge in (one of) the affected range?
>
> This looks like the best solution in principle. However I'm not sure the
> ti-sn65dsi83 driver knows the exact clock it will receive, I suspect it i=
s
> only known to the DSI host and there is an API for the DSI device to obta=
in
                                 ^^^^^^^^
				 there isn't

> it from the DSI host.
>
> I'd be happy to be proven wrong though, and that the above idea can work.
>
> In case it doesn't we should reconsider the quirk. But as Maxime pointed
> out in another reply the quirk property in DT is not doable for backwards
> compatibility. Other options that have come to mind to use the quirk:
>
>  * quirk based on the machine: ti-sn65dsi83 driver enabled the quirk
>    if (of_machine_is_compatible("toradex,..."))
>  * opt-out quirk instead of opt-in: ti-sn65dsi83 driver enabled the quirk
>    if a DT property is absent, e.g. 'ti,pll-locking-capable' or similar t=
o
>    say "this hardware is able to provide a correct clock"
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com




--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
