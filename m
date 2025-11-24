Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441C2D59F7;
	Mon, 24 Nov 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999737; cv=none; b=k2q/oDtB6VfgL8SbIXMT6/bYPOdKFaoPbqa74VS5JNrqohzfUqiXlFzOLvWe1/sgxS5IqsiRTXoSy1ewMg0tV/y45flBCPu1fbWvNtV0sSMh9p8/lDpAM1urtdWKD+H2S2Qw/9exKm9GuYChdzuO1oYVdxj81QoiPgGWgOBQKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999737; c=relaxed/simple;
	bh=N4+dEoAWt7icQ5w053ydUw+fXfUb0RhsGtd0q4CnYVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcuPDP3CYJTxvOrOxiMpio68UoRQgn62rFLGpD6Hg6N68zyS8AgRHOoHK+HXMgpKHHs31NxvM+rU9S6dE4Lu2jXsRscknBxz2PTEXCudpbgsYK9Hv/C8fySDiSDjHXWzAbBjxPauyOjTs+zFQX+jk35/5tWlTWoWYrr/Lg1RxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSEN/goZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSEN/goZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8575EC116C6;
	Mon, 24 Nov 2025 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763999736;
	bh=N4+dEoAWt7icQ5w053ydUw+fXfUb0RhsGtd0q4CnYVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSEN/goZOlF0/EqN/EUytJKskW3jCnYdtZF+hrpBzcRwNyrPULVKaz4E1hpJpPPTl
	 T8l/34trDfOu1I9gg5Sk+bmyknCYDbaX+/vXXYJXdfLKAKcODPOzh2lU1T9ItfMjRe
	 UuWfGVeBsdEc4JILL+HJDFwNtYzqiUXedhuHl4mUkov/SNmimtyfTon/gDPxIjjcPy
	 lErKtrF2QRqls8UuYfQe57fDu2aq7oUB7K2XGjJZzxS8lA9m8h9C8b4Ine9Vne/Guk
	 c/0VO9TuSwrH1TVEc6qXJ9l52sOjxDX13Wl3lKukgyVY2lek3cfGkkqeGhj5n5CKPd
	 VHH31qJQ1Xfaw==
Date: Mon, 24 Nov 2025 16:55:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>, 
	Herve Codina <herve.codina@bootlin.com>, Francesco Dolcini <francesco@dolcini.it>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <jakr7ccumjo5jqzqlnbxur34itbspip25iicx5oq2bm3hoj23j@w3qllbfu4xnm>
References: <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
 <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
 <20251119111221.GA18602@francesco-nb>
 <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
 <20251119122443.GA29208@francesco-nb>
 <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
 <20251119194023.6239d397@bootlin.com>
 <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch>
 <ko2ghflyddv2igj43wkwsaaoneg2jwpdxldlfsix4cllzspdbj@w4fhabuwm5wy>
 <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="edmgs2wbcur6xdz7"
Content-Disposition: inline
In-Reply-To: <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com>


--edmgs2wbcur6xdz7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
MIME-Version: 1.0

