Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025176;
	b=BMpG3Plla2FWTGwVkzkcvA+EbCs+UBQYUYK1+KBWTnZ+wB8AOrlW5linD+1St+Wddguk
	 hSrwHXyTiQ/SpyBlO4A8qgNihyMU7sHU/TuemWDug9mbOvhefZOmxmajSR0zRu/OJom7Y
	 qH/Z9It8clO6Oy55WlhVGiM6KD79nx5xRaaJPQnobEIxFd2PIMOZ6yUEoI5orjoyJk8By
	 d0OoWrJn36l9gmNOyb9xa3Mshbcrca+gHfvDhSA/XkV5EAAtNdQ99dGvpfDC4zl2EPZEp
	 hfzzt2EyvwPyFfBd54aFpoOcAxSsJlJyWGOv2VIzBElbp3MXCaKE66UH3kRbnTW9d3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025176;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qPL5fMEzI+UnP1KHLGZ4bG8R+dvo481JcOci/YLjhnM=;
	b=Eu2/BO1r5J8s071siJ7lwlgOFXg8wGyODA63OYHZHRnQ/iQwDHZa4miPaHJyBF/Js8Tt
	 dQCIvLlct+tw1ZuOwJSw5axTbxZaHKkopB8OJrdUAGTHQLgxup0KIq8cHxxkq1nI0dQB9
	 U2Uy7S/BFUenbMei4EbCA0xKEum/V7D3ik/JFGEnhjfnIYXaKM4OA93rfHmJE9kqItIxj
	 tC4FjK0TldBxH2X/96azucBuo14pcGApjor/2AlXv18jB7reRL8Bzpxx5bRaiCDK7DdAj
	 uBcTl5DtPEDneQMhQlGQkBmJSYL1d4FYz3sBA6pD2y6dQtDZbSrdwOIAYNKw2j7p3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dSWM2l2O;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD0860A2615;
	Wed, 18 Nov 2026 18:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD0860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dSWM2l2O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qPL5fMEzI+UnP1KHLGZ4bG8R+dvo481JcOci/YLjhnM=; b=dSWM2l2OVXFvI9WBXUFGcMWrFA
	P9unFXdypE22A+Qkb5VpM0UTHJvWNV1tv0nWlYaaLefCxjt6rz4DMTNakPkxYJeJABOEtZ27s1/6U
	y3MQdM2EE6naLrCOgUnTB77Uz4NHouFW44Yhkkfxm2IUi6ajCLO8xtfAYhqT6Or5Xm5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTk2u-00HU2E-Fw; Wed, 18 Nov 2026 19:06:12 +0100
Date: Wed, 18 Nov 2026 19:06:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frits Letteboer <frits@letteboer.com>
Cc: hkallweit1@gmail.com, netdev@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come
 up in 7.4-rc3 (inband/10gbase-r)
Message-ID: <2e06bc02-eb83-4ff9-a454-685480135bb8@lunn.ch>
References: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
 <bb775cfb-525b-4471-bc80-46bb9f98cc31@lunn.ch>
 <75638763-689b-45f3-b8dd-72f74c4dea3a@letteboer.com>
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
In-Reply-To: <75638763-689b-45f3-b8dd-72f74c4dea3a@letteboer.com>

On Wed, Nov 18, 2026 at 06:58:02PM +0100, Frits Letteboer wrote:
> 
> On 18/11/2026 16:32, Andrew Lunn wrote:
> > On Wed, Nov 18, 2026 at 04:18:41PM +0100, Frits Letteboer wrote:
> > > Hi Heiner,
> > > 
> > > Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
> > > stopped establishing a link and generating interrupts under r8169.
> > Can you do a git bisect? Find out which patch broken it?
> > 
> Thank you for your reply.
> 
> 
> I was going to bisect, however it seems after loading the out-of-tree r8127
> driver,, the link now comes up reliably, even with the r8169 driver. I am
> thoroughly confused.

Try a really cold boot. Pull the plug, so it does not have any standby
power. If the board supports WoL, it could be it is kept powered even
when 'turned off'.

After a cold boot, see if the 7.4-rc3 boots correctly. That is what we
are mostly interested in.

	Andrew
