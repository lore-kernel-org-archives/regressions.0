Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360834;
	b=VZPiaQHgafKWf3unZVaa3WrJO7JwnZHUEb+2LKbNS9pxhWX5EM+S1J99cVJ+MmyV+xKr
	 SButBtlnS+TGpOSPC4uH9ezJbR78d1bBd5xpGzfvdTFV7zkWYzJIdGD4oIK6kzHMsdRgA
	 I1dfQ6bg9aozqoglwtcstypmdJG6VJSzOhhBSIVptb9W4cGYSOK9mJmt1b0A0dGR9rd1I
	 rG3v7Lsz5Cg8uj3GGKnrU31s3hhGuOhoz4yVzE3cV0s57HZ5WqVmuCeeLcoNqZXp3534I
	 no+ZjPALCao2WapJGPCyaKjPjhXEYWViW3N2uI/v3MSqTK4QbDCcCPS4rmpBaZYPL6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
	b=2ZKCs5Pk66U5ANT7Ozd0hYmg1gudH/KnJMFnnxA63yMeBCgvnFcaptIXZVRjIfuEEct9
	 2G1yIb/2ehL2Sr9Vczmt5qUDbQ0kKSvc3QRfXeZTq8d3G4fgfC3yw7xG0ceRr2EngjywF
	 7tXvRvzQ7o2Os+yWyni0f/wjhvAj1CPS1uuHWtbt/SUQSdcWdENXXSULTCQ9448kxHcX/
	 yQM5hnoOtEv/Nejl8swGQYAPxa2gucfb+f6VH+ms4+1gjMLQ9QXeyOUuFKI3/Fq9PTlwm
	 gJbcJgveMf/p1yZLeFZg7sn5fl6DaBmG57CbZqU9ooiwaf7sA9MrfE+K4+uabGG4f+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gL1RPUhd;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD80606A339
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 11:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD80606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gL1RPUhd
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d1114320so4647965ad.3
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793360833; x=1793965633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=gL1RPUhdaAltfPzCEX96e0l6JpGjrDruEDg3kDHnyOiX3yGmzIpQB2XuJ6bbNjWlEC
         BcB27wqk52EuuIk1D/hUQbyRtpzkKvP+TjUc7p3qJ7VB3wabsQcCbicVuh/d+CxsrbMG
         QzHAhLNSf2wAv8pKWtyJd577LFSLsmv7g+doOM/P8YyZuGv714TQCxBM+g0zvEma/AHt
         7CZn4gf9yE3USceP3b14JCEQ5dmuy1QJo75Ojc0G9mgLvG3qrQXERbHsdjfSMIR+eJr5
         /gXvaQXE32YhMPlnCED6cKnk9Xi4fmE3a99MhM9pYbS9PqXOtbKal4+LlXehokivNxfr
         3mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360833; x=1793965633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=0HQH6TXBqqV9x0O5Mc/zgb53bu6p3fJB4Cxc51YMAyKoWtHyAB5sRTUql+jz4Y71Ov
         bxnZZKEgnPckvMulAKRygN6s58kkmgagtYrnijwwkRB6898NR79sxp7MO3kyMUVOw5Sd
         HTD1bUzjuBFpm62bVELIqOcX+iP15hbdgnKuO1kWT+bW3gVimGVFhnKHBrzSiTqD4hfo
         DLAjgQS+b8mDmQ+4ltfZSrAGdMssCDCEqXCDH89VCVeah0+T9wqS9h5pIl7IqIxCXJQu
         3wSyJTlPKmPD9Qx2/FRDozoPBVz1Zu04W17E1y4Yhqk9lxPfPJWeZC3cZxm9GErumhpX
         GMTw==
X-Forwarded-Encrypted: i=1; AKwUvBwRdYYNH2PS5l82tX0wfoHAa1zFG3r2CpriBy5v7FyOI6wANbdNJhcNMGpaXgkg6thNO8L8sRLrn0W+VA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJtq1JMrHVrdvIKrIevXltlLkuu5nbCrd6UMXbkEuv+zqT9cXG
	DRzIYJEt1ULLC7CIog4/g1q6rUaESEKDkNt+Xkp3CQ3rdl/Z8vcYv4fW3GAYFFGedQ==
X-Gm-Gg: AYBFou1TOXY6ZPJnJiFCBti5mkv/dH8tL1zgmvCV8qIeMk93LBtgauanMrylZbwXwM5
	0m/t5smZD/2Oo7q35zdCiouk9sKrkQOzVXcmbmeFO1XnANlcPGxFXGV/1T61EOoPPxut97GaIoE
	C9TNjQmqJCkSc+3ioWbqee35dwQCc+M6ZRAL3d8SrbsyRPmAlxNeK1rKM58AIFCfxpBMVSLhHGD
	spb6wxdg2/40Dz5NojuR2H+E0AvLptaRlSalhPRTaWuny+s4jl/nzJyuz97UgjOV7tGnxsfk5Mg
	qsNOM06QPP+RylR9sB1ICZBq6YCRJ71yyVZKdi+LgKRfgtHFZgw+IDA5b2ugU8+ZV1EbQW3mSOL
	rx6OQxicTBnHahPdR1AGQQM6HmYJvYH9cRX5Lro2eeWjw5LLpdmsbbRqZEwPvRf89MnwccI602n
	gt+qvXGDQeRNxEgaghEUQf8Blc4iUwekUpqIhgAYBgCuSQW9hUxdsE6rOlC/9KDhAykeh31gsFa
	hD1umMlGMyIaJXoNnXpWYz3KGCNgKqdxUetvz3mPjHv5snFW0AG8psMvMdGHgYJ40H2UD1VCETc
	H8E83PgEIYP/0DK4wJJhZgSwAic6uTO+h5vrXZnUI7p6UGC59aM2+DElHU+STYedfUKsS5wenh6
	yPZVH5Qbl46HIc/4g
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr21504985ad.14.1793360832911;
        Fri, 30 Oct 2026 04:47:12 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392ba7d3sm6025725ad.75.2026.10.30.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:47:11 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 18:47:05 +0700
