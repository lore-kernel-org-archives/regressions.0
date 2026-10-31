Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419579;
	b=ho3RBu2zFRwdU7czr/kOeNSaDf/Z03iJ10TyIX0cPVSPBuB7JOIBoV5ZkpQ/hyljDejc
	 L9ZSIOAUF6CdwLDqhDlujw/icPKDBaW76GgOLPFGdQ0TVAqUk5pp5nz0est1RBOztg+R9
	 TTC2EWflh8VEd0tvTbVqadAs1J8FO/UHXgZ4vzxNCyAyjSeVy1YCPPtxvNITZ5bsi55xB
	 +C3XQaSEZmVn6WOKuG0YqQ9VXs0LK8V2ZxmGkDizDoqbfXysfbOlNpXxhxKlz9Ud4tXo/
	 GMZ4cuUubi+W5M7PqhPrDOC2JtlFsIUXBwfExqIegQcQA3tOc6xrrfVX7NzcTr7VfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
	b=K0P9qHZVKMhYPgtbtHr/IWYNISGvIpQX8+GtQSbJ7dqygdm52J5zFYV15l9fKHjlTBJF
	 65M9+exymJIhvkI5oOJaSbbkf/rFFpZlUiRkimodhWxB1b2pSvVjAjl+27gj2LTlgriKL
	 ZInyFjvdy1HF416Ek5ZKhVWclt/cxDRHNdXxeVnf8W4gTNsu8bCy3Ec2LKAYZYpwfoi65
	 i5Zdi2getZLi2saX5Qk6Cus21/97oDSkUXS6GU6GILEaV0ObAll8T4yN8WDvNaZEXDggs
	 iHpWRSRIU5vynY0E8rmwAyHnuE5337Lg2xFeRcuQ/EkeXSSEoy8aP+qYBIDeH4l6i8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbs9oUCs;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C79606A31C
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 04:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbs9oUCs
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13926945e9.3
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419577; x=1794024377; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
        b=zbs9oUCsOt87j8DIG/t/zm3+GbNV5OHf7cUYa5gFV+tyVIWfBeT66aFiNtuK0QbABd
         /LRvWcKoYLwHIIDZmHVelMk7OJKZZdOVZnr8EwYInv+1uF7Ox+M50D7GEF0wlT7oRBde
         3dtr0ZOXzC1QMii/lP7veXOZ5E7FZLHlnYZatP0sn5wCURS5H2LI6v/H7BUbyqny9bbt
         nmeP/JocG2IQSsov3i1Nty8hsM9tU5ih+jIcFK1Yi/g4wYUHzqVNrQ1T7vrN4fyXLZeE
         yrTLJue7NFZHbOXZWB03O0lK4dog9HzKf9jMsUKqmWByaRa86jv+4cLX4/hEevgbHtRR
         DUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419577; x=1794024377;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
        b=Fy+2yUCn+I3A2aotI2VThlaEnbGi++K1fEFuPnQciLr1Vs3DMj+LvmLFhj3iu6OnJU
         a9AcuKU9JfRQXW7J6UnOdsv83TrpsiM90ReQG6PCLu0HJBb4K/1Z5TMWkfiYY2UvhRy5
         SKUMpZURBeJTbQyKznC2W7s826QVLzj4WEzI+RMbawYH4dwbDFByCuNEBY+RuxQ1u4pw
         9C1OlFtS5xAJJS3eblARVZLkfuA7fcAAG946XQeF2owkB5LmloGymkv2yygrDyECnRq2
         Qcrq7RLa6YUzMw8Q3aaFNxmvQOQjhdptZPUVE/aQ8+YpruVis33zS5QEx1kbeyvnvnL6
         UjeA==
X-Forwarded-Encrypted: i=1; AKwUvBz/NiBW81yXQyUtV28h0kw+xw0WW4WoM08IE401UHOlhufoGthpax5wVAbelGJlvqvpO4b0NKUs4jMVjw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKT28uMUyk0u/bNgMXjjWVCcK77DOMoWf50Mh/1JFKR/8rOKz3V
	rsTSqUl3JhdUjMrXpFwz9A+9AKgYDuN7nqOYhqE1mbFTovzfS7l/8ePy
