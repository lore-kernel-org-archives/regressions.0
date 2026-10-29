Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290697;
	b=YiWmYqzWNPBPJShOmGcPk0Raxy/BRIqbL1z10s9jQ9nRS9m7cTBTn23+NIZWwWPCOimE
	 XOIbKpP1/ZQPNJddtmE/cvz17Ackli39puUqRneLslp275sBbejZEGLBhT0FRGOs6Ottd
	 UL0BEYWjOL35m2Cs98/qc+H8PPSWhQiAK/o+2ERd6Te3p49AaEvkcdXjeCGUo5w1UzWe4
	 RJtOj9eUEoKYZ/MDH/ySHvFbBViB7uJsuuazO1ZTLbfpZW/q0C35iJYcSiPaOLDsS3ia7
	 VRs/620xO2aDrlTyKL9PlNF0Ioix+AMJ6ntz9K0FnbV1bb7jbXdJDvF7k4z5TZXUA+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290697;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z8izGLdGb4A2occNSBgmeVhgS4K01poGBd7+bgmLH3Q=;
	b=PkbNuo9Y/1saWc0A3/V1vppX3sOwNWz4YinEBJPooE0RNAjq//Vh+Ut9pl/eV5GnokIq
	 J/0MEhNKAdUrL/gAn/3uFVp+i0Xfys3oZCwKGDU0EkPg1Xs+U65p6qFQdzFuQ4moaF1ZJ
	 zBLeBBLfyi86CzMykjHv31ENBdZCnxnd8o96+FjOKh3p8YNJVp76asHmFoGBtqgoQJQbG
	 F3jmRW9JVv9TYk6prDsHpXM1OBEkN/0MVUVt/1e38bNlyaewntcMX3vOzBFcX7VTUSLOg
	 tdK1gyogdYbVQdzKVN8Jac7MezCb1VRsk3/JdHmm7o48CAuJqTfme+nWCwx8ROUd7yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oscPM8PV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B01606A31A;
	Thu, 29 Oct 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oscPM8PV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6779F1F01816;
	Thu, 29 Oct 2026 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793290697;
	bh=Z8izGLdGb4A2occNSBgmeVhgS4K01poGBd7+bgmLH3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oscPM8PV1Mny2RCnzfDJku/v3Di+/fLahPRHAyY0fRyTlqQxho5pRD2bV7JR2nz/s
	 E6Tmy/53PiJ+RkEt5+Et5xvhURWtl9K6VL6UHRSEu3fkG9M/bY0x5dxtpg34kDdH4g
	 ntk6bgpN1T8KYAX9YgTYC4OT0lkFpLj3b4l2LR+Q=
Date: Thu, 29 Oct 2026 17:18:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	michal.pecio@gmail.com, Yiyu Zhou <yiyu@yiyuzhou.io>,
	Dennis Wissel <dennis@dsine.de>
Subject: Re: [PATCH] xhci: give back TDs and clean up ep0 after disconnect
Message-ID: <2026102940-nuptials-stowing-44ee@gregkh>
References: <20261029153910.569577-1-mathias.nyman@linux.intel.com>
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
In-Reply-To: <20261029153910.569577-1-mathias.nyman@linux.intel.com>

On Thu, Oct 29, 2026 at 05:39:10PM +0200, Mathias Nyman wrote:
> From: Yiyu Zhou <yiyu@yiyuzhou.io>
> 
> Fix a regression in v7.3 introduced by the commits in the Fixes tags.
> Those patches avoid endpoint recovery and rapid state changes after
> the root port link is lost.
> 
> This caused a regression in device enumeration.
> 
> It turns out that a subset of USB HID devices briefly disconnect during
> enumeration. USB core manages to resuscitate these devices without
> reallocating them, and thus continue using the same udev, xhci vdev and
> default control endpoint (ep0) of the device.
> xhci didn't give back or clean up halted TDs behind disconnected ports
> as it assumed that the disconnect cancels all URBs, and drops and frees
> all endpoints.
> 
> This is not the case, so cancel and give back TDs on halted endpoint
> behind disconnected ports, make sure ep0 is cleared and in a proper state
> to continue working even after a link error or disconnect is detected.
> Also prevent new URBs until device is reset.
> 
> One issue related to the TDs not being given back was seen on a PFU
> HHKB Professional HYBRID Type-S keyboard (04fe:0021).
> It drops off the bus about 300 ms after its first enumeration, while
> usbhid is still probing its third interface. The probe runs in hub_wq,
> so the disconnect is not handled until the probe returns.
> On a root port the HID descriptor request and its four retries in
> hid_get_class_descriptor() each wait for the full 5 second
> USB_CTRL_GET_TIMEOUT:
> 
>   [57685.006036] usb 3-2: new full-speed USB device number 24 using xhci_hcd
>   ...
>   [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on usb-0000:00:14.0-2/input1
>   [57711.221083] usbhid 3-2:1.2: can't add hid device: -110
>   [57711.221613] usbhid 3-2:1.2: probe with driver usbhid failed with error -110
>   [57711.221842] usb 3-2: USB disconnect, device number 24
> 
> [mn: merge EP_DROP_PENDING and link_inactive checks in xhci_urb_enqueue(),
>  return TDs and clean up ep0 on disconnect, rewrite commit message]
> 
> Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
> Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
> Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
> Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/
> Assisted-by: LLM
> Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Tested-by: Dennis Wissel <dennis@dsine.de>
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-ring.c | 73 ++++++++++++++++++++++++++++++------
>  drivers/usb/host/xhci.c      | 13 ++++---
>  2 files changed, 69 insertions(+), 17 deletions(-)

Doesn't apply here, what was this against:

checking file drivers/usb/host/xhci-ring.c
Hunk #2 succeeded at 963 (offset 7 lines).
Hunk #3 FAILED at 1005.
Hunk #4 succeeded at 1039 (offset 7 lines).
Hunk #5 succeeded at 1092 (offset 7 lines).
1 out of 5 hunks FAILED
checking file drivers/usb/host/xhci.c

thanks,

greg k-h
