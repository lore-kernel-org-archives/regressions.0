Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011645;
	b=KfMFSgN07B59ocbl6gs6DDLY+Qng4aZB1ZJC2E9BPQ6+8vNuQFq4848t/gDfKYpexMRA
	 99rv9ou4gWe6JeV3KQudMQX8ipK8JThQD3h/CTm2vlqvcmzcmpd1E9b8M4bXnGRatPWuc
	 /hZerV72qePKc2I6tlIHj0UAE9viQMZgePLyGrh02DZ6J4+KXW0Nb9tAjXyxBjb4Q4eHe
	 dYzxhEXgaviKArhghawobanHnp0NFMxsJOYCwG9c7frAaDkyRYmQwhbUJsffL3nf+3Bf2
	 bmR7tpOj057I76qDV7Ur6x6xcdGen/gqDbC0P0TNHRaq2LAaHOStxBRbo9Hb+VgSFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011645;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b554QyqYFmmFBreM0cIL1qgp1u4ZtLewiZZrfpZ+XXU=;
	b=V7qYPmjLPSSH8Z8nUY65k+Po1c2NXnz8VTUgtEpXGXfUUT6JDTczpf+PNwap2VJeVTDQ
	 bgMdQN1z2DryWnTk15mF1+ZGSIX5tmSsSV1VfvT/OdA7e3B0G5WxAcp4MEnoRNlx7Maql
	 9Pa9p5j8RG6ByjU4PB6Tf+YQ4cFRSJJa5DBNg2IOvfr1ZN9ULIIVC4JnS5G1EPlzZsreg
	 SMXtzu5dFxvQ+ud9KRdDzkjQRoFSDdwUg4DGgqbMsFU+9TzmmPnq8A3/cPoLRVivLQr/E
	 2i0avmlssFQeSPV7u5ndU5ZxcOsg+A37AlKzR9rImmYOT8hp9QWxmrr3xoEl6T85XhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uP0yVdOC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A1606A31A;
	Mon, 26 Oct 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uP0yVdOC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB301F01825;
	Mon, 26 Oct 2026 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793011644;
	bh=b554QyqYFmmFBreM0cIL1qgp1u4ZtLewiZZrfpZ+XXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uP0yVdOC+NeW0cLQ9BPFLOBztvmwtyEKFC9eeU2peBZi4Z+VWXpzzp8AsjM2R8ZMk
	 enuVxxG3BH6suPbxuJIX1DdJXs+PvKd5uoHzuF2pyc7ocdvlhiwJaVSu3/3zbjYRBB
	 m4I4jeb01lQqj3TrxliThUV1P36NzezV7idFVNsw=
Date: Mon, 26 Oct 2026 11:47:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <2026102600-coffee-roast-ad18@gregkh>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <c8a3ffeb-8737-46d2-b01b-5ed9bc96012f@leemhuis.info>
 <a174538e-7c7f-4905-8aa5-f906e6664f4a@linux.intel.com>
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
In-Reply-To: <a174538e-7c7f-4905-8aa5-f906e6664f4a@linux.intel.com>

On Mon, Oct 26, 2026 at 11:28:37AM +0200, Mathias Nyman wrote:
> On 10/25/26 10:59, Thorsten Leemhuis wrote:
> > On 10/25/26 01:10, Dennis Wissel wrote:
> > > On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
> > > > The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
> > > > ("xhci: give back all TDs when skipping endpoint reset after
> > > > disconnect") and applies cleanly to v7.3:
> > > [...]
> > > > Could you test it?  If it fixes your case, please reply here so that
> > > > Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
> > > > and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.
> > > 
> > > Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the mouse
> > > plugged in each time.
> > > 
> > > 1) With 1f36cc9fa949: much better, but not completely fixed.
> > 
> > This btw is the third report about problems that that "xhci: give back
> > all TDs when skipping endpoint reset after disconnect" fixes; the first
> > was what lead to the fix, the second was:
> > https://lore.kernel.org/linux-usb/20261023190104.113331-1-diogochaves@me.com/
> > 
> > So it sounds like this is something we should mainline rather sooner
> > than later (ideally with a stable tag to ensure it's backported).
> > Mathias could you make that happen? If you are busy and need help, just
> > say so.
> 
> That fix isn't enough, we need to fix it properly.
> 
> 7.3 where the issue exists is already out, so that is too late.
> 
> What is the policy here?
> Should we try to shoehorn regression fixes into rc1 during merge window,
> or wait until rc1 is out?

I can take patches now as the -rc1 window looks like it is going to be a
"bit" bigger than normal.

thanks,

greg k-h
