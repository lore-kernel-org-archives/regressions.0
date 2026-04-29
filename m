Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B93803D3
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445388; cv=none; b=nT2n1hw/XuqjAQ+SqBlhRtZEaj4Xkc7+jjJw+aSzkrvNqtWGHjUUcJw0GLaEWlNcqzSgh7WZb2syEoK26mv0oqRj+ZSR+uotOh/T6obWsXJ7JWbkQTWFcMV6kJft1BbtvWw4DRXTDx6xFQFy/z5l8pmRiJ2OMBnHAzSMpRP+56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445388; c=relaxed/simple;
	bh=KTjNaI0ST9Bl5mbCeC/PrzM8CDyuTpBXxzbiU8JSvA4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ebBbOWzFbZAwRhfOf3QGC6FJsQJXRzu51B49z9vqh4iANV29G1CDB2z+/pbvlZ0ymeGC6OF5jt8UIUaXo4WnuCf1wQyIIFjOL/8GrHGxaviQdve3kAjtc1Z8MZm8HDN0PJxjGnCL3b38WPmMFl5gZlY0pFA4WqSX3+A7FiFThdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EqVO0ped; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EqVO0ped"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g57Fr2bP9z3qYh
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777445376;
	bh=KTjNaI0ST9Bl5mbCeC/PrzM8CDyuTpBXxzbiU8JSvA4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=EqVO0pednnFGH2VqImE0udeyu2m59McYCSeVbaj7CwvjKC4sftVg1zXVLDV8ulu+L
	 1AIXaXeAcPjzmJ2O98v7KjugJudjiD9VGTTSF0v4+mG/UrOTj2QSxTMQ7TwnS9xcQw
	 OQ2+2PmLDTw0cn0CVSWr2NeNWIQgXnjM40HtmRBEdv8rUfkivLGiRrqKAaJQETzzhG
	 ydCIupdh+qF5G6ityxjmbe0zjv0/IBcYhUtUkcekOSvnamQYECmftmW7no6b5lOeDm
	 xI0o6lAXZX56wZRGLsAMk7jhTxPWqnVHJ8skiAiYT0x3nfKGxcHJqEeOX7LbupZZL1
	 z63YznqXw1y3Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g57Fc5Y2Zz43pW
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:49:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g57Fc20b9z8sbB
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:49:24 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B1CC863407
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:49:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1fc3caa7-5a69-483f-9527-5368975d0834@leemhuis.info>
Date: Wed, 29 Apr 2026 08:49:22 +0200
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
X-PPP-Message-ID: <177744536389.2287848.2063549001431898921@mxe9fb.netcup.net>
X-NC-CID: X45SOpxK/c62nerMHN5AtLzxPNKuX8PH7jU6DBkSrqh83s7iW2o=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260404-thoughtful-placid-boobook-da26da@quoll/
#regzbot introduced: e948cbdc41d6f4
#regzbot title: ARM: dts: imx: booting broke
#regzbot dup:
https://lore.kernel.org/all/ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com/

#regzbot report:
https://lore.kernel.org/all/CADo9pHjr-zZ9C3+026y5+XOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
#regzbot introduced: v7.0..v7.1-rc1
#regzbot title: Too low/broken backlight with Linux 7.1-rc1 on Dell
Latitude 7390
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221429


