Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171270;
	b=n5GuVcOE30w5ynwcBKR9o/beXYiS2N7GeYW2bSw4ewgGhBgWhlgIFpJ0Hi6fFoF4os8i
	 XSXRBkrj7+vhSjJwpYad1J9wEUMHMaPAaQa2wsrCR2QVWvZ5ZbOCrgLsr10WJN8NAnEyk
	 XeDM8YwPl34xwk9RzcGtjPR7LWNRg0nloF8vKNgHsSVTHP8DY5CTX4xCF9D6MtZJLAdx7
	 RUiD86S8hEm5bML6qKBLzpn5/S79vZPLvD2n8VyywSUDChbO8PIemA6oq5kxVvwVPEnRx
	 RYr4iLX2K8bke9XelIGnaxwJcnlYYvsxzn3Ehq+BcAadZNwqKu1K9Gum0nIpQNZYL6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
	b=0Rw/ALsvK324dRpg80sfxO1wGbSxHerdjca+tYuJNvIQKNbbpmnjf6VJ7H43bSI39FXS
	 Wwmcs9TqpyiCWVopnb3Eeb8aw+hKRM3lr0nhHitBdXYEiVj4ZT/3lEZGuIEIkCD9/jgdb
	 Ahm45O/9Ow3YS2inEGdAA7cpq75WdqgeH0qPgpDLTgW6q9Pbv/jYHd8yULEmpPLY+Uagj
	 397SxUA4XJu1sGcoXvSy6LQ9QIVJl3H/GuntBvIDUtwVmI2Ev49CX7PSZfyqXGbg+ya/c
	 /XOFf4ID2dHHRo0aX6hjge7dsdo1aP0krK+y7c1ctq5zONVOuuWdVaMSb+BauDOLERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qq4YDQ6p;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DF606A31D
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 07:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qq4YDQ6p
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e4831c028so501246f8f.0
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 00:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793171269; x=1793776069; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
        b=qq4YDQ6peNJOT+j3oC8DZjnvkWG0yiJ5+ntZssWWncUNZ4N8vMi8SvIeQ/VDhtOTOC
         Z5OUQukqwi6e6lKPWfvu8K4Ww2NUc7sS3FA0EehMdDmjCAScXJ0WtXgPiNYNFbTGL+bV
         rlQzofINvPPNvmaEMf4SuVPicRuoOGM0Sy06xFL0SUlbpH+6fj6zrxYjuBq6RXnabzYj
         DM9C0G6Yw+FxrBa7bGxZ4MGemeSQPFa3KshKERP9ib35C3O5f4pT87dW0gwnB9U1AJrq
         Frt0/aU/9zFl+4RVlzhuPMCYcGpEx89xoREC+9LeM3e34jnkZt0PNPaCZphVRtth8Rhs
         92tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171269; x=1793776069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
        b=aFEfpQ9iHwurvrSnxZYjdCvsb5hJKYwut6UoGYftxrs+OAo/vBphi+v4BiYOmgoQQl
         5e6h7OVbL9fyAt7xK5+jZ524nqfi1CUYx96M6VfH5WbZE5Lw7moML4iXSod4WoXdWw3u
         qzvw6q5wuUW5BMEWgnBtI6DGeF71niPUTTLYzbaYAE5GvlP3xoCTPezbfg5w3mWMLpy4
         1HXMGQlDxpzjG6qdT5qytESg6Sz5k6K5qzicJjBGHdSZQKzP3qe4lrSP0cjOHs6yQfXY
         h7o+zN5B02LkPv/bb/Vud8AfPlPr4Hgs34+lV6BA6CRIbKPmW6w2o+atP52kun8sHvXC
         Jk8A==
X-Forwarded-Encrypted: i=1; AKwUvBybcEG9HhDJXzQX/X+nvGTLBzraMeZ+IzMNkav6rDj8j8jwtdwSwfOe2qzpgUFV9cY8I1Hd0pFOn1hnAg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJcFXaSaqS2faYHfylDbxzgQ/7yMhz9MsHoCSWIBCtTEU0g0JT
	IS6W6wa3dTmnK5cHZd9dPmbYd6Vx/iZWpEtioJP70TFyhM6SNWV0MGMV
X-Gm-Gg: AYBFou2uBnnSg9ghzpSO7Tkl0ebvgXSFpDBxTRF/GdYaxHlGptdqgjreNoIXvVSwOFz
	VNzAvw5TVSfAWI+t5GWKFyIlKu2RldiPkNTxmA4ut/t78dViAQ7vPxtYRn7e/goavUxfnw3qhXt
	h0J+ENUUile8f/buz/JnRiT8tkTq4hk/YyOkAF602JtVgiWYmNLuMqvMCJW2ZXfN0hqnLjBJYKZ
	3h1K+geLK3WnU59udYODB5kJR4do2fJSILIjZSLhTCgEL1NpjUUQ6VGtz74mZrXpc9NyqnzMw7q
	F/VMxmJ/ftigKxVtppPDBQmv0WNTF/y94L5Gj2KFrFkRNbE6aAmGwScoYmq4ul1+njr+jAAB/6G
	QdKAuAT8jvezRXgAQifIN9oBebZVCywot3tgorrYb01oovhU8Zr3v40r0l6b5+DUdaKZ/fl3tM6
	XQETgV9e/crj3dt75Gb+1kH0M1laeqnsmt8avfFlhkqMlnw9rTTgAVLutjPJL6X4reaeLauaUvt
	kWuxa6amSmANtaICQqeIslanuHDl92vvFWpjEWTHcpEWqGgrmQGl4sm/m1OKcw1UL1bAjTPCQIP
	XwswY22gvQgQP3FWSzqzVDRSBoQadkdGldVIcw==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr3824012f8f.54.1793171268566;
        Wed, 28 Oct 2026 00:07:48 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm26280670f8f.6.2026.10.28.00.07.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 00:07:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:07:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect
 detect
