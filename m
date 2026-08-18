Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE343B8BCC
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042025; cv=none; b=GhWieQqHxw6Le/oWz+A+ouSF3M10Z3YGeVDDmBnypX0zv/QkShAHAjvP0jwW8bycA7YkxP/NCieViMIlJUYApb6lIoj5a68FZTTcxscybOzJjxoWc+Ouw/ZZVosryCHJfNOCw7CwFgpm8rz6ebA2KOOwp8wUAhAmLnV0KeFSDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042025; c=relaxed/simple;
	bh=7Cl29xGgKt86381R6gOG7SuMj815ksAEyD8wbcakfEk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OntFDfvRLsdWGdFSqMTcX/aQK3CC8Y2JIFcz095cGlqW0TKB6qNxhQJyj9XnJyuiTr/NkXoSMuTp89aqqvr8Zia5336b4GNuRykcQt2QUxTgsM1lO9h4AUGD1FCjaekdxSkswrneaL8YBcsdRsjma5M7Ypj3zD8nfyqSxYRAGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UbLTDIjc; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UbLTDIjc"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hPNJD41BFz8Jr6
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 10:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787041996;
	bh=7Cl29xGgKt86381R6gOG7SuMj815ksAEyD8wbcakfEk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=UbLTDIjcmbxsVynlOwc3WXCtW7uJuzhJUITrbafYVWCehW6dLDE3SHrOETMjgy0DC
	 r+UBlL79dzJ53Duxh/T1/os5SspDNR+Z/pe+h14VKjAHQ7RfMoCcRK0vjTwjmIn0oh
	 ynb94GUiUv1Z5grZDcxvGu51XyIXbdx4uYHF36Ce8wV+GEYWaTIGz0lF7hAtkKb/bg
	 MmvN1KVC3ytdPYhhWRz+HeItxxQPCCbCfOaqgKF0UjJJ0FbCeOQ3OAbes61GX2jrGA
	 CXrjWHwK4HL9EicyJT+frakZCoK79HK7GomhKLr5uDYPtSu54OEPnkzBXVuJKHHjCF
	 dcnWA/UBoyIbA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hPNJD3JtQz4xDX
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 10:33:16 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hPNJD1w4nz8sZg
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 10:33:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D9F055F780
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 10:33:15 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <176341ce-4399-4fde-86a7-efecc6aa69b5@leemhuis.info>
Date: Tue, 18 Aug 2026 10:33:15 +0200
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
 <178704199608.3567179.11058052562467420067@mxe9fb.netcup.net>
X-NC-CID: gC7KIwtuj/P+bGaBeLI55I+t+n6hlAb65rcLv3McwpQ55QRw+HE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de/
#regzbot introduced: 86aa1ea1f15c
#regzbot title: ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba
playback volume rejected as sticky

#regzbot report:
https://lore.kernel.org/all/20260817182302.146546-1-marex@nabladev.com/
#regzbot introduced: a53b4f9c51a9
#regzbot title: usb: typec: mux: fwnode_typec_switch_get() sporadically
returns NULL instead of an -EPROBE_DEFER

#regzbot report: https://lore.kernel.org/all/20260804083434.20885-1-i@4t.pw/
#regzbot introduced: a53b4f9c51a9
#regzbot title: usb: typec: mux: valid orientation switch may be
incorrectly discarded as a duplicate
