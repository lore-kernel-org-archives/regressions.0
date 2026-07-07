Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1098285CBC
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411450; cv=none; b=hGYnOf2CQb3fNsycTLOykBhH/aIfAD+epcWdAudfSN5zeMH51qZqLC2df+Bwhd1heUWQke4GandajgezbrdpRRrfDTG0s+4O9lTe/3Pzq8Dx078y6m4om1n3PxYwQ3ZAD9dObJ4heqaNb62jsZC/9HrxnrakOpA367gUmPUGR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411450; c=relaxed/simple;
	bh=CJB6p/jrp17XXif1kiZ2OVex7QJd/AtIwCvuustGcdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=HM5rlRi7xwIuGoQtaEbb4FldnNfrHVuBodzvjEv/oblzU1z6ZtgRJ/7UPJRstC7NVWIPvao8Sl0rrya8nzZjAbdok9TqkLNAOZWU3BpRCplbIBBQjMRJJVNT289KIxdrACcBoKl9OOfJzhRyX/6WkjUz7PIagbzp/gaNBKvkOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Rwd7Ifh1; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Rwd7Ifh1"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gvYdr3BV1z3wkl;
	Tue,  7 Jul 2026 10:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783411440;
	bh=CJB6p/jrp17XXif1kiZ2OVex7QJd/AtIwCvuustGcdc=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Rwd7Ifh1h/QrbBfB7mAKfFzhW4N2Ef7UyTfHhlGknDErd4OBsfqoxWqp+asDfpN4A
	 +h29ChEpKrW+3Oimh9FF1OTtxiU4bMxqE2mvAuW8JFp+NmCRorssxzSMAbc3z0VNYa
	 enwP81TZSwnxkp/blM2471L9+1QbHn4WjYAYBXPYQHNtBq96lp2MWwT4lC9lWnxzvZ
	 mxvhkxBDS6lGifwmWiPVolS5iet3uip1MD8XkOhbDTwuggvpTFZXm2QG6LFVu2T/1f
	 UkZxM5kc0uwIkYvjB7e7fdbaNGB2l8ZlAHa+rmHrQrP9tBbISOfs9M4+ziMfwFK5I8
	 daMXcrgnJxcBQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gvYdr2VJjz3rNw;
	Tue,  7 Jul 2026 10:04:00 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gvYdq4JCHz8sZw;
	Tue,  7 Jul 2026 10:03:59 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DAF0F60387;
	Tue,  7 Jul 2026 10:03:58 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
Date: Tue, 7 Jul 2026 10:03:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard
 in plymouth
To: Jihong Min <hurryman2212@gmail.com>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: bugzilla-daemon@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-usb@vger.kernel.org, marx.tomasz@gmail.com
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178341143919.3915223.7207324741735735933@mxe9fb.netcup.net>
X-NC-CID: uNilS+ficIVJxyJIGnIIa8hp9UUBhW/WPUiu2/lR+aIALjo+isY=

[Switching to email, hope this will work]

Jihong Min, it seems a recent change of yours is causing trouble. See
below for details.

Side note, but not my area of expertise, so feel free to ignore this, as
I might be sending people in the wrong direction and it's just a hunch
anyway: wonder if this is another of those situations where the driver
needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=m
when things were broken? And if yes: have you tried if adding it to the
initramfs or setting SENSORS_PROM21_XHCI=y helps?

Ciao, Thorsten

On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221721
> 
>             Bug ID: 221721
>            Summary: prom21-xhci does not allow to use USB keyboard in
>                     plymouth
>            Product: Drivers
>            Version: 2.5
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: marx.tomasz@gmail.com
>         Regression: No
> 
> Created attachment 310416
>   --> https://bugzilla.kernel.org/attachment.cgi?id=310416&action=edit
> output of "sudo lsusb -v"
> 
> Hi,
> 
> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
> tried both of my USB keyboards, but both of them just briefly lit up the LEDs
> and then seemed to turn off. Bisection pointed to
> 
> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
> Merge: e4b4bfaa5090 1c2b66a7d725
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Jun 22 12:09:47 2026 -0700
> 
>     Merge tag 'usb-7.2-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> 
> and then
> 
> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
> Author: Jihong Min <hurryman2212@gmail.com>
> Date:   Tue May 19 09:07:31 2026 +0900
> 
>     usb: xhci-pci: add AMD Promontory 21 PCI glue
> 
> After setting SENSORS_PROM21_XHCI=n and compiling kernel again, I'm able to use
> my PC normally.
> 
> CPU: AMD Ryzen 9 9900X
> Motherboard: X870I AORUS PRO ICE
> Output of "lsusb -v" provided in attachment.
> 

