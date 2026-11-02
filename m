Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587334;
	b=UKoQhk5Pw6mw75WIU+U3lul1uUNpsprVP5GUv4l+eiOWKJZkZfqAavgdpwEIVIaCJPAA
	 P2jzmcPYru62gR6u6WkK23Xze5ohyD5soSrk+fTyHoKHq4pjRnX6+UzRj3CDQtN451u1Q
	 KVs0r3icoQwBWmrK29lbUHnoF6b68/KLKcGtNL7m/eXD1/l0Z1GjAo5u/I+WJVKpdYoru
	 nopavduxsXxo6P4Yv/AL1ozgLQZSd+qKpXN8oGsFb7fG8QHYD06noQNcAbis5ideTKlj6
	 YIkSxnn0JZyheUcmstyh4fjIjR/1N7sv/ZZ2LcYbkXJHl6AkNNmaC01TqAg6p+J17GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
	b=omtUrXPfdhk0p/0CXs/97pUc8PPsO8fMg+yrK9hu0MKb9H/gIM/NRzuhI2MgnvH6ur12
	 02BgP9yFwF/AfdRI20jsm1UvoVu8W5NpZhxf9+/170krjwkvqJJrpxXs+6yQByJcPITf7
	 mSe/gun5aJBdfU2FlFC/A0zjZb/o8cIS35sxpU4fKfqnRf8ptB4d6248sCT/YaL7vDkve
	 lvBdUcKjxUD0oKKWN16MAHvr/j3nx9i+InDQP2bCu5N7ftDN13g2gHDw7lK3PIuauQz+W
	 ESg0P6DguPUPDr6Km3ss/IHqTFzabsKAbiM783BH3h6Ht36rkCeGFL4WBBUZxluM/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q8zePUgb;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3167606A324
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 02:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3167606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q8zePUgb
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f2f2edb19so249398785a.0
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 18:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793587333; x=1794192133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=q8zePUgbPubU861j24avi63H9bVkDP9cWNIFckFBd4bBLo9PqwK/SS7CbgfoEXOJ7a
         /88t7Oy0r+QYeMRTvSV53AZsNs56RUv4Z6tiPY532Qt7B+89O4Wzs7VulxLlJBBftoIs
         SCDXJVRWKX9sNaqzLPDWgL/4b/m3NeaIuSMzH2PSOVYjasoO/MAlXznXfQlFd9eDRcV1
         WgWdFKzMM/e4UFokBzE5mNYVr4WH1r4M/oFFEHEwUQ1x1/DcZgGyPB9dIcpMCQqp20EU
         fb+3jwCU7UL9QXqYIkHGYn+vG2KnwH0URc1mWUG4Q8NjSAHWrO9ZzOCaNsGSvUKw2NdK
         HpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587333; x=1794192133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=WFcuMknTWvPBXtH4pChkNpndG4qXCUhYmbEvVe9hvg50QZ2MDEmuEk/tJEaA1/pWpB
         u6EpjoGVuje/rJhjqG3O6X81jhoQvLVfaBW1+X9LGQrZ3XNS56mJZwqcyZuDtF91/Hjb
         wiueTPhzsL+rhuaUtzcy9WyVyA8+PKin0INgq1qBA+DGWLFGSn+0fh3MGAMcdyLGMPRI
         jg17F9R7gmBSPxoym4XvXGsaXZNewg7fCWz3AaJYfyYWPMZxogYM2EWD5TRCNKPB60sz
         n0tigEFP/F1TVIc+6yi9SSf3FmP+ekIavAmy8dhAHCE1z9EQBSI8LIfTMiYLae6pCgWj
         HOHw==
X-Forwarded-Encrypted: i=1; AKwUvBxdlkURciBvlBbPylBuWJUiari7/wIIDjgrtsqWNfYYryKqK/H2SYNvhAzQ8Emmqdsv0+7x1rDb/Ej8sQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKtuLunZZV+6tFb3e0ZIOx1xfktvOLVCjTfhjJP+hVaoon0pBiJ
	K0MQGDpF4+EVhBs5IBOxifblblRqhI90OZzQ2youRLyRGZaPnj1T6Mib35SJPBziBA==
X-Gm-Gg: AYBFou2hVDB4zyiGN5xzF5V1Cv6EWF5z+eCPNagCd/DXUDaPsV1d0VCmzbIm+yifUrL
	635Hv1kOM3MURENklLiyTiHRQLKoicUyZK9dEbdcA0xM64dck1/MkxU2fcMtummSR9P9xhZxrX1
	IFzJtVsnDHh3ujhoVjd+kUv1C470DjSbMP0qQq+OG7FywMP4lMGPgF2x5hdX11l65yB4QCQsWKO
	7hWs7Hr63IJ+0IKC6lrz+TXsA3M59vvuzLU5mxJAH2gBi55AKeQ1FftEufCUX3U4BQa9QegMLH5
	iwqFrU7BkbXPWngZy2IpIHNXAeP2ZWJML04qUYEN8fX6KU/4p7OISjgxi47k08QMibI25U8PjkH
	0K2okO7eG0cNI+FYxkwUlOFegA5FcQrybAsjh/xcW/q8Hte3kmaKU/7Iv+i7LnbqX/l/UIx/Y5c
	ynD+fIum+HGYTSZEsCWs3i0J8Fjx1tr5vtedvrmQ8ljD0iaX0sgqEkDNWgU9ZHV8syL1nNK9LXq
	zzmkY5ikXRZhvE5NYVfon0FHf1oX1K7xuRmJBopfT/zZOsa9IMazZk9Q8j2zD+8q6sHGxcV/zff
	MF2TOZAEcLB+gIuPZY9V3k4KBNSN
X-Received: by 2002:a05:620a:3916:b0:93f:47fa:b722 with SMTP id af79cd13be357-94421618771mr1465258685a.13.1793587332748;
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm724633685a.27.2026.11.01.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Date: Sun, 1 Nov 2026 21:42:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <b666dc31-1dde-41c3-be0c-3ae5091b9683@rowland.harvard.edu>
References: <20261030151919.3511106-1-jjc@jclark.com>
 <sashiko-outbox-191184@kernel.org>
 <20261031032449.3536559-1-jjc@jclark.com>
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
In-Reply-To: <20261031032449.3536559-1-jjc@jclark.com>

On Sat, Oct 31, 2026 at 10:24:49AM +0700, James Clark wrote:
> On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> > However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> > undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> > usb_unbind_device() does:
> [...]
> > Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> > to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> > usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> > the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> > second time and emit a duplicate USB_DEVICE_ADD notification without an
> > intervening USB_DEVICE_REMOVE?
> 
> Both of Sashiko's points are correct, but both are pre-existing and this
> patch does not change them.
> 
> Before the patch, a probe() failure returned straight after
> usb_generic_driver_probe() had run, with neither the configuration nor
> the runtime PM reference undone. That has been so since commit
> c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
> The -ENODEV fallback has re-run the generic probe under
> usb_generic_driver since commit 88b7381a939d ("USB: Select better
> matching USB drivers when available").
> 
> The patch deliberately handles a pre_probe() error other than
> -EPROBE_DEFER exactly as it handles the same error from probe(), so that
> the fallback keeps working. This is stated in the kerneldoc. The only
> new code on the error path is the disconnect() call, which undoes what
> pre_probe() set up. A complete unwind in usb_probe_device() would be a
> separate change.

Since your new pre_probe() will interact with the bugs mentioned by 
Sashiko, perhaps you could submit a patch series which implements 
pre_probe() _and_ fixes those bugs?

Alan Stern
