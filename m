Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EA36829D
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050713; cv=none; b=DQ+3bCvgWgKfoJKXw/N9BzTxzceYkp0iKwPyA6odS679HbyYIGi8eLBuy+dk+KEck7aTwq6/LiyKtSpHjPMo7NUbV1GdGevsD1vL0WwvcWrhXHC8CmrJPesPKrkgHD6WBfJdaIke3Uno4yBBGLiLURhk5uAp5SUsxnlhDPQHgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050713; c=relaxed/simple;
	bh=4VS2y3/GrqiX6NT60hImO/kyytwhvC+3QqE429NjI4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYhK/uMPF/r+0dQaERmCf2IWnvsu75IZlM3PV7LJZybJD1XYDxMrSag5mZOgupSfgXUj/7b7PsR4IjpAPQbYcJCRfY5xrgauGSBlQ0WDKQtWR5mKnbUAdsXtK6bps1ZS2tGQtGRKEzpiZkSeqQDcVy+DlJ7k0dQtVUCkCqJj7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8/zBTjb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8/zBTjb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44da2de25f3so2026645f8f.1
        for <regressions@lists.linux.dev>; Tue, 05 May 2026 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050709; x=1778655509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGVfbGeI1U30D3RPYGM1dZQzx9rDyShVKQDXtbvfe1s=;
        b=V8/zBTjbvaqvgMH/MuaIH6b3gwt6STbQpPt+QeH9QAdwLWkKW0yaGPFD9ErugE8syO
         p/B/ktb79bCgQKsfcoh/JG2crZvLV4eddXnq1Asb9jUk5aaxzfnaG4C39vp8+W2si56w
         Y1wOwnOIz3b3B63ez/QCZTdJGGKikzzlz+Vv8Rv2ib5CabHpyZoQR9nrERY76/npif/F
         ps5WSZOSWiE55C2I2Bl1vlR+HGkqFuCIAqUG9SaOWwSMqd0tuxiG+/428VEw5wCQ9Qz2
         vofpP66E4tdlksPmd/z9iDfLCWJsf6NebVLfvpvZ/mREqqw2OVg6zw07cBrs7SaU+Id/
         39gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050709; x=1778655509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGVfbGeI1U30D3RPYGM1dZQzx9rDyShVKQDXtbvfe1s=;
        b=KoFjchY0+NrwmsTKfldIPTuW9HxXrBn47emHqdN+wzCEWy4OlJ7JxTkf1KgurtT35p
         io6tejS/JE3d2y6Mq7QymENWka/TMofSKp7Iv8ALlY4M3KVQY/RlSrsGypxqd5n+MdhU
         BdClaW46CYZn3kmkdJpFEiFozp1qCh9+7sGOEmkj4QT/bm3rqL565KfhMuQBSaHloOEg
         ggngYPBwXHOcs3utlHpnrh7HgbJWKaFP61r+iBUmj21ModmffbLHeuS53ICHV//CEjm0
         U7OiAp+imsb6xu2Da8yx2e6iX/KwE4MkgG6JDSj5Qjxw3iFPfJyhyEaF8ZX/k/nbjwQw
         fnag==
X-Gm-Message-State: AOJu0YzFhmYccOURYjSMM19Am9/eZFGVzAH3hf2T/3nT+ZfBa+7Xe3Ns
	n5uniC/vIujX/ZBe4VGXWyLlA7i1rd5rdMevNBx20+g/kuVDrmUtxMVQ
X-Gm-Gg: AeBDieuhRrAIsnbOS1D8JbxXiqWOe78Jem1QR35nL4hYS6n1UFq2/oEMR4uNznR+55r
	WPmgSLD26Gwci0iIIst6JFltZbMkFdJ38GC2bwCzeIWEBkBjoO4T9PnbS3nF7Bqy34lOEEUhq8x
	lMGA3wmbF54/KY8F8QYEHy09q5J5zouTHkJkVeUvcB2Vxl3WZBX1RgGdjtG4gqkWdJkCABrF75I
	rmaeOPeI8pGqJTrNrKpgM4gdnMuUNEzhu4CWe187P4Q1mL4PyMzPiuDY7U3atn594qwEqBwJPtr
	r6e1g8E4IAUpLv3hz4cWvZW9sTPyniD916bgsG2Bwe8DNbirJQGF624hIkfsbAcMefrCz6rpe9F
	CqG449ka+Ta5UXjud+h+1fM2qQ1ccG7xaDyNxf8pSEcMzFdKqB7ttGXkP0x1fcpe2EJm/0FuXzO
	QSFJZEDqVNP+x9i29kflvtCqKm1p38NDHltah5taogUn9vrA==
X-Received: by 2002:a05:6000:2511:b0:43d:75a2:44aa with SMTP id ffacd0b85a97d-4515da96541mr3447255f8f.43.1778050709281;
        Tue, 05 May 2026 23:58:29 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm9995987f8f.12.2026.05.05.23.58.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 05 May 2026 23:58:29 -0700 (PDT)
