Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676868;
	b=Vu9MwBlBWs4WhCJ1IMYsfpFoc2xVQRsGknXPk1GIzLpSzFY9PN/RSn8q/BM7ett8xpQB
	 XTmvocGlZeQN0sJgpHTOyuSYfmX+mVFWRrxFTCjNOxi3gbOpZx6h5PNGw0vtYGD/MoK7b
	 TTZWlLraktHMLqvuyAcjTxFYIipRhxjbAbGqp0Qdw/Tp3ldZoqRxJlSGYUn0CO4wSld0v
	 UADn4l3i82RSEfUtY+BF3UaDQbNAgM+iAkCndVWMlTNbAx2AVWcKXcAGRcVk+T33V0McO
	 OpwpeFODTMSIuFzOpf0AnFJipRb6gnfyzr3B03A5h18bZhmSIofLQzhDWlDv9Azkijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
	b=xRLshBLEv1FVs8Ev1Tr8Q1xmM2XBQAN4oGvGwhHTrjx9iIaRqOUoBuBZzHCQQslqThhS
	 UM5gbTjD7wB5tbvd+JW7gz3GiwXIC5PJjbDCzisyv1dOqZHuOWjyNMoDka08FyO+Ieigx
	 UNHrDyPG37c0VIK/w4k30dN1P6/4dBfOY4w6aJCejLmJGrlsiintnyMGBDn93ZV/Mppg7
	 VqBFBEO2RYnM3ZAg1QtRrOqjXrCTY5RvRXqvJmRRxLeuBgWBf+zpe7EpS7o2HzR5nKaH2
	 KHr5oDCiiPVoQn9GFQR4rpkgLAuKVji6xoTpAktVN3/eGZ/IqiTTHfMKUOEYBBVUrCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sAPo42VP;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D2606D80A
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 03:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4D2606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sAPo42VP
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1908078a91.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 19:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676867; x=1794281667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
        b=sAPo42VPObCWpasdTL4wZPo+lbV9H+3mQ/aLNLMYXuwFX6QzeDnHR9InfaWgm0MyER
         ucb01OxnQqyyDw2bLRcQnAT2VDVuiEAYN70727ASpFiUYZavxhgWXDNCltDQVvzmSKEE
         KDenb3FRyNnRf/orvgmaHOQcR8FL9iHDGL/GvnezoTCVxRW6IWtC5wa/mEIG8U5iFDa6
         vaPFN1jrssU4jBJM/igZ9wZw4us9K+i1e2wiBsc7zzu9Yr5Rgl7mBJ/kw71ncH122Xe2
         KbWTMvdyuIDJQZ37FWtUfALnYhd2Hk/c8d3lIqGsh0c4vKVmAk8Q3URb+wferIEsKmLl
         YGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676867; x=1794281667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
        b=aPaSfDHae486I1OFuAIKW97QnrXEV6LMggFJYBfvZZN9xPHzysVL+v2t6WWaVxA7c+
         biTg83HcEhsWZgVh5hSuTRme++HzIBuo94jMNCCFcWtbNA2pCX5GDtnEgFiWhsCnh9Sp
         Pb55ECVBUEScFKJSJHVwBMpax3VpBDZxX9mrqziwzWoBzmS7LhJPqKGRWBpcLDfpam43
         K/ckUPLBLLF2cZB6AVLRGBBUjpArPi3JhWVoTwhteoQaNO5aCBkBcnmXwyly7K+mpA1S
         yvA6+TxIVlyPOIdggQvizV3oHFssursMwTiDH5IrapxDtROL9JmMkylTDQ1B9PX6d4Df
         2jHw==
X-Forwarded-Encrypted: i=1; AKwUvByjS/OjJRVfuR+qqSRniQ8sjAH99XyFX1bdJdR0mMR304efvm8I0+7PAzQkTEQyOAgzMsALlNVpYwYsEg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3Sawh52dOe6sQjZiTTFXhgIXUruq/0NbBxt481WFAjLqLNZ02
	znn7kNZx5LkO+b0dUD/E1mF3NlY2Q3k+FOpkSunYKaX10RnZa+nsdPFNXXTwlivnEw==
