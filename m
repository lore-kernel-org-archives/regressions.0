Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51467403E90
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203637; cv=none; b=JV6itMBeHEuBnNZYwVbeSNM08HoH9b3P5wBBrkiNXj8uk2CI61IgWrlL6fq0uA3ARgnWGrY7qV51x28wiRzbEh3yhRqaYebXmZj0YhyGdF+cz8UNQz0bK/rnjiRJo9zM0t3JLJDm3A375vOamOr7Yynvt0dz3w1PyCEEt1Tb/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203637; c=relaxed/simple;
	bh=cONcmZY6w1xlJTH91ApnEy8EvJ3d48+7xLYNuc9LkZs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QXdfPSkz1wLKX1+Uqke+yhBGMbHwYSHNGZJljSC5lyxQ/5NgPTiX/rGKFzPixKlscct9xlSga+WbqSlYv3cNYXUKUtM9YjrieBbfQ+LM1dYx/v9YNSzpZtFfeQiyDifvDRGjQOvGB5u48Xr2CFL8c5UW//rWgYH2O6+Fk5g558E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WXpDKmo8; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WXpDKmo8"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gKdVN0jn2z89Wl
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 17:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779203628;
	bh=cONcmZY6w1xlJTH91ApnEy8EvJ3d48+7xLYNuc9LkZs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WXpDKmo8pPPiScQUYEBj2wlYETO3Bzpuil/Hswhu3w//9CKvrrdrGXm+I0TDR3PRF
	 kw1GH3xbqArjrF5qPj4KCk1rl5JWZ/vwKmGRGjAPUnfT2LVgjObZ2f/QBZv5WTwX4r
	 mqgn/IUkSXFGjNAGyWxe3m+DzbxSkQ9k7CWoQCws2RG/OONBlyVyzz5BfK99brq7oj
	 2hvUC1fJ/LQs6JFlF/Kd/MFqGT8a800MWFbA1/y7sluErI9oGyOz4YdtOllK1RFKdM
	 eX63T9CSSzrgNVez4MEgVDurHyQp2E32j9M3GqMm3hBhNj5mXYwdNAmUSARtFSh2Kh
	 8elRDSv2dMRoQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gKdVN015Wz4y1f
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 17:13:48 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gKdVM5cQDz8scM
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 17:13:47 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0764961840
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 17:13:46 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f1a5235a-0e90-497e-86eb-6f74f033a287@leemhuis.info>
Date: Tue, 19 May 2026 17:13:46 +0200
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
X-PPP-Message-ID: <177920362719.2875011.196795145459928917@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0764961840
X-NC-CID: Lz1baI3/g3nYHCQuhDitmJdaokXPEh/HjfVEtt5dZVSFfjMKUoU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260516114334.812828-1-nerijus.bendziunas@gmail.com/
#regzbot introduced: f26a29a038ee
#regzbot title: net: phy: skip negotian problems due to EE
#regzbot fix: net: phy: skip EEE advertisement write when autoneg is
disabled
#regzbot monitor:
https://lore.kernel.org/all/20260516150251.879680-1-nerijus.bendziunas@gmail.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5286
#regzbot fix: drm/amd/display: Consult MCCS FreeSync cap only if
requested & supported
#regzbot monitor:
https://lore.kernel.org/all/20260518154809.660061-1-michel@daenzer.net/

#regzbot report:
https://lore.kernel.org/lkml/97a7d011-d573-4754-9e5d-68b562c64089@linux.ibm.com/
#regzbot monitor:
https://lore.kernel.org/all/f669fbc9-c068-489f-bd91-4e81561a6e58@leemhuis.info/

#regzbot report:
https://lore.kernel.org/lkml/20260423-stoke-ocean-139dbe306256@thorsis.com/
#regzbot fix: memory: atmel-ebi: Allow deferred probing

#regzbot report:
https://lore.kernel.org/lkml/f8566380-6a40-435a-bf8c-6c0e0999d434@mailbox.org/
#regzbot fix: x86/boot/e820: Re-enable BIOS fallback if e820 table is empty

#regzbot report:
https://lore.kernel.org/lkml/CAMRc=MfADC2ncuUQiSW7TnUwBUWCJn9i=wZ9dqYMZNo2h6qOxw@mail.gmail.com/
#regzbot fix: nfc: nxp-nci: i2c: use rising-edge IRQ on ACPI systems
#regzbot monitor:
https://lore.kernel.org/lkml/20260519-nfc-nxp-nci-i2c-restore-irq-trigger-fallback-v5-1-1a826cfbc128@amd.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221505
#regzbot introduced: e30ca6dd5345

#regzbot report:
https://lore.kernel.org/lkml/CADo9pHjr-zZ9C3%2B026y5%2BXOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/lkml/CADo9pHjr-zZ9C3%2B026y5%2BXOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
#regzbot fix: Revert "drm/i915/backlight: Remove try_vesa_interface"
#regzbot monitor:
https://lore.kernel.org/all/20260517024709.1016121-1-suraj.kandpal@intel.com/
