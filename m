Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E1274FFD
	for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003670; cv=none; b=uW4m4hBiIGfAipyPVMBnVxrQSUWaSxYR3HCNPEbIMh6dE46D1Skk/yTT0TFUohygOC1PUD2H1Sx9mfnrtSuqrZBAwgq9koiVt/DvNLsAMOYed+zHhWwOqRch08DxBVqPK4Y5VvT74I6JyNourvjES1ilm3Oq5ma7j8Q/QQu2WCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003670; c=relaxed/simple;
	bh=n0Y0iAEe+wI0We+mem+OHGRPDFuds7En7zISq7Sa0sE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=evoN4VNjwnE6HKZBqrusOoVy9cSqOJhgCB3O4CXSltvDwTu/UyEpeNRa4LfgfpcG6b2MCjjQppxzkwLWALDLA8fZCEdQz6KwKNOUp8wTRwr21C0nkfThteKMB3Hzt9+zUSdtfh89aproCev270lvoZ79PLN1vVa2CWOMNkYUHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M2s5VLNZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M2s5VLNZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51ACAC139B2;
	Mon, 24 Nov 2025 17:00:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE3BD606FC;
	Mon, 24 Nov 2025 17:01:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 502D410371A65;
	Mon, 24 Nov 2025 18:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764003663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kCTy3rNf9WeORBktz4/UGAUknpiYBvo2py/SgcQ7D6g=;
	b=M2s5VLNZ427/TwAskwVQ+VdBr5yxg71CXnuFxInngcxweZStgde3uDLhCQ6B1YifZ/AL/K
	wrCpErzXCuY49BQE1WdRao62svsuUtw5+dJMJP42sj4Tjc+bg9fBv+Kon3gnJV7e5sAncx
	Jrl6sqpZjZ0Axqpwa5SsBfrl+SbVUEdz1J599zZ0a3TJgRJ49wHbEevL61F0Tvd+rZ7tVc
	Nj3nlF9mps+3hwnDYALY2W66e2nP/l9LSyINSEgpZWMzFrQ3/GC5xxBdYBfKcG/6ajtrkV
	ukPZweiWlJUlO+I5BnBQdP09YSI/UGA5ab5RL5DX0ZDl2RlIc9y1CPjXw2cegQ==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 18:00:57 +0100
Message-Id: <DEH33WWQKCOS.1MPPXB090YH3H@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
Cc: "Philippe Schenker" <philippe.schenker@impulsing.ch>, "Herve Codina"
 <herve.codina@bootlin.com>, "Francesco Dolcini" <francesco@dolcini.it>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
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
 <thomas.petazzoni@bootlin.com>, "Emanuele Ghidoli"
 <ghidoliemanuele@gmail.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n> <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com> <20251119111221.GA18602@francesco-nb> <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com> <20251119122443.GA29208@francesco-nb> <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com> <20251119194023.6239d397@bootlin.com> <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch> <ko2ghflyddv2igj43wkwsaaoneg2jwpdxldlfsix4cllzspdbj@w4fhabuwm5wy> <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com> <jakr7ccumjo5jqzqlnbxur34itbspip25iicx5oq2bm3hoj23j@w3qllbfu4xnm>
