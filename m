Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1036923F
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489679; cv=none; b=KNP8+gjztXcBIgkFK4c39cXHMYxHFU5BEYnON0okcZl29AYFxDtB2VprKe511cg0S+lYlvqBWaiyhhDpgRh8ya483+k8pVcHCOj1bUinHl2vFWcxl43QVVb7B3L2lRcTla+9fczut6PsVZGEhQKhZKxT70pr8k0nSU85pOaHKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489679; c=relaxed/simple;
	bh=lGCRJGqMASljKrjw1DZyvHxIbP/ovoR5PeEqg1707CA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HmHFkdWFFij1Or/hrEAm8fRCw/+D7ujGOl+QD7/C8KDeJRcYL6pERC+r+OFW0EAVlGfJ+g+cOxas/R7wsVB89eyGhrKVEydxkY5uvzFO5pBvXzWTpQIPBFRNUQSMNB6rapg03bYJByjN8YCUEWjObXnp15B+Pj9Y9YKjoWq65M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ULhU9+ZI; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ULhU9+ZI"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hSYh82yjVz8k2H
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787489192;
	bh=lGCRJGqMASljKrjw1DZyvHxIbP/ovoR5PeEqg1707CA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ULhU9+ZIYDQinHNxElqVp/QMaRmo0lLoli+vzflTNn05AL5GRwMJEgMs84m/tAU56
	 xf8J1Y9GHUByaoPEjL8TnsryMSNShAqUw541qr8PN2E1GR91y5KTI2BcRRsrQ7jLco
	 nT1BUqSYaKnl8bhsZ7CFgH401bNIfEIYTS80GBHxKBdAcHPtF7FKjumcE+nzIBnUi0
	 b0dEQx7TCg9pstr+FvUfMEsr/c5atZclT11FfE+RlZF2DRu/E8Qd7HHtMOnxAc2L/A
	 6DVE+QbKwh5p0tvdPzyy4eyqpqOpmvyvyRLKKGuXHx/8i28uHWGLAd8W+biwJL1P+o
	 yoIT4miRnM1lg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hSYh82Gb0z8jhd
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 12:46:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hSYh73SHHz8tZr
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 14:46:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F0AD85FA13
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 14:46:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3e5ac791-9a3c-4779-b016-16fb9e3a5f91@leemhuis.info>
Date: Sun, 23 Aug 2026 14:46:30 +0200
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
 <178748919115.3162018.11864612170870435669@mxe9fb.netcup.net>
X-NC-CID: 08+LIMP2dQ2/ACJgsyIyXKa5TNkGaTDkPRMfXtkcxlJ0r2uNy88=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/07b2d390-f7a0-47e2-bc2c-eb0853acf52e@juch.cc/
#regzbot introduced: dc266f6c4e2628576ab33042b6b2a12480220026
#regzbot title: iommu/amd: early boot hang

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5658
#regzbot introduced: 91cf34bc5a55
#regzbot title: drm: amd: RX 550 boot crash Linux 7.2 on Ampere Altra
#regzbot fix: drm/amdgpu/gfx8: only apply compute quantums to KCQs

#regzbot report:
https://lore.kernel.org/all/20260817182302.146546-1-marex@nabladev.com/
#regzbot introduced: f576c75f95a5
#regzbot fixtle: usb: typec: mux: avoid duplicated mux switches


