Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757501;
	b=TR5YLJbceQ9fJLTdD9B1/yI53d+/l0JmJAOJjLubfG/C7R8tY+9L2Ng/IjXxX+mSSLgI
	 f8nsHIeyUIcl2dTdxtjdrk5PmotwD031vojLvjnh9InaVp9FYerMMmsfOZKIuCm4D9OTp
	 lVI5lpOXxt4QJA2UfJB7hpcfI+s7XCE9h4/2S0GZgg8gafq6Ng2hTv7xsFKwym/lYuqJb
	 WGTq/Lq67OFHVPUOrIGOgfOTrctnWF020YEKfXqXhvSKq4G+IauMBL6j4mgsJZS+fI3RJ
	 iAO1VUAvPohTruV4tm/c/AEUWiv9n9VuYSs0D47xwsXgeEFpBT+6dM7kSLhThDkDbzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=9elb2dSD8k97xKv4YYI89SaMC5p4InlOO7ZErDILLjM=;
	b=i3X2fRDHekJxqVUvcP//CIDsx5k8jNYP1i9Sx2sfTcIB/NLv0Ef6Ak1hL/vTH+078CUF
	 aOB3U/lM1/xBAh8grgtIfrTsH2luAAvfn8P3RNY1hXL7XQwHi5lCPh1CVQ3+iQSPpRgFp
	 lTD90gjEmqC7O5iyTOPTjuw0FJheycbkKFtEN4csO72cB2tF1ZIzP/q9fbzFSkVn4MiWd
	 dcRXHq2ZOKQSqD3rX7z0MXeHGA9n/OfSBUb787kNSXtR2Ea0WBc+NkG0Gnw6AcvdDIalp
	 OuBHWhyJgREoDtpMC/p72qirLQmFKee+PXHOfmB6vvumnmzfZ36LIlL1C92XeZXb5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Rzq4YAaU;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD025606A31B
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 12:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD025606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Rzq4YAaU
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jB21j3KSFz64G0
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792757497;
	bh=9elb2dSD8k97xKv4YYI89SaMC5p4InlOO7ZErDILLjM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Rzq4YAaU/J9yJP0FrF48kf6Kl4u+QnYeFgsUrKSLSRTfBJcXkpws/Pit63T0Zh7lv
	 lonogbaf+2WTkBtlXgDTrY1/JuVCX+78V2qyWDfFKzy8kdjafbiVrXPkQeqgOJypkR
	 IsQxA/Qp16ZA6oHRNOQO/wb2yxX2xXUuTmHUN+RCisdn4feMFp5BTmDHmmQ5ZlC82f
	 ymzHz6evH+725nuNIb13xL6oYLXze1pETm6tiRQseaWg5Gd+5yOeoY2wfh3mtQuCGT
	 VjVUwblRbbIPVb0YLSgpjBgV4i39UnUsj19cQ+J9moBRaLbJVU4JOVPnCRnG0ZSqNR
	 5kCmKZRieV5Ig==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jB21j2bl4z506m
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:11:37 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jB21j0vXkz8svf
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:11:37 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 686E15F983
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:11:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d352043d-b2b8-45e8-96e0-95bb70b5673e@leemhuis.info>
Date: Fri, 23 Oct 2026 14:11:30 +0200
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
X-PPP-Message-ID: <179275749259.1645333.2366422802768186632@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 686E15F983
X-NC-CID: VQkDLik3vcMjwkla1+fghywx3MKpRv/iYZ+8IfSH/x1Q2scQxEQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com/#t
#regzbot resolve: WIP; workaround available (blacklisting) and strictly
speaking a borderline regression, as it's caused by a new feature people
have to enable

#regzbot report:
https://lore.kernel.org/lkml/20261002175651.811343-1-ameer.hamza@truenas.com/
#regzbot fix: 78436f3882fb8d

#regzbot report:
https://lore.kernel.org/all/20261022033638.32460-1-thatsme.saurav@gmail.com/
#regzbot fix: i2c: qcom-geni: Restore the source-clock selection policy

#regzbot report:
https://lore.kernel.org/stable/20261022162655.231431-1-fredericmariejoseph@protonmail.com/
#regzbot fix: ACPI: tiny-power-button: Convert the driver to a platform one

#regzbot report:
https://lore.kernel.org/stable/179104011040.2214689.5921682013387867802@eldamar.lan/
#regzbot introduced: f05baf6e0680d8

