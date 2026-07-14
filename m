Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B222931C7
	for <regressions@lists.linux.dev>; Tue, 14 Jul 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056685; cv=none; b=sU0pP83x7X5X1banlyeYnaUqSlnBPJ3+eIldSTn4p91xS1y7I3EY92uu/6fmANTNbl2MQ+NJVxmedW2vDphUvfVyWqaU+m0LrVWv8fx+w8Q/W5mEjpSoHDr7pWDWzqdsYP0q1j81RHOjIUCQ8WqpH7rLrMHRmyWeoo/SgEGRR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056685; c=relaxed/simple;
	bh=luERvA9iI8fPAjMVjiaJApqsLEKTJNX8Mm8ek6s6Sos=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bLDWERkbnZpWrv1L3XMeZU4S2AGzSqyqjiOUY7xexMdmoBTPOvlFGZEnrt4jRWokkGKTSbSmTyyJJaXjTs0ebBopfTOYtFj2Szzv6D/sIeXPxMSMdV5F3If+seE37EjOJ4N84TlMGSH51ivchpuHtwij+3blKA+5dHlV+MKAPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AWFAlQE6; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AWFAlQE6"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h08GH6ftHz848J
	for <regressions@lists.linux.dev>; Tue, 14 Jul 2026 21:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784056679;
	bh=luERvA9iI8fPAjMVjiaJApqsLEKTJNX8Mm8ek6s6Sos=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AWFAlQE61b+9aqDAxuOb9qrWPFQc+OgSCRw/1QBHaj7HKLef0V2wP7BxTzmz21+mJ
	 IAaZcB95j7MUZTnAzOjJgfgmWXX6XCMWW9LnvMO+4Lu6xghJAtqaysFXPS8ZZDQL1+
	 OcPoQ5xxY/hJ8uyFQaw2PmYc5t/MhM6HfaJGcJb8VGnOc71cHE0OC98PUi6QgRik93
	 bdd1Y+yb98DDFbD6VEuGjHRtTJECxEK9d+rGDopR3UqL43FTRa8Ez1eBduxtlez9V4
	 mwehcmd/wVglvPvtlI6Tluw+zw2uIbBiIQgsTPGCQ+wkIC1KSuB6FeOcWkHVVv+6sv
	 zy4dvRtNMNaqA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h08GH5xv4z4xrR
	for <regressions@lists.linux.dev>; Tue, 14 Jul 2026 21:17:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h08GH09LRz8tZL
	for <regressions@lists.linux.dev>; Tue, 14 Jul 2026 21:17:58 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4BE61603C7
	for <regressions@lists.linux.dev>; Tue, 14 Jul 2026 21:17:58 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6f3b4be0-f44e-4488-8f04-df174797e0c6@leemhuis.info>
Date: Tue, 14 Jul 2026 21:17:57 +0200
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
 <178405667846.3952289.15056092467984722172@mxe9fb.netcup.net>
X-NC-CID: Ny8h8we3MOdrUiT11R9HIeVPQ58xJ4OIkBEWf7YlnuGe4uffBrA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-block/8a2b1abf-3c8a-4242-82c5-fba9943cf8f4@archlinux.org/
#regzbot fix: virtio-pmem: allocate flush bio from a driver-private bio_set

#regzbot report:
https://lore.kernel.org/all/20260713061443.32561-1-timur.kristof@gmail.com/
#regzbot introduced: 9851f29cb06c
#regzbot title: drm: amdgpu: huge perf regression on Bonaire
#regzbot fix: drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x6658
(R7 260X)

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5162
#regzbot introduced: v6.18..v6.19
#regzbot title: drm: amdgpu: NULL pointer dereference in
dce110_apply_single_controller_ctx_to_hw on Bonaire (R7 260X) with MST
#regzbot fix: drm/amd/display: dce100: skip non-DP stream encoders for
DP MST
#regzbot monitor:
https://lore.kernel.org/all/CAOidqQDq6khYfEjSz8=FHNBnR_nd17WYZDn7OdWOPG4BgPtTwQ@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/CAHC9VhQy4LOgQg0mk+s5sjHOzMe1sxPUgJ2W7vRT8ms4znZp+Q@mail.gmail.com/
#regzbot introduced: 01c2305795a3b6b1
#regzbot title: nfsd: nfs tests of selinux-testsuite fail

#regzbot report:
https://lore.kernel.org/all/20260712221709.7099-1-gvalkov@gmail.com/
#regzbot introduced: 7b6f16a25806
#regzbot title: wifi: mwifiex: system locks up for 60 seconds
#regzbot fix: wifi: mwifiex: fix freeze for 60 seconds caused by
request_firmware

#regzbot report:
https://lore.kernel.org/all/20260610053315.2249912-1-yingying.tang@oss.qualcomm.com/
#regzbot introduced: 11157e0910fd
#regzbot title: severely degraded MLO RX
throughput on WCN7850
#regzbot fix: wifi: ath12k: Fix low MLO RX throughput on WCN7850

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5457
#regzbot introduced: a1fc7bf6677eb5
#regzbot title: drm: amdgpu:  colourful/green tearing artifacts when
scrolling
#regzbot fix: drm/amd/display: check GRPH_FLIP status before sending event


