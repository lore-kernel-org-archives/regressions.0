Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676864;
	b=RKpE9OgILI4+wqxR5PhkGTa3HpJTQbA9a60y++FnvP+a+9nCRLVs0gBdxmkTWN8+RE+k
	 AMooG82+rM5C3JNR/FTURVWu2UDl+k05/jG/7UwAamrknTOBWf3oJdpFr3OmLfvNzLSwD
	 slPoPl32jJR5VMpiYdixEjgqupKCf1pFmeVcUI+LJiZj218+sVSuur3TkswOl0R9l4YQV
	 WcRL/jl1J6IRivSWHqoZPmbxbGXmZwtdI0WLdwC6D3I4esFDpUl/P21+lWSwCk7uwIHPs
	 kzkTpVnvHH0wmJMoFgH9gKhB0c7KGdOW5zjNL3ZVjiNqYWhdEQXf4VzCx8iyz2fTOHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
	b=YEGb5AdF+1t62jvJGQIkcHRPNO7UeGSxP1HfPr/0krpVPf9+jUBTAAbt5KPwzL2Ld7RS
	 +JFVBnHKGYuHOkwmblBVDwpPPUPrE6qeO4l04raVT3MENnKZcLN+h1QU+vKwa/aG3/8CH
	 +g/PdWy1AXSGEuYqHgBfURyAw8Oln6TmN1BVuKKmaPkXSg4OkpVZmJcKOIWjqsfhL4n4H
	 gXipP+ndcdpcAMJ8MQXSXrb/AN0h2xexKmwGemxJeSJOmrcPv50E5zYrAcGrWHXOe8NVE
	 BUHX8ygKPrRcZx9kjvCNPXxNDXQte5G/nFzLJtIeNJmq1CJXWPPgS9mTfKXpd+C1RBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="TU9v/aEz";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1D606D809
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 03:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF1D606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TU9v/aEz
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2308294a91.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676863; x=1794281663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=TU9v/aEzLlUhtr+F85tCFFFSPJCZtOJvvkyXuQ213tcdvObHvNG4Q2fuwOIM8zPDOj
         eh401zEgsNYJJMaAUZcgngV4ss0m042o1ln4adYDsGRzwB9it6LVpL5ikmV3O4OHAiys
         uqhxuZl63rsU3GKwAjg5enTc9cJamtTpEDAKl/NmPT+F4juFnpZ7salZj3gqZutmJGpL
         YNcMTPw3QXBNrt18aDHnW/3ZhFV/tiWH+UbsA4h+nzCLvYxaTnRwqZgjCuxZmuFipAJE
         5OxlEs/r3HX3BxTCvKKEn96pzQYL7MEqKPRZPVS+kyw4z/XCs0GCvZNMc9TmAYOnLsAO
         fq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676863; x=1794281663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=Fq2+DUUXag8D7hEw267dxKn3vHhDWlVnAWe94Dr85mBxz0ekWVr97h2DpebML2sUnJ
         uvznmZFDJgVgnf9MiaDeZnywODHMA36F3ayFMqH9ZMw6qNz47eebXpKman3OFTd+9cmp
         mbqiibhpuJzeWuTJQi5MTpHWWWf5C1fYIotIrjgAZLyXeGltgB8RaBBIiB4CEDm1PW8X
         NtgrkMlTwhpr4olYBK90nFH4R3ufbFPfKAFEqiUF+2Xyycw1Ns/PqRzbtXznPyrdWyvi
         44HgxRfe9/qRXpKbIazHOz8azdappc1p7nZ0us0vwLguMFxCmlTm9gEpTFWLtNDS7QiL
         j1rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrLU88XqWERe/F4+i17UX27kJCoxMb76QYahfDof2mFfUcMjKGzx1+gHDs0ZHGCwH220dP7mAuHF92vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+36MA5Lj+90432kkFKVVm7iscoZRI5EXMMwAa/85OYkjP0xE+l
	2QGaZE6Wzdtcv/jBIToCQFs6NEIOgxaKuFDaWUs2+lGw9mb3Uh3/burjAAr59L8saw==
