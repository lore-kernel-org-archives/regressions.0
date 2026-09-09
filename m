Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1137C115
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936184; cv=none; b=nK80e+6teJiSJzWltis0emQlaa4b5y4DxkICSg2q+yWraqhxWiLkjD0srn9ml+AV3ZYBRfwCsETBsYvOjxBR8INRTAMhHxdqPcdCN5D9+4ba+hZFxlk7YcJghROpykPXwLjqT8n7gWGRX8we/micUhUziaNCfLYsEBSEEF6kMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936184; c=relaxed/simple;
	bh=VVE/8B+GcZSFMrfWTH0hxJD5fpHK5Vrcfa0ggqMFZ6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=O6V5b1Nxlzmv0vHrgg64oYqjlUgGgQDqwzMZQaEXaPvLx5Y5BNU8JmphlikHZcddn+9bxU05D4uzThBaUzma1AKt60WKrmHQpNLN15RgbU2B04GzZUl+QCs5t/KnCXcB6BkdByBcd/jUSRilHysqwY5uE7xtwnGbr0EX/g0ZRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=h4arC6/l; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="h4arC6/l"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hfrph6Br7z9Kl3;
	Wed,  9 Sep 2026 08:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788936172;
	bh=VVE/8B+GcZSFMrfWTH0hxJD5fpHK5Vrcfa0ggqMFZ6k=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=h4arC6/l74psWCGE61U76ByophYwr7aAvm2uiSyFMJjHxEUMOzaJzZBmN/OIPfo3O
	 KofYIxylWsawv0BIk5p7q1WnX9zcrTr8LoC56EdsDL4j9TKxkatYONipMo6iZe6KwO
	 7eyGhj8249O+Ys+Nud5hS4PeQwla7uE/gTeaC+RpUve93O5f3PHpmvNoF1Skq+JLNI
	 TLDlBu7cwQtdUvENQfs4af6fBkYoQiRpN2xHxv/N8msDVL5Ury7/CJuhQLrx6hk1Fi
	 8r6Kr2fu1mSvKRKBebLMmBhTNyM93k/GT40JIHdeGK54umCmcFfgSkuMBVmnhNq7tr
	 fJOX6keQpGWDQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hfrph5VpVz7wxl;
	Wed,  9 Sep 2026 08:42:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hfrph1x6qz8sch;
	Wed,  9 Sep 2026 08:42:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AFBAD5FA4C;
	Wed,  9 Sep 2026 08:42:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <97570924-1bef-408e-8b74-8aa68e5e8070@leemhuis.info>
Date: Wed, 9 Sep 2026 08:42:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Samsung USB tethering fails with rndis_host TX queue
 watchdog timeouts on 7.2.3
To: Mikey Coder <mikeycoder284@gmail.com>, linux-usb@vger.kernel.org
References: 
 <CABo2BzE4BMBeL-pW5DvAqyJ8aMVT41OJbd_VJ40ngUmPD=eG2w@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: 
 <CABo2BzE4BMBeL-pW5DvAqyJ8aMVT41OJbd_VJ40ngUmPD=eG2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178893617198.1182996.16504426568888905678@mxe9fb.netcup.net>
X-NC-CID: YY0CVX/7fnt3II63w69TCZcKlDe+/wWY1OGu1HOTAoEuG3WRY8M=

On 9/6/26 14:45, Mikey Coder wrote:
> 
> I appear to be experiencing a regression in Linux 7.2.x affecting USB
> tethering from a Samsung Android phone.
> 
> USB tethering worked with the previous kernel I was using (Linux
> 7.1.x), but stopped working after upgrading to:
> 
> 7.2.3-arch1-2

Given that no developer replied yet, it more and more looks like you
will have to git bisect this to get someone's attention. Before doing
that, remember to try 7.3-rc to see if the bug might already have been
fixed, as for example described in:

https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

Ciao, Thorsten
> The phone is detected correctly by USB, and the RNDIS driver binds
> successfully. The network interface is created as expected, but packet
> transmission appears to fail immediately.
> 
> Relevant `lsusb` output:
> 
> Bus 003 Device 005: ID 04e8:6863 Samsung Electronics Co., Ltd Galaxy
> series, misc. (tethering mode)
> 
> Relevant `ip link` output:
> 
> 4: enp0s20f0u2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
> fq_codel state UNKNOWN mode DEFAULT group default qlen 1000
>     link/ether 16:7e:18:7c:69:7f brd ff:ff:ff:ff:ff:ff
>     altname enx167e187c697f
> 
> The kernel successfully registers the RNDIS device:
> 
> rndis_host 3-2:1.0 usb0: register 'rndis_host' at usb-0000:00:14.0-2,
> RNDIS device, 16:7e:18:7c:69:7f
> rndis_host 3-2:1.0 enp0s20f0u2: renamed from usb0
> 
> However, transmission then repeatedly fails with:
> 
> rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 13: transmit
> queue 0 timed out 5353 ms
> rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 10: transmit
> queue 0 timed out 5120 ms
> rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 0: transmit
> queue 0 timed out 5120 ms
> 
> Similar watchdog timeouts continue to occur while tethering is enabled.
> 
> The complete relevant kernel log from this boot is:
> 
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: new high-speed USB device
> number 5 using xhci_hcd
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: New USB device found,
> idVendor=04e8, idProduct=6863, bcdDevice= 5.04
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: New USB device strings:
> Mfr=1, Product=2, SerialNumber=3
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: Product: SAMSUNG_Android
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: Manufacturer: SAMSUNG
> Sep 06 17:32:34 arch-nitro kernel: usb 3-2: SerialNumber: RZCX919VQYR
> Sep 06 17:32:34 arch-nitro kernel: usbcore: registered new interface
> driver cdc_ether
> Sep 06 17:32:34 arch-nitro kernel: rndis_host 3-2:1.0 usb0: register
> 'rndis_host' at usb-0000:00:14.0-2, RNDIS device, 16:7e:18:7c:69:7f
> Sep 06 17:32:34 arch-nitro kernel: usbcore: registered new interface
> driver rndis_host
> Sep 06 17:32:34 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> renamed from usb0
> Sep 06 17:32:39 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 13: transmit queue 0 timed out 5353 ms
> Sep 06 17:32:44 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 10: transmit queue 0 timed out 5120 ms
> Sep 06 17:32:50 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 0: transmit queue 0 timed out 5120 ms
> Sep 06 17:33:25 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 4: transmit queue 0 timed out 5008 ms
> Sep 06 17:33:57 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 4: transmit queue 0 timed out 5813 ms
> Sep 06 17:35:23 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 11: transmit queue 0 timed out 5689 ms
> Sep 06 17:41:39 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 12: transmit queue 0 timed out 5001 ms
> Sep 06 17:43:01 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
> NETDEV WATCHDOG: CPU: 12: transmit queue 0 timed out 5001 ms
> 
> I am running Arch Linux on an Acer Nitro V15 (ANV15-51).
> 
> Kernel:
> 
> 7.2.3-arch1-2
> 
> The USB connection itself appears stable enough for the phone to
> remain detected, and the RNDIS interface is created successfully, so
> the failure seems to be specifically related to RNDIS network
> transmission.
> 
> I have not yet bisected the regression or tested the previous kernel
> in this report.
> 
> Please let me know what additional information or testing would be useful.
> 
> Thank you.

