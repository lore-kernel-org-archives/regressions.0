Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECD3AC0CB
	for <regressions@lists.linux.dev>; Sun,  2 Aug 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672344; cv=none; b=A8XJLV6e1PBID7MK7iymK7oilewBro7K8fchiS/9ZKHQoG6Ro4pid7Q2ZY0WEws/NqMBqnuKGdg4iNvXyiODroDMpXclEzgYfHTNena8yjdBIAUgddhP2YesSe4jZqt2e3Vty8HiZcSJ63V0yMRRKocCInYCqoOXgsmbt5eaZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672344; c=relaxed/simple;
	bh=gWTUsSv/pS0yZxj+xBWXmVHBgSfEM6hXn/QzkX1KS6M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=o6W4QwTACjXWC6o7NnP3stAlWQnQ9xon1TOTSs9E8Y6Vv2cTAwj2RqBgKaq2iemTdU/czXsshLi9MgJfWm3qF6HsOLpfB4ciVqErYp6nkVDpHUusDpKFB8LasJk/KjoI1gQo6lDd9bxlZcJs39F02wOo3PPF0ee8J7IGDesxdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WNmEuRmg; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WNmEuRmg"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hCdmX3g8fz67jG
	for <regressions@lists.linux.dev>; Sun,  2 Aug 2026 14:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785672332;
	bh=gWTUsSv/pS0yZxj+xBWXmVHBgSfEM6hXn/QzkX1KS6M=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WNmEuRmgsMRKEGqv8OIo4QUY8MUkgtgSuWNEkTg3CvQDJRL13uKbtA1nmi6EPBych
	 kp+nueNkYhNFAJbCZn0THF4nujDZhZC+MDwJsGPLTqarwQfpApBpjLRGM7cdCthAp1
	 exmw9FcYKhadEw+dhzdqG8g4dmYZKeOixB5wl0nbXSgu0wKCycu0pX3zYcfb2KGKn7
	 pIG6TqIMkSgzJIqqzJaGyAlV4qg/xJASfWg7uM6DHj9eGMOpHdBZDMa0NaPbuc1F9I
	 yhc/NBoWonoOx4rnpkECD0ciGGq261RYUtSRVojUdwNDJJjwJulbpiapjx9I8cqxrR
	 Qm/hYr6KKakow==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hCdmX2yHQz4xd0
	for <regressions@lists.linux.dev>; Sun,  2 Aug 2026 14:05:32 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hCdmX1941z8sbs
	for <regressions@lists.linux.dev>; Sun,  2 Aug 2026 14:05:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8E1C05FBDC
	for <regressions@lists.linux.dev>; Sun,  2 Aug 2026 14:05:27 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ff0c9c44-76ef-4d06-aea2-7ee9ec2d8142@leemhuis.info>
Date: Sun, 2 Aug 2026 14:05:25 +0200
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
 <178567232774.1697473.15577550121173755571@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 8E1C05FBDC
X-NC-CID: yXOQzl8spI0bd7NKhAXyQBYpXbjE+YioiqmOdL1XbU1n4m7qnvE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-nfs/20260703102759.9626-1-achillesgaikwad@gmail.com/
#regzbot introduced: f71ece9712b7
#regzbot title: nfsd: oops with to listxattr()
#regzbot fix: NFSv4.2: fix nfs4_listxattr size accounting
#regzbot monitor:
https://lore.kernel.org/linux-nfs/20260707152305.15324-1-achillesgaikwad@gmail.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/4663
#regzbot resolve: apparently fixed according to reporter

#regzbot report:
https://lore.kernel.org/lkml/178362762638.911488.8564892548331679884@eldamar.lan/
#regzbot title: platform/x86: asus-wmi: ScreenPad stops functioning as a
secondary display
#regzbot dup:
https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/




