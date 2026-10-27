Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128924;
	b=XBc5GlJmW9E5AD/zyMwlI98PPIJA0zoZJ1bAoLOuIl2n6eqTUg+iJfMGY+4dW7XEvHJ4
	 JVkurfhB1X73MKUp+3xs5tuzmxkNjtFy0O5qFOyQFmfJ3VMJViK1bdeueWvAZAD0uHv2A
	 fFZ881c0ZvcK+Og1k35vlu3M53m1K/lEVUzE3nacSJ2OaAysutrht1rhjIllqbte3HfKB
	 KC0y5YIhlnmIvA0b4cD43j+rvJ24g1oRUbNErbXm4QeFxXJrcGtwYBtfm+YucMJ3pSJer
	 ECRuIbSjXQLNouAOPOYu74rFiwrhPcN87bJCFhnlSMVVq5g1VHJBOZoq/SgUTISsGWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128924;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AMSWH/NtlB1JV0soze3pL+1vMXta5z3J7fxij/8nbDU=;
	b=FhahlL//IXDQSZdk5ChkJMEoGSFW2SPvIA1QaHO1Vz9cT12gyiJWdKC3rs+SlHkUNedX
	 QK8aO0uNk+Lvmr0nB8F7hmrWkexUseicAu8bTdEoT34dIRDjb915zO6co0eOt616mUuqd
	 piEUdyRfLPr/GKdYYNvOYdTvTnoSB4n5z31ves3x2O0p/JV9OVLk03f+7CNfTYo/GuZ9b
	 Wpk34Kd+r5lmzEUlw+gNraq4+DRsFYoCSWN66K1XsIW+im59adwg/2PTzhZ8s3ZN4y0Gd
	 YDrdQCpCm200sqIFaj1h8e54KGrRXcxoxP37nwhh/AlcAh6FG/e2MPIKlFGGdnEVvJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iuksdKNf;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6A2606A31E
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 19:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iuksdKNf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793128924; x=1824664924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+NYQ+LQbOpmnltFCDNUfHOAtoK8t2uuSLCm4y8YRmow=;
  b=iuksdKNfAOX9YWNLGXcPxcEJsaQEGwfBZRMo5e2F0aqDlP5KmA9D1U8G
   pCaKYsW5ttEd2bB5PNye2nZ8oHzAjixwW+xSrpeL47RAwcLh5I1FyFYkH
   FpRSs8fGDYuCdZ10s+F2YxDwThO6BdhDnW4A4oq96IRdHs8zR1R0QtFb2
   FUV1g6xIFq4AgnLwRrmvuTCcUel5v2uZpvei1BlhtAJ3EBGveXKtzv4rU
   zeFxP4a8/su+QoInDiOgaerGaSnReZVO204IpXrbiHYgY+xxwHzMefj4V
   Cx5aT2Smk/v80uN/+H5M92xUQzJG140S5MfAckfTuPNppyhce5F1jB172
   w==;
X-CSE-ConnectionGUID: Qh6mwrPDSyi/tcXkFW7I5w==
X-CSE-MsgGUID: GEHOHK3hTgKxO4akmRUvbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1863768"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1863768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:22:04 -0700
X-CSE-ConnectionGUID: S8in08JgTSOwVUzl7kXApQ==
X-CSE-MsgGUID: fJ6gp9QdTweR1rPEW88BWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579915"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:22:01 -0700
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
Subject: [RFT PATCH 2/2] xhci: clean up ep0 ring after disconnect instead of leaving stale TRBs
Date: Tue, 27 Oct 2026 21:21:27 +0200
Message-ID: <20261027192128.386082-3-mathias.nyman@linux.intel.com>
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

Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
disconnect") and commit 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes
after disconnect or link error.") skip endpoint recovery if the root port
is disconnected or the link is inactive, and set EP_DROP_PENDING to keep
the endpoint stopped. TDs are given back without moving the endpoint
dequeue pointer, or turning the TRBs into no-ops, assuming the endpoint
will soon be dropped and its ring freed.

