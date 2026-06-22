Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14B3CB918
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782144496; cv=none; b=Cy3jmtnbQtqW3TwJGWLmLCd/x5XYaJtEhZBRScQd5qqe32RfiureGtyVTeofpAmZe5PrNkmWFbmaCQJrYpblLd54csyEqgvv9B0b0AF2aSc6rdLRgdqAuhk4KE+45vgmYeXWPtzBxmfM6WDs0OE4YDol7dPb14vLhRTha2ZRthA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782144496; c=relaxed/simple;
	bh=nCPqTMy5aQS5iY7MoiBv12USJuYhSrks3HrQHueGtmg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=H91F3K5jEcKAnBrRQeYHW45mvaWrSncjDFZkykyPl7pTh5ANQqOGTLQzl8F9LxN5TnzDnl9/KbPm/Y1ZwWzor6iUoaDA4TdxvjBie+n0wnuSwz0s5qRpWVuARV9MzGNzwYiuEeZf3wnBfonSJ9rIyd5KP7j1+nNtKv6oSeUv/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aFre5eME; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aFre5eME"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gkXvB6Yprz4CdW
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 17:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782143958;
	bh=nCPqTMy5aQS5iY7MoiBv12USJuYhSrks3HrQHueGtmg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=aFre5eME6rPiD4xwWIvs0hrTQuoNr96k/YUkau9VdnoWiDzY9mmmaeq34mR5SL3KO
	 YNymw9/7Usp/PhOuOHsvowAXtVmCXzjBHePFthuiB8klSlM562mO6zS8/WzcZf4Umh
	 5Jarfwv1kzsxWLTCAaWf/6TBAs8Zdc1dW8okpcJ6MujZE5j5vLGV0TXganrDWqx9qk
	 wPnS76gLWjImlZlhzkf6+0DfdiTjGUdkoEASYLSV9g7J4DF2MyRTKwGfyCmzvurQOD
	 f9qsOZrmwz/Vn+82w43udFZwKWPmYLjrXQmgvZlBQxf5LOLQ47gqsWW3N2UfYFyFd1
	 0eZ/eMNg/GhLw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gkXvB5sSfz7wKS
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 17:59:18 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gkXvB4LCBz8sZP
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 17:59:18 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F283E6040A
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 17:59:17 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <055cbdb0-7733-474e-9474-af0f75714d0f@leemhuis.info>
Date: Mon, 22 Jun 2026 17:59:15 +0200
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
X-PPP-Message-ID: <178214395818.4044137.7460895739204685261@mxe9fb.netcup.net>
X-NC-CID: nJ5pKdkWyEZpWqpT/BV4pBxIAwMUTXre9+y+v4P48+jqQsoIaow=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com/
#regzbot resolve: turned out to be a local usbguard policy problem

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5370
#regzbot introduced: bb00bf17328d80
#regzbot title: drm/amdgpu: hard freeze right after VCE initialization

#regzbot report:
https://lore.kernel.org/stable/2bfa2f1b-567a-429b-aee2-a8dcf7efd5aa@pm.me/
#regzbot introduced: bf2084a7b1d75d

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221661
#regzbot introduced: v7.0..v7.1
#regzbot title: wifi: mt76 aka mt7925: list corruption
#regzbot monitor:
https://lore.kernel.org/all/20260528033814.46418-1-liujiajia@kylinos.cn/

#regzbot report:
https://lore.kernel.org/all/CAAMcf8CXfvzvEUyoASmp%3D6efRDNszyPJuFg0OU63Z7gT%2BoVQ8A@mail.gmail.com/
#regzbot introduced: 51eb548ade20158b4f4f8693a95b1f31a2480e8e
#regzbot title: drm/bridge: analogix_dp: black screen on the
rk3399-gru-kevin

#regzbot report:
https://lore.kernel.org/all/42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com/
#regzbot introduced: 76255024cadbe8
#regzbot title: drm/mediatek: mtk_dsi: display stays dark on resume

#regzbot report:
https://lore.kernel.org/all/CAJM55Z-hiNDuu5UwoBe7m0wq%2B_WJrRY0cwopALUgpG%2Br3ixj8g@mail.gmail.com/
#regzbot introduced: 7c405fb3279b
#regzbot title: rcu: Allwinner D1 single-core RISC-V SoC stopped booting

#regzbot report:
https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
#regzbot introduced: 31ee1582717e22
#regzbot title: wifi: mt76: MAC-addresses suddenly randomized

#regzbot report:
https://lore.kernel.org/all/CABXGCsOuCXr4R+WW60KNuWNS2MqzE9w6iv-t_ykbwmhqDSABAQ@mail.gmail.com/
#regzbot fix: drm/amdgpu: Only set bo->moved when the BO was actually moved
