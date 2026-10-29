Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256988;
	b=DhlFsHv8NxGNR3SithZ1vBfs8Wg5ErKvny2dOIe5X0nrFfes0IgAiu6cLw7CAKCp2eZL
	 gsgNooQ4OCQ3Wjvo/2qD36fHE4kesebGebe+k30UktUv/8vIaBWjaA/89zQpQUqiunaSC
	 tkFoe7GkTzh4XScfgXjjU1eUcac6EEgyGS1yx7ximiqJmNGtyIUigH5XgLPicPg00PmT7
	 f/HWaPwPM9KFkhZ9js+SqeFosF7PMK+fh/P7vcq3Zyiu48O7lhkfPBE41YxXjPOwh39Ea
	 kXAKIdvxFuOt8Fh1xKrE0j8o8dIpr4+oy5zfyx9OhFFA2h/hFuVzOvbFK80QDOQ8tGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
	b=lM3JWWZLkYz5AdxfeuGKZw3iqbuNrDJQmK1azXAhwkmQv0sutI8MWVi1FQ5s9163x5q5
	 XtuOJcEDGvep8GOhVUHa66jefZjT55N4fgR6PMSmFz6Q6M2qIJ7hvb+sNkZaUOflZUtCA
	 6vFY9mg0XsqB7BvVpuh8joEW0nd+qC9t2KuI5d0V5cVLn90hCnT6InLLKIyltijAi2ciK
	 NRXMYI08se6h0edj+/VzvaYpJ8bf7iZy5sQViCpi6EscMmGBsBz0mXmRuXWt9r1RxEB80
	 TAEwc3SQPHoH2Z9/sjHMZ1iDKnqa3dp2VknLUcFEyonWlA/MxxyFqIkVcyLMMLrMcjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8JXbbUq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F4606A31D
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8JXbbUq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13360965e9.3
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256986; x=1793861786; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
        b=x8JXbbUq7EzomIkFFIIp7BfmK3xFVTE+zzO+745abFKJK2s8qSv84ULg8F6UyOY2BP
         TuZBQEPMfvEocSU2IEig1FsC+Gu7NgLxBeV+PgFgZ308PWFuIXQH21XYZL9Gj9KsyPfr
         7ddxejVx0IZQ4A8R4OOMHtKM7kzE1QDHDENkUvlqAqdQba3vG5wxNh115Us2+ItMsJDP
         h3cChX2Ig/D3+aqR872YsRicvYzTCuZPUDBQwwIZB3lxEw8/Z/Joecc5ZbtCH36KIMoh
         yKO4Il017/Buw4LiUE/pCiKniuxZGslMPwrjQ7NquwuZ0cfeJZIY6aeYSlQDikx51NeT
         F1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256986; x=1793861786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
        b=TpgmiUXFq73WfujwaFrA7RxOXz0qW+D1zcMtN7SiSM+p7d1i+zwO1AQO1aiTtZf2YG
         xUuaZCZcwHE6S7w08elg8M1P+Twm2hF37NKVyHNv+9r7kpnkuwXEMye9ER9Bxk2p0qmv
         TI9qCDk8uPPmyvFdM+6lO/8tAg5WbcU0buY5MgXXD8U4IKeGxibiEpaPaC0CnMEoTquJ
         GzJnjcQOz4ACfLP5+0MePpmHXlO6pnxoUZTj9SPwFncdYVqXrF+xMzAqM+Q5Oo2pzfao
         kjb2UPCML+VleYdgbGLQoG8MoTv779ezsDMSwgijz8PHNFobntNQl+rcNUKD9FIfcQWt
         opYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/mbvGANBr+0iwU8ltSQKn8v1vYQVlKK52dnJgoPDhKXx+oLjX1Ga6P5Fa99BhNac5kwskOHicC3odSw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ59znqZlM21Fenn/6yMhp4/VEp5hftgBZ7ECQeijuDWclBVX0J
	BDxG2fyxLeYQ5wQgOH/jcZXc0z1LCMW/aC+dMtfyfM/tQtL1ps7SvVBC
X-Gm-Gg: AYBFou0233jTMljsd988pupAZHvY+9MpXFV+nvmbuEDb2eagpqs/mlC5zZsNtfhPHXn
	zaEp+65sJIvFpFa0gvKRmOwWvVXp1Mti+b+abiYgYDifPAb/DKmTRRLsKmrpnZO/yMi1xGlb6er
	r+2+vksh4LHkm7WhMMX81eGU78KF/zpiRLOd5vVGV645ZZG5xUZMvZr7ri1OuIeuwqJc8v8O7UA
	EDr/rWoqw79W5204vOcgX+WVlNpjgubfH0q/031t49xXb164tyQCWdRbk6LAF5tJT3kBi1u9FRC
	e3fIV/Py7MhUk9bY0peia16/MrCa+trl3lLmIPaxzK96euYmsWkBfG/vWMxdzQbeKuUIXJNfPkn
	Lenc622cVCWCgnF5lFe8ZQFs1Xxk5a1+PSsb/ODleVCFKAMjjwiKOYRaWi0o7xHEXJIs260fNvK
	g43Ql93AaziCFiKiqPsHyozptDcLEuihnzvGGjXlwp4Bb2Hz+ouIZ2O9hdj5tSgX++Vt3A2eGYI
	WLkQNGPHU4IDZHi4goBxaA1ROB9mrGWzEBcavje6/V7wEOS7SFMi8VuINRucllnFh/DwmzgTqCG
	sbKK+xbJogFO50gFOOT0DMUyhskMDWFnRqTvJA==
X-Received: by 2002:a05:600c:a11:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a966773233mr106983065e9.15.1793256986486;
        Wed, 28 Oct 2026 23:56:26 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm49489085e9.7.2026.10.28.23.56.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:56:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:56:22 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 3/4] usb: xhci: Give back URBs on halted disconnected
 endpoints
Message-ID: <20261029075622.2eacf9be.michal.pecio@gmail.com>
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

Bailing out of xhci_handle_halted_endpoint() on disconnected devices
had a side effect of leaving the failed URB and other URBs stranded
until the driver times out or its disconnect() routine runs and the
URBs are unlinked. And since disconnect() can't run during probe(),
only timeouts remained, slowing down error handling and making some
devices which disconnect during probe fail to probe altogether.

Ensure giveback of all URBs when we don't queue Reset Endpoint.
Set return status to 0, because the only caller that looks at it is
xhci_handle_cmd_stop_ep(), which would only repeat an equivalent of
xhci_process_cancelled_tds() if we return -ENODEV.

Reported-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Link: https://lore.kernel.org/linux-usb/20261010064407.11030-1-yiyu@yiyuzhou.io/
Reported-by: Dennis Wissel <dennis@dsine.de>
Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 14cfb025c365..1097600699d4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -993,13 +993,14 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
-	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
+	 * Flag endpoints behind disconnected RH ports and override soft retries.
+	 * Restarting them is futile and known to trigger HC bugs on USB3 buses.
 	 */
 	if (rhub_port->link_inactive || !rhub_port->connected) {
+		xhci_dbg(xhci, "Halted slot %d ep %d is lost\n",
+				slot_id, ep->ep_index);
 		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
+		reset_type = EP_HARD_RESET;
 	}
 
 	/* add td to cancelled list and let reset ep handler take care of it */
@@ -1017,6 +1018,12 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/* Don't reset lost endpoints, only EP0 can survive device reset */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
+		xhci_process_cancelled_tds(xhci, ep);
+		return 0;
+	}
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
-- 
2.48.1
