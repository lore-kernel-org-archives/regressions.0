Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6031BCAE;
	Wed, 30 Sep 2026 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738661; cv=none; b=T1tHFuJC76C/+83AQRI+lfDAQPOQh4Kf87F8CT6JCSBQloaOiuT1iqaNBCqpkIPmptp8q8jp3w5TxKTvE8pvRwQcESuHnxHkgiet3/NChUetznpD5pfYichepvzbSzAYfJl3vWT2AGMsz3s036T9ufNatvlpeK1tSNbEDKSTnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738661; c=relaxed/simple;
	bh=BkTCcEBd2/Y508fDZADSdzdjOrB6WGqSHCybXi18BxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3L0/ay6Xi1LqVfthCposDv/3JW5a59I5hMVPC/E4ElbCpkiUF9UH7KT9Z7o2t0K0K5C24TDzHSPmQsjSyn8wK2XHDSkS7M3dR+M/k+MmjNHgThAKKIXWYQkHmCquFDT1XWZVPpxGcX/1YbuJj0L2iR7+XL/l4ftjlmSqJlH+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AuT4ppjW; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AuT4ppjW"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hvgDw2lt3z6Fg8;
	Wed, 30 Sep 2026 05:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790738192;
	bh=BkTCcEBd2/Y508fDZADSdzdjOrB6WGqSHCybXi18BxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AuT4ppjWXGT4MzqH6CuXjTlK9OGxLDjKTZes6RAUs6u47r4eh09bUBaohtRGpxKE5
	 PnxVaaiYKBTq4o8yvQcxfYWfmjcAK5A1q3Q+CzAVIHou6VzbnxirDPxogcAMcy2Kj9
	 LVZSBHAIx0LPStHnZxFIZMbRymtZxxJLKIJHDtvb43CEXCIVU4t31Og7bGtjrcXHNP
	 SxjWqxDxAa8CiqTYo50XKSbNGh/T3IYeNeK2SgP4bmKgnjXKus899P74mSaI0whfTP
	 1jpl8OcZDhmglom96nL2Vl+mllJnnH85ai5RcRnRK9u7hyk3tKd4v8fgZmefXXb/6b
	 QFkfcOacUNCpA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hvgDw22fmz4yZb;
	Wed, 30 Sep 2026 05:16:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hvgDv4yNRz8tdK;
	Wed, 30 Sep 2026 05:16:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C5C675F948;
	Wed, 30 Sep 2026 05:16:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0dea1d66-d960-4767-a37c-8371b2630904@leemhuis.info>
Date: Wed, 30 Sep 2026 05:16:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3120)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
References: <179071554396.61691.9694528946845866461@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179071554396.61691.9694528946845866461@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179073819106.2622380.11337390129437005090@mxe9fb.netcup.net>
X-NC-CID: 61bxzawSf/wCMhIuZjC1ZJv4vlMGKHD5SysyvEO4PqKf1LtLjRM=

On 9/29/26 22:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
> stack frame size (3120) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
> ---
This to my untrained eyes looks like yet another a variant of the
problem that was reported yesterday, just with a slightly different
error message, that soon will be fixed.

#regzbot dup:
https://lore.kernel.org/all/179039514312.597384.1659548947123427650@kernelci.org/

Ciao, Thorsten
