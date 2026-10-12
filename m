Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03445FFDF
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808740; cv=none; b=ryz1JSJrO92ZM58Bei/jJLueF7loWZ59gJxDJauff2QP+8R9JmukLzgOEZim+dpzwwcK3Hr7SjhkVCOGB7Ouyyaq8pgVgka3qlMjsanrMPixSdBqj5DdLx+EdRQVQHBHPLefzPj/FpXhqRKnhFznpEwN6tlhKCdyUw7pn9pXQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808740; c=relaxed/simple;
	bh=GADo4kEjTcatUcLLb20qz0T3U/mE0RvVELXnPDPVbPM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EkjsYe865WGFk5qErFr5icVZcwTcJrIAQ7vpU0RlxSI/ColKPRjELXCPF6uMNRldRIVZQP/uAWVvtr7NnnaJwyr4tLr7enlXQAIU1TEGQfxy/IAUzxLPFhPvLwu55zl2s28OmdxJF+z/j9NZEglh9PTXFlBtL0cQKETi6tDs7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ALCwnMJT; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ALCwnMJT"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j3H0j4N9Jz9GfV
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 14:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791808341;
	bh=GADo4kEjTcatUcLLb20qz0T3U/mE0RvVELXnPDPVbPM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ALCwnMJTLX03zfmcsgorszI0stZvv5XUVYiNB7/62V6NOjzsLdXG9X5DmZYQMQXJE
	 WEZ/TTmEMC0durzSUT5DeFqBJssOYAp02mPWRQROLu3itZ8LMwKrWTvE8IovlMj7vu
	 y5QWvZseXfQQK6EwbF96Bf3GJ7NVEf2e7VgHl9WfLa8sLteFLF6/JJU3Ao90nR3gWI
	 T00I0oydIzBLR+oyf+yWiSqI9lkUOfGAoD65rwfsQ6S1XPAP03HgeyZ97wK/dDO4o+
	 0T2YmQBBGEafITpny18spASw1ZsxHvZCirMctNLLTVtJ7covEjnCOCcnXRv5kMTsxw
	 lGPMVY7ulx59Q==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j3H0j3jXhz7wCk
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 14:32:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j3H0j0DKhz8tfT
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 14:32:20 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 535875FA0A
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 14:32:20 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c4ec7d7a-928b-4cfb-b653-e33795ae6337@leemhuis.info>
Date: Mon, 12 Oct 2026 14:32:19 +0200
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
X-PPP-Message-ID: <179180834051.3631506.3318153970074122218@mxe9fb.netcup.net>
X-NC-CID: b6BvDZ7FqB4qD3p5esLioKU8vIfygg94S8SAQXDId32U+oEC5Ok=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/
#regzbot title: usb: xhci: devices drop off the bus and might be dead
until reboot

#regzbot report:
https://lore.kernel.org/lkml/20261011.cachefiles-partial-zeros.pchmelar@innovatrics.com/
#regzbot title: cachefiles: reading a file whose cache object is only
partly filled returns wrong data

#regzbot report:
https://lore.kernel.org/stable/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=%2BiOe4ZGA@mail.gmail.com/
#regzbot fix: a154f7b9f197b3

#regzbot report:
https://lore.kernel.org/lkml/CAAuFnRTyva1_3tsF3vrMBL%2BTLS1YL4EgUPT2c3O9k7A9hWUMnA@mail.gmail.com/
#regzbot fix: 87db7795cbaa

#regzbot report:
https://lore.kernel.org/alsa-devel/DM6PR02MB5433F3C2A156335B6ED47756EA8E2@DM6PR02MB5433.namprd02.prod.outlook.com/
#regzbot fix: 4fa0c91c2c4c

#regzbot report:
https://lore.kernel.org/regressions/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de/
#regzbot fix: b5c4823cf3e49b

#regzbot report:
https://lore.kernel.org/lkml/CAC2BP3LyU5Qc80YTk7nq4vS96QKiufyAAdkNjVMr_DvcO=9K8w@mail.gmail.com/
#regzbot fix:  0a04c0cb8606

#regzbot report: https://lore.kernel.org/lkml/asXipik00P2Oa1Zo@kernel.org/
#regzbot resolve: low priority, as it is a combination of an opt-in
option (kho) and a hack (memmap=)

#regzbot report:
https://lore.kernel.org/all/179173732257.29426.7905170638383807320@pm.me/
#regzbot fix: i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode

#regzbot report:
https://lore.kernel.org/platform-driver-x86/CAO84%2BxJLVW_9_D9-8cwJYv_Vz%2BLK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com/
#regzbot fix: platform/x86: asus-wmi: fix screenpad power state detection


