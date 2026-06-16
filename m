Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B4942188B
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599881; cv=none; b=d7rSlTL+eXCaWUCsh2ihjr/WFooreukqGOVarNVqJBrzYIK5+KGeNso4MeWSyyE3piJRyCVWssgUn1WrCCatj6fq4+kuKwIYhWRoUdN52iJgyceBSrGwAA9F/tlccnNy5zJXLDZiKl057cPoROOKqWyrEfykp6P8K+rh5LUPMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599881; c=relaxed/simple;
	bh=wlq1gte/onE6FtJnle48ZSykr6Qmh0q/4myTlDEarFY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Quz+fOxwcDzn6WbXX8HNgyIXSdTuS+vtd2GRWXnlcLp7bYMpjAgVdI+2ZtBby1f3/iF2TdXc9lEIzc4pwSXt8jPrdFy+9LOU+cz4JwOqVOCAc5jrbSCmbeMeiq3Sv9LZ0p8ZgiAeJ4PsqiEWJaoMIH+BSv3kumRzLIz1nauNISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bMolktBn; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bMolktBn"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gfgTZ45LPz3xtF
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 10:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1781599330;
	bh=wlq1gte/onE6FtJnle48ZSykr6Qmh0q/4myTlDEarFY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bMolktBnj8F1tF9j9volGGOLFxTxhYcjKTcU2MkyKc+/+gooevKkJmsuHUKoYwSiB
	 Lwm/zAd3CXBAHLo381uqDU3UNl2PI9LsxZVjj98BoJO4ztQZmIgD3hA2mMdLwmxC4b
	 AiZcaRi8L+rdZdtdB/j8tGojKkIcmgUPe4IFYk7Q1xSLgc00vVAC84M+BTaIx5qTGJ
	 fOq473KvfK4QjXtowqXOqIQPv1U4SJfXbipkWcSzv0qqV5+S8c0G4IduCxPyFeEyJE
	 QzlbLva6Y10zdzmf4o+amgXKot2YJVGnTqHW+9dyiPYaD6jaBWs+zJG6z70SiYgVjF
	 IdiWBdfmj57iA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gfgTZ3N3kz3xk2
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 10:42:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gfgTY74CXz8t3w
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 10:42:09 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 117266034E
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 10:42:09 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6f4c58ca-c229-48a8-bab0-21591fd211c9@leemhuis.info>
Date: Tue, 16 Jun 2026 10:42:08 +0200
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
 <178159932927.1738847.15987593696946224633@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 117266034E
X-NC-CID: legMGXx9NvaKwK+HKTrhHwrR3SnGJJQAfsXV/I32T0dCwZZSkSs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/01ac45a8-b558-4d4d-9f8f-e7a4e725d5d2@zytor.com/
#regzbot introduced: 8aeb879baf12
#regzbot title: x86/kvm/vmx: significant system call latency regression
(padding issue)

#regzbot report:
https://lore.kernel.org/all/20260613224434.96501-1-me@romanilin.is/
#regzbot introduced: 74afeb812850
#regzbot title: drm/vblank: display appears frozen
#regzbot fix: drm/vblank: Don't arm vblank timer with invalid frame duration

#regzbot report:
https://lore.kernel.org/lkml/CAC_j7i1R7oy%2BnRhxEjCTba=DUgn02w9X%2Bp94DCu0aHv5%2B5tKnQ@mail.gmail.com/
#regzbot dup: https://lore.kernel.org/all/ai7rnH20IYeSmY8s@gallifrey/
