Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B174AA00E
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365064; cv=none; b=EuJ9k6iwHKDc3LDTtrSfi7cMe3Qp0OMzS5gU9/Fa7tFAd4zb5ZrFBPEIODK0Sl6bJS9HgxchUNwgEtpROITYFcG5uiunJKxpvZyTtAQ5cZNBcvGyMLcbGX6qNqDLJCFoRNRJIaDS932lSJrRA94UxtmUgLNv+RvL4kON2RvnCcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365064; c=relaxed/simple;
	bh=NZGV9ZfqV7fsd6CkWDVE/HT/RVTKRBiYOFCSJyx/NX8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=mE3qK//BQzE2aKUx//f9WDUC9zVCQ6ahJs7ESGweaw6TAnBT/sbcgjeoXZJY0K+Zv3+OifzelnFy+TQiJRuUF67/aIaOMVpIVNhGusLUvd/sjEHrDAf2j04H8Hx/p0u3+31Sdg+kPP2EGGRnx/9bJiwD85JeIHirf4V/P8Z13T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GvoSEpgZ; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GvoSEpgZ"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hZnRQ5mCLz4LFn
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 17:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788364626;
	bh=NZGV9ZfqV7fsd6CkWDVE/HT/RVTKRBiYOFCSJyx/NX8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=GvoSEpgZNpdt54cjsJOhXcg4F4NVlf6q3Hb/KE1DD0O4lfrBvzU8QCkMMtGx6DxAu
	 0AvPum/EAdh1E3mTpHAyEL9+5mkH8TCFrpZ1tSZ6hKT4TDugUeSX2Ammra0H35Drra
	 1tkyxhUMBvx3Ib0Q0vpqW7OV1Qd9wViOmKzxlV+3mkHyyg6TBwZc6j2qwwwFKn6Tx4
	 v6c3EFJjVwKCTlLdWbRjo71xjjDQWK1ohMc6a4q/V31sLhKoEZn0wr8YnpGR+Def0E
	 mEZO2qax7ROjiqltQRCClZMxnRhHPUIPug7isXEwc8bBe04VQPgUXA96XM2d+7zy0K
	 z4OTdnZaAEUWQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hZnRQ54h2z81W4
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 17:57:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hZnRQ0Wjdz8sfv
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 17:57:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7ADA55FADD
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 17:57:05 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <aa4592f3-4922-4de0-aa94-ed8694336500@leemhuis.info>
Date: Wed, 2 Sep 2026 17:57:05 +0200
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
X-PPP-Message-ID: <178836462567.758853.16307784672739952150@mxe9fb.netcup.net>
X-NC-CID: JXKeupIj1vYboTKryNDTLjIsZUfeiXcpxSJNvGh60rC82eFpsMA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5723
#regzbot introduced: 3c108046e1d6
#regzbot title: drm: amd: internal display brightness reduced on Linux
7.2 with Ryzen 7 5700U on Lenovo IdeaPad 5 14ALC05
#regzbot monitor:
https://lore.kernel.org/all/20260901140155.19129-1-aarav.240604@gmail.com/

#regzbot report:
#regzbot introduced: 1448c2d2ca5c
#regzbot title: platform/x86: x86-android-tablets: lookups with Arizona
and Crystal Cove GPIO
#regzbot fix: platform/x86: x86-android-tablets: fix
gpio_secondary_fwnode_init() not working

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5735
#regzbot introduced: 8277a12d0d60
#regzbot title: dma-pool: display (amdgpu) stays dark
#regzbot dup:
https://lore.kernel.org/all/CANB4YXS=Nf-co3t8eMHtqrW4sn=1BDcP6o=EoTrgZm0WYMYTyw@mail.gmail.com/

