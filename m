Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635423;
	b=3MPp9Fy7lw3rk8eUJy2nHKsVEPi93RuoKcxaLAiIJVrBVL5kv2XenorjYh2VcZQSRp1/
	 jZLM/tpGrVF4gPZSO8ZiGu1FhO0+Vijc3QURjMy7TPZjAtpfogOmmzSe2/1t6OFCw1/jN
	 8VGIG8W6H0sR/Tnhk2lzwpUDs4YcanRLThn0HzvLjj7ah8v4PgMjouyy579ZtWp5JvXSU
	 6E7/8eOWbndUV5QlW2hPvB1oILdvgKpc4rH1IXzZzxV8xVMAiw+ZzNqAwNhpHycXalOWH
	 XxmAgvA8dGbIEijqNeEWmr66v+5pys7vPBijJ3HDT4t7WjuydwIgkEZ+X+wIyJonlpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=aZyfwc7JAJDfrzIEX/TlaqegknI2hoWXkqg1iidkgnk=;
	b=3ZeroG0n3oFg8RCwBOBSJGmmLZH5IBxiyWsB4uG0xeajIgYJCnfAfJbpP+gjwS3uyGun
	 RY9zRUilr1CBd7NTgbnetBaD83Yv3yrLUIlHdZZ5ExJfPnBzsOw4Sya4zkB9b/vObVFqH
	 DC8Hrw//TKr59KDyJLrmpIHbdHgayC1Jjzk5QftwRA5e/20HQ3CAYhEbDcFOoWXcZzIFO
	 UGU4KqOkgQ5GEuRqr8VcCbkw6PwO5a/6iBAhWouXVAUlXyX0NB+FNzahDZMmBpshtqVuZ
	 qVG8J5X4FnKMZB+QaZlp6BqcthZKOHX9H2k++lRohimn6M43OievIwJDIyMsKG5OTdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="RFG2z/2v";
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B51606FB63
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 16:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B51606FB63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=RFG2z/2v
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jJGgy58xRz8J8Z
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 17:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793635374;
	bh=aZyfwc7JAJDfrzIEX/TlaqegknI2hoWXkqg1iidkgnk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=RFG2z/2vkWE2jFFlVORwRQMrfW90X6sf/31R4Dr+hhClwcj0Fis5f1d8JCKCXXT7N
	 AgqIpuiGIfsr+Cu10OxWjjNybu4tGbYIav/aKA9SDiXYNpbragdqaJzPhFfq9/sNgt
	 ygQSwTCZraN/H6WFOQ46nlT/KJEU7XL1DZfwBERK7BHO/wSooo8rTKd6UlD3isymki
	 M9e5aQyQY4edyVF77854VI1RwXAu9oX2A1XvJwAEPuC61fVOvTV6z3nXdRzVeBSHzI
	 dglXJzk/CW9wk9n4E2/hypRyaqcCi29dRZnY1s6cJ05SG/ilAvQHJS1cLBhw0Peay/
	 YQpSrSmmQ/9lQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jJGgN3j3Jz506g
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 17:02:24 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jJGgN173Nz8tH6
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 17:02:24 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 55F205FA02
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 17:02:19 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4523baf7-a228-4c22-9821-821f77d96b7c@leemhuis.info>
Date: Mon, 2 Nov 2026 17:02:19 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
 <179363533952.3206141.15911361451630059220@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 55F205FA02
X-NC-CID: 15xPiHR/oDRoQ9lcNaZjVA61kc0tIISvBiOOE8XxI3qU4CJMVuk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5996
#regzbot introduced: 7e1b4bdb0e05a7f65fd2a5ee43bae39c9ecefbef
#regzbot title: drm/amd/display: MCLK does not track load

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6079
#regzbot introduced: b76a5b7bee2255
#regzbot title: drm/amd/display: screen stuttering when using amdgpu and VRR

#regzbot report:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=master&id=763aacf86f1b
#regzbot fix: f322d7f7ae56

#regzbot report:
https://lore.kernel.org/lkml/00cb01dd3099%24c82b66c0%2458823440%24@zadarastorage.com/
#regzbot fix: 620cfc7a664278a55d068e


