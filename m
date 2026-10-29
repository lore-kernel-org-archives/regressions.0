Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306617;
	b=4MDu5xuE6sphxlgcX8kviscKld9tJPSnUmiA2/gRuYbz58nQTo/D4wEIgteSWLstHwHL
	 y/hmnIO9jdPCANSw6f77iOeUuRYnkK3IFzUPN2G4RGeCE1oPZP3wG0tyky1pi2e+Ai5mS
	 oH8+0esxIJD1/Z8PgSJpDDrNDafGRFXN0PUYow4jdyOtXdmI1Q5F/bIlkz1xbTTX/FbBh
	 vd7z+1C4C9Or2QwofVObRXKPgZ4IU8xzBE1MljqBjHYxu/ddZ8XL2i1VniPlV5EMxoMop
	 srHzdDwVWFujAn/5/WQAjt9Bpy2rofyQabbat4N9MwjeComSgv2KPuv8qCoMgq9cWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c6b4Qtq+bNR0rF++KTcCnd8ayRIaioB8/rOswk1DNdg=;
	b=BcRQ8WVob1TXzNxJXGTYLE36aaTcTUxYHgGkvAr5J8aM5yCY4Tz5uxWygkU3PpQSYiEF
	 v/hPKUlFOXKTzxS+BLWO1XHPdLoeTYzw6Za16UeJV0bd4wjYv4vDVVSvLWYT2oVXSqkrt
	 2XFw3xbq73g/sJelNMxXQ5G18kw5kT3p6fv9onfcfWeqic/233BtT5DwQAahoD7oKPuyx
	 TOjXY4W/+tiV8mtT4thuB5roZip1N9rgvdk9vN1irIg4YroBER2ber0CEVKbhQc5tS6+s
	 PmlskEiC8z2geAqPWZCu+pvhdOV15ARvIz013jasJ36dCpUyK2QZiE2BA1U27OPls4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T3MRb1CM;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633F606A31C
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 20:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1633F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T3MRb1CM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793306616; x=1824842616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4pYAZ2i1g+CguPEstEC+bYebTm5aKWvzJjX844x4ssQ=;
  b=T3MRb1CM/F3hxD8g+GFOOTl5vyUYmH2VILzHMTtwQlPcxbtTiNMH47oF
   Hy98wcUxS22DdH67hbPNMtl/vQB9adKOWm2EONKw1X2cvoDUQU/4kEteW
   CXmJRgixvGP3+6QYENUlAVkbdPQR5OkGeXnIzG9UAe7axMJxjOewh0ZCx
   79Xn/Z16pJygi77qwU2KfhPwrU3js3U5XFMiALVXQX4md9N5UAYAM6yWb
   krct9abKOQKR6+A8osUSYyQBq9lPGSIxtgCUpBkRgjV3Y6V73IRYNwOwN
   wQychS33/Q/VYWCPj7v/5wymrm65GnUV5FViDDaEXY3gNrD0QVh36ZWG0
   g==;
X-CSE-ConnectionGUID: biOrETatQiuBlQPiRj1Dcw==
X-CSE-MsgGUID: 7U8zVtYOQQWu7wUiuLVhWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2053639"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2053639"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:43:35 -0700
X-CSE-ConnectionGUID: /Y8xDStpRDmj7H6DZHu1Tg==
X-CSE-MsgGUID: NR0kPU8mQDigvCUyDz618Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5162382"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:43:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	regressions@lists.linux.dev,
	michal.pecio@gmail.com,
	Yiyu Zhou <yiyu@yiyuzhou.io>,
	Dennis Wissel <dennis@dsine.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2] xhci: give back TDs and clean up ep0 after disconnect
Date: Thu, 29 Oct 2026 22:43:23 +0200
Message-ID: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix a regression in v7.3 introduced by the commits in the Fixes tags.
Those patches avoid endpoint recovery and rapid state changes after
the root port link is lost.

This caused a regression in device enumeration.

It turns out that a subset of USB HID devices briefly disconnect during
enumeration. USB core manages to resuscitate these devices without
reallocating them, and thus continue using the same udev, xhci vdev and
default control endpoint (ep0) of the device.
xhci didn't give back or clean up halted TDs behind disconnected ports
as it assumed that the disconnect cancels all URBs, and drops and frees
all endpoints.

This is not the case, so cancel and give back TDs on halted endpoint
behind disconnected ports, make sure ep0 is cleared and in a proper state
to continue working even after a link error or disconnect is detected.
Also prevent new URBs until device is reset.

