Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516324;
	b=K6/0e6YS6D5mDnUUl46Lim+c6eBz9Rz7KXEmqRKpSScnjgV7gV7aAsXzHOFPuVdbzSmR
	 q4lxc/abPyiF8SsNIZ5UrB733f3xTJEU47TueEbOr5N7uZe4jeG+F7lmUHRCi4yPOlzpJ
	 Ealrcq3Kx4LgbmbQV2LHXif6D0DcQSRFlhuSekQkBNM2SeVNohpK4iZn497MtMDBHG/jR
	 8IKznqtN/DZxp952H57zNrUMItv7YxvtmbDy7gon3K4JMYk4UE/wDzb6KzszG3NF07Mfs
	 H4Hz/mV4uTJny9H056gy7F4V5DKVdvAoZup83cTUfCzNax2cjNP071hbWbaPMbkYsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=4U2q9sr9eOMmxFV1jltMvp6WbNAnPX8wn+lPsh1B2O0=;
	b=z0zIICFE21NTDYXLQgE8gLjDW/W3UmvcqSCmhE4hvCRrNGTCAJDCeXH3UEQNcXd81ufb
	 m98sLCS/KEYNniPvD/PZE3nOC2JDiMlsad0DbIWCCupHIE3i9F1HbA2ba6k9ycXxK4MpT
	 +pJe5uv1DUe7bKnAjWdtY2E7dbZAIXSrclcw7Hijve8mirx4SMBf0euVmgbOyhf+3hxtn
	 vN+mMa7RKJHbWVTM8T55nwyDna57UBOs+mfwfTy2q4mj4z0wdRu7+kd0YKTPwLcio6pmC
	 YSiGGUVX6fo3Q4AMnsCBe0b9hKFKXaE0lTIjCvpU0W+iFtxGW7Zl7ZJh8nH9x0tKj6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="DMlX/sKN";
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142260A2633
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B142260A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=DMlX/sKN
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4j8Jqc3wgYz6BYy
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 19:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792516316;
	bh=4U2q9sr9eOMmxFV1jltMvp6WbNAnPX8wn+lPsh1B2O0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=DMlX/sKNRamhKCdtOIIrHISbdo9uM/SfPEOFvbyYXAYLgg2fmKBZELVB9+uZwOFyw
	 agq2LIfsLZqMZXomUuThLBiGSTrYZiw7iRxAFLBRdeLk+IBla5zp9AjU75WTzHlsyS
	 9tNt+AnCIhTDi14N+rBblCqaxyuCU1EFLGOSE+M9eu3hRtgQgBdz5ThbouXKkEGyvF
	 1Uc5NLB2ZzB6AnY+w/84YRmCxqfmpyeeIs1pOmjHI4pBU89T4sbQljfsy4yMFUfF5A
	 oiy3P6Aa21Jf30xgJvMqTh/Ewq/cdk0IxJoy9mrYd6T1e4AjM3WF0FeUK7M8vfqZxz
	 2oWhOkOUONUtg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4j8Jqc3Bggz4xtp
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 19:11:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j8Jqb70vNz8th7
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 19:11:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2BF005FA56
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 19:11:43 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ef58758a-e9f4-4d54-9b35-d9f974cd0f52@leemhuis.info>
Date: Tue, 20 Oct 2026 19:11:41 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: <179251630337.1742427.3242952166518723470@mxe9fb.netcup.net>
X-NC-CID: 1LAiTHO8RXwrqk3e4kIgbL7JRkd82TjdnhPGefwFeG/Ks+8tEes=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot dup:
https://lore.kernel.org/regressions/179243994891.157792.7812879229965993143@kernelci.org/
#regzbot resolve: fixed, was a mishap in a merge conflict resolution or
something like that

#regzbot report:
https://lore.kernel.org/regressions/179243994625.157792.5761151975328981641@kernelci.org/
#regzbot dup:
https://lore.kernel.org/regressions/179243994891.157792.7812879229965993143@kernelci.org/

#regzbot report:
https://lore.kernel.org/all/29f6c901-5209-4681-81cc-ff768cd405f4@maich.gr/
#regzbot title: lpfc: boot hang due to use-after-free of mboxq in
lpfc_sli4_driver_resource_setup() backport
#regzbot fix: scsi: lpfc: Fix use-after-free of mboxq in
lpfc_sli4_driver_resource_setup()

#regzbot report:
https://lore.kernel.org/all/k5Jaxe-8dtnRDkZ9ahH_w3C6hqb0IATbibwhxy4gAuOS5rV1HKzb4hzzv9XO9reX24UPoyKP30ZfRI6EVa6Jl0A49Q8Z5o7VKfgFyaq1x7M%3D@proton.me/
#regzbot fix: ASoC: cs35l56: Add DAI for SDCA OT25 stream


