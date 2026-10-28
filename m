Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182281;
	b=R3+OX7SiMx7EIV/UecS/lQ8+3vk7oj+KTrEKu5Ed2v4tXIEvGWv+hrpBM2dhHOvGEBLV
	 D6AIAACLfWz/c/hbORl/NG4Ty75YPoXGVtXRi3L2mI2qHB2xNBIm119+gOmp3g4bbA2bu
	 kePdxXsMNwfG1mESJnVnM7snrPQxA/xOlQf9fMppDiaZxl8fEq3xT5E5y1+fTg7Dy9+60
	 tm8w/OhcUPZqnkMy2t2TIP3OwwuwFqjlHZLJNy5ZQ3tiaQKR2uzbOuqclewyxaceHeDYL
	 hMg8/CGU2a/yD9gER5Ia4ts3V4Hq6ysOpjgqzvzlw/AQT2IKwGHKLP5+nZC3TLr8JeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=JC7ENHgPyYkLkxK4VJ5n3NbFEr1vdT7paouVRp4uw7E=;
	b=FlpKdmqETzn2/J2SEPJvK4w/ZCmXIUwsKU4Bv4KvCYs9eCwmmiHNv1ZK7hNAuoxlR5tT
	 dGBlNL76kIBjB5cErwgUBQPyTvZwx1ya7Lod0Zsw1SI+IHuHKdhuhptV/QFflrEHMcO1H
	 O9guYwuXNxrsK7XNV4/GaPxQoWD8hBRHADqMV8DEdy0IaEmAfxoVN+Lbw1Hf+F5WOLjaL
	 O0kqYGjIb87d8DLUyMBoRBctGrswrvoESv7hn//GEKgOPYynj9ze5ICyQQ7yLkI5nNJLm
	 4GDLrQRZF7LqPMXmsGx4oJjFrtZhYC2In4OAYoux9YzYZAyfDWJa5+8yf0ijCnv8LfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eC7BbD48;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C5606A320
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 10:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eC7BbD48
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jF35y2vxlz9bfH
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 11:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793182246;
	bh=JC7ENHgPyYkLkxK4VJ5n3NbFEr1vdT7paouVRp4uw7E=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=eC7BbD4818s6Fddrl65mYML0u/yOOTuX5AYOlarc0ulz7W6GNI7a6KylNjTwuFTL5
	 0oymQnePvOiavX3/OZJI0VbPuycdbkE6a6Nvok9lTkfRODGbs2CzOL3fEGR7Sq/5n8
	 NH4SdbqvJPJfS41uc6J9z18h9aNRelAbEpG9sEmqMw+p3MtF9oKtq/nPBnY7F9bvBZ
	 a80C9wgwMacYXGRxvlxjZD3C0HgB2EioyfbLc8XZA6pADjaYSa+xPeqYZDkIbv5Qxk
	 EwCR+GptCWcJR7p9lvyUmWU4SULyFXLxqUDkvF/Ra44fwUCQOiQ7VWB1NmhKsd5zec
	 i6KOR9qx3qPnA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jF35y2BrLz7wl4
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 11:10:46 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jF35y0f1nz8sb7
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 11:10:45 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C4FC05F9FC
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 11:10:36 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1450c545-977e-4065-a18b-1c8e13f21f59@leemhuis.info>
Date: Wed, 28 Oct 2026 11:10:36 +0100
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
X-PPP-Message-ID: <179318223701.1196986.9588512707623354134@mxe9fb.netcup.net>
X-NC-CID: eCX8blJvp9GY1/zfiqWPgKdO0bbJ9WzQj2BXq9STfFljqZ/E/oo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20261027043521.99446-1-kmehltretter@gmail.com/
#regzbot resolve: invalid: turned out to not be a regression

#regzbot report:
https://lore.kernel.org/all/a84fe7b5-ba90-4e51-afcc-548f8b30180b@icloud.com/
#regzbot dup:
https://lore.kernel.org/all/dbe1bd3d-5246-4dd0-9b05-52e9ca7d0103@icloud.com/

#regzbot report:
https://lore.kernel.org/all/20261027223247.300463-1-mikhail.v.gavrilov@gmail.com/
#regzbot unmon:
https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/
#regzbot dup:
https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/