This assumption doesn't hold for the default control endpoint. If a
USB 2 device briefly disconnects during a port reset in enumeration, the
hub driver retries the reset and keeps the same usb_device, and the
xhci ep0 ring stays in use. The given back TRBs remain on the ring
between the xHC dequeue pointer and the enqueue pointer.

Reset Device fails with a context state error if the slot is in default
state, and Address Device with BSR=1 is skipped for a slot already in
default state. In this case nothing moves the ep0 dequeue pointer before
the next enumeration attempt. xHC may then process TRBs of already given
back URBs, writing data into buffers that may already be freed, or ep0
remains halted and the next control transfer times out.

Handle a halted ep0 on a disconnected port by cancelling all its TDs and
resetting it normally. The Reset Endpoint handler turns the cancelled TDs
into no-ops and issues a Set TR Dequeue Pointer command to move past
them, flushing any cached TRBs, before the TDs are given back. ep0 is
left stopped. It is not restarted while EP_DROP_PENDING is set, so the
reset, restart and stop sequence that caused the xHC to fail Stop
Endpoint commands is still avoided.

Other endpoints are still given back directly without resetting them,
but their TRBs are now turned into no-ops first. The halted TD is given
back with -EPROTO if no error status was set yet, and other TDs with
-ESHUTDOWN.

Commit message written with LLM help, code is still organic

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Assisted-by: LLM
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 77 +++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8262ed516d37..fdc02e7d937a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -956,6 +956,24 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
 	}
 }
 
+static void xhci_cancel_ring_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+				 struct xhci_ring *ring, int td_status)
+{
+	struct xhci_td *tmp_td = NULL;
+	struct xhci_td *td = NULL;
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
@@ -987,40 +1005,62 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 {
 	struct xhci_port *rhub_port = ep->vdev->rhub_port;
 	unsigned int slot_id = ep->vdev->slot_id;
+	bool disconnected = false;
+	struct xhci_ring *ring;
 	int err;
 
-	/*
-	 * Avoid resetting endpoint if link is inactive or device disconnected.
-	 * Can cause host hang.
-	 * The endpoint won't restart before the device is reset or the endpoint
-	 * dropped, so give back all its TDs now instead of letting them time out.
-	 */
+	/* link is inactive or device disconnected */
 	if (rhub_port->link_inactive || !rhub_port->connected) {
-		xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect or link error\n",
-			 ep->ep_index, slot_id);
 		ep->ep_state |= EP_DROP_PENDING;
-		if (td)
-			xhci_td_cleanup(xhci, td, xhci_urb_to_transfer_ring(xhci, td->urb),
-					td->status ?: -EPROTO);
-		xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
-		return -ENODEV;
+		disconnected = true;
+		if (!td) {
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
 		}
 	}
 
+	/*
+	 * Avoid resetting non-ep0 endpoints if link is inactive or device
+	 * disconnected. Can cause host hang.
+	 * Endpoints other than ep0 won't restart before the device is reset or
+	 * the endpoint is dropped, so cancel all TDs, and give back non-ep0 TDs
+	 * now instead of letting them time out. Ep0 can survive a short device
+	 * disconnect during enumeration so reset ep0 normally and clean it up.
+	 */
+	if (disconnected) {
+		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
+		xhci_cancel_ring_tds(xhci, ep, ring, -ESHUTDOWN);
+		if (ep->ep_index != 0) {
+			xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect\n",
+				 ep->ep_index, slot_id);
+
+			xhci_process_cancelled_tds(xhci, ep);
+			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
+			return -ENODEV;
+		}
+		/* hard-reset a halted disconnected ep0 */
+		reset_type = EP_HARD_RESET;
+	}
+
 	if (ep->ep_state & EP_HALTED) {
 		xhci_dbg(xhci, "Reset ep command for ep_index %d already pending\n",
 			 ep->ep_index);
 		return 0;
 	}
 
+	if (reset_type == EP_HARD_RESET)
+		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
@@ -1071,8 +1111,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
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
-- 
2.43.0

