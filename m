Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1668
	for <regressions@lists.linux.dev>; Sat, 11 Dec 2021 18:37:18 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z9so11481692qtj.9
        for <regressions@lists.linux.dev>; Sat, 11 Dec 2021 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WoN20APdDOqC95fawz/rsuWbbPYFSEbjifYX+ad9yqM=;
        b=hJSsnVuctkcDEzRHLxEBUtYqWxxN7AFn9PJpsQQxDBlOYtfCYoq/1Ios/MRt4jT9FA
         XU79CIFY4XOxHze0qcXO849uMGd683gjU8H0U2J47Gbw/u62AL/Br0ta3lgZfiErA/ul
         LrWQ57BOXEV9hIxqXwcDNmku4JkbXbCSL/Bxs70Xgbci+QFpeUOtCy1Plo+gx6lPC2fC
         FKOU+j++t/M+TaC6O/VgTbPYg86PPBEPqRlUkSLy2Hqs9u0pWNrfwVFgNy5bwqFY9/eZ
         NCj+F9qzSmVVWNpg1NrJcUVkx+Q1urWfACyBlJdIw7G5boc+DHmSLib7bhrPAX++H/Up
         R30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WoN20APdDOqC95fawz/rsuWbbPYFSEbjifYX+ad9yqM=;
        b=BjMvo0o7T03041yUf1pM5j3Lx+Jjdu6W73CzNARIEFB1BLOdFcfLyxS+YyOCSvb63A
         CQG0cVzhqfM0MEIwNlYZ8sPIn7XbqVZWR3L+Z9Kf+4Yo9Xd0n3IW53Domnj4LlJOt0Z4
         d7VkIQKtBbWW5RScg1vDzL9ZSubNXrlyKeM8+bwiSTLDIOsxgjjxhqjIcSItgDLwrild
         AlIBfFQrfWR1TILe4qLppkTi+HXuWLl22R950+w5RTyTeO4lQw7J2ejLymBDBdnYvP3T
         aAg7VUSR38cCdm/M0M2aJwDg7CJj/VanViYSUVj+vVR9pzHQu9R1pEIlrC1uya1fRnle
         0ftA==
X-Gm-Message-State: AOAM5335aBBbOHM308T+T93KvmAwGDyxtv6Do0+8ew4HHwVoNJdCgqXD
	5YpIu0sl5ZxFNrcaebMihV1RWSmgl0MqCA==
X-Google-Smtp-Source: ABdhPJx90lo96Yh+Bj6vBBVYtZ7HPgO0xwrUu0CSpyH4ch8/F5Q0VJPD3NsKh4DUdaXOV6cLPEpsvw==
X-Received: by 2002:ac8:7e91:: with SMTP id w17mr35725610qtj.457.1639247837372;
        Sat, 11 Dec 2021 10:37:17 -0800 (PST)
Received: from linux-af78.suse ([189.122.192.111])
        by smtp.gmail.com with ESMTPSA id bq43sm3471574qkb.32.2021.12.11.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:37:17 -0800 (PST)
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
To: regressions@lists.linux.dev,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Birsan <cristian.birsan@microchip.com>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Jonas Bonn <jonas@norrbonn.se>
Cc: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Subject: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget (atmel_usba_udc)
Date: Sat, 11 Dec 2021 15:36:50 -0300
Message-Id: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regression occurs on the second time a self powered gadget is
connected to the host. In this situation, the gadget no loger accepts
an address in the USB enumeration phase.

The regression has been introduced in
commit 70a7f8be8598 ("usb: gadget: atmel: support USB suspend")

Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
---

Hi,

I have been using an ACME Arietta board (Microchip AT91SAM9G25 MPU, ARM9@400Mhz) for some years, and from time to time I need to do a kernel upgrade to fix issues or introduce new required features.

I have recently noticed a regression in the ethernet over USB Gadget. The system boots fine and when the device is first connected to a host it is recognized. But upon disconnection, the second time the device is connected to the host, it is no longer recognized. Of course, the gadget is self powered.

I did a "git bisect" and found that the patch introducing the regression is this:

commit 70a7f8be85986a3c2ffc7274c41b89552dfe2ad0
Author: Jonas Bonn <jonas@norrbonn.se>
Date:   Wed Feb 20 13:20:00 2019 +0100
    usb: gadget: atmel: support USB suspend
    This patch adds support for USB suspend to the Atmel UDC.

I understand that supporting USB suspend state is important for power consumption, but something in this patch has broken the hardware behavior, so my suggestion is to revert it until we can figure out what is going wrong.

I have tested and confirm that reverting that patch makes the issue go away.

On the host side, I can see some log messages that indicate that the USB gadget is not accepting a new address in the enumeration phase. The following log shows the successful initial connection and disconnection, and then the failed second connection attempt:

