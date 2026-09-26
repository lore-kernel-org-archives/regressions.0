Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532983A1A22;
	Sat, 26 Sep 2026 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419026; cv=none; b=GaShKahZhoUctE7Yf3pM304oApmaCtb07SUZqJXeQkKUtfnDpqg8f82Ox35pf8FQ3a9akNkK4v+CW1mNFzqohSruqiJ99bsgTLKZ4nelHqIzNYh5UccetHNvk1FmOMojl7GbNaHawOE12NHdnWa5yYbCZ3RNi/AgnZ9BIHJdr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419026; c=relaxed/simple;
	bh=i6fl1ULkUn1mbMwZAcbeuNP6eSzYxBx5JHbZ4EDvyaI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kYoEel9+8VJnG7bfcYcdf9pxcyysF0kMIK0O3RuqjU3kgS0Nq7tGGlJ2/IsjPE/BPtHTqgqRvH0SCPndJVfLtbBuKEVcs44ecPYfrfmYd2fLKFJMGdIVxYe+ZALS8FJkg6xTW4uRLL4lxA4jRivWj1329OLc0gXThQ06ivXlMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FKiIUyC2; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FKiIUyC2"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hsPBz1tRgz8HFB;
	Sat, 26 Sep 2026 12:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790419019;
	bh=i6fl1ULkUn1mbMwZAcbeuNP6eSzYxBx5JHbZ4EDvyaI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FKiIUyC2hSqqfHQGTjpwi+IJ63j1Mc7wFulibNk+hQQtuML9Gye0TDuwPU76Nmp/j
	 pJGzwEp3H4Lmmb6zJtinLzmNLzUVNVrLbRq3lfEu2yfQE+Fc1a90hAfkwC/+kJLaYV
	 v44ZGkZWjteHgcb6zZWpBZIskuPCwpuY5Vz0DWCK0CjUWnZhy7GH0q3WoXQXJLbfTK
	 9R6w0MPnceo9Tk462zFaBJsQ7GW8vxVr7eNyOkbPFpLfABM1uLyJUSPGvebQ+76R5g
	 ygLhlgcHeaqOHvH0Owm6mF6JuZtKDoumz7nbGX8NLtRMZuEGwiDmxLRvvN3YeD/Mxf
	 xRD+C2eSqZ9Vg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hsPBz19xYz8HCP;
	Sat, 26 Sep 2026 12:36:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hsPBx59f2z8tgV;
	Sat, 26 Sep 2026 12:36:57 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C63825F8EB;
	Sat, 26 Sep 2026 12:36:52 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info>
Date: Sat, 26 Sep 2026 12:36:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3096)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <179039514312.597384.1659548947123427650@kernelci.org>
Content-Language: de-DE, en-US
In-Reply-To: <179039514312.597384.1659548947123427650@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179041901317.6356.2257204260529886425@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C63825F8EB
X-NC-CID: 8FKwRyDjbBaUFUsLVpQcTvzVjjz7bhOhR8hMHynEL1kQ1o+i/oc=

On 9/26/26 05:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
> stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
>  10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
>        |             ^
> 1 error generated.

Hmmm, there are known "stack frame size [...] exceeds limit" problems in
-next that should soon be fixed there, see:
https://lore.kernel.org/all/CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqdmDM6xQ@mail.gmail.com/

But this error is new -- and happens in mainline. Wondering if this is
caused by a fix for those problems.

CCing Alex and Christian in case this is really something new they want
to know about.

Ciao, Thorsten

> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/all/179039514312.597384.1659548947123427650@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - commit HEAD:  6812ce4e4379ffc99c52401ec28f0d7ffbc36206
> 
> # Builds where the incident occurred:
> 
> ## x86_64_defconfig+allmodconfig on (x86_64):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6ab70c1f5ec73975aade9d6e
> 
> #regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..6812ce4e4379ffc99c52401ec28f0d7ffbc36206
> #regzbot link: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> 
> #kernelci issue maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org

