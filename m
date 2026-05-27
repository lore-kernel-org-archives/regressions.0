Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DF93955C8
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872875; cv=none; b=n5LcBX1JEXX31XzjfsAIC6FcahsEk0ZmTx5vaFcCuNcWnI0K9JfslddN1XKvKRRlLoC2y5EVVArLDFNiPRPEVCxP9x072R8ShltS1BKrBO8nLcaR1m4M4/K8g27q8+hEAP/OHP7IW0aoDCuFukQ90afOS1ZAAwQU8vAdDLb0KOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872875; c=relaxed/simple;
	bh=Qy/NyP35pm8aJXSthO1LC25NDuIPo9FG0mSph2Lm2jQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Qc8X5Yu/z+ru6Rw7DQx4GKEK9FmE/qyxAKqtStmtQEp9lgar3+thitAvu27LFukZ7hFYehr0tTn8zg+OqpJRG7S4v8hZ6RpHB42mRnmYs05G5jTdRNIsKdSf6TSqHXVK0GLhbpXA0kWd9NM9nX+oj/K2FJg4uuRPcVNGQljEjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gy4Bh8oq; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gy4Bh8oq"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gQNzn4KP8z897B
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 11:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779872837;
	bh=Qy/NyP35pm8aJXSthO1LC25NDuIPo9FG0mSph2Lm2jQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gy4Bh8oqdnJMsau506zCBYC62tGbFDlHIGqWkTSx58tSmAPHTy2vfKznSt7ktePp3
	 Zr4j+M9h/VD7ZfdqtN2tj0gGqJwYDkhcko/vtsnm0Q17zJavSngQdF6ZJ7gkyfqN6N
	 br1hSQ1EYSOuHOP8ydyZhyfLp/xMx0Wlwp2ouqTTIhKXetbbjz+5qf2xipE/8A6l4J
	 qqE/5JagouxEDqJ1BEq1Cyf4x9GBFbiz/zzVxUIUewHef+z/rNhGT0+AFlu366SeRN
	 9P/m5Nkm1P90rMCvFgBIgGvOFTMIuMtxPamr42yb9+CLu4K0sP6KXHNXI35CBh19vA
	 4teA8Y4d1PFwg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gQNzn3dKkz4yVN
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 11:07:17 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gQNzn29MVz8sch
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 11:07:17 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 250F561812
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 11:07:16 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <816b1f72-8c00-4a76-82da-4d54be61f784@leemhuis.info>
Date: Wed, 27 May 2026 11:07:15 +0200
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
X-PPP-Message-ID: <177987283633.9635.3045080976628404278@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 250F561812
X-NC-CID: 2+NHLWFQtXDiOSM2e8iasIIIzi+/pkfCFn8bwcTyTmNaGobTq1k=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260525101635.26090-1-ncopa@alpinelinux.org/
#regzbot fix: driver core: generalize driver_override in struct device

#regzbot report: https://lore.kernel.org/lkml/agvqqMt9x0df-WXS@google.com/
#regzbot introduced: 7616f006db07
#regzbot fix: usb: typec: ucsi: Don't update power_supply on power role
change if not connected

#regzbot report:
https://lore.kernel.org/all/20260521135310.GC977@cmadams.net/
#regzbot introduced: cb3de96eea66
#regzbot title: ipv6: SSH session gets dropped, usually several times,
in the first hour or so

#regzbot report:
https://lore.kernel.org/lkml/8cf80f450085ac17164e8fa1391e9635@linux.ibm.com/
#regzbot resolve: inconclusive: looks like this is not worth tracking

#regzbot report:
https://lore.kernel.org/lkml/caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert%2Brenesas@glider.be/
#regzbot resolve: inconclusive: borderline regression, tricky, seems
Geert can live with the reply

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5272
#regzbot fix: drm/amd/display: Write REFCLK to 48MHz on DCN21
#regzbot monitor:
https://lore.kernel.org/all/20260514155348.2114429-3-IVAN.LIPSKI@amd.com/

#regzbot report:
https://lore.kernel.org/regressions/afHNg2VX2jy9bW7y@piware.de/
#regzbot introduced: 1b164b876c36
#regzbot fix: 93618edf753838a727dbff63c7c291dee22d656b

#regzbot report:
https://lore.kernel.org/lkml/773ba972-433b-44b4-89d2-295bd9f5de38@huawei.com/
#regzbot fix: scsi: sas_user_scan: use scan_start if available
#regzbot monitor:
https://lore.kernel.org/all/20260513174236.430465-1-mwilck@suse.com/

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16209
#regzbot introduced: ba91b9eecb4779
#regzbot title: drm: i915: Initial screen output completely garbled on
UHD Graphics 605

