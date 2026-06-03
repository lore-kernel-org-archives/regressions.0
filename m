Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDF40245D
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484232; cv=none; b=W1fmPQbfpGlr7rFLNXvQyptGEhiAUuQP6VchgjuP6GFFG0X8MuXhiSy4sLVtgdjv5UuihbZsKTZc4w1/8p21ZsF88yzQ7GA53MstUCEuAs5Bg06Zwwi1CBioSyxj977k7hiBpaDw7rWpirFxiu4H3cynKuDHI9Aep54PeTtji9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484232; c=relaxed/simple;
	bh=F4ABWkUBVfta7JTJNNecxQGRT8zVlO7NRsASmfjMk2Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UQOmwguPWoTYrXVNU5iw7jtOcFp2prckTTMh8gk2D4KI80NCicfTEzYjrPwO6uqUaHS0k1xb4k+2GOiggs62DOevnYqGQEeIaCSwEIGvKf+RSonyUofDvoxt2LVV/3f/a4TmBwRKp6hhw9kZJ5zkPYPH5e1UE29QX516nQEUesQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WeOdQxoZ; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WeOdQxoZ"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gVl5D2FW1z8ht4
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780484224;
	bh=F4ABWkUBVfta7JTJNNecxQGRT8zVlO7NRsASmfjMk2Q=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WeOdQxoZzLN9KAZoBNJdxbDp+mT7DyEqe2BFOsjeo4mB65E6IAbY/2X3Mh+XD1za+
	 j3AZbwjPCHfO5JiVjmwovqcS++e5W/VmrXlmOGwFcG1Nc4VtTOOZxvm1EbK+8lsdi0
	 JTFxV9uX0zfGO2+qCVx1UAXOJA968xe8Hi3PQGqg9GXo48AZGjvkU7zPerdH8jl2wt
	 RZV1HLWp/tcAAL8TyoqFtT8s+QKlSmho+lI+7PunLNuIyn7ZzMmPFXlp4+ZgYR8zia
	 eVkTfXNrBqQMXOT9Hx0P0AbNqkKEpvRmzBDeBQg4z6AsQKW+WdxvlIpQR8zd/WrfTx
	 RySdEE4cArERg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gVl5D1X7vz8hrn
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 10:57:04 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gVl5C6p2Bz8sZd
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 12:57:03 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 016FE5F96B
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 12:57:02 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3d9b583d-39e8-49b3-970b-044e71a45ece@leemhuis.info>
Date: Wed, 3 Jun 2026 12:57:02 +0200
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
X-PPP-Message-ID: <178048422317.3198808.8596667389755904524@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 016FE5F96B
X-NC-CID: gUSVlnY946bhSdAuCiAiUv10hA2uXSZKcTBaRMiEFOnl0JXLBYk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221606
#regzbot introduced: 9ab94a32af704fa9c873094283ae8744a07baf25
#regzbot title: net: r8169: PCIe AER errors and recovery failure after
recent driver changes

#regzbot report:
https://lore.kernel.org/lkml/3f4567fc.f496.19e3b2b297b.Coremail.23020251154299@stu.xmu.edu.cn/
#regzbot resolve: reporter does not consider it a performance regression
anymore

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5336
#regzbot introduced: 71aec08f80e706

#regzbot report:
https://lore.kernel.org/stable/20260310102233.391113-1-arpithk@nvidia.com/
#regzbot fix: fs/qnx6: fix pointer arithmetic in directory iteration

#regzbot report:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=master&id=64c79dfbc458
#regzbot fix: serial: 8250: fix use-after-free in IRQ chain handling
