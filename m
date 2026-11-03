Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684406;
	b=4tuwKGfeTJwtK26k1WZqA6MlGCflI4b2o/9H5z4gFoKw5FUldMiYaZVL72eyjSZUl+nZ
	 pdZdpRXk/i1aOyPiXuILnjU5YcUXmu7Dmpw3KjuOa3Nf1OgH9oyaz0i3CD1D8l2wC/t/Q
	 iAF/eT9F60afdfxBD7qMMhR/YP8RIsXUMViH1LrjcAgGbRKOyk10xYo34aMMkSZTXRcmI
	 6c3XwmtGpfXHw3Vz4qd6KsXZxXcaQNwoRm3hdjdSwkjfqBGPMKIVUzefj41mSSlTWj3ZB
	 wiXipU6vcPr8XTvtduOMV6cUU7rSU3KKfF6gAgdv5vL3nXOrwRoTD5KKVz7bhtHbBcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
	b=t2R9JMC+Ga8bxYcV/Zsq04F/zp9dUWuno89/osBDIgstjhGq9u9LU1VXPDS5oeHWJ5aR
	 MNbVHzYA6KI85vA5jLHTLkQI2HkT2PNNnN2zmVQtjrcJIHm9Y+CiDa6LW8XEyL6+ZgKE5
	 g7V+Qrc6/sq/M2lBF++myeoyYrP1eNTo2KBbWwLzdP36TSNq+sGvJpErJt07WkI+Exv67
	 9GCLZznYEzDm5wgbhPH9H92+w6Rs05LTa1l46Az+Tzvzhj4UKnalJFaiuy20rDGtEtzjQ
	 fET9/kBF62qDXDO1bQsx+aMy0C9z4O9njQtcTLv5UQAk7ilw1iJhqXXZ+kL/g98Sebg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT6tciyU;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40B606A32E
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB40B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT6tciyU
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb5251724bso8805845ad.3
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793684400; x=1794289200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=oT6tciyUpa8ne0OSwZyzbQk3QhrexPpLPOPRSqNaS0V+dxp1C8QfefpQzhtbEjnDke
         93B26auj9ZejAPq9KKnvquTjcaAPszI+aYdZ0EBNmHsT72bbCC2gkDNmnCnumF+6+Epv
         9RQZKVOPwqgY5y9zQ8cQjUvjd/Klwzoc01IAqpoZQa+x4WqgXjk0bwicDtiBblozfd5u
         j7EdIFTwo0bxWLXYEStlyGPn38AfKHhqdY01CSsnfOlYHVxirXPWTQxX73206vRWBL+b
         polTmzvcaS6QZ1bu+Q8j3E2eOrMRJA81448PuysbwAEPbxao+JjTdlmmg9LsVNy+8H6+
         32XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684400; x=1794289200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=04pC6B63LnEj0XkAK6RrF5kpfJbzFhn7F0YsQYmzymBvbqcQnBCOMOH2RAFw3WJ2y9
         XVuUCoSdKJLnDZZmW+BtZV14HaGEA7tlC3D9y7gBThcmKVt/B5u9JSq788lbYBquE55e
         FNuC2lU8zgW4ygMAHudPLqkICNLZDGjNOpzHTUX5j0NGGGjR+r7VI2N3KHd3ceSuNiQZ
         0ggYMbJ+P+PMGCb9JetRTfsPRlmyBbVbySRhIvitPFN3QmSEZMkB8zZXr1d5fLo5X127
         5l9Ff1rqfMmIqRtpyPHuHvy/+DLi+UH1FgpQoO/smfdeeiEPpVaD2al9wg33IFhv4Bcg
         1OLQ==
X-Forwarded-Encrypted: i=1; AKwUvByoEVLeERIHYguP6xsF0NZbO8Y1Lq45tJ1mdwVlyIcoZqWrUetOT2viCKfhSSEcr+ZQ7zN1BcDgyU40tg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sU/C/bYJJCk4MMK5t9MyHwZ2hF9kT5XbYIB0LxhBr6mF5Vbpb
	As7b/vDURHtSWA9s4cWF3rKXBD0q2RcplHfNhMtYxVN3SjAOQ70m1p4biX4bBG0zQ1DYaXVoSHL
	sNXI9hZRU
