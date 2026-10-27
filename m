Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098694;
	b=12m5hsDd4Fvs3Zt+VZgsQdMO4Iyc2sk1MS4WUAPoShtFFc0BM5RtMCZZG/6KQO8jEkWg
	 snLWBEyUtuByR8a019ZLYTDeXxK2cURtUDmajBlOheX03CgF0ms97Y/ku825iW38bztMo
	 GC0g8yxNTvn+5muFrirgpbrCdfGBHdGTEhLfGG8OtMkr8j7K3pa8AXHDf3M7SThUCPzuD
	 xdvxS+HoXfLcUy3VpFnouefpD80UYX/1qtcz9ktiNTN+CjUsTxIEEH/iPSgGlHL9SjG2d
	 w+BJa1oQS/OyMGq3eiZxcL0OLN+ndsTK7CIXPEzwDksoeA7T5giQqTmg/pX2P1VBU7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
	b=D0P6xK2HyaA1twXCRx7ZvLzeHWzioa6N2qx/SId0dZOh6/6CyJaw2Vv1OXcBMZ49BSV9
	 8Z2tgax+KwIZ6PSKKa1oFzod1i5o3BQRa7wJTpN+nfWVEX1+HjMMqDMV6uKAiEQ6eg3Oz
	 vDYbw9MhocMYVxDlZFYwnykHHOm6tGDNRL2j+Bue7q4B2Sm6L8UTxPrF+JoqQRWmc99NA
	 Y5Rz8Sk00nNz91UnZxMTPU6J+Vd4/DwaysU09wfwtpcARcAAn8ey55GDhG7A13sc7RBq6
	 7K3ycduY8kT2unR6ubpmPTrqQ/TXPdLTOjZQdY3SQVAEXiKFsJPq6b1VSvnicz7Ymig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Uu9/Ki+X";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A389606A31A
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A389606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uu9/Ki+X
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso20046065e9.0
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793098692; x=1793703492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
        b=Uu9/Ki+Xb/4OzWH3ChJoTQO8da5G2ERO0a2hL6HLqRBL1xPudBGEjyHHEg9QNlzRoA
         Y99wD+Zoai6L5CdhiNCMt88luI6wlpteBWow2N7XiJoz54vOrwnHsWy16ps2SnaYf+aY
         l9wkTXy8JtQ4uhsGgYv3rq8t5L8Cjco2bhfMfyY5XQ27szUBH4d/QroVXwh8vBYSscOs
         Pf/DIqaBAyiWC75lQ06yfd/su2/nD87X7426aI/PlVfxTi9/BeeCwttdOtppBa4QeufN
         taH3FlNstzO5QkweStc/IUKbYekrxNA/kzpwR+ynlXuvZGc2wQjztwG4Jf1OZ+M02G5l
         n37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098692; x=1793703492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
        b=wUPO3e7O5dNFjZ0HqK06cPwHnSeJTI7Smhon7XXAWHqFfTIi3blAeOY5OJ2A0lGgIh
         b6wVMgstZH4ObINmY+V2PgJhTHKkw9T8Um8i93LtE2eXhR0vsgXbMktlzb0q0ee87Wq2
         TcX9YBxUC17VqAh5FzeZzcAVhYxXR1AjyzYqSnDH3s7YYmOcUdV/0IUWRl6q7VZY2lcw
         4DG5XUlBmmNZXzHR133a2FrYEhPAaDO5MqZZop0oM50aT3CoOwcECr6Lg90sNsIqzLs8
         TR2T9ESy/5jeQxm0uCrovIBa8+1V6hZhmypCKAQL/o34ycfAqbuQMot6T1zQynG/Zl82
         vgYA==
X-Forwarded-Encrypted: i=1; AKwUvBzV0+Stio6a+FML9QjtbdmVAnILb9r9mz7W4KluSihqvehG6K/tTovZ2mzFaQIOuX/P5D26FH/jer5RuQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI/UOWvh0cmQY4HeYjCgo/h0M21V/zZbfAV0dr29F/2GUvbBsow
	JnhSMIy/KLISY4kM16pUcL76wWfhPiJ0pR3oC2veHL+WoZ0TmfWh4fvy
