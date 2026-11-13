Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555426;
	b=o1G/GZ+qqECOCYUTIBTng88m2klozKi1x1sFBfSc6IJfhlFOuedo0WFC4Jx57IT3BS8Q
	 LJ8PzzDtxSlxT5Nseq71UZSfhy26zlgpKRtx80zgZx6yEgmuMaUVQBxAZAtmNvsL3CkWf
	 JYwTSemkI3kbimQozhhKNzsejSziW063UeEuEOG9IYgNLhBUcpQpbGusDhHWL//9Vaqd/
	 oCFE60u2Ly8gHo6ekpb/qNjdh4e1n6hVQ/IeL8tU+t9AW3PFk3U2hrzhih2iHZi+lpYZX
	 JA3Pc4nL9V277WgMDa0Ldm0WIzGTgj6DuW60s7t3na+L0FmExGSQgjsxQgDRSUbeKoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555426;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0wAF9gvvBWx1jBLOo+W6S6m0Glsi4Cju2u7ogWxYQkc=;
	b=aie+EWcOaom32N2Q8iJ04CESsgcXkemgXlHjrULB8rpE2nC15wmgITmr8FxQadmZ9ptw
	 HNmYerRRHV+SutPQayB3tZOEwzEKA2VJl0JfU70PLnz1k3annsWJynyjFTpTShhTZbD99
	 CwSmZ2Uo0y7HHLLXT6VVwZv80yzQKZYqJa011n+jLZs/hoDhZKdR5WTAkYzDhtZVodCN8
	 4Th/RU9W3MFFbWFHXW5J223S4UFaIowEZTIYFT9Z+OGLZIIq3GJN6c0rgCep1YweUpPJ2
	 WRNFpX+GStfL0DnJsSddUMVMy7dU6CluTwF8zf7aByag3WkvBNNwruValSU66An2usw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="uO/ZtZAK";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA36606A332
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 07:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA36606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=uO/ZtZAK
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0443E227AD;
	Fri, 13 Nov 2026 08:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794555422;
	bh=0wAF9gvvBWx1jBLOo+W6S6m0Glsi4Cju2u7ogWxYQkc=; h=From:To:Subject;
	b=uO/ZtZAKe0L/kT/fAoWLX5CgvgoYVxSwh75/juB0sCRQ2IJfOAyc49h+sQqsY9WBe
	 4ukCa+fAVSysiZZ1zlKhBthMHEH2ykAu7TmJtn+ZEF8aMTzdAFcel2QExUNQUhmQaF
	 WPoMGX0LGWAS0bH9lZffpHexai8IAimYrHGfcjLSuIkfxNilKwhS0F68zsgi//7sTY
	 zIj5HbJ2kGDlbxOzfbhRhXU5xZWznDH/SNQ9bApmxYDiJPTpGnEoYw2RPLYuYiAOQu
	 Dalz5nWb94nv40Puttwx5Bi7Ax2agrG8pcTOKxD1HdFzCjUS8BgVEmiHBorxXp9SUQ
	 ShEIcrvtShoqQ==
Date: Fri, 13 Nov 2026 08:36:58 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	regressions@lists.linux.dev,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, tessolveupstream@gmail.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	marex@denx.de, valentin@compulab.co.il,
	philippe.schenker@toradex.com, alexander.stein@ew.tq-group.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags for
 stable LVDS output
Message-ID: <20261113073658.GA12065@francesco-nb>
References: <60a24977-b181-40e4-bcf6-38b65af293e2@gmail.com>
 <DI18PL73UQKR.2YZVZ21V69H7O@bootlin.com>
 <e88af0b7-388d-4b0a-8eb2-a367e24e84fb@gmail.com>
 <DIMMKNT9RHYM.1BRF1S1V5SIKI@bootlin.com>
 <1716be56-ac43-440b-a5df-58cbf571ba95@gmail.com>
 <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>
 <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
 <DLATMIFKDMHV.24XNMCRI2ZKBI@bootlin.com>
 <20261024095405.GA5692@francesco-nb>
 <sqilixoei4yw4z52r52vbwfggyjnhdzz62vz3vshrx6wbppa2v@izyujkfcrb6q>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sqilixoei4yw4z52r52vbwfggyjnhdzz62vz3vshrx6wbppa2v@izyujkfcrb6q>

+regression list

Hello all,

On Thu, Oct 29, 2026 at 04:50:39PM +0100, Ernest Van Hoecke wrote:
> On Sat, Oct 24, 2026 at 11:54:05AM +0200, Francesco Dolcini wrote:
> > On Wed, Sep 09, 2026 at 03:30:53PM +0200, Luca Ceresoli wrote:
> > > On Fri Sep 4, 2026 at 2:02 PM CEST, Ernest Van Hoecke wrote:
> > > >> > Also, from our testing, when using:
> > > >> >
> > > >> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > > >> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> > > >> >
> > > >> > we are not able to get display output.
> > > >>
> > > >> This is the case for the panel I worked on as well. In the practice we both
> > > >> observe that non-burst mode is what fixes the panel, but there is no clear
> > > >> explanation of the reason in the docs (that's what I hope to discover from
> > > >> TI).
> > > >>
> > > > I am testing a DSI panel on our Verdin iMX8MP module, and noticed that
> > > > this caused a regression.
> > 
> > [...]
> > 
> > > > I think we'll need to either revert this and later apply both together
> > > > when ready, or apply the second patch now as well. Right now, it broke
> > > > the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.
> > > 
> > > Reverting is surely the last resort. If you can answer the above questions
> > > it would be good, maybe we find out reverting is not necessary, and worst
> > > case we'll revert with better understanding on what went wrong, and maybe
> > > come up with a new fix that doesn't regress.
> > 
> > What's the status of this regression?
> 
> I still need to test and look into this, that will happen either in
> December as I'm off in November, or by someone else in the team. Sorry
> for the delay.

Luca: I think we should revert this for the moment, the regression is
real, and I do not see an immediate way forward.

#regzbot ^introduced: 4af021a97773
#regzbot title: drm: bridge: ti-sn65dsi83: display broken on Verdin iMX8MP after enabling HFP/HBP
#regzbot link: https://lore.kernel.org/all/3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq/

Francesco

