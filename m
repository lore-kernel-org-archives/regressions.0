Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2C399890
	for <regressions@lists.linux.dev>; Thu, 21 May 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351117; cv=none; b=S4SIqbA5YQuRKcDg2ttQ5S27Zm7sG8zMx9bjwS7LejDO4dOXZRqT/jeJSRhfX+ogjF9OsGT04E6CcF+vfzvPMdUbFp2lAFlbGvi0eXMYhIkYRaHejpkTqAHZSiW4tRlS8lQWUs7WV7d7v9scb8GdZjBofdERVBMF78QOwt2vkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351117; c=relaxed/simple;
	bh=OzNe8XTIChnBsXfvb1MDqrbBJ2P0nxvQlt+xbKW1hRc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=AiG1VYX1TSDpjoM4AKvPJnTHkDgYYG+CjREyJsioeF3tPHkjZsWgexJ/H3eM9lAR6/ntpo/+5fu5ELYT4PFxv7P3I91XZKp06owFN8skImEjUwWv0khytbSGls2pmPTuk9LVhE98OpYmMrV+7WnO2V6j19XuWmjgYAMhi36Xmxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JUh2HP7t; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JUh2HP7t"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gLgvn5RSPz8Ds7
	for <regressions@lists.linux.dev>; Thu, 21 May 2026 10:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779350757;
	bh=OzNe8XTIChnBsXfvb1MDqrbBJ2P0nxvQlt+xbKW1hRc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=JUh2HP7taiBy1m+MhzyDH4zW4jX/n0roiZhDNBtSzp4BarvYrIYX5lESob15FtbXl
	 fy8SQ9cX/JKA4US02OJHLKv01bTaMWiZwp0QsSahmXQbY8PpMAlmmMYQ0LPOX0lEuf
	 l1d11D70YSGMuuAFR2VALvcmzvA+b96hUwDQ3HnMKefYTjn2o/eUkTkI30IylyeYjg
	 m5bMJbTz7nY5WFWWXgq4cjgSdq86yyIDLJ8Afoc5U9fC6anAbvXNwXkEQ/vujE+FFG
	 RqiTi4LVme5ihqFaETrlCKiwdSxh7s7l5uA1OP1GTviCttVaAALWyxh0m4lPM6Bej5
	 TdzQ3JW5NmqCQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gLgvn4lH2z8DqB
	for <regressions@lists.linux.dev>; Thu, 21 May 2026 10:05:57 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gLgvn3Ptqz8sb7
	for <regressions@lists.linux.dev>; Thu, 21 May 2026 10:05:57 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A3E4A60150
	for <regressions@lists.linux.dev>; Thu, 21 May 2026 10:05:56 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9becfc4b-78ca-47c7-a436-ad293e16bf85@leemhuis.info>
Date: Thu, 21 May 2026 10:05:55 +0200
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
X-PPP-Message-ID: <177935075683.88266.10683555275051050553@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A3E4A60150
X-NC-CID: kbUZFqR300DlUJWUc7nMu5eMh/Qb1TZhOISILGL4cF2xm2YPzdU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/afHNg2VX2jy9bW7y@piware.de/
#regzbot fix: 93618edf753838

#regzbot report:
https://lore.kernel.org/lkml/177349610461.3071718.4083978280323144323@eldamar.lan/
#regzbot fix: netfilter: nf_conncount: prevent connlimit drops for early
confirmed ct
#regzbot monitor:
https://lore.kernel.org/all/20260514141628.4636-1-fmancera@suse.de/

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221547

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16043
#regzbot dup: Revert "drm/i915/backlight: Remove try_vesa_interface"
