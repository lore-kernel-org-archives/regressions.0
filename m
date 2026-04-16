Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8820D3845BD
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333097; cv=none; b=M9R3YsVHhzFkXQnuYX/Y1xSFhYbRPSHcduavQiU6N2Xod2DuB0iN6uWhLzP9WzzziK86GoesYJoSL3WZRJEsXEPPh1sJLaBAEyrSKaWiuAX/BCzFIp3TU+VIaJLetMmm129cKxQb10YLu1r34AjmkmMAvMHoH5c+JUhWLQwgnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333097; c=relaxed/simple;
	bh=UKTFydACGZldZ+ZJfR8Xtm6CtXNEfNqNbZqfYc3mMws=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ACtVhbkmaeg3l7rNHc/vQPTeLD0hkO/KINvRhGu5Gi+EPCNenwQO0ocLT292tSS5ale/Am5qZ+uY+zVCzYXYE5VudRp/6BQ9hKTWFZStCNC/faglgWGNdl6j7XrulVanBwca0LS+j8XADpC6OMCFgUwuRJX5UfvLbJYuuhi32Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=lAZZgy4A; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="lAZZgy4A"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fxCvf70GWz72GF
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 11:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776333087;
	bh=UKTFydACGZldZ+ZJfR8Xtm6CtXNEfNqNbZqfYc3mMws=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=lAZZgy4AVMndYMDKLjFhddObhPanxpnJS3exf3qub7SshQhR1QmLsqopyZNy/qY0T
	 0EtgfXrVlWNcgKPrsQiRWNNW5Nk88Gg4LkegLm/0k0vBceMjfTlCriKkh8FQtiyQR7
	 fNAKM2pL7DI5az3Z81AxRZM4wphyIneIablwE38x3oh9wH+BkczTo0WdRBYKdwUUcN
	 ASzN/6Pc+wl3qUgApJZ76SILqE4dIiYLAUvC5oZSKH+sFb/xZUW7C5LpGhP8Ct4kbc
	 Fgc8R4rpUITVkEUIt5EooRno5W+paGu9QXLaYz8yft3kTiAEvqA0Ko+htvsBlURP59
	 2SBOjAajuAiHg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fxCvf6JCZz7263
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 11:51:26 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fxCvf4R9Tz8sZw
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 11:51:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DBE686179C
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 11:51:25 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ff71e277-cece-4202-bd34-5636329e30b7@leemhuis.info>
Date: Thu, 16 Apr 2026 11:51:24 +0200
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
X-PPP-Message-ID: <177633308606.3672083.5495317593530421756@mxe9fb.netcup.net>
X-NC-CID: rWXog9Vi2bVcjyJVA+X0lVXZiFRSunhP5puoCOgaomEq3uos9tw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/73ab5267-57b8-4394-9c10-4ee3bf92e444@leemhuis.info/
#regzbot introduced: a664bf3d603
#regzbot title: crypto: oopses and some kernel panics
#regzbot from: Daniel Pouzzner <douzzer@mega.nu>
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221332

#regzbot report:
https://lore.kernel.org/lkml/20260219151157.2549198-1-max.oss.09@gmail.com/
#regzbot fix: bccaf98c1077f2

#regzbot report:
https://lore.kernel.org/all/68d1e9ac-2780-4be3-8ee3-0788062dd3a4@gmail.com/
#regzbot introduced: d6e152d905bdb1f32f9d99775e2f453350399a6a
#regzbot title: clockevents: periodic lockups

#regzbot report:
https://lore.kernel.org/all/b397c5b34ed7484aad6e0acf7e1319c6@stwm.de/
#regzbot introduced: e02494114ebf
#regzbot title: crypto: ipsec broken

#regzbot report: https://lore.kernel.org/all/7370736.9J7NaK4W3v@timur-max/
#regzbot introduced: e56e3cff2a1bb2
#regzbot title: drm: amd: analog connector support broken