X-Gm-Gg: AYBFou0HjrtezOaX5dM31NW2CUMp+3hmvIcayekmOpL+Q9nXQrQg9DMDMf4lZgaATp2
	gZ9BQJ4NeJZxrfCEXbb+K4KMlrw7W4v/HK3UNyvdwzALupOb+kY/cPwT/P8gWDUHa0mG/MR28i+
	OBYK743KWBqBMZanC8ux+TWsKqHJrv+GB87+L4aSMuddrGpGCCdU7w1TQXI0BeVzi2Z/ixAltxW
	uMaFUz4QVIsK5Zd0EmwDHu63SPBIsBRVu137NhxVse0nyWdp+vmwrAxc1FroWTDTE2GN1TQXkDR
	GSWBtD+SeY0niFkQ9iwAVyfkdO5v8NZKBfTc+mBO70s+mBBUKQCvKqAuafHfqEPGZADJQ2Z8WZx
	CXGbLz7nQR1mt5FWQg1EV4W9AsRqQzV3UU8YTJ2JsOoUUxTcIPZ3nCtmAzShkf6rLiUKPL1qiai
	gjQP7QI5h3jT96m8Q/YyZQStZRcmuKBtL3xpQBaQ6PcTeJHHfeVqhZqk3jaZlTULyS1WzrwOmky
	t4+qPwtRn9nxU8tbDuEe2lZwUM8SkrosAR5kLPa/XoeWpfel5/PeBD64QgxcL9lXrf9wOhv23I4
	pA1uJogyErQzWgRZi2djwVwzZAZ5z7EKrAIO1JK/uJhiEZ0hYSRFHztvTNG417leJkaHwiTqwjJ
	STRku2gPIoRuieMXDHg==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr111236385ad.31.1793684400160;
        Mon, 02 Nov 2026 21:40:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392494edsm35154505ad.31.2026.11.02.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 21:39:58 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
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
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 12:39:52 +0700
Message-ID: <20261103053952.1138398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-194542@kernel.org>
References: <cover.1793669297.git.jjc@jclark.com> <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com> <sashiko-outbox-194542@kernel.org>
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

On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> to configure the device, bind all child interface drivers (triggering
> deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> all down a few lines later in the error == -ENODEV block via
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

This is deliberate, and documented in the @pre_probe kerneldoc. An
error from pre_probe() other than -EPROBE_DEFER is handled as if
probe() had returned it, after the generic probe has run. This keeps
the -ENODEV fallback to the generic driver working as it does for
probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
from probe().

> Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> unwind the generic probe and runtime PM state. Because really_probe()
> clears udev->dev.driver to NULL when usb_probe_device() fails:
>
> - When udev is later unplugged, usb_disconnect() -> device_del() skips
>   usb_unbind_device() because udev->dev.driver is NULL, so
>   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
>   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
>   remove the port entries added on USB_DEVICE_ADD, leaking struct
>   usbport_trig_port objects and sysfs attributes with a dangling port->hub
>   pointer to the freed struct usb_device, and usbdev_notify() in
>   drivers/usb/core/devio.c never runs usbdev_remove().

This was raised in Sashiko's review of v2. I missed that it can be fixed
when the device is unplugged. I will attempt to fix this in v4. I think
it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
device that has no driver.

> - For drivers with supports_autosuspend = 1 (such as
>   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
>   reference, and hub_configure() enables autosuspend on hub devices; once
>   the device suspends, usb_resume_device() fails with -ENOTCONN because
>   udev->dev.driver is NULL.

This is a pre-existing bug that is new in this review.
usb_suspend_device() does a generic suspend for a device without a
driver, but usb_resume_device() refuses to resume one. I don't know
why resume is refused. If a generic resume is safe there, that would
fix it.

> Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> returns -ENODEV, the error == -ENODEV block runs
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> used in usb_unbind_device():

I will fix this in v4.

James
