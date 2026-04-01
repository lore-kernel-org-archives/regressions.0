Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAF3426D11
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050168; cv=none; b=oAjxQEBPKRRnozI1J3euekrdVtzxLhXEYbcuA456HDy9EPsGGpmPlO+iVwM62K00Tx826Q07EvCWrYswHPcWF9oeuJ7TDKErZuarBO6TACHJiB4lxflHcEBsvofnKSr5i7h7nhzotGAyXs6ZP56cbSUPGBjq6SU4LPV/fALvdJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050168; c=relaxed/simple;
	bh=A1deYmY06b41iIK6/yB6rrD7Ljoy9n94gqW3QUZkNs4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=u5fjpTsiH2mZ1NA9UL6hSrpdwUwdifcqKIGBene+SvMctb8V9R8DaCWiqXLe8na99cAsdl/NDiYfHCyJGaMPPAR/bhX+FYowaXIEXP1Y8cLyqFNV8oST2aRA0mLT9stvPjvTDDJ+6E1C43NkgMPYY14H1FZ29xKvd2c2KcPe2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OkdaWWXK; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OkdaWWXK"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fm5S40G3Lz8B0c
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 15:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775050164;
	bh=A1deYmY06b41iIK6/yB6rrD7Ljoy9n94gqW3QUZkNs4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=OkdaWWXKWbQ3F1CoII0smBJQXk42XCh5vePTxBeG+mW6AEvGlcLxsEesFoa7aJ1JY
	 /egZvGWsj6JXGucyuyDbCxkvA1bg0bmUxfJsNbjilqbyhlDIc5TZ2LLqPOdSVqkwDR
	 yPv5Wy6mweIJvUMF6mEU+cxS1XwT3QNL24qx7eJJNDHAQlmUzj5mUyFJJp90DaLVSI
	 6IZsDu+NdzklYCvy/Pw4eiq1iuTNs67e6m1cZImJdpVXzDeKjFKf7t2pocWNfKeaaN
	 QA0Xkrty57AJCGmCQBL8wyf8oPqDk0MrbHZU3CanVFRDLz1SOIbFNP50yCh6Mc+xNZ
	 VazevNs3uYW1Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fm5S36hljz8B04
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 15:29:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fm5S34qCJz8sgW
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 15:29:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 26583632AE
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 15:29:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6a16dbdc-3106-4646-816c-9648b68fd29e@leemhuis.info>
Date: Wed, 1 Apr 2026 15:29:22 +0200
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
X-PPP-Message-ID: <177505016333.1937200.1956542922586979443@mxe9fb.netcup.net>
X-NC-CID: UcvMdVNEeu+KLX68VWqer/rhAXmTo1/p37uOL2YA/YD1miWQEdQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/a5f23340-2b84-4734-be11-f5a97c188195@app.fastmail.com/
#regzbot title: pci: Thunderbolt eGPU bracket fails since new bridge
window alignment calculation code

#regzbot report:
https://lore.kernel.org/all/CAF1bhLVYLZvD=j2XyuxXDKD-NWNJAwDnpVN+UYeQW-HbzNRn1A@mail.gmail.com/
#regzbot introduced: v6.18..v6.19
#regzbot title: btrfs: problem mounting 4-drive RAID1 fs after replace
was interrupted by kernel crash

#regzbot report:
https://lore.kernel.org/linuxppc-dev/ms06y93w.ritesh.list@gmail.com/
#regzbot fix: powerpc/powernv/iommu: iommu incorrectly bypass DMA APIs
#regzbot monitor:
https://lore.kernel.org/all/20260331223022.47488-1-gbatra@linux.ibm.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5021
#regzbot fix: 3fc4648b53b7e3

#regzbot report:
https://lore.kernel.org/lkml/20260315232500.251088-1-CFSworks@gmail.com/
#regzbot title: ceph: writeback can lead to a panic

#regzbot report:
https://lore.kernel.org/lkml/39ef5c99-ba8e-40c1-bf93-359db7297d55@kernel.org/
#regzbot from: Max Krummenacher <max.krummenacher@toradex.com>
#regzbot dup:
https://lore.kernel.org/lkml/20260219151157.2549198-1-max.oss.09@gmail.com/
#regzbot title: ARM: dts: imx: Colibri iMX6ULL and Colibri iMX7 no
longer boot

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5052
#regzbot introduced: b82f0759346617b2
#regzbot title: drm/amdgpu: no audio anymore
#regzbot fix: drm/amd/display: Wire up dcn10_dio_construct() for all
pre-DCN401 generations
#regzbot monitor:
https://lore.kernel.org/all/20260323211343.263909-1-sunlightlinux@gmail.com/

