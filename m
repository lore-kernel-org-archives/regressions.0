Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF43016E1
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339166; cv=none; b=CLP4wk/afbVq2Yp7f2JnMSdeVgau7lFaBpeUj/ZNFvzCgV39aPs++BhJ/z6GtzvVrOwIP/Tfqe6OamEji6qDtG+Z9+6A558rcUvsjyFDlwvMPHX98eVAftxAhTVDQfartS6FMfq4WSqwUCk7isSj7IXjROM7GN2H2VDdI3pnN/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339166; c=relaxed/simple;
	bh=HGK/U9ardbzvTPqX0Y/kJtQeRhhskbvRZgCKe+Eey1w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=gwzatOmjcmiTgppEBmd4dypRlvHDev1gOtewtvPcTpBKRLE2jtcuIcb7Xlbo/AGulIyt+TaHaJwT51o2HpjFY7d++DN343+p1wYY75MimJaWgpalbEnZujM+t3m2wjSUjsuiNCoz3ZOydyyy7QwGGo4QoY/MCy/15JsEwxU3ypQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=DmsVAmNd; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="DmsVAmNd"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gv2vv3cNzz8D3F
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 13:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783339163;
	bh=HGK/U9ardbzvTPqX0Y/kJtQeRhhskbvRZgCKe+Eey1w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=DmsVAmNdshBTkhReZZjxhrsE2tYsxUp0apTQprN9ZNaShBi2dNFcb48E7ncQlbvqr
	 sLtHoWUSk0PiwxzEnDPayEKv0JLDJ5lGeIazlLfNdw3vCxDYBaly+cb5KJBvJl7t3p
	 1xujLC5nKA8adO5Zt4DQF2Wcl/cgc4mNJf6N29Ja233RPnNL4kkTUPd9RkKkpahF2P
	 Snadxgx/WqLv9m5RKrnSekSGcmerksOz5ddnQaxc63d9w21oDIEvmzIGgjJeQArkd2
	 Lt1WwaXapbExPmau9/M4hgkzOtPEXWqOrYnjP3mKAkm/4FfNq0jFxtkupNiXoOXPU5
	 o+cIM7cQBg7ew==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gv2vv2wY8z4xWb
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 13:59:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gv2vt6df8z8tZN
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 13:59:22 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 36B30603ED
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 13:59:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2c22430b-c398-4b4a-aa4f-2f2857f22449@leemhuis.info>
Date: Mon, 6 Jul 2026 13:59:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178333916240.802943.3874293942974137963@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 36B30603ED
X-NC-CID: cUly1ZFvirtLb+v7QHL+aZ0BpML7ewsM60Z62QJZCvDgaBJhKfc=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260705-pci-rebar-root-bus-v1-1-55df70cbdd88@honeycomb.io/
#regzbot introduced: 337b1b566db0
#regzbot title: pci: amdgpu completely on the SolidRun HoneyComb LX
#regzbot fix: PCI: Fix BAR resize for devices on a root bus

#regzbot report:
https://lore.kernel.org/all/20260427115804.134231-1-smoch@web.de/
#regzbot introduced: 3a4e8302e72f
#regzbot title: PCI: imx6: endpoints not received by iMSI-RX MSI controller
#regzbot fix: PCI: imx6: Keep Root Port MSI capability also for i.MX6Q

#regzbot report:
https://lore.kernel.org/all/20260627105725.9083-1-robert.mader@collabora.com/
#regzbot introduced: 504e2b4ab97a
#regzbot title: udmabuf: Ensure to perform cache synchronisation in
begin_cpu_udmabuf()
#regzbot fix: udmabuf: Ensure to perform cache synchronisation in
begin_cpu_udmabuf()

#regzbot report:
https://lore.kernel.org/linux-usb/cb287e3d-3066-4820-b464-6208b947974b@mailbox.org/
#regzbot resolve: inconclusive: likely a false alert due to usbguard
blocking the USB3 hub

#regzbot report:
https://lore.kernel.org/linux-block/ai7rnH20IYeSmY8s@gallifrey/
#regzbot fix: block: validate direct I/O memory alignment
#regzbot monitor:
https://lore.kernel.org/all/20260624170905.3972095-1-kbusch@meta.com/

#regzbot report:
https://lore.kernel.org/netdev/99caeafd-edf5-44a4-8742-4eada5d0f5d1@yeah.net/
#regzbot fix: netfilter: nf_nat_masquerade: recalculate TCP TS offset
when port is randomized
#regzbot monitor:
https://lore.kernel.org/all/20260629093408.3927103-1-xietangxin@h-partners.com/

#regzbot report:
https://lore.kernel.org/lkml/1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech/
#regzbot fix: f24df84cbe05e44

#regzbot report:
https://lore.kernel.org/lkml/69e2ca14.a00a0220.1bd0ca.0031.GAE@google.com/
#regzbot resolve: inconclusive: seems to be primarily a syzbot problem
that is not worth tracking as regression

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221661
#regzbot fix: 20b126920a259df4d7dcae19fcfe2c57a74d6b

