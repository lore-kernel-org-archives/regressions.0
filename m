Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB02F83A1
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573272; cv=none; b=CB01BCBqTTczDa8eVaaapeuk6px8lYtEpCieDLMdihbAp+BlG5EWpWrQNCnpEa9faNdM52+FJYP7Z2q2XiZ6HAe1S5TZXo/ISpY9g/fWF9cBFcS9s+6Ww2VTeNq9lCgzjUJ5rzH7t5plI3p/RnlptB7dJ72zHxuj5K4GE49a3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573272; c=relaxed/simple;
	bh=eXSv6t3QQV8zRN0ums+zu7zZm/i5lNKi/WW00EAyWXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mvglwwuuW46qnxCj5l9bdTWTVTBKqslLEDb3AAGdfGuraXF+OyzZdrOREltQAgZxyhz9Vh/wGNKdOe0urDr82/N0preH781BweVBzdowJAwj2uWQ8TZK3g6v1Z/WYi+4KlM4MjCtFfrcrqoaoYKF5gf+AuYfks/lhLEJ7sDVNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kkuPfBh0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kkuPfBh0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5672C1118E;
	Wed, 19 Nov 2025 17:27:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E026360699;
	Wed, 19 Nov 2025 17:27:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F86B10371742;
	Wed, 19 Nov 2025 18:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763573263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXSv6t3QQV8zRN0ums+zu7zZm/i5lNKi/WW00EAyWXU=;
	b=kkuPfBh0ufdpV7R+zWbUttiaRdp+4BY0V2xfaFcGwI+X/oWuTkGDjJ0G1JD8dtmJbZheLl
	Q0qQvDGRYxdWgnFKwhiHzbqXXs1hZnVDBtguGKForO9GX4gi0Y06PhrLNtERaPUs2N6w8A
	BiFCiwRhlH1yLrZSuzzhRLIt0fYWYHDuSz8UQQNqBUhGmi9qpOvXzft7pfmjXUAzGVTReY
	Jw592ReCdP15yC3+rkfA7DzlNpcgE8SJhD/R8C9nfQExzx6+2lJnxVtFkiXU+vlPHPurOg
	JZfhs8ua51CGIxYgR9ld24PDxQd7oWol2z5Rm/qlZqS1618bvCP9ZUfSgnFDVg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 18:27:38 +0100
Message-Id: <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
Cc: "Herve Codina" <herve.codina@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <joao.goncalves@toradex.com>, <linux-kernel@vger.kernel.org>,
 <regressions@lists.linux.dev>, <thomas.petazzoni@bootlin.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to
 blink On/Off
X-Mailer: aerc 0.20.1
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42> <20251113084950.44a09e8e@bootlin.com> <20251113091910.GA15538@francesco-nb> <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com> <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn> <20251119085127.6e3e429e@bootlin.com> <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n> <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com> <20251119111221.GA18602@francesco-nb> <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com> <20251119122443.GA29208@francesco-nb>
In-Reply-To: <20251119122443.GA29208@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
...
>> I might be mistaken, but I don't think the PLL will work if unlocked...
>> But maybe the case is that it unlocks and lock again right afterwards.
>> >> Jo=C3=A3o, Francesco, on what hardware do you observe the problem? Wh=
ich SoC?
>> >> Which encoder, any previous bridges?
>> >
>> > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>> >
>> > There is a DPI to DSI bridge in the module, tc358778, it has a 25MHz
>> > reference clock.
>> >
>> > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 -> Display
>> >
>> > From a preliminary investigation this is a HW limitation, we are not
>> > able to generate a "good enough" DSI clock, see tc358768_calc_pll() fo=
r

Thanks Francesco for the feedback!

I'm not sure I completely understand the issue described, but if the TI
bridge requires a clock that cannot be provided by the hardware, then this
actually looks like "a HW limitation" as you wrote, due to a HW integration
limitation/bug/issue/whatever. In case this is confirmed, I think quirks
are an appropriate tool to handle HW integration issues.

>> I haven't studied the docs or done any testing, but I would think that
>> it doesn't matter for the PLL even if the incoming DSI clock is a bit
>> off, as long as it's continuous and stable.
>>
>> My first thought was that the DSI is using non-continuous clock, but at
>> least the driver has code to drop the MIPI_DSI_CLOCK_NON_CONTINUOUS flag=
.
>>
>> > the actual code implementation of it, I believe that the datasheet is
>> > not available without NDA.
>> >
>> > Maybe the ugly hack "works-without-pll" is the way to work? It will
>> > require a DT change, but this seems doable.
>>
>> Revert is easier than adding new hacky DT properties... At least until
>> the problem is understood.
>>
>> > Please note that this is the outcome of a short investigation done
>> > yesterday afternoon, so maybe I am overlooking something, unfortunatel=
y
>> > I do not have the bandwidth to work on it more this week.
>> >
>> >> Which clock rates?
>> > 71100000
>> It would be a good test to try out with a few different clocks.
>
> 50 MHz works, for example.
>
> It seems that the issue exists when the actual display clock is different
> from the dsi clock. And this can happen for the reason I explained
> before (the DSI clock is computed starting from this 25MHz reference
> clock).


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
