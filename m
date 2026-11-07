Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019011;
	b=nSLPqb7XUKOAtV//uxwd5ay1IJsb0ocDqHOMUtyq19CR6jGBexRqr1Np/Dq7nsxrOqPZ
	 mzNjo1eXY8YH07VDJdM2e0Q9rLhUwclSu1GjoEeGFGPIJ7iNmIZNv7p10jCkpepOD5YON
	 39nfrQifcHpivUOOW5/6pkd+8dZE5Ni1HyWu8nriVKL/B73Z3zvw3WAnqxh/wkTHHlMkh
	 LQbstJy0sEsD/alSt7YGYWXAByzWxNvDsRUwHvy3IZ9KIiqMPusoRo3IfyP8YNrIvvcv8
	 cdbq7a8sECNFyXq86lkPWQSXzOw5jcq5/YyOV8o0y99hX5qlYSm+5tUq1Ar7UGRBiNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
	b=bUJPtpyoLwqhA8Dn2lASDxayQ7wxq/BibeaKqL52m7pGmMj5dFuY9g9PzoWt6ORQdFLn
	 og6bSuYobT8/LtsAAtFBHkFHgZVL+qg0+bpU+qzhnNBJgfnVyk2znTTwIo8JSdjZ2NIHf
	 nTPd4SZQC17QJPPJxbG0HJWqpd5HYXPQaCorHYR/romMYt3h1Il31ZesydveIrh0W1OKj
	 0QAwOn0iZe4FrWFIoZp5pIaTQS965bPaTY64Lc2h/HSOvj87qbOxFXLRClBAUnvJB9ebE
	 tQ25otn3zVHtWgXdqPMy+MOq1rYYPVyKdATzOH6dU/LaD9UY0+jgQ1eYjudVU0d05Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aD1zMTvh;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD2606A326
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 02:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AD2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aD1zMTvh
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2030519eec.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 18:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019010; x=1794623810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=aD1zMTvh5KIyFMMzYnUXBFyi1AR5tuhgNtbUALKSVnfCXSq9GtcKESdP+BrXObLm9W
         VYZ3naSCNBOIBYLp5GbVkg+SotdZ4a1WlJRBuF1LNHLC8gJ8xpXZDWBS2yhlYRR1xMT7
         6fhCpGWPnRf1+Xr9iLmX9Wdo/16RueBuhVTqYJ8y3BSVihx5cKYBMpqyZRqRVscH6J9Z
         sqRc1OXlpgXrkf6XO40Q2ooW9XAaycBu9+EF+5h0goVUfEQ6zRsvbl42nzMXoDp2IQuQ
         xbJIMwQqvYmgVJ+30zF8aWbWiEBRwirWz1/F25Dq6dgDf0CSMkpb/IlcPvl+gBOA+jlH
         XgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019010; x=1794623810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=QxOQEt75o9pFq1xH3zYQP5DmIx5PWzn08rT0V+V67rOoLRxKTVYrly/a/J0/vgPHHY
         9IiFISQ9yy5YhTTNCnYVQ8QW8S0auyDhfFKqlUeQmLkmkRBO5BMEYyQAsuO2Kx/LToGh
         bgklSG0eZaOh2A3DK+zmCeRo6i/k6U3W3V8Tbk6qbFYoxj+VrpS6oUE22JEJyl6Xx0YK
         ItkDVcUiX4Apq3kbGylVQdlrBYrpFcolSP/Cxbp9D92g7ejwQn++ufyRS4ARUNKUxxEV
         NwH7+TTL8/MsphysPP+cTF+DFNdXRG4AiFe8MGQnt5YfRV8pq13GXkIDy8NCLwtQITdI
         jzdw==
X-Forwarded-Encrypted: i=1; AKwUvByPWuxgOCZutgnT/vZ5DPSxBldnuTxLopY5GVhsJspdbELrlDOIfOLRn53HsEQUKVV2OFEWL3RelTypGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ud65yDGY2dfWQPGaheE+mnXZmWB8NylNz5/KnqlnrYZoxKdQI
	1lIpM+7R2uMYONYs/agGUAJKxzwA7t8ZZcnAAADdvFuvo7emmksNOq/M6g735a/fLQ==
X-Gm-Gg: AYBFou3mOPwDnRfAM5N5MKa95bix+0vLYRMqCbPvgEeOxQxpLexl2KE4BzfU+sjpWYG
	/nmN8eQs53D0mWcltNht7RXQrkt/fDnRFIF1UDwqeo8ow4cQtHWJjts5vn+4EzIUUTouq1dvN0n
	PN4ZAQn4/KNZxYBQ0p96Y7SW6tfKcDNQP8hlvW4RaT//HmQTD3+YlK+dzLZBeFRseTMMdOdwbHP
	OZl1d/MAO5di6ENQRuZiQBNKKR8KNc9w0Vq66aWFSrM9FidLYPf3As68HtceEmPZo3Mwil0u9aO
	PI1mojfu+Z/DiQZBGn7joOkp4Mevq7yhefmT7pfQ0PfAdaVDLLlqxAfbozVoU8VahVWlh5t56So
	P9Za03pFJeiOFb+qLDOF1SWqxIn5x2kpukLZbbnVo+dlBY5c8JvjUiSIr6Tm+5TbqoOXFLnuK+n
	5qJn8V0uDmAl0RDUEkdUommVtM+QvsWt7J7XIurSvuCU7cDYGBbAia8II2DoAdFd0BhfFe8c/xq
	QX5ivIR4yiLwa4pFJ5SVR6NcFl4TE7qbLzvJid8FzQ0ttO1792PX5upUnnN+Izck2wIMQan+5gO
	vD8cALx8eYpOn/YMg2bQB6DVUlY2XNvs5OO0ZjozgQFnF11Lc2AOuPIWukwNbWsUpO0JTPGB5Ti
	/kFJwicmMCcUBrqSgsA==
X-Received: by 2002:a05:7301:fc81:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36f6f2aa43amr5289981eec.0.1794019009707;
        Fri, 06 Nov 2026 18:36:49 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:48 -0800 (PST)
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
Subject: [PATCH v5 1/2] usb: core: export the generic device driver's operations
Date: Sat,  7 Nov 2026 09:36:37 +0700
Message-ID: <50db3bea8dd8bbc09bd8a9c3b38f44d6523442eb.1794018128.git.jjc@jclark.com>
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

Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
their declarations to include/linux/usb.h. This lets a driver whose
probe may return -EPROBE_DEFER leave generic_subclass unset and call
them itself, so that it can defer before the device is configured.

Say in the generic_subclass kerneldoc not to set it in that case.

Signed-off-by: James Clark <jjc@jclark.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in v5:
- Added Alan's Acked-by

Changes in v4:
- New patch

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

