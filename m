Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA20135A40;
	Wed, 24 Jan 2024 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706134286; cv=none; b=g6NA4wLSuQc655utyCAoZstdy18mJYeJ5u6nysEb03AjFo3Dd6RHUdUnrUYMEOXdLQnXtdNVZkRorNoUx2JmLReR1t5w9026YppraFFqcX/mkkeNzutaPfaqiz7IsLPxXhEOK3ESni+NwcaBXLRQxyik8yS1ERTpJxK82lWrRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706134286; c=relaxed/simple;
	bh=snqluUj8YXe23n5Y2Bps+oBqaBBXlWni7cujNtHcNQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5SDiJ/ETK0M8yfHqiBnUvywxa/JBf+1nBu/5thplNrgD1w7aOgDVs17nYtf9lkt3lXFPfMJOWBZOdKJAtP8u0x9PDkJzNTClIPxLpS5sdnRik/UU0ZYrk2y3cccYYBeQ0q6iT90Fp3zn5utSW060gIMaYRN85b9b2fCRbCSuDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hVQ8yHbJ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hVQ8yHbJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99E1B40002;
	Wed, 24 Jan 2024 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706134283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snqluUj8YXe23n5Y2Bps+oBqaBBXlWni7cujNtHcNQk=;
	b=hVQ8yHbJQMOoWV/QXsWrhrKOpEp7VHXGeWww4Y4+q217L3mfMDc8Gp5FmdePqAwQ5HDwP4
	zghkCy0qctP0EdVP48tXWDUizvlsb/aeRQ/bMSqRof5L0tyBaIirqUSLxAhkP/WinTH4XY
	KENWw1sHbjmgMSARqalQLDmjx1xCfvkeblb3WUbZAqNhbcINlnndIO7aaeEsVFDgna3i88
	wYIjx0cdy7sLVpRPZ+oRnVCKG/f7SoMOOyhc8x7v8VIQheMJ0pm4FdlvAA0ptJ4T9LZeGz
	iz9RTBH/H8x+nQpM9klnFlPyGM77wL6JqJ3FtXrgz37Bx+JKIOQQx46IQexYFw==
Date: Wed, 24 Jan 2024 23:11:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, regressions@lists.linux.dev,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "Chen-Yu Tsai"
 <wenst@chromium.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 asahi@lists.linux.dev, "Sven Peter" <sven@svenpeter.dev>, "Michael Walle"
 <michael@walle.cc>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: include bit index in cell sysfs file name
Message-ID: <20240124231120.562f06f3@xps-13>
In-Reply-To: <1d13250c-e48b-4e31-b449-5b54837a0d40@app.fastmail.com>
References: <20240122153442.7250-1-arnd@kernel.org>
	<20240124182256.776c164b@xps-13>
	<1d13250c-e48b-4e31-b449-5b54837a0d40@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Arnd,

arnd@arndb.de wrote on Wed, 24 Jan 2024 20:49:53 +0100:

> On Wed, Jan 24, 2024, at 18:22, Miquel Raynal wrote:
> > arnd@kernel.org wrote on Mon, 22 Jan 2024 16:34:10 +0100:
> > =20
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>=20
> >>=20
> >> As far as I can tell, this is a problem for any device with multiple c=
ells on
> >> different bits of the same address. Avoid the issue by changing the fi=
le name
> >> to include the first bit number. =20
> >
> > There is only one bit number right? We are talking about byte offsets
> > so this value can only range from 0 to 7? If we understand each other
> > correctly then why not, I'm fine with the extra ",0" thing. =20
>=20
> On the Apple M1, the nvmem registers are 32 bit wide, so the
> bit numbers can go up to 31. I can imagine some system using
> 64-bit registers, but it's unlikely to be higher than that.

In this case we will soon or later have a problem again. Can we include
the full offset of the bit and not just the first digit?

Thanks,
Miqu=C3=A8l
