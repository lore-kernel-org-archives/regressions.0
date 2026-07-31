Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8AE3B6BE3;
	Fri, 31 Jul 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491048; cv=none; b=oLevQ+C5lTrW2Qvw63iQHXUZvucVzb9heC40VtcYL7UsE0RsczzCA5RnkYm9xWT9CnkqEj063Yq1KyOj4N09kP0Jg1G88i2T3LpzZ/Dwzu5+RrGguBOJkGaIXrm88sIv1CwrBdY2mwVANsJ5YLksqlf1mlNm+aLM70vLl3YcYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491048; c=relaxed/simple;
	bh=lWYtvxlBjTE7A8Hl1l0i8BOB/MvCVJriXHIj5eWFBYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPYGyESojS64OpSQ6VslMjFZNEhBM4mfo//3q9U8AhXwIzHqSd7XmyxTrwxooy+HfRmLL0S3pHAiT9nDDWbM6lxZa7or/547jA9OwrL7rGss+L+15Ut0ftQwk++E4Rf62Mh4IwFEFJeWM7TW1uqEVw8QmuF8teK3Z0+OYkr6+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ltcKrTpb; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ltcKrTpb"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hBLk51LZmz88tf;
	Fri, 31 Jul 2026 11:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785491037;
	bh=lWYtvxlBjTE7A8Hl1l0i8BOB/MvCVJriXHIj5eWFBYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ltcKrTpbFP+YTCK6FwA44EWJKPdZbGFrRIpUCTstsMAVyXKywwDkgY5Koloi48Lv0
	 8QciPK1x8GQAzxOkqPpKzh+cJQwE8VYg3VVSDxtlPgxp8wQJISknbvvzF2boyXFjyl
	 yD7Kti1BfLQBCv0zeMBnzlceis/ny0uvtCGh2SwkzHmzC1638vkrtI7tJkEtxnTVdJ
	 4vVpJ1Qac52tJ2MvwAx4RD8TwOF8m17HokA0FGY/9jpE1V2azSFgJZVEia2Yt81fYz
	 wldVrwm+aOwg8z/v5EKILhrs1UsROYiFowhB6J0upIZhqF5Y5G+AFayWr8XjXh6fSy
	 HfgdgKA6YI/LQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hBLk50dlTz87Mc;
	Fri, 31 Jul 2026 11:43:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.897
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hBLk252H6z8tbq;
	Fri, 31 Jul 2026 11:43:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9EBF15F9AF;
	Fri, 31 Jul 2026 11:43:49 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9d66c14c-5ef8-4e2e-aa1a-ece90901518c@leemhuis.info>
Date: Fri, 31 Jul 2026 11:43:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) use of undeclared identifier
 'check_vector_unaligned_access'; did ...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <178543074351.4076.15027730787524065993@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178543074351.4076.15027730787524065993@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178549102999.2787815.11569596905747714009@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9EBF15F9AF
X-NC-CID: MzF+rWNqCmMdAJeUfv9DwzzdeU1SvwicliHVlLB4L9AXVjL3yl4=

On 7/30/26 18:59, KernelCI bot wrote:
> New build issue found on next/master:

Also reported by the "kernel test robot":
https://lore.kernel.org/oe-kbuild-all/202607301618.yrE3EKfS-lkp@intel.com/

Fix is under review:

#regzbot introduced: f54d193db5da
#regzbot fix: riscv: unaligned: Fix check_vector_unaligned_access() stub
name
#regzbot monitor:
https://lore.kernel.org/all/20260730131931.2066821-1-namcao@linutronix.de/
> ---
>  use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'? in arch/riscv/kernel/unaligned_access_speed.o (arch/riscv/kernel/unaligned_access_speed.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'?
>   380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                      check_unaligned_access
> /tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:112:12: note: 'check_unaligned_access' declared here
>   112 | static int check_unaligned_access(struct page *page)
>       |            ^
> /tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: incompatible function pointer types passing 'int (struct page *)' to parameter of type 'work_func_t' (aka 'void (*)(struct work_struct *)') [-Wincompatible-function-pointer-types]
>   380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/kci/linux/include/linux/workqueue.h:636:45: note: passing argument to parameter 'func' here
>   636 | extern int schedule_on_each_cpu(work_func_t func);
>       |                                             ^
> 2 errors generated.
> 
> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/all/178543074351.4076.15027730787524065993@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  95d6a9ccef99117115e41e9adb271243bd5e985b
> - tags: next-20260730
> 
> # Builds where the incident occurred:
> 
> ## defconfig+allnoconfig on (riscv):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6a6b7183798ea6c1ef929eaa
> 
> #regzbot introduced: 78bc8af4affb9a732504eb22eeac7d1e50883853..95d6a9ccef99117115e41e9adb271243bd5e985b
> #regzbot link: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c
> 
> #kernelci issue maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

