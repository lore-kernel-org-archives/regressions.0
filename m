Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918893;
	b=DLXjgfhMFbp62QZPfdYDtl8UQfumEt+4XhiTruNm+sEXLoGzhMXTg4oLG3lrNuYddyHf
	 /Akx81DsH/Nn0JzAeaIQ13eZq2EOVye8RktPtY1RuyEVM5gfnh0ofkuLl5/hM4tK8e2nJ
	 JFBX3Yo2shOaCB+4JneEOQMAGr8k+SxvHxnJwvb2JfhPgTDbxKEvJeKGiH3furemB6gak
	 J9RZGNTTgaZ5e8Gv111yPsnlfgThul9AOqvPnhb/2WdMSacwlrNXDOA02cLTD77SzYuH8
	 iP+u92nCjImk06Eu7wCjIMfDHziJ97YngzVKko064vRyY/Nkkh61FfpEZ3iFgQiYBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=+vsQEIenaCA1TRM488v6uxI/ZJ+2gKNGoidPlc/iGxo=;
	b=OKBgHyNvGb9wwwn7Ib7/jdd2ZwHgh5DJtsfpjyPKQfdl6BqltxZxhM6Zht9Ksux1DRJz
	 bHbKoXFkkAUL3bB3275o3dTRbjUKID+FZC65US5mwwn8kMxPx9F0To2VOU+MDlchh4Ebi
	 bXsXJKmtNmqwAal0rQt4r4muniOB8OJRLHfOiHknAL6lcHexGMpW7DL3KzHHXzMjKfL+l
	 YPygvD9WfgtVctUtmElbZ00HsGvPqjzeSReN+40xk6p+GvN1map6dP2deH4uqW5XEe31n
	 BA+OBU4z2McyMyU9WAwnfwBOB0rxROek7RE74z7V7R+39JULP5xYGksi6klwhHwb89g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ogtbfqqm;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3DE606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 09:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ogtbfqqm
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jC9gj3LjCz6Hqn;
	Sun, 25 Oct 2026 10:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792918801;
	bh=hS0HpeuSusOTmxx6Q6qvJhzX0judNpljj1zIYp5blfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ogtbfqqm8E3KuYyzHErwE0S4e/6XuR6S0QLQ9m1AeZ1flPy/sh1lguzRgPq10bJal
	 Zh+93st1Z2EQBm7VmP5yIPsok4aMemj97yhYsjEM/Grca/ObC6AAVfFvyeq41Zf8gw
	 B4fI3eE+vdJP4s2dojQ4/wn053hfWbjFG41Z9TbHYCABQh/SAOEMBzyEiv4fpwxxaN
	 Jt64Axm2HjTMSctEKlKu9VKZjgvq223LT8k6GsMAVzMYCtrtvlpPuUdgggp5DrTRtl
	 2P/W/q+fRKfts+AjTtIeHz/EQLK/oKjg3RrnRzl10lwUrJi+1eHFa8+Rjuevjw1dbt
	 WnWQiiXrHPfsA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jC9gj2gDDz4xKH;
	Sun, 25 Oct 2026 10:00:01 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jC9gg5Typz8sgw;
	Sun, 25 Oct 2026 09:59:59 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6BADB5FD44;
	Sun, 25 Oct 2026 09:59:44 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c8a3ffeb-8737-46d2-b01b-5ed9bc96012f@leemhuis.info>
Date: Sun, 25 Oct 2026 09:59:43 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
To: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 regressions@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179291878480.1277187.10073256999779663654@mxe9fb.netcup.net>
X-NC-CID: T8wdUd8p1JK4a7AuivKKqCAZPMjzFvkmM/TEjn4kRjENGeN2Yzs=

On 10/25/26 01:10, Dennis Wissel wrote:
> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
>> The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
>> ("xhci: give back all TDs when skipping endpoint reset after
>> disconnect") and applies cleanly to v7.3:
> [...]
>> Could you test it?  If it fixes your case, please reply here so that
>> Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
>> and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.
> 
> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the mouse
> plugged in each time.
> 
> 1) With 1f36cc9fa949: much better, but not completely fixed.

This btw is the third report about problems that that "xhci: give back
all TDs when skipping endpoint reset after disconnect" fixes; the first
was what lead to the fix, the second was:
https://lore.kernel.org/linux-usb/20261023190104.113331-1-diogochaves@me.com/

So it sounds like this is something we should mainline rather sooner
than later (ideally with a stable tag to ensure it's backported).
Mathias could you make that happen? If you are busy and need help, just
say so.

Ciao, Thorsten
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
> 
> So these two commits are the whole cause here, and with 1f36cc9fa949
> about 11 s of the regression remain. I'm happy to boot again with xhci
> dynamic debug or tracing enabled, or to test further patches.
> 
> For 1f36cc9fa949, since it fixes the hang and the dead input devices
> for me, if that's useful:
> Tested-by: Dennis Wissel <dennis@dsine.de>
> 
> Regards,
> Dennis

