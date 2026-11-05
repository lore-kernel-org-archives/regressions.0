Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910628;
	b=HzJsh+xZkMlZ8FocpCIMapoO13RAotCmTkcLEof0dbhRJw6Ww0t+N9IYR0xWHQInk26N
	 xye+NqPF8ce49K7nGxWha/xdr5Bq1xlyi3GXEv81dWAQ29hpbiSoo62de2e5us5mWb6KB
	 YqQ+Hyv0C+A4PBD+CknCaWKaJcaBhDmMbRLbTaXFEeos4KjD9nMxhQfXszAx0XufMgoNt
	 kOXQPjkGoyJUdVMiDmYa4eMB5qzGTa9MvEhTbHjkfz9Nur76O9utKs1/pUivVdKz8eoRL
	 JXUf5uIKsTNfm0Bluh34BTeMjUkhB3MinR06KpOg2z71cpQoGjQpGfcmoybYPNRKg8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
	b=TXAf2wHSykbyeRRu59VPqD8+E36md/PmyVHqX5hTvaS7b1lGj5UQigNwbgRmBGPt4UwT
	 EbzXgJXkciY6O4MSTo0UEp1lvoA/CCqGFQMlM0mNkZ12Z1zi2ULiQuyczGl/BJK98h4w4
	 eaFrUiWB3EqzXsli3eKGOsnIRbPmu0l1R9bSBtgfoaQNtDFF/twQ5LrK7cEAW+JUvRwer
	 OgbRPfvJ6xzDYz+/hpyYjlLbVQ0X6Zdp0xcfhzmv/Fr0jJww0VjNkz5ebEVuLYuPcaYkZ
	 ududJbOvJWcvX97XqzcBN7Lsrxdh4Q96muTm7Zp+S+vU7fhpKTdLCfi8H5kAkYqApWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q36Dd9bx;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F2606A328
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 20:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0F2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q36Dd9bx
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54cf9f1a7fdso8320341cf.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910627; x=1794515427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=q36Dd9bxq/2Jm/H4aUtWX9swGRQ/kt/Rtc9sFneKd5Nw4cFmt/clLU64a53+cZx+3q
         BStCaV8lx1foPQ2qNVpQ3hTziEHQ+OwZ2n5t4qbKwtNZc4r7EEy+Tb2MPuwTnrOAAFsT
         ixOEAfsI47xjeS74x+6miOc2AbPnIi12bW9WfSANw4k8gzpwbrtL0UrNl4ZBAZoEWRAz
         v0c/UH2JJnBGhtWT/or924wnH+QXkeGv5BkbxV/+P3TYEQBa2hzNWecyXjQZ//7R02BY
         fDws7fxE0d/j6+726uK1TPmoKricrgnDzeR6L+zYcVddTanXGecorATGHob5zkNf8HOm
         68aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910627; x=1794515427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=ZrXWW7CHUAICSYbq+KjjwV8ZiRjTXC4YT2XcArm9VCdui0HUwINMb9j3xOhrJOndOG
         pQco2CLA/sCCmjnAao6bYIq5rbguO7sXYZgAYwoyFLaJWEWtW+tkz0IQd0FEZ+gkWCDa
         bFctMAdjbnc0+Q+f6joOrr3QzBFuH2QHKNblMNUrrf+i+xJrQUzEs+nvkx0HhqCd3vnw
         2T1Br32X37TFpYAXUearuq2diw+w2r4Pf9fl86Zewd4cVFAJQ8QXK5D91v7rNyTI9JzP
         nmpNd5n1ovv47hlnVPTi2fdsv7dMIgXTbepeQhavLac2XLtvs1+fLuR0Ebt1mBN7ZEOr
         R7aA==
X-Forwarded-Encrypted: i=1; AKwUvBxNuAqlDxz3dLX7ylOhoBCshVjJpnz6PNmIeApDDLGZTIE5MkAjaYGlMPoqw3zk2r+KUPCWiryynzJuGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8w9niITLBUglQNNCBr2Wh4B0Dix1PYpGH1ckzlDPpsjktF327m
	1iAuKaL8+9PkxoQXZWCBAy50wSyLzwl/2poa5o1GEfteEx/maNCibl7r/e/t9GmRVg==
