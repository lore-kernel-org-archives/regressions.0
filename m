Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442459;
	b=Lm0GVjmqGhehHV/CHkw+Cd6z4G+UmiRQl4J8w9IhULWSmTi1NeotTogWyrzCBAsdxqKp
	 UIHlo0t/nVmliNsW+7HkJhELFuIjiA3HcPwjOAoEVYZiObaE4XvWRjub1+gfTveTjYUyv
	 hZ5lboctTd07s7VXjrZuYype9zTkfajEpfNA4nmvdkjHvGcxFQBcIbvUHaQ1Bjhw2Ywoz
	 PSOJJPHyxDNRdv3oQqc0SWasE9OB1OSjKNLtbDuc2nv1YKpSQQ8ET6tfyAUlHNrSPDtWe
	 TUirUiyhH28heELNFuBKCz7SZK1XGqHvA4gHHeKnHkIj1iJP5Rj/uBfjfH/TvlvF/vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=6ICCCCBXdsQ0LtrZ91JBPEjGTL84Q2WOuAzW21c0Zdo=;
	b=0V2EgNr0XKCLyO0r5qNt6Jbh87gCkYBTd5ikc0TKH2qF1ZuD1Dooc1qnlrHDv9/j1B7t
	 C8+uMvpoLV0r5tyHC4onBtpSbcVsOJy4duGSxoBt6K/qMR0NMsYyGHHnodt1EhHbYNm1L
	 +qSRrnY4WdBAqufi0KfPBS9HSpFxvRLRCi9wr6m7BnRQy4WP4MJn+o7hRBJ6pW2Efr4y0
	 YnXMBvLc4Wwh5ForOKi4HFsEDrHkA7eoxXqjJalpXKzIVxa0gSh7Tq2OCxJWSc8y5EZUt
	 /bMoa+NvaGTqM09jbXSapuqcDOoxeXsYbYF7/nBQ1/k1bL7tkplD3gWY8kwIzNaCwmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="eJIqC/ix";
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85007606A31A
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85007606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eJIqC/ix
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jY6y05KmZz47wr
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 14:59:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795442376;
	bh=6ICCCCBXdsQ0LtrZ91JBPEjGTL84Q2WOuAzW21c0Zdo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=eJIqC/ixSqEFWbRgj611gcK/YhbaVk9xE9KDJgzP/Z6ssaX5eTWXkqsLgviv/h3P6
	 7CS58FjeYa8Yx2LY1KUKOIke7X2D/zRfMlumDpqf+yKeyi2uUkTircwLHoce7009+0
	 1fvfI/0Aj31LByVf1BPglofvcpnrCMhOj3eRbhhAWY3wgV81OxrLUzAYM2g+rOLCi0
	 33iEAdonu9vegNCKghNguBeqjTpYauRL0nizOW00VyJyMV3kJ8aZXTAzujFQ/zBmGw
	 kaGplt8GQXdnrpguQKSBDQscQ4DeLLU+xgTovcCNSvLh0rAaGhX/HpeH0FPYzOtKBv
	 mo99n/5wEnVgA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jY6xx5qb4z47MY
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 14:59:33 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jY6xy5Jn5z8svZ
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 14:59:34 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 107585F837
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 14:59:26 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ebba89b4-cbe7-414e-adb9-c86e75dff665@leemhuis.info>
Date: Mon, 23 Nov 2026 14:59:25 +0100
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
X-PPP-Message-ID: <179544236625.2163124.3098548742045509170@mxe9fb.netcup.net>
X-NC-CID: VY03CULxVfI3EkRSSXwXojL897/WqHy+ZSse/iTmI36IY2GxFgs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/avxKOmxCBLF%2B7qdT@jpc00229873/
#regzbot fix: media: uvcvideo: Undup use uvc_endpoint_max_bpi() code

#regzbot report:
https://lore.kernel.org/lkml/20261030114705.3159093-1-jjc@jclark.com/
#regzbot fix: usb: misc: onboard_usb_dev: don't defer probing after the
device is configured
#regzbot monitor:
https://lore.kernel.org/lkml/cover.1794018128.git.jjc@jclark.com/

#regzbot report:
https://lore.kernel.org/lkml/CAK8Z4SCRhWcbL5i6NgwiLWDCX48YbMfcJ_%2BnFrGxKMZiN1vG3w@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/stable/ec1ffcbb-1625-4925-ae6b-f2b04dca1e1a@gmail.com/
#regzbot fix: media: em28xx: fix NULL pointer dereference on disconnect
of dual-TS devices

#regzbot report:
https://lore.kernel.org/regressions/CABWzDro3C8e5%2B7ajDRJ%2BiabbkROHLYSbWEKUpJ_t1ZT6DdTSuw@mail.gmail.com/
#regzbot fix: d1a1f361e08311f6d

#regzbot report:
https://lore.kernel.org/lkml/20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net/
#regzbot fix: phy: qcom: qmp-pcie: Skip PHY reset if already up

#regzbot report:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=685dc94d51ca427c0ae5983491916b1279617047
#regzbot fix: wifi: rtw89: coex: Disable pre-AGC for out-of-band links
