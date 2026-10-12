Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A0314D1F
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797372; cv=none; b=n9w4W/4qWERus4/CYsrgGjo/aXLSJuXM5LAqRvXXpC+gRWCqlvqjL6ToftYaAVMqm/jyFbHboIovPDPue0wPdyH15G7RRS8fPh8U3PGIn2IWdEnh2ZwDacOxmSVstvqWbqzU1AyWXApAJ6OqRHuFIwxVq56AIkpHCdhQyvljNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797372; c=relaxed/simple;
	bh=GiYKZwKicQfpDucHXmpw3zfcGdRte5J8W6PuREJCZh4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=IV0tOrLz1pB/SPnm8wjlxMchH0MNFcBZUkeMg7ZZyfgvYK6YwRL8LoxalDcVk+kI/9Q4Bmhn3hTjbaZyzBI4kTwnq6qbgzc8rxrUgQpJJsiu4DcOvO/8RFlx5SOAqGgxW+Z3/HYmCyNwZfSToGRdN0NUBbBFukEw+THT+Teg4DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CPongErz; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CPongErz"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j3Bwm00xPz6GRj
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791797320;
	bh=GiYKZwKicQfpDucHXmpw3zfcGdRte5J8W6PuREJCZh4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=CPongErzG1Lgcpe9MIqMqF7C4QkXezrN0qkY3zD0oC1TOZn+XPYQMsTrQF+ufNN08
	 Kox44ZiuoIPgxc77pulD5R3SPCM3N0LREtWi9D3C8QSCILtJVrtgHVF5RKZ2EcfPN9
	 zulcdGt4a1Enit+6yvm81L7AOXsMAxTIrl+paCMkmeoDKLMBNk8l4Dzbuk0OROsopT
	 6FijfD+IZo0KBEAsp2IT3zT2YMQ4PS+/vVxRoamIAoJ/KE33reurJ1AaAHN9BWaBoU
	 Bo9dX13avjnL+FgvVyAJ0BYo8960xA6RJJfH+LmEmkDtrrrEaTnaBd8BpLBP6LAxF7
	 Z8tw3JfEVYvXQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j3Bwl6QQtz4y8w
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:28:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j3Bwl0wvLz8td0
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:28:39 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 98CF65FA6D
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:28:38 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8d51103f-c232-445c-90cc-32e1b4aa5073@leemhuis.info>
Date: Mon, 12 Oct 2026 11:28:38 +0200
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
X-PPP-Message-ID: <179179731879.2875485.9821727767759693905@mxe9fb.netcup.net>
X-NC-CID: kSb/BrR7Iy24dsLfw4MR5pAKnH1i/oEWHnJrmciSyg+WMQRevTU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com/
#regzbot introduced: 447cbe95ebb9

#regzbot report:
https://lore.kernel.org/lkml/010001a1222f66ba-0c745f29-d4fe-4862-93ff-1db2055b05fc-000000@email.amazonses.com/
#regzbot introduced: 82a81a7352bc

#regzbot report:
https://lore.kernel.org/all/7cc824c4-632d-49df-ae5e-cfcbb5bf76ad@proxmox.com/
#regzbot fix: nfsd: split nfsd4_copy into transient and durable async
copy objects

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5955
#regzbot introduced: 5f08eee9c3fb
#regzbot title: drm/radeon: screen freezes due to fence waiters hanging
indefinitely
