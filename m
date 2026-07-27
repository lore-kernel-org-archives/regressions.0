Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A62F7F14
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161382; cv=none; b=ieK5npAfbfBtr82lG54LcaN/6Ga9KwwLgVwTCDUoU3ckVcYA3Nn3jhMEa6GXN1Q3rvnw1dlqW13OsrKx1Bqe+tlHbtzuL4j7y1DjPeNS5DjdL9zB5dtD8FuSdZboYE0iMWoFCXjOWsYtGv2dMZpITnSrCjjHGCP9KyzVnOfcuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161382; c=relaxed/simple;
	bh=rYB2jqHBbf3CmttTSzm06I1wVc0yb814ZQGOjz/QX+g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OHjoaaWcNvFkGhGpCRSMgOkdJlMSRiuGBEXsusom4Q+GG8Vs73+U2tlVgzGu6O7ohg6/v2IQTHqzvpNBof+4NIR8dqkzetjxX6KlKuqD2zWWpc9nJ60j9Q9Sh9WX2c/nLhqI14En4ourlypa4acHRjKSuIqJlSiR2K2oDkcdQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kH0KSDit; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kH0KSDit"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h80nj5FySz44qc
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785161337;
	bh=rYB2jqHBbf3CmttTSzm06I1wVc0yb814ZQGOjz/QX+g=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=kH0KSDituOjf1AXpzIKzqED/pgAa+q2AKoydULZNxzN3QPhDqc/8VlLQo5xNHgAKR
	 NV7Z7mPUgXWSOQz3ADk6+fm8ITUF24xhwrDkM99kA4CW/R16IentmsS1QFZvcFQMAU
	 tsDTjRZRgAeWB150j1h5aNCcTT48GongDlzc74JBxdA83aWH76hOjxShBsE20YXKW8
	 8PSyvU8/5sGfdqBlC1FsGUo/HFFFPu+c7GfhHnfgiHs9PzEHKOpg6zO+vCmwLibGOU
	 ExfRfJ7zNb8Tk5r/4CT1kP2wb8G0Ng6z30kf3mt87h1VJqo93TQ8BNnWyfhzXDfTua
	 mM89vET7SQ6NA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h80nj4Z8Rz44jG
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:08:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h80nh5Vs0z8t3r
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:08:56 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DCBDA5FA76
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:08:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <fad82c4b-e89d-4c86-8166-7757cc67911a@leemhuis.info>
Date: Mon, 27 Jul 2026 16:08:50 +0200
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
 <178516133206.2672463.11782473335638397254@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DCBDA5FA76
X-NC-CID: U8DVuEiaDImjDklw1gpFOj1TfO2LslpJBvf1txyLz8f1ZY+m1IY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5531
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5531

#regzbot report:
https://lore.kernel.org/all/CANn89iJkmTwbHkTJ0LgHvhF8PN3zkXmK7A8bydXh-B7yE4K6Rw@mail.gmail.com/#regzbot
resolve: inconclusive: reporter MIA

#regzbot report:
https://lore.kernel.org/lkml/42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com/
#regzbot dup: https://lore.kernel.org/lkml/8733xko1ms.fsf@geanix.com/