X-Gm-Gg: AYBFou2WxMwMkJtTSD77hOoXp9hFR8pIBg3MF+hLPxDHKc0dQ3M6E0rsvRCZaEwmflQ
	9HQok0Og63a0qcR4lJffgg//woIjMAJ2lmTfvXeOW1gv+WMeSBDMgt6iYTGMpVEMo42bRTM+xpa
	SWeWrMzJ+zq5E+XwBJdr0vqINZo5s6r0fCWQjK5R2vtes6SThdCtF19aa1BYF6VQplaAt4sGWcg
	1le9nfM1iOCREGZe82Xag5VhznNjqMXUvFXC6GO70YZ5ncFPRmnIoKNE0WVqPz8favVwsex2QAV
	HA2CKYF5hHSALZXF1oswNsvA93LabFyph0m4EUsWWj+rIA+4jAh2N5vkNN+IE/fC2grXrVOoiw8
	kzVKyXLedJBHfuKdjNz1to4+PsHXKGg8fiQZ2ROokhdLJxg/rwalFzZ/Ze+dixEBaVXW4eF77yr
	OZL23qN3vPxwAcdsDICIwY+8gOq6RASZheqPfC1ZyW73FJpnbm0yHeehbOoKhMEXxJw4V7BINnv
	cF5VluwAD2U0TGwkJPNsQ/4D2sWQ6idacYY8+wi84Sf0yKWWVAzYMwerPb4D+Lrfk1nHMFmurjm
	Axm0Nv1Wwv4a3SHzDQiaU9CTo63JPnNUWOuy0PmATNruBy0MGcFHnaFaZlbj0pBbAEZrRD6jA6D
	Za8XgLPNCL/Yi5MQVvTIGc6biNG/YlDNc9UKcXhZz
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr9823238a91.55.1793676867490;
        Mon, 02 Nov 2026 19:34:27 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:27 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 10:34:13 +0700
Message-ID: <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system. The log repeats "hub 1-1:1.0: USB hub
found" for the on-board TUSB8041 hub every few milliseconds, with no USB
disconnect in between. The flood of uevents stalls udev and the boot ends
in emergency mode. Reverting that commit makes the board boot normally
again.

Both peer hub nodes in this device tree carry the same reset-gpios, so
the GPIO is now a shared one, and with CONFIG_GPIO_SHARED_PROXY=m (the
default) the hub's platform probe is legitimately deferred until udev has
loaded that module. The bootloader leaves the hub running, so the USB
core enumerates it long before, and the USB device probe finds the
platform device without driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. A probe must not defer
after it has registered child devices, and with generic_subclass the
driver's probe has no way to defer before that. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Add a pre_probe callback to struct usb_device_driver, called before the
generic probe, so that a driver that may have to defer can do so before
the device is configured. -EPROBE_DEFER from it ends the probe with
nothing done. Any other error is handled as if probe() had returned it,
once the generic probe has run, so the -ENODEV fallback to the generic
driver works as before. Make onboard_usb_dev's USB device probe a
pre_probe; it does not need the device to be configured.

