Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47C27BF79
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660822; cv=none; b=EFz4m3rzoPSz+RUAEXCrMLmbhfmtlaPKlhpz0xwr3ABnn38+FeMrPOXb8jqV/7Eb9ZTMIfBgReysMhfICr/swVTkupz+eMExx1xiLJ55eRMBJlQRkL6ea4fC1eMY11DJyZ3wexXgDGwIxStAkGrL5EOQnzqA0xpJMNFbS2xpyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660822; c=relaxed/simple;
	bh=NAonwxwUpojmpMApfWyP80JIRuBewFG/nWucH7kNcIU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=R1xqdBqdAbB7shgxYeFv3DX5TPLFJ2xiB2bKmtvXTa4iM9qzzUtNIjGoyAMkLcJEi8eLn/kY8+KVLmjG8ijmendfjRrR6xBNKGPIM4XHKHpZwo8tWzICM3cGoOvSTpHm0S+EQopWY8y1oPNqrHU4Nrp2xoy87ud16wZrrD+5uGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gS8AQqUJ; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gS8AQqUJ"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fZCdn0L7nz91wf
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 12:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773660813;
	bh=NAonwxwUpojmpMApfWyP80JIRuBewFG/nWucH7kNcIU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gS8AQqUJUDmKr1JP2XaFPBa6pIY4WG07A4vRPGFDibDYZOL052k6VDYhpKxLRmLkv
	 /DNyHvEAj+Aw+Nb8FU6LS9+t4pX5LFl6/WJjLOMygv8zkF3GolvMmlIBhn0GAGx56a
	 f0aWBnJIKCEbhkwLmeQaps36Pqqkl3zOt0qq+7zGImlHIQNm03w/JmYtbI0sF55Rpe
	 uSojGitc8IpFDLZWXPgYR20mfDB10UIAVIwIWrlnLy7tgx/ej/Z2xFbXO/9R37PrUb
	 10dvug31hHG1Ay5ktkB/YMnE0q4B1jff1DqKWC+OwLtLvg/gaw7hRrOSAl7k8ELOfz
	 C97nUuEvaC46w==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fZCdm6m7Zz7vVv
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 12:33:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZCdm1vMnz8sbl
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 12:33:32 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7A3F0617A5
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 12:33:31 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f81e6ac2-1e14-41f5-bcba-d495902e4ed7@leemhuis.info>
Date: Mon, 16 Mar 2026 12:33:31 +0100
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
X-PPP-Message-ID: <177366081166.1411789.7570350561823540999@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 7A3F0617A5
X-NC-CID: 7PMvGnBGe+D0w5I9itTUfmQPmOrVOhlE2fA5MPpckZyRTdYzo/4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260310235642.6d9798f4@plasteblaster/
#regzbot introduced: 5713127da855
#regzbot title: cifs: failure to reconnect on SMB server restart with
custom TCP port (not 445)

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/4663
#regzbot introduced: 58a261bfc967
#regzbot title: drm/amdgpu: Intermittent 2D OpenGL Hangs
#regzbot dup:
https://lore.kernel.org/all/20260311044311.10941-2-bugfood-ml@fatooh.org/

#regzbot report: https://lore.kernel.org/all/aahw_h5DdmYZeeqw@20HS2G4/
#regzbot introduced: 7e43e0a1141d
#regzbot title: netfilter/nftables consumes way more memory
#regzbot fix: netfilter: nft_set_rbtree: revisit array resize logic
#regzbot monitor:
https://lore.kernel.org/all/20260312011423.3492328-1-pablo@netfilter.org/

#regzbot report:
https://lore.kernel.org/all/170a3c247d8b94a2e5714ca0641a91511c9808d3.camel@posteo.de/
#regzbot introduced: v6.18..v6.19
#regzbot title: ALSA: ctxfi: Oops
