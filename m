Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792923255;
	b=hzBWtQxcCEqcIuQP2OjxtyMWGg0ED+pnZv3Wjxs4QuDlQv4tPtvDBPZZ3PdgaP6fbdmr
	 tcSLaHXhthuagWgUZ4mMKrTZngBAuy7Apjao0I9cspsVEKFRjPxcPoHXsy0LKXtZDjR84
	 7iHGVFcyjwY2BfjduQ0JZ6rcSTjZLf/6pItXH7P/XpCcGm1FhrjLppkwwxZxNC1MyEu57
	 IHIhby5o6AgXg/XhgVWeQuZvJdjMrTlAl4oVGhiCy1aoRG5xtv3oGkq3yRLqaFi2qSM2o
	 68mzDNCwSPZxvYUnNo6dhw9cOqmIkK6/GCNhUDzhCOIvYt3eoKw9xZAZ6sAWOOglDlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792923255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
	b=d+Hl+8JBs/auQ91OqDF6YtBHq2BRSokACTC1LMdqKkkfYK52SvlxBC6JZml+cheIi75V
	 +0S/PlJTSO+S+b4Iq7YJOZmoXSkQB2ft5bkyVZp8qTLi47rsTbV/vXUBdomlortm0NQB/
	 IiSHO24dtYePYQdvnaGuE6hqtEJVu7CQLV+c8hWAtQm2BmX4EfZEVP7VD7rDQ29MBW2fB
	 P1SIbmzf9vbcPE7jYW0LO9hxQDgNFbGMQU4x0gsILXDVKNMaFO2sDkvfvz0kHCSLE2BhC
	 X5GQuA+jcGC7rUJ0qAPAfDA/WwjPJaIN5sWFaiTkRZw0ycwEEbqjulgyZw74PBMawEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fVxQ4qAW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF2606A31B
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDF2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fVxQ4qAW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8653305e9.2
        for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792923254; x=1793528054; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
        b=fVxQ4qAWoLvn3KNCHtHAwjfyl68jq/JmR9MtyJY/5pRJfaT1+sLdYFYID7MCJdS2Oi
         HbIWaFR0HkQpwQBLYqtj8hj+OZIYEkLjxLRPTC+IoTXHOMXqbWKaj3/bNwjMtjTqpHrJ
         HHYVXT8iGcM8IYAegAPHmfm51WTsHBS/ennkqso7FMHckLLxt8g31XYIhBXmdcc1iRMA
         XgdQctc7YF/tIqcS13uw1wa4yyahiOnyzRO+xnUnpjbnk9GccN3UnBEHHsokz2zxBjRX
         34j8f+6dyMDYXFVkkRmmxcfO5AngZXYno22+VBlK+Q0BokHu/l51G4zStoSomADCIeS1
         BjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792923254; x=1793528054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
        b=ndMqXQvTzHqh9TGDRc2ehvuBtHGWXWajGPWc9FJR+NjoaQy7vhWhQac6xTAYflst9p
         v5Xd5iVMueZLvSYqluqWDhXd5nyPTkQ1XIGhS7TTKzdNpUQVj61zwGiuHJ9duyTMJFgS
         V7DUlWgTMe9NljYD2wOavxU2Uh8kO/3D58e1iR4ns+rFr/KWYK9Ku1NbTr7RkZoUlvud
         wXollc3hgUVXno1zOOx7Avggk9MSc1vdI75+fdBNjLP61W2MVxKgXlYgKbmgDhy1UnX7
         SojLv4buIr4BAuBD8mis4XMpoG77MuOUp46uGcOIrMVFjx3sEXYBKsymTmv2hx6MTXDm
         Eg+A==
X-Forwarded-Encrypted: i=1; AKwUvBwM0oMJagDsPE+EcOak1PK4+NBor9I9NUa/stDsqYZ0kRx00XUEMwIv48m7J4rDEtq/UntPUynTeeAxHg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJvZ1JY6ouEyEVF2+jLgORb2Pvg1r+GyiQFNX18SxTgmgfF+J7F
	Oe9D1GUwft+VVp1Z63LNWUG7rM0wKqaW9XkXV1Aj/jFCKd00nXr6F/xpOEZM4A==
