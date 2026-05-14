Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CC3DC873
	for <regressions@lists.linux.dev>; Thu, 14 May 2026 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747626; cv=none; b=rRP9oIN/ee5mQZ3zF9rEup6LJIXrD1l38SJ+T9wZ6QGDQfg67gVSz/uy1SSCpdpvG8zuVQ2DBEVWxCLCOQBfjT5N6o0WJH/q7Nf1YLCe/8C9KhJR/XLTSaZsNxNz81Yartr+29ZtIKxlQu7gHvtPqHRQ2yo1NAfcmpje3H6Bc0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747626; c=relaxed/simple;
	bh=1/uIy/dO97+Ue0DparU/zR5/4TCBQxsb+9so8I5VeGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KtZpfpo6rAJZa6mA2bJJRQBSQIEdexbaP9zEivcYmSDfeCxg4OloSy/t4uKt3Jl53ugKDQy+ETYJWfTZTWel5hg/cYaR0i/sSeOlYPcrVTBunifEUzwOgImmm7OCz2zNn1NIs8raMEgplXpOkdR1f6FOoCxFi6fapXWsNpHV3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jFTnZZUC; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jFTnZZUC"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gGNrs1H1jz45j0
	for <regressions@lists.linux.dev>; Thu, 14 May 2026 10:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778747613;
	bh=1/uIy/dO97+Ue0DparU/zR5/4TCBQxsb+9so8I5VeGg=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=jFTnZZUCGUDBHEUK0vHfL6HjyNGGYnxcY5TK9ai4wE4g8JlvVlyo1I2u4XYoZ42s/
	 vXqG7TsDGRH7qwWSAmAeM7X8Oj0V/6UCTTd6GdbP9ehaXV+ETLTzCr7ZfjVMnJg4pl
	 6rJur0ZcGSLK1zMhtEXc8Sqdq6s+ZpE370aZekokkCK9MWAbUFlNS4/h1BQ6fOflhE
	 o6Lc/yU2VdsyikxuM7yZL1Ws2fbAkwfpNDdl0BOPVnAd+Pd/8RdTY/LLsEYq+V2Bs2
	 61MnjjCj3GQX3Ol3AJlveUUfp4zqYouGm/r8/ENkqU+LH8QZv2x9K+WBPJ0RMeGX99
	 RP6oplzUWXmoQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gGNqp34Nfz422b
	for <regressions@lists.linux.dev>; Thu, 14 May 2026 10:32:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gGNqn68NNz8tbP
	for <regressions@lists.linux.dev>; Thu, 14 May 2026 10:32:37 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 48AEA5F9DD
	for <regressions@lists.linux.dev>; Thu, 14 May 2026 10:32:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f8780f37-8dfa-40b5-bb39-5dc98884d6bc@leemhuis.info>
Date: Thu, 14 May 2026 10:32:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177874755746.1600700.18364888424212929809@mxe9fb.netcup.net>
X-NC-CID: v0PABmbTgv2UXQwTZ/30StoWnjhe42r0VrbtzXYvFhNUNVOSvcI=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot fix: Bluetooth: btmtk: accept too short WMT FUNC_CTRL events

#regzbot report:
https://lore.kernel.org/linux-fsdevel/bf0ba588-002b-4860-848e-e806b193840a@app.fastmail.com/
#regzbot fix: 0c8c88b8eb82a2a41b

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221505
#regzbot introduced:e30ca6dd5345
#regzbot title: cpufreq/amd-pstate: EBUSY when switching to performance
profile via PPD

#regzbot report:
https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
#regzbot introduced: 8ea6e25c853603
#regzbot title: SoC: qcom: q6apm: sound broken on sc8280xp (Blackrock)

#regzbot report:
https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
#regzbot introduced: 32be3ca4cf78b
#regzbot title: wifi: ath11k: suspend/resume failures on a Lenovo
ThinkPad P14s Gen 5 AMD
#regzbot fix: wifi: ath11k: clear shared SRNG pointer state on restart
#regzbot monitor:
https://lore.kernel.org/all/20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com/
