Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F73815CB
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940963; cv=none; b=M4MJkPZcwWZbzTkL8PbynQGxfsHtroOeKDTanxlR9KC+7y8ShxtYXY+sMEEs6SwAYQZE1ghxax31x8FwAPE/ct1pSgvvfaJ8XcLRHXwEDfK1NiPCEA6kt6a91qmvhBR8LQ8aT8rMPjh2aZdXgxNy6zJ2cyfuH5WK++RK8LEyn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940963; c=relaxed/simple;
	bh=Nyjb4MXHS+XFHtkYIESFSNISmxPs/hiSjhjUbV6phGM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RpxLoh6R3Eo/TyG7+ouDTSx5b1/dA4HI+oMrbnV23YgrfBous0kyqUj2b7ktXs4Ilc6M+qvYA6MPIRHn4Yv4nv3Kc1HbUnX1MVyXh8oWAmAe37TPMYiHKpFcH+Q6x3Mn13yKjAa8DGF1OA0abVUxnW2t3LK9m5XtXZiXFiwo1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A/+oc8ta; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A/+oc8ta"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKzbZ07wLz89Cv
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771940954;
	bh=Nyjb4MXHS+XFHtkYIESFSNISmxPs/hiSjhjUbV6phGM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=A/+oc8ta0L72+XO9p204uX4LYjdq8gCkfG7PWTf1hNekkyCQDOs1pPeyCzmp9MhV5
	 j6pkDMAm4Kw8zAJ4FOwc8BrQGm9/VMFy9OsZE8Z2rP1kOWM0N6qmFmL8qhFyYPQA8g
	 5wqCPTB+WRY55Th5g7iODO2vFJxQixXCqsj7MlVFn+A2CSGYOzYalEAHbbm98GXKiv
	 9slc1Y82Q63ouct35QQHRz9+dWxg4XugBKF1FJMKfwLui7UBjSawf3RuWXuUFrstjM
	 FECXD1qL1DQsFWB2X0HohhtNNeWBeBaeP6t3n1Zdk/2eKoKFfN1rkW3P2S4vUD4mu1
	 IOLvNJrgYJ/zw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKzbY6Xrpz4xHs
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:49:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fKzbX6XTBz8sbd
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:49:12 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B4E51652C2
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:49:11 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5426eced-ba04-45e0-84b1-ce525e660de7@leemhuis.info>
Date: Tue, 24 Feb 2026 14:49:10 +0100
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
X-PPP-Message-ID: <177194095190.3693099.9403135517283598156@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B4E51652C2
X-NC-CID: iBAsL8Q/Lrq74eQGsabohdW4Z445fSOpyYo5bO6/37znI2Wa/lQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org/#t
#regzbot introduced: dda7dcd9da73
#regzbot title: drm/i915: kernel lock when waking up blanked screen

#regzbot report:
https://lore.kernel.org/all/20260219164648.3014-1-spasswolf@web.de/
#regzbot introduced: 9311e6c29b34
#regzbot title: ~90s reboot delay with PREEMPT_RT

#regzbot report:
https://lore.kernel.org/all/20260221-repeal-emphatic-ddc2e9b94208@spud/
#regzbot introduced: c217157bcd1df
#regzbot title: boot failure

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15731
#regzbot introduced: v6.18.8..v6.18.12
#regzbot title: drm: i915: DisplayPort audio stopped working

