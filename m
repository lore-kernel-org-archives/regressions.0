Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513440;
	b=fs7VRigmiAhXEuCRh2kxgbDRt2C2U0QyHJD+Xacn1ADUnGbpltoinVX4tKh7s5rToHM7
	 2gq+CTuUF8QCka/EQAbHRUds02HeAesZunam4fzPmP/rA/gF9Dba4+I3kgUg2LbJUQYqR
	 HvKKGEMMJ8kmvH0ZuyDVvICkDde/YteBcNFlVFATENhE/s7eyc8G3VFfVtD4NJHy1XcOR
	 A1POrP+q7yaL6+Maz9Q/c21jYl2zdOpRpDSN7TDGPCLrHCNES3NnJc8d7USdwX2EUqfS5
	 7An6AsGxeSHAcfYpf++kgWO+Bapt3kdeADQ3Ex67fbAQ5KDh75HGJTsu4fLWFynPAiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=5Xyiq8hOk3wxFuJ6ARtyNPaREP5cQSbXD2h6edqPB4I=;
	b=PSyNlxrOZ/OX90Rf7CP06j8uyViJLOnRBsywnRai4451/9arWO1zjnhRVuiCRPiV31j3
	 J6sFAAJNNsYjReRlscLIGJYDo5xSayXJjDy/ZSaf643RmWSjPzgZvUJkVP4fHrPeCB0Xi
	 wmKjIilAbBg8f3YlojrCc+6m1P9KvkKfvSY2n84nagtczDEa31VoMXKnkOiOBreaioAth
	 psxUW/KBptQ9DZNQR0/kZghQgZ30ooEux3RTjbpj6MUZMDkPfIuGSEqqFKxICh9+hi5u/
	 1FXLhQ6j4OA+8Bjsd+5avYTxeaqTS0tgwD5XEw3E4YI9ygv+jdRR9cBpp56/bbgR7+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=jVHjQacL;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AF606A332
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 09:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416AF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=jVHjQacL
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jYdC16gKzz8HhF
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 10:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795513357;
	bh=5Xyiq8hOk3wxFuJ6ARtyNPaREP5cQSbXD2h6edqPB4I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jVHjQacLfOTK5IKJv7+ZWupS+xlExnf22NfJlQ4viZaL8IsR/OWHMMFqP32tezsnQ
	 VG0oqjmjYVHxzmtXXKMzGw3FyBLz71tlLb31yfJXI0QvJm2xDh/MIOBAMhjGGJUlMT
	 LOEumq0Efxr16eMD8ZcqDEFyfK2b/ci9VPOpJLmyVFFcoDxjiArU9C8D6UVxXCRITO
	 uNbsBZYzo35zpzL1pFz0DqqoW5xHdziOdxTQjScYps9JRAGHUh8Fpi6rR+2fBUnu0y
	 /gowlRcVE5G4FxNcduZG2NglpKOUZSIHRpwwsMwGQta6pha1jeoL40ppzdi0IfZ26X
	 rnq7I2QrJO/VQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jYd9k0K8Wz4ywp
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 10:41:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jYd9j3q0Nz8vKX
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 10:41:29 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A78065F9CD
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 10:41:20 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e5915072-6920-4c10-afc5-38b757f038a6@leemhuis.info>
Date: Tue, 24 Nov 2026 10:41:20 +0100
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
X-PPP-Message-ID: <179551328088.1447363.6626523189822235379@mxe9fb.netcup.net>
X-NC-CID: exrhbASXTXwR08E3SMp0zs3itggWYmz5xhEwQFksCQCusg9tFDI=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/VE1P190MB0877D026E2C3905F0324B46F85782@VE1P190MB0877.EURP190.PROD.OUTLOOK.COM/
#regzbot introduced: 749357bd48c1
#regzbot title: 64K-cluster NTFS read-only after $MFTMirr record 24 mismatch
#regzbot fix: ntfs: limit MFT mirror comparisons to system records

#regzbot report:
https://lore.kernel.org/all/bd2a701b-866c-4d4c-bd0b-37b4410628be@nvidia.com/
#regzbot resolve: not a (performance-)regression (*SAN is not a
performance target)
