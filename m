Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF347ACCE
	for <regressions@lists.linux.dev>; Thu, 17 Sep 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641375; cv=none; b=gUDGx5QXA8d3cBnM8DT3BfuLO/CIkUAeZdO+GIP4Lk3xP6GSrQDK2Ratu68X16yyC8P5whExRhpTiowZaRj9ZWT27+zjOFwwLMGLp+6QaHxeRjit2ky5MZL6/JHzwqyxdE0cZtLBsgO7bJavvozNUZOz0pNEwEeQa3QKMZUQfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641375; c=relaxed/simple;
	bh=e3PPDzDXrJFqWVsmmB4Bs+t2bSBuwTto5iYVJcuBrAU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=SR4+1DQ96LjwkuyEwMarrPXWos7vzjMczvO5skr9dldGOczZs9HupXVhG0OFpmSsh/xeYIvD9XxOEde1Us8PIkvy8qAag4yio9s0QsWwvUJ6DquSsk+HG3RysiQm4nZhB7OKvayaDBxn6S/wGUM/eKrYSmblgSDzstIOyU8eWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=k7d71Qci; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="k7d71Qci"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hlsYl4zHyz94FT
	for <regressions@lists.linux.dev>; Thu, 17 Sep 2026 12:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789641243;
	bh=e3PPDzDXrJFqWVsmmB4Bs+t2bSBuwTto5iYVJcuBrAU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=k7d71QciH8p8jEh16SAA1lGdCqIxX8cCPYEjpNg6urbZaplwTDs/hPjJsx2WKJjU1
	 +MTT3ApYXxbypL+Y8RoqmS5GA2gI8SfAoVgBu+/zn9/KrJM61vF0Rl+3G6mIfx09LW
	 pfhrud6743kROrJ2HHVaZQnhkQ9Spg/FYup1qNwk++dd6PsKf6hl6StBUKYy6owm3p
	 KHY3CGPYnDSBAg5gOUgl5cjjzR9WPZw47Ue/6B5tHx8IppuEMsxOtinsTgypay2mNh
	 R9ptVssguwj7IZpiEV0G5+AlS7QpGZ6XA6xfUEtwn7L1y4Q4oPb2Qb3yfu+yRXO1yX
	 2BHgcoe7jbU0A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hlsYl4Hrvz7wmF
	for <regressions@lists.linux.dev>; Thu, 17 Sep 2026 12:34:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hlsYl0syyz8tbq
	for <regressions@lists.linux.dev>; Thu, 17 Sep 2026 12:34:02 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F35485F995
	for <regressions@lists.linux.dev>; Thu, 17 Sep 2026 12:33:52 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <22880fd8-7f3e-4af0-8a4b-ead5481a17f2@leemhuis.info>
Date: Thu, 17 Sep 2026 12:33:51 +0200
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
 <178964123318.1014473.10711853720502858136@mxe9fb.netcup.net>
X-NC-CID: VQNV8So7PT1jyiuTfiss60YkvoQE/fkc/9Fo9FNojQT7NglxpWY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222016
#regzbot fix: Revert "scsi: core: Register sysfs attributes earlier"

#regzbot report:
https://lore.kernel.org/lkml/20260915235834.20559-1-surajjs@amazon.com/
#regzbot fix: bpftool: remove duplicate free_btf_vmlinux() definition

#regzbot report:
https://lore.kernel.org/all/1ce40451-0bdf-4091-a478-e82a1b9e1d13@kernel.org/
#regzbot introduced: f1de1fc5f632
#regzbot title: thunderbolt: host-reset patch regression
#regzbot dup:
https://lore.kernel.org/all/a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de/
