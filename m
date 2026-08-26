Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C062E736F
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726321; cv=none; b=bjLVi7IaYxpWFt3Jg8JyPrGJwumTGBBX/TTYU2BapBXiaIZUuxS1Z0xS6JzbOxec4gcBLzLTJS4dvr5swGfxUYYz17/Oo9DNIpVrVr6J8yJGw4hvhct8rydxQ19J3KaEJE55iGF/Je1nP4DxjviNhFNSu7YevbyBJ+KtYsZWkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726321; c=relaxed/simple;
	bh=643mu68kM0cMZ+MImMUy/Y0Mem2f67JVNCaxVqIAa4s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A5muVY5phdUsyHMoXlJ2c84z97CYxKKN+zEvzNxiQpiGE2YU7cPu/fXGo1mTRh5xQvvuM+ZJHL6LYh44plYd0RgBA5C1phnPEIVYIphQFgdwiuG1Ziv0zRP7S5tltKOS2RtphMRbDc1h2FPNJQKGbntp34vxSvWhAnDk8MJ/u+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kjMMaEL3; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kjMMaEL3"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hVFN23h56z65yp
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 08:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787726306;
	bh=643mu68kM0cMZ+MImMUy/Y0Mem2f67JVNCaxVqIAa4s=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=kjMMaEL372rYqI7N71fYI1N6lnd/1FgJuesjTt41Yy7LZnruH8ema1H5tEFiXnXQf
	 ct2AuIPC5/001fXPuEHstcxnb65yz3jTiHuKZXryjYIpEw8Rer6i0iIXfnXZgVnMR2
	 93CogU3TM/EA3JjvDOmL4TpcL4xC8h9j0zfBRuAijjnvpakWrGUMxhPy8seSVWL/DS
	 r4zQBU7/WptrOiDnmRXDY1lXwhjMSOzRb/3lXY1ATdxpbd3zPrJgaNEc0kIsgbhPpE
	 oS2gp+SCQcCoPVUbCNJ8c4uD20iQqK11jfCtw9bPh9pEOL1f4+0dxU77bh+QqFaxGL
	 rTz72Nd7fr0qA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hVFN22xpQz4yNj
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 08:38:26 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hVFN21DBPz8svJ
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 08:38:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8A0205F992
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 08:38:17 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7ff6b0a9-c89c-44a7-a7a2-a0ae0c550c6a@leemhuis.info>
Date: Wed, 26 Aug 2026 08:38:16 +0200
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
X-PPP-Message-ID: <178772629773.2139138.6596516852128442895@mxe9fb.netcup.net>
X-NC-CID: RQWHzix931SpCqAaNeaIzX2RPIG/dwPQn49iqVVz0OFFzNCnQHw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260825T171428.247977.raid5-discard-reshape@zandbergen.org/
#regzbot fix: 85764f475f3b3a

#regzbot report:
https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
#regzbot introduced: 9b80bd9cab40
#regzbot title: wifi: mt76: mt7921: network interface does not appear
#regzbot fix: wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init
during probe
#regzbot monitor:
https://lore.kernel.org/all/20260825181712.28548-1-lucid_duck@justthetip.ca/

#regzbot report: https://lore.kernel.org/all/20260825132604.GA70046@pevik/
#regzbot introduced: 03a43677ca91
#regzbot title: exfat: swapping broken
#regzbot fix: exfat: map allocated extents for swap activation


