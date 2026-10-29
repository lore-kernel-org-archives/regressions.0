Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256948;
	b=3esIqOLIkC7U0ZF+VcdQmaADxAszr7jf4Xy9K7lDw8KpM6gtJ+cVwFlAXfaajS8MB2Gl
	 r1OruBs1x2d3O0NXwtTko2QPkmYK+kUo/6XLpTTAiUvfJwrCuQ75kCHwSBsdIiF7iQmAe
	 oKKyfeO3Xer1l1iT2ndmpnfEP+4Qr8x5qYh+1AyXC7CgV7mAMdVg+zS4KbduLletvtBXo
	 C+jWyv2jET6A0ioX8RC9jtxw9OAt02+i+BUL9zHZ9Oy4yJOzUIkzqzJn4G68weZynMhxI
	 tudE/DjkS31SosST8MumodImzXsgg0C7O2hGu5KInMcHaWOaxNwjBHN079jCpM8Jrvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
	b=HJDKxMuEAt4bXKHTauDs0Ojz89wq4+gK7hTIgS+PaMXDgRpbKVGLELGy7Vpy+/SbkfFa
	 6P5IIOrzlUtLyPOjO+bHEC0ejbzjpBdQiJx+/FCX5hdilkGP2nBlH20veUfkH2cM0ikme
	 Oaj+GgL6mlK8AHAitqL1SjknGcbt3E4nz2h/cUhK0TAnwoiOEbMkAU4BwKjmfvOYBm5sF
	 l4d4cNx6ri469rqy4sAou8JJ7F9+G3sRVJt2kgzrnlENEpWR30b44K3pfrOXCyXJFtTSh
	 DR7vb2xibnPyAqNz4kbQSJTDVoG/NxMa90ITsN+ji88IbMot661kwnRjwax9CM4eoGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Odc0mJtO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBD606A31D
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EBD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Odc0mJtO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso18856615e9.1
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256946; x=1793861746; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
        b=Odc0mJtOV8AmLwlkrskmpHKTPOsa+zEJI5aM00oNS7JHeTe8DR/yfH3X/v9Ntx9+el
         NBYt5Al8jlQKqfXOpNlPN/fxyh1LqMYnqCK9DBcfT//A5PXl/WWjWmoaHMm8TVP2UMmD
         QwvJ66atoY+oBGaF7N4jKt6Naf0V5HTYIi5k91HeU/j2Aym00kR+dJ9Zb7M46hfhcBVp
         eZ+8vJ4p+TJBz+pfyd1aMgCpGrnHQU7twQOtNqW9uyZhy+znK62H8mNjKeGO8RdAJ2HW
         1A5Dq6Dqh1ZsrmvJOGAn7BFsSY5bZ8ay1g1SOaptlfubTgIEWNA0e3hknZzZ45cTGzaL
         unpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256946; x=1793861746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
        b=uzt6I4VAHRoZoyP2FCAemPni1uQdltrE0BFSy+3k7qoyypJ7S3k+xXwmFBpna5OaMB
         +tdnLIczJKJ5ZUe7Cax0gFic3tV1QV6KZaaU2ERO8PrmsE/0jXSkf2yvM4ptT9JGIh/J
         Ajv5/Dbfc77YaddtiZR2S0eo0IuW9f5p6jeIODBEPjmjWc1a9jioArQqHmKZyumtuU6N
         o+9EthGohaBbTLQJHsjQpKi3H1Bo3lWzOfykgvBsnf49CDZq8ITZjMgLBQqpzsj4M4cI
         IAuCjiWAF5IeHv1yPQpTS07DVXLaN+64v48DVTBYUfKLFh81DohTgXP6C9MwNBj59hk3
         Jtig==
