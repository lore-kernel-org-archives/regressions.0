Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BF26B777
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762601; cv=none; b=DiNjWK02BkBAdJohos8zk9z9q+TZKRKiaAtDq2tN5PnuQk9zAinKNGJeOBrZh96i6oYQ5ryxUbKRlw8sS+NvuvbqWTVQbBV73zvTiMGEEkjROUHHUZ/JFtfcxuwj//6fquxaOSE/rMurJrmfTJAlsLPNlbEd+KVsvN1B/yGQESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762601; c=relaxed/simple;
	bh=mP0TaOV9VD9BLS07o5pmBV0ax1avbH7wK1858UiEH2s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tSYUleVgtGj6D3gWCfWBTx5AFbr0Rbj3AmMvAp1GAmd5+XcwyehdMIlkBHvBbuV4qr2Es1r6De9gY2VKEJ/Ij1DHoiJ/W5eAbkcTSIuOXY55OqywIQU6pO6kOjQsJKrvU8PI+OFsBE1WSd3NwMhECJojr3vjZXHK32QIXeRDZ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OonfneeR; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OonfneeR"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g0GlR3pc2z66Xy
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 11:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776762595;
	bh=mP0TaOV9VD9BLS07o5pmBV0ax1avbH7wK1858UiEH2s=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=OonfneeRBnToEj7EzD4IxBQbljMzDUQk23zd3nt6g14Raygd9Fi2SarLVVPyCaZxo
	 Fp4JQlKwlEQN0uM+PWgK5tjXRgczGzpRDK5SBaHcM6Uz0IEmE94Q0hqFpkGfcfz7sL
	 9fvqJCCUZFXQiFuL4rlMb9cZ7APYfdZhHMgXiGQZjBvATvcSK/19gyIiN9JT8lT4Ii
	 6vp3T3qreYTUttwrCimppL7sj/iFOWtZ98v04BJOn1+lgb0aRUVunX2HOgK/YbiWOJ
	 P62/UYDLzqBqaSMFyyr9qMyn4oQpsrNUOXlMw69JsuG8P9cYWnHTK1FBnJZj2rt9p8
	 2/y4u2Y5WYfIQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4g0GlR35FNz4xgc
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 11:09:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4g0GlQ5zJGz8sZl
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 11:09:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1D7C763623
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 11:09:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6cce61af-5cd6-44ff-9fa6-be791f996489@leemhuis.info>
Date: Tue, 21 Apr 2026 11:09:51 +0200
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
X-PPP-Message-ID: <177676259428.967901.4595483093917166725@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1D7C763623
X-NC-CID: JJoLut8t7n76x2bLIqKT1+aAW26wtDN1uaM+W3aADKD7FTaxUwo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/HYhMd0Klo0XE_yiVY7XmsgyKKFDwKHfKRy22KrycLcYd0V_ykA4xdbBMJXkA07YX3os6qK-NhMIVi6ITo-CkNIIF0e-GcI0UwwZmdDhAJ0I=@protonmail.com/
#regzbot monitor:
https://lore.kernel.org/lkml/56ce85d5-e0b9-407c-9a86-708111a8a509@linux.intel.com/

#regzbot report:
https://lore.kernel.org/stable/CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL%2Bw@mail.gmail.com/
#regzbot introduced: 6c0cfbe020c0fcd2a544fcd2931fbc366ee3cd12
#regzbot resolve: debatable, but likely not considered a regression in
the classic sense

#regzbot report:
https://lore.kernel.org/lkml/20260221-repeal-emphatic-ddc2e9b94208@spud/
#regzbot resolve: inconclusive: pretty sure this was fixed by now

#regzbot report:
https://lore.kernel.org/lkml/587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com/
#regzbot fix: 8678591b47469fe16357234efef9b260317b8be4

#regzbot report:
https://lore.kernel.org/lkml/20260226060714.1636773-1-changyuanl@google.com/
#regzbot fix: 4ca191cec17a997d0e3b2cd

#regzbot report:
https://lore.kernel.org/linux-fsdevel/Utw_Cjiuq0_XhCoA5EXpzLE9qfRpiA0-fmXEmui7NnBnIeMiCDGOyXWPtE5DkxVNYNSsgiUotB7fsGYnlMQn1xDCx14yx1d0UJqx62vAwp4=@proton.me/
#regzbot fix: 76f9377cd2ab


