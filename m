Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557741;
	b=2rd7xVGSFc9E3auOjGTsLUWzulT5GbzBiSFavH1Yf5vBjyhvk8d5Iw3GtqaAteEueQp0
	 Jf/+PiVkaIwyDxyjPBp02f/I1+9EUNAxLKczvMizkUlkE6OPqudT3r+4YvXhLxlnBnbbu
	 SdvY5aB5DfKsrQrw7o+l4fhIJvq1qRIph+LIfW6QEJznAUjwsS0YcePGqXvTF/V3PSL+d
	 ZDMVF9ci08lk0Ji2MU3Qf1+oivbxOcPjXg1NlshUSwuUdKato9Y+EiYT2ISrcrkRbaAL5
	 FtkSxJE7IOI4hN2LiY2hBzkIgpUUTSEB0ici/lOhBtMVoKF/UlJ7ScDgBCQJVmvvuyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557741;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=ChSZe9dWQG2rTZceNI3AoXdcsbHWLSpanJhGWsIdQk0=;
	b=oSXzsoe8u9QuY4wHEUrUTCcjnQnagxS5ENRA8q4snHCXxyytjPUFQmUWLgf5plNo5h6u
	 bQeo3oVe9oXO5Pe89R7PIIXk3KDYUTy69aHnWhwB0fuGfzBx4Wnh4Fh/t4T6EvIGtrMZI
	 +zoiOTiT7sCSi8TlbBkNtS7UotqpiJediJDnpneajzI4fKtLD1z736S/lJ32fKzBHHPO3
	 iZ5rIRymbUIezStaWog6YLfjWlx91DcY3WMVxHEXEV+iBLUtGFlRxQdFcAs9YBkqLb96w
	 xDgb4bZiX0mCsk+bPCpVHFFfMZoQ5Q5Ik2VyckW7vXaP+I9OGgMp3pTCJ/+83vP9pNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=G4WiEn+p;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31F606A327
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 08:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B31F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=G4WiEn+p
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B4074E415A1;
	Fri, 13 Nov 2026 08:15:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18260601D5;
	Fri, 13 Nov 2026 08:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D76211BC1163;
	Fri, 13 Nov 2026 09:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794557737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ChSZe9dWQG2rTZceNI3AoXdcsbHWLSpanJhGWsIdQk0=;
	b=G4WiEn+pmfOBwJs65vqSsvkhqD62IUCPiYZL2GOCFj5XsJV7LQ2DTeVYkYESfPf3pMqFIz
	FjOWkYdMi5tRKeYwy9huxoEU/Jesf31q2d4bRqYo5cRnNXEoTvnoxKTNODSVrTnSmM8KM2
	m5xDwoK5twjVlIyzhaoe2Xofiw+WWgNlBYJLsyLD+S2e6xBcm6ZuXZgx2cDOLWHZeYJ7v5
	FoPhn0PA55DE9DvNuRQ5p0SI/3+tkYWFgjkSnqMtX2q2F6TDkLkz4iEwZTucoDJx/tdYKZ
	iKRzL5hdZhpXA80F6nw7TZlao5i9jHi5t0mtoRn7sbc32OIAP9ZkBlGlrDWYzA==
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 09:15:30 +0100
Message-Id: <DMTXMG427D7Z.MVUAQQE9B08W@bootlin.com>
Cc: <tessolveupstream@gmail.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <marex@denx.de>, <valentin@compulab.co.il>,
 <philippe.schenker@toradex.com>, <alexander.stein@ew.tq-group.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Ernest Van Hoecke"
 <ernestvanhoecke@gmail.com>, <regressions@lists.linux.dev>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags
 for stable LVDS output
X-Mailer: aerc 0.22.0
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
 <20261113073658.GA12065@francesco-nb>
In-Reply-To: <20261113073658.GA12065@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3

Hello Francesco, Ernest,

On Fri Nov 13, 2026 at 8:36 AM CET, Francesco Dolcini wrote:
> +regression list
>
> Hello all,
>
> On Thu, Oct 29, 2026 at 04:50:39PM +0100, Ernest Van Hoecke wrote:
>> On Sat, Oct 24, 2026 at 11:54:05AM +0200, Francesco Dolcini wrote:
>> > On Wed, Sep 09, 2026 at 03:30:53PM +0200, Luca Ceresoli wrote:
>> > > On Fri Sep 4, 2026 at 2:02 PM CEST, Ernest Van Hoecke wrote:
>> > > >> > Also, from our testing, when using:
>> > > >> >
>> > > >> > dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_B=
URST |
>> > > >> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PAC=
KET;
>> > > >> >
>> > > >> > we are not able to get display output.
>> > > >>
>> > > >> This is the case for the panel I worked on as well. In the practi=
ce we both
>> > > >> observe that non-burst mode is what fixes the panel, but there is=
 no clear
>> > > >> explanation of the reason in the docs (that's what I hope to disc=
over from
>> > > >> TI).
>> > > >>
>> > > > I am testing a DSI panel on our Verdin iMX8MP module, and noticed =
that
>> > > > this caused a regression.
>> >
>> > [...]
>> >
>> > > > I think we'll need to either revert this and later apply both toge=
ther
>> > > > when ready, or apply the second patch now as well. Right now, it b=
roke
>> > > > the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.
>> > >
>> > > Reverting is surely the last resort. If you can answer the above que=
stions
>> > > it would be good, maybe we find out reverting is not necessary, and =
worst
>> > > case we'll revert with better understanding on what went wrong, and =
maybe
>> > > come up with a new fix that doesn't regress.
>> >
>> > What's the status of this regression?
>>
>> I still need to test and look into this, that will happen either in
>> December as I'm off in November, or by someone else in the team. Sorry
>> for the delay.
>
> Luca: I think we should revert this for the moment, the regression is
> real, and I do not see an immediate way forward.

I hoped to get better info from Ernest. The commit looks correct so chances
are that regression is caused but other bugs (incorrect timings, inaccurate
clocks, etc).

That said, why don't you just send a revert patch?

Don't forget to add to the commit message:

 * accurate description of what hardware breaks, with pipeline components
 * panel timings (or, better, panel datasheet URL with that info)
 * exact kernel version (upstream kernel tag or SHA-1)
 * clocks used and measured on the lines
 * difference observed before/after the patch on the cables and in software
 * any other detail of your investigation

I understand some of these info might need time to gather. But right now
every patch fixes some panels and breaks others. If we want this driver to
work with all hardware at some point we have to start doing some
investigation.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
