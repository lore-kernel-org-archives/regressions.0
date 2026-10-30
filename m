Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373567;
	b=gSvvL0cbzscsPVypVPR+AQncbUmJww6qNVF6jaGy3ggvbmXKPNw29CwfowN86eCJmVVO
	 sw6IFdkgcB6t2EKYrWSxa3SRFnbq6abnRtURCz0iE1jXZXbC/sa5Wvkvo5UbEAGF5t3L+
	 GYjLOS/JZ3MDDvhvek8NpXGScrYDrQZdrJT34H5oNUhsX+L+2WW3gktHpM1AQ6DypvA6k
	 +Z5/fKCm2Pa08liLbwCa1xLJ63Tx8Z9b4u43+2N1DCdAaGGaqpxx/dPhGzA4WujCXu0NN
	 tgclIAe9zJkDKRDcarGqM4A02CGiBz+Q90D/x8J5a8VByR4ylk29tYB8pTwWrfH84/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
	b=L1F/eHS+7OYE5Q94IC3vswNYLcleDvybi6U/XEnlgyF7YRp/M/r9U3gCD1PdWX4aOQsF
	 EUvEGHJvjeHWbWIae7/+VNOYJsLsQuItmYcpaMxK/knQ5Tuise82kPR0Nt3pEWQfwQz0U
	 F33xa6ZpNZZ4BTypoR9c3r/WBCwtKLM2Q/SYvKNRPFk6IEyaiQkP/2sOu3CuOKNp/Rux3
	 CdTAX/9S4IWB36KxsJGHKAzi7l2z/Vr/SJCgXtm8wQ7wCZO3Vzt1HbuwMv8FrTD3Qc1oV
	 Jljf4gzJcIF4pk2uPm8/mJeJW7ARDqhfeyxEMo7Y7Gfahrjq2ACEZr9h7K8WpyMRYvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rEEhlaSE;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4C9606A31A
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 15:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rEEhlaSE
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so365769a12.0
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793373566; x=1793978366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
        b=rEEhlaSE5SQogO1l7jJneR2rzHz/7apRj2s/CLC9JPtAwWoLk0IiC/khOeJiQKuSea
         njI8ic2IsMkU5gfFRtEK0fNvxyvOonT+amUVcP23Fj1RlBur9F7LLE2CwtY2F/+wcU63
         tYU+ujvtvntGiaUGKhyEJNIMu+wi4a8djr1HVyUmVCGevzVqlQhF+EAcPxL0LK8nnFal
         CLYIk7Qu0pEf+tO4vHDpGWZrrKwxvmjQX9qWDfaqCf3BhEosN7uXZvsC5H7M62Kdsppr
         4aw9nYygxLmMU8E7hbEydBSons3cw7/i2w67VTQTbIR60ekV3/2esNDgzJAc3falYdvg
         ElBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373566; x=1793978366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
        b=GkwhOeZQ7aQJwCYuefgY6fsxXelga59sZXAwR3OFVSM0NLMylVbzpX2YkUnYGNPsCk
         0xgyKEzHJlXrtIfhJt4Beac6Hw1SctJhqJQKKnV1KWX0RowFLukUA+86JVqd/d348m9q
         fcBYNJiDaMgaXY3cRfXKppkgVZZPoBGFWMV7IV/g3sWYH8G/kYduxhZg7LmfaTAcHDw0
         LeT7YERoVfzoWyCeWa1gzLdfk08BmPcDT5CosA1wGLktdU1c755m4RvKwJGt06kRmu2n
         h01fPm2lO8Cpgrul5o0FFU8MEhBln5KSnUxDGCOozfVCucbGPPxDSsapXEJTUXZAHFaO
         HXpw==
X-Forwarded-Encrypted: i=1; AKwUvBxmzbM74cpTBTHnemAV5doXo9OOO0kRwtxe+6pxyLpOWFQuR6NZ36aPRi4Y/90r7j8L0dJ4XTFj+gJA/Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLM3UmTyXBefMzZofdsN8Wkw1ux9u3PgSsCt04148VciFUJBn9g
	UzrGGOrJwGEluOn+LNDjdBVbnUWtgsm69fFnkK5w43DY3CsEhc1bh+Mzi/Xouhi2qA==
X-Gm-Gg: AYBFou0qpKMacRrL0IVfsAQVORLmuSl2dJjs0EF0pbOucSbG1lYDZBXrUxUVQB2ad8b
	fC5DcxYigC/9ZtgxCv2Ww7MHe+mx8/qbYwgGeY2VS6nI6UW1hc1l3g34Z96NhddPogszdDqP4WH
	BF/M4g6R6JqImlYOy0E11dbmkV4ynrlpjlPf+PBn+IXIBDTtv9dwnqrfT1GQIWvEvX7cBdPs/T3
	e2lKFcDvs5Wlp3g+4JYa5e4L1TJhfoqzSKxXYms6tR/jDbHr3VaGM/DTEBOLIPUGOTGZryWAnVv
	t62jAABndACXHtvE3B9HjXSfNPhYC5uuaVgq6zLWefKMrdqw/3RGKvpa1TTMbMFR0T65GYbGDpx
	Xe47pOczAtzmcEKoyKqslctYbo+rIq9g+Gxeb8cIRT9aBFBP0NvunJwfvoiQfUtw3oZI55j8dr8
	f0hiilYGSViybNiWJbqz6ZECAOD1URK73+bgauNpPezK6tn2hu00+zVblBfmlBdTQ5Q5ht504zA
	9PO/7/a1+SiXC6XEsJ4PIL/wAHjAJeKUDASNjoo4Ob46s5gbLYVAv8gr2unIMFefu6QquJygC6L
	eK/PB9JWSuRlNVoz4OcSLerw1tOErVh2t+D9ERD8ay9VxTu8QnmCydcY5T38MQNHXd3SC2RuZ/0
	NUGS3IRWLyDFxyuiji82jW/RRdoAeoQEeA8I2I3I=
X-Received: by 2002:a05:6a21:e181:b0:3e1:3178:8d51 with SMTP id adf61e73a8af0-3e928a29faemr1794338637.52.1793373565562;
        Fri, 30 Oct 2026 08:19:25 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm129309b3a.18.2026.10.30.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:19:25 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Fri, 30 Oct 2026 22:19:19 +0700
Message-ID: <20261030151919.3511106-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

v2: add a pre_probe callback in the USB core, as suggested by Johan
Hovold.
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

 drivers/usb/core/driver.c          | 38 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++------
 include/linux/usb.h                | 14 +++++++++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..724cfa9da4e0 100644
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
@@ -289,15 +306,26 @@ static int usb_probe_device(struct device *dev)
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
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
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
 
