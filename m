Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115D377006
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987799; cv=none; b=SbJ8yd43G0FYIRzzWtJJmyRv3SxXrAW6THZdAg6HRFcoMGZKAp7HFz6Q8V8xTnkYChNu88OBUy9AKSqQdXe/KsxZNlLU3PugMreA+zTOoky5QY/uWOp884Rh+CY8BOq8yjvKjGYGLWoGYOzVyaHMML3Ut+fH2N9+ZyTFAsKmkIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987799; c=relaxed/simple;
	bh=rv2eXEGmzjlc2mp0XDGAvLGyqM31/rtXWpMUJFI0KZs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Ml7XLJMqpzA1dSMXRL0czeXye61DKU1yCKcad/EP70naaZ0zY2K5i8nrT9x3zlF7z5udfUOR4RHLorZxOvXeyonYuGyG0MkCk0n8AeG7iQ/aaaICz8Y0iIW+1OLeIdkhctY4dAtzjEfPGu9KEjVD+PhGBUphB+UNFcYEy0pNT/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XaHrAmdl; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XaHrAmdl"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4grXqr0rn3z4CRw
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 12:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782987432;
	bh=rv2eXEGmzjlc2mp0XDGAvLGyqM31/rtXWpMUJFI0KZs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=XaHrAmdlfn6uU2p67qUErFG8au8zVmHvUyGXPvZhe+NPxe55DtJzq2GIdjy1RHGHf
	 wn50tXgRxu25aFyJw6vBcSXL0tbpnfOoFPnZc0BP1ooyjjKEu1YLIRYDZfucqgAyV8
	 ybJpSk8nfMJjJG7fMcJ13M7EIVd8WJyK6c/ocgO5HPwrvxAOBAOWLdeJWeed0G0Qdz
	 h95vzngr0x6HodxHXjCcDeuTNgyQOPHLX8/I+hW95wa1C5SoRovdxIVi2KjPFEOPn9
	 puAU6JZ6kKaE2nVFDyQs1SwosAvpHknH2ElQsRYKvT0RdMRIHvWH0QwioiBkcXqy2t
	 R+KdaYHK+EIwg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4grXqj512Nz7wgX
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 12:17:05 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4grXqj3Tn2z8tH0
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 12:17:04 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 45CA0603D0
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 12:17:04 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d27632b9-4399-4e2b-ade8-084d24f297d5@leemhuis.info>
Date: Thu, 2 Jul 2026 12:17:02 +0200
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
X-PPP-Message-ID: <178298742445.3585659.4816838587332514020@mxe9fb.netcup.net>
X-NC-CID: LbFqbQtJPkwyC9jRrpL7TjwnTHK4QqoWz56bzj2OvgpQDbVx6D4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5399
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5423

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5416
#regzbot introduced: 1eaf26db95901ca7073
#regzbot title: drm/amd: smu13 power limit range calculation
#regzbot fix:  drm/amd/pm: fix smu13 power limit range calculation
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5419

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5418
#regzbot introduced: a1fc7bf6677e
#regzbot title: drm/amd: +10w higher CPU usage on idle

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5437
#regzbot introduced: 4cdbba5a16aaf16513b6
#regzbot title: drm/amdgpu: Unable to run Final Fantasy VII Rebirth anymore
#regzbot fix: drm/amdgpu: Only set bo->moved when the BO was actually moved
