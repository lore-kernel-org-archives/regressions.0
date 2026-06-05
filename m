Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A7524F;
	Fri,  5 Jun 2026 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633386; cv=none; b=ZhEcDe6Ie1lWDPlanKz9Q6ebPsr3hqBAiENkbnHhjckcI8mSPXWKRQuR6qW8Brc9xRSRLZQHk9WDR5H0/b56CslhMkCxJq/mSULA6wShFjCBL+EfZuFGx5sLZtiKufdgJd5grmq1bja2MuohppvCNVoK9Z2nu16V33kIM57pZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633386; c=relaxed/simple;
	bh=Y9pXhKSeWpYaSK5O6+IRrlanp8Yt3+dZaSbL9Mi9Dh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXXmdpgmQ2+5kY/8JCoPePaL85NBuX2DTOWAYl9ZPeCn6s7UB9agCBl+Cx12Y2i7uhrSBbeqMV8hXBlsXA43ODIuKF1zu9w1nplQUdSg2eFFKe27uABJjLzhE0Aa/d7Anda4cLxp0bTiRWbI1t64+JGBsEUH17JtF1D0wPwT8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TBwu1x8y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TBwu1x8y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6EbPTaXUn50Mv/Oae7oFClRjhC8wddU4zN9h8OrX1nw=; b=TBwu1x8yU9UDyLAPFlpnEuscmM
	W96XUR4ez2PWBUiY9kKKvtFBXX9vZVlbLaOQHN45j+qn74YynNTa/PBzlWSp0ujGityihvjIylS+G
	z8Ei7jc6ANhFZqKFnnx1z++7PLENDe7xSDYIIoVmIEuFPtGEZaWoLnA+OrKN2TkpqU2vhGmUoAIpo
	RLh2orj5fNrQ48F6wdbvDAQ4Ckq/zHf73O53eJGfZIs8i3Ye1bJud9U6Sx4bqurvQxCfAYCYa3n9n
	PNvEfMXkrsyoYJCMWOp/FgFYGxAy1h/h4gktDhJ7ukNCmoVt0jrRfcEzadg8/a7qrnb19PY7Fjoy8
	hJ6oi7kg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVM5I-000000004Re-1rCD;
	Fri, 05 Jun 2026 04:23:04 +0000
Message-ID: <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
Date: Thu, 4 Jun 2026 21:23:03 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) stack frame size (2088) exceeds
 limit (2048) in 'dml31_ModeSupport...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <178059594388.10259.8984887956034576074@330cfa3079ca>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <178059594388.10259.8984887956034576074@330cfa3079ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding amd-gfx]

On 6/4/26 10:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
> - tags: next-20260604
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>  3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>       |      ^
> 1 error generated.
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60
> 
> 
> #kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy

