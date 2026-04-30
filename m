Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1D4502A
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 05:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528745; cv=none; b=rFm5t3j8TZnjlVYeUbha2rLL7pOli3UVTnF18zUybvxykZfVg2AfNnj5z1T1XvxJMMRWGKr4tcRMZuZZktZQL4eMxZb2XCQnviJuN1apr2fPBoa5XpPOAL/Da72nALjA13M9QxOD3C/p/xa3tFiB899QWFLW2D4QT5FNF5VkrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528745; c=relaxed/simple;
	bh=UwVZ9Ug8Fb/rnoBnD0/x0xDsLzsdTmwdrfB1C81cPt8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Rb4xdhUmcz8E1Cwu0CBITJ1W+EQN3mQxQDc63tdZRiwswdlGg2hSLdw2VRy8atSDCv/uE96vFRD2ShSirDs7j6pWhBMtrlLuPsHybeCX3vVzsec8sjeX4Q7x28IxuAtzPTQFIDYbI7pbsIRYPOHI72NzylUhlfL50nr5fZJ08Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=W979M+Jr; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="W979M+Jr"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g5k4r6Ws9z42mY
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 07:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777528732;
	bh=UwVZ9Ug8Fb/rnoBnD0/x0xDsLzsdTmwdrfB1C81cPt8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=W979M+Jr7TRDg3Eaj5A6+SoLWRmYYdG2Viuy2vPO18nLteHuzNNDCUW+Igex6iwTO
	 BJiU1cpiDQ8G/IhBWfYqvFUtCMWHDS2kkEKDS3gyC2xyYsAnKNlimZWAoI7NbziX4n
	 poxsPCDK5gkHmR3aKDanaOoTk5U3jz5YlNrtr/BbxAWHP2IZma+FOboFy0K8YQ6svq
	 ebnDoZ1rCG+US8nHZJA2hkyO0OuniKk7knjp123tGp7IIQf8koLT9mvum+0LwBbyGs
	 dPHfvQ58ItKz5T8DIzSmF73xS8pSrdqwNTSvHxzVAkT7+7rndfx6+skM+tYvfEW05D
	 KiHcImjG9P77Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g5k4r5mfBz42Rx
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 07:58:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g5k4r3hzYz8sbs
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 07:58:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B0CBA6341C
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 07:58:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d2b521f2-3476-447c-a2cf-7ef8fb0883ef@leemhuis.info>
Date: Thu, 30 Apr 2026 07:58:46 +0200
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
 <177752873190.3509839.17030051511101990517@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B0CBA6341C
X-NC-CID: ARZvqjgtvEqHt3nvEf7uuHuVmsXA9yXu9BvFz1kHIFqG4T6G3O8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260429104938.1776671-1-igor.raits@gmail.com/
#regzbot introduced: dd862da61e91
#regzbot title: NFSv4: mkdir(2) on an NFSv4 mount occasional returns -EEXIST

#regzbot report: https://lore.kernel.org/all/afHNg2VX2jy9bW7y@piware.de/
#regzbot introduced: v6.9.13..v6.9.14
#regzbot title: systemd hangs in cgroup_drain_dying during cleanup

#regzbot report:
https://lore.kernel.org/all/14a87c99-785c-4b16-bfce-35ecbf053448@freenet.de/
#regzbot title: cpufreq/amd-pstate: cores stuck in low fixed frequency


