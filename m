Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968853FFAB6
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567030; cv=none; b=jy6c37RA+/vZvqmDNBDBopCo60H5k2NTEuu40H6bhLVDBCakv/4uqppSpaIEAMW27NLQZ+wmfNzLbKO0d+Kf2Y0EjTcjetCtWXFiohgmvsOG+eQY++sptv6lWVANlh3++TeLH7eOXDoQLzTnITZbQJy4lIqcQ7ErlqY0vyERHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567030; c=relaxed/simple;
	bh=/t0fH7CSsqN3Z8W61gfD8/q5D/eoypecWQpfWAS6+ok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=mZyRx0JLpvPAIxf7l7NrF/HcOUyljcnlqlBle1Iy/Sc34hm5IfrGHOGo9OxJ+B/YouAK53oQzT2t8mpUk3T5Hq6BKYcIPfgwyipZRn9uDSS15gObyQ2zifm+KRh2I7syl9mFrS0/pbCPBW1wif6jlOlumFmxcUNfeLP6s5/pL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AHfg/2Qz; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AHfg/2Qz"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gWKVy03XVz89Dg
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 11:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780566474;
	bh=/t0fH7CSsqN3Z8W61gfD8/q5D/eoypecWQpfWAS6+ok=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AHfg/2QznQv7QfDi5AG116Dnat/Hbhnp5Q9oLYfbU02qBf8XMabOkAXngJ0Z8GTEj
	 5VxfXFlvskGI70K7RZ8Z10ghwZiaqqhlF2vZ+0AU88O84EkJpDYu8+zfw0Es0GMXh9
	 R2ogf4QcVE5fSbjr317REdzWUNC5NNEEgXmG4fP+GyJI7P+i4pTP0FgK9l/SVcySdX
	 LPIBoX7V/X2JM/X1fUTj/yJVb5QB0lC/gPMYMRR8Dy4kXYdOE2JT6ymbQfmb5fme3I
	 JQt8INi8kjhOofLHpNrD74lTrOaXttAcnQLD7NpzJtHdtwu56ZHfqWThuU2L0aRxXZ
	 whWrnxg/6K0Sg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gWKVx6TnNz4xPR
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 11:47:53 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gWKVx4wg9z8sh8
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 11:47:53 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 102696184C
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 11:47:53 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <10a1a9bb-8bde-4e5f-a538-cdfe48b6f2df@leemhuis.info>
Date: Thu, 4 Jun 2026 11:47:50 +0200
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
X-PPP-Message-ID: <178056647323.2334715.3204720677551583221@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 102696184C
X-NC-CID: k6co30jzdJtmOz4AaY9J6CLIaQZItHTGmXgKMPXp+C1tIRj1rzY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221579
#regzbot fix: serial: 8250: fix use-after-free in IRQ chain handling

#regzbot report:
https://lore.kernel.org/all/CAN2cbVe79oj0O9==m4+4x3v+O+qzRagA=2=wkrp9i9=CqYvyZA@mail.gmail.com/
#regzbot introduced: 2f9761a94bae
#regzbot title: net/sched: HFSC + fq_codel stall

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221473
#regzbot monitor:
https://lore.kernel.org/all/20260603082143.11215-1-scardracs@disroot.org/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221606
#regzbot monitor:
https://lore.kernel.org/all/b1bda1da-8231-4f05-94a7-7511041ae489@gmail.com/




