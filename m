Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A3370AE2
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 05:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744949; cv=none; b=QeeKCAA1D8tByKJfxb92XkH4S0RhYIa82aPFL6moQf8Wj67GlzD6qt5d7gw3Z1v/+UJqViicnlL5oMcWpwgpcbBev4+BmqdZIcWRzS7wW40Mx38W4gimQklE+v5wSeZalYCGYQuHXWeHMd9VydnQDWXD7ljQR7Bz4S1C1/fJT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744949; c=relaxed/simple;
	bh=0I+7tJL13LXB1JkNtku0+LEKvwUxssqkUBMFpkehDYA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ldTr4lW5jRdAzqedYH/FF9gti2kMWPxjxm5C2EEagiWttv6KxEe8+L+PX3KQKmxaHsUCCcSOBUdon7xZAOhwqMXrTnbFS1NNMUIwa4CtONN7Z91uTODujKSF4E2HRvjDoUmoD9lAgl8kpV7uQklaAWNtWQlLsFp7mx8pGkkxdis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=KNB5X4gV; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="KNB5X4gV"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hvjkf0PbYz8NXd
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 07:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790744938;
	bh=0I+7tJL13LXB1JkNtku0+LEKvwUxssqkUBMFpkehDYA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=KNB5X4gVkeC96JOXy07hzqdUnL3mjjVbhCBuSotn3v2nYKoyQEqWi38xClaakpHOM
	 3POd2eCOXSH6dvHo4QcMYWcCdSqCwV6c8s/BLduf5PAEISvXw9wEQBxYN0juEQvs83
	 P1jaMOfCofyua/0WEAQHu5cyGKL3Z++YRKrEEg2IUfHfFadwNSRKczUYtk5ziBemOm
	 Kls6jc1hNqJ7WHE4vknERIAYcwXNFin3XrJxVV4OWz54J9a+okXq2mNX0Le4V6Bzb+
	 YgnnSOE2VbxHoLIvk7cVyd2deqg8qAyucYEc8LGc869cLYA19/NS+kPt1oxyQGVc6y
	 F/UVJrOj8vAoQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hvjkd6pw8z8NWS
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 07:08:57 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hvjkd5GTFz8sbC
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 07:08:57 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 332D45F996
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 07:08:57 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0a283de4-8a71-42d6-a3e2-42a7248d6058@leemhuis.info>
Date: Wed, 30 Sep 2026 07:08:55 +0200
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
X-PPP-Message-ID: <179074493737.2827715.9167082324987469513@mxe9fb.netcup.net>
X-NC-CID: 9QCh5M6HqiIczA8DrNwUVTrAHJeIl7uniXVG0aowfqzoGnPoNWo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com/
#regzbot introduced: 87a6f2fa6e6c
#regzbot title: ALSA: usb-audio: Audient EVO4 hardware volume control broken

#regzbot report:
https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujianfeng1994@gmail.com/
#regzbot fix: Revert "dma-buf: Make DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels"
#regzbot monitor:
https://lore.kernel.org/all/20260926022026.10539-1-liujianfeng1994@gmail.com/

#regzbot report:
https://lore.kernel.org/all/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de/
#regzbot introduced: b364a0d23cae15

#regzbot report:
https://lore.kernel.org/all/CAE4bxw%2BofDFVx0aTHqCrzns9oP1CRQDm_wzeyHPeMBYOhSpcuA@mail.gmail.com/
#regzbot introduced: 5ead2063611a
#regzbot title: Bluetooth: btusb: RTL8761BU 0bda:a728 broken due to
BROKEN_EXT_SCAN quirk
#regzbot monitor:
https://lore.kernel.org/all/20260920020227.709800-1-junjie.cao@intel.com/

#regzbot report:
https://lore.kernel.org/all/DM6PR02MB5433F3C2A156335B6ED47756EA8E2@DM6PR02MB5433.namprd02.prod.outlook.com/
#regzbot introduced: 4b490e0d103c
#regzbot title: ALSA: ctxfi: no PCM playback on Creative X-Fi Titanium
HD (EMU20k2 / SB1270)
