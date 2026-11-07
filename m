Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019015;
	b=zY1DkoacTx/Qynjf03RPisZeWmWP+oZxFvo3jsMb4jJKyMnuj/LzBTeZU2thwMQBbQx3
	 Ocdt5/bRFGyQpdabtBEMaY0iQo3UL3+Hf7OrJ9Z/SpFDQtF4o4tGMUeOZtcggVif/Zadf
	 4WTsL2koHT/PAwsKMdPOn5nf9fTBIQ9fENAnxzgON/F9HRrnU/Na2UF7T6GhQF4wTDg9n
	 sJTkjp5O0xbZm8Sef/E+XNKFn1AZvL+n6dQPmqRnDBxyMDTqDILZbeSyELEU09Mluh9bH
	 pzlK8r6VRIwRB95AktpOlSdebulFaHaD3sx+SdFCpOV7sqlsn+a23jbV6hSkMChOdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
	b=oiaM3TREp5Y60lDiHMUvCkjrOjwZObe9Fkng7hGUu/0CZSpp8KOi0poSP4H80B0MB2yr
	 rfkHrqyplQWwOVm4EQ5w9BsJl6X6KlcGUPgeSgMsM2YIKsvsFIg4TNrgaOUFrpK4HeTcn
	 k2BU11G/iSH+zF9iDTeNfLoeRhaUJG5miITLtj8UumxLu5weyRArtEJLITQ3AGGFh9saQ
	 /TzkeC6u80h6Jdb5QTx65D+YSVHxAMKEwqxlsDKSrURd34kwkx5G8M/jlMkI5rFFMDBRy
	 O7MOh+EEbJVpZkRGsarYHW+eJGCOKdv5VPyVIP06a664P9RPGnkNw4IMsbrc63AHJ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YqkoINmH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17080606A32F
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17080606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YqkoINmH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fb88ea38cso287057eec.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019014; x=1794623814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=YqkoINmHavCwwvKUM93XUKa2C4yOP9fl2LhTGDzQxRa+Ycr+C0VsVXHre75cHVv3SS
         Lz+Dx3VQMrlSwnf47yPre7EI71HA/TIy4tpguv6YEhvQDDXkNflb8QLcWy7DsJpY3JvA
         +KTMTZfVkc+an0HeMQBcRcGHndFMw3HI2zlzcXvqM4j1ZE+HXAQnws51MZkXRzARp7lb
         w+JVBAwlklIoDW32gIaly0DLtWxOPP9qKNAvd8AwD519S96TyxeYErNE4yuT/rrjhYLZ
         DeeLFLvTmf/065dWB6CUOeE6I42sI5NnpQHVdduAKkBHrMazYSlFXHANfPaSnU30ZUcF
         ip5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019014; x=1794623814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=2XESU+PX4kVi+aB6Xupq37XB4GqmbDI0PX9O5InYGcyYoML+L7ERSjUtlq4ReUWhe+
         X9xLn44Gp2K6+y/xSkb90zchS9es9jehxWhjAFOPtZ34U/GZ1IstGL6MvAtndFn7nEis
         ZGm38BR98usNgfBe3O8ZtsX5tSTaRrWhAEMqeDK/Fi7OoE5ONVH6BX/B39bn2NkQj850
         XYaSGAfAjPMuv5GPLuem4PpydvmLz1DTHvGMjap63fmX+qJxXNG3PvywNzJTRUa4gAfe
         3mQLWiRjxDb+h1iGwjfSTsXUzGsH0P+Z9daSNlqAw2pBKaB3O3V4uSEZD2Xb/LKRQ+Id
         uKpw==
X-Forwarded-Encrypted: i=1; AL+hErFWbsVonDH9HGiedxug0AfqQkpwFNbBNprkh0hn0jerlsMkgik/kDEkE1Zv3L4g1tSirGNtjlGR3EYlfQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XUeqyLZzmFe9hLefLoOa/H5eyVNWInKkPmmcfploxMRm5SUNV
	lij/wqTnneG+VFYyiGOA7VF6WWsW8Aez3cKZ65EaUNl4hOptfYskksd2LR8E56UjRjzuYUeoKsD
	jh/VLq7nq
