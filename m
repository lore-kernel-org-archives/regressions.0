Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256905;
	b=Ge7TYRzERzCzYUtBVLn7w/ZbLxQEJNbWGfbJyQ5gNOkypHmHRQTC09XLv6HaAf9R86gV
	 DugoSHEizmm1yHCc6AuObrBb277NFwZJv4zNb2FC1jzgLd1zQKAqIRoFYk5ctqF9v67Ow
	 GcZLZf+j4/KBJGLvqUtnepBG79FmrBrBBC0E0yJnf//GKZDtH7bP+hdMTktsf6G1sMMen
	 gDhG1m2sa7rl70sz9ADzi35cB98lZewSv0f+Qr3TbJQ6yHIDXagzgCZuh+BdW7QVjcIH7
	 RV9hYMTZXGsfyDTaJituR7gVjYZI380vgtIT+ypoiuEcKt76Edi0RTNBN7KLHsze99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
	b=yk6YblP4dXXBYc5vZi2EpsiVrT4LxaDjlo83rEFFZLGRESJaCsvbuHWb/0RBMQnk5ehy
	 ntUW3Q0tKT1cHtiK1fx2qx84fZpiTJ8HvYcx9EsaasDPMgPjB7QGzuCnrTlq6L0Sd84LK
	 Rf6v2cnQxku6nIIm7sWT+0Koktr6KYs97HfZkwA/3xJg121UOMxTUs8r6NTORVjJjEFYd
	 mEXu42M57OOYHKRj+Fz1ZsZkdZSFW2NPQfPOfHnl1Nob4VSXFG/IZSW/NU1a2KuIIMvwL
	 6MOZtPoBy/XH1XDmmf3AXtvnPlwcBKqOKmuSsyCtQoAEnKdYpDKXTcvwMc3iuBVOHpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J0c9/frg";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E9606A31A
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0c9/frg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16401375e9.0
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256903; x=1793861703; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
        b=J0c9/frgYs7SH9CrnMZ7crZQWHTxZ7pdybnQTKar83yocNQNgi9C6YZgUILmjpUGDU
         V9eEuoOsL7y/bxS+s+CG3CUJ3DmO5lyFXYhBU2X9sP++J0DAMiSJM05mO/ZahBxFctz3
         u22gYfl628s1kKINjKfFfFBXOs0WOCno13m1eaRd2/i/8tht1WElpZ3gcO/MJDcu9Qd1
         yOggSdCYWvDA8f1ruvJw/M+YOcakdHNTbcHkEUK+i9Bl5ho1MyLj9PAVlN6FeTd4QXjN
         QutwbTFBdSgRI6wjGeHGqtL821pm2AudbsBO0DiNHPw1ziRgFNhyUHFZRIAY+zkNuFUV
         IdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256903; x=1793861703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
        b=qcr4coWFJvqCEREpuLNexW8D/3BVzDQUU7jG2CCuTtKIYiYJRTAtz1CbJmw2UvqAsz
         eAjbdiKvWu61LUZnEgr4ZiR95D270WZw+VKjIjnpsLAKG1+dLw6s/Bym8UjnW4wBixY9
         8okaX41WqtmKsscdzGcYyEKcui7Q9SNFksvqILUxrbJif8fx7GRrSnYc3xJm9U4WzIdK
         UYjhfa73ucyXvYEj37ELmqr+LQh7H8eoD+gpnCpb1iCU/rBhW/UJcYZhBfOP8VRjX1Pt
         EjDAzDReTtILoLIHRFb8gulPrgfPgM0rH3filtp/rEszo9a9Xm5+qKQmDaOa5Bj42zU1
         9KkQ==
X-Forwarded-Encrypted: i=1; AKwUvBztmps1PE+zWvpgs82Fg7/Zq8z3oiX2wIhf93JSEijtZJXdg/z93ZpPOHneIT3ox9jxYJ8G2wwYhVS30g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcik1eah/Sh2VwPzmO9cwuUzL7KP0tVik46U9ahs5ZUhnlG3hb
	pMoukUTVCfPc/fU9PgNHdZVu5voTM6dNgWlrIefpUnVrhy1whYBJMXBn
X-Gm-Gg: AYBFou21TctfTA63keSJPNmLo/3ti+7da5IgFZ2ds3Qeupla9HFNwhrs+2OFQnn24W6
	FDg2LWRC8YFCFZExyMtQEPm21HipAcIpEPb7ltWhF6TJT+qgCySV4I++gUnAXf3WyIJvDvqXjiJ
	8qjuBN4Aqipi7dOd9Vs2gyLq0ipSDLu5xc4KIoe1t3Ug2iDHT/g/v3HYMCXkuzHxu+23J+2taJ2
	O3L09F+H+b3EQZA0zrDCBDDkibdktHGNZSVka5UMp6qYS7pj1LWMRkTPh3kU50ZRk7lTm37Q7Pp
	yAvYmi2va9hlWPPXC54YsxF/m2t2UKjOAgSRVvZ7Kd3rd+9g4bl64EZUfr/61hWTchNF1oJO2Zn
	tTJi63v9a2v3vyELP0EVgbvUylr46Yv+BdMfWJ36/7eBAF1QH/uqst629dVcEm+jnrJkOaSnsYu
	sYkfOCjiDbD/imXR5ZWc3uuwBtEddVBTQJGIRaPKfhaa5obZrU2WDH898SEZ/q40Bn3k9OdT7PR
	lOyHANDiy0ckD6XWR896vwNuTBUxcNXhMCU77RF1n+y8G9/lq5F9A22l2kpww82utxa/O5MBYAn
	bDAZ2UdVR3Dxn7hzrXIRwHC5CwgJlugeTq4kRA==
X-Received: by 2002:a05:600c:c08d:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a9678c2c8cmr76477825e9.23.1793256903272;
        Wed, 28 Oct 2026 23:55:03 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33002941f8f.38.2026.10.28.23.55.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:55:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:54:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 1/4] usb: xhci: Fix TD invalidation on disconnected
 endpoints
Message-ID: <20261029075459.64108477.michal.pecio@gmail.com>
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

This code prevents queuing Set TR Dequeue commands to endpoints of
disconnected devices. Turns out, USB core may "resuscitate" these
devices if a reset is requested before disconnection and completed
after reconnection, leading to reuse of the default endpoint.

Make sure that the default endpoint is cleaned up properly - TRBs
are erased (just in case, as usual) and Dequeue is set to Enqueue.
And don't overwrite TD_HALTED status, we may need it when resetting
of halted disconnected control endpoints is implemented later to
further prepare them for resuscitation.

Reported-by: Dennis Wissel <dennis@dsine.de>
Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fa6684746305..7049787725fb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1061,12 +1061,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
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
@@ -1118,6 +1112,12 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (!cached_td)
 		return 0;
 
+	/* Don't bother fixing disconnected endpoints except EP0 */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
+		cached_td->cancel_status = TD_CLEARED;
+		return 0;
+	}
+
 	err = xhci_move_deq_to_next_td(xhci, ep, cached_td->urb->stream_id);
 
 	if (err) {
-- 
2.48.1