Message-ID: <20261030114705.3159093-1-jjc@jclark.com>
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

The underlying problem is in onboard_usb_dev. Both peer hub nodes in this
device tree carry the same reset-gpios, so the GPIO is now a shared one,
and with CONFIG_GPIO_SHARED_PROXY=m (the default) the hub's platform
probe is legitimately deferred until udev has loaded that module. The
bootloader leaves the hub running, so the USB core enumerates it long
before, and the USB device probe finds the platform device without
driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Bind to the USB device anyway, with NULL drvdata. When the platform
probe finishes, it already schedules attach_usb_driver_work to
re-attach the USB driver; extend it to also walk the USB devices and
attach the ones that are bound to this driver but have no drvdata. This
ensures the USB device always has a driver.

It doesn't work to return -ENXIO: the driver core takes this as the
driver declining the device, but the device is then left without a
driver, and a device without a driver can't be resumed once it has
autosuspended, which a hub with empty ports does right away. Nor does
it work to return -ENODEV: the USB core then binds the generic driver,
and driver_attach() doesn't rebind a device that already has one.

With this change the BeagleY-AI boots normally with that commit in
place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

On this board the platform probe asserts the hub's reset line, so the
hubs re-enumerate and are probed with the platform device already
bound. The path where attach_usb_driver_work adopts a USB device that
was bound with NULL drvdata has therefore not been exercised. It needs a
board whose platform probe does not reset the hub.

#regzbot introduced: f918e3804498

 drivers/usb/misc/onboard_usb_dev.c | 76 ++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..aac4e29c8233 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -43,6 +43,7 @@
 #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
+static struct onboard_dev *_find_onboard_dev(struct device *dev);
 
 static struct usb_device_driver onboard_dev_usbdev_driver;
 static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
@@ -301,6 +302,47 @@ static const struct attribute_group onboard_dev_group = {
 __ATTRIBUTE_GROUPS(onboard_dev);
 
 
+/*
+ * Attach a USB device that was bound by onboard_dev_usbdev_probe() while its
+ * platform device was still unbound. The device lock serialises this with
+ * the probe and with an unbind. This walks the USB bus, not the driver's
+ * device list: unbinding a device holds its lock while it waits for all
+ * references to its node on the driver's list to be dropped, so an iterator
+ * over that list that takes the device lock would deadlock with it.
+ */
+static int onboard_dev_attach_usbdev(struct usb_device *udev, void *data)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* Unlocked pre-check, so as not to wait for every USB device's lock. */
+	if (READ_ONCE(dev->driver) != &onboard_dev_usbdev_driver.driver)
+		return 0;
+
+	device_lock(dev);
+
+	if (dev->driver != &onboard_dev_usbdev_driver.driver ||
+	    dev_get_drvdata(dev))
+		goto out;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR_OR_NULL(onboard_dev))
+		goto out;
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		dev_err(dev, "failed to attach to %s: %pe\n",
+			dev_name(onboard_dev->dev), ERR_PTR(err));
+	else
+		dev_set_drvdata(dev, onboard_dev);
+
+out:
+	device_unlock(dev);
+
+	return 0;
+}
+
 static void onboard_dev_attach_usb_driver(struct work_struct *work)
 {
 	int err;
@@ -308,6 +350,8 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 	err = driver_attach(&onboard_dev_usbdev_driver.driver);
 	if (err)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+
+	usb_for_each_dev(NULL, onboard_dev_attach_usbdev);
 }
 
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
@@ -497,7 +541,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	/*
 	 * The USB driver might have been detached from the USB devices by
 	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
+	 * make sure to re-attach it if needed. The work also attaches USB
+	 * devices that were probed while this platform device was still
+	 * unbound (e.g. because this probe was deferred), see
+	 * onboard_dev_usbdev_probe().
 	 *
 	 * This needs to be done deferred to avoid self-deadlocks on systems
 	 * with nested onboard hubs.
@@ -606,14 +653,9 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it the USB device can't be attached to the platform
+	 * device yet; return NULL and let the caller decide what to do.
 	 */
-	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
 	return onboard_dev;
 }
 
@@ -635,6 +677,21 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	/*
+	 * The platform device may not be bound yet (e.g. because its probe
+	 * was deferred). Bind to the USB device anyway, with NULL drvdata,
+	 * and let the platform driver attach it once it has probed (see
+	 * attach_usb_driver_work). Requesting probe deferral here wouldn't
+	 * work: the generic probe has already bound the interface drivers,
+	 * which triggers deferred probing, so the device would be re-probed
+	 * in a loop until the platform device is bound. Returning -ENXIO
+	 * doesn't work either: the device is then left without a driver and
+	 * can't be resumed once it has autosuspended. Returning -ENODEV
+	 * hands it to the generic driver for good.
+	 */
+	if (!onboard_dev)
+		return 0;
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;
@@ -646,7 +703,8 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 {
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
-	onboard_dev_remove_usbdev(onboard_dev, udev);
+	if (onboard_dev)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
