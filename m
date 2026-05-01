Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA3359A6F
	for <regressions@lists.linux.dev>; Fri,  1 May 2026 06:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777616395; cv=none; b=Nj8wlltKkFVkyn2ISnuwuv89ZO+dbiYwI9VOhg2f40or219QvIehS1fUxVZYW0oTqfbFw4Td7ZK8dJ0GDEWzOfexPTdJC6oLCb1f4kl6PVmzFfZ+DZ1brq/d4MGkm6ph76pQoJ3TnAuYnygKUT05ncyRtcSSoRLGEGCFwAsnWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777616395; c=relaxed/simple;
	bh=kmnLr2ISPpF7PDknkWGtcRYJlIDIuaD6KVcwuUL5rUs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=igDat1iYMIOLW1v8Gy233woZc5NphYhdpQvrDBRfDIabCcbNB7HtCKtmkoEawIE8ogqUMOQm8DnRJcoLlP+a8SIOEFXDQT4wFXs+/Va0r8FoKOS0QUG+tYekbMpPMDMYcZyoZ4M15O1p8VwciW6PsiwRr3HQ6XNibZSFj6EgwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LpUZi920; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LpUZi920"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g6LVQ6SFtz68Vx
	for <regressions@lists.linux.dev>; Fri,  1 May 2026 08:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777616382;
	bh=kmnLr2ISPpF7PDknkWGtcRYJlIDIuaD6KVcwuUL5rUs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=LpUZi920t0Je6hAnyzztLHAQw5iijXP0w4mcZWYdsb6SFf/BATdLeL/j/8OUJyO4g
	 VZQjgLghYO9rc24gusG767JPmfJF7T7U1kwKNwU6pKRZxw/yyBS7ub4pwc5OUdc9B7
	 n7+8KGCLH+AHPwuuPB8LcTHKYRNsTWpe3w7muGTpre8rJT76q/W71wMT0WsTueVbsi
	 +WQRcMGx+D2jU/ICgpcyXGQgK6jZZy3ngy33YSJhNJRb1EjV/b1ExfWmuBYuVqC7ZT
	 V9pGXMn5jrcJvzME+P/aTboHJgIo4DodVFdyfYH0AkWb4ODcfbMI9nd+QekAdp54wE
	 NtHx/zWgwscHQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g6LVQ5l3Jz506V
	for <regressions@lists.linux.dev>; Fri,  1 May 2026 08:19:42 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g6LVQ3Z5zz8sbB
	for <regressions@lists.linux.dev>; Fri,  1 May 2026 08:19:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D6B046340A
	for <regressions@lists.linux.dev>; Fri,  1 May 2026 08:19:41 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ad252606-af53-4d92-8560-a7c75d66a476@leemhuis.info>
Date: Fri, 1 May 2026 08:19:40 +0200
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
X-PPP-Message-ID: <177761638204.1127356.6141518449324835014@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D6B046340A
X-NC-CID: oLMVjxZH/hQ5pFgPAtYiy/BUlZgy7YFiOkSG5vlHDnu+6/8GFeQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/97a7d011-d573-4754-9e5d-68b562c64089@linux.ibm.com/
#regzbot introduced: 61bbcfb50514a8a9
#regzbot title: srcu: Observed Workqueue lockups on offline CPUs.
#regzbot fix: srcu: Don't queue workqueue handlers to never-online CPUs

#regzbot report:
https://lore.kernel.org/all/CAMpZ1qEwNOqR-KQD4kEqd93aB-TpHnG6WdQc2tXUF0aXMmw_SA@mail.gmail.com/
#regzbot introduced: v6.17..v6.18
#regzbot title: stmmac: Random DMA reset failure on RK3399

#regzbot report:
https://lore.kernel.org/all/20260429000623.3356606-1-avagin@google.com/
#regzbot introduced: dc8aa31a7ac2
#regzbot title: x86/fpu: applications that construct signal frames in
userspace broke (such as CRIU and gVisor)
#regzbot fix: Revert "x86/fpu: Refine and simplify the magic number
check during signal return"

#regzbot report:
https://lore.kernel.org/all/74a75b59-2e13-3985-ee99-d5521f39df2a@google.com/
#regzbot introduced: d80a9cb1a64a
#regzbot title: mm: "BUG: Bad rss-counter state" and "BUG: Bad page state"
#regzbot fix: mm: fix pmd_special() fallback to observe huge_zero
