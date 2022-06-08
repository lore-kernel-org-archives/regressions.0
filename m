Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6F7B
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=canuXK3Y+ncyfkWWPuS8h6rDvyzyxnt/pJWxyzVm6YA=; b=oqrgKTPO0vQwMQfdxixcD6DFBx
	Qp+nC/MRLz99qTzoCmI4+xejKggbeo6NdFrXTTsGEDd5Udb3CSUx4oVOVSiieyZDG/9sOanQV4cEQ
	X7WuKtnFRO9ORjdh0ruBdzRNQ8J2F7Nix7h5iZRNayl0qakDEJROi6O13/jR++PE/kNgjjKnXFIHV
	Wk1hpiLhcl9r0+OWTLgQBKLGvu71cpT0TuiM1U/OXkByWfh+uWhP/JcZ368DESRdcdNd6kCCcLhmF
	GzkZmNz6pIkXHStFxHrsQPWG4foUYNlu0T2jN2eXYs+uJLnRjE4hXXJlKDv8bPH+wfJviSW1wxJhb
	RRa+XRPA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32784)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nyrqB-0004Ts-QH; Wed, 08 Jun 2022 10:19:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nyrq9-0001g8-Oj; Wed, 08 Jun 2022 10:19:01 +0100
Date: Wed, 8 Jun 2022 10:19:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Eric Schikschneit <eric.schikschneit@novatechautomation.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
	"tony@atomide.com" <tony@atomide.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [REGRESSION] gpio: omap: ensure irq is enabled before wakeup
Message-ID: <YqBphR1XTcqqbvG9@shell.armlinux.org.uk>
References: <CY1PR07MB2700E81609B0967127D0773381DF9@CY1PR07MB2700.namprd07.prod.outlook.com>
 <cad76252-ec94-779e-aa31-b487526a2154@leemhuis.info>
 <CY1PR07MB27008E7B556EF9ABF609F85081A59@CY1PR07MB2700.namprd07.prod.outlook.com>
 <2725aaed-6c31-2cce-dcd2-55f2f1ed533c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2725aaed-6c31-2cce-dcd2-55f2f1ed533c@leemhuis.info>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jun 08, 2022 at 10:54:48AM +0200, Thorsten Leemhuis wrote:
> On 07.06.22 13:58, Eric Schikschneit wrote:
> > I am limited by the availability of the preempt-rt kernels that are 
> > available on the yocto project. The newest kernel I see listed is 
> > 5.15.44 on: https://git.yoctoproject.org/linux-yocto/
> 
> Well, it's up to Russel if that is enough for him, as he authored
> c859e0d479b3 ("gpio: omap: ensure irq is enabled before wakeup") and
> thus should look into this regression.

I've already made it clear that is something I can no longer do; I
no longer have the knowledge, nor do I have the hardware to test
for this regression.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