One issue related to the TDs not being given back was seen on a PFU
HHKB Professional HYBRID Type-S keyboard (04fe:0021).
It drops off the bus about 300 ms after its first enumeration, while
usbhid is still probing its third interface. The probe runs in hub_wq,
so the disconnect is not handled until the probe returns.
On a root port the HID descriptor request and its four retries in
hid_get_class_descriptor() each wait for the full 5 second
USB_CTRL_GET_TIMEOUT:

  [57685.006036] usb 3-2: new full-speed USB device number 24 using xhci_hcd
  ...
  [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on usb-0000:00:14.0-2/input1
  [57711.221083] usbhid 3-2:1.2: can't add hid device: -110
  [57711.221613] usbhid 3-2:1.2: probe with driver usbhid failed with error -110
  [57711.221842] usb 3-2: USB disconnect, device number 24

[mn: merge EP_DROP_PENDING and link_inactive checks in xhci_urb_enqueue(),
 return TDs and clean up ep0 on disconnect, rewrite commit message]

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/
Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Tested-by: Dennis Wissel <dennis@dsine.de>
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---

 v2 changes:
 - rebase on usb-linus
 - remove Assisted-by: LLM as suggested by latest checkpatch

 drivers/usb/host/xhci-ring.c | 73 ++++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      | 13 ++++---
 2 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c23434001e9c..a1fa188680f5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -65,6 +65,7 @@
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
 
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
@@ -962,6 +963,24 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
 	}
 }
 
+static void xhci_cancel_ring_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+				 struct xhci_ring *ring, int td_status)
+{
+	struct xhci_td *tmp_td;
+	struct xhci_td *td;
+
+	/* Add all TDs on ring to cancelled td list */
+	list_for_each_entry_safe(td, tmp_td, &ring->td_list, td_list) {
+		if (list_empty(&td->cancelled_td_list)) {
+			list_add_tail(&td->cancelled_td_list,
+				      &ep->cancelled_td_list);
+			td->cancel_status = TD_DIRTY;
+			if (!td->status)
+				td->status = td_status;
+		}
+	}
+}
+
 static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 				unsigned int ep_index, enum xhci_ep_reset_type reset_type)
 {
@@ -993,25 +1012,53 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 {
 	struct xhci_port *rhub_port = ep->vdev->rhub_port;
 	unsigned int slot_id = ep->vdev->slot_id;
+	bool disconnected = false;
+	struct xhci_ring *ring;
 	int err;
 
-	/*
-	 * Avoid resetting endpoint if link is inactive or device disconnected.
-	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
-	 */
+	/* link is inactive or device disconnected */
 	if (rhub_port->link_inactive || !rhub_port->connected) {
 		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
+		disconnected = true;
+		if (!td && ep->ep_index != 0) {
+			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
+			return -ENODEV;
+		}
 	}
 
-	/* add td to cancelled list and let reset ep handler take care of it */
-	if (reset_type == EP_HARD_RESET) {
-		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
+	/* Add halted td to cancelled list and let reset ep handler take care of it */
+	if (reset_type == EP_HARD_RESET || disconnected) {
 		if (td && list_empty(&td->cancelled_td_list)) {
 			list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
 			td->cancel_status = TD_HALTED;
+			if (disconnected && !td->status)
+				td->status = -EPROTO;
+		}
+	}
+
+	/*
+	 * Avoid resetting non-ep0 endpoints if link is inactive or device
+	 * disconnected. Can cause host hang.
+	 * Endpoints other than ep0 won't restart before the device is reset or
+	 * the endpoint is dropped, so cancel all TDs, and give back non-ep0 TDs
+	 * now instead of letting them time out. Ep0 can survive a short device
+	 * disconnect during enumeration so reset ep0 normally and clean it up.
+	 */
+	if (disconnected) {
+		ring = td ? xhci_urb_to_transfer_ring(xhci, td->urb) : ep->ring;
+		xhci_cancel_ring_tds(xhci, ep, ring, -ESHUTDOWN);
+		if (ep->ep_index != 0) {
+			xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect\n",
+				 ep->ep_index, slot_id);
+
+			xhci_process_cancelled_tds(xhci, ep);
+			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
+			return -ENODEV;
 		}
+		/* hard-reset a halted disconnected ep0 */
+		xhci_dbg(xhci, "Reset and clean up ep0 slot %u after disconnect\n",
+			 slot_id);
+		reset_type = EP_HARD_RESET;
 	}
 
 	if (ep->ep_state & EP_HALTED) {
@@ -1020,6 +1067,9 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	if (reset_type == EP_HARD_RESET)
+		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
@@ -1070,8 +1120,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 			continue;
 		}
 
-		/* device disconnected or link error, ep will be dropped */
-		if (ep->ep_state & EP_DROP_PENDING) {
+		/* device disconnected or link error, non-ep0 endpoints will be dropped */
+		if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
+			td_to_noop(xhci, ep, td, false);
 			td->cancel_status = TD_CLEARED;
 			continue;
 		}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 30ac1bc4559b..b50a582be1fb 100644
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

