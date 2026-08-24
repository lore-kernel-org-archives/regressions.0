Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FD3F39E2;
	Mon, 24 Aug 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570696; cv=none; b=iH4lMS+uNkWj02Pb4HVIuv9H29hYK4u1mSo6APWrjFZx58KNYF18bJisJvfa/LeE3vT7q74/pn40f2LA742arzREfS+7vpvhL+VWfY0NPlwJ9+SOE6o0H5C0x1AwAdPgENY/1FA1A/CAQCkbstM9/snOD18UH8x3dTrV4Xb8D7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570696; c=relaxed/simple;
	bh=vPtS+SirOAHTJmrsjx/3NIEP7gHXB4AGBLiZryizuDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPKFBzMFPzIs4oeJYZIgraiEVDz2vmYaUa2eCtpyZPCQbYsX0NcfUvENIXb4C1wcMiNbpVLdLhApmSEarAbS98c/N4TR1/DKMnau/n6esl+gFGH4x4toT2du3yYqLA0Xg8Ibt9iQZ1GGigDtQblxarUDzBz/PxE+gLI4WnmJveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YGWVP3QR; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YGWVP3QR"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hT7pt4v4Gz3xNs;
	Mon, 24 Aug 2026 13:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787570662;
	bh=vPtS+SirOAHTJmrsjx/3NIEP7gHXB4AGBLiZryizuDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YGWVP3QRpKIIumc0YRbPmG2aNe3oNJlq4OjBuy7oMO/rv2GgBF0E8ZxFs+E9nVC/X
	 zNmeFk69Ano+KeZ7a44Zahr4dftrASF+STom0cmeuotwMDm4PqBai+wHh4M2vgULaW
	 ld7qZ8ULRf6Mvgor8OKF+LJSZWOcsqKlF3m0bpdiw5lSzzQ1TZFjAsrWO0G7pDgMsW
	 Y0yMglz/nCvL3rIc6AonR0PjqVshGK/gsj7AFJj56Dh3wsStldR5nMmY23EG54GezK
	 pa6QFdGFlUjtfFkmM4XbSluISmUQEpIlJ2swDE7as+XVVIgZlwjkSdm/n3y+sZ9XeI
	 edh1Ut9b7ONkw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hT7nk6Jkdz3yDJ;
	Mon, 24 Aug 2026 13:23:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.897
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hT7ng6mfYz8tZp;
	Mon, 24 Aug 2026 13:23:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4CF605FA57;
	Mon, 24 Aug 2026 13:23:19 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <057e0b88-4fa9-461c-8fa7-67fb598109da@leemhuis.info>
Date: Mon, 24 Aug 2026 13:23:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/x86/include/generated/asm/cpufeaturemasks.h (arch/x86/Make...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com, broonie@kernel.org
References: <178733874460.1338.14907565015998697320@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178733874460.1338.14907565015998697320@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178757059962.2592322.2663405393479305221@mxe9fb.netcup.net>
X-NC-CID: rbQ9hEEG5CWc6IirX0Qef+ghcCrGMC5CSJn/V4/foUq8tHn2oPA=

On 8/21/26 20:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
>  in arch/x86/include/generated/asm/cpufeaturemasks.h (arch/x86/Makefile:269) [logspec:kbuild,kbuild.other]
> ---
> 
> Log excerpt:

Hmmm, nobody else reported this -- and I failed when I briefly tried to
to reproduce this. Wondering if something with the test setup is going
sideways here.

Furthermore, these two seem to be related or the same error:

https://d.kernelci.org/issue/maestro%3Ae019eff33641f280144d13719cbbf59eb379327c
https://d.kernelci.org/issue/maestro%3A4f457c5cde619e65f938d53b68735abd5858719f

Anybody any idea what's wrong here?

Ciao, THorsten

> =====================================================
> Kernel: arch/x86/boot/bzImage is ready  (#1)
> + stage=2
> + cd ..
> + echo job:build_kernel=done
> ++ date +%s
> + echo jobets:build_kernel=1787335473
> + echo -----log:build_modules-----
> -----log:build_modules-----
> + echo job:build_modules=running
> ++ date +%s
> + echo jobsts:build_modules=1787335473
> + cd /tmp/kci/linux
> + set +eE -o pipefail
> + trap - ERR
> + grep CONFIG_MODULES=y .config
> CONFIG_MODULES=y
> + '[' 0 -eq 0 ']'
> + set -eE -o pipefail
> + trap 'case $stage in
> + stage=1
> ++ nproc
> + make -j16 modules
> ++ tee /tmp/kci/artifacts/build_modules.log
> ++ tee /tmp/kci/artifacts/build_modules_stderr.log
> mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
> 
> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/all/178733874460.1338.14907565015998697320@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:4f457c5cde619e65f938d53b68735abd5858719f
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - commit HEAD:  531ed942bb0df04f6747983fecdedce76a22d07f
> 
> # Builds where the incident occurred:
> 
> ## i386_defconfig+allnoconfig on (i386):
> - compiler: clang-21
> - config: https://files.kernelci.org/kbuild-clang-21-i386-allnoconfig-6a888db362f33761c0fe21dc/.config
> - dashboard: https://d.kernelci.org/build/maestro:6a888db362f33761c0fe21dc
> 
> ## i386_defconfig+kselftest on (i386):
> - compiler: gcc-14
> - config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6a888e4262f33761c0fe2442/.config
> - dashboard: https://d.kernelci.org/build/maestro:6a888e4262f33761c0fe2442
> 
> #regzbot introduced: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c..531ed942bb0df04f6747983fecdedce76a22d07f
> #regzbot link: https://d.kernelci.org/i/maestro:4f457c5cde619e65f938d53b68735abd5858719f
> 
> #kernelci issue maestro:4f457c5cde619e65f938d53b68735abd5858719f
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

