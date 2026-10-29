Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258254;
	b=kbtxazTs9mUb9qjHumZgdG9SnW/2tM66nsd5FnlqQHMGMLABtAMfLyAE7VcwhdajYhk/
	 BAMt+NI4zYsqnVgbhxogfutoUUwUXtu6uLCYW5gV/ctNu9eqNbFJj4nOgwnnZ0hNFkQm5
	 cU16OVPYM03x6aXiftNXut5/8RHiRn9Rt6sZ0ojx0S/+F8pn7YX8oEooV2MTSIktYflAI
	 HvOmLZcZlw+yWox7FCS1sEk+Jkjju+aB07qN1gPYvwDeDkUdKj1Pi1cIrGbGluSTaT8pm
	 Jx8JYAkfJ1GUzgCaM2cxu5N+W7ad4mFAtcWn0eCSLCJOn9LSiig3442m5jKZBYXunBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=6db9oh7/WHVy/QrnOBJwzRS8Xizly5Ed53s5Ygt67Sg=;
	b=2RraHwcfMbAvJcsbs4wAEN5TPQofYaz5QgzrcLBNnHYLIUbDx6OfPooWhHLbmH5bU/CC
	 p80ro/8w4KUDF7Mh+GlapdWfmua6dUrsNy6bIJOUAL0zMyzFRWSrT7mLY83i4w400mEC7
	 mBQZWStfS9HpOUx360vNT+IHx3TOecXSTVHj1l0WpCnlzWdWKY3qObpT9PsobVHDsTyCF
	 hnr9i63KCzlxLaaz8NIVPFS/FQkTdW9zcGGWbI8p08pO6m5ASl+x7B4muqSAzqYyRvHrJ
	 anHem9eO2bK1ew09Pv5CfL/xvBHDCdcQsyglCBOxDMbDqY7xOwBgkpSoUhkwr+W15QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=YUGbi+wg;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C45606A31A
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 07:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=YUGbi+wg
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jFbCR6ytdz6Ny9
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 08:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793258244;
	bh=6db9oh7/WHVy/QrnOBJwzRS8Xizly5Ed53s5Ygt67Sg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=YUGbi+wgV1KXZ2tGGj/DlplBf8Af0epHzi2/SOn5fTbDaqiEVdXMOPSsxTM3dTTFg
	 8/tq8E8jRxdinQTzdFTQHmdeHEgxy4OGR1kTQBFOLQ2mQo4u5+/jBTAUJWdfS1u5GD
	 RMQ+BO7DTJq49wACsbDXGokIbLnAwClU15KBW6iWL57cFP9YxCGdtALCsfKJ3wCjd1
	 jXL+12bul/WYkgTemCtzlxTRXB0tEWgJGbRJNO6kn3W2OAi8FpwKtbYaDNwwraCaVa
	 1unvCGl2dPX8E4NX7oxRhUKylTAh2YHdjCwxCDWFkJ4lJ7pmSIputHvnKwPXa2TaOh
	 h9Exe6plYN77g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jFbCR6Fb5z4xxS
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 08:17:23 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jFbCR48Ncz8svJ
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 08:17:23 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4EF985F984
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 08:17:18 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <cc3d55bf-a1a3-40e2-ba9b-7fc30a62f56d@leemhuis.info>
Date: Thu, 29 Oct 2026 08:17:17 +0100
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
X-PPP-Message-ID: <179325823849.917297.5216925497099807667@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4EF985F984
X-NC-CID: 6TAIQGMEXtNxzwZChTaQVD78iUUkIuRodaK6lkufkIfYq7hPaA8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com/
#regzbot title: arm64: dts: imx8qm-ss-conn: USB 3.0 broken on Apalis iMX8QM

#regzbot report:
https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/
#regzbot unmonitor:
https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/
#regzbot dup:
https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/

#regzbot report: https://lore.kernel.org/lkml/ar_AuRr1eaZzOfw9@baldur/

