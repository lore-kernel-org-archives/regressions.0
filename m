Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610843B27E3
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167051; cv=none; b=oR1ka4QyjF2zT6ukNyry/cfg0aRKu4sjhIMtfxP/xmKuHZTQduUKHC3k/PZLojJV/FKsHTBe3mpv2xEVLrM9/RCo3y/YhDfognbgHgv5KKqZNqYdnXjnWKety7uZbpcVypjqZunwLXP0PGKPiwbfAebk9YIM31TyOBKkWqQ/Itc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167051; c=relaxed/simple;
	bh=ewTnMEFvI7nSA6xz1NwZ7zGXm2bPosdzC94EvCnDXF4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=sDsAJDBX7RIaRpPMvm2KLy9GHRxlpaKptGmxDZxaKBm51BSL9OXzLxtYdx0WeJ/EkCfILRN3TiFKi0YT+P5Z0MZdDkLjy5h7wUNGb54dOmzdnKwPQfJOm/mtzdAZ9H0R4p1FVCchLsIYv0aITBO0/e7uAlsn/Vq+7oecZYXuFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A4KcIrUV; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A4KcIrUV"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hYN8R066Xz9CRr
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 10:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788166455;
	bh=ewTnMEFvI7nSA6xz1NwZ7zGXm2bPosdzC94EvCnDXF4=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=A4KcIrUVKJgbNn6+c/vDG6byTqtukJaKbxqM/OwCw/+m4k/0avqhJdp39kN3IeNu3
	 IO+h5dtJYnIxUlLAoRM9B/GAYhEplEyI3vUauRGSnOfL7NU4eHC5MSfzIZSABpI5mz
	 6zDGcHhWWxPN7YuAEpZk5FNNT42OKxd5wfsn1E3NzGScGlOnLA1cV/h59SNSLQcgrX
	 UAIGtj2gRCuyGuhlQkcgXeKjXH9lXxwJL4gXbVy+MQVsrwuOEwPnHXrea6yvt5mpbS
	 kBntWWVgaK9nL2Gp5tkJicDPPndtkaXHIzCsWM7p2UlU+dJe+8bkE1Qu4T/rFvtdeS
	 b9fXb0IQJ+0Sg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hYN8Q6Vb4z7x8Z
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 10:54:14 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYN8Q4xnGz8sb0
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 10:54:14 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EC6FC5F98B
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 10:54:13 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0df2f492-e7e9-4842-89b4-4c725c582f1f@leemhuis.info>
Date: Mon, 31 Aug 2026 10:54:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178816645414.3113632.728518435629614393@mxe9fb.netcup.net>
X-NC-CID: RvvKnKVylqJAHMJZ5Eyvh9lsumqJ+XN28BucIC0gY2ktOAefrxY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221675
#regzbot introduced: b2d2ad72e06e
#regzbot title: wifi: iwlwifi: BE200: firmware faults

#regzbot report:
https://lore.kernel.org/all/178807922598.807847.18300931641658404390@eldamar.lan/
#regzbot fix: platform/x86: asus-laptop: Fix ACPI event handling

#regzbot report:
https://lore.kernel.org/all/20260820095714.1865096-1-wenst@chromium.org/
#regzbot introduced: 6d45e9556d4a
#regzbot title: usb: xhci: xhci probe fails with a WARN
#regzbot fix: usb: xhci: Fix HCS_ERST_MAX conversion
#regzbot dup:
https://lore.kernel.org/all/20260827053748.3755-1-getfeus@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/20260828105926.930033-1-oushixiong1025@163.com/

#regzbot report:
https://lore.kernel.org/all/20260829094750.574649-1-mdawid@gmail.com/
#regzbot fix: Revert "PM: sleep: Use complete() in device_pm_sleep_init()"

#regzbot report:
https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/
#regzbot unlink: https://gitlab.freedesktop.org/drm/amd/-/work_items/5714
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

#regzbot report:
https://lore.kernel.org/lkml/3023d7d7-c8ab-48e7-a0e4-e18cc4ea0b9a@nvidia.com/
#regzbot fix: serial: 8250: Change console_msr_work to IRQ_WORK_LAZY

#regzbot report:
https://lore.kernel.org/linux-usb/20260813005635.34750f8c.michal.pecio@gmail.com/
#regzbot introduced: add8469b3e00
#regzbot title: usb: xhci: ring Underrun and missed Service with
snd-usb-audio due to isochronous scheduling problems
#regzbot monitor:
https://lore.kernel.org/all/20260821114706.34b095b1.michal.pecio@gmail.com/


#regzbot report:
https://lore.kernel.org/lkml/20260808034716.58888-1-phollinsky@holtechnik.com/
#regzbot introduced: f3b1357673dd

#regzbot report:
https://lore.kernel.org/lkml/3023d7d7-c8ab-48e7-a0e4-e18cc4ea0b9a@nvidia.com/
#regzbot introduced: d3539347022a

#regzbot report:
https://lore.kernel.org/all/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com/
#regzbot introduced: b8eeeca5545659
#regzbot title: clocksource/drivers/timer-ti-dm: OpenPandora (OMAP3)
fails to boot
#regzbot fix: clocksource/drivers/timer-ti-dm: Register
clocksource/event only for am654
#regzbot monitor:
https://lore.kernel.org/all/20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com/

#regzbot report:
https://lore.kernel.org/all/20260810-serial-v1-1-abbe51602c13@debian.org/
#regzbot introduced: fc220d6be3c7
#regzbot title: virtio_console: sleeping function called from invalid
context at
#regzbot fix: virtio_console: allocate the port_buffer with the caller's gfp

#regzbot report:
https://lore.kernel.org/linux-nfs/apE90ZRZB8IW_AiS@jo-so.de/
#regzbot introduced: 0ac903d1bfdce8ff40657c2b7d996947b72b6645
#regzbot title: NFSD: U-Boot can no longer access symlinks in
NFS shares
#regzbot fix: NFSD: Return NFSERR_ISDIR for NFSv2 READ and WRITE on a
non-regular file
#regzbot monitor:
https://lore.kernel.org/all/20260828231841.282003-1-cel@kernel.org/