X-Gm-Gg: AYBFou2F1smqHLDHCi1xf9GizcdVNBKx507bKpkdh18eVWle0eY4SfOcbewyTmvxIXC
	VVRDZnvsSWgA/nuvMQ12S70Jwu2MERw56In/qi0Z31LFcPZmxBPeFcEAArZyIBoajlB1CQBXAWf
	Gl2HUd1sGbq6tcZFOJalBKKl/Y8ZwwLiU1xcoQDljliH7uh2+Ko0+5Imh9KIIBvc4KJlpB/hys3
	U7LV4pceURVwcFrTQfChV9HJmlQ409dWLrPt5ep1IFpHa7X5gV2uRW+TKw6gSYw+R5IsmesWkx6
	x/OqNoTzjAAAT2RmK8jiJU/p4cQZCnNFhIfcf+w+ELy/Av3Xr/de2gZbtbU5p+IijvavLLwtAx5
	iKvXFFvBliTMV0Aasa1YOsLjRoN98FIsChnez3+qN99lIXlxGR48E7ej3GFxiE2Tt9gAWMxYpQQ
	A3Hiqfoa88q4ak8ATNK71ffOH/6MlwBM+QvnSF3I4vDh/7lgGO1ep14lqzMyfqOigdv9FuKqJ+0
	XEubxp15GeruSarr/yktn8kocJExnF1gHnotEH7YK57WF5e3elj2YcRnSMzKEVk
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a35acbd3b3mr186210615e9.15.1793098692212;
        Tue, 27 Oct 2026 03:58:12 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm273903535e9.15.2026.10.27.03.58.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Oct 2026 03:58:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:58:05 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: Dennis Wissel <dennis@dsine.de>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261027115805.4d875431.michal.pecio@gmail.com>
In-Reply-To: <20261026203944.2235991-1-yiyu@yiyuzhou.io>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 13:39:42 -0700, Yiyu Zhou wrote:
> On Mon, 26 Oct 2026 12:15:44 +0100, Michal Pecio wrote:
> > I wonder if it's possible that usbhid driver requests a reset to
> > recover from errors and usbcore performs it blindly without paying
> > attention to connect status?  
> 
> I think that is what happens, and that 1f36cc9fa949 is what makes it
> reachable here.
> 
> Interfaces 0 and 1 bind before the device drops off, and the VT
> keyboard handler opens the keyboard interface right away, so its
> interrupt-in URB is running.  With 1f36cc9fa949 that URB is given back
> with -EPROTO and the resubmits fail with -ENODEV, so hid_io_error()
> keeps retrying and after 1 s schedules hid_reset(), which calls
> usb_queue_reset_device().  usb_reset_device() only checks for
> USB_STATE_NOTATTACHED, and the udev stays configured until hub_wq
> handles the connect change.  At boot hub_wq only gets back to port 1
> after the other ports (about 1.5 s after the disconnect in Dennis's
> dyndbg log), so the reset gets there first.  The device is back by
> then, so the port reset succeeds and the reset reuses the udev and the
> slot, ep0 ring included.

Yes, this seems plausible based on the input from Alan Stern. If reset
is requested before a USB2 reconnection but executed after it, then
hub_port_connect_change() sees (connect-change && enabled) port state
and it attempts to reuse ("resuscitate") the existing udev.

> On plain 7.3 the halted interrupt TD isn't given back until hub_wq
> handles the disconnect, so usbhid sees no error and never asks for a
> reset.  The device only comes back through the full disconnect at 56 s
> in Dennis's first log, which frees the slot and its ring.

Plausible too. But while the bug isn't triggered, it's still there.

Even on 7.3 without 1f36cc9fa949, when the failed URB is unlinked, it
seems that xhci_invalidate_cancelled_tds() marks its TDs as ready for
giveback without doing anything to prevent their execution. The EP is
expected never to run again and we are just lucky that nobody resets
the device before it's freed.

> Instead of repairing ep0 in place, could it stay blocked until Address
> Device has reloaded its context?

Not really, because EP0 must be ready for URBs before the device is
addressed, and the "BSR" flag is only legal on freshly enabled slots.

> If EP_DROP_PENDING stays set on ep0 until then, the new-scheme
> GET_DESCRIPTOR fails at once with -ENODEV, and
> usb_reset_and_verify_device() re-enumerates the device on a new slot,
> as after a real disconnect.

You seem to suggest that xhci-hcd should trick usbcore into abandoning
"resuscitation", right? I think that's a sort of complexity that the
world would be better off without, and it changes an intentional policy
of usbcore, so it's not suitable for an urgent stable fix.

The "right" thing to do here is to use Stop Endpoint and Set TR Dequeue
after Reset Device or Reset Endpoint (if applicable) and Set TR Dequeue
before Reset device, i.e. exclude EP0 from EP_DROP_PENDING logic.


Possibly the simplest way out, at least for the already released 7.3,
might be partly reverting the offending commits so as not to affect
USB2. The original VDEV_PORT_ERROR logic was exclusive to USB3 and the
problems which 7.3 was supposed to solve are also exclusive to USB3.

Is there any need for this to affect USB2, other than "just in case"?

Then there will be a few weeks to sort out remaining USB3 issues, which
mostly existed for a while and haven't bothered anybody.

Regards,
Michal
