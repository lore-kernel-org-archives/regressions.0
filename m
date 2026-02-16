Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83C2BE056
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233867; cv=none; b=WyiZLQxU1y0PW149Oxp4FV+JYRi6pX7oknepLYeiAJdPHx4mxcRm1doG3j6nyIlcw4F8RzbA/9LoQdi5fKk8aGVMO0agRBYxDg1E8On85rf+WPHVSo5rWIUE+yqwf0eye8vRrC1iBOoMQ1nmtznixqytAo1Nl7HQ0f62LzevyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233867; c=relaxed/simple;
	bh=9MFuiGvRolyQw6fGVisq5Z7l28y9JEFlSbmGvo/N9sg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ihHJzxGX14DfNcBgR+0rM6jVOpA1GulZFdgwZ8iJ5gBEPlaEFDzXyrF8DHSeFRC3tP6Y5rWyDt0IgDjQ84Ce+rNTog4LlqAMMOmi98N1px4EfXdRPu+XgwHpDqV/wkX5v25oPf+yhvTuZ6Tl8hyZaaTyC9oOREheJcRwJhT2jxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PLwo1mYx; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PLwo1mYx"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fDy5W46Vmz4DYP
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 10:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771233855;
	bh=9MFuiGvRolyQw6fGVisq5Z7l28y9JEFlSbmGvo/N9sg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=PLwo1mYxjruA6EptyCbhmLUjGzkFTl3ImRDCzwq2OHuBrKHIM708vPfcWeu44kTPT
	 ErAXs3xcdwxT7rS9Dt+lwKb4F6QsH7gGWPT9I/Lc4RQEGZC1wkDmph4NQPURZmlnz8
	 eUvSWsfjY3Ao5BzHLJTI+TlwGMDGzuUB6WUzdrBa9H0eGbFcfc8o4R1VQmDUdkLJlI
	 WkEgMWhsrDkXI59X1vriN4d1uzIWOVfoyQG6mOt3tDAe/PYOa3U9C+m+Pc9Yi4yrNq
	 J1MAvbWbv7fOkrZkdK9qIC7iccYPrL1JMxS39Qhmi2pJL+b2R3IRb5qqZuAYRo+lCN
	 rr3L32PUeDRkw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fDy5W3PZ9z7wSs
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 10:24:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fDy5V5HG3z8tXM
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 10:24:14 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0A348674FA
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 10:24:14 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ce586ec3-36a7-4aae-bf2e-827d0de7602a@leemhuis.info>
Date: Mon, 16 Feb 2026 10:24:13 +0100
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
 <177123385418.2136943.13531015567917957012@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0A348674FA
X-NC-CID: q2ilbBZzQVGeg+2zlVEQI7t2N441xhk4Kek07FQUE5mBYQZPJ1Y=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221028
#regzbot introduced: 83dbf898a2d45289b
#regzbot title: PCI/MSI: pci usb3 card stopped working (x86-32)

#regzbot report:
https://lore.kernel.org/netdev/CAA2RiuSnH_2xc+-W6EnFEG00XjS-dszMq61JEvRjcGS31CBw=g@mail.gmail.com/
#rezbot fix: 4ce768ac429ec1

#regzbot report:
https://lore.kernel.org/linux-mm/20260206121151.dea3633d1f0ded7bbf49c22e@linux-foundation.org/
#regzbot introduced: 0ff67f990bd4
#regzbot title: mm, swap: hibernation really slow on some disks
#regzbot fix: mm, swap: speed up hibernation allocation and writeout
#regzbot monitor:
https://lore.kernel.org/all/20260216-hibernate-perf-v3-0-74e025091145@tencent.com/
