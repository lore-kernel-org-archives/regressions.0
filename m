Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D227A93C;
	Wed, 19 Nov 2025 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541616; cv=none; b=OR9Dl1CU/1s3+DdoavEUY2gPIX3xgUIsvVB1p88ML1CShMdmULneToHHLh7rJX4Y5Qfj3Odvs25122gIHROkzvDrWI99XmEwyQauKED8mqeMDG8IYXQUADJQ8lKAfroxIftvbzh9NS+ryFlrwtVL/fOb23kxzA5pSfegc3AvksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541616; c=relaxed/simple;
	bh=Sd8Jjly/d6UqxBbCor2GN3sPodijqt4VgG+HC4byw0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmJ2Jk30TgjLq7l6SzeecUW4MzGP+cjseZHPTbtxB1Tx1sWiCMTf9ZWB0jei7p9wjUWEL/dErtaefeR29GkLzi+P6Iwlplhp4CKt/BGuk+NNz5wwgO4GSrPWL7/27q+98VUFR41w8ovlXvKiCTaUvJbCzZY1CnGXqTnROU5z2DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKUK1snt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKUK1snt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8118CC4CEF5;
	Wed, 19 Nov 2025 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763541615;
	bh=Sd8Jjly/d6UqxBbCor2GN3sPodijqt4VgG+HC4byw0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKUK1sntb/7yhpzB6erpq31C+zZQq3I43MzwxE6STuqqof5W8Bjam/xRWNezTau5V
	 XEMqosoidnBVrHBaZ4XPaFp2u/+dUZKJNEX3aWKHnQ12fp8t7Bio28VvShZJsnQLid
	 YsOHDVEHw9frztab96oA9uyMxddbFwVmqwSkpuTaDwYArhU0jyjhf/3Bo5d4CDGC7q
	 9R/tVhu+2h8WyRLivdpHyu5lZh2JQtrx21AZXPbV8x+9sT8DnOJ+yp1iNU2zb6CpMi
	 Gxk8al9Kur6TLBt6+x5PLc77JQxFn4esfwbmH7B8TJgwKdMuiejSqq3x1BwSw86sLZ
	 +DmymY6iFb+sw==
Date: Wed, 19 Nov 2025 09:40:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Francesco Dolcini <francesco@dolcini.it>, 
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
Message-ID: <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
 <20251113084950.44a09e8e@bootlin.com>
 <20251113091910.GA15538@francesco-nb>
 <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
 <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ect62by5g34finla"
Content-Disposition: inline
In-Reply-To: <20251119085127.6e3e429e@bootlin.com>


--ect62by5g34finla
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 08:51:27AM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Tue, 18 Nov 2025 17:56:36 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
> > > On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote: =20
> > > > On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote: =20
> > > >> On Mon, 10 Nov 2025 16:03:51 -0300
> > > >> Jo=E3o Paulo Gon=E7alves <jpaulo.silvagoncalves@gmail.com> wrote: =
=20
> > > >> > After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> > > >> > recovery mechanism"), our DSI display stopped working correctly.=
 The
> > > >> > display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, a=
nd with
> > > >> > the change, it keeps blinking on and off because the bridge is b=
eing
> > > >> > reset by the error recovery mechanism.
> > > >> >
> > > >> > Even before the change, it was possible to see the message below=
 from
> > > >> > the driver indicating that the bridge's internal PLL was not loc=
ked
> > > >> > (register 0xE5, bit 0 in [1]):
> > > >> >
> > > >> > [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
> > > >> >
> > > >> > However, it was working. After the change, it stopped working. M=
asking
> > > >> > the PLL error makes it work again:
> > > >> >
> > > >> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu=
/drm/bridge/ti-sn65dsi83.c
> > > >> > index 033c44326552..89a0a2ab45b1 100644
> > > >> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > >> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > >> > @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct s=
n65dsi83 *ctx)
> > > >> >          */
> > > >> >
> > > >> >         ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat=
);
> > > >> > -       if (ret || irq_stat) {
> > > >> > +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
> > > >> >                 /*
> > > >> >                  * IRQ acknowledged is not always possible (the =
bridge can be in
> > > >> >                  * a state where it doesn't answer anymore). To =
prevent an
> > > >> >
> > > >> > Any suggestions on how to proceed here?
> > > >> >
> > > >> > #regzbot introduced: ad5c6ecef27e
> > > >> >
> > > >> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> > > >> > =20
> > > >>
> > > >> The PLL should be locked.
> > > >>
> > > >> Also in the datasheet, in 'Table 7-2. Initialization Sequence', th=
e status
> > > >> is checked at the end of the initialization sequence and the seque=
nce has to
> > > >> be done again when the status register value is not 0x00.
> > > >>
> > > >> Even before monitoring (irq or polling method), you have an issue =
with your PLL
> > > >> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01"=
 message.
> > > >>
> > > >> I don't understand even how your panel can be correctly driven wit=
h the bridge
> > > >> PLL unlock. =20
> > > >
> > > > We'll try to figure out the reason and see what's the best path for=
ward.
> > > >
> > > > Whatever was the reason it was working before, and it should stay
> > > > working =20
> > >=20
> > > I agree with Herv=E9 that using the chip with an unlocked PLL looks d=
angerous
> > > and totally out of spec. So I encourage you to investigate what is go=
ing on
> > > in the hardware looking for the root cause, checking whether the PLL =
is
> > > really unlocked and how to get it working properly.
> > >=20
> > > The driver should be definitely be written focusing on the nominal ca=
se and
> > > handle out-of-spec cases as an exception, not the other way around.
> > >=20
> > > I also agree your hardware should not stop working when upgrading to =
a new
> > > kernel, so this investigation would ideally nail down tha root cause =
and
> > > point to a solution in a very short time.
> > >=20
> > > Herv=E9 has matured quite some experience on SN65DSI84 error manageme=
nt,
> > > leading to his error recovery patch, and I also have a board with tha=
t chip
> > > on my desk. So we may be helpful in discussion, as well as reviewing =
and
> > > testing patches. =20
> >=20
> > I'd say we should do it the other way around. If that patch breaks
> > systems that were working fine so far without a clear reason, we should
> > revert the offending commit, and *then* work towards a solution to
> > support error recovery that doesn't break that system.
> >=20
>=20
> I have the feeling that the broken system has an issue from the beginning.
> Why its PLL has been unlocked ?
>=20
> I would like to understand what happens but, of course, I don't have the
> hardware to investigate.
>=20
> Could the issue been on a component before the SN65DSI83 bridge?
> I mean the component in charge of generating the DSI clock can be a culpr=
it.

I understand what you're saying, but it's not the right way to think about =
it.

Let's change perspective.

Your work laptop just got a kernel upgrade, and its display doesn't work
anymore. Would you be happy with the answer "it was broken all along, we
might be able to help you fix it, maybe not, who knows when we'll have a
fix"?

It's frustrating, you might not even be able to debug it in the first
place, and most importantly, broken or not, it used to work just fine.

If it used to work for years, how can you possibly argue that it was
broken all along?

Maxime

--ect62by5g34finla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2CZgAKCRAnX84Zoj2+
djviAYCSTEtOOI1zpb2UiYR1Hde5nbhZRSMEy6QAYVRcoBEq7xRg2BvEWEeZrUfn
mxO5dxkBfR2fjekadC06TDY5ARtH4GYFXTqrHhdsatvcxz0P+l10gfQdXXbY7MYk
JRBlbgwA3g==
=B8eM
-----END PGP SIGNATURE-----

--ect62by5g34finla--
