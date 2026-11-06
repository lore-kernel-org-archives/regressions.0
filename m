Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945587;
	b=ZqfXfaHDZzr/S5RRSdE96D4wpYaWe2NldaZ9tUGTUedncv8C43YGhhXaW4CMo4I4Five
	 o44Aey+4eiyfPq6fZE5VCVmAC5Qvw35NaOKagqqxnJpPw6wPAllkUdYDYxXR4iiVdyHvh
	 LBtTOtUWlXQPxZ/71/F8/AhzbV/kCq3KBw+rf1XZ/0K0CBT2fA7I8nbsmFV955UrHBwm2
	 h0ba0jI8frGbZEv7JK6SHKMsyBSqwS/bJke+8qFVdZJDGmMFui7nJ+RPu/C1TxZNuE99b
	 eV7Fq2qdRcQlcz6y5Tx2gUcAF0kx2li3Ib7ViiLL+ysNYjZTYb76zIvuf9PTyy9ZVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
	b=QJ0mOK3LqcaGIR+dxlEd3qvX2fPJXZlwLHVLON4ZqEhqUyrpbeM9iqc/68dOeTEC9cA9
	 aHMtGKaooCIUm3U9jZx5RVhbxb1si28ULGEQcLDJMpIiI6Mbeso2lqRZcrmFBV4hv/Qjg
	 kN8dOijZmU6H256Je4Vm8LqCjdYQ/U/dgZnAL/bZJY2D1IzFs4xQsn07pagwzmX6SGF2J
	 wsfAcFULgX50wqjKffrpkRTVpr/8pgDE0rWDnY992+twPl8GmZktkBa49IiwCiN80F8hG
	 pCVFScWrktcEJrrLlyaWplIjoRm43wYmLb4InisTSrWWi7VkstJjYMXkTUExO3ZXf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hPPEDhmX;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F141606A334
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F141606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hPPEDhmX
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso424155eec.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945586; x=1794550386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=hPPEDhmXd5DsMtXHxCxGF6KaZwFpXUc+MNu66dHQMOD0KtKx9IbtRA8PksksHJpVPi
         S43yLBdYB7dJ6j951lEEeobB59ImSzE2fiWuKdh3o8M0IzgsZI6EcY7kcNhcMysCoICi
         SQEV2ypko2Rdp73gNEJ4EH1JbpDqP0dtpIuoZhF3t/AtHaeNUOaNMPTNelK5EX12uYuX
         psSQVtWSdmzg5NUzybAA6Q6Hx6iVErNWPU/Ts7s7Mog68Rz1JLyEhcjeT1CKf9PhtF83
         xfeWvqAZmSPWCmIH0Ez0ni6fnMW4pXEd7ccrtLgvxiGJqb3M32MtHT3NkVF6AcjDV9UJ
         8o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945586; x=1794550386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=vTXlWTKi85W9DEltMaOodxZyYJ4i+/x7wS4WieqeJDGajMMBKMcd0xZNiTYnaF0KXC
         r7o7nKwNIIp0jpVpotwhzlzF67zbHQYWywDwm5PiFS6JfVxqPAOeBcALq43OHzAijcKA
         yH1bD7Pk1gazQCk4MQuAtGwlPSL04N+aC6gZA9i1UyPjZXmC1m1UH5Wd6ZDgq/GJ652L
         7cR8vW78jdW1432CWt7XG0q0I4PUrfcxvHr7nr8qNW2Y6Vkte57opD0i0VjMxklY9spz
         9fuanlYHC8cX6FWcb0hSSv2IqVjiNf6A3BlNQ54Nt0j7HJzXDBGg+bkMutfmZtBk4+x6
         cHAA==
X-Forwarded-Encrypted: i=1; AKwUvBzsRttk3UxryNmaOuC6HZRbFUVklt0HpiRqbky5D7hAPeGaokpRAkkGL8MGpTfiQH+RTaRErzfJD19ijg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+YJHEeQkO+nV45F6jZmrRnoN9E+jhJEMX6EWoJ5Z3eDHUT69qL
	noWK0Hd3k9+fD1V5Aw+2hpj5zChHZpC9Xxo4vAiV37ae2M+Cf1GR2ILm/1f9Fop5Sg==
X-Gm-Gg: AYBFou0AoUhJnW9/jf4K2Uevy7Pv0+44YW8+NLgkQWzolZf4DtfyoSAJmBzPFUdgZka
	OEst8bwe6iZ6rsot1jvMVQLacXXTPA0g6J3HR5IWTJJmRtFJnLOoe6O8Zk9FisHcUl3cSMDa1+1
	HAG5Cmyo78vs08O9VVLVjXoyk8uFTooFK3iNGL4Kq5xydwVbpHhAu7JY1ZouDeszuw7Rg2io1VQ
	WdcF4qms7bKcAnCXrX9B3w2P6SDxw49e/dhZrcD1JXjJaF+0ECs3I7/NIsfZxVK+7dGOdVKi5Qv
	LCDzJnYgxzrLmqUGbtCt0N889XaVnkRRXtlxesZQHaZc6uMEEiavlAM9ktAObAb4qohkpLEeHV1
	ARj0+YFp8KWWY/mk03dxWIIOwKkXdLCjn2IWs2GRVSMUChNCtlwNxRBpnVOq4U5bleb2K0do7Pt
	xf0IfpeV2hUv2/s89ZoIrBo8bfiDFhunXGzErclYqTW55+t5tYnQANTQRzZ9nE3OlUGlPKwZhHe
	WyjAP8em/QOXdmWXK7sdULRNlM9IY2qxBeUMsc5en6KsbRbyWTLcojT2b/B6ZQ9+UIB21++l2nG
	2WR2UnJ3q8V6mjfnhLs0XIlWQYRKzmAUTpN/kD9JIGSj1EuYaNkDVYHGLi3iQ8Y2SHxf/JMd8bn
	1RGRXLu40LSvk91sPJQ==
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr2213138eec.6.1793945585471;
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
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
Subject: [PATCH v4 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:51 +0700
Message-ID: <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
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
-EPROBE_DEFER from its probe after it has registered child devices,
because that causes a probe loop (see commit fbc35b45f9f6 ("Add
documentation on meaning of -EPROBE_DEFER")). Its USB device driver
sets generic_subclass, so the generic probe runs first and registers
the device's interfaces. onboard_dev_usbdev_probe() then returns
-EPROBE_DEFER until the platform device for the onboard device has
probed. On a BeagleY-AI, the resulting loop has broken booting since
commit f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass.

When the device's node has neither a platform device nor a peer hub,
return -ENODEV instead of -EINVAL, so that the device is still
configured. The device now stays unconfigured while the probe is
deferred.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..51985e3473ad 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -591,7 +591,7 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
 		if (!np) {
 			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
+			return ERR_PTR(-ENODEV);
 		}
 
 		pdev = of_find_device_by_node(np);
@@ -639,7 +639,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
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
@@ -647,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +702,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
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

