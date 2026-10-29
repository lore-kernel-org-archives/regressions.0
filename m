Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793247574;
	b=K6DBelZBzyHIDaCruAzcKRMx5gQ2w+xeatxWC56/X+J/zPAvMM4T5TRguf6+AIZBOAgH
	 XfYXYAQqKqE/qEYeU1LvlJPNfAW6BmGHxXeZii/FUfAHCFraW0+X0mu56ldEmMwGpyllO
	 prcMpTGErhw+w3RF01FQWdH5DXSgtG0D+ZLRdfb2Ly9mnzRJCX7HzMUa/2lmUZDFzf4Pc
	 7P2QT3FKfTtq5fWUu0dvSNihT5f26uRX+USEBox6htdUiQmP9j2/vE/c0sUNGBrmIk4RV
	 m9z0zU9QEKXAPf9FrUZpDQcgk6uh3PjbOfd6gNWVEpU90QZ2vbofEfHMreC2DGb+q7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247574;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=S4U7y3JKaQogbd5mPlOpxdl5u2U6YAES36RqoO48nJY=;
	b=NzDbyo9Xfmo/evaAfdwah2UZSJKcgMCycQNxFWmGIYUUjVZ0SZBUME2pBuPT7piMKd/D
	 0lDWwbstqqQz+gxZp5aExiABY9W/9c+0VA+90MkJpvvtPt+sQTh6MHMge3wcpy9Wdg+ZV
	 4TB44wZ8cVNDzqw7H56DG1Yqls6SKHMT8vwIarNS+flOBCLgcxnIouPF3c5h6KoomLF8z
	 sfMi359PraOC3UiGtM5PA+WhwxUgzWB9M3KF0Ni9B1lWxvTiWSrmeD6fQ3sjQmcuS4uOa
	 LbXF59NoW4mALjQJAD+dOqRhOfEN2mIh22gcD6QI3lBYoMPUxKdRGjl2PALROw0Uryw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yiyuzhou.io;
	spf=pass smtp.mailfrom=yiyuzhou.io;
	dkim=pass header.d=yiyuzhou.io header.i=@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=UMr8WiJ2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53995606A31A
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 04:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53995606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yiyuzhou.io header.i=@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=UMr8WiJ2
ARC-Seal: i=1; a=rsa-sha256; t=1793247554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NL1V4y2Bpbw4D3ykFjsIKv5Rlcyc2z0t2ZF/zv90kY0Z3raKON/AtlHzBU+tpVksPiZzqGwsa0Aqn5IwsRAQP0/pclYk9JOXXcb7C4lIb644+1OcJ204HDB86Euqhrr2GzTJHobjfNs1oeY5f14B45WgY+G4QZKLNHlZMgys1ws=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793247554; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S4U7y3JKaQogbd5mPlOpxdl5u2U6YAES36RqoO48nJY=; 
	b=aKTd21bdfr4KPwjM9kWGAB0rgc78rzOGikIxEenPfmSDL7dOpBTZ2/zZLANUoHNOrIOREk6cgEHu3ChGf+HL8VHRTTVQpReF3f5ru2DKSHALMygvB0HraV50Fx1FiSZfxkJmY0Z1YszlYOyOLz/ujOaIe7DDnJgdvIami0DIZ40=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: a=rsa-sha256; b=UMr8WiJ24QinuW5+dofrP87bmZnBb2jOFqepKbgklhlMXQ+uAHfsoqNYQkd4mxBfI2jtl5c69bWolxKGUffNzozg7WcsKFVT6eZ7b5Dh6iEAiJ9V939fIM41Oq+GarG7iUQXQMjuug58HzFPoUoQzk5TXSx4IN7c4Lf0waZpTEg=; c=relaxed/relaxed; s=zmail; d=yiyuzhou.io; v=1; bh=S4U7y3JKaQogbd5mPlOpxdl5u2U6YAES36RqoO48nJY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793247552047289.2558339205044;
	Wed, 28 Oct 2026 21:19:12 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dennis Wissel <dennis@dsine.de>,
	diogochaves@me.com,
	raoxu@uniontech.com,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect detect
