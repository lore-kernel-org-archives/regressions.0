Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D32C859
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156088; cv=none; b=ksBt9i+S1hgQzukEuJUVbS3rD8VMidjry2O6zqxntd548q2fccxZtq/wjxeGKzWz036s+lvwxCF33Clpg5r+mEy1KJaLeeH6sSZrf5vu8n0oJLtOwDpDYHAt7viM2/yYPOG2p5Ri0+oH78Ly8JNl7JV2pOMz/XEiyL2UyBrueyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156088; c=relaxed/simple;
	bh=ZYaCb8dZIh4jrOSauMg2AGUYLN/cOYOtWPhWiEKvRGg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qSoNhlpKgBh7m2UCYzwYdxnsNhqAtmsNMgW/34xJs46FREY0lYAjewjYBYkU4gOhxFdc2tBHXPOQFqS8Yl2iV3/o3pvClOmJa1jYFTK/eJr9/olWAG+X1LFj1mmnQtEihQ5LmFB350J2B/ZIaikh72H9+lewkyjgnGRQOmKskpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ihAhXtVR; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ihAhXtVR"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gB9w64qsMz7xcK
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 14:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778155606;
	bh=ZYaCb8dZIh4jrOSauMg2AGUYLN/cOYOtWPhWiEKvRGg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ihAhXtVRFR7PekDCjULMAfodSfE9jg7G6pqu+Llvjb+VLTUvU5+1bGYLh+82jPPDh
	 Nqg6FtGkG7oTQ0HZyY3zHeejl/LvsbMr5SZE7izOZFK0rwz6oBfpVbFbq7wMUz7Lpf
	 LrNrUK2U7tQwpEE4w95RrzxnSTD+GYTeOv4p2fko1T073MIsmLOXPNXN59bC6gUyac
	 gd5meJpOqLNg8GUOvu5dNGxdzYsyu+q2qeTWvyi0N6gk+4pxk2xXQELwxf7XA0bNnM
	 kLi1Oe041gfN/zJMTqS2BsSmMXMemPmiWppBH2g+15Jl7km4H6HvlzAnWggizft/NF
	 FRnRwUjMQtkfQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gB9sN30qVz4xyV
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 14:04:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gB8nZ54s0z8xt4
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 13:16:02 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 49B535FA20
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 13:16:02 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0ce20b9c-2d42-49e9-a242-1c0170418dba@leemhuis.info>
Date: Thu, 7 May 2026 13:16:01 +0200
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
 <177815256247.3283530.17135468318468785682@mxe9fb.netcup.net>
X-NC-CID: 9dJZGPlvDFA+Xkdtk9Jq4JOLLuNXnvJOe9OsXO4LnD8aEs/kE40=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221271
#regzbot monitor:
https://lore.kernel.org/all/20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org/

#regzbot report:
https://lore.kernel.org/linux-mm/6261958.lOV4Wx5bFT@thinkpad-benjamin/
#regzbot resolve: inconclusive: reporter never bisected and things stalled

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221262#c39
#regzbot fix: netfilter: flowtable: fix inline pppoe encapsulation in
xmit path
