Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792864036;
	b=xnT//yklySEk5iRGM+N3MGjPHxkidH8qCZpMi3XCFHGDD/nYGyaYbpFqWQslr/aGu8cU
	 JUQilZ8mkzjPFkciqkZk5MfjL9PsxPxE9Hz5dd7PjYOMz1Hg+Mp82VRH1qjKdhTp6gfu8
	 OiGT/SBI3M/vmPRcsGGS4fwdtlFuZKS5u/lF8HGofJmKTtv1O8I+HzY/u3SlImPoZLz9c
	 tjwL3JloFnDh42Tfvd9ia/Fila1Uj4p6BXJXjXQaQn/uVRqrTA5ER0lMzAa2lxhSQ8bSp
	 z8hLZCg1hltW1Gl8KODyK9U9w9JKTbBvmxoNWHybXGvGTnM4tqYM8TpIQ/0xf9ZPEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864036;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=Fr8UuTG87IUnTlzU94/RiGvziyfYThaUlwDqUzN83Q0=;
	b=062cB9AW+z5NyRiapoSBxj1HYhA3iQ1LxrBUcC19ddE9rUJ7QTOcMXnerw5Wm1YY3s4c
	 jXeC0S/To8Cs89X8Y00dQoVDPd4EtNzU2b77V8XSIMt2EmXphcHzG+euiDVFKfor2udSe
	 /YtgyG9fkjI5eYgnkEwW7oqncaa7MXecQXtLa982h2x/VEC7qznGCN+HrSUuq9evqZpDO
	 JV30iG680ntnuuGtvbK6ultU3Gx3UrSmCHvr06KlRoyrcgNpPkV9g5rz4FS9j2YrhiRX5
	 wDwcqiPW2lAn3eoMnzFhJ2Pw2nvV/EPf0Q0zzbVoHdDP6ZmPG9TRTA3zWXdArf7BGvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dsine.de;
	spf=none smtp.mailfrom=dsine.de;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DD606A31A
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 17:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dsine.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dsine.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jBnQR6kXDz8sb9;
	Sat, 24 Oct 2026 19:47:11 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=none (outgoing_mbo_mout: domain of dennis@dsine.de has no SPF policy when checking 2001:67c:2050:b231:465::102) smtp.mailfrom=dennis@dsine.de
From: Dennis Wissel <dennis@dsine.de>
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject:
 [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5 (3434:d068)
 at boot since v7.3
Date: Sat, 24 Oct 2026 19:47:10 +0200
Message-ID: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
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
X-Rspamd-Queue-Id: 4jBnQR6kXDz8sb9

Hi,

since moving from 7.2 to 7.3, a wired Keychron M5 mouse (3434:d068,
firmware 1.0.0, latest) that is plugged in at boot makes the boot hang
for about 3 minutes. usbhid probe times out on every interface with
-110, the device is disconnected and re-enumerated in a loop, udev
stalls, and when the desktop finally comes up neither the mouse nor
the keyboard on the same controller (NuPhy, 19f5:103b, port 1-5) works.

Hot-plugging the mouse after boot works fine on 7.3: all four
interfaces bind and there are no errors.

On 7.2.11 the same device at boot fails only on interfaces 2 and 3,
and it fails right away with -71. Interfaces 0 and 1 (mouse,
keyboard) bind and the mouse works. So the device firmware already
seems to misbehave at boot-time enumeration, but before 7.3 this was
harmless.

Hardware: Gigabyte Z790 EAGLE AX, i7-13700KF,
  00:14.0 Intel 700 Series Chipset xHCI [8086:7a60] (rev 11)
Kernels: 7.2.11-1-cachyos (good), 7.3.0-4-cachyos (bad). These are
distribution kernels (CachyOS). CachyOS's USB/HID config is the same
for 7.2 and 7.3, so I think the change is upstream. I can test a
vanilla build if that helps.

7.3.0-4, mouse plugged in at boot:

[    3.491895] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    3.492774] usb 1-1: New USB device found, idVendor=3434, idProduct=d068, bcdDevice= 1.00
[    3.492894] input: Keychron Keychron M5  as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:3434:D068.0001/input/input3
[    3.492951] input: Keychron Keychron M5  Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:3434:D068.0002/input/input4
[   29.274413] usbhid 1-1:1.2: can't add hid device: -110
[   29.276093] usbhid 1-1:1.2: probe with driver usbhid failed with error -110
[   54.874362] usbhid 1-1:1.3: can't add hid device: -110
[   54.875509] usbhid 1-1:1.3: probe with driver usbhid failed with error -110
[   56.380225] usb 1-1: USB disconnect, device number 2
[   56.786013] usb 1-1: new full-speed USB device number 11 using xhci_hcd
[   82.522447] usbhid 1-1:1.2: can't add hid device: -110
[  108.122321] usbhid 1-1:1.3: can't add hid device: -110
[  108.123378] usb 1-1: USB disconnect, device number 11
[  108.389087] usb 1-1: new full-speed USB device number 13 using xhci_hcd
... (repeats)

7.2.11, mouse plugged in at boot:

[    3.488582] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    3.489628] hid-generic 0003:3434:D068.0001: input,hidraw0: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
[    3.516753] hid-generic 0003:3434:D068.0002: input,hidraw1: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
[    3.516859] usbhid 1-1:1.2: can't add hid device: -71
[    3.517422] usbhid 1-1:1.3: can't add hid device: -71
[    4.989074] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
(no further errors, mouse works)

Full 7.3 boot log: https://paste.cachyos.org/p/ead6b4c.log
(the bad boot is the "previous boot" section)

Things I tried on 7.3, none of which helped:
- UEFI "Legacy USB Support" and "XHCI Hand-off" both enabled (they
  were both disabled). There is no "BIOS handoff failed" message in
  any boot.
- usbcore.quirks=3434:d068:gn. This made it worse: boot still hangs,
  and hot-plug now fails with -110 as well.

My guess, untested: the xhci changes merged for 7.3 that touch
cancelled transfers on control endpoints, e.g. 7c0c31c66a7f ("move
dequeue to next valid td instead of past cancelled one"). The fast -71
on 7.2 turning into -110 timeouts plus resets on 7.3 seems to fit
that. I haven't bisected or tested a revert yet, but I can if you
point me at what to try.

#regzbot introduced: v7.2..v7.3

Thanks, Dennis