usb 1-4.3: new high-speed USB device number 85 using xhci_hcd
usb 1-4.3: New USB device found, idVendor=0525, idProduct=a4a2, bcdDevice= 5.10
usb 1-4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-4.3: Product: RNDIS/Ethernet Gadget
usb 1-4.3: Manufacturer: Linux 5.10.80-linux4microchip-2021.10-rc2+ with atmel_usba_udc
cdc_subset: probe of 1-4.3:1.0 failed with error -22
cdc_ether 1-4.3:1.0 usb0: register 'cdc_ether' at usb-0000:00:14.0-4.3, CDC Ethernet Device, 4a:85:ff:68:fa:82
cdc_ether 1-4.3:1.0 enp0s20f0u4u3: renamed from usb0
usb 1-4.3: USB disconnect, device number 85
cdc_ether 1-4.3:1.0 enp0s20f0u4u3: unregister 'cdc_ether' usb-0000:00:14.0-4.3, CDC Ethernet Device
usb 1-4.3: new high-speed USB device number 86 using xhci_hcd
usb 1-4.3: device descriptor read/64, error -71
usb 1-4.3: device descriptor read/64, error -71
usb 1-4.3: new high-speed USB device number 87 using xhci_hcd
usb 1-4.3: device descriptor read/64, error -71
usb 1-4.3: device descriptor read/64, error -71
usb 1-4-port3: attempt power cycle
usb 1-4.3: new high-speed USB device number 88 using xhci_hcd
usb 1-4.3: Device not responding to setup address.
usb 1-4.3: Device not responding to setup address.
usb 1-4.3: device not accepting address 88, error -71
usb 1-4.3: new high-speed USB device number 89 using xhci_hcd
usb 1-4.3: Device not responding to setup address.
usb 1-4.3: Device not responding to setup address.
usb 1-4.3: device not accepting address 89, error -71
usb 1-4-port3: unable to enumerate USB device

The steps to reproduce are very easy:
1. Have both the host and the gadget turned on.
2. Connect the gadget to an USB port.
3. Disconnect the gadget from the USB port.
4. Reconnect the gadget to the USB port.
5. The gadget is no longer recognized.

On a side note, the ACME Arietta board DTD does not use VBUS sensing by default, although the hardware diagram shows a provision to do that using the PB16 GPIO. I have tried to enable that via DTD, but there seems to be a hardware design flaw (assuming that the intention was to provide VBUS sensing) due to a connection with the processor SHDN pin, which is from the processor shutdown controller, and the 3.3 volts voltage regulator enable pin. The problem is that even when the USB is disconnected, the voltage never gets near enough zero to trigger the GPIO interrupt, which I could verify that would indeed happen by a temporary short of the (unconnected) USB VBUS pin to the ground. That was only to say that even without VBUS sensing, the device has always worked, and that enabling VBUS sensing is not a viable solution in the current project.

Best regards,
Marcelo.


 drivers/usb/gadget/udc/atmel_usba_udc.c | 55 +++----------------------
 drivers/usb/gadget/udc/atmel_usba_udc.h |  1 -
 2 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 2b893bceea45..54cdea5cc31c 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -1705,9 +1705,6 @@ static void usba_dma_irq(struct usba_udc *udc, struct usba_ep *ep)
 	}
 }
 
-static int start_clock(struct usba_udc *udc);
-static void stop_clock(struct usba_udc *udc);
-
 static irqreturn_t usba_udc_irq(int irq, void *devid)
 {
 	struct usba_udc *udc = devid;
@@ -1722,13 +1719,10 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 	DBG(DBG_INT, "irq, status=%#08x\n", status);
 
 	if (status & USBA_DET_SUSPEND) {
-		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND|USBA_WAKE_UP);
-		usba_int_enb_set(udc, USBA_WAKE_UP);
-		usba_int_enb_clear(udc, USBA_DET_SUSPEND);
-		udc->suspended = true;
 		toggle_bias(udc, 0);
+		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND);
+		usba_int_enb_set(udc, USBA_WAKE_UP);
 		udc->bias_pulse_needed = true;
