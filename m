Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926943;
	b=0Tb0v1L4a9ywOoCkL8MGkyjeeBKB8h/Q/61hSCHEBf4rBaA58xuvynZfdy+ws5lbaGdw
	 qX3HYJXF8Y0BVtG1EwqKNGZt6hnzFc06Fwpy1GBvTGBVrbK1bhxqG8sQaoQwmX5fWxEjk
	 EeK7YxXFDcpao5BJR71TiInNJIUJqee1L5cPu9m4WKKCxCtx6fWe/fX/EaIeJY+C7p+LV
	 0uo68ANBd9JxZhIx585FENZ2qWqRv5KhVeMF7c3+LS4wEThG9Ppd0I5rUR8QDWmT/XgRj
	 rQAd1K8+z0fkhwjoRdAvTGidx+KfMguVqx62qLRYBMFA6tX5rjybuHUEzV0mYHPs/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926943;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=X4+gdRwqeDx2N4uoyJeCOYNCXQpYWhAbljW4FxODZcI=;
	b=zW2AbrzLf8qqeZEKtuRroqcJJtCTHr3qemMonjWf0My4ZMlbtE/7D+PM8sB1jF4FwXB1
	 qUx11OGFZqjMjxMg1EE2SwFELRjqj4wcUtirgqie+Lt1b0nph3IxlLMphLOEySoVViFme
	 MY+vgeyq4zap/uSLYKRKBxLuVoAnvsjr8fsfwmn+XbuekPb8ELp98ESQfH3djTeMGUeV0
	 EdXVwWxuDzIZGzIEQldJMuPKPI3uO+5vmc+nsDfb+FIPIvyuQOHy8I1XhzNJT6bjySbJ6
	 OauBMrkTlDKAGNwNjkdmbf44PCNH4FYHPZ4buB1v/jd3hVKC87WkOvUSSO6QO9S6NZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dsine.de;
	spf=none smtp.mailfrom=dsine.de;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D67606A31B
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D67606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dsine.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dsine.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jCDhB6MC5zKnBV;
	Sun, 25 Oct 2026 12:15:38 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=none (outgoing_mbo_mout: domain of dennis@dsine.de has no SPF policy when checking 2001:67c:2050:b231:465::202) smtp.mailfrom=dennis@dsine.de
From: Dennis Wissel <dennis@dsine.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject:
 Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Date: Sun, 25 Oct 2026 12:11:21 +0100
Message-ID: <ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
In-Reply-To: <20261025111410.2c14fcef.michal.pecio@gmail.com>
References:
 <4MjB9K-2SoiA85WbI9iEig@dsine.de> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 4jCDhB6MC5zKnBV

On Sun, 25 Oct 2026 11:14:10 +0100, Michal Pecio wrote:
> This could result in DMAR faults, but it didn't. Was IOMMU enabled?

No. The kernel command line has no intel_iommu=on,
CONFIG_INTEL_IOMMU_DEFAULT_ON is not set, and /sys/class/iommu is
empty. DMAR is only used for interrupt remapping. I won't boot
7.3+1f36cc9fa949 again. The box now runs 7.3 with 042aad8d0db6 and
7e0ef4332ed9 reverted.

> But can you post what happens on 7.2 with xhci_hcd and usbcore
> dynamic debug enabled?

7.2.11-1-cachyos booted with "xhci_hcd.dyndbg=+p usbcore.dyndbg=+p
log_buf_len=16M", mouse plugged in at boot. Below are the lines for
port 1-1 / slot 1. The full log is 270 KB, so I can send it off-list or
post it somewhere if needed.

This time all four interfaces failed with -71, not only 2 and 3 as
in my earlier 7.2.11 boots, and there was no "usb 1-1: reset", only
the disconnect/re-enumeration. The device seems to drop off the bus
right after Set Configuration, at the first control transfer of the
usbhid probe:

[    3.537963] xhci_hcd 0000:00:14.0: set port reset, actual port 1-1 status  = 0x791
[    3.538304] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    3.538344] xhci_hcd 0000:00:14.0: Slot ID 1: HW portnum 0, hcd portnum 0
[    3.540254] usb 1-1: ep0 maxpacket = 8
[    3.540543] usb 1-1: New USB device found, idVendor=3434, idProduct=d068, bcdDevice= 1.00
[    3.541469] usb 1-1: configuration #1 chosen from 1 choice
[    3.541509] xhci_hcd 0000:00:14.0: add ep 0x82, slot id 1, new drop flags = 0x0, new add flags = 0x21
[    3.541673] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x6a9
[    3.542427] usb 1-1: adding 1-1:1.0 (config #1, interface 0)
[    3.542477] usbhid 1-1:1.0: usb_probe_interface
[    3.542526] usbhid 1-1:1.0: usb_probe_interface - got id
[    3.542566] xhci_hcd 0000:00:14.0: Transfer error for slot 1 ep 0 on endpoint
[    3.542606] xhci_hcd 0000:00:14.0: TRB error 4, halted endpoint index = 0
[    3.542646] xhci_hcd 0000:00:14.0: Hard-reset ep 0, slot 1
[    3.542725] xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
[    3.542923] xhci_hcd 0000:00:14.0: Port change event, 1-1, id 1, portsc: 0x202a0
[    3.543163] xhci_hcd 0000:00:14.0: Transfer error for slot 1 ep 0 on endpoint
[    3.543203] xhci_hcd 0000:00:14.0: TRB error 4, halted endpoint index = 0
[    3.543244] xhci_hcd 0000:00:14.0: Hard-reset ep 0, slot 1
[    3.543326] xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
  [... the same 4 lines for each further control transfer, about
       every 0.5 ms ...]
[    3.544720] usbhid 1-1:1.0: can't add hid device: -71
[    3.544804] usb 1-1: adding 1-1:1.1 (config #1, interface 1)
[    3.547532] usbhid 1-1:1.1: can't add hid device: -71
[    3.547617] usb 1-1: adding 1-1:1.2 (config #1, interface 2)
[    3.550329] usbhid 1-1:1.2: can't add hid device: -71
[    3.550413] usb 1-1: adding 1-1:1.3 (config #1, interface 3)
[    3.553190] usbhid 1-1:1.3: can't add hid device: -71
  [... hub_wq enumerates the other ports, nothing for 1-1 ...]
[    5.065514] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0002
[    5.065577] xhci_hcd 0000:00:14.0: Get port status 1-1 read: 0x206e1, return 0x10101
[    5.065637] xhci_hcd 0000:00:14.0: clear port1 connect change, portsc: 0x6e1
[    5.065692] usb usb1-port1: status 0101, change 0001, 12 Mb/s
[    5.065697] usb 1-1: USB disconnect, device number 2
[    5.065750] usb 1-1: usb_disable_device nuking all URBs
[    5.065810] xhci_hcd 0000:00:14.0: drop ep 0x81, slot id 1, new drop flags = 0x8, new add flags = 0x0
[    5.066201] xhci_hcd 0000:00:14.0: drop ep 0x5, slot id 1, new drop flags = 0x6a8, new add flags = 0x0
[    5.170113] usb usb1-port1: debounce total 100ms stable 100ms status 0x101
[    5.354755] xhci_hcd 0000:00:14.0: set port reset, actual port 1-1 status  = 0x791
[    5.466345] usb 1-1: new full-speed USB device number 11 using xhci_hcd
[    5.597007] hid-generic 0003:3434:D068.0009: input,hidraw8: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
[    5.684004] hid-generic 0003:3434:D068.000A: input,hidraw9: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
[    5.685139] hid-generic 0003:3434:D068.000B: hiddev100,hidraw10: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input2
[    5.686139] hid-generic 0003:3434:D068.000C: hiddev101,hidraw11: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input3

So on 7.2 the disconnect (portsc 0x202a0, CCS=0) is reported at
3.542923, and the device is connected again (0x206e1) by the time
hub_wq looks at port 1 at 5.065. There is no other port change event
for 1-1 in between. All ep0 transfers to the gone device fail within
about 0.5 ms with a transaction error, so the probes are done after
11 ms.

Regards, Dennis


