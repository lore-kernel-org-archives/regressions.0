Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742103002C6;
	Tue, 18 Nov 2025 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485000; cv=none; b=fNfVRNv1JjQ6BGPoSWds2YW6dHgx+ct1YXnCW+PukI1JIfNL9Hp8/MQWZGlC1NLp8tX9re4650P3w8/x2HOutEUsNiP1MNLPSb4jNdVEOatudaiR4h62WyhNcj+Z7mlEmUTdDRePUXQYQkWjbv4n9gWXovR2QV10RTXo78+XyvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485000; c=relaxed/simple;
	bh=4bYrk0fKHuPAC9DQBHqEmy6WuLAOGRDc+x8PORappSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3jo66v/Fia6QJuu3CkPLhWO2yl5QX1qK7bpCXAJ9DpSnZqKJlRBV1u6M5WD4FFIKC8ulFLAhDbfLVRhdWo8Ym0MxV2Ytbf8J+cfOyFze/wBroJEoHIXzMfbN4KawUKnUhB0er7x6fOms7MG1OARZ+HQwNKg4X4NV5UioMSepgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pe5HUy7x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pe5HUy7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F366C2BCB7;
	Tue, 18 Nov 2025 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484999;
	bh=4bYrk0fKHuPAC9DQBHqEmy6WuLAOGRDc+x8PORappSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pe5HUy7xrcmExH5rBGlW9ZkYWw1UupVX9qK0Ve/8ZrWBH1pFuvCkz1wi6iGe3TwlO
	 Zg59GfuAYPU8IWU/E3YkoSEnycVM7TnkaJSUnDLU5Xpy8FDyThJzt285P77M9PPx4J
	 zuUg4jj3lmIXYXTa2hqzpxZyc0CQYDO/zC+shVuLRdaF65tJ6DFXND96r9kL44bbnw
	 +goLIH34tLwe2iMdRjdcAcI6YlvXPSorfkjK3qDWUV3pB6vMsRZobR+6iihpLGce/u
	 2hvTJRSWRZjArGLASXAg3g8cryEslmNbCts4B0czcFOIoTEbJA5d5VeWC32gzhViw1
	 E30thvItgAtug==
Date: Tue, 18 Nov 2025 17:56:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Herve Codina <herve.codina@bootlin.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
 <20251113084950.44a09e8e@bootlin.com>
 <20251113091910.GA15538@francesco-nb>
 <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5jz2m4a6gohk4arl"
Content-Disposition: inline
In-Reply-To: <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>


--5jz2m4a6gohk4arl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
MIME-Version: 1.0

On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
> On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:
> > On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:
> >> On Mon, 10 Nov 2025 16:03:51 -0300
> >> Jo=E3o Paulo Gon=E7alves <jpaulo.silvagoncalves@gmail.com> wrote:
> >> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> >> > recovery mechanism"), our DSI display stopped working correctly. The
> >> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and w=
ith
> >> > the change, it keeps blinking on and off because the bridge is being
> >> > reset by the error recovery mechanism.
> >> >
> >> > Even before the change, it was possible to see the message below from
> >> > the driver indicating that the bridge's internal PLL was not locked
> >> > (register 0xE5, bit 0 in [1]):
> >> >
> >> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
> >> >
> >> > However, it was working. After the change, it stopped working. Maski=
ng
> >> > the PLL error makes it work again:
> >> >
> >> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm=
/bridge/ti-sn65dsi83.c
> >> > index 033c44326552..89a0a2ab45b1 100644
> >> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65d=
si83 *ctx)
> >> >          */
> >> >
> >> >         ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> >> > -       if (ret || irq_stat) {
> >> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
> >> >                 /*
> >> >                  * IRQ acknowledged is not always possible (the brid=
ge can be in
> >> >                  * a state where it doesn't answer anymore). To prev=
ent an
> >> >
> >> > Any suggestions on how to proceed here?
> >> >
> >> > #regzbot introduced: ad5c6ecef27e
> >> >
> >> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> >> >
> >>
> >> The PLL should be locked.
> >>
> >> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the st=
atus
> >> is checked at the end of the initialization sequence and the sequence =
has to
> >> be done again when the status register value is not 0x00.
> >>
> >> Even before monitoring (irq or polling method), you have an issue with=
 your PLL
> >> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" mes=
sage.
> >>
> >> I don't understand even how your panel can be correctly driven with th=
e bridge
> >> PLL unlock.
> >
> > We'll try to figure out the reason and see what's the best path forward.
> >
> > Whatever was the reason it was working before, and it should stay
> > working
>=20
> I agree with Herv=E9 that using the chip with an unlocked PLL looks dange=
rous
> and totally out of spec. So I encourage you to investigate what is going =
on
> in the hardware looking for the root cause, checking whether the PLL is
> really unlocked and how to get it working properly.
>=20
> The driver should be definitely be written focusing on the nominal case a=
nd
> handle out-of-spec cases as an exception, not the other way around.
>=20
> I also agree your hardware should not stop working when upgrading to a new
> kernel, so this investigation would ideally nail down tha root cause and
> point to a solution in a very short time.
>=20
> Herv=E9 has matured quite some experience on SN65DSI84 error management,
> leading to his error recovery patch, and I also have a board with that ch=
ip
> on my desk. So we may be helpful in discussion, as well as reviewing and
> testing patches.

I'd say we should do it the other way around. If that patch breaks
systems that were working fine so far without a clear reason, we should
revert the offending commit, and *then* work towards a solution to
support error recovery that doesn't break that system.

Maxime

--5jz2m4a6gohk4arl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRylRAAKCRAnX84Zoj2+
dthxAYC3jD5RMElxc8zdq29XKGHYYzHZFWLv7ao0jtg2F00aRi/bZsUFvcSx6zQq
7MdBAHMBf1GKJiUqpwj2VHHaI13Bg2sfODbKRfRqnklECkP77verQfRlGTSAgr89
tnEmo2/mag==
=kE9c
-----END PGP SIGNATURE-----

--5jz2m4a6gohk4arl--
