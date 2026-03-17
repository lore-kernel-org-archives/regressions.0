Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D73E3D81
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758896; cv=none; b=BFEnXuI1Ct0/iHpDrQufYOqYRkjhZtd8rYPwjlyWRrF51wBpbkHF14ZFyfn7JiuBGup9Rg9nCdSkkdCKD1CUTdd/K4fYLMRB8VzOfuxU6L0x8FAq7NbDBSrzkKsA3veQyJKpM1WVaJLKf9iqb+aLEm4Nw9YwkCIxEGPv7o7yIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758896; c=relaxed/simple;
	bh=zTNBXiF9sma5IkMfe4hqCr4U7U/CKd9Y6L63Ajd5zGE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=psLPkgd4C5ltWEUm9oLVwNLFkqMAfm8Fvxbl58ZKe1SU5JKeDa10YoKKTcvGzLbKMBA5v0ddlfmbyMoeWN/Vjm2Y3giQD80CjC1+wLds5f3/FVErpKAuLSx0ud/+3GecS0MXHwc0b1uVBtEIlpS7QqMQ7CUxlQMApwDzBDg7ZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=KVdT2+g3; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="KVdT2+g3"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZvvw3XX4z44Q9
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 15:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773758892;
	bh=zTNBXiF9sma5IkMfe4hqCr4U7U/CKd9Y6L63Ajd5zGE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=KVdT2+g3LW+1o3fxn+F5Gn/S55aacLg46P8J+HRHgzCFz2JNNF0l8qtSGnmMZPSEf
	 PFo2WRwdE5GqERf3JG7vOVG1HCG7nR0d+tdT8B3V64R3WbXvr5No1xl6aOnRvi45le
	 qNnXhtReGamOMKc8XLVMZLYyTBMNqwcA6Oe3cuQQasOS8JSvvxC+REskmaQX5SWuJj
	 tbuG43TC30+Jsv0nuJyviPjPgiijtmKi5dL5yq5dqKlO9pwm5tOdfFvB2WVRmxW8JH
	 hBe9CcPQp/9wV6oE4wOMaxHzeFlaHHSNtx8ulQCIRRHdJzifHBmwA8+nO6siwd3VPr
	 awBsUCYGXwBxw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZvvw2nWjz3vcG
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 15:48:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZvvv4Zkwz8sfv
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 15:48:11 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BBB7F632D3
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 15:48:10 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <25949634-3368-415c-8ab2-9785b4428bf7@leemhuis.info>
Date: Tue, 17 Mar 2026 15:48:10 +0100
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
X-PPP-Message-ID: <177375889093.4093631.2731648435511637295@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BBB7F632D3
X-NC-CID: C4BLz2+dyN+T2Oj1V1mFaM47LKgC1m9m/hS6uRy5fRM6VimyTWw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de/
#regzbot introduced: 1c1658058c99b
#regzbot title: hwmon: (dell-smm) coolercontrol said it couldn't write
the pwm attributes anymore

#regzbot report: https://lore.kernel.org/all/ms06y93w.ritesh.list@gmail.com/
#regzbot introduced: 1471c517cf7dae
#regzbot title: powerpc/iommu: amdgpu driver fails to initialize

#regzbot report:
https://lore.kernel.org/all/Utw_Cjiuq0_XhCoA5EXpzLE9qfRpiA0-fmXEmui7NnBnIeMiCDGOyXWPtE5DkxVNYNSsgiUotB7fsGYnlMQn1xDCx14yx1d0UJqx62vAwp4=@proton.me/
#regzbot introduced: 0c58a97f919c
#regzbot title: fuse: suspend-to-RAM hang

#regzbot report: https://lore.kernel.org/all/abcGli7C40kr72mB@m.b4.vu/
#regzbot introduced: 38c322068a26
#regzbot title: alsa: distorted/silent audio

#regzbot report:
https://lore.kernel.org/all/6261958.lOV4Wx5bFT@thinkpad-benjamin/
#regzbot introduced: v6.18..v6.19
#regzbot title: short freezes (rcu_preempt detected stalls on CPUs/tasks)
