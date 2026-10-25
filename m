Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792923471;
	b=ezjeMDUvA0bZlgwIDyrjKN6910gr8JKORwDzh3ktXxT79XTc67yJN0Z03TFL1YDECEbs
	 AZ2rwsAJWy2BVsFewAnPzXIF0grMRekFeMzbC0jAtgFEco4dDXMM7jGpNRzETVJ2ba3Cp
	 J2WsZlYZrr1sIf3NuJlgvw1waXz6RNsfpQ89QZEYnM0DPjXEAznGlehp+J07J1YeUIhx+
	 GAMysoD9Ix28HxsTWegB83hGh3s7ZPLQ+Rr3XH/8w11gqEVsK+/qbKTlnhAeA3LxIipMJ
	 ldV4AebM9+HtzNXHExUkqrHturVKQdjVb0oJFsX5QxCN0YrD1xFxPTz/lchHHWM7rrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792923471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=rpd8YJ6STkeoIZZSTm1J3Fb2n5HLUPWxSoseK/aULO0=;
	b=Nc8plR05nQ7sepR1vCaultCZ7kJa8efoEHpDpuKZODbF6Dk4Qiyvuo0TXfGTzYMch/qt
	 hK0W5miK9s57RKc5S193ePZUCKiVVU1+nBCGAi5zLmCAhlf6qc6QyhfL4NnfD3d4qRgnp
	 oIkfjvThujsEs26+PNHH/U69Hj9f5D5OXjICjzsRNHtJBoAR7tPeRs+XnxhbL2SyJ1JKB
	 /GjVA5sWe1X3V+vT8M90m+bo3StSvhNVdRHQvHrx79l568kuU9fA6ittB+Yhcux5yeJ3K
	 alaF0oD3AuQU7ubCO/eRytZF8L25Jh1v0upUFIVb2G3GWPSutEzcLXO8Ug+325vEqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=GvodijcS;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73791606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 10:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73791606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=GvodijcS
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jCCPL6nlCz4dXM
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792923462;
	bh=rpd8YJ6STkeoIZZSTm1J3Fb2n5HLUPWxSoseK/aULO0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=GvodijcSsmxA85EuwJAWhTVupKvVVJkuPneOougrnJb/lKtCyHh3RJLLrEY5j3sMS
	 vhxlLyPmwAnlHGGvoM4cWzXddnH9dR0ggIbxSGNSmnFVNVaxxy74lb8uzfiQNKCMzz
	 mXzSaIZoTAL7mnBcMiAlMgydE4jf3y/bZt3dW2OMxljmoXAQ0VJubWIPzYB08cVwph
	 zLSWzDqDaeIN+f+m7XTAbYUhdbedhsk75vOtg0djlACom9TFjenoCGbnadEZ7hxtEH
	 ooSdKwU4Pf8f6vcCSg9dYaSXduCZYpqi0lBHrKJDoheqyKPF7eZVZC0r14s1sVO5Kj
	 YxWmTLmEHArww==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jCCPL629Jz4dXB
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:42 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jCCPL4LpJz8svJ
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:42 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CDA335FD79
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:17:33 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0436a730-fe0c-492b-a7bf-1327ef331e2f@leemhuis.info>
Date: Sun, 25 Oct 2026 11:17:33 +0100
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
 <179292345416.1436778.17642161222126542636@mxe9fb.netcup.net>
X-NC-CID: ZR0v/R0JyhBG1qoeEph0j+sMxSn+YGYxllqrxLVTdGGBZ36RWag=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

