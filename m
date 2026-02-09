Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C633815E4
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 17:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657135; cv=none; b=uY2+CbjFxAY02FSFJ5gg0Z/4A2bggtWXdsKPlu8bWjXKeZOWlHurZHIsYuTNld9eQrJHuXXFPy5s0Onowr5s9eC6Hl7Qh8Y8+jpYiOf6F9dagRSuZ+PVnXcBF2WuaOvM3yQz5ZIQxNskCLDU8B2STUJJd+7kTeLXm+CbccpR5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657135; c=relaxed/simple;
	bh=8Oq71d0bB3HEUC7iXLLH4raf8HRUo4372I+QmBWcB6w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Mc34FHd2H5x3OwVfD8FaCVd1wl/02AOgnZ70Tv0VdeeS+YxygcCm5JrO1xjAhKBuvA+XH7PCLlF4S2LVL+H9CPWdlr+LgOPLlBQ81UcOMOonvj2WjGfww1gqzZHNfzLgskVSdvkbaFYnWqib/uXaeSIaH9xiamzcJkS/sN4qzZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A00Kti/v; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A00Kti/v"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4f8rpY4CQ5z44gr
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 18:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770657125;
	bh=8Oq71d0bB3HEUC7iXLLH4raf8HRUo4372I+QmBWcB6w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=A00Kti/venGDu5HrpEWy28NRs+2la8lPO3R2ZsdSBAUlFk/NBdhX4LNYpnmTM7ueV
	 BUDt6uDtrLxCdZI2e3W46pUeiqkvQAh/GdX7pwgpNXw/ydXzKi9momhSrayDteRNd+
	 e4+nhc/3FgyhzbjfV4jyIKtEc80XhWLUDpEzuyyFKRbsJGk6yoMzJb3iM0rQbiE/d8
	 7BXLcNzrn5g2pmE5RNe0eJ62kH6uC6pKoawkkW2hVofJ5xg0+Z5jj/N1E+9TNQVPCw
	 oJ1OaUI1gqH1JFvRmaaSjtSYTqoC8BkJXmrkH1BuOqjMM414FnP49BTABK/W5VfP4w
	 oHtsaC37nV9dQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4f8rpY3V2Qz44gn
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 18:12:05 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4f8rpY1lzdz8sbC
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 18:12:05 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7FAB6675C6
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 18:12:04 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3bb3a88b-bebf-4a8d-bd65-aa3a9cb71a74@leemhuis.info>
Date: Mon, 9 Feb 2026 18:12:04 +0100
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
 <177065712468.3407723.12333652991950216720@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 7FAB6675C6
X-NC-CID: gqFk5OZ7tJCn1k7IemNAuoblAsk1kgGIn6lxkAfmzJk9T8tJ+/w=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221023
#regzbot introduced: 2cedb296988c384
#regzbot title: mei: me: mei_reset periodically causes 5-7 second
resumes on many systems

#regzbot report:
https://lore.kernel.org/all/CAH2r5mugbrHTwnaQwQiYEUVwbtqmvFYf0WZiLrrJWpgT8iwftw@mail.gmail.com/
#regzbot introduced: 62089b804895e845
#regzbot title: kbuild: rpm-pkg: test builds failing on RHEL 9.7
