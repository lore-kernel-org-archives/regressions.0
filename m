Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510304;
	b=K8xWkzZny+A6NDTt/qHIwu6GFKomrVKsR2UhNvzq4Z8osNADtn9RXgR6iDMPC+NoBpsk
	 tOqC2qb8m9Ce6GfzaqVzwrmFwgoZ13vzTL+XFlL39Z1ES5ZKWlv74PEU3SCmPs5xQukx5
	 ksO1ukUJmHGzUnEsqc5aYMSvnKd0OTsfqWcSUW+4mg53qxx33zWEVkAJtr+oqea5ayWMQ
	 opN8pDPo7ikvqHgca1rMWF6j9BZx/Wc7gW2zj8tYz89XIMT4QuhsqBXhIINdllazztJX+
	 1ZpZacNXMuEcAPycXNccqfGHQJUlNDctcnlbZRLPsdfN/MbolbEk84KTSxGKG4/tJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:
	 Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=qdlQbyEWnTCNWapvNxuWGp2W6cx40EOLnNWu8HxqknY=;
	b=Nv9D1acxRwp6KEo00JGVXuJQoMWgvuWnQVHfyAqUykHbIeMNTYg1lv+Div+8XDHjIaI5
	 dt9OTLqBiTExRBrSfJ90FI/nYBnbM69Dpk2Tw1yoYuSFOB5XAfsnyZ/qEG5qBJUaHtVOA
	 9v/LL93+3616mg5FidPpElJrUUZkeIw547GcdvXn4XRQbTKHweaZddf2PcfmQWmeEA32d
	 2SR2r+KY9GPUzxM14VPbwPn6AOHcwfCSFeXTaAqUrpzwmhtxO5FbbxdY6u2o9j6bwCiQg
	 griYBHARmJNIZeple8qHADLcB4xe8P88ZcLPHimoLAAaGo1BrXuqLOA0KwYRa4uT8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=DG3AVRNG;
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9477C60A263B;
	Tue, 20 Oct 2026 15:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9477C60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=DG3AVRNG
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j8Gbr1yskz4PCp;
	Tue, 20 Oct 2026 17:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792510296;
	bh=+XfIc7m/uiIjhXMkyO+VufQrB6iFMEZcUr9sPe8arlY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=DG3AVRNGGO6Re4yJuNENFc8H10dSlmgQACFJhPLNkCBYnwsgDXV08wOJfXdigCk6C
	 3KWofCPUiRPLruVLySSQpgFu6h/0M+GVMc6QhnXSE98zaeFXuwmoyuKnTFPfpFKDJ8
	 Ngw4HFUDiTWbBqrA2pBtyG2DMFHhjT5x2N5zdiZGFihXsqqpueFPyOlBjkKArYe9vQ
	 A85zQ2YP7ezmsBBAGJTFyWre+PTE1Udz5MOe7/feQSdCBkbxRRAhzBVlMJUuSmh97S
	 B5I0nEmqP+kZKfBPxsq3S28bzG+u1X59zIAbS7Etstb4BG4AO686VqS/I9esfQT7TP
	 +lSe2NtEhzxrA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j8Gbr1G2jz7xQy;
	Tue, 20 Oct 2026 17:31:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j8Gbq3dZkz8v1t;
	Tue, 20 Oct 2026 17:31:35 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9B9F55F9DE;
	Tue, 20 Oct 2026 17:31:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d79574f5-fe28-4bb4-a68f-d8f2d0932a20@leemhuis.info>
Date: Tue, 20 Oct 2026 17:31:30 +0200
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29/tmp/kci?=
 =?UTF-8?Q?/linux/kernel/sched/ext/ext=2Ec=3A5690=3A68=3A_error=3A_=E2=80=98?=
 =?UTF-8?B?c3RydWN0IHNjeF9kLi4u?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <179243994358.157792.10951804910694087418@kernelci.org>
Content-Language: de-DE, en-US
In-Reply-To: <179243994358.157792.10951804910694087418@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179251029090.1553448.13952556346973502681@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9B9F55F9DE
X-NC-CID: HuIQ0zKUwVBFlN8Vl+Pe2O0XCTZem0tBMBfMYJQT8IdfbISfCzc=

On 10/19/26 21:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]

This afaics was caused my a mishap in a merge conflict resolution or
something like that -- and gone today.

#regzbot dup:
https://lore.kernel.org/regressions/179243994625.157792.5761151975328981641@kernelci.org/
#regzbot dup:
https://lore.kernel.org/regressions/179243994757.157792.6578749550685907930@kernelci.org/
#regzbot
dup:https://lore.kernel.org/regressions/179243994891.157792.7812879229965993143@kernelci.org/
#regzbot dup:
https://lore.kernel.org/regressions/179244354354.160074.15935947483852417783@kernelci.org/
#regzbot resolve: fixed, was a mishap in a merge conflict resolution or
something like that

