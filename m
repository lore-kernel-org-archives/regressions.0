Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091038;
	b=ctZwn3SxwsYMTM7absD/uq53FRkYQfsVmqUY2vxaXvBLtF+Sh9HlD9CUgIBbXD6qeRVK
	 mRt+F7GXtRlwhRvpj6SU1eQigAW1h1Fuv04b8eri8EyQzYwSKiHP0ER7uMA6dHeXiXUZV
	 SkHfC2uELcuCN6L1jOpsnIiNuVtiF1dqt/3JRrsUbZMHgXxVmnfkYabXLKBBdP4ucmrxF
	 DNpbApOYLHz57p+hwJE/Bq9zCl002uorSK1zZigD2sJyVdCCCF8bLTJaEeSm3iKyltrUY
	 g7YkALkbRoI5E3E3nZdScslA9NW1koaeKHl8p8ahQcQ+gA0uI+RdfCWIHQz9xne3jLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091038;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=FLj38MVz5n0Sq7sa0yZGgLRLbZd6FbVVIQAz21Dvemo=;
	b=ByMOJR2/JFd+ORbuTFtmfUitbEna9crL9G/GmMxNZGRInvDXjTtLkIsuM4Defa6xtico
	 pKtg3hzNItNjOBn6Z8EGelTFI5m31O4V9PMKcoJCD7yBjItRLNMFpbfnOGMtj6M9fTZNn
	 7sJ4uhZwkAp08M8x1Qdml7iqpZ2KR8m34Tb3+f+nDWIbJtjhGC+Lt1l7EyqvotJqCK1xQ
	 jc/UY/ORftWmn4BMjQ/d0c7yL6tGMgwmEQPu5v/Hpr05dz38EbDo3G1kq9yujK6Rc0S3m
	 vozx46HNgbKVgooFuhZTiI6iqIOgL1NYG1zHpeyZwNTZpBBmM+VdSGRD5vB4EWLL95g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yiyuzhou.io;
	spf=pass smtp.mailfrom=yiyuzhou.io;
	dkim=pass header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=GLrwHEUg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC5606A31B
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AC5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=GLrwHEUg
ARC-Seal: i=1; a=rsa-sha256; t=1793091022; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mNIgdz7R3r11ZTdxDrF1Q4UNAj/msS2HRtozDlQJSSJt2JF1XeqM5R3fqe0egEeBge134OZnCYIg8nLeYTjBrIyrWpgDerO8KX4+9i6OZz6wwjqMlnXNtJr1NaKqTI2E+9loBXl7++S392yzKQ7pBXj8ls4Kp6GdmM2wOzfU0do=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793091022; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FLj38MVz5n0Sq7sa0yZGgLRLbZd6FbVVIQAz21Dvemo=; 
	b=c87bfdFCXjb5gR2PsR8BOdmGMCaRupck5ZtE3sA4AZNsUmOk1gsAmiusRhEybBQBEIabaYyPd4h6NRcc0y0CFw8iWSdKprFUoQyoNUAezXwJ5+XXP8lyXsdTbGQGnk65eEUcvgNQatPnQNiMuypGV+Ae/YtLyIebVoxBC9xNx1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793091022;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FLj38MVz5n0Sq7sa0yZGgLRLbZd6FbVVIQAz21Dvemo=;
	b=GLrwHEUgbTUGf6R/WLG13CeYhpiA8658UGY7+Mi/ec1jW9yV6uc50Vo2O++5AsfZ
	UaR36wdvJskpkykrqtlAesO4tjCQFM6QBWRfOkR3pWeU9jtZeBVBfNQqmN4YgZMkFUN
	Kg8nwZd6TvDxG02N3QWPliO6jWALXgPbAKC/5gEM=
Received: by smtp.zohomail.com with SMTPS id 1793091020208282.5273528004707;
	Tue, 27 Oct 2026 01:50:20 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@lists.linux.dev,
	Dennis Wissel <dennis@dsine.de>
