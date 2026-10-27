Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128922;
	b=m47V7FDBOjdgXH5LRFkIs839xSskRhK2poSd5sz2zrNJGUAR55KMFhjesjHSOy8ofBVc
	 tb+y+hDWMJeZfS8PIEg6S5pWSopgcnOq25VfgtmT40qxwkWsr6FYxokv8y4YA4RR5j6m7
	 ocfTR7Nz4TObP018zOn0RNN44gz1cHiiOZReaU8lMwEIFiaxZT3Wk4hqh5MpFrBu0XaaU
	 vYrt7Q3miXNB9sMTLcFyGLvfB0aGGLOGbnn1ftGfMNFd5PJMEA28po2oS45kidJfx3DwF
	 edOjNwQUlJW93kojVWanN6ZQlU+wWDKWNnuhD2LWsrAu8rznAanyTkI4PBbX2yhMCjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128922;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V0o2MwoTm1a+uK5cXDvIGjvEsu8ErE5O+nL6S7q9SXA=;
	b=BcoyNH2Rm5rG+/UeY35/xeH8HeukdiiYXyu+Sj3koNXmaOzKOlZC5ZmgwSmu5ydhGFKM
	 0QGu2mCaBBVL71tKuDLdFgxmOXH1JKHNm6OlE8tqGWu8X9GDxPUaBHJmhSfKvwZYMyvdO
	 chVjhqFaB9m99TOGJuYiBI829kOmGc4aWHtpTKZSxF5aH78sOz4xqzbd+WB4hojS3vQeV
	 NMYtUVojIoLfewsLeIJPBVWjdYobsSne+DBe3DhXpxNxJ8OnLsibnexRKCy84tLFqWbwN
	 nnGzB9QHqmLhdbz4SQ6AtIRHReTR2gT30A1nLJNglaGKVPSBJ8nGgNQVbpSrgM2jdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyMJMWUU;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1A606A31E
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 19:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyMJMWUU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793128922; x=1824664922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VXeBeakhswHVta8Zt4aCwkj7yG5QX5bhs9hi25tHbRM=;
  b=eyMJMWUU+Mk2SVy5AZvR+bh6PU3rhJ44NkV3GcwXfi5MW+FztrqxV1v1
   fO7swRqqVNYBWPIzaRzKJo3zoj/ryow5FOvt+ZQ7H2HTr5BZoiU8Q9jwj
   Ug3bGDf62l/nfGk55uAWMcIbSa23uqURw5sJPWOADvB6GMgE7rTRCuNmS
   g0azLcojYktDqItvtvual4+g45mhbNHQuMQi3bw3HGVO4Nv66JZYfikqO
   T25B0FQ8KVnDAW5tEd8+GarWgi1WbsEUhSlvV6q84BJ/m4xuJb5sbk8CS
   gjJqw+0nzVYw0Zi+e3QwGMrcnPNc8UtmKg0qvMQmPYNKaxW5fR6PdYVFZ
   A==;
X-CSE-ConnectionGUID: zffmmvJPSG6QCb4T4Ab9ug==
X-CSE-MsgGUID: A8M4VoalTUCZDX2UeYDasw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1863756"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1863756"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:22:02 -0700
X-CSE-ConnectionGUID: 8plDceJkT+eCl0bukx9Iiw==
X-CSE-MsgGUID: tL2AF65oSlS/0DsjUoj+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579913"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:21:58 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: yiyu@yiyuzhou.io
Cc: <linux-usb@vger.kernel.org>,
	regressions@lists.linux.dev,
	diogochaves@me.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com,
	dennis@dsine.de,
	gregkh@linuxfoundation.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 1/2] xhci: give back all TDs when skipping endpoint reset after disconnect
Date: Tue, 27 Oct 2026 21:21:26 +0200
Message-ID: <20261027192128.386082-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit

