Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086212;
	b=UKsRb4D3o6oc+cg5OUHGD6/ShLOHifhJyQvhbFJBLNhloF6EPZbsQ/vmb386q5lP50A/
	 gJ/0L91Fuo1nyuxWiiXaoGVGGTNvnrxSo5gBzQArG5XUXp1PIwsfBh/oLL11rOq3JT0qX
	 V8c/o69l8YyxZUZ14dd0BHQmQP+MHRaZY3s9Wu9eix0WOD4I+5WILKnGLBn5TXM/aPPLK
	 aGqwvAMeoSI8BebQQDGGQBWwyTSl8q7XzHzDkP016cIDNCA0ryPACHblX1LlybfR0VWGD
	 AbFI2YK6jhgNvOh/LoQQK28YRC/9Q4wLu1qlD7DKYNc0tOnsn8gCGPMVOzkMAOFl2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086212;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Rspamd-Queue-Id;
	bh=kiuE/7A1+vFHVFJcJzUtrXmO3XVuGUnOrbNYqJCwYb8=;
	b=ZXKINUhjB5sjVjoOZTLOZ7bh9uIXsqbIRO2k4b8OdN8PICqYCTEB824W9BlGaEszTwzw
	 PK8LomE7/0uwuPq2GdFmZM4D6uWD6xLMxgYWS4pxjomq1C6FWTtWXP5cQyVuHrPmtFUHb
	 uxiTGsta03dEkNg2vHLOCPI6Kd1JIPo+R9pCoJXEdRfJQ6mIEP9PCx3dEB9QSeC2tngj2
	 qIuNgj2xBNgoqYnsmP7bl4EMMbOHQi/3sTqAOORaDFFw8Qa7v4xwVjwH5aEYglK064vWO
	 J0B99HPge8ASi8tmTaMs6b5SFfvDSInYL2TnSznR1jAgFcfisZ1zLWT3TTQJ+GsQhxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsine.de;
	spf=pass smtp.mailfrom=dsine.de;
	dkim=pass header.d=dsine.de header.i=@dsine.de header.a=rsa-sha256 header.s=MBO0001 header.b=ALAcWC4+;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B987606A31E
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 07:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B987606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dsine.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsine.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsine.de header.i=@dsine.de header.a=rsa-sha256 header.s=MBO0001 header.b=ALAcWC4+
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jDMb06lZZzMlTJ;
	Tue, 27 Oct 2026 08:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsine.de; s=MBO0001;
	t=1793086205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiuE/7A1+vFHVFJcJzUtrXmO3XVuGUnOrbNYqJCwYb8=;
	b=ALAcWC4+vRHdEJRiygHqAmuHxKXyop/4mSJ7h9ZLbPTLxEcZsrkpB6OPkjhJA39ex6hOBG
	VQF2eBU/AD/l3UZpC3Vtiw9cIEsN0fTbQWCLAhK2olFXeGygegGDKkMPbxJ40P6vUOa8vV
	XSqFdUakC0LX3oieQ8pa95Xnj3LugbvITPjkuiboNXwc23hmVOpoHwv5aA8dr96iwWjMkJ
	H8+rqYgqFFu0PaJjKoyc0dWypThF21cbMcRLe8AsPPTil/Groos+xlUvliB7uzo881ZygZ
	esRyvBMm0XcC93xAYUvjWhk0+Oug/sjZgoqxdL19m8OYjYzKATqcCRzjNh4oVg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of dennis@dsine.de designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=dennis@dsine.de
From: Dennis Wissel <dennis@dsine.de>
To: Michal Pecio <michal.pecio@gmail.com>, Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
Subject:
 Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Date: Tue, 27 Oct 2026 08:29:59 +0100
Message-ID: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
In-Reply-To: <20261026203944.2235991-1-yiyu@yiyuzhou.io>
References:
 <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261026121544.41fbb71a.michal.pecio@gmail.com>
 <20261026203944.2235991-1-yiyu@yiyuzhou.io>
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
X-Rspamd-Queue-Id: 4jDMb06lZZzMlTJ

On Mon, 26 Oct 2026 13:39:42 -0700, Yiyu Zhou wrote:
> Booting the reverted kernel with usbhid.dyndbg=+p should show
> "resetting device" from hid_reset() just before "usb 1-1: reset".

Confirmed. With 042aad8d0db6 and 7e0ef4332ed9 reverted and
usbhid.dyndbg=+p usbcore.dyndbg=+p:

[    3.488406] usbhid 1-1:1.1: retrying intr urb
               (repeated every ~110 ms)
[    4.577507] usbhid 1-1:1.1: resetting device
[    4.780458] usb usb1-port1: not enabled, trying reset again...
[    5.035696] usb 1-1: reset full-speed USB device number 2 using xhci_hcd

> Dennis, if you are willing to try it on top of 1f36cc9fa949, the reset
> should now fail within a fraction of a second, and the mouse should
> come back as a new device without the 11 s stall.

(A)I tested v7.3 (CachyOS 7.3.0-4) + 1f36cc9fa949 + your RFC patch with the
same command line and the M5 plugged in at boot, two boots.

In the first boot the device dropped off before interface 1 was bound,
so nothing was polling and there was no reset. hub_wq handled the
disconnect at 5.07 s and the M5 came back as a new device at 5.47 s.

In the second boot interfaces 0 and 1 were bound and the reset path was
taken:

[    4.531003] usbhid 1-1:1.1: resetting device
[    4.753507] usb usb1-port1: not enabled, trying reset again...
[    5.012720] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
[    5.441496] usb usb1-port1: logical disconnect
[    5.441503] drivers/hid/usbhid/hid-core.c: reading report descriptor failed (post_reset)
[    5.441504] drivers/hid/usbhid/hid-core.c: reading report descriptor failed (post_reset)
[    5.837110] usb 1-1: USB disconnect, device number 2
[    6.261660] usb 1-1: new full-speed USB device number 11 using xhci_hcd
[    6.477540] hid-generic 0003:3434:D068.000E: hiddev101,hidraw11: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input3

The reset fails after 0.43 s and the M5 is re-enumerated on a new slot,
with all four interfaces bound about 2 s after usbhid requested the
reset. There are no "not part of TD" messages and no stall (with
1f36cc9fa949 alone, hub_wq stalled from 4.97 s to 16 s). Mouse and
keyboard work after boot.

Tested-by: Dennis Wissel <dennis@dsine.de>

Full logs are available if needed.

Regards, Dennis



