Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945583;
	b=V7GBQgM8anEOf6cHn0XN6DrDDUAJ0CYuCKSLfhv/B8CaOpTFuNn+NaE4Yqyw8SXJy9xv
	 ZyUl573js7HC3Htcz7Vj/jrjwqsBnSwqEzYNWHq8oLxgQT5g/MzKSqmUYh3HQs2SlRtGM
	 5aH0/EdDyyjy6a1f3WKnFi7x/3r7vhMZFfM3W0iY8fX3drUEvOvi+jFU/0nXu6w2Samje
	 Gtf6AhjAZRQyupNU7elQPhGgSG8EtSxP2Qs+iDGPc1NKCKpCRApazB4z+1n4sKk6T0EAf
	 8lG9bV5r8u15pJ5+nPdfurwKEeqJbtUqTpFeSPRnzdMH1OPNqC6G7aTK4HasM92tuQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
	b=H+GxWwd/ayJpYXWfUK7+s9US9YvFpBGQ++EukyV6mHQudNtAAMDXGs9vVihL0I7GnrqV
	 8oZGl3Eb3+z+CV471riSq2s7nAdd90JDo6ku/TlUsZT+MSLT40XuseerqT9VfNjokHaYs
	 /8etK5xhlAWpRJIHfPhgNWQCUIN5lwjnrREwcjz7t49j6XiO8iaFgy8w1ltyOFXesbW1D
	 3d1jOQKwX7NFSPFf3XB6lImrRU+wVHEvIDvx+BBRuXXVhQgeNORD1cNrU3CMiLEnVVOhG
	 G+6UHcXiQmKC6tfhif3YZz74CmoRn4EHgtlAhQ6A44rtbDEG30Ay2wamagVfxUYYJYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jaGyA0ub;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AF606A329
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jaGyA0ub
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e795af1d4so269021eec.1
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 22:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945582; x=1794550382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
        b=jaGyA0ubLrGl+oSShB4Yrya/NAEtg6rNKOTOjYMoUP1OH5P0yTfo5RHOQKGoVTc8mX
         ezY9nMMWQSvYdVeU7zBOmUdeZ+pCi6PqBnxzDMmhy1u1n+EoZ2upQb8XcwxyvDkCBlfU
         ZW+dXBTe7/dHlAk9H6G6Mt/T4ka2OEcuOd9hVpZADu3WecfUuUqMJJKIiQOs/WE6xqVK
         m+Tp6gnh5m8mYmb7la+hzIGbNJVW0dbHApUOJMehjU0F3sD0yJtjxm/sIp1uxTVkE0BL
         GerNpeGB1dUZ911Hm+Hu52N5aO63LyLUJm8mVyhXDo9jbXAW3MzX8QuKyxdXD61XEnh2
         yAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945582; x=1794550382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
        b=lQoh8gKaq9QcHzy0nQhCipfI7I+7OPyRt2CINHQOFfi1LNRd10ULDl8VMV2dyETGX9
         bhXHJcKMdVdR4RKq4nRIRilQvOdvGnmPYtJ2pKFD3bwBZw3ja9VMjrgW6m8nGZD4Yodx
         EPYHYDHjK30g8mM01qXgpgUtLVId34gSi0geGHlPYFxhQ9yJAAkzvXRAxHtFQsTtntuk
         iMQ2Xsz5QDRO7YDzMTJgU83xeo4L08z9KrWytok7gkEgwB2PzL9Tuf4y9qlHrR3cR8Hb
         Rc2D667UTeLqp6c0bxchZ/fkyyIYiLxjhKD5aEH55z7sQlLpQu9MQ+9YapIsruV8c1jk
         1u9Q==
X-Forwarded-Encrypted: i=1; AL+hErFaRYpYGGZCIusN7OGojiDFKcSijz7ICa291l3kiRIAf4W/x1REUmQ7pOOB9XFpmJiiw53SKoTFqruINQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/OXHPjF/KlmDPcwHe6NaMUdOSOBZwimPVMR0Xx/WK2ThQ/IsYQ
	wl4S5QDDpcxGf2pswxDITA4ft2rwFgd7soK+Q3VyLXgbvRCHowJo5GAkvUwOLn9ROg==
