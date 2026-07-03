Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309C285CB3;
	Fri,  3 Jul 2026 05:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783057979; cv=none; b=WaDKBYzDi9cwi4K6qv79TIbGXsrKRINNGVc1rBdWqY/AYxj6GteM49/RBFOC3P7uBPI3ZAQJUt27KudXzhWY+mZkldDAeEuKUBUcIVfEN/qePepDy3uJFCBQGoFa5GKWMPKoyiNsA92cn4kkmz9YM9QltiCdNPfBWZF1wtjL2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783057979; c=relaxed/simple;
	bh=m/qZuQvTawhZWpiQo1uUxcklC0JPgU8JaIUdESWQfMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJiUnMWztFq7g7OkS4b4epol/2x5adw+7OUhnNsxfFPeiKDv2FVG0CuzyMtGbcvg2T/BBIuIyYAmBBC9ZED7xj+tNOrX5+171vyO1TlGvfQmCs542HosZ1omyloSgfTIi4dHLh06FgvL7uznKQs1OhDZQPH2F1QXmvHc7+Yg528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SQpg2wUD; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SQpg2wUD"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gs2nB53bNz993H;
	Fri,  3 Jul 2026 07:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783057598;
	bh=m/qZuQvTawhZWpiQo1uUxcklC0JPgU8JaIUdESWQfMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQpg2wUDSEJnU1+Ia4z68NtFCqpiyhqi7rGS0LwZNopO/7fSEhPTC0dxXOLaVnmro
	 tKb1nE1lbG8L1NVEOadMLTQgz02AWiJ5LgVPo4wGN54COcVqB+G0CIFu/hpECqCBJ+
	 CAQMO8J35ZomwJHb8aifrESE5b15sKYzYoHHmjLakM6amaO8+A+Ql3b6HFNu0TC0Zq
	 nUlDYDJXWV17X2EVxot3H1MaRYUKArJcep86XupZa4PXNFxwY5wyHp8J4rXVn/nFEl
	 gr+bO5P6MgCMNXP2EfXfsBHyoTniUj4uUDGSRL4ojWMF4CrKzET+hndiI9pbwnLmVm
	 oFBscwfoBKK2Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gs2nB4Mbdz80DW;
	Fri,  3 Jul 2026 07:46:38 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gs2nB1Yssz8sbF;
	Fri,  3 Jul 2026 07:46:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6394660320;
	Fri,  3 Jul 2026 07:46:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <49839b36-f984-43e0-8ce1-b311704e481d@leemhuis.info>
Date: Fri, 3 Jul 2026 07:46:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) module random32_kunit uses
 symbol prandom_warmup from namespace EX...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <178302234435.4082.10623859604470804974@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178302234435.4082.10623859604470804974@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178305759765.2409209.5852938382093485915@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 6394660320
X-NC-CID: lbNsawCV5ZGZsqRVDDDAlj1VRO/vSfVSqm/MZBKbPpun9qO4Ejc=



On 7/2/26 21:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
>  module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it. in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
akpm dropped the patch that causes this:
https://lore.kernel.org/all/20260702211236.705B71F000E9@smtp.kernel.org/

#regzbot resolve: culprit was dropped from -next

