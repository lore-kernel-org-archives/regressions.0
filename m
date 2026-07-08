Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDF93F870F
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496173; cv=none; b=O7RVytaJZJdxfx9LD4/kjeR23XT13E3dEut0asdHdeC8xIx4wbI+g483uV+8YDM0/6Vo1MX6ZJ8LPZuJztQaJ3O65Msnuh4tgF/Jhgk1wuKBw1h5yO6ZPb835piSyQFA8KaIBG5/2F+7QxSVcDQle8v/2gtquYawxbAN9NW8njo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496173; c=relaxed/simple;
	bh=AFosKaX5OsadutGDjhIznvAHdijEe0PFmd8DRIi1zK8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rtq6KKUP5ikbDDaqNgsFSToWAvM8sb5Da4I+QTzB62U6bsbnnBa25L0Y+YJHKdJgNW7Kgs0bLb2X+Novx+dbMSgPx/wUPFeZsK2k01L+RwpS7Mr5KLax5BB5SHu/8YeVnAu08Byahp6EMbwV0jWR5wsJbbTQNvNSAoJozjjbDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=KLX+Qgyq; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="KLX+Qgyq"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gw8yn6zJ7z8dQD
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783496146;
	bh=AFosKaX5OsadutGDjhIznvAHdijEe0PFmd8DRIi1zK8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=KLX+Qgyq1sSKZpKEwwwmKpXUA7IM+CaWg15/v5H5l6GSy+wcWanuTcUsIR4HeeTEt
	 xTTuPQUNKBW8QglmHCy5fWO/odkoNkx9QsT90MNa8MTzqF+ZDHKIVyxdNpzCl6NfEO
	 lQ1Uucwip4pAKsM5dZz3vIigkLVNyz8b5ft9tR/75LU8fBE8UNDVYY8QKS4u0ShXs8
	 TYsEvT1VcHLrjq69tyJIWya5BKF5N0m0+oXQ2GnnWsMxveFCXfggyJC+0BqI4H3GqH
	 fpXijxtvnsJ2qp+m27eapqcJx/gwYWPKthcJPnJ6Zj8lqq7H3ss0wk+ZWduObyB/Q9
	 NmdJOVmxAurOg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gw8yn6Fsjz8dNX
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 07:35:45 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gw8yn4X83z8sbB
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 09:35:45 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F34DB603C7
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 09:35:44 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3f7f9c06-6d96-4d6a-9dd2-853d66100bc1@leemhuis.info>
Date: Wed, 8 Jul 2026 09:35:44 +0200
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
X-PPP-Message-ID: <178349614515.3073229.6733349725625977033@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: F34DB603C7
X-NC-CID: nAwBHtomRhh1WB76/2NOjzt04WgASrJ76WsPPgkY++WkgpnvjzY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260707162146.73823-1-stefan@agner.ch/
#regzbot introduced: db299a0c09e9
#regzbot title: net: stmmac: network interface init fails with custom MTU
#regzbot fix: net: stmmac: resume PHY before reopening the interface on
MTU change

#regzbot report:
https://lore.kernel.org/all/CAAuFnRTyva1_3tsF3vrMBL%2BTLS1YL4EgUPT2c3O9k7A9hWUMnA@mail.gmail.com/
#regzbot introduced: 82378c6c2f435d
#regzbot title: x86/mm: Probabilistic segfaults on AMD hardware with INVLPGB

#regzbot report:
https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
#regzbot introduced: 12e1480bcb49
#regzbot title: clocksource: sun4i: boot hang on Allwinner D1

#regzbot report:
https://lore.kernel.org/all/f23946f2-06ac-4607-8f2c-3ffbc52b627a@redhat.com/
#regzbot introduced: 6a5e64c75e8295
#regzbot title: PCI: problems hotplugging a virtio-net-pci device behind
a XIO3130

#regzbot report:
https://lore.kernel.org/linux-usb/CA%2B_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com/
#regzbot resolve: inconclusive: reporter said: suspect this wasn't a
regression tbh

#regzbot report:
https://lore.kernel.org/all/A3834A07-5639-4779-844F-C5843DFC3928@dynetrex.com/
#regzbot introduced: 7299b1b39a255f
#regzbot title: can: usb: f81604: valid interrupt URBs are rejected

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5465
#regzbot introduced: b74322eea36b
#regzbot title: drm/amd: integrated Kaveri GPU output fails ("enabling
link 2 failed: 15")
