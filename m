Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F634388E
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989664; cv=none; b=PVZDtIyxlomo5tm72zx0vrd4nNyO2v9gLf5L13BWRoY0bn99nyTjlta85e7oKC2HmBLL0YADbY8hMqxeFStuXezCT+Uh4hqlm0KuO/sYStPLOt0EcVase3ksdT0nmL8F/7J71kowx9cjzKgW2Dl1D59EzkN8Oq1fKazq14MR+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989664; c=relaxed/simple;
	bh=fKEqPA46U7wItKyxqTW7C068MTDL7gWhH7Kml7P4M6A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=u83FfxZtKgnQpy/cHscRMj9WtAYDy4LkWOR5dUZVmx0XHlDr5I0Rsk8z95jL7ToahemRqH4Mp+1nxyT9LhOh0eEdbPv2mbSed5c5qDdHlO+jZp8auGEn4ZzMJzQTUAWZQsgB0RaEKtsvwxFZfV2hfK4l4BF/f6moNFbc8/6jiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QnLymR2k; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QnLymR2k"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4gZL1236G3z6F2T
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780989654;
	bh=fKEqPA46U7wItKyxqTW7C068MTDL7gWhH7Kml7P4M6A=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QnLymR2ku5gza1IYgzKeEg+pzzuJVgGldZShoyCs6MaHBWSCjs/jDz2rDY9eHYE2f
	 jdOFYXbIIcvFbWj41j3up5ybFd6TlJFIQK9TnOQ5r9BXwtt6nW3ASpkFHXDuIi48hq
	 a1/M1nVnmMH+54EkIh7YiVrdV87n6Cw/iAB6vmEEQ8HiLDJCYBDanBuw1+eSH9cpCZ
	 KrGYdGiSbvTKZx1Jf/DLTol6s5AYjE/MiCWrRLXE1vsnsyO0ipQA7E5WrwP7Dub9d7
	 EIIkXWI7B24HS9/FF19czTeIbo1Lus9OKqQk2ckReRkM2iGpWsu5EOJjj63rWbMX/d
	 Y9T7TcWuo1sBg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4gZL122LvNz4xQT
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:20:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gZL120czsz8sbF
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:20:53 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5B0BD60389
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:20:53 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4c8ecbe5-7036-41d2-b1d4-91970d9c565a@leemhuis.info>
Date: Tue, 9 Jun 2026 09:20:51 +0200
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
 <178098965353.2421841.17081490887366629105@mxe9fb.netcup.net>
X-NC-CID: 95vUGQ/W4XLQQ1wtp5KFCI1y75XJnNLzaWDo99uKfUfqhJu9Qn0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-nfs/aiHlPmeZq3WgMwoJ@kernel.org/
#regzbot fix: svcrdma: Cap Read sink allocations at PAGE_ALLOC_COSTLY_ORDER
#regzbot monitor:
https://lore.kernel.org/all/20260606035722.83175-1-cel@kernel.org/

#regzbot report:
https://lore.kernel.org/stable/2bfa2f1b-567a-429b-aee2-a8dcf7efd5aa@pm.me/
#regzbot fix: drm/amdkfd: Use last + 1 of vm range to check 2MB huge
page alignment

#regzbot report:
https://lore.kernel.org/all/99caeafd-edf5-44a4-8742-4eada5d0f5d1@yeah.net/
#regzbot introduced: 165573e41f2f66ef98940cf65f838b2cb575d9d1
#regzbot title: tcp: secure_seq: significant TCP performance regression
(QPS drop)
