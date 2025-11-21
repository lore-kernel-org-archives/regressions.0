Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99F34217C;
	Fri, 21 Nov 2025 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719059; cv=none; b=Manop0uPfqBqiV8R1zzWR41VwxgJBoDy+D8sx7qOqVFxFR7j6Bdzvr2tme/lEVSZ7dqBMIW/jojKTY81E5VF+oFkTGwUDQE15XkE5YrbcdGhkdO1ZeuYXZzka629p9jB9cu951aP4TzqK8+mkG4p7zKhOLrgqXnMrExI3cCskF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719059; c=relaxed/simple;
	bh=jMtFgTo+OtfriKf2Ni8mbT/z71+5BynkruvYCMg6v/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4KLq0xSumZ+eiveGFTQ8rfZLMV/Suuat2beQIppuz8sZfWJrXzEybsZRWJ03RcZtebg9p+Y2ykbjdPxN1B3RN5ijbf8xWGEoLurm+F1Z4v9TNl1ysuAFhgE4GSmSke1CusL7H938uwnPKT54H5SKgFb+pwlBeK2KDS0fenO33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZMbbQz3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZMbbQz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB01C4CEF1;
	Fri, 21 Nov 2025 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763719058;
	bh=jMtFgTo+OtfriKf2Ni8mbT/z71+5BynkruvYCMg6v/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZMbbQz3k+nhPrO/hrkK1lehFwYpN/GwkyZlux738j7najpSsyeDJr7/O1HCwCnfJ
	 hRUijZGjT3IO22MyM8JQ/CIhj7cnRyL7BNQgfkZPZZM49eKkaw1XIlHNoxBErTYo9r
	 pAQbzreDg+B+WX+/eO9AebA+WyAaLthwLu7kvBx8DsFO6oME0WdW87tBgO6vFNKvSS
	 wj8frXPiFfOeXuXQeJ1A6dLVgw1GHj6+VETpn1S4uUiBHKfbQH6VEYg0Cl3NsRGpTt
	 Q/YYz1gRO1HqkZ2o9tWIdLa0DbFRCI6EqdCKPH3DR3qa8/omdgoB4hfsx/cgXweGqH
	 VUPfY1WpBEWog==
Date: Fri, 21 Nov 2025 10:57:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Francesco Dolcini <francesco@dolcini.it>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <vci5up5d6n724vj6bral3xt3nzq2plc4egwld5ivl3244nsi6i@lr2uoyyb6z6w>
References: <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
 <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
 <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
 <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
 <20251119111221.GA18602@francesco-nb>
 <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
 <20251119122443.GA29208@francesco-nb>
 <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
 <20251119194023.6239d397@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gtjbpgmpwjpey7e4"
Content-Disposition: inline
In-Reply-To: <20251119194023.6239d397@bootlin.com>


--gtjbpgmpwjpey7e4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 07:40:23PM +0100, Herve Codina wrote:
> Hi Luca, Francesco, others
>=20
> On Wed, 19 Nov 2025 18:27:38 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>=20
> > Hello,
> >=20
> > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
> > ...
> > >> I might be mistaken, but I don't think the PLL will work if unlocked=
=2E..
> > >> But maybe the case is that it unlocks and lock again right afterward=
s. =20
> > >> >> Jo=E3o, Francesco, on what hardware do you observe the problem? W=
hich SoC?
> > >> >> Which encoder, any previous bridges? =20
> > >> >
> > >> > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-verdin.dt=
si
> > >> >
> > >> > There is a DPI to DSI bridge in the module, tc358778, it has a 25M=
Hz
> > >> > reference clock.
> > >> >
> > >> > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 -> Display
> > >> >
> > >> > From a preliminary investigation this is a HW limitation, we are n=
ot
> > >> > able to generate a "good enough" DSI clock, see tc358768_calc_pll(=
) for =20
> >=20
> > Thanks Francesco for the feedback!
> >=20
> > I'm not sure I completely understand the issue described, but if the TI
> > bridge requires a clock that cannot be provided by the hardware, then t=
his
> > actually looks like "a HW limitation" as you wrote, due to a HW integra=
tion
> > limitation/bug/issue/whatever. In case this is confirmed, I think quirks
> > are an appropriate tool to handle HW integration issues.
> >=20
> > >> I haven't studied the docs or done any testing, but I would think th=
at
> > >> it doesn't matter for the PLL even if the incoming DSI clock is a bit
> > >> off, as long as it's continuous and stable.
> > >>
> > >> My first thought was that the DSI is using non-continuous clock, but=
 at
> > >> least the driver has code to drop the MIPI_DSI_CLOCK_NON_CONTINUOUS =
flag.
> > >> =20
> > >> > the actual code implementation of it, I believe that the datasheet=
 is
> > >> > not available without NDA.
> > >> >
> > >> > Maybe the ugly hack "works-without-pll" is the way to work? It will
> > >> > require a DT change, but this seems doable. =20
> > >>
> > >> Revert is easier than adding new hacky DT properties... At least unt=
il
> > >> the problem is understood.
> > >> =20
> > >> > Please note that this is the outcome of a short investigation done
> > >> > yesterday afternoon, so maybe I am overlooking something, unfortun=
ately
> > >> > I do not have the bandwidth to work on it more this week.
> > >> > =20
> > >> >> Which clock rates? =20
> > >> > 71100000 =20
> > >> It would be a good test to try out with a few different clocks. =20
> > >
> > > 50 MHz works, for example.
> > >
> > > It seems that the issue exists when the actual display clock is diffe=
rent
> > > from the dsi clock. And this can happen for the reason I explained
> > > before (the DSI clock is computed starting from this 25MHz reference
> > > clock). =20
> >=20
>=20
> If there is no way to set a correct clock, I agree with Luca a quirk shou=
ld
> be the best solution.
>=20
> For instance, in the dts:
>   ti,pll_may_unlock_quirk;

That's not a solution, as it would break DT backward compatibility.

Maxime

--gtjbpgmpwjpey7e4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSA3igAKCRAnX84Zoj2+
djeOAX0YUDq8dKh1wKmXT2/gFqxtRaxAcb38fb9bDpEDrDCirpSITo2a4QPbQ0dy
bLvfLKYBfjg9KtflumaWYqCx56uUcDhCSZKLraalyBTrC0hcX2pYvuvMxNhvI7OQ
hJEBDoNF9Q==
=wSOW
-----END PGP SIGNATURE-----

--gtjbpgmpwjpey7e4--
