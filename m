Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626499;
	b=PhrxqEPK8wnoIcsif0Tdfx+BTmRDY1MXXDYRDdgqZKhXQty6lWAl1RECzaQnxg2JG+8g
	 rOD2QDLBXHFl8YCuzTOocxai9d5LMpZcPUVCzvis7urtsaz0P0XytoaZoRUru164oe4/v
	 Mo8rojhr0SOxSELD6ldVymEeFFx/MD/ovF5jqbcdx1EQuDYybMzorpu6vi3e6c4OkQVGh
	 SoVnWkhT2aPEE3dpBCwUgIrUBE/bh3pIjsc4cFe6KcpQwPbnykKawm77lhBG56OySp5QV
	 TcMAEd9adnnKt091H/BrutkMXwY71AVXRkvH6tsFTFfQ1IVG751RKI2PR/Fzi+//WnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=8jHXLlKB6lRIBO1V8mIjqrWGAoBRhIGlqE6vLGi+U90=;
	b=tah4cHeii2XFeMf+T2t8Ni7O6ZJtD8y87XZSg179BHT2dtaUeAz8VBU0EfABv2uamnkz
	 Dohjr1u6mMpavHDiAwvkx5/b27bjcEBbD5Xd/8GHcE3YOnU/BSgClCted+LlwVrc+O5Gf
	 jUP8G/mjUJt4KgFM/YPrqB8cDr7QLDpHzLMr4toq69wNO+25w1F8t7Sf7xAu1c0v9ye8B
	 eV+GuvJdPzW67T8qPSRwX1eDPj6HKahLuvsVGcXyhHXXWAj3hJ0ptL6bDbZZGUIDEAWwn
	 sk2N1C1ih9qSopd7PePX0J6hvUG3uOEKi1U7NlXIervL35K6FKuusdApzZxKmbFjljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=AHa1Ek4N;
	arc=none smtp.remote-ip=188.68.63.170
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C3606A32D
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 13:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=AHa1Ek4N
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4jJCP637gDz8nvQ
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793626490;
	bh=8jHXLlKB6lRIBO1V8mIjqrWGAoBRhIGlqE6vLGi+U90=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AHa1Ek4N+mK7q8ptIpRBT2HEPmPFQX9oN7y1WcUeNWI6r2VnCmhdob42WhVAKUOWe
	 W2TShBdW/mHj87XANBN0ctCYQ0OCdb4tKZLifeUMFHSeOXa6RH2OIDBi5nyeFBOMCw
	 Tg7NOPSXgUsLmdR7qeHhu7LCJyCS88pbRrNwWwCpwNfPSzDXawN8nbuX9D7GtMOo8z
	 bSYp5Mp7XUISTMJ02qVvkE397IBimDotfHF9xXm8XJw3Ve51bnKVcxeZHKy4iGVSPB
	 BuoeADxs+lB26Ziuuf/u3S2wuD8kqV6Ht/7h04MM/ql/xc2pxqwKIaM/TSK3+d3Z/P
	 9fGQ80UhFxRUg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4jJCP61jxCz8nvP
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 13:34:50 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jJCP574jZz8sgW
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 14:34:49 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3EA7A5F987
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 14:34:45 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4a3707e2-63ba-4b22-b6c9-9e16c001b826@leemhuis.info>
Date: Mon, 2 Nov 2026 14:34:44 +0100
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
X-PPP-Message-ID: <179362648545.1738409.2868943813447416344@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 3EA7A5F987
X-NC-CID: arrjJv00/lxUJOYiGvJ1h8/kTYEB5Bdnva8Njr0KgZTYAqaWfok=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/6076

#regzbot report:
https://lore.kernel.org/all/20261029080731.890996-1-challvy.tee@gmail.com/
#regzbot introduced: 5b25f249be32
#regzbot title: x86/tdx: kdump is completely non-functional
#regzbot fix: x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is
not initialized

#regzbot report:
https://lore.kernel.org/lkml/20261030114705.3159093-1-jjc@jclark.com/
#regzbot dup:
https://lore.kernel.org/lkml/20261030151919.3511106-1-jjc@jclark.com/
#regzbot fix: usb: core: add a pre_probe callback for device drivers
that may defer

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222161
#regzbot introduced: ad873d6340957c1ed5a271eb7ebc8b873c42ba9d
#regzbot title: platform/x86: lg-laptop: Double input of super key

#regzbot report:
https://lore.kernel.org/all/CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com/
#regzbot introduced: 254261381538
#regzbot title: usb: typec: ucsi: 101 warnings -ENODEV: con1: failed to
get usb role switch

#regzbot report:
https://lore.kernel.org/regressions/179267754360.302120.2153520610797426540@kernelci.org/
#regzbot introduced: e8b32e377951


