Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257032;
	b=kzn+pPGxe4SBPu/yrdAYl6BswAUzFaW7z9KkNQsjmXs2EJT2srTSnDxoMedcXzM1/HsU
	 LBidHUWHwkLOuXRVi233jhdrEWhT8pUScq4lQzqt11FhcKUIMg3pf0zpO2JbUhAfphbL8
	 Oul/Zl727mSCb7HOKzeb2TdiVBacF2Vs/5pt/2hhB8HWAYdWG+KVpqxG5Dj9BMBxkQryB
	 CXfpHfOt+e/hIZzn6ynMuv2DH43/ZNvYIIqag+44ETN/xNEqb1X+Sg2c6P+JmxqVL3BhM
	 VHXUGcKXRMua0jy1OuXUV7JI7A33CSRYuYfAMJXh9Ma3D0TFc4ZRk+GyudQSrkQcYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
	b=F0dBCxHXc+DkC1ShP0/h6jZzxALTl5Tj6bhz6/Nt0QvQTE5RqMGya6/XAeX8lSNiiBXS
	 FCrChlRLYtC01a0XrCeWa50EW8dNf1dACNjpcPGx42MfVz3eAE9s+U7UpDwHdr2/+1ZN+
	 hTNO1tYqrgyU8GCuV1xxThRFpavQWtJZwBkcqljXC4LKEiIr0096fb7wSVHtNIHFl0IZ+
	 pPdWG06AHEEzW9hVlTqeJjETht5kY+S5qpR8/9W/QlCpEuD4/aryyGd8cxJ6LFeCqgFJS
	 0VnHlcueCXI0v3M4xiktqSmbFD3Le3RTsXTgqn+oUS0v3Plr2BTnMq8r1KIqQKjzqAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNYjsBtg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E7606A31C
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNYjsBtg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16414025e9.0
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257030; x=1793861830; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
        b=PNYjsBtgiBBVaLaa18tiFM5NYO0oqcJJ7WHnehWCixGRrZHBUExhDAuZY2Xyba+0lz
         ZoBqsQZJYYj3lPjf/2VtwnHbSkDGim7rFKmKTUn+/KaAfc4kNcTsvOtvpNURson3AbPd
         +3rJlncxH2qWROe+R2POwDc8seO25Lpb9lDW3XQR5IN0+uF3f68oOujpfYFZqxz9i9fl
         7AiQO2XCPiCTcOjeJo4CjEh6IRtTw8LpMLz9oJrZISU7Y9KBedIcJCuqElzCkNIU8As+
         H01Y7URu6xJeI7v+Jj57RNIHL15P4IDbwAVhJvsoUlo63jN3yIwNGLVZwFrLnXVLqEql
         dhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257030; x=1793861830;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
        b=Uz6bhjofWatCXDolH0ZioBlXfdRttIH3gF2nxe1Bp9ef1pLBHH6tyXd3wwcDFjqeEf
         /IYKg12shVByvw3WSKIOaGjZmMSCfi0tsZn7VwtPkNbBwI8IuAiVvpCAuH2EkngSLkDB
         ZrB9DpLj+GzvGEErK1CZvVGR6lvnZ4WkL73ylPrgGaakF5gpI0Vn/OqIBoBcwjoYsr9S
         M2c9SbFmaXEM7/dIh2pZdeCqAwKY5oYZth1wh5LedjTWcmniFlAL2a2Mnv8iFxcjYcu7
         JMUEi1nPLTK2etY5uEfPwprlWl2xVoxdUwdT7C+V3fOS082rAqsZ1iQMzmOBT+TXg88Z
         4/wA==
X-Forwarded-Encrypted: i=1; AKwUvBw2KPqBl8l6ptQ/QxVz5XUAqHMHuybgev4lSM0FeDZCZ1cHRrhyaZDmiYGo7HlK+iF4rYeXEIY5pl6oOg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIlLD67fRLKKlN+zRs/JQy1Z7cOLtF8knYR/h4Fpt77fYb67SdN
	9pxarVeGGBPRCi+OUZkKVherevsRL4I+9CzGNaxAMwgA8esIEkpw7Jcw
X-Gm-Gg: AYBFou3VE67p7eeVdRnAf2YK4y8T9qbsREDhqYG7z6FPLI+Uh34sSMS4f9tcxAnl5+A
	fk5FR594goVQDXzo1HTtO8hm15o3P1T9Arg0bPl1y9XdTpr+W8HidazvPHDAFfRNLRLuTi+jw5C
	3LUuIYLK8IZZpt2mn0e4fxk5mY672TcxL6KueZiLP8HjcNrC6lmSbkNbAAP7PFVmg83dVsE3qy+
	/l+6NBf/8IL+xVaLfjeq9TnspLXOeGwJ0P0W3vv7IMRKNRGNTvCFslMhN22NUq4x/+nmwhH4/AQ
	V3FzZCCk/ATp8dJ8h8W4dQsW8S5rMNzo1xjp9APAEJV8aXUoCRDHiRU1whgI5ukoBNswLygOaz1
	gGzIiAF/FzQiHxoPtizRzRyKdKvJi2SWMdeNcrmI1O9fvGwUJhN6RS0d5VdZ/US2EvJzpJ/ZcFe
	+GSpryvqEbJwDkR0+8b4HsVbqVDXAvFjGfiGakbwzzpEHiTRqKpJPyXIOeuRt8HLOg8m6lUfOA7
	RycUqF/HmHNgA6EBHWUdpzwn0mlVjudhVI+jY+jPICSkWVJlD8xiGlyJuDmkOutWI6Tk03+Fjr2
	QArzJaM96jMrHTdTDyZdOqSgBEKL3nv1/nYaijs=
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a966c41a4emr99419435e9.9.1793257030439;
        Wed, 28 Oct 2026 23:57:10 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm32815744f8f.15.2026.10.28.23.57.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:57:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:57:06 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 4/4] usb: xhci: Reject URBs to disconnected devices
Message-ID: <20261029075706.69aaa77f.michal.pecio@gmail.com>
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

Restarting halted endpoints of disconnected USB3 devices triggers
some HW bugs and we actually prevent this on all devices now. Keep
drivers from pointlessly submitting URBs and needing to unlink
them later, which may involve excessive timeouts.

This generalizes existing check for USB3 ports in the Error state.

Suggested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..66b9fed65ac7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1662,12 +1662,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
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
@@ -1677,6 +1671,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
 
+	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
+	    !xhci->devs[slot_id]->rhub_port->connected || *ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Can't queue urb, link error or disconnected\n");
+		ret = -ENODEV;
+		goto free_priv;
+	}
+
 	if (*ep_state & (EP_GETTING_STREAMS | EP_GETTING_NO_STREAMS)) {
 		xhci_warn(xhci, "WARN: Can't enqueue URB, ep in streams transition state %x\n",
 			  *ep_state);
-- 
2.48.1