-		stop_clock(udc);
 		DBG(DBG_BUS, "Suspend detected\n");
 		if (udc->gadget.speed != USB_SPEED_UNKNOWN
 				&& udc->driver && udc->driver->suspend) {
@@ -1739,17 +1733,14 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 	}
 
 	if (status & USBA_WAKE_UP) {
-		start_clock(udc);
 		toggle_bias(udc, 1);
 		usba_writel(udc, INT_CLR, USBA_WAKE_UP);
+		usba_int_enb_clear(udc, USBA_WAKE_UP);
 		DBG(DBG_BUS, "Wake Up CPU detected\n");
 	}
 
 	if (status & USBA_END_OF_RESUME) {
-		udc->suspended = false;
 		usba_writel(udc, INT_CLR, USBA_END_OF_RESUME);
-		usba_int_enb_clear(udc, USBA_WAKE_UP);
-		usba_int_enb_set(udc, USBA_DET_SUSPEND);
 		generate_bias_pulse(udc);
 		DBG(DBG_BUS, "Resume detected\n");
 		if (udc->gadget.speed != USB_SPEED_UNKNOWN
@@ -1764,8 +1755,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 	if (dma_status) {
 		int i;
 
-		usba_int_enb_set(udc, USBA_DET_SUSPEND);
-
 		for (i = 1; i <= USBA_NR_DMAS; i++)
 			if (dma_status & (1 << i))
 				usba_dma_irq(udc, &udc->usba_ep[i]);
@@ -1775,8 +1764,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 	if (ep_status) {
 		int i;
 
-		usba_int_enb_set(udc, USBA_DET_SUSPEND);
-
 		for (i = 0; i < udc->num_ep; i++)
 			if (ep_status & (1 << i)) {
 				if (ep_is_control(&udc->usba_ep[i]))
@@ -1790,9 +1777,7 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 		struct usba_ep *ep0, *ep;
 		int i;
 
-		usba_writel(udc, INT_CLR,
-			USBA_END_OF_RESET|USBA_END_OF_RESUME
-			|USBA_DET_SUSPEND|USBA_WAKE_UP);
+		usba_writel(udc, INT_CLR, USBA_END_OF_RESET);
 		generate_bias_pulse(udc);
 		reset_all_endpoints(udc);
 
@@ -1819,11 +1804,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
 				| USBA_BF(BK_NUMBER, USBA_BK_NUMBER_ONE)));
 		usba_ep_writel(ep0, CTL_ENB,
 				USBA_EPT_ENABLE | USBA_RX_SETUP);
-
-		/* If we get reset while suspended... */
-		udc->suspended = false;
-		usba_int_enb_clear(udc, USBA_WAKE_UP);
-
 		usba_int_enb_set(udc, USBA_BF(EPT_INT, 1) |
 				      USBA_DET_SUSPEND | USBA_END_OF_RESUME);
 
@@ -1896,19 +1876,9 @@ static int usba_start(struct usba_udc *udc)
 	if (ret)
 		return ret;
 
-	if (udc->suspended)
-		return 0;
-
 	spin_lock_irqsave(&udc->lock, flags);
 	toggle_bias(udc, 1);
 	usba_writel(udc, CTRL, USBA_ENABLE_MASK);
-	/* Clear all requested and pending interrupts... */
-	usba_writel(udc, INT_ENB, 0);
-	udc->int_enb_cache = 0;
-	usba_writel(udc, INT_CLR,
-		USBA_END_OF_RESET|USBA_END_OF_RESUME
-		|USBA_DET_SUSPEND|USBA_WAKE_UP);
-	/* ...and enable just 'reset' IRQ to get us started */
 	usba_int_enb_set(udc, USBA_END_OF_RESET);
 	spin_unlock_irqrestore(&udc->lock, flags);
 
@@ -1919,9 +1889,6 @@ static void usba_stop(struct usba_udc *udc)
 {
 	unsigned long flags;
 
-	if (udc->suspended)
-		return;
-
 	spin_lock_irqsave(&udc->lock, flags);
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	reset_all_endpoints(udc);
@@ -1949,7 +1916,6 @@ static irqreturn_t usba_vbus_irq_thread(int irq, void *devid)
 		if (vbus) {
 			usba_start(udc);
 		} else {
-			udc->suspended = false;
 			if (udc->driver->disconnect)
 				udc->driver->disconnect(&udc->gadget);
 
@@ -2028,7 +1994,6 @@ static int atmel_usba_stop(struct usb_gadget *gadget)
 	if (udc->vbus_pin)
 		disable_irq(gpiod_to_irq(udc->vbus_pin));
 
-	udc->suspended = false;
 	usba_stop(udc);
 
 	udc->driver = NULL;
@@ -2393,7 +2358,6 @@ static int usba_udc_suspend(struct device *dev)
 	mutex_lock(&udc->vbus_mutex);
 
 	if (!device_may_wakeup(dev)) {
-		udc->suspended = false;
 		usba_stop(udc);
 		goto out;
 	}
@@ -2403,13 +2367,10 @@ static int usba_udc_suspend(struct device *dev)
 	 * to request vbus irq, assuming always on.
 	 */
 	if (udc->vbus_pin) {
-		/* FIXME: right to stop here...??? */
 		usba_stop(udc);
 		enable_irq_wake(gpiod_to_irq(udc->vbus_pin));
 	}
 
-	enable_irq_wake(udc->irq);
-
 out:
 	mutex_unlock(&udc->vbus_mutex);
 	return 0;
@@ -2423,12 +2384,8 @@ static int usba_udc_resume(struct device *dev)
 	if (!udc->driver)
 		return 0;
 
-	if (device_may_wakeup(dev)) {
-		if (udc->vbus_pin)
-			disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
-
-		disable_irq_wake(udc->irq);
-	}
+	if (device_may_wakeup(dev) && udc->vbus_pin)
+		disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
 
 	/* If Vbus is present, enable the controller and wait for reset */
 	mutex_lock(&udc->vbus_mutex);
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.h b/drivers/usb/gadget/udc/atmel_usba_udc.h
index 620472f218bc..b44873148393 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.h
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.h
@@ -343,7 +343,6 @@ struct usba_udc {
 	struct usba_ep *usba_ep;
 	bool bias_pulse_needed;
 	bool clocked;
-	bool suspended;
 	bool ep_prealloc;
 
 	u16 devstatus;
-- 
2.30.2

