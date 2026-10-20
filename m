Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510537;
	b=HUkTrCksI5+wd6kFA0Ihe1mPGQrZ0w1numcyFF5Bk7q0aNFxRb7NvbXEPFWTUkyMXwIc
	 InmTfB83BenqTyY3tGq68XpaEvTIeoqsFx/sfw/XUn/1Z7mDc+I7HZUYoj6Y0XbVcjHyu
	 K/pvsCWY7Y1PHRv9y+p/CDM5yOtQoX3t5pnVwkZKYzvsoJk+Hu2vO5+/nbvj/4S+Zc8qr
	 GQgVHDstllRtKvabLpRZKQ/cqUNcHKIBSgsE/hfxgL6BakjaFjUL0e2qOrif9c1NzgtD5
	 eDNMfkzpIPowZqYET7YfWsIjvA0ToFTsx/l2KZbXmSDscNSWVUy0C2tMrvXU00CTaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=jq6fCnu4QBHL5cUzzOjAYVxdvZM8pFh6tHbdt0gMdic=;
	b=Nys9RAC/oKUR0cBNLjZgrYU6QedoPbctTPiX3hb5wOvWDYbb+dM15Od8+hMado+nPAeZ
	 U+xDmDQOVdliEG8lUbjkl/x3wCblqV67xu5QxlEuooafZ+2LchwFLt80ou8AleLKgwyMF
	 LqDRrcASzFkdG3vg3LRRkUOUhC5o4dOstWdD1u5Ma7Y72CIfFiAVAAncVHxgofEvxsiqQ
	 3is128aoGebW1GDAfL8DrGV1YJWRDoAFqNQp0r8z9kr1uLo/Zz51Zba40S19y0l1IH8p+
	 wINQQgOznEHE5mpoi1YkeM4EPXkXAOeWNo43XHO1v1pH+3KbuSw1+bDpKlnbO0kpGIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=E9XQ6lPK;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E27606A31F
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 15:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E27606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=E9XQ6lPK
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j8Gg32nNxz8FJ5
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792510463;
	bh=jq6fCnu4QBHL5cUzzOjAYVxdvZM8pFh6tHbdt0gMdic=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=E9XQ6lPK5/5NFi4g5ZzzSJnPNPNZ0r4uNdeLjzMOWzh3/KyHDZERrOk26pwM054AM
	 4ihR/viOQ0t+pL3I76iVk9LKZ4ElVqWgkoHF+nnvOm/fMnH6YVH74uLehmrpiFfb6H
	 SkGel9g5SWQkfEeJv3Fbu8tW60bvp6Mp3Ss7U/eBCmeF8SflZ0z9e+HbWfAuJOJH2g
	 wd1inGZtdgHtuh8gW7coNKmx8I85qJpkZTYjdYh+93wQFWLN0uy2ORweZe4t43LlSd
	 6zXiRfHzxdBMItkPpyIYIX5vJCJQ7og5jWpzG4pgKQaI7UH0qVC1p49qqiXpB4jjVV
	 7SG4v5sbwGcHg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j8Gg324vBz8FJ3
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:34:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j8Gg30VwLz8svC
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:34:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0B3155FA77
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:34:07 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a49ec45d-8f64-4ec1-a847-04089d1291c5@leemhuis.info>
Date: Tue, 20 Oct 2026 17:34:06 +0200
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
 <179251044725.1554548.12218333760915655931@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0B3155FA77
X-NC-CID: QQJUsy5o/KLuvZEBIvKO5QNqvWmJnCWWaq+nwKk30Mbr5FKpP3M=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/20261015092200.GZ219304@unreal/
#regzbot introduced: 7d22b1cb9d84
#regzbot title: mlx4: no ib device for Ethernet ports without IBoE

