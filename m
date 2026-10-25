Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792923560;
	b=pe9YAKurjsv5k5Wc46E5XR2dZzuxCOrmkVlPYw29bekJqRG+HiqZuXCtawfCtsjX+0D0
	 MSVyiyg+vlFKSz33y0687sjLDDW4ltXYnRGPiURtKXZYNnjOIGKuAn6tkQG75aByPUhUi
	 q0HLqeT82xqbULssndmC7xMl+4brGo9zVlbg/fCgwWDCeKYr5Xo1dBcUcz7eRATcDgS4b
	 AQsKHdEE2v21Gg0Qbskr6fpAoexu664xjFuYxEkhew0NyvVEsXs5KbYmQK8Yn1bx+f6mI
	 pW+MCEtwwjKZxwTpZ8rzgUYi51R3sAjleCFW0AAtQNYOiDgp4CNcCaApIs/+7mLpqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792923560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=Zy6lRXab7/gW3AZkjutUIXe1syDbgFfds86xNeMWFEg=;
	b=vos6FPtXJUnFTMA+4fcfo+YIWwdtsyfHDYAFDngYTpRaYCKuFlj+jEwnEbTWqXV18H1b
	 WGL1ihU36aFsLgtRh3H1/t0i1xAuHZcl3cFrXB8hzxOMJxj5P2x6gx7v8TyO6MMtC2juG
	 BCML8EStXhPWlVKLuY/7qwVC+t1sVnt5jmXCvmMkV8OGryQfUpJtkjDucaq7F9EghzkJw
	 MU6tgT7YGdkUKVYBJDms3q6DaPOy0wNXll91DOpTy84LYZ7SQZD7MWRVgA4yZOrEQC3TG
	 3WviIMs8io2mU/YbJpJmuTDRqXLMKhPW4toCqulisCHnV+QleJHDh2rAd1I5iNDl1vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=aO9B3rxq;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E09606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 10:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E09606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=aO9B3rxq
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jCCP80V0zz68L4
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792923452;
	bh=Zy6lRXab7/gW3AZkjutUIXe1syDbgFfds86xNeMWFEg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=aO9B3rxqoBqzhQ2ScCUfK0B2N/Ho/gWRH7bkpzO85isIilREwXPOpfVvESgY9/JVl
	 NdWxwE/k/X0f8yyGAg7Eo3Egb/R237bb7D2GT8wf0JT0h/mW6+n0icACIqbZvBdmqz
	 DyMQ7Jn9gq0TwYwjQ0Fsdpo3/lWbXsBtWceGlkrA8n5BS3dd6j3ma4O6DN3+58bj4b
	 gvSHQm1t2kK5XX07icsE8I6dxmVOzU9nLbPOUvmWVd3cpotD+VH9V4bC5ao3reJCIC
	 xccMooTgowE50ovBNKzFNww035H+JsvphZyl+cA9loF/Xz9YPPK2JsDOWZsLPmQ1Qv
	 vWAnP0gQCSnCw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jCCP76sXqz4xQX
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jCCP73yRJz8tkn
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:31 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EC4FB5FD40
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:22 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9169c22b-db49-4e46-aa53-ca57f0ccc038@leemhuis.info>
Date: Sun, 25 Oct 2026 11:17:22 +0100
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
X-PPP-Message-ID: 
 <179292344312.1436752.11774661732024653414@mxe9fb.netcup.net>
X-NC-CID: Gcr3WIwZnMqjo6wVBL3K89fBAFmuCRNW1nPdlTgDdslGiRgQ1gY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/
#regzbot dup:
https://lore.kernel.org/linux-usb/20261023132616.339833-1-diogochaves@me.com/

#regzbot report:
https://lore.kernel.org/stable/20261022162655.231431-1-fredericmariejoseph@protonmail.com/
#regzbot fix: ACPI: scan: Register platform devices for fixed event buttons


