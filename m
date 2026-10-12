Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0049B1F4
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817946; cv=none; b=tNjntHds3N7xnPK3wShme4ZPdiJYWYMi5eOW+aX7gtUXMBszl+OG8lNqIFPCcvvs2mW+LDW3kSxCk5P27qwpGS8bEwxgbGjT1uaXIsDx45gjseszoznJS3WV+EGWcmxCxSw0Lh914uA3lIWjfEKXQ+1CVV6XT1NTrSbdCTgggLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817946; c=relaxed/simple;
	bh=ewr9G2cl7g8JWYrvFEj7G2OjyRah2Xo0avswH9At7lE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Jas3iSimGoqpzyhy40QhtnjmUiQ16/u+khJgNrCIo2k+tOmUyheOScKRRhfvJUE8x9NR2b+tOwYPox+0Ef0pjhYk0wAlq5vbuj9wpgTHJtxeFZGmRtLILet3pnIVGuoZL2fdWdbVocVX/bKkOGeZaI6r0pEF9qFp1LnVfEX8hxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AB1FLpU8; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AB1FLpU8"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j3LYK1vDpz49mX
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:12:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791817941;
	bh=ewr9G2cl7g8JWYrvFEj7G2OjyRah2Xo0avswH9At7lE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AB1FLpU8kUv7JgjZaakiz0t03xvicxMEuonhOB0Ysrg9ntPFJHqwI43UrqTat5cbA
	 mUe5rrdKVQqDVVdv1x+4f+FifR5Nuqkku39KLSNbze/uhu6QNlHw2zQ/TDmjzZtySY
	 XCs1cpjGWZLS9dMl/W3P9O95cTRYzjbjgPnrRGO8OqkdzY+GTd3wJSwh5leaJM9huo
	 WvrwT3TyOQpTfZR6M28KDJA7yJqT2KaFd9rZttpiSQpHq0jKJBbFCqp8mkftagdeSx
	 g5cOm+aNyjLmTpvol1jOW0vyAf6wCQZv27kXWH1L29/GMYOd7qYF0RRLwMZBpVwkb0
	 K502AOLQCu6fA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j3LYK1Cl6z47TT
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:12:21 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j3LYJ6TVbz8svG
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:12:20 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2BE2B5FAE4
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:12:16 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <95ff3218-38b9-4941-8ece-03d0f6ab76f8@leemhuis.info>
Date: Mon, 12 Oct 2026 17:12:14 +0200
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
X-PPP-Message-ID: <179181793636.862890.13888959492356554971@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 2BE2B5FAE4
X-NC-CID: aQceeGKblMZyFdYcjI461I35npjRy4xO/HAnfqyRMnRiDTWIPg4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-btrfs/CAELqY9==Ter2XQPRp=gjW5T75T+7kcZCXpn5roF2L6tY6mQNxw@mail.gmail.com/
#regzbot introduced: 146054090b08

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221675
#regzbot introduced: e9b63341dc15

#regzbot report:
https://lore.kernel.org/lkml/tencent_8D7EB01E00F5CD0928A0F70A451C586E0608@qq.com/
#regzbot resolve: inconclusive: maybe moved to
https://gitlab.freedesktop.org/drm/

#regzbot report:
https://lore.kernel.org/lkml/20260823150046.204417-1-nickita.taranov@gmail.com/
resolve: resolve: inconclusive: only happens with a micro benchmark

#regzbot report:
https://lore.kernel.org/regressions/178733874460.1338.14907565015998697320@kernelci.org/
resolve: resolve: inconclusive: looks resolved, didn't happen for a while

#regzbot report:
https://lore.kernel.org/regressions/178711194407.380.4108589457572337694@kernelci.org/
resolve: resolve: inconclusive: looks resolved, didn't happen for a while