X-Gm-Gg: AYBFou1Pg/NeBbbdw6AjyGPz+K8lyBQxLAhUAHlu0fRkemeSgY6O3xYnBvJ/uEV4F+X
	jgRkO6vsPOSNs9n5FJ1xuU+Qn5lmP0MvvCDk+vxnfYO6lGJlK0B14RPk8uViMDKch+k1mbxqPtB
	asVhLroKdwfUl5NwwC2rsmL5ikMkq7hWvavqD4S5EC10Bw8PmCm7B3LmsHHRKvD6pS7KBlSSG+6
	E2ufFZnr05m9RiE26bC0INnNqVeTZdICRVlHNThrVLGlUbBO3XPoaP7bfJPDO0Fn5lnibJOzd1s
	XZffUEKcr6AVN9jk0dl/h3TUhQJEJsa1wSGZpWEmk0RHOvL7/UgQeSggDsK/akI/1ZLNINJ6ZbH
	koSCYVz+DVy5fMhNVSavjUDuDXg9KUMHzkU1Kv4RdhBwdKSB7uMq1ziHQAESkjjkf9wOpjJ7L2/
	6qKj4YfPms2WUhwB7t4hvUu0iI1hUJH4JOONVE/jISLtoYJZ1yxqXTbFt4/DR9Th4fnU9rTM1LJ
	mqy6XSflM9agyyya0jqoG9U+8WeibCOSSZeajU5dEX/FZYz2J6sbkHbSYRf60nrQnNPxzQ8JN0b
	gVXMAeRFooA+KqvtxcoirwyWF9pPWnSBmjpaP7h6Fws6RRjrGRW8KQ9UK+D6KRhCeaFHrlIsSJC
	ERTOHlZVLOlbjaZb08g==
X-Received: by 2002:a05:693c:69c8:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-370f4c6234bmr1091383eec.7.1794019014061;
        Fri, 06 Nov 2026 18:36:54 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:53 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:38 +0700
Message-ID: <e0e60a57c500ffbdb6addc268d41b7dcc4cf6c4a.1794018128.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
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

onboard_usb_dev breaks the rule that a driver must not return
-EPROBE_DEFER from its probe after it has registered child devices (see
commit fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
Its USB device driver sets generic_subclass, so the generic probe runs
first and registers the device's interfaces. onboard_dev_usbdev_probe()
then returns -EPROBE_DEFER until the platform device for the onboard
device has probed. On the BeagleY-AI, this results in a probe loop,
which has broken booting since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass, so that the probe is deferred before the
device is configured. The device now stays unconfigured while the probe
is deferred, including when the platform device never probes. Before, it
was configured and unconfigured repeatedly until the platform device
probed.

Make onboard_dev_usbdev_match() not match a device when neither its
node nor its peer hub's node has a platform device, so that the generic
driver binds it instead. If the platform device goes away between match
and probe, return -ENODEV instead of -EINVAL, so that usb_probe_device()
falls back to the generic driver.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v5:
- Stopped matching a device when neither its node nor its peer hub's
  node has a platform device, so that the generic driver binds it
  (Sashiko)
- Split the platform device lookup out of _find_onboard_dev() into
  onboard_dev_find_pdev(), and dropped the "failed to find device node
  for peer hub" error
- Commit message: explained the -ENODEV

Changes in v4:
- Switched to calling the generic driver's operations instead of
  setting generic_subclass, replacing pre_probe in the USB core

 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..299e39b55e73 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -576,6 +576,25 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
+static struct platform_device *onboard_dev_find_pdev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (pdev)
+		return pdev;
+
+	np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+	if (!np)
+		return NULL;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+
+	return pdev;
+}
+
 /*
  * Returns the onboard_dev platform device that is associated with the USB
  * device passed as parameter.
@@ -583,23 +602,11 @@ static struct platform_driver onboard_dev_driver = {
 static struct onboard_dev *_find_onboard_dev(struct device *dev)
 {
 	struct platform_device *pdev;
-	struct device_node *np;
 	struct onboard_dev *onboard_dev;
 
-	pdev = of_find_device_by_node(dev->of_node);
-	if (!pdev) {
-		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
-		if (!np) {
-			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
-		}
-
-		pdev = of_find_device_by_node(np);
-		of_node_put(np);
-
-		if (!pdev)
-			return ERR_PTR(-ENODEV);
-	}
+	pdev = onboard_dev_find_pdev(dev);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
 
 	onboard_dev = dev_get_drvdata(&pdev->dev);
 	put_device(&pdev->dev);
@@ -619,8 +626,22 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 static bool onboard_dev_usbdev_match(struct usb_device *udev)
 {
-	/* Onboard devices using this driver must have a device tree node */
-	return !!udev->dev.of_node;
+	struct platform_device *pdev;
+
+	/*
+	 * Onboard devices using this driver must have a device tree node with
+	 * a platform device, its own or its peer hub's. Leave any other device
+	 * to the generic driver.
+	 */
+	if (!udev->dev.of_node)
+		return false;
+
+	pdev = onboard_dev_find_pdev(&udev->dev);
+	if (!pdev)
+		return false;
+
+	put_device(&pdev->dev);
+	return true;
 }
 
 static int onboard_dev_usbdev_probe(struct usb_device *udev)
@@ -639,7 +660,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 	if (err)
 		return err;
 
-	return 0;
+	err = usb_generic_driver_probe(udev);
+	if (err)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
+
+	return err;
 }
 
 static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
@@ -647,6 +672,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +723,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.match = onboard_dev_usbdev_match,
 	.probe = onboard_dev_usbdev_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
-	.generic_subclass = 1,
+#ifdef CONFIG_PM
+	.suspend = usb_generic_driver_suspend,
+	.resume = usb_generic_driver_resume,
+#endif
 	.supports_autosuspend =	1,
 	.id_table = onboard_dev_id_table,
 };
-- 
2.56.0

