Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F330CD85
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777936; cv=none; b=eLyiHz5Ru+WB8+VaFDP+23hFJRp2XdSQ3+QOlpfA2LgDK6p/tKSSm10qmSpjw1+eTJUPZmwipA2kC1d5RAU/rUhNDXrSknKJflSPr85ZNDG3OM7r9vWA5paQ0Ek5WN3gbfknkRcKQ3tejGprborq32no0tx0rQAjrcwJDWmF0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777936; c=relaxed/simple;
	bh=sy2UVt47KvvBZjkvIegcfLekUZy6gD3iViRYXJDAQm4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=con4sBLVMxwJH3+vNFc9QFiIElBwhxouG4tZRjzCHk8jjXLVHdieU73us+HWcxMJsACQfwWkQJn+ZfBolhW5/fK8MPUx2D93wzzYj7HsTxczj4JDb5YyaawhAWPZiPBNbD0AhuAiKwppsVZqfwrbwdtZFqBMTUwNhezB+Sqef9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=X/C4BCZS; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="X/C4BCZS"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gPjtX3chvz8Bhh
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 08:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779777924;
	bh=sy2UVt47KvvBZjkvIegcfLekUZy6gD3iViRYXJDAQm4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=X/C4BCZSKmAn5TJoUP0W2dhFxXnM5+uuUkBWZGYdSMg16uvf8u9u2UFa7ub20mWeI
	 2v16wgNHyOYktIIStlGwvHJ5KlKfGy32KYhRpBmWP83XOmoMUOnsl5yQaNa75j+DBk
	 Fdb5DDVKfnYC019OmyzrQ5enFeYCv0jg6PKPI56jMatJNnnFCwq+SoKo8MHXCt1Uiu
	 ur+OU6Q0h+MgGBfpH1VrY/yzsNzGRm3E46pObDNeRkNdfR90AahG7jfMhOs7vSmoxm
	 79FdduUqXMGe/sTH2cq4QW0lJK6OsiVHq/OTvqObz92vXqgCFJ5Wg9yrU4ZY0EVcIT
	 FUWB3OYJ0/dsA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gPjtX2w6tz8Bh3
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 08:45:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gPjtX1VhZz8scM
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 08:45:24 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5C6B96031E
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 08:45:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6f460a7a-6bb9-4024-a2ef-9438675814ca@leemhuis.info>
Date: Tue, 26 May 2026 08:45:22 +0200
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
X-PPP-Message-ID: <177977792358.186384.12659492602114578301@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5C6B96031E
X-NC-CID: FNwMZ2NWxiKGFg9YNyX06f+sLSoZlmHXRsD4ers6s+98NveytgM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260525101635.26090-1-ncopa@alpinelinux.org/
#regzbot introduced: c4295487124f

#regzbot report: https://lore.kernel.org/all/ahC8Pyuatu_AvnZp@google.com/
#regzbot introduced: eaf290c404f7c3
#regzbot title: PCI: dwc: suspend/resume regression on a Qualcomm
SC7280 laptop

#regzbot report:
https://lore.kernel.org/lkml/20260501202438.376033-1-florian.fainelli@broadcom.com/
#regzbot fix: ed831e7ea1a860bdbab3eadeb95f7f73e9d212df

#regzbot report:
https://lore.kernel.org/lkml/5efe9e03-4d86-43a0-9ec2-e610ff31095d@free.fr/
#regzbot fix: serial: 8250: dispatch SysRq character in
serial8250_handle_irq()
