Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD442D94A0
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082088; cv=none; b=BImX7ewozJu30lkpvOlihvdXNousuwXtoQuN6vkoVGYdQgV9MdQLMmexMwMlMqrMOauiRCOrVQ6TJMnUPrJ7oDnElp9Bs0/9KCpBwu583RykVIbWEla13DBVxCplVhhwWAnW8AdlGevMhGrkzVP2JXkIcw21066iZbpJeINUJNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082088; c=relaxed/simple;
	bh=SxV2WNAfw6YDIyWP49E8HK5zy3S0wtZUgo1xxi236IQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ke5r7Wz2ptjadWC2PiYlJ0kjONq2eaBjOclmExvzq3OzlK+euvlxKRM/4Fz+g+1Zyziek4JGA29aFdaXtV4s68sYyjrbR9Af7UM7pUMULKM3SZ9NE8RhJAtS9hZosW6nJfA7ZYgz+TtIoh9U4rNUdRC8z/N5P0dGSDrZjo5QgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gI5WC90U; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gI5WC90U"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fvQwj4qV1z4D3w
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 14:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776081669;
	bh=SxV2WNAfw6YDIyWP49E8HK5zy3S0wtZUgo1xxi236IQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gI5WC90U4zD98R1VViy08DXefD4bg7syt0RpZqzo5QXUB4b6Jef9DZIADszYOh/tq
	 r9boUJl1MmWN7kUMMwplHP+clCelrWRyHj+WIHxI8u7tZPZ7hfT5s3dzQSnUddpyrz
	 EkkXgQZ4vdX+otKJwoRBNg3dxXYVZzOMVbMzPHM8n2XRTy9Wa18GIfRroizfKCU0/O
	 fJ5RyOE3M/4YcSVU7sHXFxoHmf6F0C3RmoeBbKg2BhPR85ApRLFG3/ZbMt+q5J3dM8
	 r8OF8VFqIQGwul2OaTtIn+D4MkJIsEDNnx22eOTcWxSeu1hISfBKM9wlWqEibML8TY
	 /AHyEZgEudfpQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fvQwj47Fwz7w8r
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 14:01:09 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fvQwj273Hz8sZw
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 14:01:09 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4B820635CE
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 14:01:05 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3e599c3e-a451-4689-808b-45da34354c38@leemhuis.info>
Date: Mon, 13 Apr 2026 14:01:04 +0200
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
X-PPP-Message-ID: <177608166547.197704.12735716931303542096@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4B820635CE
X-NC-CID: d8dxpvc5RI1R1rQALBq5x2DWFEzWYWwpX301RyBHTDWw7YbEK84=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/a5f23340-2b84-4734-be11-f5a97c188195@app.fastmail.com/
#regzbot introduced: 3958bf16e2fe1b
#regzbot fix: 9036bd0e

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15731
#regzbot resolve: inconclusive: reporter MIA

#regzbot report:
https://lore.kernel.org/stable/20260310235642.6d9798f4@plasteblaster/
#regzbot introduced: fe856be475f7
#regzbot fix: d4c7210d2f3ea481a6481f03040a64d9077a6172

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221234
#regzbot fix: 7a126c1b6cfa2c

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221283
#regzbot fix: 6b60e35a7fdba4


