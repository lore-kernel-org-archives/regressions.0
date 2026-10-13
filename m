Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E23396D0D
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877203; cv=pass; b=FF2y9DGvl+SNl9NLk0JK4ek9DylO6+uTUcmzIodlA/K/o6wykF4Y7LRI1Dcfet3gEvBZajFKp9fcdLwJ2UMM0FVn6GJJzdlbVY3Ooi2ee0Xq3m48Wf6BPg1jAlPrDRvEGl6W24lU1rZXCBxqgME3z+YpM3sJs66kd+oILa5QMq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877203; c=relaxed/simple;
	bh=C6R0FvNs4Muz/Fs6mv8BRsYn2ZxwygYF0MoghLOvXhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epAER7V0DqqbcsUQ9aXZkt8FM81PlscSpSb0nmgUgo6ckfvpKs449Wwd60QpFcB1fLRjNKmUCDbapHyo+pulbiCkYKRcQLgzU8ZCaOMb5LuITaO11fydtz8Os7KQ1LmM8A9aodbfVZfNYkMAP8J9gsrc9HHqBla/tNzs8j1OmYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io; spf=pass smtp.mailfrom=yiyuzhou.io; dkim=fail (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b=EEO4xu1q reason="key not found in DNS"; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b="EEO4xu1q"
ARC-Seal: i=1; a=rsa-sha256; t=1791877199; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IN03++97+RtZtwvkC2okb+lbFSJRimeuS7oCaHjY0FV+KjJOIJBmZA8jtWS1ti//iSEzYD7i5uqyRDpVUWO50RiX+GqxrjHZGstGUOwv/zF8EYJV7qfnvcp6AZyXb6vGXgFQa5ghOw4snR4ROQK1DlbozxqUmiEES/CmHkRCCk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791877199; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eD+Ic6phz2VneKc4C7qCkhJM3MyJ0aIM1SgY1cELvgo=; 
	b=V2ODtHolP1OpNU82o1BnLewzeN5GPM4gu3Ve7+RaBlyghWp9LQwGwSv6jz98rQejrTZZjFDcMKBrnnpyx5AB/d37+3k/6h7poYffSQ7e5srjMrIO5VORKecMFvyWx5Y7XS4q9N0PH7/hZnSM6D/cYF/fdL+BqLWGNz2bX749H1E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791877199;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eD+Ic6phz2VneKc4C7qCkhJM3MyJ0aIM1SgY1cELvgo=;
	b=EEO4xu1qCk9FIv7eddWemamTUd8uQyEa7gPNhzCdwJItKhGbIIZdMDoGJit21FHG
	QQsmENRNuADO358XUTKhF0HSqFabCmZ6xwqnLYz13/AoC3zTxTUPp9gSNWYQL1UHRtk
	cn5WpuXi8ZyUQvQLH5d2XJu8JWYSqmyERuK9OWDc=
Received: by smtp.zohomail.com with SMTPS id 1791877198479839.7013236005746;
	Tue, 13 Oct 2026 00:39:58 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@lists.linux.dev
Subject: [PATCH v2] xhci: give back all TDs when skipping endpoint reset after disconnect
Date: Tue, 13 Oct 2026 00:37:11 -0700
Message-ID: <20261013073825.17962-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <330c34fd-1d1c-44e8-b949-ad2f5fb51f00@linux.intel.com>
References: <330c34fd-1d1c-44e8-b949-ad2f5fb51f00@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

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

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
Assisted-by: LLM
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
---
v2:
- Give back all TDs on the halted endpoint, not just the halted one
  (Mathias)
- Open code the helper, and log when the endpoint is flagged instead of
  on every rejected URB (Michal)
- Add a Closes: tag for regzbot

v1: https://lore.kernel.org/linux-usb/20261010064407.11030-1-yiyu@yiyuzhou.io/

Tested on v7.3-rc6 on a System76 Galago Pro (Intel 8086:51ed xHCI).  The
keyboard was plugged directly into two root ports three times, each time
right after resume from suspend.  Each time it dropped off during probe
and was re-enumerated with all three interfaces bound about 0.3 s later,
with no timeouts.  Unplugging a dock with six devices behind one root
port also went through this path on 12 halted endpoints with no errors.

 drivers/usb/host/xhci-ring.c | 10 +++++++++-
 drivers/usb/host/xhci.c      |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..2463d57ff705 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -65,6 +65,7 @@
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
 
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
@@ -991,10 +992,17 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	/*
 	 * Avoid resetting endpoint if link is inactive or device disonnected.
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
index a9e47e178c28..41ff45f5f909 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1691,6 +1691,10 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		ret = -EINVAL;
 		goto free_priv;
 	}
+	if (*ep_state & EP_DROP_PENDING) {
+		ret = -ENODEV;
+		goto free_priv;
+	}
 
 	switch (usb_endpoint_type(&urb->ep->desc)) {
 
-- 
2.55.0

