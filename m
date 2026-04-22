Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09B225788
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865599; cv=none; b=qLaEZp364jx+f1AIFkJLIe9MSnmmjkrHoBs6l2Xr4R5L9teHzobnblqzqxGKkq2Tg+YKhLCUGJt2Gpgz5Y6go5/pBAf1m2P1SuBKKA9TQi0Z9BcvBWG/Q6duLRKmtOpPUEnocL8euF3s63im1qTUQE1F/D1g2MjDruHym3jkzxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865599; c=relaxed/simple;
	bh=F5bZE2BE/6FG0ahZLtYj2MDFbyYLiHNtgTRA8QYVx3M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tv56YOMmTc6gNs65Q3zjHr2PMWsUw2ELJTLuD7+QXWrrzqm34tw/fMfjwBjRwG13MBUSFcIsVxN7h0u/HsthXznvwi5heaPrCNFdzw0JODe56kyQ7CaZTaNzoHSfRb6bQCp2jC4md7tB8d7pjEdkVAeVJicJwKIV3acmB406LSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=iU1RYGvI; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="iU1RYGvI"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4g10r91vt7z891k
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 15:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776865593;
	bh=F5bZE2BE/6FG0ahZLtYj2MDFbyYLiHNtgTRA8QYVx3M=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=iU1RYGvIhQzbnsvzGhBgQ6yDmPfOzOLbRyqqng1S9utxDZvIzQM9NuJzmsTIDen+R
	 2g+MI+xqXxWklYaxzW34281Re1XaTdXcmm8d+SqeyiM0GfNeA/IvUO0OzJKk+3M27p
	 9r53bG0XA9lpLFHiNGVf+BKrGr2kFLEtMeUgFcK5c6Q6Qwc6Z3GuNVWK9+9sTBb6KU
	 QUPYFrL5lw+/YNLfcNwwzjTnzdc9fph9Xw453wR1JPCzq6ATpoNUANSiC2NvYQ6aRD
	 PKA78FSIaeipGKrodSwHsvfxR0GZLJooQGqbnS+h/QJ75u85D8C3o5f440jOoCvgzT
	 VvJTm3wyMX2xg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4g10r91Cgxz88w9
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 15:46:33 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g10r86VGFz8sZP
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 15:46:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0A528632BD
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 15:46:31 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e35866ba-1520-4924-85c3-28fee1f73895@leemhuis.info>
Date: Wed, 22 Apr 2026 15:46:31 +0200
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
X-PPP-Message-ID: 
 <177686559220.3851711.10816129654696992549@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0A528632BD
X-NC-CID: nUBc59xsvK+VAebs6ptCJfG0hSBJm54/Ja6mfMDLA6VCeaAgf1I=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5133
#regzbot resolve: things work again for reporter with 7.0

#regzbot report:
https://lore.kernel.org/lkml/CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com
#regzbot resolve: inconclusive: likely unsolved, but really odd and
likely unique case that stalled

#regzbot report:
https://lore.kernel.org/linux-hwmon/b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de/
#regzbot resolve: dealt with in the software that broke and that seems
to be okay for everyone

#regzbot report:
https://lore.kernel.org/lkml/177349021750.3039212.10211295677877269201@eldamar.lan/
#regzbot fix: NFSv4.1: Apply session size limits on clone path
