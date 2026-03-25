Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F8C3A4509
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441406; cv=none; b=hkD2ZjBuzI9FG6nSw5Yb4KXTDJdMmyCxrNHAPOoYCxpjyT39jopxUZmyepeK+GIbJqahjiRTmNphWjOxVi0p6Abbe3gq58Q7jbs7r82gMJjI5mhoqwy97iprOus/ssKtzUEwTFn4on04RpO562PNJ4OUy7f6iY7FrpnCXrX9rjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441406; c=relaxed/simple;
	bh=NMleeGAFTyge/bBAKo0+vHh2lKs8Gr8X4VkHaTAtyJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=tEBhXul5BekTCas85GZp0H+zZSg6gcLXSGdAdp3iMXMdTjZErYeKtRUoZ/oL3ueYjn3lHxie50T9qLcvV3oVsEpsl+Red67FE5TytF1fxY4w3xdWHbREuAFIldYwCB0nTNmsHlbGfid1Bl44R6KvvL73MCiujlfKgP3UfOprtLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=f8iHskWP; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="f8iHskWP"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fgmJM0tp6z69Pm
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 13:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1774441363;
	bh=NMleeGAFTyge/bBAKo0+vHh2lKs8Gr8X4VkHaTAtyJI=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=f8iHskWPL5kMnKiWl1zRdBfgzNqnBIBeaBjcXQmZg8ssI91NWGoTEjFLNAatsoou4
	 7jUssDqzErMxb+VhUW8LF2rA47f5NYgAbLUdV56prJmPiYuk4J1uNHMaDKDX5GR4W7
	 w/NFloeAQQEah7cdZIJlIrGEB9OPTmkpES4Wwsq0UqBz96oCRv50wx3ngz7XmsQm3q
	 99acuLEzYpR7cvsMbGU1/9UmUh4c8+YOqwjhdFuNq+zulTXlVLB5vJgaRHCbW5FSUr
	 cJAM0XedqHTwU369wSweRXSDvQZBjXLDvpd86duJQ/x+VgDyUyOtRyGx/Zurftn4dj
	 O19NH+98MwwDQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fgmJM0BYRz4y3g
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 13:22:43 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fgmJL543Nz8scr
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 13:22:42 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DA4D7634FF
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 13:22:41 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a2a33127-d344-4617-902d-6049af93c57f@leemhuis.info>
Date: Wed, 25 Mar 2026 13:22:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177444136205.4082818.5071180163745650499@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DA4D7634FF
X-NC-CID: DAu752gC63OSwu/fxgsLB6X7Xd1OGbR2iKe+TJlOeSmnQoVDdb8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/1be114e1130ca59ee91fc5a73aaf43a912d408ea@qpok.net/
#regzbot fix: 378dff71efddd1

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221262
#regzbot introduced: v6.18..v6.19
#regzbot title: nftables: flow offload breaks forwarded LAN to WAN traffic

#regzbot report:
https://lore.kernel.org/lkml/20260315232500.251088-1-CFSworks@gmail.com/
#regzbot fix: ceph: fix num_ops off-by-one when crypto allocation fails

#regzbot report:
https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
#regzbot introduced: 446fcce2a52b5
#regzbot title: kvm: performance regression when running many
Firecracker microVMs
#regzbot dup:
ttps://lore.kernel.org/all/CAK8fFZ5qLeA3b9P+_N3QejwGLAmeAA0XJyQnCXROu-0a5gzH2Q@mail.gmail.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5052
#regzbot introduced: b82f0759346617b
#regzbot fix: drm/amd/display: Wire up dcn10_dio_construct() for all
pre-DCN401 generations

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5012
#regzbot introduced: 7c8fb3b8e9ba
#regzbot title: drm/amd: black screen at startup on FirePro M4000
