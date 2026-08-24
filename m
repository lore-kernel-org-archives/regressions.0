Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787E3EDE78
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562839; cv=none; b=HXB98RhKEcnadWd8kLD/Ds5jS9gZ7RkSVQ3Jz7pIcMxRxlcsKJ4YH7d/hYSRwummAccTK7j3Hmk53ZloahkUlGmeNT0Lo80DzWggKBUZO/Ju5KXCztDe+p0jDq4mt3UuUQmRokqH0hPbBW7v/S2O9qn2gphh+ZxZl31QDn/mxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562839; c=relaxed/simple;
	bh=Cc6HY683D6JxEiqFA5yme+Qei+5eF+drTbW1EbMammY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GI8SfLDGyBHJ8COhZ+YxWU1feFVCxHA6pCe21mYgXnXCFHg1IRqmH8uLD608pANM67mENnaPPdVZs3sHbokXGQgcpJAnBZ52DBWjQBdYGs02qYShPFnwRGqAsY7ZTxox1fwxtDJnLEn0b3X/RpeoP6OeQAmdqIukN2ycw+vMXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TXJwx3P5; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TXJwx3P5"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hT4tk5X2yz66Yh
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 11:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787562750;
	bh=Cc6HY683D6JxEiqFA5yme+Qei+5eF+drTbW1EbMammY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TXJwx3P51dqUbD6HljonjgRA719xJoOoMvs/4z1gIy3y3PJiOgEeJYgDJmlaCqwCt
	 3KMtBuP4MYUWOviqzK78jjLWFztk2+ogLvLosvAua3qw27V65NDQS0iu5cIPuVbBI/
	 1EX4WTR+yb//JvanjpqF2GaWMKulP5Zbg4QtkRmSeU5e8KEBes4mhuAB+SHplwZmAX
	 C7WPfoalgZHZJdViamOYVl1hMvOEadRTgCfG/Jk6Y/EVh897dbgDsAnntf5OXe0QDX
	 8UlJP0Z2uokQHm1xz3rECFmix0Ns17v1O65S7wNQ8ChjXoMWWhJBHLPXi3DGoZZPms
	 u6vJavwvDHX2Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hT4tk4qjnz4y52
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 11:12:30 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hT4tk2mGwz8sb7
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 11:12:30 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9BAF35FAFC
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 11:12:25 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6435709d-062c-4d79-b339-5dfe2e21ed21@leemhuis.info>
Date: Mon, 24 Aug 2026 11:12:25 +0200
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
X-PPP-Message-ID: <178756274582.2320142.4406211969744127705@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9BAF35FAFC
X-NC-CID: PuLNeNXy9nTdniGNUI9sJlZtTJwjTdmIUZNHpuI3LtDXv9VSJGE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260822141115.58815-1-kserwus@gmail.com/
#regzbot title: Bluetooth: btrtl: realtek RTL8761B and RTL8761BU devices
broken
#regzbot dup:
https://lore.kernel.org/all/20260824053227.317496-1-junjie.cao@intel.com/
#regzbot link: https://bugzilla.redhat.com/show_bug.cgi?id=2521504

#regzbot report:
https://lore.kernel.org/all/066b30cc-a9e6-4aeb-964d-71551e8ea3ef@posteo.de/
#regzbot introduced: ff643b81bc38eaff6c0
#regzbot title: wifi: mt76: mt7925: WiFi 7 MLO (5GHz+6GHz) silently
stops passing traffic after a few minutes
#regzbot monitor:
https://lore.kernel.org/all/503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de/

#regzbot report:
https://lore.kernel.org/all/20260823201521.2576344-1-fabian@isomorphic-ai.com/
#regzbot dup:
https://lore.kernel.org/all/20260819-uml-timex-fix-v1-1-f690b514fc9f@linutronix.de/
#regzbot fix: um: Use asm-generic/timex.h over the host architecture one

#regzbot report:
https://lore.kernel.org/all/20260813170959.22073-1-zhitaevakh@gmail.com/
#regzbot introduced: 8dbd72cb7900
#regzbot title: drm/amd/display: brightness not at full range
#regzbot fix: drm/amd/display: Scale custom brightness curve from full range

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5678
#regzbot introduced: 0138610c141304
#regzbot title: drm: amdgpu: every modeset and monitor wake stalls for ~1.9s

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16854
#regzbot introduced: 65047194
#regzbot title: drm: i915: eDP 3840x2400@240 mode lost since 7.1

#regzbot report:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
#regzbot introduced: 05cffc07
#regzbot title: drm: xe: Tiled displays broken

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5634
#regzbot introduced: bb204f19e4a1
#regzbot title: drm: amdgpu: Runtime resume restores stale power limit
wedging RX 7700S