X-Gm-Gg: AYBFou0yTfNXA4L+Gaulye6HZeHh0jXDN/BC/67xgfgXpnS9kqWU2MFt/LuCAn4n2ll
	CCljyj5aRx61AaYR+KRbLJELICiGi+vKKZoOoDhAOluhH9eL6A89GU3Ve0VwpyMqZp3LNQ89ef9
	k2ptq1WxGR+tGXqU6WFTx4Uuf/rXVnPSrVNy0Yaqk/YeGu9bHBSCkNVvZDEX50Quxpi8iNYLmB5
	UArQaJJiBMdFGMmCrK3tUu3FAVm6/EDOYaMtkQDfHm6p4rw8JHXohMWm5DvSrwrrcG3hIqo2H8z
	9/ewlcYeVjIcrBHnoht8l8BrY++Gqw338CpQzO513XOKMCXPOncTM9xyl9T1Z65aZkxVz+73Gz5
	kIQDddoYAxJ43vZdMzAiyanR1ZIc0gxQu82LdMLEphK/7aESVkXVIBYwDacgEkHHyTlI09EKsel
	0O3GqNm5Q2Jy4vrC6Tg/v2XHiub2r+CsWHsVq40ABjNfCMOAjRuutfhoTvkdgjbpCGCcZZToFg9
	fMZXJQ3LwXt3JWGzw+qjAAVpBTXLrdv+6P1C9xK3Vsx/bxNR3BuFvhhyABCKUPKnd1cqBx/EBBs
	w5vyWzkA41TzBWjntrcueELJh/iM
X-Received: by 2002:a05:622a:2308:b0:532:cad2:539f with SMTP id d75a77b69052e-54e1576ccbamr6840201cf.53.1793910626495;
        Thu, 05 Nov 2026 12:30:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a9csm2142601cf.11.2026.11.05.12.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:30:25 -0800 (PST)
Date: Thu, 5 Nov 2026 15:30:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 1/2] usb: core: clean up before handing a device to
 the generic driver
Message-ID: <9372664c-a8d4-4098-ade2-b73ec214960c@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
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
In-Reply-To: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>

On Tue, Nov 03, 2026 at 10:34:12AM +0700, James Clark wrote:
> When a USB device driver's probe returns -ENODEV, usb_probe_device()
> hands the device to the generic driver. It does not first undo what it
> did before calling the probe. This causes two problems.
> 
> First, if the driver sets generic_subclass, the generic probe has
> already run. It configured the device and sent a USB_DEVICE_ADD
> notification. The generic driver then does both again. Notifier users
> such as the usbport LED trigger see two USB_DEVICE_ADDs with no
> USB_DEVICE_REMOVE in between.
> 
> Second, if the driver does not set supports_autosuspend, a runtime PM
> reference was taken before the probe. Nothing drops it, so the device
> can never be runtime suspended.
> 
> Clean up before handing the device over, in the same way as
> usb_unbind_device() does when a driver is unbound: first, for a driver
> that sets generic_subclass, call usb_generic_driver_disconnect();
> second, for a driver that does not set supports_autosuspend, drop the
> runtime PM reference with usb_autosuspend_device().
> 
> This leaves one limitation. Until the generic driver binds, the device
> has no driver. If it is runtime suspended in that time, it can't be
> resumed. This is transient: the generic driver resumes the device when
> it binds.
> 
> This change does not alter what happens when the probe fails with any
> other error. The device stays configured, so its interfaces keep
> working. It keeps the runtime PM reference, because a device without a
> driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
> sending USB_DEVICE_REMOVE would mean unconfiguring the device.
> 
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>  drivers/usb/core/driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb..9b8cd0e4219e 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
>  		error = -EINVAL;
>  	if (error == -ENODEV && udriver != &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
> +		if (udriver->generic_subclass)
> +			usb_generic_driver_disconnect(udev);
> +		if (!udriver->supports_autosuspend)
> +			usb_autosuspend_device(udev);
>  		udev->use_generic_driver = 1;
>  		return -EPROBE_DEFER;
>  	}

I was talking about more than just this part.  What happens if 
usb_generic_driver_probe() (near the start of the function) returns an 
error?  (And shouldn't the lines that test the return value and do the 
early return be part of the same conditional block as the function 
call?)

Alan Stern
