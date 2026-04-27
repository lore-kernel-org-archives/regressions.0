Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976A31194C
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291918; cv=none; b=sptCJw4+0qPA2n+mu9/nDNt3kq2npBHIuip6sBCPnopkGHlPrw5V1BBWpWKTGHkSfiZH2wS2DXlpJUSxVBm6BZCw9mrdx2vMYk5mINi7rKz7zzbhE2j14APR54YtqA8ai74ExidNETJYsFntilOuNbJwu3JBWwi5lBVv2IV/SgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291918; c=relaxed/simple;
	bh=MbDD5fn02AIo4wkV/wn2FRIRwpLVCVkgBv4NJVLlmm4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZsR9mppEUINU5lm7yCVzEKGUtC98DeRAvem11YnzZHNS6kxV2xtoqu5WZAKtyAmSmvtgjl+XEqlHGwKoydk2EhNldX5AysCz5Hf2ZgZ8E0e1Z7FGNQT4tlwjUfNQaonnPrEhGyeBvFmduJTYpTfQwJ5GhPrAIHfuDPggpWQwT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=f+uPFSZt; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="f+uPFSZt"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g42VW5hH9z67rW
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777291907;
	bh=MbDD5fn02AIo4wkV/wn2FRIRwpLVCVkgBv4NJVLlmm4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=f+uPFSZtf+YyekKwFMp1+SVp2sTscIchJBh0uaYLjZLRgUWCT71VEXlVME0t8ZIi5
	 4OoAvgKqfM/bCTarkzrVEpWOhpz4NbmJFxsFNJLn9pBZ7xj+y6eT8TVgwpt8C3OaTW
	 tsREhQ0S8OG1psq5xOugmDbY35OjKeAdueGofZz8zpJmD6GIL/6VhEEKTv52CPo9ze
	 iE0OQzVKszFMCUq0u1Wrp6mR+rnPB0qAif3rbvuhp0C0sjo4gufqHPfZ5fby9M79YH
	 RfBiItt7isqDcz2uJkVY4uz9neDjX0buGwQdUC3fO3d2VE8praWJpRDZN53U0MsfSi
	 4QNUVsZEs55rA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g42VW4yjSz4xVV
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:11:47 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g42VW2nHbz8sbs
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:11:47 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9CCD0632A9
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 14:11:46 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <dfa3c8c2-1ed9-442e-81f7-b047e7ff1711@leemhuis.info>
Date: Mon, 27 Apr 2026 14:11:46 +0200
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
X-PPP-Message-ID: <177729190679.980377.15203452537484045666@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9CCD0632A9
X-NC-CID: MYNKHZZtf8ctLjG6GyQhcF/0J63gBVkM7Wf8g+3WIRozooIMFdk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/db830769-2681-48ea-a8aa-f4cf8f3dfa4d@gmail.com/32fe6
#regzbot introduced: 574faa0e936d12718e2cadad11ce1e184d9e5a32
#regzbot title: mac80211 HT/VHT MCS check change causing Wi-Fi speed
drop (~20 Mbps cap) on iwlwifi
#regzbot fix: wifi: mac80211: skip ieee80211_verify_sta_ht_mcs_support
check in non-strict mode
#regzbot monitor
https://lore.kernel.org/all/99Mv9QEceyPrQhSP52MtAVmz0_kWJmzqotJjD9YW6LGLqk-AZloAueUyHCURilFkuqOh6Ecv8i2KKdSE1ujP3AnbU5QEouVisT1w_V3xdfc=@r26.me/

#regzbot report:
https://lore.kernel.org/all/20260423-stoke-ocean-139dbe306256@thorsis.com/
#regzbot introduced: 0b0f7e6539a750
#regzbot title: ARM: at91: finding rootfs on raw nand on sam9x60 broken

#regzbot report: https://lore.kernel.org/all/6593091.DvuYhMxLoT@steina-w/
#regzbot introduced: 2524b293a59e586afd06358d0b191ab57208a920
#regzbot title: soc: imx8m: warning and serial id data missing
#regzbot fix: soc: imx8m: Fix match data lookup for soc device
#regzbot monitor:
https://lore.kernel.org/all/20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com/


