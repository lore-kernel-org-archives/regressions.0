Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA527E1DC
	for <regressions@lists.linux.dev>; Tue, 10 Feb 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712626; cv=none; b=tWdkRTLU9BnRGk/CVoMQtQXrDyu2RaLB+Wjl4If5GidbOQTjq+IHNk3zED2e4fuzxag4NRQqvVoXTukrQ94eJXvD9j+/aXHbGXjzgV2nG7pj7I+X5QT/+OTmTDshqoTsm7kN7TCeqMNrWj7p5Ltjzkt5LnAkV1u5H08suXH7SSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712626; c=relaxed/simple;
	bh=lC0T0MRuL5xJNpUWoH3liWvzLXYuR53FqKZOlBp1Gz4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Z8M/sakkZSEuJscOFFES2qYZmRjhhjmpia89O2PCFiN7/GoeKZdHs8U91I9+ozFfmrWNA53TKbHsosJALe++x2afYmEkFkyz/8lt85vmwlH/epkatyXesopmPRAVY/XZQl5/biZfoIYv0vv1PYIfwHCzSg3gAOs+BMkIVpLkZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=B+9094eD; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="B+9094eD"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4f9FK03bF5z3rbM
	for <regressions@lists.linux.dev>; Tue, 10 Feb 2026 09:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770712580;
	bh=lC0T0MRuL5xJNpUWoH3liWvzLXYuR53FqKZOlBp1Gz4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=B+9094eDZc4fUuhDr3+OW4IlFS/jGwSJa0WUWydFI2Pu/DN4npghK4pIskHbFLRyq
	 CLiv3I5QDBRczgl8F3oA+1pEe8P2bAKtzPkAOcBDnY1CVZekbf3u2nBogKTryW+q9p
	 SmY3rNSiGlr2ocWoc6f97Ek3ars7az5OQf179QE1LTyQFRgCad8QnquGmEjmyvQ0eI
	 90mS+ewepb+sWExVPuCXbAmvvHI8KpplHQ11gBzpe83bl8M8lM4JuZlPIsJVeNOaUw
	 ZwF2KUqz+krtXcMFz055JVp8pg1XuxZhy/tv2j8mSm02X0y8WQXJ0E3OFZnjJdFMNp
	 Sb0gHS3832Rew==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4f9FK02rGnz3r7D
	for <regressions@lists.linux.dev>; Tue, 10 Feb 2026 09:36:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4f9FJz66Fvz8t3w
	for <regressions@lists.linux.dev>; Tue, 10 Feb 2026 09:36:19 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 33D3A673E1
	for <regressions@lists.linux.dev>; Tue, 10 Feb 2026 09:36:19 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d7c61748-e6f2-4a3e-86a4-60a9ecdf06a5@leemhuis.info>
Date: Tue, 10 Feb 2026 09:36:18 +0100
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
 <177071257938.1620441.10507759697910852795@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 33D3A673E1
X-NC-CID: Zcpz0MNN51Uofy1GovCndQrFi24ZlCXm4bi45oZnd+fZvLAe0RM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221011
#regzbot introduced: 3bf2e57e7d6c
#regzbot title: wifi: ath12k: crash at slab_free / kernel BUG at mm/slub.c
#regzbot fix: wifi: ath12k: prepare REO update element only for primary link
#regzbot monitor:
https://lore.kernel.org/all/20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com/

#regzbot report:
https://lore.kernel.org/all/0c33ef9a-24b1-43a6-9f93-72249b1cceac@gmail.com/
#regzbot introduced: v6.17..v6.18
#regzbot title: btrfs: zoned fs goes ro when writing several TBs

