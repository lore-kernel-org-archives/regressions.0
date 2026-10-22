Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659310;
	b=AUtoDdF0P6b3XfFkEhlxXt/QvEIe9dbSd+brz5V1QkzBhHtyRmt5UvK+dPUxA3VgLliv
	 nQYSKR+xIbn2S4FV/soat6pVoojpqPjEtK70f/kpjBQbMONS0Z9FInRMIs4c2xg6rMWUn
	 5kaIhCqbY7cljl2g6iV3NuYaMEUNATcB8PG0DVOLyM7KKVWjfBDVpHwFmpikN/GdweRVF
	 gq1Nm/mGTeALjvmqd5sxKxxJGyLShFmgShGv2OUb7AQNd6xQbdEsa5w7Smwh01xbHfACV
	 XfMC/BWcexa6DAytmed2cP22ZHTT2F/Zhj+8j9MYPd/qNlQGKwOG6ol116xcOSgLvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=mmGV33C+P57lZgYTGfHJXA3N3LtBNY3r1VXyfM3lXuU=;
	b=UyI4BXwKSnK4FKwuHEsAhWvybOzpo/h/5UYTj+YWzwfMt2ApJnd4xqjrLC+Li2gcD01B
	 jVzVprT/oC00yoa4mwm42K+MiM9cQja3d7Dw7u/yyAYMu1bwDqoUcfBxaykC1LfQq2rJW
	 0BgQe4nKTrofQrFSmOT0FC0a+Im3Ogx+Q4OgYlvhI6GxNCJwKoybA7PhW2mRgLHneN5r0
	 k1fW2QwCyKGyDxMZoXBdjvue4Ex0yIfrEEq6odpQRGByFIQAkmXOw64ARw9d1mOxs7H3l
	 6zt86cx/kFKpLnXXqcmClRjGlAJL6FB2ywSuyTGigKrheukmP1+q3FoXg+83N+hV9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=cOhd8dDz;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72760606A31A
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 08:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72760606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=cOhd8dDz
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j9KjP5RJ4z8Y2t
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792659305;
	bh=mmGV33C+P57lZgYTGfHJXA3N3LtBNY3r1VXyfM3lXuU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=cOhd8dDzRWGztY/MHeLU2/qSNz9NQLckjnE6EZYbgALMUlk6iDsSvLIzazK2rbviu
	 MMNtZrLpu/MV0e8MpqrBHLzUK7vsJpw2F/Xnzvi/fXIbfSFgXBUjuhAR338DxxWwEy
	 ujD4i3WJBRWmHImN0sY4GnW6/hW52HfyqOzdpoJwhM0KzviwtfPpqhPH9JtAUwRevJ
	 P4xyuZ23Y9Cg0Ra3BEQGX49LVj9tXhbe2hz0TAnxXtTRiN/4FYL+4cQ1M5VxRxXozo
	 VxhJJl0HlosB4gAcvqBONJWbrxC2A+OYBlDPlMVoLWPWd4Mq36Ezdz5tnR8Q0mblXi
	 k6YKDgifwYONw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j9KjP4kw6z8Y2g
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:55:05 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j9KjP3G42z8sgT
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:55:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BE2115F898
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:54:56 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <594a2a29-6519-4f21-9b8f-948bbe6ba15a@leemhuis.info>
Date: Thu, 22 Oct 2026 10:54:56 +0200
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
X-PPP-Message-ID: 
 <179265929694.1117401.17470492230351287738@mxe9fb.netcup.net>
X-NC-CID: xJ/glqVb0g5pr8PRePy0iwpnz4RtW/iTdSx3r/fsTcZfSbq9cO4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/00cb01dd3099$c82b66c0$58823440$@zadarastorage.com/
#regzbot introduced: 868f2f0b7206
#regzbot title: blk-mq: hctx loses BLK_MQ_F_TAG_QUEUE_SHARED across
blk_mq_update_nr_hw_queues()
#regzbot fix: blk-mq: restore shared-tag flag after hctx reallocation
#regzbot monitor:
https://lore.kernel.org/all/00cb01dd3099$c82b66c0$58823440$@zadarastorage.com/

#regzbot report:
https://lore.kernel.org/all/20261021131006.2101248-1-nigro.fra@gmail.com/
#regzbot introduced: 18dbcbfabfff
#regzbot title: perf test: tracepoint case fails since only the first
overflow is delivered
#regzbot dup: https://github.com/async-profiler/async-profiler/issues/1813
#regzbot monitor:
https://lore.kernel.org/all/20261021141736.2414170-1-nigro.fra@gmail.com/

#regzbot report:
https://lore.kernel.org/all/1kU98bgDqqEMGUcpGahaBYlaPiP2ssSCZj1uIKq1MEaGpNv2exGeJc3VWzXxB8-VJQ1Uk62W19oByt2KC-v1bSA4Sux9fBhnlA_IHWjV2Zw%3D@proton.me/
#regzbot fix: ACPI: tiny-power-button: Convert the driver to a platform one

#regzbot report:
https://lore.kernel.org/netdev/20261015092200.GZ219304@unreal/
#regzbot from: Peter Morrow <pdmorrow@gmail.com>

#regzbot report:
https://lore.kernel.org/netdev/20261014133951.3219055-1-pdmorrow@gmail.com/
#regzbot dup: https://lore.kernel.org/netdev/20261015092200.GZ219304@unreal/


#regzbot report:
https://lore.kernel.org/all/179258034449.241924.15241097267562754477@kernelci.org/
#regzbot introduced: 74ccc099f1ba
#regzbot fix: Revert "s390/mm: Add missing secure storage access fixups
for donated memory"

#regzbot report:
https://lore.kernel.org/all/d4aaa5e8-7366-461c-94b1-ccf3631c8bf9@6bit.com/
#regzbot unlink: https://bugzilla.kernel.org/show_bug.cgi?id=222179
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=222179


