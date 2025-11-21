Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C084341ADF;
	Fri, 21 Nov 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719127; cv=none; b=vEwfKnGU8P85HFvu2wdVpAE6swUrDuB5Qsnoj9ZoGw7x/FMhPMNbGTh7f426SI8Iugw34A5Ds+u0YhVPtecASUgVvb+iE00uYl/zXnu/hQJ4qGZFJLgyDkollw38OkhMACGgWBL6gCdAjbiNGd3X+ryoLgLNJxWN1c9NfO7KLSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719127; c=relaxed/simple;
	bh=yNxL0vCWDrgF1vx5yfsvWLdJzNFIrr6uyvLsVMjGX5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrrslHoRsadOlgr3PLmFxqOg8p5i3NV1CvPwNEBSHYV+YcETJNHpEzYKFCxO4yGAFt+QQjny//sjw3gvao+jhBVKZaTf386E9aMwekNzdMCBfxpCex5UsUxoccgEP73wipXFOu/U7hZSzeMxY/B5JVNPzSTFZQkVm1ghW9L3Dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nl+IxW1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nl+IxW1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FF8C4CEF1;
	Fri, 21 Nov 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763719126;
	bh=yNxL0vCWDrgF1vx5yfsvWLdJzNFIrr6uyvLsVMjGX5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl+IxW1oE8U4ENcZTweJF2ffsVicwdyTSUBeqiqLuSIiCvuYh10P/LWapPvtH2WU/
	 6M8RsUYarVeG3WMRHfEjI0OyG5S4Hr58NQL6UBPTf7h44aLCs1RNi9i8tHE3aIbE5P
	 rhCunvallYvYTWEG3t+IvYBsKfa2umHNStTtti1pRT2Q+oXIlO3nXC2qOR8bCvMSmP
	 ACKnzoId4WjikjN5cTPDHLC+Sd0KY+tk19B99wiI7tpvDRrKXT6yQrYe53rbFf3buZ
	 1+AomtNrHfJuVsg3I83D50MBoXcJTnv0o+Z53pPoQMFvu2YbWd5M9sac8nrBkaIHzh
	 XIoJoa2QpJONg==
Date: Fri, 21 Nov 2025 10:58:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Francesco Dolcini <francesco@dolcini.it>, 
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
Message-ID: <ko2ghflyddv2igj43wkwsaaoneg2jwpdxldlfsix4cllzspdbj@w4fhabuwm5wy>
References: <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
 <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
 <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
 <20251119111221.GA18602@francesco-nb>
 <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
 <20251119122443.GA29208@francesco-nb>
 <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
 <20251119194023.6239d397@bootlin.com>
 <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="d5qf3kc4ayyj44zp"
Content-Disposition: inline
In-Reply-To: <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch>


--d5qf3kc4ayyj44zp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
MIME-Version: 1.0

On Thu, Nov 20, 2025 at 09:50:27AM +0000, Philippe Schenker wrote:
>=20
>=20
> On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
> > Hi Luca, Francesco, others
> >=20
> > On Wed, 19 Nov 2025 18:27:38 +0100
> > "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >=20
> > > Hello,
> > >=20
> > > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
> > > ...
> > > > > I might be mistaken, but I don't think the PLL will work if
> > > > > unlocked...
> > > > > But maybe the case is that it unlocks and lock again right
> > > > > afterwards.=A0=20
> > > > > > > Jo=E3o, Francesco, on what hardware do you observe the
> > > > > > > problem? Which SoC?
> > > > > > > Which encoder, any previous bridges?=A0=20
> > > > > >=20
> > > > > > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
> > > > > > verdin.dtsi
> > > > > >=20
> > > > > > There is a DPI to DSI bridge in the module, tc358778, it has
> > > > > > a 25MHz
> > > > > > reference clock.
> > > > > >=20
> > > > > > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
> > > > > > Display
> > > > > >=20
> > > > > > From a preliminary investigation this is a HW limitation, we
> > > > > > are not
> > > > > > able to generate a "good enough" DSI clock, see
> > > > > > tc358768_calc_pll() for=A0=20
> > >=20
> > > Thanks Francesco for the feedback!
> > >=20
> > > I'm not sure I completely understand the issue described, but if
> > > the TI
> > > bridge requires a clock that cannot be provided by the hardware,
> > > then this
> > > actually looks like "a HW limitation" as you wrote, due to a HW
> > > integration
> > > limitation/bug/issue/whatever. In case this is confirmed, I think
> > > quirks
> > > are an appropriate tool to handle HW integration issues.
> > >=20
> > > > > I haven't studied the docs or done any testing, but I would
> > > > > think that
> > > > > it doesn't matter for the PLL even if the incoming DSI clock is
> > > > > a bit
> > > > > off, as long as it's continuous and stable.
> > > > >=20
> > > > > My first thought was that the DSI is using non-continuous
> > > > > clock, but at
> > > > > least the driver has code to drop the
> > > > > MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
> > > > > =A0
> > > > > > the actual code implementation of it, I believe that the
> > > > > > datasheet is
> > > > > > not available without NDA.
> > > > > >=20
> > > > > > Maybe the ugly hack "works-without-pll" is the way to work?
> > > > > > It will
> > > > > > require a DT change, but this seems doable.=A0=20
> > > > >=20
> > > > > Revert is easier than adding new hacky DT properties... At
> > > > > least until
> > > > > the problem is understood.
> > > > > =A0
> > > > > > Please note that this is the outcome of a short investigation
> > > > > > done
> > > > > > yesterday afternoon, so maybe I am overlooking something,
> > > > > > unfortunately
> > > > > > I do not have the bandwidth to work on it more this week.
> > > > > > =A0
> > > > > > > Which clock rates?=A0=20
> > > > > > 71100000=A0=20
> > > > > It would be a good test to try out with a few different
> > > > > clocks.=A0=20
> > > >=20
> > > > 50 MHz works, for example.
> > > >=20
> > > > It seems that the issue exists when the actual display clock is
> > > > different
> > > > from the dsi clock. And this can happen for the reason I
> > > > explained
> > > > before (the DSI clock is computed starting from this 25MHz
> > > > reference
> > > > clock).=A0=20
> > >=20
> >=20
> > If there is no way to set a correct clock, I agree with Luca a quirk
> > should
> > be the best solution.
> >=20
> > For instance, in the dts:
> > =A0 ti,pll_may_unlock_quirk;
>=20
> I followed the discussion only loosely. But I once worked on bringing
> up the SN65DSI83 and from what I can remember is that there was a
> frequency range of the input clock where the PLL of SN65DSI83 just did
> not lock at all.
>=20
> I couldn't explain what was happening since the clock I fed was within
> the limits of the documentation I had.
>=20
> What I ultimately did was to just choose a clock that works. Given that
> experience I'm not sure about adding quirks on TI side.
>=20
> But anyway I'm not very familiar with the topic and it's a long time
> since I worked on it. Just wanted to point out this experience I had,
> maybe it helps.

If the frequency is predictable, can we disable the error recovery if we
know we programmed the bridge in (one of) the affected range?

Maxime

--d5qf3kc4ayyj44zp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSA30wAKCRAnX84Zoj2+
dpDOAX94l5pWCObA31Ctxssi1QzrE7WktR2Vv5kquSj0n7BpOkc8ZOm8zXIKkPyk
KPIhZ3YBgOQj3/9emlt2Q40VcSygHCKQCdfNi6VhD3c1OQb7f6NikRatL2z/kQ0+
Eu483bwVQQ==
=qCR+
-----END PGP SIGNATURE-----

--d5qf3kc4ayyj44zp--