X-Gm-Gg: AYBFou3emiZRwUw+1ym06EWQ3VBpZEdkX5PBH0toIrfexGp32sX84KwY0eE73BtGrfx
	20cWswhjzOKWOLcu71Xza24V85EXqizD6MYm++ByqjpS3e2eaK85YKoyfi4KjOqvJ38fhJqGTf1
	7swpWoceycf0VA0Q6zVW+/uK9Z6g8pu3qj5UM3nVUX4JOTwG3BI8peXSWOKFipwmSzZPgzxHcbw
	Lvu7vHGM/SDREoN+0h9FjvAN4mel254FXPyD6CJae3tflAvnFW1oT1brB2bDlo64/JeZZv56apX
	7QZb00GIWgFSXKg0qzi6UkG6nm5an69f0T5ifK1qUKhX7GCT9xDhri4XEXv9Vw5UXCmRLCEm4qT
	uPtnUWjvaIBRgMXYiSCHSfZA3q1f+hrVTG0mu9aqltllFwx3a3l0GJmhiF739s985C0wGMHFJe7
	reKJ8neULfxzr3vJtwNO6O+8wz7KFIhhC1XhxlnBYjadZb/lyRheVvppeIkXC9iUEjcykEbx1Cj
	rxZoPwWJBmtxiuTaYdy1UTqZpVyncZuabIy5+gi89L5weUJvwLXikKROkMMxKfO
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr56725465e9.23.1792923253746;
        Sun, 25 Oct 2026 03:14:13 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm140560695e9.7.2026.10.25.03.14.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Oct 2026 03:14:13 -0700 (PDT)
Date: Sun, 25 Oct 2026 11:14:10 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261025111410.2c14fcef.michal.pecio@gmail.com>
In-Reply-To: <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 25 Oct 2026 01:10:27 +0200, Dennis Wissel wrote:
> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
> > The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
> > ("xhci: give back all TDs when skipping endpoint reset after
> > disconnect") and applies cleanly to v7.3:  
> [...]
> > Could you test it?  If it fixes your case, please reply here so that
> > Mathias can add your Tested-by.  If it does not, reverting
> > 042aad8d0db6 and 7e0ef4332ed9 on v7.3 would show whether these
> > commits are involved.  
> 
> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the
> mouse plugged in each time.
> 
> 1) With 1f36cc9fa949: much better, but not completely fixed.
> 
> No reset loop anymore. After one disconnect and re-enumeration all four
> interfaces bind, and both the mouse and the NuPhy keyboard work.
> Before, the boot took about 3 minutes and both were dead.
> 
> But hub_wq still stalls for about 11 s after the first reset of the
> mouse. Other devices on the same controller (1-9.2, 1-14) are only
> enumerated after that. Just before the disconnect is handled, xhci
> prints three "not part of TD" messages for ep 0:
> 
> [    3.509460] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> [    3.510626] hid-generic 0003:3434:D068.0001: input,hidraw0: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
> [    3.510772] hid-generic 0003:3434:D068.0002: input,hidraw1: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
> [    4.973074] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
> (nothing on the bus for 11 s)
> [   15.970122] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205260 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
> [   15.970767] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205280 for ep 0 status 13 not part of TD at 00000001042052d0 - 00000001042052f0
> [   15.971131] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205290 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0

That's not good, your HC seems to be executing stale URBs, probably
from before the device was reset. I suspect we reuse the default pipe
without recovering it from the broken state left by EP_DROP_PENDING. 
(Such bug may have existed since forever, but only in USB3 and cases
which seldom or never happen. 7.3 generalized it to more cases.)

But is USB core really resetting a device for which the hub has
reported disconnection? Something isn't as I would expect.

This could result in DMAR faults, but it didn't. Was IOMMU enabled?

> [   16.157121] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
> [   16.354120] usb 1-14: new full-speed USB device number 8 using xhci_hcd
> [   16.481086] usb 1-1: USB disconnect, device number 2
> [   16.894150] usb 1-1: new full-speed USB device number 11 using xhci_hcd
> [   17.026214] hid-generic 0003:3434:D068.000B: input,hidraw1: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
> [   17.099110] hid-generic 0003:3434:D068.000C: input,hidraw9: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
> [   17.101019] hid-generic 0003:3434:D068.000D: hiddev100,hidraw10: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input2
> [   17.103029] hid-generic 0003:3434:D068.000E: hiddev101,hidraw11: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input3
> 
> 2) With 042aad8d0db6 and 7e0ef4332ed9 reverted (and without
> 1f36cc9fa949): exactly like 7.2.11. Interfaces 2 and 3 fail right away
> with -71, the device is reset once, no stall, no reset loop, and the
> mouse and keyboard work:
> 
> [    3.498259] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> [    3.525104] usbhid 1-1:1.2: can't add hid device: -71
> [    3.525732] usbhid 1-1:1.3: can't add hid device: -71
> [    4.981085] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
> [    5.167055] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
> [    5.352064] usb 1-14: new full-speed USB device number 8 using xhci_hcd

Not sure if I want to ask you to repro the failure on 7.3+1f36cc9fa949
unless you are sure that IOMMU is in good order or don't mind this
system potentially getting random junk DMA'd to a random place in RAM.

But can you post what happens on 7.2 with xhci_hcd and usbcore dynamic
debug enabled?

And BTW, the previous commit in the series (e3d757dc9257) also creates
problems which are fixed by the later ones, but those would be more of
a nuisance than corruption risk.

Regards,
Michal
