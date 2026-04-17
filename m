Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3833064A
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439749; cv=none; b=uwDbUbB5YikheUSe+twnmMapVxgGtw4zYlMEf05WCuuoz4F7p5qq7ahLe3/h2REc9cXEnLHAx+qjEWt0ATaq0IFPK8AKR468pfnp46tg6Ue1Qe0BzBIh6VZweF84HDoa+1s/vm7gDr3YMI8QDnFYHiLfWd3q/11eqv4ZYgIFC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439749; c=relaxed/simple;
	bh=iIihQQrMPuP2qzsEIf8l1owVddlHoyOiGQbnYR8wAto=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=aBad0Vls7ZMZ+AaGg4bObCnsvNED1iQjI6Zd34m/P6ModuT22ltPS4m5T7TsI7TtEo0tNh+ys4tdKZrU9jOOofq6fO8igAOwK1jUty+tMNqtVpYeXOHDps5ZMxc/siVx7nI2FP2Dc9wncB1GgUKiC2O/toQWoTeGQM/+uSFcYsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ALWBcPff; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ALWBcPff"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fxzLf1J0Mz49cc
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 17:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776439738;
	bh=iIihQQrMPuP2qzsEIf8l1owVddlHoyOiGQbnYR8wAto=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ALWBcPfffTPUc1v1CeYJw8l5YEZGxvsGvBQm4Vm6htC9uJJPNvMgiG0WUYgVK673w
	 96JaNibDEmk92mU+7f0iVVOIdm3g/4UFNYVCUyEl+PpC6rGLsTeXBPWnu+HL+sBduN
	 n+k7iZdsoOtuN6KgrJaEJ81Mtocf3ryPOiO4XSxTLTiozoL6qP/FUJYJ4XyNUqoyW7
	 R3W77ow64TyMk2lN37G1lszAKxc/m6N/sELijkAiK28YWZIbB3Eb2QCl+pHzDGEQoh
	 gehwZTACgOAO477FmPzevr1839hBUxEyYZOlvYSQ1fe7Z23VIC9evQiZLpD8jZBstM
	 buVdhUAHHFG6g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fxzL36n5kz7wjp
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 17:28:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fxzL33DPTz8tYb
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 17:28:27 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8FC7B63297
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 17:28:26 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8cd39ddd-a93d-4758-aa5d-012e3bd5c6c9@leemhuis.info>
Date: Fri, 17 Apr 2026 17:28:25 +0200
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
 <177643970675.2578667.18295285072128482646@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 8FC7B63297
X-NC-CID: 4Td2jzdq50ON1LxpW6QOVpqZXrVQtgagEhQ9onpl2QB0B9r60rI=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/aWWZb3eRfQdB4OsI@mail-itl/
#regzbot resolve: inconclusive: fizzled out, nothing from the reporter
for a while

#regzbot report:
https://lore.kernel.org/linux-btrfs/0c33ef9a-24b1-43a6-9f93-72249b1cceac@gmail.com/
#regzbot resolve: inconclusive: fizzled out, nothing from the reporter
for a while

#regzbot report:
https://lore.kernel.org/lkml/8ebe4d76-eb07-499b-b140-1f300c1b8d7e@prnet.org/
#regzbot resolve: inconclusive: fizzled out, nothing from the reporter
for a while

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221097
#regzbot resolve: inconclusive: apparently gone with latest ath12k updates

#regzbot report:
https://lore.kernel.org/amd-gfx/CAOnW2VTGBP=MMWM=W41uPDLrzTVHM1sw8P1myvftnNk0vEMMFw@mail.gmail.com/
#regzbot resolve: inconclusive: fizzled out, reporter did not follow up

#regzbot report:
https://lore.kernel.org/linux-wireless/CAHFM2E%2Bd6KiOfAgejK%2BhEUMvyAwx%2BuCwZLM3dVSBgjXiDoxoQQ@mail.gmail.com/
#regzbot resolve: inconclusive: fizzled out, reporter did not follow up

#regzbot report:
https://lore.kernel.org/alsa-devel/170a3c247d8b94a2e5714ca0641a91511c9808d3.camel@posteo.de/
#regzbot resolve: inconclusive: fizzled out, nothing from the reporter
for a while



