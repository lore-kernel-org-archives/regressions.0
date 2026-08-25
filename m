Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA62346AC0
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653828; cv=none; b=FGgEAPA7yV6xivSv82UpTPXInvks3va3zp10RAQKjmIU/ZzNZfJ4hc3bOqZXSqz+GxS7DFMXbusUZMUjA7o6vlAh4SbkoIc4L8TRrgCWM8Os+srPTvrD3YRcnmL+ZrxmAzdY9+jz+7Xowofdwy4Ura9nYXehAcBd33yFgwfmgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653828; c=relaxed/simple;
	bh=CknQRVGv6Fkl/Mh3Q9U9yZqvLuLAV+hp3Y8OTl7NqGo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Uzm6WuuG5c7Tm4/B6WBHE7o1w52NUjTgEjNynVIVXKHefzcuN001XX3hBzeo3r7ergwbO097JhIBEU3hKj7yhDjgZKRQfyJGmoiPMPXx1XieBu5H7560l39143bEu5fBPW77PdPrEaoBY4FSXF6QOA/ZxYFQTTWQFxIWSS8gGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MrMPshIi; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MrMPshIi"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hTkZ05KZpz89Q3
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 12:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787653816;
	bh=CknQRVGv6Fkl/Mh3Q9U9yZqvLuLAV+hp3Y8OTl7NqGo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=MrMPshIiAvXqRVFffpM0xsAJiw2rwOui7aN9k1TogIocrNrE2lDRiJPVNcQ8NDIvR
	 8xVy9DXOwQvBB19P+7oMyHHdQwKhDEGvdJUlP6CaWH6jRhLn6xKZryLUB5JoEYk49q
	 YSeg5Gld3SVNOPiMwcANmollvkXWRbQ0Q/2khNM6FA6IaozUyye2CO9tOefa5oN0nu
	 Hj7neJWPAPMigB1FhtK62Td3MJxd6yQ9mJ7DwQqKhXH/7ibsuCUdhLbwSBx1Hx6XFR
	 ZgTNdse27EUH9dI4RuWEvug70J/0u8Jq+To41hReTUd+3a0QPML0G+aw5dDp1FuxMM
	 /t9EHUiFtTL4w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hTkZ04cryz83L7
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 12:30:16 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hTkZ035tfz8tHB
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 12:30:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E405F5FA38
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 12:30:15 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c1edbc31-4b8d-4488-9501-8a27b1141b5f@leemhuis.info>
Date: Tue, 25 Aug 2026 12:30:14 +0200
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
 <178765381609.1124868.13687924912833289551@mxe9fb.netcup.net>
X-NC-CID: hoBikIyrC+ImVRoeVYBhUCwj6Mnoa3yNvuIfVfwm2qq5uu4/s1M=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8901
#regzbot introduced: 2ee8dbd880b1

#regzbot report:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8550
#regzbot dup: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8901
#regzbot dup: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8569
#regzbot fix: drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+

#regzbot report:
https://lore.kernel.org/lkml/20260822141115.58815-1-kserwus@gmail.com/
#regzbot fix: Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to
0bda:a728

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221911
#regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
#regzbot title: usb-audio: sticky mixer values disabling Fifine
Microphone AM8
#regzbot fix: ALSA: usb-audio: Demote the severity of sticky GET_CUR

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5628
#regzbot introduced: b96150a7069658
#regzbot title: drm: amdgpu: DisplayID Type-1 mode no longer enumerated
on eDP panel

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5490
#regzbot introduced: def3488eb0fd
#regzbot title: drm: amdgpu: driver crashes during boot on a Kabini laptop
#regzbot fix: drm/amd/display: Fix HPD consideration for VGA/LVDS
connectors on DCE

