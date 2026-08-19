Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828E442364
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133835; cv=none; b=pbeQns5m7FYepKP75ZfYkauzslrmWI32rfdNqlGljZofysY6GKLco0A5KUB3W/+8PuFYe7NoBlLGZ6xp9PBhrtL68CprBKNXt+mjXfCkrsWrq6L+LMIiv8yr3DDXDzuqvrdjOk6w/4QSBR/+3BsVlk6iT+iPK6w/Q2aIn6ykAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133835; c=relaxed/simple;
	bh=SUrGJRYs48VlIUdhRLE53IW1fW1ZUwIAPEdOwIPY/h8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=B3Lr0t+4ADYcpK2qHLpla7KbpdxdvEow8DYz6V1ALsprUKcZlhHej6xjP1WQOkRREK0KpAbbFPp+GsjeD4uLpa2F3kkc2Dvm0c6Qg40PPSA4ubijcd0QPdMqqyo4WMdfE8MNjkUldeiTBVM7uQsoMRgam5Ef7pPDu/C0w6+FDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jWi04Qjq; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jWi04Qjq"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hQ2G72M3nz66nf
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 12:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787133823;
	bh=SUrGJRYs48VlIUdhRLE53IW1fW1ZUwIAPEdOwIPY/h8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jWi04QjqO5/VKTZDI6qSki1rlPDQou3Ai9EA3ufe8d4Apyxzx2I5Gz0AeqemUmLRp
	 YlMGKzFmg8XITtkqbPRe500FLvZNX/uGTaa8KKrXnaiaVy0iWjCBBKNQh9uThXC6K8
	 tazFwlJM82m5UIZfYeNlmo9KwDd4tNA1IIVIC065QNRquVWYuHdQX+xFj66cGCylmE
	 PJwvJ3NWGp5d4FyT28acoupXsoHaZ5G3Bn8ByDCq+mKFT4zFvm3FJAKg3PSKZTFOIe
	 PIDYAgZQFO44RMaedvng5hIh/bHM1XugIXvTAQLEbD6NuR1OAvDUWc+x2OabGQks7Q
	 HetpO6FVK7QNg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hQ2Fc5CBBz4y3T
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 12:03:16 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hQ2Fc3Mzrz8sb7
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 12:03:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D15DE5FACF
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 12:03:10 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <de784c5e-9b13-404d-8c01-25e82759fe04@leemhuis.info>
Date: Wed, 19 Aug 2026 12:03:10 +0200
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
 <178713379157.2570100.17893158971941635111@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D15DE5FACF
X-NC-CID: /MAgcpDHXAp7+OiTnVcoW/LX295Ay8cJu/TN5Fu9iqObz4lf3tA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/178701474442.5156.12765087253678603047@kernelci.org/
#regzbot introduced: 79d27fd71854
#regzbot title: arch: buid error: out of range pc-relative fixup value

#regzbot report:
https://lore.kernel.org/all/CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com/
#regzbot resolve: somewhat old and unfixed, and tricky; leave things to
the maintainers

#regzbot report:
https://lore.kernel.org/all/3023d7d7-c8ab-48e7-a0e4-e18cc4ea0b9a@nvidia.com/
#regzbot introduced: d3539347022ad4
#regzbot title: serial: 8250: booting broke
#regzbot dup:
https://lore.kernel.org/all/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com/

#regzbot report:
https://lore.kernel.org/all/20260818085623.18467-1-panz.development@gmail.com/
#regzbot introduced: 0919db9f3583
#regzbot title: HID: asus: touchpad becomes unresponsive
#regzbot fix: HID: asus: do not send keyboard init reports to touchpads
#regzbot monitor:
https://lore.kernel.org/all/20260818151431.939132-1-panz.development@gmail.com/


