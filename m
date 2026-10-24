Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883433;
	b=YP2T6QeQuogywZMQ0on9SmZTaLuDg6uAOH83Wm5sTZfGOCDMn0XFRle1AO+fglNfeXZ+
	 u/X6FGJUai+g7KpA8N28wtkjVt6iib8JfX7AKjM9WDqcdzgYwhRFFb4AiUf2XnCcc8gQy
	 kUgpJ8u6asp/ecEO6c3Rn7byh3dzhqnoRjhUCyJiFceSAsfYAFf4RlAtan8dgWpGTur/c
	 004WjF9U30UHW8+3gqpdqWIoYO8IHyUlXH06jfwKW436T9ehGO7YIr1i1hhbazzJc0il4
	 oggSFpsH2iTL+/DeqQoNzBdNGqeRZO67o9EaXpL/TJob9kDA1hcHDCv4tEmv79lrCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883433;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=vOvuYY50XCc0yOsd2x6FdB/8ydxTQ9YpGZLisusN76A=;
	b=b5U8Yt2HTyo6zTEBHacOuYlpkSSAQbnS7Gkk5DMr7A4hLuWQ6+CEo2GKNGbryoxHSSgY
	 HtzzSXqmUAqnuFBFHxDuW13UfOkGweM+RIBsBLiQJ87aGVvX8Mq2IwGLnqXhErq+IIc3l
	 3mmogx74HdBgqnPX6Xusl1OmTSVSsBZtEreyHpZWfgVa70DpWvIzF8ywJnoiU1MdfRoIb
	 MlgMCnUzjGCGxQDEAqk6FmuLO5/YGIfhXRbbzmp9C/FqtJNdfk/KG4AGh3Ba4MYPOC+VK
	 wQlqXPRGnGKuwSEF7u+KxMXhpi5B5M/DDh59RlWr64ekI32zgBPQwgJeFLc6Ri0HJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dsine.de;
	spf=none smtp.mailfrom=dsine.de;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC3606A31B
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 23:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dsine.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dsine.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jBwbT3zxMzKnQb;
	Sun, 25 Oct 2026 01:10:29 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=none (outgoing_mbo_mout: domain of dennis@dsine.de has no SPF policy when checking 2001:67c:2050:b231:465::2) smtp.mailfrom=dennis@dsine.de
From: Dennis Wissel <dennis@dsine.de>
To: Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject:
 Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Date: Sun, 25 Oct 2026 01:10:27 +0200
Message-ID: <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
In-Reply-To: <20261024203558.3181711-1-yiyu@yiyuzhou.io>
References:
 <4MjB9K-2SoiA85WbI9iEig@dsine.de> <20261024203558.3181711-1-yiyu@yiyuzhou.io>
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
X-Rspamd-Queue-Id: 4jBwbT3zxMzKnQb

On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
> The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
> ("xhci: give back all TDs when skipping endpoint reset after
> disconnect") and applies cleanly to v7.3:
[...]
> Could you test it?  If it fixes your case, please reply here so that
> Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
> and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.

Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the mouse
plugged in each time.

1) With 1f36cc9fa949: much better, but not completely fixed.

No reset loop anymore. After one disconnect and re-enumeration all four
interfaces bind, and both the mouse and the NuPhy keyboard work.
Before, the boot took about 3 minutes and both were dead.

But hub_wq still stalls for about 11 s after the first reset of the
mouse. Other devices on the same controller (1-9.2, 1-14) are only
enumerated after that. Just before the disconnect is handled, xhci
prints three "not part of TD" messages for ep 0:

[    3.509460] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    3.510626] hid-generic 0003:3434:D068.0001: input,hidraw0: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
[    3.510772] hid-generic 0003:3434:D068.0002: input,hidraw1: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
[    4.973074] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
(nothing on the bus for 11 s)
[   15.970122] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205260 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
[   15.970767] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205280 for ep 0 status 13 not part of TD at 00000001042052d0 - 00000001042052f0
[   15.971131] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205290 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
[   16.157121] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
[   16.354120] usb 1-14: new full-speed USB device number 8 using xhci_hcd
[   16.481086] usb 1-1: USB disconnect, device number 2
[   16.894150] usb 1-1: new full-speed USB device number 11 using xhci_hcd
[   17.026214] hid-generic 0003:3434:D068.000B: input,hidraw1: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
[   17.099110] hid-generic 0003:3434:D068.000C: input,hidraw9: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
[   17.101019] hid-generic 0003:3434:D068.000D: hiddev100,hidraw10: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input2
[   17.103029] hid-generic 0003:3434:D068.000E: hiddev101,hidraw11: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input3

2) With 042aad8d0db6 and 7e0ef4332ed9 reverted (and without
1f36cc9fa949): exactly like 7.2.11. Interfaces 2 and 3 fail right away
with -71, the device is reset once, no stall, no reset loop, and the
mouse and keyboard work:

[    3.498259] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    3.525104] usbhid 1-1:1.2: can't add hid device: -71
[    3.525732] usbhid 1-1:1.3: can't add hid device: -71
[    4.981085] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
[    5.167055] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
[    5.352064] usb 1-14: new full-speed USB device number 8 using xhci_hcd

So these two commits are the whole cause here, and with 1f36cc9fa949
about 11 s of the regression remain. I'm happy to boot again with xhci
dynamic debug or tracing enabled, or to test further patches.

For 1f36cc9fa949, since it fixes the hang and the dead input devices
for me, if that's useful:
Tested-by: Dennis Wissel <dennis@dsine.de>

Regards,
Dennis


