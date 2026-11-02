Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610307;
	b=irlRQVwv3/GWCwE/jr4YJeRK5YbFe7ua1Pm6KhniDvn4CQuhXIAqLlqyyHsfsTcy8/JS
	 kKHGeQJ5CUf5tzoflt14merQKrFk5Zm0h66fbe4CVywrG02P3DflqwMRoRK4kwwPuLPbG
	 WYqFSRw2lToEXoAldGokv9Pvftfu+l5ZBE0oSw4r6EKftxOG6WnSRk2K4nPcmn4q9ZSh8
	 rJJNZi9OZBqURFSEBaFM/0AKN6r5HG/3o0Gpmv66rzMFsulmnLSM5qzWP++feuI1HtYF+
	 bf250G4Kri2lGkHfLDRJ3zlvB841hA2XnTt/yj2fHZbP/QEU2tbzQ8vkvAyyLzCa2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=RVOmnOa+Y77vnv2dFHNdbDCauBHEdgvyd8yujERyanU=;
	b=D1ND19J3/ogtTeZNhdQo183W7hmfyO+SKf1FShF9cud70AbefqW4o7AV1xAomcxlLitb
	 GT/4dV5fo1cSUvJe0EEc4V0BY8Rkda+BnL7eZeGshwV9GoSgW1Zyat2D5iVjV5IOicaEi
	 Jr/gzFhmq1J6y9JCfWmmWsQGTI76D7Uml3+nqmmwAOtl5txYFFQ2wUHp2PF8rDsZFoLL6
	 YjLGFc1MJWWO5EpYVUYY2Y5Q14H0I/igyD1c4podYhxRfaISVIvWBrJMqmvUfANkb9gzc
	 MZjA1xyBrow9LG2M8QhMpdAB4iKMuNP5SfS3b4m0NGHp5Ddle6t7QCYhy+/78+n2A2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ku6c3Ftw;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2E606A326
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 09:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADF2E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ku6c3Ftw
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jJ5MF1RmBz6DBQ;
	Mon,  2 Nov 2026 10:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793610169;
	bh=Z0f88uzvUceAkXdaLKLkFc/qOuIe5LEVl2FdWzLxDu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ku6c3FtwWaBy0SHhE2UL1GlZod/jtwj+LXXcPngs8YZ42wEqebhgb8FQQumPBp8J4
	 hnw48hTB339NFcXcwCgdQt1KjY1jpofFP5CJeICE7RLHTPVt2H2PjZTtrnASYklyx6
	 yaGXG1E3hbozR9UmOoHXj7/AWlAsyo351qZlcXLJh07qN2hUOTWQtuh0ufhDuqBsij
	 95Zo9DuueGN8j1IMsR7RQ+3fh+fPb2P4filoCD7N6gXK0QoItDNIvl3h+z/B2ZvOM2
	 vhECl6RY3WfVIvupIGXe09OTofH8d1WJEkPt2ZaQXZSTJKc2hndaNX57kvLVQ5Woh7
	 Fn4DCOqLsQI5A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jJ5MF0kQSz4xpF;
	Mon,  2 Nov 2026 10:02:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jJ5M61DyXz8v3S;
	Mon,  2 Nov 2026 10:02:42 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CCD445FA02;
	Mon,  2 Nov 2026 10:02:11 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <00da317f-ec33-4084-a48a-1a6b4e10dfc8@leemhuis.info>
Date: Mon, 2 Nov 2026 10:01:54 +0100
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
Subject: Re: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: Nathan Blomquist <nblomquist@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, alexander.deucher@amd.com,
 christian.koenig@amd.com
References: 
 <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179361013215.938408.10260651982030849222@mxe9fb.netcup.net>
X-NC-CID: OETRYYhrIXK7Yx/aCTIZzpcbZleKbesr95LMJ9BGrxFu0Keb3xk=

On 11/1/26 21:05, Nathan Blomquist wrote:
> 
> I can reproduce a Navi 23 / RX 6600 (1002:73ff) passthrough failure on
> unmodified upstream Linux 7.2.10. It happens during the amdgpu-to-VFIO
> handoff, before any guest code runs.
> 
> Revert/add-back tests on Proxmox kernels isolate ef5fcf2a6c32
> ("drm/amdgpu: fix autosuspend cleanup during removal") as the trigger.
> Removing its added call from -20 works; adding it to working -19 fails.
> [...]

ef5fcf2a6c32 is a 7.3 commit, but you only specify that 7.2.y is
affected, which might be caused by a failed backport. And 7.2.y is EOL,
so it won't be fixed anyway. Hence:

Have you tried if 7.3 is affected as well? You also might want to check
if 7.4-rc1 might have fixed it.

Ciao, Thorsten
