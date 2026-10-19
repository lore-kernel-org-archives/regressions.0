Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A43CB56C
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 05:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388384; cv=none; b=RQHNXHtLGSCl98YwRjI2HoArcDqn+wFmlQsp/PE+K87UnxAp40BzaWEgVgvYe1RSZ6kl7jbjCujRBWXY15arGe5pAeO+nyxpGGlnIc6WtyZgTadl3Ja8alg+BIuWyk1Q3WouepYQb3VsvW/MT6zOwZpzLNYPGcvSIoCsHKqKPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388384; c=relaxed/simple;
	bh=cjkPYVeGxchfVGOvFOtMfiG1XPan5JRbD6Wwip6rcU4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A5oFe9eTje5mgY0nNFpX+a5yEMTSx1zE3xIpE9Gdm/x0xAwRhpEMpVYMtn4K6vsDWMpa2u9lVY2qdSYE4jthWKwlemOQbxlRbNVlHRQhAzbDxlgqNsWtWpzfYIHdztlJbH7//WcK1Dqp8NnX7qKz5wH3I+2OspHMiF4USUyrao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hOTZMqqu; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hOTZMqqu"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j7PW734Wgz8MPL
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 07:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792388371;
	bh=cjkPYVeGxchfVGOvFOtMfiG1XPan5JRbD6Wwip6rcU4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=hOTZMqquvYNuUw5A3Vd5W24x/1UlBJu258x4SzjoqkBOjtjVlh43GdWAhWH0PUPTh
	 u9hW2gmawkhWJ2dYT4I+0Kduy1M+wHZ+UWqScPnzE0HJc1GoTg4+z43GfbICjCkm/3
	 cA8+osOlBuaSpO1B5hbuXsI9kFs6SDJs2onm8PhLOsmN/1662fh/Iq+Ox3moBWXz9W
	 TO8b79dtG8UnmHMFx0n6Xu8pljt9n2G1Vu8h6Wv5p9FbUxVECn1n1RfGU954ILSzZG
	 uPgYGzvQRdPN8WZMG1R5bpyukAJpVMQvvQAm7a1k/4CoDzCocsRaz8uvXkspQV2tTs
	 Mf4M+fPZXu6FQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j7PW72Mz1z4yKB
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 07:39:31 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j7PW70tZHz8svT
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 07:39:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 217535F8B2
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 07:39:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c845fcac-924c-42b9-a089-7237cf2cd8e4@leemhuis.info>
Date: Mon, 19 Oct 2026 07:39:29 +0200
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
X-PPP-Message-ID: <179238837030.3061465.397984618800525286@mxe9fb.netcup.net>
X-NC-CID: IiAG5B0hK4kteISHkXQXHMUB4IHDv7eqKgq6SmkZ+uh2Q4N5ePU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/atEn9dyqsyI3SNaP@redcloak.home.arpa/
#regzbot fix: smb: client: fix compound alignment with encryption

#regzbot report:
https://lore.kernel.org/stable/20261015184044.1321868-1-mehmet.fide@gmail.com/
#regzbot fix: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