X-Gm-Gg: AYBFou3+uj1re3U7IQBPcRkieY/ZYE6MWI8c1gYqmbe8mnjJhXfG7Y1BjrnPMpEzjBf
	akBdSkCknajLI0t4fs7ohSEVWSgOfConesVmnbWutc4TfEsRlGd9OCRamIylfCk7X1kHgx+jDU/
	R7mfmJAJ8r2eQUAxP0N8DxQ40FTuQnnxf6t/HiRbZgCynR5wjk14YVBRtd355Q3mc/bXfim43VH
	4o8F/lZ6z4zr38+lv5UXjSMdqDJidjy1CIbI4MoM7gRGO5k2HXmWoSy957YjuQS3rja2IDkKtmo
	4e0VFueVGOtj9qbQGpJ9Ud9WZ/Kw6J8F1gR50hXyeOOI+2W4wnUxieee5qJqFo5Txiy44XtQxU0
	OuOmAuSSCKMXMPly8P4u9C3blQw0VuhMZBjM2VO8+rNbURpD8h4R40DRl6kyEk1vK2cckkUcPMT
	QnB/fPAJq7zImZH9OBS3RhERBeBgHRg1nlMl6uSMnoCdaiMMzQFgroe3ySDlCVH8822wiu3PP3F
	1GUl5ArJSF4x/EO3G1y49/KeiueDbdG3p9j61yDp2SVCtAmH0iHr6wNjKBjsfmCbnfw5cDbjXJw
	0AmKzQi0yQQO8XSenPpdyLSRi1Gb8OFXTg91hg==
X-Received: by 2002:a05:600c:8b85:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4ac122897a8mr112944805e9.0.1793419577347;
        Fri, 30 Oct 2026 21:06:17 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm171282185e9.2.2026.10.30.21.06.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 21:06:17 -0700 (PDT)