X-Forwarded-Encrypted: i=1; AKwUvBwAolK5KqNO8pnxscYD5coY9LAYSXF+3SIg8Xx3Fxc4EwpynYwJoHmlErbG4x4yCzgJguq4iFdvcElaGw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLWMwt0yuS7Sp1dPlcW+4CjWCT0CokxjMZdDbu5m+a4aqIuYclH
	Hqle6mynjRiWJkjjL6nQDs8QJmenumQG7S5d8CPO+YTCfNttI8Z7whEr
X-Gm-Gg: AYBFou3dUrym88wNOAYzoZAzD1s5ooMJaAP1+Ok0QwRCzm2r40GjOEpx8sng9XzGGEC
	8d2t4W9M0KTflXKhx0teWtzjgImSfBxQOyT6YGpTy1Tw+TX+BO6sTNi7n7VL9YWHAqESyMsTTts
	TzPpWwG98N9S1popw3JmJluksxUD+F8hYaCXHhoStjXimO2RbgL6dOFdrqY4UOyyD1MNElAmVG0
	vJ7706Hx9KYod1CHCP/LijiNrLl9AQC7QjvEpz1ArMKSlql1pxkmuIzIYwP1g1CUBLA4W4VEV5d
	WDEursq67q9TijezNOmz8PKjmVqkGWuHRj+YnypQKrhNllU5kCTEDkiw+SsrAH2i+9AnDb7GKiP
	O1cSyoIMcDev4C4ONt70JbKKFN4vzzLBZqnl4+Cl2B/t8+BcGPo7ptNRS1NG243cfrse9vXtFLQ
	7GXWQkyAVAf6dqhfokX8A3xl0V+wJzuyprkgsCRY2ezm9LRv1ZHCpUWr3MUKY36RP8i3gkqNRkB
	iyyMpzSW+Bv3c5kaUVXGdRTg7LZ7sSDYvM4OBqhk6OSkLjbUqlY9/bo9/EVmaZSZgT25gbVFi9v
	7i0+/eoIrCIrnVeewdyToUmWZXPNXSs1yF/8sw==
X-Received: by 2002:a05:600c:8715:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a967ab1ce3mr101984595e9.33.1793256946210;
        Wed, 28 Oct 2026 23:55:46 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm42963885e9.3.2026.10.28.23.55.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:55:45 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:55:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 2/4] usb: xhci: Give back stranded URBs on disconnected
 endpoints
Message-ID: <20261029075543.3fe902b3.michal.pecio@gmail.com>
In-Reply-To: <20261029075409.4b203658.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
	<20261029075409.4b203658.michal.pecio@gmail.com>
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

When a URB is unlinked and Stop Endpoint handler sets EP_DROP_PENDING,
the endpoint won't be restarted and URBs will be hanging until drivers
unlink them, possibly only after a long timeout.

For control endpoints, cancel all remaining URBs before invalidation
and then process them normally to ensure proper ring cleanup. On other
endpoints just nuke remaining URBs after cancelled TD processing; URBs
which are already cancelled are still returned normally.

Based on ideas from patches by Yiyu Zhou and Mathias Nyman, reworked
to integrate deeper with existing infrastructure and cover more cases.

Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7049787725fb..14cfb025c365 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -62,6 +62,7 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
@@ -951,6 +952,11 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
 		if (xhci->xhc_state & XHCI_STATE_DYING)
 			return;
 	}
+
+	/* Nuke stranded URBs if there is no one to give them back */
+	if ((ep->ep_state & EP_DROP_PENDING) &&
+	    !(ep->ep_state & (EP_HALTED | SET_DEQ_PENDING | EP_STOP_CMD_PENDING)))
+		xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);
 }
 
 static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
@@ -1047,6 +1053,20 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
+	/*
+	 * Disconnected EP0 may be reused when core "resuscitates" the device,
+	 * so we must clean up its ring properly. Cancel all remaining URBs.
+	 */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index == 0) {
+		list_for_each_entry(td, &ep->ring->td_list, td_list) {
+			if (list_empty(&td->cancelled_td_list)) {
+				list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
+				td->cancel_status = TD_DIRTY;
+				td->status = -ESHUTDOWN;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
-- 
2.48.1
