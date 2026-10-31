Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793427185;
	b=C0LhuhjxLQxYwkIR86XiouApuYfeY6u2BDoj3fQSX2ocgeEUKm68HwP12yuHWGR/5QwT
	 CbSfOMBUfXwV9PxhYkqoXPQsHOgFlNFbqO7oPT6APGX2UK5QQRubYf6hor57LphM2x50M
	 0FxoxT1M9lrbx2Lw0iUZ5kP3k7K0phKXrPeW8ARxaWiqubN4TxpB+esRuRsEKIOD1UHAE
	 /G6N/B/8bAGZMoVO2kwOMaEqTuTi31Nh2aoOqQdqeFOZDC25GNU1NJUTqq3wvJx2aAuCI
	 u5C/QMuElNgVsJ2peuR9RGgHKBPJi1B7hMavGON6vQsoIRo+FggBOBncydlWd1LJgwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793427185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=+GUvreaC8nWHQSHozgXdzrBKY5rMJ97k8LqPZrFm4As=;
	b=wmYmwyk1gNGDYtZM4mBJ9dQ5eQq8lV5qY3tehvem/SVttiSegfUHuMqS439s2DpuD2KV
	 wDkMThwHo6tIiwffei2uCkv3K+HcLImv4U5DNAMGaF9SLlZqByLyIR96g/MtewDGhokOe
	 4f38Ho5JqeilYkF2WX5OM6YESIOJN4CMixcyxwt8md8FFcqSOfxIomXfdVsVeL/4dWsXz
	 HNMJzpdEqd/WgpV3rnon1Wq0DwMjdL5xGRDTtxW6D24nLz3O32jb3YQkXTO4ywLwZ+i1+
	 zru/oJYfH9HgKqNt9UsDmUklXpsTNH+nE+LpzGZEQVqFTrun/8NS/GsizDYCQWtmTCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MFmSeGbH;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F93606A31A
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MFmSeGbH
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jGnh73PfLz4c2b;
	Sat, 31 Oct 2026 07:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793427175;
	bh=0qpvLXOeazWyiRzdD113xE69EhZ2QrLcn7mfxnNbXds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MFmSeGbHjDVMP8kOx7c+wfrODhEHlS9unXR9F9pEh03fKwabwzthMX34fRBkXzQSk
	 raE84WEeoF7M4Iqf15uil7HM2RVV154enI0EvcmM7bPzs2T2o3UczBH6A+M2IE2goL
	 d07EaHUcmP26Qo3KB5cLROU8r8B0aaaC50LDlouyYDDF/tSICFNgtzUEbM2+QCb/q1
	 VuogwyI7lZv7CnXy2t0emvJWVM+yU1wHvw/grf5c3eA60faT9e2LrRaG/7+X9F9+wp
	 eXRXeSO1JNabw6RWU8e0dJh8D0yPmPikHR/ZMCZYlFVXzZgQUSAIG7mL9Atc6ffB2/
	 7UNXz2og03ETw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jGnh72jSSz4bwG;
	Sat, 31 Oct 2026 07:12:55 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jGnh65MwRz8sZw;
	Sat, 31 Oct 2026 07:12:54 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 07FE45F948;
	Sat, 31 Oct 2026 07:12:46 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <92103377-8054-4dd8-93af-73533fbc36d9@leemhuis.info>
Date: Sat, 31 Oct 2026 07:12:46 +0100
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
Subject: Re: [GIT PULL] Scheduler updates for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Ingo Molnar <mingo@kernel.org>, Stian Halseth <stian@itx.no>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <atSiuBt4n03_iQNW@gmail.com>
 <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179342716743.562067.7724336413095675945@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 07FE45F948
X-NC-CID: ujzi47qrUgXfYkbFxKmu8IssA2udzpSSwpbRRx+VtH7n5fLbe4E=

On 10/31/26 01:05, Linus Torvalds wrote:
> On Sun, 18 Oct 2026 at 00:43, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> Please pull the latest sched/core Git tree from:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18
> 
> So this seems to trigger for me on my laptop. Not every boot, but I've
> seen it at least twice now:
> 
>> Stian Halseth (1):
>>       sched/cputime: Don't account idle time twice after dyntick-idle

Not my area of expertise, as usual, but FWIW: a fix for that one that
from a brief look is about the issue you are seeing is discussed here:

sched/cputime: Don't warn when the tick period starts after idle exit
https://lore.kernel.org/all/20261025100202.2584654-1-stian@itx.no/

Ciao, Thorsten
> where the new WARN_ON_ONCE() triggers at boot, resulting in a splat like this
> 
>     now < tick_start
>     WARNING: kernel/sched/cputime.c:481 at
> kcpustat_dyntick_stop+0x82/0x90, CPU#2: swapper/2/0
>     Modules linked in:
>     CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted
> 7.3.0-19045-gb92f6e90cf05 #7 PREEMPT(lazy)
>     Hardware name: Dell Inc. XPS 13 9380/0KTW76, BIOS 1.26.0 09/11/2023
>     RIP: 0010:kcpustat_dyntick_stop+0x82/0x90
>     Call Trace:
>      <TASK>
>      tick_nohz_idle_exit+0xaf/0x140
>      do_idle+0x1f5/0x2e0
>      cpu_startup_entry+0x20/0x30
>      start_secondary+0xf0/0x120
>      common_startup_64+0x13e/0x148
>      </TASK>
> 
> I haven't tried to figure out why, I'm just notifying the guilty parties...
> 
>                 Linus