Date: Wed, 28 Oct 2026 21:18:53 -0700
Message-ID: <20261029041854.699752-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027192128.386082-1-mathias.nyman@linux.intel.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io> <20261027192128.386082-1-mathias.nyman@linux.intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Tue, 27 Oct 2026 21:21:25 +0200, Mathias Nyman wrote:
> If you have seen the HID enumeration issue, or the xHC Stop Endpoint
> failures with rapid endpoint state changes, testing these two patches
> would be greatly appreciated.

I have seen the HID enumeration issue, and I tested both patches on the
laptop that shows it: a System76 Galago Pro (galp7) with an Intel Alder
Lake PCH xHCI (8086:51ed), running v7.3 plus these two patches, with the
xhci_hcd dynamic debug messages enabled.  The keyboard is a PFU HHKB
Professional HYBRID Type-S (04fe:0021) on root port 3-2.  It drops off
the bus about 0.28 s after its first enumeration, which is what used to
hang.

I unplugged and replugged it three times, once right after an S3
resume.  Each time the keyboard was back with all three interfaces
bound about 0.9 s after the first "new full-speed USB device" line.
There was no -110 from usbhid, no hung task, no "not part of TD" error
and no command timeout.  The dynamic debug output was on for the last
two replugs.  This is the second one (trimmed):

  [  526.532129] usb 3-2: new full-speed USB device number 7 using xhci_hcd
  [  526.764553] xhci_hcd 0000:00:14.0: Port change event, 3-2, id 2, portsc: 0x202a0
  [  526.765548] xhci_hcd 0000:00:14.0: Not resetting ep 2 slot 6 after disconnect
  [  526.766517] xhci_hcd 0000:00:14.0: Giveback URB 00000000123956d9, len = 0, expected = 8, status = -71
  [  526.767395] xhci_hcd 0000:00:14.0: Not resetting ep 4 slot 6 after disconnect
  [  526.768195] xhci_hcd 0000:00:14.0: Giveback URB 00000000fa65d958, len = 0, expected = 31, status = -71
  [  526.780018] xhci_hcd 0000:00:14.0: Can't queue urb, port disconnect or link inactive
  [  526.812029] xhci_hcd 0000:00:14.0: TRB error 4, halted endpoint index = 0
  [  526.812280] xhci_hcd 0000:00:14.0: Hard-reset ep 0, slot 6
  [  526.812752] xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
  [  526.813210] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x112dd12f0, cycle 1
  [  526.813846] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @112dd12f0
  [  526.814254] xhci_hcd 0000:00:14.0: Giveback URB 00000000aa106b15, len = 0, expected = 0, status = -71
  [  526.814648] xhci_hcd 0000:00:14.0: Can't queue urb, port disconnect or link inactive
  [  526.815742] usb 3-2: USB disconnect, device number 7
  [  527.167687] usb 3-2: new full-speed USB device number 8 using xhci_hcd
  [  527.426094] hid-generic 0003:04FE:0021.000E: hiddev96,hidraw2: ... on usb-0000:00:14.0-2/input2

> Only Reset Endpoint and Set TR Dequeue Pointer commands are issued;
> ep0 is not restarted while the disconnect is pending.

That is what the log shows here.  Reset Endpoint on the disconnected ep0
completed with success, Set TR Dequeue Pointer succeeded, the control
URB was given back with -71, and later URBs were refused until hub_wq
re-enumerated the device.  The other endpoints were given back without a
reset.  I saw no controller hang or command timeout, so this Intel xHC
is fine with Reset Endpoint on a disconnected ep0 (it ran twice).

> If these patches work, they might be squashed into one before going
> upstream.

Squashing is fine with me.  1/2 alone leaves the stale TRBs on the ep0
ring, as the cover letter says, so I would not apply it separately.

Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>

I have not tried the RFC diff Michal posted in this thread.  I am happy
to run it on the HHKB once it has a changelog.

-YZ
