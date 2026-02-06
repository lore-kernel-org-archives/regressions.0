Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE172FC876
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376639; cv=none; b=ZzD2JBaF0G7AykXygsIbWf2XnPx+YxJkUX52IYAkyyYmrKpzEU2IjrrjcKKmKMVd/2SBBOmnmEfDygK9a1hgm5cVF76vmNGtFQgos+CQboqXzo8kFMZm+9pfLrWpZh1oWmUse6RYAaUCT0i1wh6c9R6XsfhA1uCruxF6BuZUHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376639; c=relaxed/simple;
	bh=QMELl+UvsKNLFL3Ud8/cNQpUHJUvC+0STtpi77kPimk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfgHJ2OP1WUAOYgulRM2mBt+pcpHTJ5tVwTqfGSBaCAbn/ldVfWirOR4EHJ95MzAD8adV6bk9wPGNprC17EAcsTlMa/V0FUw/UZmMP1UIfKg64dSQcGIEI3TUwFgh0yKnQbqHXhBD/jObCHJLUHccx3VdQIR2YV/6Ln4lZ/uq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AJF4XAaS; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AJF4XAaS"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4f6rs43kd3z65Yh;
	Fri,  6 Feb 2026 12:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770376040;
	bh=QMELl+UvsKNLFL3Ud8/cNQpUHJUvC+0STtpi77kPimk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AJF4XAaSvYLFEYjnvKfPKaJhlFHIDYM7Jy9R75ah0molaL/KnEKDHtFmRXtZMZgJn
	 UCTBgI6hw4EHF2DQ5/cuNS15H8n3bWg4v2iZUOUS9+eXyX5sfj9b3Ir+ZtKFq08oLr
	 RK8WTOCBoqUQ8Kdiko7/s9RUTclr1x3t3M7x1y3SyIzkUEfolIlQQ/zRl5TSth3DnX
	 VmFNxMjJ7uafjEj91z2jNOC6cJ3YoQj5tt3dAYa/TP44N33rfzX7LADt0hjsG/20HH
	 KZKA6X5fWoL5/MOf0fWX5LqnsR58bnbF6JKfsIn0WkbrnOZGqyPcgtfQ3Z8CGJYtJW
	 9OAp3s94nxGnw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4f6rs432fPz4yMB;
	Fri,  6 Feb 2026 12:07:20 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4f6rs35g3nz8svH;
	Fri,  6 Feb 2026 12:07:19 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C93326733C;
	Fri,  6 Feb 2026 12:07:18 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a887162f-0822-44d0-8eeb-c38171603760@leemhuis.info>
Date: Fri, 6 Feb 2026 12:07:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lock contention: x86/kvm: Potential deadlock between
 shrinker_rwsem and kvm_lock under high VM load
To: Zhangjiaji <zhangjiaji1@huawei.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "huyu (D)" <huyu70@h-partners.com>,
 "Wangqinxiao (Tom)" <wangqinxiao@huawei.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Liumengqiu <liumengqiu1@huawei.com>
References: <505c34d2cef84117b7e995c211efc393@huawei.com>
 <eecb1d2d1f7a44ef8c757138cb1b3755@huawei.com>
 <a5ebab14f0444f8da03a6fa4d1978793@huawei.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <a5ebab14f0444f8da03a6fa4d1978793@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177037603912.1314732.16995319748735008736@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C93326733C
X-NC-CID: vZFk1+DZj5IoL/BsS8w3vRTAdUyQZXasi91NvO3JWGNVtGTeIX0=

On 2/2/26 02:19, Zhangjiaji wrote:
> 
> I'm hitting a lock contention / long stall issue on an x86 KVM host
> under heavy VM load, and I'd like to ask for advice on the proper
> fix direction.

Thx for the report. You CCed the stable and the regressions list, which
leads to a few important questions:

* Is mainline affected as well?
* What was the last version where things where working?
* Could you bisect? https://docs.kernel.org/admin-guide/bug-bisect.html

Ciao, Thorsten

> Problem summary When the host is under heavy VM pressure and a cache
> drop is triggered, the reclaim path can hold shrinker_rwsem for a
> long time due to lock contention on kvm_lock inside the KVM/MMU
> shrinker, which then blocks systemd in a way that also holds
> cgroup_mutex, causing cascading issues (e.g., journald log gaps).
> 
> Observed lock chain / flow
>> From what I see:
> 
> 1. drop_caches leads to slab reclaim and enters shrink_slab() 2.
> shrink_slab() takes shrinker_rwsem 3. It then enters
> do_shrink_slab() 4. During slab shrinking, the KVM/MMU shrinker
> callback is invoked (e.g mmu_shrink_scan()) to reclaim KVM-related
> caches 5. mmu_shrink_scan() attempts to take kvm_lock 6. Under heavy
> VM load, kvm_lock is highly contended, so the shrinker callback
> stalls and shrinker_rwsem remains held for an extended time
> 
> In parallel:
> 
> 7. systemd holds cgroup_mutex (e.g. during cgroup operations) and
> then tries to acquire shrinker_rwsem 8. Because shrinker_rwsem is
> still held by the drop_caches reclaim path, systemd blocks while
> still holding cgroup_mutex 9. Other components (e.g. systemd-
> journald) needing cgroup_mutex become blocked, leading to issues
> such as logging stalls/gaps
> 
> Impact - Long stalls in systemd-controlled cgroup operations -
> systemd-journald (and possibly others) blocked on cgroup_mutex,
> causing log dropouts / discontinuities - Overall system
> responsiveness degradation during the cache-drop operation
> 
> Questions 1. Is it expected/acceptable for a shrinker callback (KVM/
> MMU shrinker) to contend on a highly contended lock like kvm_lock
> while shrinker_rwsem is held? 2. Are there known recommendations to
> avoid holding shrinker_rwsem across potentially blocking/contended
> shrinker callbacks? 3. Would the preferred fix be on the KVM
> shrinker side (e.g. using mutex_trylock()/spin_trylock() semantics
> and returning SHRINK_STOP/-EAGAIN style behavior when contended), or
> on the shrink_slab/shrinker infrastructure side? 4. Alternatively,
> is there any known guidance for systemd/cgroup codepaths to avoid
> waiting on shrinker_rwsem while holding cgroup_mutex (to avoid lock
> chaining)?
> 
> Please let me know what the most useful information would be, and
> what direction you would recommend for a fix.
> 
> Thanks, Huyu
> 
> 

