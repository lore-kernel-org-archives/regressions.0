Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213351;
	b=EXiy12vZPXhAm2nqL7WLMyfD3MVIgyWeuScUDE2N9ueQER97D2qBfpGOb2orD/2kErVX
	 Heze37MQr0aN2QZQQ0fZK8XSorbO4A69P4OW94cNjFPxS2u6BkD0eooo21GEKKNAKN+Cq
	 paP8LVdVKsEfFw+l+AzT3AcFsX+vd7qG9Gd7ga4HATPIHshV4bJ2GqZBOFqFLEWClNDDq
	 cmUUMXvVExyP8SCRfHyF+ueSEn+90/2nlpTFRdASOcBlJu5N+8rMIvFrWUEpKqTm7oHuj
	 TTJTv5TMCZHK12UYblhZCIqtjq8YkrJYIv1p2uBt+2Z95FAKuN/Z4PKJ5rzHU7UonQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=nXBFiBC+0J8HIk2FiYDb6JD3hEF21uJDf7rKf/IMny8=;
	b=Lg43ZNhtK9micBCaFm/vbErVN1JNbQng+W5cKp7vWMV34wQjIn4x7gm2bRZG7Tvp/RVm
	 Qrs1HyoE9uoyTZcuL0K3rJVZTbuVrGVZoGz1ZRXQynf1NXm4uapXIpljUTdMx+yg0fiqR
	 KzLsSJlPzhzOnwiIh0XKS8CmWkZBLd3Ok4sY3Mo6LWcZ5aSmtfh3SvB2IhoUrzsPQZN0h
	 3XDlEoyUbcR4fAT034vpRCBxhjOHf/qm7hKAuqNDO67gdR+m1+ei7KhFktCVs4VFEcqu5
	 iai7lcKzBDFZg4RydhhkWN3hV1ieWPTH3hNE/PK1gRmAUwHm+IynA2iAg3iYHBl8c2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bgW7an4J;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87C606A322
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 08:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE87C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bgW7an4J
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jNNQN2DSfz9Dc1
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 09:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794213324;
	bh=nXBFiBC+0J8HIk2FiYDb6JD3hEF21uJDf7rKf/IMny8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bgW7an4JgpXAzdkZDiHS998sPvHTqq+SZPUBWAmSu38earzyPSVZNoJqwF3OqiPum
	 GSO7LgosmM1nUldlaTqlpLTpxAjcfY98C7DGbJ2XCkk88AImw2ngqtu+rF8zH+qrgw
	 PUB6heewwe4eLXfhkTMEbUm6UbAIhIwERm8R0awire7rp/acRxra/YPFquzBlwG7se
	 4fr41wor+7Nf3khXLnXfCnTTKkgN323oAOYLxd9DDjpIdI26QOAM2O9WbJfwshwJqL
	 Ic/yupkJKsBm1OkzrDMovGncm1o06cphbzjgBKPJGNjzwROoW7tmUTHLtcnquev2Xf
	 rdQVOU1pdsWcw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jNNQ95Zrgz7v8r
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 09:35:13 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jNNQ9457Dz8sb7
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 09:35:13 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 840345F934
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 09:35:01 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b33505a8-c87c-48cb-9138-e9c0d9c916a3@leemhuis.info>
Date: Mon, 9 Nov 2026 09:35:01 +0100
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
X-PPP-Message-ID: <179421330174.634325.2277517176874634514@mxe9fb.netcup.net>
X-NC-CID: fOIXxA2RIRlfwHDwz1ZP52OT6n4ddunE5CbKXZVBH+lmdHEiqVA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5762
#regzbot dup:
https://lore.kernel.org/amd-gfx/CAGxFSwnJYc03fN+XWU8oLW9EbXhmetQuj1s3-m8UdZHoBdGJ8Q@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/amd-gfx/20261014080523.186533-1-rezanikzadch@gmail.com/

#regzbot report:
https://lore.kernel.org/all/20261104072048.3486286-1-burke.cates@gmail.com/
#regzbot introduced: 1bda647ce61b
#regzbot title: drm/msm/dp: causes SoC to reset
