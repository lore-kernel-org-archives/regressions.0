Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015968;
	b=pDU5OmZQEJDH8fbGh0BEsraLWfuYm/oISjCeDJOa1e1b5u3TOelDZudHz9M0IJgI17Zq
	 8szpLylKW/aKnPEdmTe3l80lkzaJbZMaqzrIz3iJ63nF6ZGVnF97zprtAIdOF06MGmNwN
	 Z3wEDE309HLXkDNQdbAyuokD1QLuPLalDzrP1MrJOu3LkgYr4KGLBb4mqMNKF2wVpd6CY
	 gHb5D5S0nZPLc23rxScmoGr6zRZpkf5gAJxBgoYayKASup7mLmbrQG5o7KFobtnFx0JpT
	 k5yBJebcwyRXS0MCiliZZp0rYy1WmUwiq4PLm/RpfogMrTU09PWMAe32Cc9iM7jez/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015968;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PtL8/+akObd7KiIRwLMWdhZxYtaj6/g81RYosEwESzU=;
	b=m0YWOfWrXta3+zA+NhAAQIkeKyfYbP/9kkNjMvaBZl6NwWpcX8wcE3dmT/MmxbIYoVm2
	 +o18o8qpXbJwS8xPlZZnI+e3w7REZgZ3qFT75q/10zL8XDmTjlTazyKz8L5u8kqhb/Zi5
	 rHx0f6UZaX1yJnWV053BNCMfwqmVpLuNHl+MWxu0PZ5AC7hhJtLAnoBjydwGnJu3DB0Y0
	 UP6CRv76CD/tIpw57CnaEhmDT5I9WkJa98NG1QgudfXCra/9KgZJnFNbfFFvHXu+hv9At
	 FVgZ8CIzMqDE8ZuJzAty4sMOWgeuvp5ajrNYxe0ZM6N3HjqC/DswMaasPX+iDu33mdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=4nkRqlT5;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91D606A325;
	Wed, 18 Nov 2026 15:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F91D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=4nkRqlT5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PtL8/+akObd7KiIRwLMWdhZxYtaj6/g81RYosEwESzU=; b=4nkRqlT5D1JABIJe+VVb/HtlXh
	xN5YafgDhfGmRYaIJKJ8wwydEDlER7sKxc+QkUlumMg4dnwQDTIwUORCCwnqlaLimd7vew61NwvJZ
	J4rFKc+hQan7211dJpisbiuXH6FRw5G2TWMAUztEH9ivzdInw1v7JgwciILYi7JM7hRw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTheO-00HSG4-V0; Wed, 18 Nov 2026 16:32:44 +0100
Date: Wed, 18 Nov 2026 16:32:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frits Letteboer <frits@letteboer.com>
Cc: hkallweit1@gmail.com, netdev@vger.kernel.org,
	regressions@lists.linux.dev, rmk+kernel@armlinux.org.uk
Subject: Re: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come
 up in 7.4-rc3 (inband/10gbase-r)
Message-ID: <bb775cfb-525b-4471-bc80-46bb9f98cc31@lunn.ch>
References: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
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
In-Reply-To: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>

On Wed, Nov 18, 2026 at 04:18:41PM +0100, Frits Letteboer wrote:
> Hi Heiner,
> 
> Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
> stopped establishing a link and generating interrupts under r8169.

Can you do a git bisect? Find out which patch broken it?

    Andrew
