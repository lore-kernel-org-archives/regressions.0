Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA9192B90
	for <regressions@lists.linux.dev>; Wed,  5 Feb 2025 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771186; cv=none; b=damAbB9IEkpO5NPEHhpjS4ZowQWP9Wx78P9+ypY1tpO8N+kIdDlFhEd3uFMuNt3amRibXGLErCi+QSKT2RS/WO35Lg7lRweTVtOeXr7ssjKQprNgV6dKU2dYCJhPdeeEg+8CvEbhu8fbxhGYZP6EcpRprZiocRaGPFzi/54KHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771186; c=relaxed/simple;
	bh=C+ypM6NN3GL5xf4/fC8/MdSGCXqBHvyUDySzw8C9sIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwVV4b1z2bvz5qobaTB54/wON0agOtANL4lcZ6HZ1srhcUmemirFl6maKpT6hCIftEk/cQNYKFmH3c0hWc15B6HtCk6D44o5IIazZvNS7Mqcp4VagBHscqzSIdx9RUZFqAvBLp6rAN/GMVwsCOc3jzUeLW874ozYaFUHpW9Asqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Q6pivajQ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Q6pivajQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YQmaHYcX4kSHNC5WcNtxux8lMrgIRKUaKugL4PZ1nTI=; b=Q6pivajQwCs/0BR8aHjA2zgzhx
	XSLlH5hTv7B02RtMAVVWhc0AMRRbF5jEkLar2wEGpnOq8YhV4OVBXGbULrkZR6cBqDcmVC+blfQ66
	/aLTDjcz2vsW0vb9+WEiNn4TG79qsLgy5Y3R/CzqozJgG1J+kRnQnC1Quny8KFEuIjJfVNFGPjX9V
	ShIwVYQbFccDc37snxuf6t1fN5pz6+9yLNDh1tQNV4j2kXFff1uKbPyzLq+jvE65jl32nVqBAtYFV
	D0/k7YzDcFyJ8dkEFVnHdLfH2xUniqdmjMhSpHk1/VPB/qCGXPy5JdH6JPfcgOp9S7+T8sa4/UmFA
	+ZtZPljA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36620)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfhoJ-0007bW-14;
	Wed, 05 Feb 2025 15:59:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfhoG-0002X9-1F;
	Wed, 05 Feb 2025 15:59:28 +0000
Date: Wed, 5 Feb 2025 15:59:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Domenico Andreoli <domenico.andreoli@linux.com>
Cc: Jason Montleon <jason@montleon.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [REGRESSION,6.14.0-rc1]: rk_gmac-dwmac: no ethernet device shows
 up (NanoPi M4)
Message-ID: <Z6OK4PXGa_ixzQQc@shell.armlinux.org.uk>
References: <Z6CfoZtq7CBgc393@localhost>
 <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
 <Z6NEyCRHTVfnM1vf@localhost>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6NEyCRHTVfnM1vf@localhost>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Feb 05, 2025 at 12:00:24PM +0100, Domenico Andreoli wrote:
> On Wed, Feb 05, 2025 at 04:19:58AM +0000, Jason Montleon wrote:
> > On Monday, February 3rd, 2025 at 5:51 AM, Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > > Hi,
> > >
> > > This morning I tried 6.14.0-rc1 on my NanoPi M4, the ethernet does not
> > > show up.
> > 
> > I am experiencing similar behavior on the Lichee Pi 4A with thead-dwmac. It works fine on 6.12.12 and 6.13.1, but with 6.14-rc1 I don't see these last several lines of output as in your case. I did also see the same new error:
> > +stmmaceth ffe7070000.ethernet: Can't specify Rx FIFO size
> > 
> > It looks like this message was introduced in the following commit and if I build with it reverted my ethernet interfaces work again.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro?h=v6.14-rc1&id=8865d22656b442b8d0fb019e6acb2292b99a9c3c
> 
> Confirmed, reverting it resurrects the ethernet also for me.

This is a known issue. A revert has been submitted:

https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