A device whose driver defers from pre_probe stays unconfigured until the
probe succeeds, and for good if it never does, e.g. an onboard hub whose
platform driver fails to probe. Before, such a device worked while being
re-probed. On the BeagleY-AI the hub is unconfigured for the few seconds
until gpio-shared-proxy has loaded and the platform driver has probed,
which resets it anyway; the board then boots normally with that commit
in place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c          | 38 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++------
 include/linux/usb.h                | 14 +++++++++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 9b8cd0e4219e..137b53beb236 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -249,24 +249,41 @@ static int usb_probe_device(struct device *dev)
 {
 	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
 	struct usb_device *udev = to_usb_device(dev);
-	int error = 0;
+	int error = 0, pre_error = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
 
 	/* TODO: Add real matching code */
 
+	/*
+	 * Give the driver a chance to defer before anything is done to the
+	 * device. The generic probe below binds the interface drivers, and
+	 * each binding triggers deferred probing, so a probe that deferred
+	 * after it would be retried straight away and the device re-probed
+	 * in a loop.
+	 *
+	 * Any other error from pre_probe() is not acted on until the generic
+	 * probe has run, so that the -ENODEV fallback below works as it does
+	 * for probe().
+	 */
+	if (udriver->pre_probe) {
+		pre_error = udriver->pre_probe(udev);
+		if (pre_error == -EPROBE_DEFER)
+			return pre_error;
+	}
+
 	/* The device should always appear to be in use
 	 * unless the driver supports autosuspend.
 	 */
 	if (!udriver->supports_autosuspend)
 		error = usb_autoresume_device(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	if (udriver->generic_subclass)
 		error = usb_generic_driver_probe(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	/* Probe the USB device with the driver in hand, but only
 	 * defer to a generic driver in case the current USB
@@ -289,7 +306,9 @@ static int usb_probe_device(struct device *dev)
 	 * specialised device drivers prior to setting the
 	 * use_generic_driver bit.
 	 */
-	if (udriver->probe)
+	if (pre_error)
+		error = pre_error;
+	else if (udriver->probe)
 		error = udriver->probe(udev);
 	else if (!udriver->generic_subclass)
 		error = -EINVAL;
@@ -300,8 +319,17 @@ static int usb_probe_device(struct device *dev)
 		if (!udriver->supports_autosuspend)
 			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
-		return -EPROBE_DEFER;
+		error = -EPROBE_DEFER;
 	}
+	if (error)
+		goto err_pre_probe;
+
+	return 0;
+
+err_pre_probe:
+	/* The driver core doesn't call disconnect() for a failed probe. */
+	if (udriver->pre_probe && !pre_error && udriver->disconnect)
+		udriver->disconnect(udev);
 	return error;
 }
 
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..33653d8f76d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -606,13 +606,14 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it, e.g. because the platform driver's probe was
+	 * deferred or is running right now, request probe deferral and we'll
+	 * come back and try again. This is allowed because we run from
+	 * pre_probe(), before the USB core has configured the device.
 	 */
 	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
+		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
+					     "platform device not bound\n"));
 
 	return onboard_dev;
 }
@@ -623,7 +624,7 @@ static bool onboard_dev_usbdev_match(struct usb_device *udev)
 	return !!udev->dev.of_node;
 }
 
-static int onboard_dev_usbdev_probe(struct usb_device *udev)
+static int onboard_dev_usbdev_pre_probe(struct usb_device *udev)
 {
 	struct device *dev = &udev->dev;
 	struct onboard_dev *onboard_dev;
@@ -695,7 +696,7 @@ MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
 static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.name = "onboard-usb-dev",
 	.match = onboard_dev_usbdev_match,
-	.probe = onboard_dev_usbdev_probe,
+	.pre_probe = onboard_dev_usbdev_pre_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
 	.generic_subclass = 1,
 	.supports_autosuspend =	1,
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..6e07d485d49a 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1280,6 +1280,19 @@ struct usb_driver {
  * @name: The driver name should be unique among USB drivers,
  *	and should normally be the same as the module name.
  * @match: If set, used for better device/driver matching.
+ * @pre_probe: If set, called first, before the device is resumed or
+ *	configured (the generic USB driver's probe runs after it when
+ *	@generic_subclass is set, then @probe), so it must not access the
+ *	device. A driver that may have to defer probing must do so from here
+ *	by returning -EPROBE_DEFER, not from @probe: by then the generic probe
+ *	has bound the interface drivers, and each binding triggers deferred
+ *	probing, so the device would be re-probed in a loop. Returning
+ *	-EPROBE_DEFER ends the probe with the device left as it was, so the
+ *	device stays unconfigured until the probe succeeds. Any other error is
+ *	handled as if @probe had returned it, once the generic probe has run,
+ *	and @probe is then not called. If @pre_probe succeeds and a later step
+ *	of the probe fails, @disconnect is called to undo it, so a driver with
+ *	both callbacks must make @disconnect cope with a failed @probe.
  * @probe: Called to see if the driver is willing to manage a particular
  *	device.  If it is, probe returns zero and uses dev_set_drvdata()
  *	to associate driver-specific data with the device.  If unwilling
@@ -1309,6 +1322,7 @@ struct usb_device_driver {
 	const char *name;
 
 	bool (*match) (struct usb_device *udev);
+	int (*pre_probe) (struct usb_device *udev);
 	int (*probe) (struct usb_device *udev);
 	void (*disconnect) (struct usb_device *udev);
 
-- 
2.56.0