On Mon, Nov 24, 2025 at 01:12:55PM +0100, Luca Ceresoli wrote:
> Hello Jo=E3o, Francesco, Maxime, Herv=E9,
>=20
> On Fri Nov 21, 2025 at 10:58 AM CET, Maxime Ripard wrote:
> > On Thu, Nov 20, 2025 at 09:50:27AM +0000, Philippe Schenker wrote:
> >>
> >>
> >> On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
> >> > Hi Luca, Francesco, others
> >> >
> >> > On Wed, 19 Nov 2025 18:27:38 +0100
> >> > "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >> >
> >> > > Hello,
> >> > >
> >> > > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
> >> > > ...
> >> > > > > I might be mistaken, but I don't think the PLL will work if
> >> > > > > unlocked...
> >> > > > > But maybe the case is that it unlocks and lock again right
> >> > > > > afterwards.
> >> > > > > > > Jo=E3o, Francesco, on what hardware do you observe the
> >> > > > > > > problem? Which SoC?
> >> > > > > > > Which encoder, any previous bridges?
> >> > > > > >
> >> > > > > > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
> >> > > > > > verdin.dtsi
> >> > > > > >
> >> > > > > > There is a DPI to DSI bridge in the module, tc358778, it has
> >> > > > > > a 25MHz
> >> > > > > > reference clock.
> >> > > > > >
> >> > > > > > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
> >> > > > > > Display
> >> > > > > >
> >> > > > > > From a preliminary investigation this is a HW limitation, we
> >> > > > > > are not
> >> > > > > > able to generate a "good enough" DSI clock, see
> >> > > > > > tc358768_calc_pll() for
> >> > >
> >> > > Thanks Francesco for the feedback!
> >> > >
> >> > > I'm not sure I completely understand the issue described, but if
> >> > > the TI
> >> > > bridge requires a clock that cannot be provided by the hardware,
> >> > > then this
> >> > > actually looks like "a HW limitation" as you wrote, due to a HW
> >> > > integration
> >> > > limitation/bug/issue/whatever. In case this is confirmed, I think
> >> > > quirks
> >> > > are an appropriate tool to handle HW integration issues.
> >> > >
> >> > > > > I haven't studied the docs or done any testing, but I would
> >> > > > > think that
> >> > > > > it doesn't matter for the PLL even if the incoming DSI clock is
> >> > > > > a bit
> >> > > > > off, as long as it's continuous and stable.
> >> > > > >
> >> > > > > My first thought was that the DSI is using non-continuous
> >> > > > > clock, but at
> >> > > > > least the driver has code to drop the
> >> > > > > MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
> >> > > > >
> >> > > > > > the actual code implementation of it, I believe that the
> >> > > > > > datasheet is
> >> > > > > > not available without NDA.
> >> > > > > >
> >> > > > > > Maybe the ugly hack "works-without-pll" is the way to work?
> >> > > > > > It will
> >> > > > > > require a DT change, but this seems doable.
> >> > > > >
> >> > > > > Revert is easier than adding new hacky DT properties... At
> >> > > > > least until
> >> > > > > the problem is understood.
> >> > > > >
> >> > > > > > Please note that this is the outcome of a short investigation
> >> > > > > > done
> >> > > > > > yesterday afternoon, so maybe I am overlooking something,
> >> > > > > > unfortunately
> >> > > > > > I do not have the bandwidth to work on it more this week.
> >> > > > > >
> >> > > > > > > Which clock rates?
> >> > > > > > 71100000
> >> > > > > It would be a good test to try out with a few different
> >> > > > > clocks.
> >> > > >
> >> > > > 50 MHz works, for example.
> >> > > >
> >> > > > It seems that the issue exists when the actual display clock is
> >> > > > different
> >> > > > from the dsi clock. And this can happen for the reason I
> >> > > > explained
> >> > > > before (the DSI clock is computed starting from this 25MHz
> >> > > > reference
> >> > > > clock).
> >> > >
> >> >
> >> > If there is no way to set a correct clock, I agree with Luca a quirk
> >> > should
> >> > be the best solution.
> >> >
> >> > For instance, in the dts:
> >> > =A0 ti,pll_may_unlock_quirk;
> >>
> >> I followed the discussion only loosely. But I once worked on bringing
> >> up the SN65DSI83 and from what I can remember is that there was a
> >> frequency range of the input clock where the PLL of SN65DSI83 just did
> >> not lock at all.
> >>
> >> I couldn't explain what was happening since the clock I fed was within
> >> the limits of the documentation I had.
> >>
> >> What I ultimately did was to just choose a clock that works. Given that
> >> experience I'm not sure about adding quirks on TI side.
> >>
> >> But anyway I'm not very familiar with the topic and it's a long time
> >> since I worked on it. Just wanted to point out this experience I had,
> >> maybe it helps.
> >
> > If the frequency is predictable, can we disable the error recovery if we
> > know we programmed the bridge in (one of) the affected range?
>=20
> This looks like the best solution in principle. However I'm not sure the
> ti-sn65dsi83 driver knows the exact clock it will receive, I suspect it is
> only known to the DSI host and there is an API for the DSI device to obta=
in
> it from the DSI host.
>=20
> I'd be happy to be proven wrong though, and that the above idea can work.
>=20
> In case it doesn't we should reconsider the quirk. But as Maxime pointed
> out in another reply the quirk property in DT is not doable for backwards
> compatibility. Other options that have come to mind to use the quirk:
>=20
>  * quirk based on the machine: ti-sn65dsi83 driver enabled the quirk
>    if (of_machine_is_compatible("toradex,..."))

There's nothing in that machine that is very specific if it's driven by
the relationship between the clock the DSI controller can match and the
panel connected to it. So it won't just affect a single board.

>  * opt-out quirk instead of opt-in: ti-sn65dsi83 driver enabled the quirk
>    if a DT property is absent, e.g. 'ti,pll-locking-capable' or similar to
>    say "this hardware is able to provide a correct clock"

And similarly, if this depends on the resolution, and the rate the DSI
driver is able to provide, it's not something the DT can express
properly. Some panels can support multiple resolutions for example. What
happens if one can lock and the other cannot?

Either way, it's not something that will be solved overnight. Please
send a revert.

Maxime

--edmgs2wbcur6xdz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSR/6wAKCRAnX84Zoj2+
duy5AX9DszLh9vuQmr3uMORehPBoEHZyAkCaX8QP5OtjJmrqWcfgK5wRwbpT2Hx7
oZB3YJgBgO2/oXfW5BMcWvYuyrzSvDuFTECYrODLKt1YSo6F9HojV/IY1Ea2OeKL
Qhy952uHBA==
=X1+w
-----END PGP SIGNATURE-----

--edmgs2wbcur6xdz7--
