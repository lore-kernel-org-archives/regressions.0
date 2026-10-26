Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001306;
	b=FfXokrq2GxFOSAgfCiv1xJdFYos3Wc1d1/Y7XAyblLpRD5HxzRrwOCGAozmhvqTxphLA
	 YC91dMnL3fqJDQimAP7S8jDBDjQHHwCf9aUX5/HFGLaxF8+unGb2mxyQw9gVdR7XZ8ThV
	 ZLI3c5vHWXsjHZGNRrHSV2M4mWUsThDqypkS4ZnGRLxVWPcIOr+NCD5IyuJBa5bnonqsm
	 fKa/t4pgrGsI6EFeTTPFS3uotLaVeLXN/gARjsGbjoBfJpc5ZZJ2LgEbrFYVp2+jyPwjn
	 QC/5j8GvGWU1EY9hbBBxu+x+/kbnrI9A8qKHty/e1BEnSHXkql2ROuTjqOJcc+FyKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=9x5LH/aniJx05nSs/s9Q1nS7uPsmh5KCJ6WR0LNUUdQ=;
	b=qf1mv1tYknt2xsI8hmkIDHUP1oCOAxnz4PJZwfhxmnEKVxCVkBHqxYT4qlA2E4cJZBVJ
	 Ax1rPjgZGpQ6UGFa7r3hwugHmFW60xQvuLy3RqdPmWUoDlxOXHfJGPZVGWzNjJZvJM2C4
	 L5dDVECc6twjbCVgmGYJ6MMXzVuUBLCt1mu30/esQkKGB0dQII3j+KsXiCLWZs8eXmaYx
	 1Atjp4IWMHmVGqZLe+CWlXof/Wm8cBBuSE6GQXcE7/Zty6sPHi4cR84LrI25JA8/xZsaT
	 pR/VGRyW5eHDgRK3CC4U1SSm3VB7oDXL8p8McRj0kcM16zlcIMUPrtrNRQDkXexh2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FMT1+OOr;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8068C606A31B
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 07:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8068C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FMT1+OOr
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jCmB86Py9z8g6V
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 08:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793001296;
	bh=9x5LH/aniJx05nSs/s9Q1nS7uPsmh5KCJ6WR0LNUUdQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=FMT1+OOrGr8AXLkqagxuR4uICZBLk4lAxQpz3YfzirLl8nbDPwSp1UbWVQHOwmUeJ
	 URJ+kNDL6fP+2GMuDP2tUWod+yzIvyYBrfG5JMjJ78LOHDnE7Qs9S/+CLTyhtK+cpQ
	 +D93vD+DQvfL/QRlpA/Oni4QkglPd1ti76OxTueGOwjTAIQ8hxhi+U87v39zW0UQJ5
	 H+zdWAJEoBWmn2PnNW0KleQK7tDCkSpwitWCR+W8GxGzk4uIQiMOeUR2dFwmW4GTMb
	 qgoMXBp0B3Ya58/w/VG8GGN+l3qKcdikfrrAE2o2tqDVjQkRJYF4jBVZWS2t5ADnBL
	 Cjv2NRfzDZQfg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jCmB85kqqz4xwH
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 08:54:56 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jCmB84Jqdz8svX
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 08:54:56 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DA4F75F9FC
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 08:54:51 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <43a2afe8-1777-4ef8-97af-20d82d76484b@leemhuis.info>
Date: Mon, 26 Oct 2026 08:54:50 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: <179300129208.1013554.2778544451357256269@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DA4F75F9FC
X-NC-CID: RDMjgYVKVuIuBpNeB2ETGL451lD1cAWHnvxhOfeyHRUUNjpSUFw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report:
https://lore.kernel.org/stable/1kU98bgDqqEMGUcpGahaBYlaPiP2ssSCZj1uIKq1MEaGpNv2exGeJc3VWzXxB8-VJQ1Uk62W19oByt2KC-v1bSA4Sux9fBhnlA_IHWjV2Zw=@proton.me/
#regzbot fix: ACPI: scan: Register platform devices for fixed event buttons

#regzbot report:
https://lore.kernel.org/lkml/20261011.cachefiles-partial-zeros.pchmelar@innovatrics.com/
#regzbot introduced: c990057233d10b
#regzbot resolve: fixed through an updated change

#regzbot report: https://lore.kernel.org/lkml/ar_AuRr1eaZzOfw9@baldur/
#regzbot introduced: 93b6c8d10fad3d
#regzbot fix: pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before
sync_state

#regzbot report:
https://lore.kernel.org/all/20261025122411.14550-1-marcin@mennemann.net/
#regzbot fix: fs/ntfs3: fix SEEK_DATA/SEEK_HOLE on externally compressed
(WOF) files

#regzbot report:
https://lore.kernel.org/netdev/4F0FAEB6-A13B-47F3-BFF1-C706686C6F64@gmail.com/
#regzbot introduced: 2640e6419594
