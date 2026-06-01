Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1538E8B0
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304997; cv=none; b=agZaGReZM9wkdO7/G/Tg+4k3rM9BCZitxA6/XfvujRTm0/SqqC81zabWrLx7kBiUC52i9N98aa1SSpgNxNfu44IP3nyL12nXrbA/m0zQIq46rdWbmIIMT3tRQsX50fA9Bo396cp8KRZuN7qa160gPjDbrK0vmGbAg9bc3d0ETk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304997; c=relaxed/simple;
	bh=G1Vmlr5olhz3CffWXDK7kFa2IR/+qT5rmCvOC9xgj0Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=flK3wFzLEwxBA4QnUEIXepO8fz5FG7x83xVHQsEhMCUNGxe9Ejc2G4niGKRPuSANM3NnYfYfBGBOfySjTmMZaqT+aqFgodpCh0tLAotpoEiWI8l660Be3ABziu1OlMnABq5vYwHlqAc93pOuWm1Gd2muqc/hIL4dn4jIzNnmMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TeKghVtg; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TeKghVtg"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gTSpJ4RFyz6B7c
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 11:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780304984;
	bh=G1Vmlr5olhz3CffWXDK7kFa2IR/+qT5rmCvOC9xgj0Q=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TeKghVtgpqK7QX48gjDx8NPEdoIO+FVzGeEleyB+i2XBqO7T7wpRAPJIbV9o/ywRz
	 oLL4vLKlX1e0thR5iTJTliVbgguh9ujOds1KEKjJS8s+tQWxV5dwAqU3ozPFF6t/PU
	 Rn4YjPw0FjrpdJ/1d6FL7hpfSUDRqw3/B+V2zLtrr964nqp5KiKSZ2pKHf/3qB7Ug2
	 Av5w0iUYSlPgh0+g4vupy9OYKrjqT7BCXrGJsNcbr4b3+OptnDE78jDprkbRvvp5y9
	 ZhsGXWeytsFk7h9ecrkRiGF61XHlf6D+g75klBLnORzxTACJQf3tTLmVDRoUi1VVnN
	 myPSTnT8X9BSw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gTSn74HK2z4ymG
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 11:08:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gTSn713gRz8tb3
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 11:08:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 87FBD6031E
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 11:08:42 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2482fed3-9b30-483a-bdf3-31f507390fda@leemhuis.info>
Date: Mon, 1 Jun 2026 11:08:40 +0200
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
X-PPP-Message-ID: <178030492274.470212.15919390879682664188@mxe9fb.netcup.net>
X-NC-CID: 4zAImWa/5Z4kwk9vhc+oCdoSCkM/sTFzqbO3YLCfF/k3DaUFX+E=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221505
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221473
#regzbot fix: cpufreq/amd-pstate: Fix setting EPP in performance mode
#regzbot monitor:
https://lore.kernel.org/all/20260530154121.1670781-1-superm1@kernel.org/

#regzbot report:
https://lore.kernel.org/all/20260601085136.3124646-1-zhanxusheng@xiaomi.com/
#regzbot introduced: a5242d37c83a
#regzbot title: erofs: read error/EFSCORRUPTED on multi-algorithm images
#regzbot fix: erofs: fix EFSCORRUPTED on multi-algorithm images in
z_erofs_map_sanity_check()



