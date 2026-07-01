Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA93B1013
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890663; cv=none; b=P8sqm4ZRVo1tO1XsiELCbwkt5IdlXrtRsuTtn2Bs7O9+T6mJJUB66r9h2cLqC8VHM5QXb9QHOk35lW76csSxkQ0l3sVqLHm7HdOqVla1blrB3PCbxHjhiwL5b+7UsVWXHs+l7+ji84v6IS55CmRHuS8Vb4IoTlpW975EI9lIaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890663; c=relaxed/simple;
	bh=rMk/qCkRhL+0aQbynA6KdIEzFs0I2Qt9HzLEtMVO0/4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=H5G3iouu5sy4yw4Rj91qW/ZIg9AX5XqcIpXrqmLfizM58SNGk3tyEGwAE05dMhyq49oZZ6KGqYh1i66hip6OCAzpPB5Basix6LoFeFXlmtKo6yuN3WgmHt+T3H6H1pAlJDSIXPIMfrNRKUKSdDokvG7i82WYDeHl9J0jY8vDHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LId0DjtU; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LId0DjtU"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gqrw41syHz6FMr
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 09:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782890308;
	bh=rMk/qCkRhL+0aQbynA6KdIEzFs0I2Qt9HzLEtMVO0/4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=LId0DjtUXBV9MKjDmenXK5oZhRK8tB9BZroyVNmRdVC4EnQuAT94QlXUEP8iTEEsR
	 yyRi2XDYOu7i6wpy26C+1L0FjWnyhkkUZtsMmZzBPZrY91XOBk7IZETUwALN0zlCNb
	 cAHL+QGy6pE7quyYzuIxsuOnD3/mS2VEmxmVqjJA4Gkx9KwQPHy9uLJSovAU5M/MLD
	 FNJpe/YNa91SWTy8ji5tVFhBXa01ore/0zl5AFf+xxMXksY2FGBNfAG255P9u82Aa7
	 xR0UxQ8TDnwbo3euuiOVb9wvNIuuQ7CwmyVzMcxtuOmEvKn2fTfO0bztc0xmHe6qok
	 ETpfDTHibkdRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gqrw417j7z4xsF
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 09:18:28 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gqrw36857z8sbF
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 09:18:27 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D2FD060320
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 09:18:26 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <89128741-9b76-48fa-b58b-f75e9dd8bbef@leemhuis.info>
Date: Wed, 1 Jul 2026 09:18:26 +0200
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
X-PPP-Message-ID: <178289030703.4061306.5536475003495493962@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D2FD060320
X-NC-CID: 2R/R5tAbcUfM6du22e62GQMb3LswDKXq3a4r3I+M+kbygY/hRD0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAAMcf8CXfvzvEUyoASmp=6efRDNszyPJuFg0OU63Z7gT%2BoVQ8A@mail.gmail.com/
#regzbot fix: drm/bridge: analogix_dp: Fix PE/VS value shift mismatch
during link training
#regzbot monitor:
https://lore.kernel.org/all/20260623023506.309858-1-damon.ding@rock-chips.com/

#regzbot report:
https://lore.kernel.org/netdev/618701dd023e%24063de350%2412b9a9f0%24@gmail.com/
#regzbot introduced: 059b7dbd20a6
#regzbot fix: vsock/virtio: collapse receive queue under memory pressure
#regzbot monitor:
https://lore.kernel.org/all/6a6be4b0-e02d-46ca-b8bf-c27bd681d253@redhat.com/

#regzbot report:
https://lore.kernel.org/lkml/178198613176.3658222.16247101620976737948@eldamar.lan/
#regzbot introduced: fee50077656
#regzbot from: Jaak Ristioja <jaak@ristioja.ee>

#regzbot report:
https://lore.kernel.org/lkml/ajRmlyx_AEGybykL@soda.int.kasm.eu/
#regzbot dup:
https://lore.kernel.org/all/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
