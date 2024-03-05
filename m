Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31151111A2
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709601344; cv=none; b=J3YehWyrhNzcWCXw9ZYKKDMRNvSnV8c6VMG1YLIoseQI4LAgedx3XJ/AovnOpEmxSSQYDkDytSf5Nm0QofY/ns7OMHYyXCLg9vR9e9DUTRMVDcZfnoZH+79FOmX/RFkYpdcSZwNFfYENPC58E68DLKkq5SFj6Vlzn0YCYH2w9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709601344; c=relaxed/simple;
	bh=rNYrYnUDeiQThIlOLf7GZzdLyTpjLYQxAmN0MpVAUGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzJvpzv/V3rHtGj2aJUC6OPGR1L5Aa17Wxrgpl/ZMcst+GoMTNPqs4Mmy+TfAWh9kjtmfD6+i3NQz4u76I/fIvsd89qVBg7FegnlYzPdeMqBus8kRgKwHeG59GZ3oQofNqVQXmXPSzZnipIafapQ5o0I1h+DR4X5Z9CTQUUcryA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFAGYjqY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFAGYjqY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-299354e5f01so4666975a91.1
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 17:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709601342; x=1710206142; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a97puSPee8NDveftoKysQGZs9RYm6VyTGxwyRsunH+Y=;
        b=PFAGYjqYeg2tU7Nq7BJCxtyPN7faogZoxh++p5+EdR3BH9b2S7m5c9Cn7ntWs2dW93
         rRaKt4WbWj1Kzdz+nxMZawj2hyuFL6k6nHhX1Eek6ucMKTYizqlfvhU5BpBiv5qDNITh
         DiqcLs0fm5a8szOaWqNo0Df3aeo8UiFSBS7VdhN2B7lszEP5z28WoZG1f2Q/u5V3BvEt
         lOkPzf9oY6Zte7+QhBOv5vT31VhLTRzJtWIAhhxx19nMKizb020tVg9CK2gTOTk+sFQL
         AXQJwYjCTjdeXyXMuFR+8cPmqY8xTuzUSXNyoi7WF4Q07Z4zSZUauAF5IfLRsqKsFj0A
         I1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709601342; x=1710206142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a97puSPee8NDveftoKysQGZs9RYm6VyTGxwyRsunH+Y=;
        b=pJ9Z/1fS6uojZa2kGfcXw74sgn4xh27o7d1iRvqy9AflFxxjOGz2etfip8KvEU5CJ8
         /zIFaH6UUeIvGhYxI/Lxv6ogCA9025Q0cXZtZC7mkLXMR5iFXMN1L5hJe62xXIhjFq7E
         Vg76V9cJCefPz6/pplVdWzU/dr5s6BqVMNm2a+6KKLk3u85GbdLPQsE7OfXWNl4+t1sA
         uubcV8ksJ0aCG6aoEzADXoKMlcE6nagP7dR1yzpmlzA9e9Z/+jo+KxJxeu5NU2I4eLvc
         4xdXDd0mtC3y7KzRbuZyzAgcKCmQEwfHpFtGYenKMjbzxK928Mlr/w97SJG5BTquxC+G
         Zx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYFeRoc5uvdPu7bPCAkACriVeAXsXI3eVRHc+GG/zKrFulvA+G5TX179qmb6EIiLqFkaGWGL7xvW21dhNguWBH/J+774P3jdq/wJs=
X-Gm-Message-State: AOJu0YxCPnmCZ6MgE7+jXZ+tIFd1puo1It8ASNb/qVJ1dwZ389PWWiBb
	u4y1DrPBsMKT3tNBF+NfTFBZyQI+ZYPcXaDbKsXHKmFsxp834MXRoetG+wn8
X-Google-Smtp-Source: AGHT+IGf/n6nOjCwoUrmBtzH0Ck54FjovaK9aQfF83w1GFO/2lpWpRKOz6N0/J/WgsAWRf4Tx45MzQ==
X-Received: by 2002:a17:90a:9601:b0:29b:9e1:2fb0 with SMTP id v1-20020a17090a960100b0029b09e12fb0mr1416148pjo.0.1709601342390;
        Mon, 04 Mar 2024 17:15:42 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090b010400b0029af35db43csm8520610pjz.43.2024.03.04.17.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 17:15:42 -0800 (PST)
Date: Mon, 4 Mar 2024 17:15:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Henrik Rydberg <rydberg@euromail.se>,
	John Horan <knasher@gmail.com>
Subject: Re: [REGRESSION] Missing bcm5974 touchpad on Macbooks
Message-ID: <ZeZyO7RUGyC8BRKP@google.com>
References: <87sf161jjc.wl-tiwai@suse.de>
 <6ef6c5bf-e6e5-4711-81c6-6ae41de2e61e@wolfvision.net>
 <874jdm17yt.wl-tiwai@suse.de>
 <449417ca-aae1-4868-a96f-a99ac5d187d6@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <449417ca-aae1-4868-a96f-a99ac5d187d6@gmail.com>

On Mon, Mar 04, 2024 at 09:21:19PM +0100, Javier Carrasco wrote:
> 
> There is indeed an interrupt endpoint with address 0x81, but the driver
> defines bInterfaceProtocol = 2 (Mouse), and the endpoint in that
> interface is 0x84:
> 
> #define BCM5974_DEVICE(prod) {					\
> 	.match_flags = (USB_DEVICE_ID_MATCH_DEVICE |		\
> 			USB_DEVICE_ID_MATCH_INT_CLASS |		\
> 			USB_DEVICE_ID_MATCH_INT_PROTOCOL),	\
> 	.idVendor = USB_VENDOR_ID_APPLE,			\
> 	.idProduct = (prod),					\
> 	.bInterfaceClass = USB_INTERFACE_CLASS_HID,		\
> 	.bInterfaceProtocol = USB_INTERFACE_PROTOCOL_MOUSE	\
> }
> 
> where USB_INTERFACE_PROTOCOL_MOUSE = 2.
> 
> 
> My interpretation is that the driver is checking if the endpoint with
> address 0x81 form the interface with bInterfaceProtocol = 2 (that is the
> last interface of the list, the one with bInterfaceNumber = 2), but it
> is not found, because its only endpoint has a different address (0x84).
> 
> Interestingly, 0x84 is the address given to the endpoint of the button
> interface. The button interface should not be relevant for Macbook 5,1
> (TYPE 2 in the driver), according to 43f482b48d03 ("Input: bcm5974 -
> only setup button urb for TYPE1 devices").
> 
> If that is true, does anyone know why bInterfaceProtocol is always set
> to USB_INTERFACE_PROTOCOL_MOUSE, and why the driver works anyway with
> bEndpointAddress = 0x81 for the trackpad? The urb setup for 0x84 is only
> executed for TYPE 1 devices, and the mouse interface does not have an
> endpoint with address 0x81. Or am I missing something?

The driver is naughty, it binds to the 3rd interface (bInterfaceNumber
2) but actually pokes into the 2nd interface with endpoint 0x84 without
actually claiming it. Your check expects that the endpoint belongs to
the interface that the driver binds to and thus fails.

> 
> We could revert the patch in question, but I see no reason why checking
> an expected interrupt endpoint should cause trouble. It looks like there
> is something fishy going on.

Yes, the driver needs to claim both interfaces and when checking use the
right one. I will revert the patch for now given that it causes
regression and we can try fixing it again.

Thanks.

-- 
Dmitry
