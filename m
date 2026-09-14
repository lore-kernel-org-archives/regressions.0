Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20421A9F96
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403705; cv=none; b=Lc7jlCMIGaGcs1ocd1rBvMfFfL3y3woxXLsZMU9YJlk1HidjvEnJP+Ft96O0Hm8+Scz/N3iYIBaUyW/6WCeYBsbVYvkl9+2pEzP2XT3V1WDyYD9XEN4DOuRKFvhtCr57U94u/GxUlEoJGbSCZVDlIPQbGsy3qpVRwltpUVYvfc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403705; c=relaxed/simple;
	bh=r3J7BQEFQ3eOzTNmAVOcV8TOipv/C0lwvUd95L3EceA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=WWZQpMbPTq2kjbOSnXnd4uYCllukk18y7I4+EMe3WPh8WaYaUYXMxGVuNlgtQf78qp/isjD+bNHNhxMKA7RfPUhnUqzm0X2aJZXp0BAK9coHX58p9Bj0ZuhJi4JKCCTMV6Rh2jpKqrGDlgdJHq5xs5G55r6I/tF+pJeAJ9BG0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gTx7X6Pu; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gTx7X6Pu"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hk9WJ546nz8F2Z
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 18:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789403164;
	bh=r3J7BQEFQ3eOzTNmAVOcV8TOipv/C0lwvUd95L3EceA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gTx7X6PuGDpn/AmOVA9DvZxBWiu2jB20UU9WB8ZRlw+kewTMBXgtx+OrEanKRpvw5
	 xb5vB+txDPS8PriHdVkSFk2iTMR4qIfcP6J8IAMI8KMs/cF73+SlavGksoPIQmEbb0
	 Xy84fwW45NVjj5VBMpXCrr0DYTP7wBoQ+/R58og4S1rxh7TR48OO7BHqsL1aECjt7B
	 nFlwzL/tDfCe9yM/il0jGK9EgNx1ljzary7RJEMWXK6TsDw2w5FGYTaKt6cXYzxT9y
	 ovMVf/+p2SIusholIfk47N2r3ULz46S6PUoQiZ728DZ9BziB9zgeey6huSnOEfQTpc
	 HsnDypXEkL2+w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hk9WJ4Nxdz8CxN
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 18:26:04 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hk9WJ2s9Dz8svZ
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 18:26:04 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id ACB995FA35
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 18:26:03 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1ad7ac02-5c52-472c-9882-691444db7ffa@leemhuis.info>
Date: Mon, 14 Sep 2026 18:26:03 +0200
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
X-PPP-Message-ID: <178940316400.3619686.4425035603747315002@mxe9fb.netcup.net>
X-NC-CID: 3qz8Y8A4IOuytqPeyycWvQH5efyVg4pUOnSeEOitpID7b3WDpmE=

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/87a4plsg4w.wl-tiwai@suse.de/
#regzbot dup:
https://lore.kernel.org/all/20260909055846.16539-1-daniel@quora.org/
#regzbot fix: net: qrtr: resend HELLO on MHI resume

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5720
#regzbot introduced: 7e5760f084d0
#regzbot title: drm: amdgpu: HDMI 4K60 black screen, RGB chosen for a
YCbCr 4:2:0-only sink

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5663
#regzbot introduced: 3a6f6eeb3db51f0f8153636280edee00720c3986
#regzbot title: drm: amdgpu: visual artifacts after resume from sleep.
