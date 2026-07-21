Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E73914E1
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643334; cv=none; b=e0yFI3Dd2PZ2Z1hH1KI3vEqo8LLhBky9HWhf5exQK1eE1b8XwrYWZfOorlxHEi36HenRW4gsZaZHf7NoLcyqrQYwznQDMvR7A2VocjP3F+MUd4ws1CT0P8ZTi3zDDAEXCgfeuToQ7SmdTmsuJ0EZ8o86EXe/+mOT8ZNAhLpvGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643334; c=relaxed/simple;
	bh=EjVbTYXxzUb2PCoEveAXBNPmkFItvYp8i6ujJLTjwz4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kM/z6Eap+1XbXzrX3rDcbjYLi9y/4GLu9lYEBLs7HEdkvUchAH7x0adJl1/bm4kf3qKkj4lWaomyy4t+SF9bMUHOVE5mCN9xz7OOX8hmb4Ws+6lJ6lKGERSmU3qNh4yvrxlRRyA3ZYF1J9+HWvzlrc3YFUwZ8EGBufMMTa+bHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OWv1AxGw; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OWv1AxGw"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4h4KCw2plhz6G0T
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 16:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784643324;
	bh=EjVbTYXxzUb2PCoEveAXBNPmkFItvYp8i6ujJLTjwz4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=OWv1AxGwDCeOtne7u+h4m+LK5PH2RqpfBHMXTx8SflVAqJfiGQpOVo/kia8QS2ITx
	 mP2gwM5Hz9iuOwomJqOyNy2TZTqQqOgNlP8e+SqID5Df7e3HKdOtgcqwccYEyTw+F7
	 PinrjJFbpNBDaiKwC3uGuvM69Uo+en313qCJ0QfQ1rWrmx2E319kgzPEae1ZOfAH3p
	 PxyH1XpYTYNiw+HSiSVKYYewcL9urRublBaVE4R4iitAzhs96KFxslD4KMua8DhQ+X
	 FsPbbfQ1NMS53mVrRApnuzYzqTHGYeT6dqVTCj3wbhY1dzIKW484FjtP9E3x4t1LRS
	 8znfVOTe8dZNQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4h4KCw25mTz4xjG
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 16:15:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h4KCw0CGLz8tH7
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 16:15:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 851B55FC73
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 16:15:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <087dfb52-7ae5-4ad6-8e07-19e4f1834381@leemhuis.info>
Date: Tue, 21 Jul 2026 16:15:23 +0200
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
X-PPP-Message-ID: 
 <178464332370.2685325.17147036172040631602@mxe9fb.netcup.net>
X-NC-CID: 3WxKiTzBAVRLeuuEcykXmfTWvoA1szN1M6gRx9bqenKv3MoZWhM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260427115804.134231-1-smoch@web.de/
#regzbot introduced: f5cd8a929c825

#regzbot report: dc1ec4fa86b2
#regzbot introduced:
https://lore.kernel.org/all/ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca/
#regzbot title: bitland-mifs-wmi: low-power profile stopped working

#regzbot report:
https://lore.kernel.org/all/CAKTNdwH_ZMQa-97h+tqdsWqXKtorkFF9wHAMn60-8ZGKuze_Mg@mail.gmail.com/
#regzbot introduced: 0b31f297557f
#regzbot title: phy: rockchip: naneng-combphy: USB3 operation on RK3576
#regzbot fix: phy: rockchip: naneng-combphy: Always configure SSC spread
direction

#regzbot report:
https://lore.kernel.org/all/PH8PR12MB7279ACE40040268C9A48F484F9F82@PH8PR12MB7279.namprd12.prod.outlook.com/
#regzbot introduced: 1296423bf23c7a
#regzbot title: drm: amd: get_ss_info_from_atombios() crashes in 7.1.2

#regzbot report: https://lore.kernel.org/all/87wlvazrdy.fsf@igel.home/
#regzbot introduced: bee25f97ad24
#regzbot title: powerpc/970: booting broke on PowerMac G5 (PowerMac7,3)
#regzbot fix: powerpc/970: fix nap return address corruption on async
interrupt exit

#regzbot report:
https://lore.kernel.org/linux-sound/95c21574-97d5-4311-9263-9e174d22d22c@opensource.cirrus.com/T/#u

#regzbot introduced:e496112529006
#regzbot title: ASoC: cs35l56: no sound card on 7.2-rc3
#regzbot fix: ASoC: cs35l56: Fix possible probe() deadlock

#regzbot report:
https://lore.kernel.org/all/7941d239-e5f5-43b5-ae0f-20398221e027@mail.de/
#regzbot introduced: 1b9707e6f1a9d5
#regzbot title: net: stmmac: suspend hangs
#regzbot fix: net: stmmac: dwmac4: mask interrupts when stopping DMA in
suspend
#regzbot monitor:
https://lore.kernel.org/all/20260720111534.163416-1-luis.la@mail.de/

#regzbot report:
https://lore.kernel.org/lkml/0f6d921f-1026-4d9a-bad5-7e5b9485c4a2@breiteneder.me/
#regzbot fix: wifi: rtw89: correct drop logic for malformed AMPDU frames
