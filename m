Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306535;
	b=OiCNVp3Fdsz5bODuEBlJ0QE+kehZanLSblK9rJVNy/PEBAWhnG04iWCkpOl5s/PEsXhJ
	 YjhVdC8Bc1ABBNhDO2HoqklvEH4LiYrdf69n/U/1fGW6AxGccRe2qRQZbnMtNPbGCKLKi
	 PBXafODe8F4U1UDYJAHYh2JtEX08bI/ragUgIn+hCa2eHD1joBPrscciD1Xxt29P/Bu50
	 E+ayoR2kG42UByKwEUlpt9vojHvs3OuibUPNdxXrSML+phrnhm3mIja3MS+8fkbmismoJ
	 4bU7uLArH9K66ppeqUevJIPyXys/iv1kYYEsrPsQaCCCWgYOzX8JMEpeuTv5cnyVRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=g9KFdsvZ+DFchg+fSmvNLKYK4xTv344AAxY9w7qouBg=;
	b=luAFGwX1vNM9apwNb86Ly5mNOaf8K1q+OTZlOqJlf0fQj5njpWsnRexdp58jvtPh6Vut
	 h9g+cvlemOy6FWwpPLzKk66PMSJSbGhktC3CzhqoULoKhyUu7HCqs0BODkgcI58AQnV2G
	 nMUcE7Qjt0gxk4dkW0JGQjZ+4HD7EyEyaNbbLWkenEOBpCNPZ8vfSV+R1tQYSt1g/BWMV
	 aFBSAavgi4hj+H2q7vmfqmlZc4Tu8+aWxFhQ7TTqbJA0y4iNLLySgY47iG6RRxYBRkT7E
	 +8MNg4lwKBTuiHyeNrztAG6XVef1/i28GQSPMIOBLI16mqtxD4IN8WzzteOSyGZ14Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=gXXByrOb;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD7606A31C
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 10:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDD7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=gXXByrOb
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jP2t62fpBz8Y5V
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 11:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794306494;
	bh=g9KFdsvZ+DFchg+fSmvNLKYK4xTv344AAxY9w7qouBg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gXXByrObnO+d6OUolYRgxIOLuCZlvF8xDGn60uMQPp90naGARgK4sfQebvVtPubTe
	 d8ENzfGV9XVIOpxvjBWSWQCn40ZXinBSgFVAic9rV5SnlhIiNnDQ+oJQd0A6pzcAt0
	 yh6OQZ3UqKlAwrXIcrXy3dhLh4LNNNWL6sDDz8jB7ra4tPLZlZZyMcvjooiFaMcGPK
	 fa2vweB8aMPkLw65sesHmk+DxKQan8l5gyFhIgcEYQc4q0yUCmb54P7oG2QfjVxVsv
	 czcaNaurYbxp+9iFAlLoYeJKx7fNXiNHODDX+tcDxLvaEhx92vFyuidjUCmX4BldxL
	 Sirm1yPoKOmgg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jP2t56Bc6z51pb
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 11:28:13 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jP2t54d3Vz8sbs
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 11:28:13 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 080B85F9EF
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 11:28:02 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c391fb18-5c2c-460c-affb-c9dd3dd01783@leemhuis.info>
Date: Tue, 10 Nov 2026 11:28:00 +0100
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
X-PPP-Message-ID: <179430648227.883504.10664628949232150453@mxe9fb.netcup.net>
X-NC-CID: c21iS7gWMhmEGQOt/xp7UiCUZJxhbrW+IeNzp9NCj5I1y49sM5g=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report:
https://lore.kernel.org/all/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/
#regzbot unmonitor:
https://lore.kernel.org/all/20261103200226.100989-1-arpith99@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/20261103200226.100989-1-arpith99@gmail.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222249
#regzbot introduced: 4dd10fbbeb9c33709edc899
#regzbot fix: ASoC: soc-core: reset rtd->num_components after allocation