X-Gm-Gg: AYBFou2vMifQlyIjg7qcZ30vLXdY72+aYoDaGZlUx41O6HCy00SemOMDjWmOFc5y2nl
	adks+MoT+TRoLo42DrsMWB8PlkYVlAUmEs1uy5WApEuztfICk3b0V5DYTN81LIgNbTEYvJCF3Kl
	loeB/6TfMENpwl4DQmFBwztRl7dHGMh5Xf0nTJf+t8CAIzDCI+UzkQNogeIbOkXZKAzRp9g8f4J
	7NK4t9CCceYkIhft3jj7q6CTBbyn7lXN2wIyIlMKBp2dODzHLjbY/GlJ/e/PKr+ZfPB3KF7new6
	ZW2b92oJ/Sv11F++/yq1ugBhQBklSj2H8YPKtO4QBkV8+yzIk8WMIXW79JroiNLCls1SM5kZOYQ
	mKL9g0jMo1nG29YsiMHUzW8OVzKsqC0kC3eLaETGif5FcDrZa5EK6ybAPHlAMfEcK/P2b8dQQUK
	os65Fb1gmolX+c3kVWd21CeZtxUYDeP81uLLqDblwfc9SFFPtZq/iZPoTaHRq5MKaMTl8A4zYJ1
	Mn6B0ZkvHQ4PTx7M5GsdRJ4He8P29YZTVoEOnYDR4SPgyg1tflbhNO/uKyidgjwA+aT8mK8GTFo
	17LmPJ6sEB7c1Sx1ki5ZTEwEkITP4oIDI7k63tJvrACO/Dj1PBSH5bSmN7zZ3UzQF9trxcZRQFY
	eiJGXJPrqegrjZ5ynTw==
X-Received: by 2002:a17:90b:518c:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae8979807emr9012242a91.42.1793676863114;
        Mon, 02 Nov 2026 19:34:23 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:22 -0800 (PST)
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
Subject: [PATCH v3 1/2] usb: core: clean up before handing a device to the generic driver
Date: Tue,  3 Nov 2026 10:34:12 +0700
Message-ID: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
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

When a USB device driver's probe returns -ENODEV, usb_probe_device()
hands the device to the generic driver. It does not first undo what it
did before calling the probe. This causes two problems.

First, if the driver sets generic_subclass, the generic probe has
already run. It configured the device and sent a USB_DEVICE_ADD
notification. The generic driver then does both again. Notifier users
such as the usbport LED trigger see two USB_DEVICE_ADDs with no
USB_DEVICE_REMOVE in between.

Second, if the driver does not set supports_autosuspend, a runtime PM
reference was taken before the probe. Nothing drops it, so the device
can never be runtime suspended.

Clean up before handing the device over, in the same way as
usb_unbind_device() does when a driver is unbound: first, for a driver
that sets generic_subclass, call usb_generic_driver_disconnect();
second, for a driver that does not set supports_autosuspend, drop the
runtime PM reference with usb_autosuspend_device().

This leaves one limitation. Until the generic driver binds, the device
has no driver. If it is runtime suspended in that time, it can't be
resumed. This is transient: the generic driver resumes the device when
it binds.

This change does not alter what happens when the probe fails with any
other error. The device stays configured, so its interfaces keep
working. It keeps the runtime PM reference, because a device without a
driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
sending USB_DEVICE_REMOVE would mean unconfiguring the device.

Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..9b8cd0e4219e 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
 		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
+		if (udriver->generic_subclass)
+			usb_generic_driver_disconnect(udev);
+		if (!udriver->supports_autosuspend)
+			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
 		return -EPROBE_DEFER;
 	}
-- 
2.56.0

