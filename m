Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5820125F;
	Tue, 18 Aug 2026 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032868; cv=none; b=i2khbfHgn/4YfEZgMAboGYJi+PQd3p5cWWReGzkUCf72scZextfVJR7rYwTvWRuOOORzXYVynH5RNFW0wBaf6b89ycC17HgvRhK+tRKk/IZ0/+cmy76FK1yz1IFV5FuZxDUNSVny52iR52YtY4fFPBKdyqMV9O18g1aBZi6AWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032868; c=relaxed/simple;
	bh=R9Y3pBCagqDn/Krz09l2AqOd1Twkpi9BhXM57zBnFvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjVsichR4ljnX5KU8tJcumr2atADahM+OGJ47PwJK4NjA4Sz9cLOamONLLOjXbMFTk7NThsLrDGb7nfQlhHBzT+rCDdkPGx3sMbNiiTOTmkhy8+Tmjifjx6UEh11LzYcWhltr03fFx4eIWtsJeHTc9o8oStW1sFW3pN53VKvgYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Gdqm+Ebr; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Gdqm+Ebr"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hPJvg4hQYz6F9x;
	Tue, 18 Aug 2026 08:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787032815;
	bh=R9Y3pBCagqDn/Krz09l2AqOd1Twkpi9BhXM57zBnFvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gdqm+Ebrolj/wgsD+SUprfXf89GLxVK5ArQ5Uz0gdzGAHSzsSbUVirhO2B7KiWa61
	 6LXQdSpfJEWy5RBq7hbvtdExKkFjED8OMiO0hfvKBFBNw7wjjfnT7PVDrnMMF4Ixy5
	 zvKALN9r+ioClCYxjd8upAkU4sHqjZn8HX2H/a3yzwJbzBEx/0uSA8MErnipTzdKXG
	 cgweYIw32USOyllFmPNSnXPVRMEAoLD07umdTFMjadYEg3kI2g0V8nDaltvSx0l5nC
	 uope1Z4WW3R4vCoIgQ3+xNLWzs5VJIoZclWP0vSfeTThBO42F0qKAP80EAsv0YMrxU
	 sBMcfL0VmyeIg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hPJvd4Vpqz4xts;
	Tue, 18 Aug 2026 08:00:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.897
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hPJvb2Mm6z8tcd;
	Tue, 18 Aug 2026 08:00:11 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4A78B5FAAF;
	Tue, 18 Aug 2026 08:00:06 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
Date: Tue, 18 Aug 2026 08:00:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
To: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org, kernelci-results@groups.io,
 kernelci@lists.linux.dev
References: <178701474442.5156.12765087253678603047@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178701474442.5156.12765087253678603047@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178703280674.3289961.9845272905440892117@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4A78B5FAAF
X-NC-CID: 5dfDT5eBpiF2aL5jqJqGm2D5x/l11iP7YWWVUq/jiJEr+3GF7lE=

On 8/18/26 02:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
>  in arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile.build:435) [logspec:kbuild,kbuild.compiler]
> ---
> 
> Log excerpt:
> =====================================================

Missing for some reason. See below for one, grabbed it from
https://d.kernelci.org/log-viewer?itemId=maestro%3A6a838f2962f33761c0d6680b&type=build&url=https%3A%2F%2Ffiles.kernelci.org%2Fkbuild-clang-21-arm-allmodconfig-6a838f2962f33761c0d6680b%2Fbuild.log.gz

Nathan, Nick, do you still care about clang problems like this? And do
you by chance know what's wrong here?

"""
<instantiation>:2:11: error: out of range pc-relative fixup value
 ldr r10, =__per_cpu_offset
          ^
<instantiation>:2:11: error: out of range pc-relative fixup value
 ldr tsk, =__current
          ^
<instantiation>:2:11: error: out of range pc-relative fixup value
 ldr tsk, =__current
          ^
make[5]: *** [/tmp/kci/linux/scripts/Makefile.build:435:
arch/arm/kernel/entry-common.o] Error 1
make[5]: Target 'arch/arm/kernel/' not remade because of errors.
make[4]: *** [/tmp/kci/linux/scripts/Makefile.build:549:
arch/arm/kernel] Error 2
make[4]: Target 'arch/arm/' not remade because of errors.
make[3]: *** [/tmp/kci/linux/scripts/Makefile.build:549: arch/arm] Error 2
make[3]: Target './' not remade because of errors.
make[2]: *** [/tmp/kci/linux/Makefile:2187: .] Error 2
make[2]: Target '__all' not remade because of errors.
make[1]: *** [/tmp/kci/linux/Makefile:248: __sub-make] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target '__all' not remade because of errors.
"""
Ciao, Thorsten


> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/all/178701474442.5156.12765087253678603047@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - commit HEAD:  ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
> 
> # Builds where the incident occurred:
> 
> ## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6a838f2962f33761c0d6680b
> 
> #regzbot introduced: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f..ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
> #regzbot link: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
> 
> #kernelci issue maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