In-Reply-To: <jakr7ccumjo5jqzqlnbxur34itbspip25iicx5oq2bm3hoj23j@w3qllbfu4xnm>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 24, 2025 at 4:55 PM CET, Maxime Ripard wrote:
> On Mon, Nov 24, 2025 at 01:12:55PM +0100, Luca Ceresoli wrote:
>> Hello Jo=C3=A3o, Francesco, Maxime, Herv=C3=A9,
>>
>> On Fri Nov 21, 2025 at 10:58 AM CET, Maxime Ripard wrote:
>> > On Thu, Nov 20, 2025 at 09:50:27AM +0000, Philippe Schenker wrote:
>> >>
>> >>
>> >> On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
>> >> > Hi Luca, Francesco, others
>> >> >
>> >> > On Wed, 19 Nov 2025 18:27:38 +0100
>> >> > "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>> >> >
>> >> > > Hello,
>> >> > >
>> >> > > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
>> >> > > ...
>> >> > > > > I might be mistaken, but I don't think the PLL will work if
>> >> > > > > unlocked...
>> >> > > > > But maybe the case is that it unlocks and lock again right
>> >> > > > > afterwards.
>> >> > > > > > > Jo=C3=A3o, Francesco, on what hardware do you observe the
>> >> > > > > > > problem? Which SoC?
>> >> > > > > > > Which encoder, any previous bridges?
>> >> > > > > >
>> >> > > > > > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
>> >> > > > > > verdin.dtsi
>> >> > > > > >
>> >> > > > > > There is a DPI to DSI bridge in the module, tc358778, it ha=
s
>> >> > > > > > a 25MHz
>> >> > > > > > reference clock.
>> >> > > > > >
>> >> > > > > > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
>> >> > > > > > Display
>> >> > > > > >
>> >> > > > > > From a preliminary investigation this is a HW limitation, w=
e
>> >> > > > > > are not
>> >> > > > > > able to generate a "good enough" DSI clock, see
>> >> > > > > > tc358768_calc_pll() for
>> >> > >
>> >> > > Thanks Francesco for the feedback!
>> >> > >
>> >> > > I'm not sure I completely understand the issue described, but if
>> >> > > the TI
>> >> > > bridge requires a clock that cannot be provided by the hardware,
>> >> > > then this
>> >> > > actually looks like "a HW limitation" as you wrote, due to a HW
>> >> > > integration
>> >> > > limitation/bug/issue/whatever. In case this is confirmed, I think
>> >> > > quirks
>> >> > > are an appropriate tool to handle HW integration issues.
>> >> > >
>> >> > > > > I haven't studied the docs or done any testing, but I would
>> >> > > > > think that
>> >> > > > > it doesn't matter for the PLL even if the incoming DSI clock =
is
>> >> > > > > a bit
>> >> > > > > off, as long as it's continuous and stable.
>> >> > > > >
>> >> > > > > My first thought was that the DSI is using non-continuous
>> >> > > > > clock, but at
>> >> > > > > least the driver has code to drop the
>> >> > > > > MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
>> >> > > > >
>> >> > > > > > the actual code implementation of it, I believe that the
>> >> > > > > > datasheet is
>> >> > > > > > not available without NDA.
>> >> > > > > >
>> >> > > > > > Maybe the ugly hack "works-without-pll" is the way to work?
>> >> > > > > > It will
>> >> > > > > > require a DT change, but this seems doable.
>> >> > > > >
>> >> > > > > Revert is easier than adding new hacky DT properties... At
>> >> > > > > least until
>> >> > > > > the problem is understood.
>> >> > > > >
>> >> > > > > > Please note that this is the outcome of a short investigati=
on
>> >> > > > > > done
>> >> > > > > > yesterday afternoon, so maybe I am overlooking something,
>> >> > > > > > unfortunately
>> >> > > > > > I do not have the bandwidth to work on it more this week.
>> >> > > > > >
>> >> > > > > > > Which clock rates?
>> >> > > > > > 71100000
>> >> > > > > It would be a good test to try out with a few different
>> >> > > > > clocks.
>> >> > > >
>> >> > > > 50 MHz works, for example.
>> >> > > >
>> >> > > > It seems that the issue exists when the actual display clock is
>> >> > > > different
>> >> > > > from the dsi clock. And this can happen for the reason I
>> >> > > > explained
>> >> > > > before (the DSI clock is computed starting from this 25MHz
>> >> > > > reference
>> >> > > > clock).
>> >> > >
>> >> >
>> >> > If there is no way to set a correct clock, I agree with Luca a quir=
k
>> >> > should
>> >> > be the best solution.
>> >> >
>> >> > For instance, in the dts:
>> >> > =C2=A0 ti,pll_may_unlock_quirk;
>> >>
>> >> I followed the discussion only loosely. But I once worked on bringing
>> >> up the SN65DSI83 and from what I can remember is that there was a
>> >> frequency range of the input clock where the PLL of SN65DSI83 just di=
d
>> >> not lock at all.
>> >>
>> >> I couldn't explain what was happening since the clock I fed was withi=
n
>> >> the limits of the documentation I had.
>> >>
>> >> What I ultimately did was to just choose a clock that works. Given th=
at
>> >> experience I'm not sure about adding quirks on TI side.
>> >>
>> >> But anyway I'm not very familiar with the topic and it's a long time
>> >> since I worked on it. Just wanted to point out this experience I had,
>> >> maybe it helps.
>> >
>> > If the frequency is predictable, can we disable the error recovery if =
we
>> > know we programmed the bridge in (one of) the affected range?
>>
>> This looks like the best solution in principle. However I'm not sure the
>> ti-sn65dsi83 driver knows the exact clock it will receive, I suspect it =
is
>> only known to the DSI host and there is an API for the DSI device to obt=
ain
>> it from the DSI host.
>>
>> I'd be happy to be proven wrong though, and that the above idea can work=
.
>>
>> In case it doesn't we should reconsider the quirk. But as Maxime pointed
>> out in another reply the quirk property in DT is not doable for backward=
s
>> compatibility. Other options that have come to mind to use the quirk:
>>
>>  * quirk based on the machine: ti-sn65dsi83 driver enabled the quirk
>>    if (of_machine_is_compatible("toradex,..."))
>
> There's nothing in that machine that is very specific if it's driven by
> the relationship between the clock the DSI controller can match and the
> panel connected to it. So it won't just affect a single board.
>
>>  * opt-out quirk instead of opt-in: ti-sn65dsi83 driver enabled the quir=
k
>>    if a DT property is absent, e.g. 'ti,pll-locking-capable' or similar =
to
>>    say "this hardware is able to provide a correct clock"
>
> And similarly, if this depends on the resolution, and the rate the DSI
> driver is able to provide, it's not something the DT can express
> properly. Some panels can support multiple resolutions for example. What
> happens if one can lock and the other cannot?
>
> Either way, it's not something that will be solved overnight. Please
> send a revert.

I think the best thing (and what I was kind of expecting) is that
Francesco/Emanuele/Jo=C3=A3o send a revert patch adding to the commit messa=
ge
all the relevant info they are collecting. They definitely understand the
issue much better than others right now.

If that's not OK, I can do it.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