Date: Wed, 6 May 2026 08:58:23 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Message-ID: <20260506085823.72810721.michal.pecio@gmail.com>
In-Reply-To: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Apr 2026 15:34:35 +0000, Fischer, Simon wrote:
> Dear list,
>
> I've tried to dig deeper into the issues, tried different quirks and
> small patches, but was unable to solve this or find the root cause.
> As this seems to be a regression of 6.8 from 5.4, I hope this is the
> correct list?
> 
> I got setup with a low speed isochronous USB device (Optec filter
> wheel), that is connected to a Dell R6515 server via a Lindy 300m 2
> Port Fibre Optic USB 3.0 Extender (which enumerates as a chain of
> USB3 super speed hubs). The server is running Ubuntu 24.04 with a
> 6.8.1 RT kernel. When connecting the device, it fails to enumerate:

Hi,

Are you still fighting with this?

I'm afraid I have no better suggestions than others: bisect it.
To avoid bisecting all commits, you could manually bisect major
releases and then test USB commits added by the "bad" release,
as the problem likely came from USB subsystem.

By "low speed", do you mean the 1Mbps data rate defined by USB 1.x?
That's odd, such devices aren't allowed to use isochronous endpoints
so it would be big luck if they work at all with any SW and HW.

Would you mind posting its 'lsusb -v', from the working system?

Your log shows a failure to enumerate some SuperSpeed device, while
any USB1/USB2 device should be showing on another bus (probably 1),
unless your range extender somehow changes "apparent" speed.

Also, if the problem reproduces on current kernels, you could try
sending logs (from a current kernel) to linux-usb in order to reach
more USB developers.

Regards,
Michal

