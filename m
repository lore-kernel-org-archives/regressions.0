Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732DF18A6BC
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156664; cv=none; b=T+1qHGJshmeriISk5fBQTVkR1p3d/Iyw1kdlu9O06HlodTmx0Q03+LFGYS/tJdf9NguUHaGhpPZBSpHAQP3EBhn0QaMohvkYN1t9b+vEG/P9yqmX9V+xEZIaA9bqE71Upo4/duGRFNMNMiq6Kz9FsClV59CFlf+Qjj+k69t5zqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156664; c=relaxed/simple;
	bh=gB/qpTik6peKajUtgSyTNaIHZfSSkv4bwYe6mPLY8gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNE2OU3qR7QWN/7UVMTASwuirVesIrLKmnVS3ucuvCfarTq6KVX0Ab2/sQsF1kMBGA7ftW/pSjknsL7GMPmj2ygd03WTYyDQVwvDgC48UWHEu3tiUrKfr23hB3XQXUQMx0ZbnpIaUnDQH5ApI8pbRsetYl55sSBQjp6/cxLS3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=DHBlGvPl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dKCsXqE4; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="DHBlGvPl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dKCsXqE4"
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 89C431151B50;
	Tue, 20 Aug 2024 08:24:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 20 Aug 2024 08:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1724156661; x=
	1724243061; bh=a6zHW584Nt6I4NvQjIKpv2LAbK25vNr4J6/juyl2XvI=; b=D
	HBlGvPljnajsE2TZPOhVgHhFHjQ5hLd480/4ha2NXfEajJXKzgd+yTLKTP8h74qu
	bAPh7+vNUuaNRKPernqUyMvPuzZmiFur7n+xNFYcvN0FerBnr85ldvHUlA6RE7hi
	nnRK4aj8sAvmOS9Pl+Z1ctQkA3w54dluWCU/3reka+ffLxjLKd/phB2DPBOhmboG
	KwjMmmtCXILkK1m5qrvUw0XEw+a7+YN0YvX7ELj1cxSIZ4EZUHzrcawthkL7NB3P
	rHRnvjwazsntWoqObl2uqlLoDuPErMtTpXQF9faNa2OPys898EXMtgTSQ3xp/BNN
	ZDZB5L7CqB/qgd4j1vw7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724156661; x=1724243061; bh=a6zHW584Nt6I4NvQjIKpv2LAbK25
	vNr4J6/juyl2XvI=; b=dKCsXqE4mgqbBiYs4L6avpVuatUuAXarNY81sT6eCemI
	8HREdw5kvZ2UbiBQmFeW2uOvH62fIiDQUqnoVFZk5slx7JX0bf19hWUaeuZye6cK
	EYZvzEqX+p/TAVWU2/4v78jB+OchLVJYcU/RtkQ5wyNDqL0h70dtpcimdJHpxJt4
	CxWtcn2WNzo6XH1ghRU+Sxz3bAAxdsYM/82+IxmX+wsb3HHJrUhjOL5SZx9X49SR
	DjVh54slhIZmhRrih/yo3ecFakyvwnwqg1nSr2I4Q7AQHmY1saMVD4wnj7fnGn52
	ddqj4EEmOIlcQFHlt6GRgdyDGiLMwuRhfHKRsoIaAg==
X-ME-Sender: <xms:9YrEZj-lx2HhCyjkUusKSq_uNPvR9A4rOeqvEi5NdYE2UsbowtnvQg>
    <xme:9YrEZvsRgkDhId5unwr6Lt6cDFjddkBW3n2FyLVZ8JudZuf6g-0qB6s9a2nNOIrjf
    oxqv9K1sCtBP0WOCj4>
X-ME-Received: <xmr:9YrEZhCCTYgrtoTA-0KA_-ER0T7C916cVQ4l3xp6VXBxwarUvYZGlCiGfpYjs4Pf3AC3QjxwZ86tLstTSUBnxWtBQnvx2rZ_JR3H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduiedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeu
    udekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegvughmuhhnugdrrhgrihhlvgesph
    hrohhtohhnrdhmvgdprhgtphhtthhopegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9YrEZvcsfreCJPbrha42AE7R_ik2lGijWQvOZnzaVi2gSpx8cKUFkQ>
    <xmx:9YrEZoPTFl88xo2rKYVUX-4iY5OfHsuVl5FMOVmua_EpjHEOvxXSVA>
    <xmx:9YrEZhldahYcI9D6UkuZLKCTLSABDaAZF0l-6GVLsZS6KK1UbflXGQ>
    <xmx:9YrEZiurlw7hgaKrKlWbrNTWDd8u0rbxVGNsIV0RS-eAmT9sP7RdRQ>
    <xmx:9YrEZlpUBdxJ3dnx2E4tdhJI_xUHw0L3X7omhMe9ASchVsYm7O5sCjO->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Aug 2024 08:24:19 -0400 (EDT)
Date: Tue, 20 Aug 2024 21:24:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "edmund.raile" <edmund.raile@proton.me>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <20240820122416.GA26397@workstation.local>
Mail-Followup-To: "edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, regressions@lists.linux.dev,
	linux-sound@vger.kernel.org
References: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>

On Thu, Jul 18, 2024 at 12:29:48PM +0000, edmund.raile wrote:
> Between the kernel releases 6.9.9 and 6.10.0, something changed that causes
> heavy digital distortion on playback from at least ALSA and PipeWire.
> The rhythm of the music is discernable in the output, so it isn't just
> random noise.
> It sounds a bit like bitcrushing, but not quite.
> The generated overtones appear to be dependet on the sample rate.
> 
> I am sorry I can not be more specific, there are no kernel messages this time.
> 
> As Mr. Sakamoto recently committed all these changes to firewire he might
> be able to identify the issue easily, which is why I'd like to ask him to
> look into it.
> 
> Kind regards,
> Edmund Raile.
> 
> #regzbot introduced: v6.9.9..v6.10

Fixes included in:
* 6.11-rc2
* 6.10.4
* 6.6.45
* 6.1.104
* 5.15.165


Thanks

Takashi Sakamoto