X-Gm-Gg: AYBFou3Dg27ib2WN+qbQYHWW1wXepUUJkpDhtSTK8PsxRK+9aqVAo17+6saNMpEf8C5
	6WiRko9UL6udZqc16qbRVWj9HW1erigDH0oQJIfZIgdItxkp8BX+26hP2OMTiv+ULcVFaW6URrv
	3L0flDRn+3Y+5u8pRndpiIiJ3crJT/SZF4v6uQ4jvD7i6OJStK/IsiZWCVuDnmMbEaVr7qdSu7y
	O6EVnTdJiwJh4ccSfrivlsQGatz6SJyzIuqNX3ghA742HNZEvuA/v2Z7XlGjt08uY7VFRxhdZmW
	MqQpRjpqWIxs4rNJ/HZYF3sjdpICH7CNXSCTr60ElW7s7g+k8gzFweBGMTOU9ghYuSsQcoT/hx+
	BglHBUWKdS3yWZxa/hvfCz8f/0ECXYhOKWIC9jRaVYnpFO6VfpJ8IWnIrCZMFOWwWTYV5Tws2Wd
	8Ig1xUM60lkEeCeHK+9wj2lk/6JLIM0am9W+j37/YbE/9dRlP1YrY7hdcC3/ObINXtc7tw4IBqW
	9Xk820JvHp1jjfRL0Tf2IB33xUyLLSoLMZ6hjlcRqzh7cTRd4bxRDyJZWZ51L7FvmtLS8ew4F9G
	counvPllc4lTnUcYo0vRVvsmoHKmy/bDmyYduAyuqXH8r2OBdiCYiMWhWQP42HaJgkEfH0h+OWK
	aXns7KAnTNzdNXOBZ+eZedKToTxovHWZOishuh/M=
X-Received: by 2002:a05:693c:8082:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-36de6065831mr7087382eec.4.1793945581467;
        Thu, 05 Nov 2026 22:13:01 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:00 -0800 (PST)
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
Subject: [PATCH v4 1/2] usb: core: export the generic device driver's operations
Date: Fri,  6 Nov 2026 13:12:50 +0700
Message-ID: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
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

Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
their declarations to include/linux/usb.h. This lets a driver whose
probe may return -EPROBE_DEFER leave generic_subclass unset and call
them itself, so that it can defer before the device is configured.

Say in the generic_subclass kerneldoc not to set it in that case.

Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/generic.c |  4 ++++
 drivers/usb/core/usb.h     |  6 ------
 include/linux/usb.h        | 10 +++++++++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index a48994e11ef3..53675d9fdb03 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -261,6 +261,7 @@ int usb_generic_driver_probe(struct usb_device *udev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_probe);
 
 void usb_generic_driver_disconnect(struct usb_device *udev)
 {
@@ -271,6 +272,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 	if (udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_disconnect);
 
 #ifdef	CONFIG_PM
 
@@ -301,6 +303,7 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_suspend(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_suspend);
 
 int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
@@ -320,6 +323,7 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_resume(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_resume);
 
 #endif	/* CONFIG_PM */
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..9f1e4d197695 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -50,12 +50,6 @@ extern int usb_get_bos_descriptor(struct usb_device *dev);
 extern void usb_release_bos_descriptor(struct usb_device *dev);
 extern int usb_set_configuration(struct usb_device *dev, int configuration);
 extern int usb_choose_configuration(struct usb_device *udev);
-extern int usb_generic_driver_probe(struct usb_device *udev);
-extern void usb_generic_driver_disconnect(struct usb_device *udev);
-extern int usb_generic_driver_suspend(struct usb_device *udev,
-		pm_message_t msg);
-extern int usb_generic_driver_resume(struct usb_device *udev,
-		pm_message_t msg);
 
 static inline unsigned usb_get_max_power(struct usb_device *udev,
 		struct usb_host_config *c)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..4844f53e2fa8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1301,7 +1301,8 @@ struct usb_driver {
  *	for devices bound to this driver.
  * @generic_subclass: if set to 1, the generic USB driver's probe, disconnect,
  *	resume and suspend functions will be called in addition to the driver's
- *	own, so this part of the setup does not need to be replicated.
+ *	own, so this part of the setup does not need to be replicated. Do not set
+ *	this if @probe may return -EPROBE_DEFER.
  *
  * USB device drivers must provide a name, other driver fields are optional.
  */
@@ -1375,6 +1376,13 @@ extern int __usb_register_device_driver(struct usb_device_driver *,
 			struct module *, const char *);
 extern void usb_deregister_device_driver(struct usb_device_driver *);
 
+extern int usb_generic_driver_probe(struct usb_device *udev);
+extern void usb_generic_driver_disconnect(struct usb_device *udev);
+extern int usb_generic_driver_suspend(struct usb_device *udev,
+		pm_message_t msg);
+extern int usb_generic_driver_resume(struct usb_device *udev,
+		pm_message_t msg);
+
 extern int usb_register_dev(struct usb_interface *intf,
 			    struct usb_class_driver *class_driver);
 extern void usb_deregister_dev(struct usb_interface *intf,
-- 
2.56.0

