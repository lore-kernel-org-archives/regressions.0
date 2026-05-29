Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA313B585F
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041780; cv=none; b=Pt5U0ooFY5sQsAduQvTGTzdeJaUX69Zpy0KtxXnHk5ka+9wx95U4cmyfdOlSZNXbkEIN4/Pklhhbl+qCyt6Jy7Bf63Cbk7QPP7FbEe5giHgtKKlCEb8cqA+M/uCztxO8/aUPSalvW7xXP2c3NhsSbi5W2TlWwc4uAChYZvmCGhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041780; c=relaxed/simple;
	bh=tCknl8y1v7Z1Rbr4hV11Oo3i/ywNcmBi/9ckQfDbk6I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=O2RWrUII3WaBiynqV8SCGD9cnxwhk9bw2Nw3kGSUiAh6bL3YIvqXrfL1/bX+WQnH0Kp75s8IfCJ1AKret3Xy5AD4WSCRQlsxL96vR9JTZcEhK4aq6xKNCPoslIua7v4b+b+orcF721k4mMzFbXg933d8Kyw65AIQxh76G/MqZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TLaIMkxf; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TLaIMkxf"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gRbJd2RYxz68tQ
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 09:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780041361;
	bh=tCknl8y1v7Z1Rbr4hV11Oo3i/ywNcmBi/9ckQfDbk6I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TLaIMkxfLUdu8+dLIIENb5h5zvT8U0dlC8lCUpNZS3wXW7Zj2RoDeJgHwt4nXhBdp
	 S495rF9mImLht/9cDqDATuR77w9aPXy0BaELZOn0+3S3HI7tX5HYOtEHjz44PtFj65
	 q8ZsNTmAmK2FjIo3jwOyi2zuRl3ZQlFRbN6Sy2LvqF01s7jSclC9zmNtvmUNvsERAW
	 m/CG9F5TFMt0y9ho8IXYfuo6MMJnHXdlGGPdc0BCNUhM3C8n++cNm8tlMvYdSO7d3n
	 aDhwZOaRRViXcFpi0VPhDHjtlUDQ6Mq0F2NyMofZLE8RKz/hOt2bzobH91jlj5BYMj
	 ggh1Ra3fRbuCg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gRbJd1kmkz4xHB
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 09:56:01 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gRbJc73P1z8sb8
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 09:56:00 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 748C761743
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 09:56:00 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ba91af57-f03c-447c-b1da-dd7d7bb7f61e@leemhuis.info>
Date: Fri, 29 May 2026 09:55:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
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
 <178004136063.2566768.10470742458839707925@mxe9fb.netcup.net>
X-NC-CID: 16HGPaTyJ2D3X7YlsKO1aih+78Uv/1c8im3wKaCxvLjqQZmOuH0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/69e2ca14.a00a0220.1bd0ca.0031.GAE@google.com/
#regzbot introduced: v7.0..v7.1-rc1
#regzbot title: loop: loop drive broken due to some race exposed by an
unknown change

#regzbot report:
https://lore.kernel.org/regressions/afHNg2VX2jy9bW7y@piware.de/
#regzbot fix: cgroup: Defer css percpu_ref kill on rmdir until cgroup is
depopulated

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221579
#regzbot introduced: 64c79dfbc458
#regzbot title: serial: 8250: concurrent open of UARTs sharing an IRQ
triggers "Unbalanced enable for IRQ 3"
#regzbot monitor:
https://lore.kernel.org/all/20260527092052.2086342-1-wangzhaolong@fnnas.com/

#regzbot report:
https://lore.kernel.org/all/20260527143643.GO31091@soohrt.org/
#regzbot introduced: 1317a5e7f7b1
#regzbot title: arch/x86: AMD F15h VA alignment offset breaks
MAP_HUGETLB alignment

#regzbot report:
https://lore.kernel.org/all/DIUI56CABZAF.3TU7XCIKTV93R@kernel.org/
#regzbot introduced: 1a80c009e27b42e8c202d4c5dbd9dad9e22af742
#regzbot title: drm/nouveau: segfault during nouveau probe
#regzbot fix: Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc
functions"
#regzbot monitor:
https://lore.kernel.org/all/20260528192847.4077458-1-lyude@redhat.com/


#regzbot report:
https://lore.kernel.org/all/O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com/
#regzbot introduced: 630fbc6e870e
#regzbot title: ALSA: hda/realtek: speaker pop/chirp on ThinkPad X1
Carbon Gen 12