Message-ID: <20261028080734.173da0e4.michal.pecio@gmail.com>
In-Reply-To: <20261027192128.386082-1-mathias.nyman@linux.intel.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
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

On Tue, 27 Oct 2026 21:21:25 +0200, Mathias Nyman wrote:
> Yiyu Zhou wrote PATCH 1/2, fixing a regression in USB HID device
> enumeration caused by the endpoint recovery prevention code added in
> v7.3-rc1. Some HID devices that used to enumerate after a brief
> disconnect during enumeration now got stuck until URBs timed out.
> 
> PATCH 1/2 gives back the pending URBs right away, which solves most of
> the problem, but it leaves the TRBs of the given back URBs on the ep0
> ring. ep0 survives a brief disconnect during a port reset, so the xHC
> may later process those TRBs during an enumeration retry, writing into
> buffers that were already given back, or ep0 stays halted and the next
> control transfer times out.
> 
> PATCH 2/2 cleans up the ep0 ring by resetting ep0 and moving its
> dequeue pointer past the cancelled TDs, even if a disconnect or link
> error is detected. Only Reset Endpoint and Set TR Dequeue Pointer
> commands are issued; ep0 is not restarted while the disconnect is
> pending. The rapid endpoint reset, restart and stop sequence that made
> some xHC hosts fail Stop Endpoint commands is still avoided. Other
> endpoints are still given back without resetting them, but their TRBs
> are turned into no-ops first.
> 
> If you have seen the HID enumeration issue, or the xHC Stop Endpoint
> failures with rapid endpoint state changes, testing these two patches
> would be greatly appreciated.
> 
> If these patches work, they might be squashed into one before going
> upstream.

Might? :)

1/2 is a possibly dangereous regression and shouldn't be used alone.

Anyway, I think it all can be done with a bit less code, while also
handling disconnection during unlink. Particularly on EP0, multiple
URBs may be submitted by different drivers and/or userspace. Just
because one of them unlinks its URB doesn't mean that the others are
aware of anything being wrong and won't stall for <N> seconds.

This below is a rudimentarily tested RFC but it seems to work. It's
simple enough that hopefully it might even be correct. I will test it
more and write a changelog later today if there are no objections.

I tweaked the logic to return everything with -ESHUTDOWN and not
bother to assign proper status to the URB which halted. Intuition:
we want them to give up, not call clear_halt() or reset_device().

---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fa6684746305..b37056cb8576 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -987,14 +987,11 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
-	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
+	 * Mark endpoints behind disconnected or SS.Inactive root hub ports.
+	 * Restarting them is futile and known to triggers HC bugs on USB3.
 	 */
-	if (rhub_port->link_inactive || !rhub_port->connected) {
+	if (rhub_port->link_inactive || !rhub_port->connected)
 		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
-	}
 
 	/* add td to cancelled list and let reset ep handler take care of it */
 	if (reset_type == EP_HARD_RESET) {
@@ -1011,6 +1008,12 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/* Don't reset lost endpoints, only EP0 can survive device reset */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index) {
+		xhci_process_cancelled_tds(xhci, ep);
+		return 0;
+	}
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
@@ -1022,6 +1025,9 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	return 0;
 }
 
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
+
+
 /*
  * Fix up the ep ring first, so HW stops executing cancelled TDs.
  * We have the xHCI lock, so nothing can modify this list until we drop it.
@@ -1047,6 +1053,22 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
+	if (ep->ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Nuking dead slot %d ep %d\n", ep->vdev->slot_id, ep->ep_index);
+		if (ep->ep_index) {
+			xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);
+			return 0;
+		}
+		/* EP0 may be reused after device reset, clean up the ring properly */
+		list_for_each_entry(td, &ep->ring->td_list, td_list) {
+			td->status = -ESHUTDOWN;
+			if (list_empty(&td->cancelled_td_list)) {
+				list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
+				td->cancel_status = TD_DIRTY;	// for clarity, it's redundant
+			}
+		}
+	}
+
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
@@ -1061,12 +1083,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 			continue;
 		}
 
-		/* device disconnected or link error, ep will be dropped */
-		if (ep->ep_state & EP_DROP_PENDING) {
-			td->cancel_status = TD_CLEARED;
-			continue;
-		}
-
 		/*
 		 * If a ring stopped on the TD we need to cancel then we have to
 		 * move the xHC endpoint ring dequeue pointer past this TD.



