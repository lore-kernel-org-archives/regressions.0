Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579493;
	b=wEQ6XgJJNz2lN5KyQXmqytWFTgHzWy2lvv1zCXkJyRetf/6NuTur3ZJ2TveWQt/Gts9l
	 kFoW0iWPNGBAX6RaczyWKKNd5zC9n3fD0ffomheETy+0PhAgiyciL6oq/5Da8Ls2GEnWd
	 LuaTDlE36VvSgjR4mWXQKDHT/rIHZesKqEbcHg77Id3AN703GFkHXh0w4ttr2gWXfNeuK
	 JA1OOU4zzZI3PjkBc+Osgjnq6X3pJSMHXVUjeAcysuaN2WS0o9RzUJQj9T251jeTtbZIi
	 dtsgaJg8Z21PatRaABhUyCw3QqN+3QL7EX6g7IKzhAtJViXtbCdEGcr/9ICN81CD0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=Xwq5Tm+3QY7Okd2FQOt5Q+DmQl5IGbBYnryu8mlDvfA=;
	b=lqro5dcb0MG40MkE2XPolHKv7idl4aI/9Ucb1OUCsS4+ERiQeOnQFLaHb2WDNXjMR5op
	 ClI5Q0/VJgVitTPiG4MVsXlJcCupQLVua0gt3CiT4R7aTNZhjh03dePnOBBQZxC/K2gnc
	 NFQP0W4ZyoWmWtIXRuDdJSHhCH6BkgCSMIbcGt7aYLPZ0YILQgXo0gNTfftRj0uSyEzzW
	 JGZoeEFzLZ33RQQbUqW1ThFAdZCqDw4u3JYYt7kW2io3qeAwSRW3eCpkVevTkuczk7D10
	 nSkDI6K1R+h3rh5QtTw9YU1kgQfWDOS5kFoXehwLYNEAU3B1yr5lGI6UBcB4nI2mpRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Hhk2rkuw;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5503606A336
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 14:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5503606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Hhk2rkuw
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jQzqr33nHz6Vjc
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 15:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794579480;
	bh=Xwq5Tm+3QY7Okd2FQOt5Q+DmQl5IGbBYnryu8mlDvfA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Hhk2rkuwocCAPIrdHgFcp/jtBi22eqstztjgIy3wU0s/rydcRuH7oWIopnkn7fy54
	 nIsQJVCWoFLbEs1Z6Bro3JO/NJ8s2rGL3GKRUzuDvEBVrjuws5G5L6i+PQnUez1oA9
	 R8hqQcYutuzh0g0gLi+AcdcS8Ef8LvE4D/XHuFe2UFt/8xp7sFnbv/2qKDgHTyMUeQ
	 S/5NW4a5yWcRcPiI1ac6f4kKA7AjhEJgk7lg+noizVHEP7LMMm+4aIvspNg34iTLvd
	 VCaxpayJa6+f1eAHPgzgnnPikSySM4SlZ5H8mLURlWD4WHITHqSb0mX0+DnuIY2JOx
	 0BCDd5q/R7GNg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jQzqr2Dnnz4xJl
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 15:18:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jQzqq3rDPz8v4b
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 15:17:59 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 983D15F98B
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 15:17:54 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ee5c9abf-d9d6-4f90-9819-ac1bdd34d5b4@leemhuis.info>
Date: Fri, 13 Nov 2026 15:17:53 +0100
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
 <179457947487.2055517.13267019902668280186@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 983D15F98B
X-NC-CID: aFjASCEJ/bZSt5EB0fHcGeHMx1tzKLetXGHwiJ4ChnLzbnFoCJY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/cd6b07b3-f50c-410c-b230-43889ef7a455@laposte.net/
#regzbot fix: ASoC: soc-core: reset rtd->num_components after allocation
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=222249