From: Yiyu Zhou <yiyu@yiyuzhou.io>

Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
disconnect") makes xhci_handle_halted_endpoint() return early when the
root port is disconnected, and commit 7e0ef4332ed9 ("xhci: avoid xHC
endpoint changes after disconnect or link error.") also sets
EP_DROP_PENDING there, which keeps the doorbell from being rung until
the device is reset.

The callers rely on xhci_handle_halted_endpoint() to take over the
halted TD.  For example, finish_td() returns right after calling it,
expecting the TD to be given back once the Reset Endpoint command
completes.  With the early return, nobody gives the TD back.  Its URB
stays pending until the submitter times out and unlinks it.  URBs
queued behind it are stuck the same way, and every URB queued on the
endpoint afterwards never starts, because the doorbell is blocked, and
also has to time out.

Devices that disconnect and reconnect themselves during enumeration hit
this.  A PFU HHKB Professional HYBRID Type-S keyboard (04fe:0021) drops
off the bus about 300 ms after its first enumeration, while usbhid is
still probing its third interface.  The probe runs in hub_wq, so the
disconnect is not handled until the probe returns.  On a root port the
HID descriptor request and its four retries in hid_get_class_descriptor()
each wait for the full 5 second USB_CTRL_GET_TIMEOUT:

  [57685.006036] usb 3-2: new full-speed USB device number 24 using xhci_hcd
  ...
  [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on usb-0000:00:14.0-2/input1
  [57711.221083] usbhid 3-2:1.2: can't add hid device: -110
  [57711.221613] usbhid 3-2:1.2: probe with driver usbhid failed with error -110
  [57711.221842] usb 3-2: USB disconnect, device number 24

The re-enumeration that follows can stall the same way, leaving the
keyboard dead until reboot.  Behind an external hub, where the root
port stays connected, the same keyboard recovers in about 300 ms, as it
did on the root port before these commits.

Keep skipping Reset Endpoint on a disconnected or inactive port, but
give back the halted TD right away, with -EPROTO if no error status was
set yet, and all other TDs on the endpoint with -ESHUTDOWN.  The
endpoint is not restarted until the device is reset or dropped, so the
ring dequeue pointer can stay where it is, as
xhci_invalidate_cancelled_tds() already assumes for cancelled TDs on
such endpoints.  Also refuse new URBs on an endpoint with
EP_DROP_PENDING set, like xhci_urb_enqueue() already does for an
inactive link, so they fail right away instead of timing out.

[mn: merge EP_DROP_PENDING and link_inactive checks in xhci_urb_enqueue()]

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
Assisted-by: LLM
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Tested-by: Diogo Chaves <diogochaves@me.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++++++--
 drivers/usb/host/xhci.c      | 13 +++++++------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..8262ed516d37 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -65,6 +65,7 @@
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
 
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
@@ -989,12 +990,19 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
+	 * Avoid resetting endpoint if link is inactive or device disconnected.
 	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
+	 * The endpoint won't restart before the device is reset or the endpoint
+	 * dropped, so give back all its TDs now instead of letting them time out.
 	 */
 	if (rhub_port->link_inactive || !rhub_port->connected) {
+		xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect or link error\n",
+			 ep->ep_index, slot_id);
 		ep->ep_state |= EP_DROP_PENDING;
+		if (td)
+			xhci_td_cleanup(xhci, td, xhci_urb_to_transfer_ring(xhci, td->urb),
+					td->status ?: -EPROTO);
+		xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
 		return -ENODEV;
 	}
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 7f7babe9d681..fa3012bf4c0f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
-	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
-		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
-		ret = -ENODEV;
-		goto free_priv;
-	}
-
 	if (xhci->xhc_state & XHCI_STATE_DYING) {
 		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host.\n",
 			 urb->ep->desc.bEndpointAddress, urb);
@@ -1680,6 +1674,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
 
+	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
+	    *ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Can't queue urb, port disconnect or link inactive\n");
+		ret = -ENODEV;
+		goto free_priv;
+	}
+
 	if (*ep_state & (EP_GETTING_STREAMS | EP_GETTING_NO_STREAMS)) {
 		xhci_warn(xhci, "WARN: Can't enqueue URB, ep in streams transition state %x\n",
 			  *ep_state);
-- 
2.43.0

