Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3D2C027B
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364497; cv=none; b=kVQ/o7U5wmbmVJ+gaiEqbHmpumhQSI6A66hsNuECoA9xw7L2watSLZdKascTRkcF6cNr5F6EE0KnaHpHcSHjRBafYwcC0JsCLESb4hdnyU8/tijdLAzdtIQH3n88JrblgIxWYeZf4HjzauROkk6w8juO8a/76Mm6CS4hWt7orF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364497; c=relaxed/simple;
	bh=l8CmnhD0yw7sSvPNJ+Ewn3uZv52hFWu3doqiMEXKhI8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LkzUCHhIGnEqfnsi1JuHTQ7KxbQAhPQzxI4YflfxwNJt2xjhH7UJ+CX6SssWBHqOiWSPFKfcrkO/x/4OM6Tnf4+FanwrY8Iz4bXEDg1CbzvQHDZh+JiN8kV1LnHl3OmmZ5l7fDiQWLdGIMYq9GsGdRsEW7bMIM71g+ke5opCi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TsAikdLJ; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TsAikdLJ"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4g4YLH0yMFz49DD
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 10:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777364487;
	bh=l8CmnhD0yw7sSvPNJ+Ewn3uZv52hFWu3doqiMEXKhI8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TsAikdLJ2zqukHlEgYgJutUyzoEsz3FME+XgCJES5e2n99V9Dmvcgm7YRQEVtuv2p
	 FkW6I/KZdpz/G8cFr1GuWAykFKSrAUyRndrR9BwZYNMxAd85jpp3UQmxd1J8mMomaG
	 aHJw0gPCqZ7nlJLdCLpYNhczI/Ls76mil0Y5XKtRHEGAib2sMl05zDAXLnQZ9zSJw9
	 Q4gzrRqKURc6rCDnJWkKuokmRMBaYsuCh6QNxzqf1oBOPXQ1VOqy9rPiI5UVTDAkEn
	 j04AECPAwNb64kF+5anjEVLoxqMXI2wE8+e3hc7Z2ftNk9MFO9+HnrPX+eqCB2aS0j
	 Uq1T8DPzqSIOg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4g4YLH0G5xz7wPG
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 10:21:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g4YLG5SV0z8sZh
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 10:21:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 40775633D0
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 10:21:26 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2918508f-120b-495c-b4ec-6db3a969ebc5@leemhuis.info>
Date: Tue, 28 Apr 2026 10:21:25 +0200
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
X-PPP-Message-ID: <177736448643.1339916.9426953394179087336@mxe9fb.netcup.net>
X-NC-CID: oeUOjw4tNlLRCFdjmeAcQWWUa5yALfg7i0recRLCR5xNCWoe0pk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAEg67GmFS0Q4oSZkz8zWdOzckSth9_vBPiOy6a7-d697C2w2Xg@mail.gmail.com/
#regzbot introduced: 42fd432fe6d320323215ebdf4de4d0d7e56e6792
#regzbot title: amd-xgbe: CL37 autonegotiation broke

#regzbot report:
https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
#regzbot introduced: 937f3e6b51f1
#regzbot title: media: renesas: vsp1: brx: configuration of the DRM
pipeline broken
#regzbot fix: Revert "media: renesas: vsp1: brx: Fix format propagation"
#regzbot monitor
https://lore.kernel.org/all/20260425215037.3557213-1-laurent.pinchart%2Brenesas@ideasonboard.com/

#regzbot report:
https://lore.kernel.org/all/ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com/
#regzbot introduced: 93c97bc8d85d57
#regzbot title: drm/msm: dsi: resolutions broken

#regzbot report: https://lore.kernel.org/all/acfZrlP0Ua_5D3U4@eldamar.lan/
#regzbot introduced: a2f1e22390ac

