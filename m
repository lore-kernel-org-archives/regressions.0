Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7F4A013F
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072585; cv=none; b=AQ6zR0Fz6XcB0vrfHG/ZnxHCFutTNMhPjyQg34HRLwmvAa4f+Gl4FWAA4JwDnnMAMgjpnRWXMyq5BQVypHLA82axlqkKlLE5gMc7r0QJstzPspr8exhahJZCkQ9QmD79TRmgXbLwYXcO9PEyQnMkFeIyJYDB6TWyxTvMwyKXYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072585; c=relaxed/simple;
	bh=2L0t4kVraLLdpF7JDzifmLsibRnUOIwmhs9MgRBLxOM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=g6csyTTp9BLp2RD8eW1NrXYANUtXiu0a2Uv0+rvzt+/OUlLNp13xDaJL289Xjs0ra5MoCmdeyLk7Ny66roxWS/BSe8tEz7R+/sWH7uzqwetQFx+ozP8iBSnfncfkn0G4np0R6Fceb7ZxXdvFX5avX2h43+Qu30oFugze4/ihfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TJBCND3r; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TJBCND3r"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4j58cK3kc3z8cnM
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792072273;
	bh=2L0t4kVraLLdpF7JDzifmLsibRnUOIwmhs9MgRBLxOM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TJBCND3rWg8MjeGzBsSH3HGn0D8ou9u8JLEu0m+oANkJpwDLy+3KCjdTgUfq0qotr
	 yTJfeC3Itt8kkMC9b1oHPdTABU5TrN7+dQULOKM7P2+8zXrzwLUelr2stmajqPaPLc
	 Mc24ELs/YKyOPg7rZ9SA4hywzZz51j/Ed/l04us7UppDbD1ctj9ImLp4wj6JDcLr9/
	 36rLwrSBZ+iSryFU69XF1QnvU0oesXVrjaCJ4tW6cNghFrXLhPbi4JtqFneU4lJLb6
	 K7Uy8UGYY9GxSt6eDNiY+XZC6BZvGzvvu8XFJFGqQ5Hp1cZJKZdpc5rpEms+ipO87W
	 3UNcHnMcwoGdQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4j58cK32LTz8cZb
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 13:51:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j58cJ6pJFz8tdL
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 15:51:12 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0A0105FB4C
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 15:51:08 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4c3f021f-233d-4430-97d5-9b6140859301@leemhuis.info>
Date: Thu, 15 Oct 2026 15:51:07 +0200
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
 <179207226823.1072969.15136131306635905528@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0A0105FB4C
X-NC-CID: KppUdmUbZBd7yjtqiDFr1jC0lqYN7ko/ImkA6RtIaaCjaB+p5+c=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/179173732257.29426.7905170638383807320@pm.me/
#regzbot fix: i2c: qcom-geni: Restore the source-clock selection policy

#regzbot report:
https://lore.kernel.org/lkml/20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net/
#regzbot introduced: 910b828b22b7b91054b

