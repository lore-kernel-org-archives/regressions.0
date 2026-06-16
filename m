Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AD42883D
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605778; cv=none; b=T2pYzEOlVumanMFjyARPezPvMP2OXbvcxbLSkhNl9+1dY1Svo3q2DLF6A4VPiyZqtdPy6KhAyvs4UfTiEGfO8b7UUGTk3UqqEf14M8GZAhYwo7/eLwqTrzqcRJimmmVXsOZsbC3Rot3ehPVfIiGk6rEVZGt8p5ZSmL+PSQADypk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605778; c=relaxed/simple;
	bh=7VBa7DLB1t5uNYwn/OgNiCf5jxlEZWt2OCgRh8iCWgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+djePYL8rr3UJYYqNnj59ijWRdpceQfpEQPa5ljdKV4+7rIqcS6GFuXINg02GQk/OlhpjJ1WXes7HR3ThGK5g1ciB2pYqSHrZGUjhXhzVFoeYJVLHKzzquEzlvQpGpXP8TxaHneVj2SJi05v9l3Enuq72T3mHDp0AX0b1g+pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ew2gaL0p; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ew2gaL0p"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gfjsB5xH8z66sY;
	Tue, 16 Jun 2026 12:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1781605758;
	bh=7VBa7DLB1t5uNYwn/OgNiCf5jxlEZWt2OCgRh8iCWgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ew2gaL0pHA8ck5ZbPeIK4vMovGTtYb9GiZ2p+fwWv/xIpWXen8Ot5I7GbjvIGd+cS
	 8uLTI86aVqr3SNVvRsRep7eChuBNZJc6cwLhDKk1Jqr4L9zmC4QzRbUDVhnZeXzSmJ
	 yBTlcJaq41Lcf/0DFtkgU9FXmu5cpUbp988Ws1NmWxY5lCocAF9TRE49DosRIikYSr
	 5mKzJHYSCSkWpwC6/Ax1O0LCFMr0TjAQPJEzm86W++jYpx7LL/n0r1UEf798P+FHjq
	 VgggVxTHBMkvMXENmyK/IVLPkcTfpxEFGaJcW8fG6NjDGpYCZr4Bx8dR2cwzyfcfl4
	 mgkhJav0g+FjQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gfjr42kSSz4xln;
	Tue, 16 Jun 2026 12:28:20 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gfjr32k8Lz8sbB;
	Tue, 16 Jun 2026 12:28:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AA54461841;
	Tue, 16 Jun 2026 12:28:18 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
Date: Tue, 16 Jun 2026 12:28:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
To: Amin Vakil <info@aminvakil.com>, linux-usb@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178160569901.1920135.13090269485935992869@mxe9fb.netcup.net>
X-NC-CID: nkmXxmyC12p5Evd3Vnfm8/kF5Y1EfXoxHL3B/HmyEa5zrt52gdk=

On 6/16/26 11:49, Amin Vakil wrote:
> 
> The following change, backported to the 7.0.x stable series, introduces
> a regression that disables the wired ethernet of a Lenovo USB-C/
> Thunderbolt dock:
> 
>   commit 727d045d064b7c9a24db3bce9c0485a382cb768b
>   usb: core: Fix up Interrupt IN endpoints with bogus wBytesPerInterval

Is 7.1 affected as well? Ideally try using a non-hardened kernel to keep
the downstream patches out of the way.

Ciao, Thorsten

> Hardware: Lenovo dock built-in Realtek RTL8153, enumerating as USB ID
> 17ef:721e (Lenovo rebrand of 0bda:8153), driven by r8152 through r8152-
> cfgselector. Host is an Intel laptop with xhci_hcd.
> 
> Symptom: on the patched kernel the NIC enumerates, r8152 binds and the
> netdev is created, then about one second later the device is USB-
> disconnected by r8152-cfgselector and never returns. No ethernet
> interface remains. USB, HDMI and the rest of the dock keep working, and
> plugging the cable straight into the laptop built-in NIC is unaffected.
> 
> Affected vs working (Arch linux-hardened): 7.0.11.hardened2 works,
> 7.0.12.hardened1 is broken. This commit is the only RTL8153/USB-core
> change in that delta, and it activates a code path that did not run
> before on this device (note the new wBytesPerInterval message in the
> dmesg below, absent on 7.0.11).
> 
> Why this commit: configuration 2 (CDC) of the device has an interrupt IN
> endpoint (EP 0x83) with wMaxPacketSize=16 and wBytesPerInterval=8. The
> new condition (wBytesPerInterval < wMaxPacketSize on an interrupt IN
> endpoint) now fires and rewrites wBytesPerInterval from 8 to 16. On this
> dock plus xHCI host that rewrite appears to make the device fall off the
> bus right after the cfgselector reset.
> 
> dmesg (broken kernel 7.0.12.hardened1):
>   usb 2-1.1: New USB device found, idVendor=17ef, idProduct=721e,
> bcdDevice=31.03
>   usb 2-1.1: Int endpoint with wBytesPerInterval of 8 in config 2
> interface 0 altsetting 0 ep 131: setting to 16
>   r8152-cfgselector 2-1.1: reset SuperSpeed USB device number 3 using
> xhci_hcd
>   r8152 2-1.1:1.0 (unnamed net_device) (uninitialized): Invalid header
> when reading pass-thru MAC addr
>   r8152 2-1.1:1.0 enp0s13f0u1u1: renamed from eth0
>   r8152-cfgselector 2-1.1: USB disconnect, device number 3
> 
> Relevant descriptors (lsusb -v -d 17ef:721e, captured on the working
> 7.0.11 kernel): configuration 2 (CDC), endpoint 0x83 IN Interrupt has
> wMaxPacketSize=0x0010 (16 bytes), bInterval=8, bMaxBurst=0,
> wBytesPerInterval=8 (rewritten to 16 by the new fixup). Configuration 1,
> the vendor config that r8152 actually uses, has its interrupt endpoint
> 0x83 with wMaxPacketSize=2 and wBytesPerInterval=2, which is not affected.
> 
> Reverting this commit (or just the new interrupt IN branch in drivers/
> usb/core/config.c) should restore the device. I am happy to build and
> confirm a revert, and to test any proposed fix. A quirk to skip the
> interrupt IN fixup for the RTL8153 CDC configuration, or otherwise
> narrowing the new condition, seems like the right direction.
> 
> I can provide the full dmesg and full lsusb -v output on request.
> 
> #regzbot introduced: 727d045d064b7c9a24db3bce9c0485a382cb768b
> 
> Best Regards,
> Amin Vakil