Date: Sat, 31 Oct 2026 05:06:03 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261031050603.6067d2e5.michal.pecio@gmail.com>
In-Reply-To: <20261029204324.658845-2-mathias.nyman@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 22:43:24 +0200, Mathias Nyman wrote:
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
> Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Tested-by: Dennis Wissel <dennis@dsine.de>
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
> 
>  v2 changes:
>  - rebase on usb-linus
>  - remove Assisted-by: LLM as suggested by latest checkpatch
> 
>  drivers/usb/host/xhci-ring.c | 73 ++++++++++++++++++++++++++++++------
>  drivers/usb/host/xhci.c      | 13 ++++---
>  2 files changed, 69 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index c23434001e9c..a1fa188680f5 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -65,6 +65,7 @@
>  static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
>  			 u32 field1, u32 field2,
>  			 u32 field3, u32 field4, bool command_must_succeed);
> +static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
>  
>  /*
>   * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
> @@ -962,6 +963,24 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
>  	}
>  }
>  
> +static void xhci_cancel_ring_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> +				 struct xhci_ring *ring, int td_status)
> +{
> +	struct xhci_td *tmp_td;
> +	struct xhci_td *td;
> +
> +	/* Add all TDs on ring to cancelled td list */
> +	list_for_each_entry_safe(td, tmp_td, &ring->td_list, td_list) {
> +		if (list_empty(&td->cancelled_td_list)) {
> +			list_add_tail(&td->cancelled_td_list,
> +				      &ep->cancelled_td_list);
> +			td->cancel_status = TD_DIRTY;
> +			if (!td->status)
> +				td->status = td_status;
> +		}
> +	}
> +}
> +
>  static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
>  				unsigned int ep_index, enum xhci_ep_reset_type reset_type)
>  {
> @@ -993,25 +1012,53 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  {
>  	struct xhci_port *rhub_port = ep->vdev->rhub_port;
>  	unsigned int slot_id = ep->vdev->slot_id;
> +	bool disconnected = false;
> +	struct xhci_ring *ring;
>  	int err;
>  
> -	/*
> -	 * Avoid resetting endpoint if link is inactive or device disconnected.
> -	 * Can cause host hang.
> -	 * Device will be reset to recover an inactive link, so don't do anything
> -	 */
> +	/* link is inactive or device disconnected */
>  	if (rhub_port->link_inactive || !rhub_port->connected) {
>  		ep->ep_state |= EP_DROP_PENDING;
> -		return -ENODEV;
> +		disconnected = true;
> +		if (!td && ep->ep_index != 0) {
> +			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
> +			return -ENODEV;
> +		}

The duplicate xhci_kill_endpoint_urbs() call wouldn't be necessary if
the later code which also calls it could handle this edge case.

(And my patch showed how 'disconnected' variable can be omitted too.)

>  	}
>  
> -	/* add td to cancelled list and let reset ep handler take care of it */
> -	if (reset_type == EP_HARD_RESET) {
> -		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
> +	/* Add halted td to cancelled list and let reset ep handler take care of it */
> +	if (reset_type == EP_HARD_RESET || disconnected) {
>  		if (td && list_empty(&td->cancelled_td_list)) {
>  			list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
>  			td->cancel_status = TD_HALTED;
> +			if (disconnected && !td->status)
> +				td->status = -EPROTO;

That's confusing (speaking from experience, heh). It could simply be

  if (reset_type == EP_SOFT_RESET)

because that's the only valid reason for td->status being 0 here.

> +		}
> +	}
> +
> +	/*
> +	 * Avoid resetting non-ep0 endpoints if link is inactive or device
> +	 * disconnected. Can cause host hang.
> +	 * Endpoints other than ep0 won't restart before the device is reset or
> +	 * the endpoint is dropped, so cancel all TDs, and give back non-ep0 TDs
> +	 * now instead of letting them time out. Ep0 can survive a short device
> +	 * disconnect during enumeration so reset ep0 normally and clean it up.

I don't think this is limited to enumeration. Indeed, probe() is not
enumeration. I see no reason why the same can't happen at any time.

> +	 */
> +	if (disconnected) {
> +		ring = td ? xhci_urb_to_transfer_ring(xhci, td->urb) : ep->ring;
> +		xhci_cancel_ring_tds(xhci, ep, ring, -ESHUTDOWN);

So that's why we bail out on (!td && ep->ep_index != 0) several lines
prior, to avoid NULL dereference. A bit complicated, this may work too:

  if (ring)
	xhci_cancel_ring_tds(...)

I think it's harmless that we could then call xhci_cancel_ring_tds()
and  xhci_process_cancelled_tds() on non-zero endpoints sometimes?
Stop EP handler also calls that stuff after setting EP_DROP_PENDING.

What Stop EP fails to do is giving back stranded URBs after setting
EP_DROP_PENDING. I have suggested how this can be done by simply
moving this code added here to elsewhere.

> +		if (ep->ep_index != 0) {
> +			xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect\n",
> +				 ep->ep_index, slot_id);
> +
> +			xhci_process_cancelled_tds(xhci, ep);
> +			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
> +			return -ENODEV;
>  		}
> +		/* hard-reset a halted disconnected ep0 */
> +		xhci_dbg(xhci, "Reset and clean up ep0 slot %u after disconnect\n",
> +			 slot_id);
> +		reset_type = EP_HARD_RESET;
>  	}
>  
>  	if (ep->ep_state & EP_HALTED) {
> @@ -1020,6 +1067,9 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  		return 0;
>  	}
>  
> +	if (reset_type == EP_HARD_RESET)
> +		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;

Wasted opportunity to place this after actually queuing the command,
which is the only place it really belongs.

> +
>  	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
>  	if (err)
>  		return err;
> @@ -1070,8 +1120,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
>  			continue;
>  		}
>  
> -		/* device disconnected or link error, ep will be dropped */
> -		if (ep->ep_state & EP_DROP_PENDING) {
> +		/* device disconnected or link error, non-ep0 endpoints will be dropped */
> +		if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
> +			td_to_noop(xhci, ep, td, false);
>  			td->cancel_status = TD_CLEARED;
>  			continue;

I don't like this growth of special cases and duplication in the big
loop over cancelled_td_list. Although my attempt at eliminting it did
have an issue, there has to be a better way...

>  		}
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b..b50a582be1fb 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
>  
> -	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
> -		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
> -		ret = -ENODEV;
> -		goto free_priv;
> -	}
> -
>  	if (xhci->xhc_state & XHCI_STATE_DYING) {
>  		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host.\n",
>  			 urb->ep->desc.bEndpointAddress, urb);
> @@ -1680,6 +1674,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  
>  	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
>  
> +	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
> +	    *ep_state & EP_DROP_PENDING) {

Actually, what was the purpose of 'link_active' and 'connected' being
two separate flags? It seems everything treats them the same (modulo
negation), except here.

And here it doesn't matter either, right? You haven't added 'connected'
because EP_DROP_PENDING is the only one needed for correctness, and
'link_inactive' is merely an optimization to avoid queuing URBs which
will be thrown out later, preserved because it was already there.

Or at least that's what it seems, in absence of any explanation.

> +		xhci_dbg(xhci, "Can't queue urb, port disconnect or link inactive\n");
> +		ret = -ENODEV;
> +		goto free_priv;
> +	}
> +
>  	if (*ep_state & (EP_GETTING_STREAMS | EP_GETTING_NO_STREAMS)) {
>  		xhci_warn(xhci, "WARN: Can't enqueue URB, ep in streams transition state %x\n",
>  			  *ep_state);
> -- 
> 2.43.0
> 
