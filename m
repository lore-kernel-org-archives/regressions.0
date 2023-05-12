Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A707F0
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 11:47:11 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 585A02034F
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 13:40:28 +0200 (CEST)
Date: Fri, 12 May 2023 13:40:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Linux Regressions <regressions@lists.linux.dev>
Subject: Re: USB gadget regression on v6.4-rc1 and v6.1.28
Message-ID: <ZF4lqka+PxjHAlrh@francesco-nb.int.toradex.com>
References: <ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com>
 <ZF4bMptC3Lf2Hnee@gerhold.net>
 <ZF4kBJEKDy5T39sj@francesco-nb.int.toradex.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZF4kBJEKDy5T39sj@francesco-nb.int.toradex.com>

On Fri, May 12, 2023 at 01:33:24PM +0200, Francesco Dolcini wrote:
> On Fri, May 12, 2023 at 12:55:46PM +0200, Stephan Gerhold wrote:
> > On Fri, May 12, 2023 at 11:07:10AM +0200, Francesco Dolcini wrote:
> > > Hello all,
> > > I recently did have a regression on v6.4rc1, and it seems that the same
> > > exact issue is now happening also on v6.1.28.
> > > 
> > > I was not able yet to bisect it (yet), but what is happening is that
> > > libusbgx[1] that we use to configure a USB NCM gadget interface[2][3] just
> > > hang completely at boot.
> > > 
> > > This is happening with multiple ARM32 and ARM64 i.MX SOC (i.MX6, i.MX7,
> > > i.MX8MM).
> > > 
> > > The logs is something like that
> > > 
> > > ```
> > > [*     �F] A start job is running for Load def…t schema g1.schema (6s / no limit)
> > > M[K[**    �F] A start job is running for Load def…t schema g1.schema (7s / no limit)
> > > M[K[***   �F] A start job is running for Load def…t schema g1.schema (8s / no limit)
> > > M[K[ ***  �F] A start job is running for Load def…t schema g1.schema (8s / no limit)
> > > ```
> > > 
> > > I will try to bisect this and provide more useful feedback ASAP, I
> > > decided to not wait for it and just send this email in case someone has
> > > some insight on what is going on.
> > > 
> > 
> > I noticed a similar problem on the Qualcomm MSM8916 SoC (chipidea USB
> > driver) and reverting commit 0db213ea8eed ("usb: gadget: udc: core:
> > Invoke usb_gadget_connect only when started") fixes it for me. The
> > follow-up commit a3afbf5cc887 ("usb: gadget: udc: core: Prevent
> > redundant calls to pullup") must be reverted first to avoid conflicts.
> > These two were also backported into 6.1.28.
> 
> Thanks for the confirmation.
> 
> > I didn't have time to investigate it further yet. With these patches it
> > just hangs forever when setting up the USB gadget.
> 
> I will double check that the same is happening to me and send a revert
> afterward.

#regzbot introduced: 0db213ea8eed
#regzbot introduced: v6.4-rc1
#regzbot introduced: v6.1.28
#regzbot title: USB gadget hangs forever

