Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9938DD9
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719876059; cv=none; b=BlFikaKNqnlxLz19UxCZp0K+ZuC0JqIdId0bBKOhvD8UswL6mRHxIiMG8x7fMgf5U9sz/IKKMQuGYHr5XLuBUhSIZrc7dWvAe+xwZVXRMtxDxffku7dv477dZbvth/Neo6ovLF7RPzbstdD7gQ1mOA28zAggfJMs0i+OFe72FpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719876059; c=relaxed/simple;
	bh=VOqXlbGZbMtBZcpiUmACzB8a2MSfr855nQGtoWoRfxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyvcyWdih5akpXa9Vw+iqXrurTNa9TzALUlkqIrdWakUuSJP59fwBc8aN4U88Yvi1+H2EqV+dhUCbatv5wTu4/v0zdGEueCbTC6zkNcL6jkcrig87uRNHE57FKyDPfEOYv5Y8qgK0HSx/WPJOCMsUZiR7WQPV13ywEsAAINWzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=z1rLnE70; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="z1rLnE70"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UD5vgVxwOlRZOz1Xq5UgrytqB41yQecb8+27k5DyQes=; b=z1rLnE70q6Z36BN3bEbxJ19yCo
	CntK0uNP1+NNBD8RTxDVUv2g4JJiZ6W9FDidKiDbwqp9GOPYvdK8rz+Ts5z+ndQuRLUaHK+kC6L8H
	1VTiDRqGHlSLUkD7hbmMP6GfUdolrpoqKby0CDVnLcGeCWy3gW0d8g1DW7vIW4mcbqfNoMR5MUTIM
	kpsYQhlwnZJlrB8Iu0eyPLHOgMoQOl6bJqMruLboljNi7XIrlMi9ON7FAF0tgPxrhma0QtjTUY4MY
	GirAChlAiFCXaXd2tLE2JwaPc2/qd52u4mcO7OkctdM/S8Lr/26or1IDJPSqtFYXzdn3fHPxHaoQA
	Qn2iCjaQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51196)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sOQK7-0002bu-0y;
	Tue, 02 Jul 2024 00:20:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sOQK7-0001NR-PA; Tue, 02 Jul 2024 00:20:39 +0100
Date: Tue, 2 Jul 2024 00:20:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kees Cook <kees@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Yanjun Yang <yangyj.ee@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	akpm@linux-foundation.org, ben@decadent.org.uk,
	Wang Kefeng <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] ARM: Remove address checking for MMUless devices
Message-ID: <ZoM5x8xVVGhlcV29@shell.armlinux.org.uk>
References: <20240611100947.32241-1-yangyj.ee@gmail.com>
 <CAE8JAfxkbw4+wsKjoH1qyo1r69TpgLtfRjchTJ=4vVvvM46CuA@mail.gmail.com>
 <6767f6e1-f7b7-4b3e-8173-32f1472f56d6@leemhuis.info>
 <202407011216.E1DCF4BF@keescook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202407011216.E1DCF4BF@keescook>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jul 01, 2024 at 12:17:10PM -0700, Kees Cook wrote:
> On Mon, Jul 01, 2024 at 01:54:21PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 12.06.24 03:25, Yanjun Yang wrote:
> > > Apologies for not CCing the relevant maintainers in my previous email.
> > > 
> > > On Tue, Jun 11, 2024 at 6:09 PM Yanjun Yang <yangyj.ee@gmail.com> wrote:
> > >>
> > >> Commit 169f9102f9198b ("ARM: 9350/1: fault:
> > >> Implement copy_from_kernel_nofault_allowed()") added the function to check
> > >> address before use. However, for devices without MMU, addr > TASK_SIZE
> > >> will always fail.  This patch move this function after the #ifdef
> > >> CONFIG_MMU statement.
> > 
> > What happened to this fix regression for a 6.9 regression? From here it
> > looks like it fell through the cracks, but I might be missing something.
> 
> This patch can be sent through rmk's ARM patch tracker, but if it's
> urgent, I could take it via my tree? It has Ard's Ack.

I've been so busy with a high priority work issue that I've not been
aware of this email thread until I saw it tonight (because I haven't
been able to read much email!)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
