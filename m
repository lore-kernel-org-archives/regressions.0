Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4A4EE854
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889446; cv=none; b=IucYunWfOlfNtbUCN78S05yjTISDii5Tec9A3mp/9MHoDziCPIiGINv5gGlzL6mYCgGBbBSe3M3p7YZLYrIEdljC5BqRiyQB7O0m2EDSlTsQ54XjiYCf/8oOPQWoSifvjY2+7TnfQDM/jFIwaqNei9W+locHp8odnXraPWCq6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889446; c=relaxed/simple;
	bh=lW1ezv1FA2Z8Qiho503eDZhb1IuVvRvN0FlAKncPaVY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BfbmrycrqyaU7gARslX/YRTPqfyIlwZFoQyiubHjVY46/8xpUlGSH2CNCM+Q/ujFpDw+m+Zz+avmsagRvFQnOmtcwOOrUi2o6vNAhDbvUrQtfTuA8ZPHQVX/beO/w7W50yovaUxFjqTYaJkp3F3Yhk33gfHgP0yLTVsnylqv1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=F6JK5ZpR; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="F6JK5ZpR"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j3s0C6zVFz8Nhy
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791889436;
	bh=lW1ezv1FA2Z8Qiho503eDZhb1IuVvRvN0FlAKncPaVY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=F6JK5ZpRu6ZeUohyhWrcSmCOV3wCas6vu1gQN3DE9sC8GS8rOfcERBBvZgu+DmkbZ
	 Zm+CjedX7e1WcCDDwSye83K7xVRyU0wPwEjb+E6IqhHrmKP38JgFpyMqhMDBtpxcpn
	 K0pqM4O/EO3RZJtm97i/FjXhuoh5ywXDX0hHMbOFytnJJUdmZhgji+tBsnARE2xWa1
	 QjDnwPiZ/T2hImR2WUnm8CSRxG9n/KJ40rDKSm64UwflSJRi75o+F6pYyApPYs+r1W
	 XuehtVTuuSLrIold9qyTX7GJR54qlcBN7yMGs9bh85WfmJ/XC9iOHCOSVusREFyqDN
	 V/oY5PPRA8Sog==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j3s0C6Gk8z8MwM
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:03:55 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j3s0C4czlz8svT
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:03:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CC5255FA02
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:03:48 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a1cc60be-4d97-416f-8aee-18ff7b8665f2@leemhuis.info>
Date: Tue, 13 Oct 2026 13:03:48 +0200
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
X-PPP-Message-ID: <179188942902.3925451.2940241324036923758@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CC5255FA02
X-NC-CID: lqQTS7Nq69mCTwdMGc1gzIw5r5hrNrZuoEwtENyRUZzpWlI1I70=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/alsa-devel/MWHPR04MB1029801AFD77D790D33C53E1592CF2@MWHPR04MB10298.namprd04.prod.outlook.com/
#regzbot introduced: df4148a5a3cf

#regzbot report:
https://lore.kernel.org/alsa-devel/MWHPR04MB1029801AFD77D790D33C53E1592CF2@MWHPR04MB10298.namprd04.prod.outlook.com/
#regzbot dup:
https://lore.kernel.org/alsa-devel/97a17ad9-3e2c-4839-a28e-51706f321414@kernel.org/

#regzbot report:
https://lore.kernel.org/regressions/178733874460.1338.14907565015998697320@kernelci.org/
#regzbot resolve: inconclusive: looks resolved, didn't happen for a while

#regzbot report:
https://lore.kernel.org/lkml/20260823150046.204417-1-nickita.taranov@gmail.com/
#regzbot resolve: resolve: inconclusive: only happens with a micro benchmark

#regzbot report:
https://lore.kernel.org/linux-btrfs/CAELqY9==Ter2XQPRp=gjW5T75T%2B7kcZCXpn5roF2L6tY6mQNxw@mail.gmail.com/
#regzbot introduced: 146054090b08

#regzbot report:
https://lore.kernel.org/linux-btrfs/CAELqY9=eoM-v816v2otCNitOgAFnrWZ776F3RECwPOwKveA=zw@mail.gmail.com/
#regzbot introduced: 146054090b08

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5720
#regzbot fix: c4a5160e3be0

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5760
#regzbot fix: 0b0ff65d3c

#regzbot report:
https://lore.kernel.org/regressions/77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz/
#regzbot resolve: invalid: not a regression, was a local override
