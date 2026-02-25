Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFABB38F23B
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012879; cv=none; b=HB3qjygHZzuNYHLX8nGNPkpkfyompSs8lQFKvXsvj3JT4Ws2n0oGDqRG6sghw8KPW4qVrvRgPITwUxPhNCBYw59Xs0+D6lSEL/UWrQPVd1W1WUt5IY5Q/UAg5TP5Ibb1MewgmJgpBND4sfeeZGvDbN+vxtBWtrz7v6Q1VrewOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012879; c=relaxed/simple;
	bh=ajy236ZbWlDO9JrbU5UYxib23n6YWiLxE/q7rr3YOrQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=YPt1onkqGTXDCdJJeQeTjpdEY8GJh9EOGpyoiaXrtsoFpeX7fceWrsB9V3suxTGy7ahI/csX/VmUU9wBDGTSAax3wsjNI25ZVvxHoR05VVLsgL1STt+sI10yIeWaZBx61puwbP1yf/MLUkg4eL38VqxP47C6gqLQ4cvRtyan8NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hYEtdRqn; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hYEtdRqn"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fLVBZ6Qlhz73MB
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 10:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772012870;
	bh=ajy236ZbWlDO9JrbU5UYxib23n6YWiLxE/q7rr3YOrQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=hYEtdRqnnr0SNnb+Z8ygHzc7wcFIzhMCaQsTo6LpWsvs0Z4JEd/oW/rx6mehmGeou
	 7qHgG87Z9EYuSEfajVHqeuxWZO1w9n1VfpNwQ8qigz1D7VaaJ3VRJFT7I4i65Im7a9
	 KxaC2PXwFsiP7DiNIeorxumuOK9oAIKsLQJLJ4vo4AgcnG5hiya1s8ipPUS9OBNSHT
	 6NXUQYkyjI1/Ipao18iIrL+UkK1aH3AF4EdvQoyzTh1oSYVL0YDF3iX09imGTYwVCe
	 lNUrci7RiRa/ezbLI3EMaI1qgakKlk0I5UzmJPs0uZGHitiLS8kPb0HKD7IqCQGWTw
	 mHFYJ9TelFhUQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fLVBZ5jNfz73M1
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 10:47:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fLVBZ0jSJz8stj
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 10:47:50 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6DCD567564
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 10:47:49 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <91e014fc-f107-4a12-a13f-d84d9da2cad8@leemhuis.info>
Date: Wed, 25 Feb 2026 10:47:48 +0100
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
 <177201286962.3453482.11235065854967666089@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 6DCD567564
X-NC-CID: QcvMtGUkZYP/FpnLtKyAdPuUa3zaZAAXkKgZ6x0Ytue2nodPZSU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260221235050.2558321-1-lkml@antheas.dev/
#regzbot introduced: 789a5913b29c
#regzbot title: iommu: Freeze on boot
#regzbot dup:
https://www.reddit.com/r/cachyos/comments/1r5sgr6/freeze_on_boot_after_kernel_update_to_619_fixed/
#regzbot fix: iommu: Skip mapping at address 0x0 if it already exists

#regzbot report:
https://lore.kernel.org/all/cover.1771409004.git.wqu@suse.com/
#regzbot introduced: e1bc83f8b157
#regzbot title: btrfs: various bugs for bs < ps cases
#regzbot fix: btrfs: fix a bug that makes encoded write bio larger than
expected


#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221118
#regzbot introduced: 534ca75e8e3b71351
#regzbot title: HID: hid-input: No battery status for ELAN HID devices
anymore


#regzbot report: https://lore.kernel.org/all/aZ0SbIqaIkwoW2mB@fedora/
#regzbot introduced: 17c38c88294d
#regzbot title: mm: slab/sheaves: severe performance regression in
cross-CPU slab allocation

#regzbot report:
https://lore.kernel.org/all/fd099b27-8716-4ed9-a2eb-f9b03fbb45cb@skogtun.org/
#regzbot introduced: f2ae92780ab9
#regzbot title: firewire: ohci: Black screen on 7.0-rc1

#regzbot report:
https://lore.kernel.org/all/CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z%3DVd_nLRCr5ZqQg@mail.gmail.com/
#regzbot introduced: 662dc80a5e86
#regzbot title: usbnet: rmnet over usb broken
