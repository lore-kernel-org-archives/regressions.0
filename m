Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62634405B
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690279; cv=none; b=S8GbP1ZyiP+SLYdpw9EekONG7f/BKxGxLDKgGe9PlbRh06km4qa/bFYQf63JIqpmr3BEWHeCOCR6qB319JCMKF5wvp+hTnfYSbSqeYckVvkN7JjorCTnGgYzpCYeE9dFYrtUFbcydDUbBvGC5gGzoJClAMEDfdUAxda4M6drE0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690279; c=relaxed/simple;
	bh=ilT1bdJCbHOmqDlxmfUEhwn+Mc4YdXH2FbNvU9PT8xQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LsI4LXgO1TJC6d7VsDqDlcz8mfcB8PxWUmOhQd34EShkZq9D4kl57YrDywh6E3xPtqB5C2U41Jr1f+HxiIeSQOo77hNTcXZVujz0EpR4EZFpxiDPB/R2GVvDSD2Ko8I7aF8V5p3EUJ9YBMRSg7OlQn+EPIhHw7Hn7M+Vt31NkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XeijKydt; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XeijKydt"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fzm0Y3RwJz87lw
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 15:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776690269;
	bh=ilT1bdJCbHOmqDlxmfUEhwn+Mc4YdXH2FbNvU9PT8xQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=XeijKydtoP1dqvqz7JVus95DY+PLbl8Ks1WPy5s9gXOKulO2fnbvUU3x/EQG2ZoHE
	 mXB0gRQlgT7fNRPS6yg6bbP7H5OV4PepD7gVWuWAes2qSvT4IOtRo57SLtTc7GPcNi
	 rKdoTB8M7xCpohETp/ed1JWDdQRHJ9tr/hug3GmSFHmP7uoKrOEoVpCMosWmQF1fg+
	 DPS8R9zNDxIcVq+X+4FjRf2nIQ4NLmq7oFs2MldNahMVHwTeLSXhNAicUREj2Xkp5d
	 1xxhgCfk8DWchEdKGT6HvcDoPIaTjetfa+EC09qpHrUm/uP+8DvteaPrG4WhO0s5Kg
	 /cLUHmBx/I8+w==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fzm0Y2lx0z87Mc
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 15:04:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fzm0X5xK3z8tb3
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 15:04:28 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0472E617A7
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 15:04:26 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c62902af-f39c-4c28-9480-ee7bb72b2fa2@leemhuis.info>
Date: Mon, 20 Apr 2026 15:04:25 +0200
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
 <177669026717.1048889.16615185657918379002@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0472E617A7
X-NC-CID: 2IRXQM6X8iY5eRJYh3JPTK9WCWYiE7VbwixVqfURPDghbA6jMEI=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/f758f4ff-4d54-4244-931d-38f469c3ff14@moonlit-rail.com/
#regzbot introduced: 4fc3a433c13944ee576
#regzbot title: smb: client: empty CIFS mount point with vers=1.0

#regzbot report:
https://lore.kernel.org/netdev/PH0PR11MB55934A1C9A8C35B1E751C247CD50A@PH0PR11MB5593.namprd11.prod.outlook.com/
#regzbot fix: Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"

#regzbot report:
https://lore.kernel.org/alsa-devel/CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com/
#regzbot fix: ALSA: hda/realtek - fixed speaker no sound update

#regzbot report: https://lore.kernel.org/lkml/ac4lw9tTNn4baO_h@altlinux.org/
#regzbot fix: Revert "drm/xe/mmio: Avoid double-adjust in 64-bit reads"

#regzbot report:
https://lore.kernel.org/amd-gfx/7370736.9J7NaK4W3v@timur-max/
#regzbot monitor:
https://lore.kernel.org/all/20260418003539.1862136-1-Roman.Li@amd.com/
#regzbot fix: drm/amd/display: Restore analog connector support

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221271
#regzbot monitor:
https://lore.kernel.org/all/20260416-wip-fix-core-v2-0-be92570e5627@kernel.org/
#regzbot fix: HID: core: introduce hid_safe_input_report()

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221332
#regzbot fix: 3d14bd48e3a770

#regzbot report:
https://lore.kernel.org/lkml/20260403191942.21410-1-dipiets@amazon.it/
#regzbot resolve: It's complicated, but as of now looks like this can
stay the way it is

#regzbot report:
https://lore.kernel.org/lkml/b397c5b34ed7484aad6e0acf7e1319c6@stwm.de/
#regzbot fix: 1f48ad3b19a9df

#regzbot report:
https://lore.kernel.org/lkml/68d1e9ac-2780-4be3-8ee3-0788062dd3a4@gmail.com/
#regzbot fix: clockevents: Add missing resets of the next_event_forced flag






