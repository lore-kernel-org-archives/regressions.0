Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804143;
	b=DEb0IvY47NMGW86PHuU0F9LbEJkUWNDgLEg5hnDMCd5gnxRqlooyW5cQ3GvR7K7DHWXf
	 /J2a2AHhSysCCAcp/Z5BuDHGuI0vC7/Ak7qaI2mi0uB5px2+j12ykdu+CEhP82NMbhM1D
	 4pHwBBX2xYP1UZuc3zuqp+CKQN+3uwzt1Bg97daJqqIF2VfyYLTxFU5fzhxOICgqYcek9
	 k7W8qfAbFSrlPM8SYfR85CX63OitBDYQyIuFoSUqCyJwkNNH53U7Rghh/bhHIMzLh57a0
	 PdVHjo7dxvtOb1xsfd4sIlyvHUCjduEeYzLP79QsHQoOr3o7TZAk52BPlRn9YuXms2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=RVqjXrKnuRpooyNlRjkd3vig/YxXqqffC2KjHFQKyXE=;
	b=boz3rXC0ICc6ai7Ahjx8fL4KscuaENXCpbnlsJGApDKtYAyEJaH2scDZ2h10LGL8PANm
	 V3yTLsWU/vH0Bc5q6hRApPmsO56QhYRZYX0Jph6UorxmTRa0vdyDnjU/22z7sjPOx014T
	 GyhHQoD9JzwgDFZfiZwfg8GI2ejfiiUP0YKOtcljpsgwGq8Yv3eJawAqpXVktU2YjJnrg
	 9QIOgiyeb0+lc+rh6+b5al6vgkBmlLe7AJ2/X5eaUeY6rJljDi2n8BGyEadYs/AsCy8y2
	 GZlYyUnQl90pUKwYZBgj65znDSLWU10EunryYEnOjo1MQLKf0TXFsHjhI3qxP5z7hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QImqVZ9A;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D85606A32D
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 14:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D85606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QImqVZ9A
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jKT4m2dsrz4TV0
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 15:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793804104;
	bh=RVqjXrKnuRpooyNlRjkd3vig/YxXqqffC2KjHFQKyXE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QImqVZ9A2etmqXiJ7VwioeXckB1x1ypn3wQjuVZuL+v3pWmBMxOvatsfLwsLBo6bp
	 u9gh1AG96OuH/+0D7o4MRvxxfjQM4R7pPiG8WejnLAmx/nbtpYcQnAXvJboWAREp6j
	 CeM2jvHhbnIR9AuZye6/u6zSpd+a6h73I/Cq1hUzcBR81TwSb/nFTuTofAejWizzEF
	 xuCy+x4X2lQHOZ8n9qpzw1JDexR3OmeRnDrAkFSN8aQCfN8Sah+M5EOjbL6Q3eqH/h
	 9XmkzdbF7UB06hnSaZYaKLJXxaXawJwwUonqCQtJEk1hyLXosI0KzmWwu+9a9U3HZI
	 S2tfOQs+UVg7g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jKT3S4TbFz3tRn
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 15:53:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jKT3S1tVsz8tk4
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 15:53:56 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 63E0B5F8B3
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 15:53:47 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <481ec417-d2b9-4032-8249-04ff889eab21@leemhuis.info>
Date: Wed, 4 Nov 2026 15:53:45 +0100
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
X-PPP-Message-ID: <179380402772.2615307.9660564686306993814@mxe9fb.netcup.net>
X-NC-CID: dqHeRF9DpZ9eEtcofK5UuUFC9+WfnrMxcFA9O8JUcnDP3bFDxcA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6083
#regzbot introduced: e6c5d36756e7
#regzbot title: drm/amd/pm/si: SI DPM stuck at lowest level on AC

#regzbot report:
https://lore.kernel.org/all/aaa3241b-4dc7-47da-8703-067ffc4ce252@tu-dresden.de/
#regzbot introduced: v6.12.114..v6.12.115
#regzbot title: InfiniBand P_Key tables do not get populated by the SM
