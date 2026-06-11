Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3183367F54
	for <regressions@lists.linux.dev>; Thu, 11 Jun 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163722; cv=none; b=jsrKpWgWRf9vp1cSu6wx+2/Y7XlKJugVQ1HrLrdgzcORWly1yLThNryBf0sm7nGEdFGJd2Wiu80y8ApfvtFdgCwZVUrk0pNYajUKIGBPnSvvGktsOgmz2AR8IS8PLtMe8UTOXYBzsMen8KGqJrre3XW2oYVDHP2nJgAmUz07+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163722; c=relaxed/simple;
	bh=OqC3K3EFfK/OlDy0882ip1Bb1McA9QpNcy7TVjuk2AY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=FGXE/aQahsYyGJ9hopLvrsIvJ/xsIcLq1yyal6+c1clZmvFEf2GH+j2p22FvaSfXxBoMMLZLsNZXd2wOCEcBjtm7G+KEqcZfARd9Ah84UlN2y/X8rhGIannfdqri8qIOda1RUWIYDHFP/mjfx/BbX0HI2uISwlgH8KMoUteAQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XLiPwAwy; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XLiPwAwy"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gbZNN1cJSz4Jsf
	for <regressions@lists.linux.dev>; Thu, 11 Jun 2026 09:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1781163716;
	bh=OqC3K3EFfK/OlDy0882ip1Bb1McA9QpNcy7TVjuk2AY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=XLiPwAwy6aunX0B3XVwb70vOwNSHC5xdR6FfubrbIpvZlgyJuc7Ys/rn+M8rwOXOE
	 Ob0bxKf5+jq55afVJZJOyJbRDlWMAcxSOGepnK7tiIK+MeWrKfSehGLwi9Ild/jvbe
	 0TptLQ+xCWrouZP03FYvjhFHpiIVlbFH2FhNBCru3KY346wrdNlInR78ha4NfleJQv
	 x94tSm5wHHire925gR9JSERI1eyHQQ6/xvhyBdzrrnliB0FcI/ZL1a7QUDXa5Uero8
	 j8RH1YvGWxF9nteWnCRooJqn/PXEHrKKL9T2OdPatFKZ6LgMV9/s7Lxm1pQUK4qeKJ
	 uqRewgIkTmV8g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gbZNN0w0dz7wx2
	for <regressions@lists.linux.dev>; Thu, 11 Jun 2026 09:41:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gbZNM5C1dz8t3w
	for <regressions@lists.linux.dev>; Thu, 11 Jun 2026 09:41:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CC5346179C
	for <regressions@lists.linux.dev>; Thu, 11 Jun 2026 09:41:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <72f70f7b-58d8-40e4-b0d6-405b1f476bdf@leemhuis.info>
Date: Thu, 11 Jun 2026 09:41:54 +0200
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
X-PPP-Message-ID: 
 <178116371499.1044642.17255885195270745946@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CC5346179C
X-NC-CID: CEVRgW6FqIBqR6L6g4G+ncuuDp4+QO8dgsKsO99fTnII+rHsHEg=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221505#c43
#regzbot fix: 5629eec1a28298

#regzbot report:
https://lore.kernel.org/lkml/20260429104938.1776671-1-igor.raits@gmail.com/
#regzbot fix: NFSv4: clear exception state on successful mkdir retry

#regzbot report:
https://lore.kernel.org/lkml/8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com/
#regzbot fix: firmware: psci: Set pm_set_resume/suspend_via_firmware()
for SYSTEM_SUSPEND
