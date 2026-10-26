Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793047265;
	b=O7qgd95JunjNaNW0aPXy719DZGjHygHL0i+p4Oc5ValrF4gLjstl6gcn/E/Qv1fK9evy
	 gltotYd2VkIMzaA1qTq+QwOjL57Xeme2iISbhjb5QOIJtKVuNBilwG9UnHpjoA8lSaelh
	 121H4n8jUC17RBehvfXEzlsAI1moYPrMaqJW4+PxlOfF+ATy1Rd0PQKFt18nMbxuh5cFx
	 sjy0fN9uN44jROXakElSyJSl157rsb2dbRPQceieFBEymIkMPFLv4Keu6sBtGlRni0rR4
	 F807ZkxRv8wCUr3edsvlucE3HnX27l/h5/d5AGAa9jXy364BYJSTfASSQqw2d9jcxoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047265;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=9m2MG23R+3vnI2P23SRgYVwPs2AGvUrIv3ojfMJp9Lg=;
	b=G77Ol8QFvFCYnAv3VIqs2M6G2lp5/O0P1uXIJ7A+eSTdhZkhN/ChFvfRIzV3PzwVpV31
	 fFnF+3kEOzeUO+xozFibjHomFudT5XJnmsqLS2UYzU+2ofQuSI0TMUx2AmM0Q3iktFARu
	 oFsVHN/xtBgjELPyGwgBQz5V+nGjg4IP1oTMfcuU1nH1bH3QfUKnodm4XgMLl2dWKOEmD
	 BfdtJ3sa9VcwKG4QVAPziV1UgYO2m+VtXjAS4pD0vtFAyFKYEKHyYDFYxqQgkmJMQxUoC
	 +/pbfzt2qCOdEzqYIRDjiQLPmrbXjkhNDqkBjlyJ3MvnlbGRptJOXqqt89OH8PH/00A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yiyuzhou.io;
	spf=pass smtp.mailfrom=yiyuzhou.io;
	dkim=pass header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b="eJx/gtpX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF606A31A
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=eJx/gtpX
ARC-Seal: i=1; a=rsa-sha256; t=1793047246; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cagh8xlNOIeEArDkHTd2WvHTVc4nCnuxfIxX3udHMi9ilH9gkS/bEyIpGEAiM24k0+yePeAW0Yuyp3NOD3sDy7+pd0gcBIuvunTh0mWzZKn61FO2vaEXBiLjy32gI37/Q94ZBTiKJKhVF3P92Lc+0a5enPj7CptBj6W7pqiKRrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793047246; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9m2MG23R+3vnI2P23SRgYVwPs2AGvUrIv3ojfMJp9Lg=; 
	b=kpSmJLu8Z5eczzgIwkQyt+FoHXAYfncy/TAAREpE3MsKvCFksWlPmwKC0YSfEPzWonTY8Aq74uoBEHqgdQsGYZ0NlO1DdUkdN7IXMYvEFGaoJKYlSKheSY43ClC9M10F0gYBcARzsi0IPEQX07T05LSNr37B7eopk0UJh96WVVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793047246;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9m2MG23R+3vnI2P23SRgYVwPs2AGvUrIv3ojfMJp9Lg=;
	b=eJx/gtpX8Dl1EEqdSAzlkwwEhQ+YTrFHl0gM82BHUyNrg4Rdx8dt9A4zCipUzqRn
	wm3PPiyF2hhNYIbeRezobjJm+RFbNw/5FCdOIPmABeyz+fQNX6rCMz+nqGSS873+pLh
	l+PTZI01EauGYDjlRsyE9X2jyqv3D5VBz0VdJw/k=
Received: by smtp.zohomail.com with SMTPS id 1793047242906578.6150190276628;
	Mon, 26 Oct 2026 13:40:42 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	Dennis Wissel <dennis@dsine.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5 (3434:d068) at boot since v7.3
Date: Mon, 26 Oct 2026 13:39:42 -0700
Message-ID: <20261026203944.2235991-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026121544.41fbb71a.michal.pecio@gmail.com>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de> <20261025111410.2c14fcef.michal.pecio@gmail.com> <ZxkLPfjZS8ibGyR_gfGYKg@dsine.de> <20261026121544.41fbb71a.michal.pecio@gmail.com>
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

On Mon, 26 Oct 2026 12:15:44 +0100, Michal Pecio wrote:
> I wonder if it's possible that usbhid driver requests a reset to
> recover from errors and usbcore performs it blindly without paying
> attention to connect status?

I think that is what happens, and that 1f36cc9fa949 is what makes it
reachable here.

Interfaces 0 and 1 bind before the device drops off, and the VT
keyboard handler opens the keyboard interface right away, so its
interrupt-in URB is running.  With 1f36cc9fa949 that URB is given back
with -EPROTO and the resubmits fail with -ENODEV, so hid_io_error()
keeps retrying and after 1 s schedules hid_reset(), which calls
usb_queue_reset_device().  usb_reset_device() only checks for
USB_STATE_NOTATTACHED, and the udev stays configured until hub_wq
handles the connect change.  At boot hub_wq only gets back to port 1
after the other ports (about 1.5 s after the disconnect in Dennis's
dyndbg log), so the reset gets there first.  The device is back by
then, so the port reset succeeds and the reset reuses the udev and the
slot, ep0 ring included.

On plain 7.3 the halted interrupt TD isn't given back until hub_wq
handles the disconnect, so usbhid sees no error and never asks for a
reset.  The device only comes back through the full disconnect at 56 s
in Dennis's first log, which frees the slot and its ring.

This would also explain Dennis's two 7.2 logs: the boot with
"usb 1-1: reset" at 4.98 s had interfaces 0 and 1 bound, while in the
dyndbg boot all four probes failed, so nothing was polling.

> Maybe enable usbhid debug as well.

Booting the reverted kernel with usbhid.dyndbg=+p should show
"resetting device" from hid_reset() just before "usb 1-1: reset".

Instead of repairing ep0 in place, could it stay blocked until Address
Device has reloaded its context?  Reset Device keeps the ep0 ring and
dequeue pointer, but Address Device points the xHC at our enqueue
pointer, past the stale TRBs.  If EP_DROP_PENDING stays set on ep0
until then, the new-scheme GET_DESCRIPTOR fails at once with -ENODEV,
and usb_reset_and_verify_device() re-enumerates the device on a new
slot, as after a real disconnect.  The patch below does that, on top of
1f36cc9fa949.

It is only build-tested.  On my HHKB, hub_wq handles the disconnect
within about 0.3 s, before usbhid's 1 s window ends, so the reset never
happens here, and I see no "not part of TD" messages with 1f36cc9fa949.
Dennis, if you are willing to try it on top of 1f36cc9fa949, the reset
should now fail within a fraction of a second, and the mouse should
come back as a new device without the 11 s stall.  The stale ring is
never restarted, so the DMA problem Michal pointed out should not
happen either.

I used an LLM to trace the code and draft the patch.

Regards,
Yiyu

-- >8 --
Subject: [RFC PATCH] xhci: keep ep0 blocked after disconnect until Address Device reloads it

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
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
---
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