Subject: [PATCH] xhci: keep ep0 blocked after disconnect until Address Device reloads it
Date: Tue, 27 Oct 2026 01:48:42 -0700
Message-ID: <20261027084845.1588204-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
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
X-ZohoMailClient: External

After a root port disconnect or link error, xhci_handle_halted_endpoint()
sets EP_DROP_PENDING instead of resetting the endpoint, and gives back
its TDs.  Their TRBs stay on the ring, and the endpoint's dequeue
pointer still points at the halted TD.

If the device comes back before hub_wq handles the disconnect, a driver
may reset it on the same slot.  usbhid does this after 1 s of
interrupt-in errors.  xhci_discover_or_reset_device() then clears
EP_DROP_PENDING on every endpoint.  The other endpoints are disabled by
Reset Device and get new rings, but ep0 keeps its ring and dequeue
pointer.  For USB 2 devices, usbcore by default sends a 64 byte
GET_DESCRIPTOR before SET_ADDRESS, and so before Address Device reloads
the ep0 context.  That request is queued behind the stale TRBs.  With a
Keychron M5 the reset stalled for 11 s, and the xHC then ran the old
TDs ("Event dma ... for ep 0 ... not part of TD"), writing into buffers
of URBs that had already been given back.

Keep EP_DROP_PENDING set on ep0 through Reset Device, and clear it when
an Address Device command succeeds.  That command loads the ep0 context
from the input context, whose dequeue pointer is our enqueue pointer, so
the xHC skips the stale TRBs.  Until then, ep0 requests fail with
-ENODEV.  If Address Device comes first, as for SuperSpeed devices, the
device recovers in place.  Otherwise the reset fails quickly, and
usbcore re-enumerates the device on a new slot, as after a real
disconnect.  The same applies when Reset Device fails because the slot
was never addressed: the next enumeration attempt uses a new slot
instead of the stale ring.

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Reported-by: Dennis Wissel <dennis@dsine.de>
Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/
Tested-by: Dennis Wissel <dennis@dsine.de>
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
---
This is the RFC from the regression thread [1], unchanged apart from
Dennis's Tested-by.  It applies on top of 1f36cc9fa949 ("xhci: give
back all TDs when skipping endpoint reset after disconnect") in
for-usb-linus and depends on it: without that patch, ep0 requests are
not rejected while EP_DROP_PENDING is set, so they would wait for their
timeouts.  7.3 needs both, so they should probably go to stable
together.

I used an LLM to trace the code and draft the patch.

[1] https://lore.kernel.org/linux-usb/20261026203944.2235991-1-yiyu@yiyuzhou.io/

 drivers/usb/host/xhci.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fa3012bf4c0f..15f4ee4aa2c3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4091,7 +4091,13 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 	ret = 0;
 
 command_cleanup:
-	for (i = 0; i < EP_CTX_PER_DEV; i++)
+	/*
+	 * Reset Device leaves the ep0 ring and dequeue pointer as they were.
+	 * After a disconnect or link error, ep0 may still point at TRBs of TDs
+	 * that were given back, so keep it blocked until Address Device
+	 * reloads its context.
+	 */
+	for (i = 1; i < EP_CTX_PER_DEV; i++)
 		virt_dev->eps[i].ep_state &= ~EP_DROP_PENDING;
 
 	xhci_free_command(xhci, reset_device_cmd);
@@ -4463,6 +4469,16 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	}
 	if (ret)
 		goto out;
+
+	/*
+	 * Address Device loaded the ep0 context from the input context, so
+	 * the xHC now starts at our enqueue pointer, past any TRBs of TDs
+	 * given back after a disconnect or link error.  Unblock ep0.
+	 */
+	spin_lock_irqsave(&xhci->lock, flags);
+	virt_dev->eps[0].ep_state &= ~EP_DROP_PENDING;
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
 	temp_64 = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 			"Op regs DCBAA ptr = %#016llx", temp_64);

base-commit: 1f36cc9fa9496189e95fe5762cde8a74e0cd9d68
-- 
2.55.0

