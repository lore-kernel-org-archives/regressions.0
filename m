Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910721;
	b=bdhy3WbR0KE8puIh+DqLHclGcnvC1NdMYEQkdi2HxwePnD5enWYMLATygHWlnt1gPoQ0
	 CSHtrEX3VK0kgyNTUHDxsIN8IKMkMGmsj2dpK+PBXF7SnzZugczewBO7TcSRI8BUB2G+s
	 CpyR598n1qbVEBh1iifxJIRStv2sCBAK88ZqVuxQcE1Po17lGpGKUXzL6hr6Uij+arJAZ
	 uyfPVxZRp4z2guF+izaeGuy+AirFlwbr37CtlTwqkqRfsbq3yXBsVvnwwPn6USbWBT3kT
	 dllemN2omabEXPSiHOe2hjZLqc99BBLLoEXy5u/OFyvYfTeuS4M8dwdtmJmtx7tsE+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
	b=AcIr0sbEAPN+7T9iQGMoQWgj5AEKJp9ndGetBaM4IZHoOU6RMztwOabo7ZfUhvQTf/ZO
	 8z9pGSMAMLX9ucSyDgIVUr7702T3A/j6bOSdpm9QaOr9VH3tYW3oCpjWlFPcbZOuZNDKJ
	 5bwzl4ki9k0UKEeVe90lxh1QBhRAcFKnd73gP/o6UfBX8dCHUe0QrYsB2SqsRzxU9ISfd
	 FSul4mGajADddaJttSR8pywMIFYVkQ0u90TuTPRSW8rgFerPlaZv8baK+D7h8xp50RUZ+
	 uXoRsFmQDe7Pi48o8P3Y4U7MTWrqF8y7hemypc1ya7CTokjNkFDcpCopjOGSydFStpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ddgdhJSf;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D4606A32F
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8D4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ddgdhJSf
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53381e53b80so24528821cf.1
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 12:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910720; x=1794515520; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=ddgdhJSfMJ3k6FN+WajeMxUgJEqq9iCq25ctKuLeZ9dn91x4SeI7rRgQAME/jDy/ja
         OnX2Iu/3fNCSEHrIHE8YfZMgmxuQk/SIrYTdLIFPs+eMFBZHGIhGs9+6syvzPlqNa+Xm
         reUPyuTICDU8yfcV5MtB5YyMRicsK5n/3slsj0yL40bL/LAFgpUI4KaPV7Lo1fAxdpAS
         LwTqvAr36iBm7UOvyhUmySYY4SLZoQ6w828n4tm0pNbfEd4BuANaxrSn9zqLoTuuS4in
         AYnyBmsmwjV/GhGrppnQvAWelW3bQ6t7UivZbirTrdOPYfaau552llqUx4A2vnZDxcuW
         t7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910720; x=1794515520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=xl8PYFLT+nxKLChxhKdTbD8x0MBiwbOdO6eRAWsbMVMs9BeHruXTUjSoCAY+h/Xak/
         K/8KcPRItxeSnHdgJtCQo5Kl2SgARwHc75NjLnKNnm23k7n8danapogfYaYucd5q7cOR
         iUi8QWZJ6FckiG0GIwkPZiLktlnfpirWcvSpYSkyn8rJpNrNHUsYloDbK5yT8dq2eR/n
         DdWjRNyMYCERSjj7yLh7glDc8KPNDS8mzixCHrMQGsqspimm3DFeA9J9wGGrYcfoNpbo
         NQw41u/u/Kn6z8GTKDQo2NbcW1rHwhNGtR+x95gX71w8Zo8RptYDzzrzyzIDz0lp/A7P
         2UAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhVPXKcj7ca9T1ZWhMeO35mXOajstmSFxFiIabZoA0qkeqV9n4sr10Yx0UPNhwMNouB/2GkPwMK2+EuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/BqN6im89bn+VXMmuQRL12VFCDIfWne+jD8+1Kccuz+JNnF5q9
	bZiw475cXK/91Tjf0vtM5ekTEvu3bVpLileCAnUC99U4IJE0pI6jSOhotYgfYjxqww==
