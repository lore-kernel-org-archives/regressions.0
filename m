Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15E3C199A
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401282; cv=none; b=ZCai0gZQRLUPQF0JC/2iN5tmHmVj6ZIxWkD7mxiH/XfWJW0LjRl1+Sty8B+2rRY2X71EJ0f7F44rQXKQkWY1QKHqSyuS1RkarzeeyA+7axpJV3iWmR/Hfpr7LGmDaE3PuURh1+IciOHB1mJKovqHgNfvZXdUEo7yFRBM2OXZ8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401282; c=relaxed/simple;
	bh=l0lB7zCjgrnzIkIRpJpfrjpB3RpBNdOqJmrQEWLjo74=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PBNyxsxDqCUJbh//nRcLc52WWxHretNVN+mdVZ8oUOlz9f9GYKRghLvsbmPAGtXoRzlWamSOAnG5hUVsph3HSG5A47NGRD/QyFU8Ea3vBm5u3t3Brgq6aBntlxosPVWV9vApOTmV7uPfjKlJKu7HwYQCE2onuzGih5/lvv34g/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Xc26mxEm; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Xc26mxEm"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gV8Py1tsxz3wDf
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 13:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780401270;
	bh=l0lB7zCjgrnzIkIRpJpfrjpB3RpBNdOqJmrQEWLjo74=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Xc26mxEmBHjBebqEW1xj7U99nr55iSCjOrXbQ/Lh3CtBH/9CLqnZmrijd6fF8xW9+
	 Kmi4hyROKYrdyKECJPkKZMcesdYBEWYqMDuGc2MflIQZts7ARlm9ZzNAfXciAn3OkD
	 xmwxd03VY+GwuHDW1gTYbi/ksjDF9vy10LCNdY2l0Ur88vX2hAkI2waEyDQeTruDNP
	 EV1pYI8tmBQvObhy4DBwhAuHCtVf4EZoXYwSWF6GLLE4T6QCAjvuWhvhgOTLkqj9i2
	 iCz6hZt/7A57u/CF0aISa7huic7RZ+A68jjyUwZ0OPiDAoW9W8J+W1H3hjEE7znTGa
	 cX1eYwDewG5Ow==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gV8Py17pMz3vQP
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 13:54:30 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gV8Px6V61z8svb
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 13:54:29 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D595560345
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 13:54:28 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <871573a0-79e7-4d0e-95f5-00bbda58238c@leemhuis.info>
Date: Tue, 2 Jun 2026 13:54:23 +0200
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
X-PPP-Message-ID: <178040126905.4083151.572435402380696237@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D595560345
X-NC-CID: eWEAvKAsLLHLGbeEQDfR/+4iJFpvHnf2yoUSdErsBQKA00Slllc=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260602011949.2825852-1-rafael@rcpassos.me/
#regzbot introduced: 4a58ae85c3f9
#regzbot title: HID: input: Oops during boot
#regzbot dup: https://lore.kernel.org/all/ah6vRH9J9LSvnKWW@mail.iam.tj/
#regzbot fix: HID: Input: Add battery list cleanup with devm action
#regzbot monitor:
https://lore.kernel.org/all/20260602030519.3097058-1-rafael@rcpassos.me/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5336
#regzbot introduced: 66a80158aa2a
#regzbot title: drm: amd: warning and suspend problems
#regzbot dup: https://lore.kernel.org/all/ah6q-k5wvRbW6k6e@mail.iam.tj/
#regzbot fix: drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on all SI
#regzbot monitor:
https://lore.kernel.org/all/20260525112204.12604-1-timur.kristof@gmail.com/