> 		[ 1843.938804] usb 2-1.2.1: new SuperSpeed USB device number 14 using xhci_hcd
> 		[ 1843.950893] xhci_hcd 0000:04:00.3: Waiting for status stage event
> 		[ 1843.950937] xhci_hcd 0000:04:00.3: Waiting for status stage event
> 		[ 1843.950981] xhci_hcd 0000:04:00.3: Waiting for status stage event
> 		[ 1843.950998] usb 2-1.2.1: New USB device found, idVendor=0424, idProduct=7016, bcdDevice= 6.26
> 		[ 1843.951006] usb 2-1.2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> 		[ 1843.951013] usb 2-1.2.1: Product: USB7016 Smart Hub
> 		[ 1843.951018] usb 2-1.2.1: Manufacturer: Microchip
> 		[ 1843.951365] xhci_hcd 0000:04:00.3: add ep 0x81, slot id 4, new drop flags = 0x0, new add flags = 0x8
> 		[ 1843.951375] xhci_hcd 0000:04:00.3: xhci_check_bandwidth called for udev 00000000f628da0a
> 		[ 1843.951387] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1843.952768] xhci_hcd 0000:04:00.3: Successful Endpoint Configure command
> 		[ 1843.952825] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1843.952865] xhci_hcd 0000:04:00.3: Stopped on No-op or Link TRB for slot 4 ep 2
> 		[ 1843.952884] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1843.969034] hub 2-1.2.1:1.0: USB hub found
> 		[ 1843.969108] hub 2-1.2.1:1.0: 3 ports detected
> 		[ 1843.969459] xhci_hcd 0000:04:00.3: xHCI version 110 needs hub TT think time and number of ports
> 		[ 1843.969466] xhci_hcd 0000:04:00.3: Set up configure endpoint for hub device.
> 		[ 1843.969474] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1843.969529] xhci_hcd 0000:04:00.3: Successful Endpoint Configure command
> 		[ 1844.178598] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.178634] xhci_hcd 0000:04:00.3: Slot 5 output ctx = 0x0x0000000179f5f000 (dma)
> 		[ 1844.178643] xhci_hcd 0000:04:00.3: Slot 5 input ctx = 0x0x00000001311ce000 (dma)
> 		[ 1844.178652] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000bb87fc6b to 0x179f5f000
> 		[ 1844.208850] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.224776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.240774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.242544] xhci_hcd 0000:04:00.3: Set root hub portnum to 3
> 		[ 1844.242554] xhci_hcd 0000:04:00.3: Set fake root hub portnum to 1
> 		[ 1844.242560] xhci_hcd 0000:04:00.3: udev->tt = 0000000000000000
> 		[ 1844.242565] xhci_hcd 0000:04:00.3: udev->ttport = 0x0
> 		[ 1844.242573] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.250778] usb 2-1.2.1.3: Device not responding to setup address.
> 		[ 1844.250888] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.250919] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.250959] xhci_hcd 0000:04:00.3: Slot 5 output ctx = 0x0x0000000179f5f000 (dma)
> 		[ 1844.250968] xhci_hcd 0000:04:00.3: Slot 5 input ctx = 0x0x00000001311ce000 (dma)
> 		[ 1844.250976] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000bb87fc6b to 0x179f5f000
> 		[ 1844.256773] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.272775] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.288888] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.304774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.320774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.336774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.352774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.368774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.384774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.400774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.416774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.432774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.448774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.458535] xhci_hcd 0000:04:00.3: Set root hub portnum to 3
> 		[ 1844.458544] xhci_hcd 0000:04:00.3: Set fake root hub portnum to 1
> 		[ 1844.458550] xhci_hcd 0000:04:00.3: udev->tt = 0000000000000000
> 		[ 1844.458556] xhci_hcd 0000:04:00.3: udev->ttport = 0x0
> 		[ 1844.458563] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.464774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.466663] usb 2-1.2.1.3: Device not responding to setup address.
> 		[ 1844.466771] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.466801] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.466843] xhci_hcd 0000:04:00.3: Slot 5 output ctx = 0x0x0000000179f5f000 (dma)
> 		[ 1844.466851] xhci_hcd 0000:04:00.3: Slot 5 input ctx = 0x0x00000001311ce000 (dma)
> 		[ 1844.466860] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000bb87fc6b to 0x179f5f000
> 		[ 1844.480774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.496774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.512774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.528774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.544774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.560774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.576774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.592774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.608776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.624777] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.640774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.656775] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.672776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
> 		[ 1844.674524] usb 2-1.2.1.3: device not accepting address 15, error -71
> 		[ 1844.675151] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1844.675178] xhci_hcd 0000:04:00.3: Bad real port.
> 		[ 1844.675188] xhci_hcd 0000:04:00.3: // Ding dong!
> 
> 	[this repeats multiple times until giving up]
> 
> 		[ 1864.698065] usb 2-1.2.1.3.4: device not accepting address 25, error -71
> 		[ 1864.698674] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1864.698711] xhci_hcd 0000:04:00.3: Bad real port.
> 		[ 1864.698718] usb 2-1.2.1.3-port4: unable to enumerate USB device
> 		[ 1864.699443] xhci_hcd 0000:04:00.3: Cancel URB 00000000c8fb420b, dev 1.2.1.3, ep 0x81, starting at offset 0x16e8fb050
> 		[ 1864.699455] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1864.699474] xhci_hcd 0000:04:00.3: Stopped on Transfer TRB for slot 5 ep 2
> 		[ 1864.699481] xhci_hcd 0000:04:00.3: Removing canceled TD starting at 0x16e8fb050 (dma) in stream 0 URB 00000000c8fb420b
> 		[ 1864.699489] xhci_hcd 0000:04:00.3: Set TR Deq ptr 0x16e8fb060, cycle 1
> 
> 		[ 1864.699495] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1864.699500] xhci_hcd 0000:04:00.3: xhci_giveback_invalidated_tds: Keep cancelled URB 00000000c8fb420b TD as cancel_status is 2
> 		[ 1864.699510] xhci_hcd 0000:04:00.3: Successful Set TR Deq Ptr cmd, deq = @16e8fb060
> 		[ 1864.699517] xhci_hcd 0000:04:00.3: xhci_handle_cmd_set_deq: Giveback cancelled URB 00000000c8fb420b TD
> 		[ 1864.699522] xhci_hcd 0000:04:00.3: Giveback URB 00000000c8fb420b, len = 0, expected = 2, status = -115
> 		[ 1864.711179] xhci_hcd 0000:04:00.3: Cancel URB 00000000301149a6, dev 1.2.1, ep 0x81, starting at offset 0x125370300
> 		[ 1864.711194] xhci_hcd 0000:04:00.3: // Ding dong!
> 		[ 1864.711211] xhci_hcd 0000:04:00.3: Stopped on Transfer TRB for slot 4 ep 2
> 		[ 1864.711218] xhci_hcd 0000:04:00.3: Removing canceled TD starting at 0x125370300 (dma) in stream 0 URB 00000000301149a6
> 		[ 1864.711226] xhci_hcd 0000:04:00.3: Set TR Deq ptr 0x125370310, cycle 1
> 
> 		[ 1864.711232] xhci_hcd 0000:04:00.3: // Ding dong!
> 
> 
> When booting into a 5.4.288 PREEMPT_RT kernel we were using before
> with, everything works fine (device enumerates and works). When
> exchanging the USB Extender for a Lindy 200m Fibre Optic USB 2.0
> Extender, everything works fine with the 6.8.1 kernel. I cannot
> inject a USB 2.0 hub before the extender, because it is a super speed
> device and not compatible.
> 
> Any suggestions how to fix or further investigate the issue would be
> greatly appreciated!
> 
> Kind regards
> Simon Fischer
> 
> 
> Developer
> Department E5 - CoDaC
> 
> 
> Max Planck Institute for Plasmaphysics
> Wendelsteinstrasse 1
> 17491 Greifswald, Germany
> 
> Phone: +49(0)3834 88 1215
> 