X-Gm-Gg: AYBFou0tmjTYLXQBY/Ew/xWJVjtblPmbBMRRtJZ0ZF23GNYh60rwb/BkZXTFKvfIB88
	di6Yd5dZHYaiGOWmZVr+yT6/BrdBfRtcFj1qpRPU1S5gIYB4RNG7uVj2VJyXpKtmDevK1FFFlxY
	k8Wnwl7nOwjNDzUr8CxpKFIYUe14o5CB2Me+nNz8UntVyI18WM1xJX4POgi6ar0r1uMO4LNPPfU
	JUhqyoPR1c28IcWun0tMxwqPsHjPVR7vRLum5t5iJxp/gz5dDA707ZQglG6Kk0MTdc9oyztS+kq
	0aGG/FVYJSRaoHLSxVmeeCO6ZyiYkEO3EQ0vdB4mnBiQHxwNlLdmsiWtUFrrbq2Gf85aZGBBbzp
	L5HxzbBQFbb3n5dbb7ja8YiNr3p+/LDuacjuG4REW9twBTArD9HSq52XkaQEApmGxP819UyEayF
	Dt+I6E0GFQtmvfXN8qF9ICsu6w+c0KUL/MaQp6YgqIZj9XR+U1i+wthjt47PgqDxpNsn/0zabg2
	nXN8vMug6FxYuQv0LBLZdg+9/igAKNcX3kqmoR+iJH29yUyilgEPD4IpgyTXjP0bW60pDuZwUzq
	rt/0haTZCBpn73GLJS45ijdk+CQU
X-Received: by 2002:a05:622a:5a18:b0:535:85c0:fda2 with SMTP id d75a77b69052e-54e100e5826mr8821511cf.11.1793910719615;
        Thu, 05 Nov 2026 12:31:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm3921886d6.30.2026.11.05.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:31:58 -0800 (PST)
Date: Thu, 5 Nov 2026 15:31:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <a0918852-57e6-42b3-9321-38d766a20025@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
 <sashiko-outbox-194542@kernel.org>
 <20261103053952.1138398-1-jjc@jclark.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103053952.1138398-1-jjc@jclark.com>

On Tue, Nov 03, 2026 at 12:39:52PM +0700, James Clark wrote:
> On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> > First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> > onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> > still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> > to configure the device, bind all child interface drivers (triggering
> > deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> > all down a few lines later in the error == -ENODEV block via
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).
> 
> This is deliberate, and documented in the @pre_probe kerneldoc. An
> error from pre_probe() other than -EPROBE_DEFER is handled as if
> probe() had returned it, after the generic probe has run. This keeps
> the -ENODEV fallback to the generic driver working as it does for
> probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
> from probe().
> 
> > Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> > other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> > err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> > usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> > unwind the generic probe and runtime PM state. Because really_probe()
> > clears udev->dev.driver to NULL when usb_probe_device() fails:
> >
> > - When udev is later unplugged, usb_disconnect() -> device_del() skips
> >   usb_unbind_device() because udev->dev.driver is NULL, so
> >   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
> >   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
> >   remove the port entries added on USB_DEVICE_ADD, leaking struct
> >   usbport_trig_port objects and sysfs attributes with a dangling port->hub
> >   pointer to the freed struct usb_device, and usbdev_notify() in
> >   drivers/usb/core/devio.c never runs usbdev_remove().
> 
> This was raised in Sashiko's review of v2. I missed that it can be fixed
> when the device is unplugged. I will attempt to fix this in v4. I think
> it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
> has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
> device that has no driver.
> 
> > - For drivers with supports_autosuspend = 1 (such as
> >   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
> >   reference, and hub_configure() enables autosuspend on hub devices; once
> >   the device suspends, usb_resume_device() fails with -ENOTCONN because
> >   udev->dev.driver is NULL.
> 
> This is a pre-existing bug that is new in this review.
> usb_suspend_device() does a generic suspend for a device without a
> driver, but usb_resume_device() refuses to resume one. I don't know
> why resume is refused. If a generic resume is safe there, that would
> fix it.
> 
> > Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> > returns -ENODEV, the error == -ENODEV block runs
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> > err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> > used in usb_unbind_device():
> 
> I will fix this in v4.

This is all starting to sound very complicated and fragile.  Isn't there 
any way to simplify it?

Alan Stern
