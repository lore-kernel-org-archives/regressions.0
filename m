Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC703AFD10
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081330; cv=none; b=KEXmE5aDbeeWn/AHMe11gmof84DwFmTuydGRJ8IMw0ky6/0Xt2h1uMq1d2k3Jdg7wz4nAXwFay0BFIJG4SblTecWpvqWkSXHppH1wWFOPG6NXLA7I2swWHYvcbTqBbehNwoK7P4l3ffJIu/DI5JrD/Q3uXcXriJVypjqZ/9yWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081330; c=relaxed/simple;
	bh=qJ1HQ+Vt40fR/hyLKKX9OmehTCDhyuwyObKvm9MG420=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=S8oyVFNOAuqiSzGwjulzHyqefEVWMJjgSZVRdZbyJIaC9snpXhqcuq5whJIBFeHmP7qHR95tjGhb//S29AmoXqnwtQraGKCYyY0iPEDxIAKyJxqQ2/RCdc0SPGb4SzWom4KGHaHI6AfKLBgdo0zJYzqFV4bUmZqQieT90cuKBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IH5ieNmB; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IH5ieNmB"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gZzvn3qQkz40cp
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 10:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1781081317;
	bh=qJ1HQ+Vt40fR/hyLKKX9OmehTCDhyuwyObKvm9MG420=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=IH5ieNmBBYgtf3hiTnYmS3Qq9GjO+pqgUEP9GARzh2lOLKnBSl5VEuf+sK9DPRzYf
	 3jqEe9QYa7OsrELHvV2cSuWLU8EsjioqsPRKz2sPCug/rb+Yas1C4snvZWzxL+CMgc
	 EO17+KNXnp++fZ2eNHJoc4uc9cNvvkOzmKMErVWqwIPvLXABiDPPREVAxPXawk21Cw
	 YIFZFFmdM0ubz/OqAYpv8fpq2WVc5vusGbwKiXqXrj1/cWdVNQ/c3OhU9XG69+Krnw
	 2F1Ac5w7xPkv4gKrWDqDLLLtLKCyZGAsHBag88MUpFUP41O1Yqlgac4rKYp+saQOPR
	 uflK+mDMV4Ccw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gZzvn344lz40NZ
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 10:48:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gZzvn0587z8t3r
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 10:48:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 37B0F60363
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 10:48:36 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0146b380-8da3-4b7e-87ce-909efa4225c7@leemhuis.info>
Date: Wed, 10 Jun 2026 10:48:34 +0200
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
 <178108131639.1815514.15111644060846830889@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 37B0F60363
X-NC-CID: m0Ca550MHstQh6ylXc2K87HxFQ4tbSF1xBGhcgeeJI+1+rzPrJ0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech/
#regzbot introduced: 76031d9536a076
#regzbot title: clocksource: Long boot time with Xen HVM guests during
PV spinlock initialization


