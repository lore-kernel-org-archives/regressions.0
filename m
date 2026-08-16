Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691B4318EF4
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896929; cv=none; b=A6WRwARf0YS88jiUZ6svGNlXm1GeJSpE3M5r9iqSmLABjBWt2QqZYYddFgBo9t5xU1ZtIRAUIlfQBvKVb8NzyATWLZNLWrTHga68+HbAfUFwrtou0vo6Nm34x919g0tw9rVQf6EZ5b1XAGFrwgZHdHW31mD+hFq4DBOs7iCgrp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896929; c=relaxed/simple;
	bh=GBbv3xZDPBfdHj8mkEyFiPjVhFJHYkkXao0MqxHNgEI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EqosJC1Y4jI5Qhdy1FU0onrodUWelDlxq+GNb9gymQlw9EH0JyJv52buAFDoKSG/rt/ehz0OyTmA21lLwLeVSDhpw1LfBjeDC4sTlYz+mgJphX18S7hJ0JLGOiqwgMz53nOgiLn86qlCOJZYewJpjxelR29ndpsd7S4fM2Uxs/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cdOywFEO; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cdOywFEO"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hNLcr15m9z3yBP
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 18:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786896844;
	bh=GBbv3xZDPBfdHj8mkEyFiPjVhFJHYkkXao0MqxHNgEI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=cdOywFEOngVwwbCCPk6WnUHkSnHoZzg/WsltMqJxVyeM9GpYirc/WYnG0Sb0i3rZj
	 rUOPt8HMMZlzehUn57tWLrFoe3+qo5brYCLvJB/4/faIMNzHSzOJGeo6UKzKI5XgkM
	 lfNqQgyzxyGCigf6yqhpEounb0CCv0HrCXwH/kjot+sVDCt3xY6q+MZsf82Ct6MlUD
	 3O/6J9yVms3OI9XZIC+q8IniiboTMlOPBRGDNM30lAtkd7d6Q/FeaNRz652zlnO6wj
	 r3oHwLIUUtC3dKnkXos11kVkshcawhmHOoyQFf7YHudO00ZzwpUatVYuXfCTdJcW3H
	 Q5YPOK8TNoSLw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hNLcj0YPKz4058
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 18:13:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hNLch2njQz8t4D
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 18:13:56 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D4DED5FA5D
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 18:13:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <da96c328-eaeb-4194-8162-c7ccdf2897a7@leemhuis.info>
Date: Sun, 16 Aug 2026 18:13:51 +0200
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
 <178689683204.2228028.16943623834903293377@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D4DED5FA5D
X-NC-CID: RG3+SK1zMrbILGKzhaA/jJaaOorB1VVmdnrA4z6niuR4VlnSMn8=

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/CAF38RzLOUW1ZB1f%2BQ2f9mhnYs%2Bt4R2%2BUQA1PCihz_FKEu-nSew@mail.gmail.com/
#regzbot introduced: 2ee8dbd880b14f
#regzbot dup: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8550

#regzbot report:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8550
#regzbot fix: drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in
bxt_sanitize_cdclk()

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5562
#regzbot fix: Revert "drm/amd/display: Fix backlight max_brightness to
match exported range"

#regzbot report:
https://lore.kernel.org/all/CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com/
#regzbot introduced: dd29c017aed6
#regzbot title: sched/rt: multi-second PI-boost starvation in pro-audio
workloads on an ordinary non-PREEMPT_RT desktop
