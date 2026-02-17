Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A091D36D50B
	for <regressions@lists.linux.dev>; Tue, 17 Feb 2026 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771348031; cv=none; b=igY4Q5ZmOp+Tshm9r50pwxKKtSBZ/QNA+PTrEWvm/fs3y1C9gzT57c/X5UczYENMqdyZralhBsPHUTlqIrjYndeW6MT2tt07IAVu8OZZ5csWKwib2lZq5e5tLvD7Hc5R5a1NQ/HAADkzf3/P21AtbGfzHrHoM5bt2FcrcECiPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771348031; c=relaxed/simple;
	bh=I47fkPsJEu11qbn9NYXITUqOyPTQYt+IFwSCY9/W7rg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r4bPfaVqYvGXd5drGpgE6FSrWt+dftqdxq21ULG0i/WLlYjA3U8vWTnWpeC2cbSA1iVWnkXX1EE6V9oYzw/2qBtfdiGeFGjXziNPgqaMeFlBIWlTcFTcBwP26WeAr8safeChgQVoJ+tT9cMfLSWQHS3O7kjJbvyVh1TPFzVBZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=N0taJP0P; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="N0taJP0P"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fFmK22cqTz8hlp
	for <regressions@lists.linux.dev>; Tue, 17 Feb 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771348022;
	bh=I47fkPsJEu11qbn9NYXITUqOyPTQYt+IFwSCY9/W7rg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=N0taJP0PPepUjlmLT2YIwwKaXJTvNE1GWhlYvO9OAiy/VxErcLIkftiwOSiYkNaSy
	 DE1iUF9NPXMn1bQUHgA3ST/15nGOcSV2QyZ3xfNKhJ4wqpqCN2DjpO2Cq1vTy+sZLi
	 TX433/sm9s4j7X9qId05Pp6MWgg5FSlVMOjwVE9/S38qqU/ZB7ime9bKIkD0o+tNZn
	 raHrpm2Jbi9n76uptUTb5Q7IJJS5cP6rujvBTGhx/bHZOar8BcvQMO95+5w4xIh4hx
	 EhYi8CK2KzlEEmcDKBk5I6D7ElPGZUdgI0ZJxXXXWbyQCvOIZbzfmT/HCwv/qZcrTM
	 0X/74CI2EeoXg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fFmK21tDyz8hlm
	for <regressions@lists.linux.dev>; Tue, 17 Feb 2026 17:07:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fFmK1587wz8sbW
	for <regressions@lists.linux.dev>; Tue, 17 Feb 2026 18:07:01 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 048C5673A8
	for <regressions@lists.linux.dev>; Tue, 17 Feb 2026 18:07:00 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <346323af-dd31-4851-bec4-5da1d9d5d04d@leemhuis.info>
Date: Tue, 17 Feb 2026 18:07:00 +0100
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
 <177134802117.2261257.17261876790688685564@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 048C5673A8
X-NC-CID: avouJR04o+Mz8yHBjh4qsTreqdINC1OHhe0/72jJdyZrMvlX7YQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/8ebe4d76-eb07-499b-b140-1f300c1b8d7e@prnet.org/#t
#regzbot introduced: v6.18..v6.19
#regzbot title: many crashes during high IO load with a Kubernetes
Cluster (also from v6.18.9..v6.18.10)

#regzbot report: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
#regzbot introduced: 216c12047571
#regzbot title: gpio: swnode:
#regzbot fix: gpio: swnode: restore the swnode-name-against-chip-label
matching
#regzbot monitor:
https://lore.kernel.org/all/20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com/
#regzbot dup:
https://lore.kernel.org/all/b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me/


