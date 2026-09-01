Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE133B97D
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252887; cv=none; b=QhnEoUhg82O0xAAYrFuTPaKDN5mZZ2+1D6SzjEOcqg0aRQsPRCKQkY6asJYh5C392+qcQ+5vCZmtDkGPk2ULbuKvRgY8wxxzxkev8f1rpfs2TCZfJLlWsMCpJGY/Xzfxe64EvCPv12YHdiVcA8eOqvSdpxNSioTFtmTiA4S/BGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252887; c=relaxed/simple;
	bh=Onb0ROFWbqT16u+pJc7x/QmRI6wGCEEIVuXOwzgOeQ4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Wq2cHWgJz/jenNToAnUP0U3RV8z/xnqbLlsNTvfMhcaOU9OY6PlprIKk/+boHD0dLT/vRAOzJvsYx/kg43OC12A7pZT3GgEWmqYTYNwCx+5mYSPkGoATv56rENtFSH3XM7VIOfC9dkfZugh/uMY27ryKMPoyLexnjgbeiDiVxik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AP2m86dq; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AP2m86dq"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hYzv63kX4z463G
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 10:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788252290;
	bh=Onb0ROFWbqT16u+pJc7x/QmRI6wGCEEIVuXOwzgOeQ4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AP2m86dqsBdRK6vP5fsmy17RUy+t1UnBWtXoUM4SRY0I43r8HxyNpLPfr5vqEEPtI
	 oDUnSLW/7GxT8hFYfA/82FagXiReLW8pogEkVLgMHC2zcHaB7ueqRohBTncXkU7Bsm
	 0dJDGj+OJCH9GluPoDq3HdVNPRoXDKRKy3PAFKgllC6zoTDp/sVzc5YrZ270U9ps5s
	 scjYZGz+9R5Tk4CpXEu8vZLzjsQ2X2ajazPjO8kr7KSJFzeZz/eUrPO6ZHd2IH3S0h
	 tD/Sj8b7Sj1kBKvWpNtmxOhmfMqlqT4X09rN9uFKwAFc1Ka5VQ8asp3PgUHwqoFJsX
	 1ILMl+Cf5mfxg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hYztG3r1fz4CPl
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 10:44:06 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYztG22Rvz8tJR
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 10:44:06 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3846F5F935
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 10:43:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <879aaa2f-e466-4a4f-92d2-935cadcd0ecf@leemhuis.info>
Date: Tue, 1 Sep 2026 10:43:58 +0200
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
X-PPP-Message-ID: <178825223940.2886116.9460128895341748920@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 3846F5F935
X-NC-CID: 0xYqryHXhFyyz8E6VGNtTCS4lRc23z1ZeVsxeqAeLcehCZafu/0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260828134340.2501683A24-agordeev@linux.ibm.com/
#regzbot introduced: e091351b38818e
#regzbot title: tracing: occasional Oops on s390


