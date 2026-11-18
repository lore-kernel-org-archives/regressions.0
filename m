Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027596;
	b=yh92Yab2bz/0h9kDTIHHK6A/DzDnNX80JE4665mvTg6P+AMdhWlVQrNrE2kfDNJJjsMb
	 Y5DBU/7tBo7qqflLhj+EJwXOLgvYPQ7PnUFA5p+tIog9rzv1Jhgz02+obYIJBIYqXrE6U
	 FZ9NmvbKDy2qUP7cTlhRf4ZFdErB43ctvdQtg+0EvOsK+EvZAfJF6M8bRjEA9+zebnjrd
	 s8Pz4ox1otsn9mWytOVAflu6krQlOTHf8bMJTR8qy1WzzTplpITOITm6yR5iSvUzPhTzL
	 Ez8KogpvKM1CKbJr3NGXfovQOc+PdV5Hz79m9Nt1pB54PR5sNQO0YKORQ7o02DPPLyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027596;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0gWaaqlBeOYUC+C+1fvhqDgaQxw/BjGOD9U7GCCUc9w=;
	b=3ByTDUcuYXPtX4Z7rHrEnYWcEd5YbzSaqzFQjQPX0/OcAJzlBdOwia9ZraLr9BALLupc
	 0HggIB3F/eZTM6EzyqTpBgCd8HcGQfYkDm98aOeBNlwAx4ZlLXInfLhelQgKThTsLbrjM
	 g/tZU3eptB8x6ZS3NaKDftqe7nyV4zybAalKhM6diAuB/vsM9kAtg3FLvUomYWCMwWbF0
	 ZRGrLL15hrW1gYfzupbWHhW2d/WrPqZN/+yAi16+n+GZveIGYA48/aGAZ+iydrnVJN9Ir
	 NkyOczTMZ3fwXpN8rVDO7D5A5Ad1NA9/cn0jIHsCn5em26aDMKB994CizAx4jkskvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NR6BAlQC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6538606A338;
	Wed, 18 Nov 2026 18:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6538606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NR6BAlQC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0gWaaqlBeOYUC+C+1fvhqDgaQxw/BjGOD9U7GCCUc9w=; b=NR6BAlQC0t4l9Rusxoe6dX1ZME
	jp277QVulkgU/F/Q6UjKFhTY80f2Jgkv/yeYtwyzb9NhIu7N5h2kw46PZPduBvHLhXKssChp91UhY
	O0AhSIOUtn4rGSrwVSh7wZJhAHaD3uv6qKTdSuhE73LOO1XxY5gB4tsrbtqbyZQ+EorI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTkfx-00HUf7-Dd; Wed, 18 Nov 2026 19:46:33 +0100
Date: Wed, 18 Nov 2026 19:46:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frits Letteboer <frits@letteboer.com>
Cc: hkallweit1@gmail.com, netdev@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come
 up in 7.4-rc3 (inband/10gbase-r)
Message-ID: <0b8d1aa5-5fe6-4472-85a2-15a5b7b09df9@lunn.ch>
References: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
 <bb775cfb-525b-4471-bc80-46bb9f98cc31@lunn.ch>
 <75638763-689b-45f3-b8dd-72f74c4dea3a@letteboer.com>
 <2e06bc02-eb83-4ff9-a454-685480135bb8@lunn.ch>
 <e970af13-35de-4249-8d0d-a2bdfced1058@letteboer.com>
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
In-Reply-To: <e970af13-35de-4249-8d0d-a2bdfced1058@letteboer.com>

On Wed, Nov 18, 2026 at 07:31:06PM +0100, Frits Letteboer wrote:
> 
> On 18/11/2026 19:06, Andrew Lunn wrote:
> > On Wed, Nov 18, 2026 at 06:58:02PM +0100, Frits Letteboer wrote:
> > > On 18/11/2026 16:32, Andrew Lunn wrote:
> > > > On Wed, Nov 18, 2026 at 04:18:41PM +0100, Frits Letteboer wrote:
> > > > > Hi Heiner,
> > > > > 
> > > > > Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
> > > > > stopped establishing a link and generating interrupts under r8169.
> > > > Can you do a git bisect? Find out which patch broken it?
> > > > 
> > > Thank you for your reply.
> > > 
> > > 
> > > I was going to bisect, however it seems after loading the out-of-tree r8127
> > > driver,, the link now comes up reliably, even with the r8169 driver. I am
> > > thoroughly confused.
> > Try a really cold boot. Pull the plug, so it does not have any standby
> > power. If the board supports WoL, it could be it is kept powered even
> > when 'turned off'.
> > 
> > After a cold boot, see if the 7.4-rc3 boots correctly. That is what we
> > are mostly interested in.
> 
> I forgot to mention that I did that before sending the mail. I just did it
> again and left it disconnected for 5 minutes, just to be sure.

Nice. Not everybody would think of this.

So, probably not a regression. Unless you manage to reproduce it
again.

	Andrew
