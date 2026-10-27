Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142381;
	b=z5+yI03ke4BPrVgJYgUKPjf0R4O0ynoHwfNgX9s3mdwfMinynUC81kh7LdDwfmONVURw
	 BXP16Va98kUIXM5za3Q5YoUQy0txkCGnfoVP3N7XLhIINRi1U9hsJek75lz0a6S9PHTU7
	 ULD074MQaaWjfG0PPoNW9jPDbeA016Pv+tjtbrNUMGaJyK/VKZ3bmaagkyD4/9MNOSjSn
	 m651ZHp3tpvYPoTYlIz3QjysGfRzEEL6NFbzbrTWbULjkkIkHsHyiaF5WO6kt4FhwfY/F
	 4HWsmsV0IG5GH95CxYc8AhrK17ulPOPLCazuDWHDYNvv89D4BReWXECW+V7eHcD4XYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142381;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Rspamd-Queue-Id;
	bh=fmgkj98Q62DA/vR7MAUo1vkXFN1Y+OIb0JrIVNlgR2Y=;
	b=Fm40iq8YaPjyfEoMxsX+o4z5kq8tH48aooOSb85sYdCa9jIBdRp9FB59KMyGrUNZ2CBW
	 AtJV+gwWSYYNTyQ48XHotvuYddv5ODTxW4c9spI28bo61BtSYxr7fPlt0R6lMk9kUCKzw
	 UpHLfMTCQ9Vd0QTTdW6g7yszasi2XsWhnMU+LXQpSmrnfLgK/rJOKo1ij1Utfnm1TBpNN
	 o/YOFF6Mb3ztPHgiAkH5ek2GHTbih/diMeMvMBDxb2VnGF3TlPy+2PI+pVqoaf3nCdVyP
	 +mD9qqsU4T287rkTtfAPsnq9nGasMx/B1cgvnnnwfp0U0qGDXGUR38zbARfOId92YTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsine.de;
	spf=pass smtp.mailfrom=dsine.de;
	dkim=pass header.d=dsine.de header.i=@dsine.de header.a=rsa-sha256 header.s=MBO0001 header.b=KEQVf+oD;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E2606A31E
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 23:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dsine.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsine.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsine.de header.i=@dsine.de header.a=rsa-sha256 header.s=MBO0001 header.b=KEQVf+oD
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jDmMD4NcJzMlLw;
	Wed, 28 Oct 2026 00:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsine.de; s=MBO0001;
	t=1793142376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmgkj98Q62DA/vR7MAUo1vkXFN1Y+OIb0JrIVNlgR2Y=;
	b=KEQVf+oD7N18xYnzUFImg/ZMraFk4xBz4OxHRiquddz7QluKmeK1A8tsg7+gCXDB38fKTg
	51Xgad5P2FSJAsF+hSLuRE9ptJaaGdbQ31S+9STiKQs4C/KZpQWbmyQHbHzAKy9kmnNLKn
	vAWPu/BhsVHMKyck5ra48chaFMDFoRvZdgf/j/rYLqLELHbXiwukyahehYsHXS2VcZmuXB
	8Nxm7+FsQVSCBC1mK0be9lcxhR0CMuVqjkc/Vj8vnxowRDeiMdjNouV1/V9rKl/AEQ5prK
	Yi7hTyfhhGqBhfvrwreaF3JulYVQvS5NNsTWsGn0tDBFa1J4AYkIahKZAXJ/ZA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of dennis@dsine.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=dennis@dsine.de
From: Dennis Wissel <dennis@dsine.de>
To: yiyu@yiyuzhou.io, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 diogochaves@me.com, michal.pecio@gmail.com, raoxu@uniontech.com,
 gregkh@linuxfoundation.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject:
 Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect detect
Date: Wed, 28 Oct 2026 00:05:33 +0100
Message-ID: <oKoY8F_0Rv-eBKI0YHyHcQ@dsine.de>
In-Reply-To: <20261027192128.386082-1-mathias.nyman@linux.intel.com>
References:
 <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
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
X-Rspamd-Queue-Id: 4jDmMD4NcJzMlLw

I tested v7.3 (CachyOS 7.3.0-4) + both patches with the Keychron M5
(3434:d068) plugged in at boot, two boots, with
xhci_hcd.dyndbg=+p usbhid.dyndbg=+p usbcore.dyndbg=+p.

In both boots the M5 drops off at the first control transfers after
Set Configuration, and ep0 on the disconnected port now goes through
the new path:

[    3.536042] xhci_hcd 0000:00:14.0: Not resetting ep 2 slot 1 after disconnect
[    3.536404] xhci_hcd 0000:00:14.0: Transfer error for slot 1 ep 0 on endpoint
[    3.536447] xhci_hcd 0000:00:14.0: TRB error 4, halted endpoint index = 0
[    3.536487] xhci_hcd 0000:00:14.0: Hard-reset ep 0, slot 1

followed by Set TR Deq, the URB given back with -71 and further URBs
refused with "Can't queue urb, port disconnect or link inactive".

Boot 1: no interface was bound before the drop, so all four fail
within 2 ms, as on v7.2. hub_wq handles the disconnect at 5.31 s and
the M5 comes back as a new device at 5.72 s, all four interfaces bound
at 5.94 s.

Boot 2: interfaces 0 and 1 were bound, so usbhid requested a reset:

[    4.539124] usbhid 1-1:1.1: resetting device
[    4.771324] usb usb1-port1: not enabled, trying reset again...
[    5.023262] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
[    5.135351] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[    5.135498] xhci_hcd 0000:00:14.0: Successful setup address command
[    5.148062] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command

The device is resuscitated in place on the same slot and ep0 works
again after the reset. Mouse and keyboard work after boot.

In neither boot are there "not part of TD" messages or any stall (with
1f36cc9fa949 alone, hub_wq stalled from 4.97 s to 16 s). initrd takes
2.9-3.0 s, the same as v7.2.11.

One observation, probably not xhci related: in boot 2, interfaces 2
and 3 failed their probe before the reset ("reading report descriptor
failed") and stay unbound after the in-place reset, until the mouse is
replugged. On v7.2 the device was re-enumerated instead, so all four
interfaces ended up bound.

Tested-by: Dennis Wissel <dennis@dsine.de>

Full logs are available if needed.

Regards, Dennis


