Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A448AE29
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573016; cv=none; b=NUas0xchS5vHiYLaUsqRV8l634wOpS7Lg5eho7l4g5sAi7GPnAj7k3XNB9p/K+eMM3eECXha7RMMlHp643U3hPhCK6X7ZXoKr54A8VvFEo1cvr7Jb3E2o4ktnTjZy/PmOUJZOgeom8hPC6bmQ1TBLfbrarYW2C3xokbrUwE0+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573016; c=relaxed/simple;
	bh=yLc2hQOMqJF9LvMr6LkLdpqmLGYjnstRKlOFE7B59/o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PzYVB3BRw1pq0nXec+y71PqzaERe69HxPeVxf80WXaPM6jptbIatZP1blLxx1pUpHjnl4/JZAzxsMg9U7Y3c48CAq2C1NkTPdJ465apnJ1GYlMmKSKARmLRvSRn3QkBqGzlP1Mjn8sfe21TBxfJboWT6GD/unhxDk+v1hjw7VbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OjzLk/Mz; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OjzLk/Mz"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gF8Gz6S4Zz92gH
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 10:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778573003;
	bh=yLc2hQOMqJF9LvMr6LkLdpqmLGYjnstRKlOFE7B59/o=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=OjzLk/Mz9a4zlZADOxDzInlPIj4Ow4sCCeaOxGxxpS1AXKtTah0H5MZrn19MOitEa
	 mebiaM1hScFcV4VYshgPOQKEJ5FumR7uKmDIdxGF4yJNkWgtCGTO39xAioVaL00iCe
	 uojWgQR2nEXzUYBnouEbUb5JIjSzuv2wY14bGpBc805sQBtoWLGQSIMqjTmpWqn4IP
	 d7GCnGJ6WICN7x5dCBzY4NA1fHISnLk46oG4GFiN44RaV4H8B375g4ZG/bb+ouns+Z
	 sG/Ik0+AghrnQEIwa3+hmXIqwVQ5eWb1nS3sGjFh0ONQVTdyVo6oIiY1b9bzq4smGT
	 Lf1M2dLjuFrKw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gF8Gz5m7Sz7vFX
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 10:03:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gF8Gz3v9xz8sZh
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 10:03:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1EBC061851
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 10:03:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <fe4e00ed-81f7-4d3d-9024-ec509ccdfd16@leemhuis.info>
Date: Tue, 12 May 2026 10:03:22 +0200
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
X-PPP-Message-ID: <177857300329.3018391.2538976502446988105@mxe9fb.netcup.net>
X-NC-CID: Ovhry9WsWfzobtUzjoviEeFEp0pXDKxGfALVzzOEyCH/EAetaCE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/04657838-46d1-432d-95e1-eb73b930b032@mailbox.org/
#regzbot fix: sched/deadline: Fix dl_server behaviour

#regzbot report:
https://lore.kernel.org/all/321c2e57-6a17-4aef-ba42-d2ebd577e472@solid-run.com/
#regzbot introduced: d6c65b0fd621
#regzbot title: iommupt: boot stalls with many smmu errors

#regzbot report:
https://lore.kernel.org/all/caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be/
#regzbot introduced: 1c21f240fbc1e47b94e
#regzbot title: drm/imagination: driver stopped working on various
Renesas R-Car SoCs


