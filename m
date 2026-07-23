Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C338E5C5
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785484; cv=none; b=S6CQwODubf/8eci2X2eNrgzb9fsDxR09so8rKVzR8jgPH64nkIBsZvL3zrSXf9rp24jcCbm9CdysjQZ+G/ZFx84tFVnxJu84gBNOZ02q4bHZaU57cmTm0eYz0lwjQiBkIQ01nujJAF89bqy0lTX5l/Frp2hSAzfTf2okvT8Yo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785484; c=relaxed/simple;
	bh=fVfbQ1KZfGWr2k4pWESaDaRgC/MhKG3diyKTHDECjPU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=t7YxXk9YYFApj362Kv/yWGbQfvRqztBi2rsfrOZ335enNMH6BlPLZz7/HUFVRxS52UKXaoXOWMazz4ITSSKQipnaBMZKao/D8BPxwQOvBiNVEs0zUg5mzlpArMMCN1O8X/W68gMzC4jAX8GUNNOL/wXF/JnAzMezcbX9Tm5e+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YUavELef; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YUavELef"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4h5Knd52Zqz44sx
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 07:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784785477;
	bh=fVfbQ1KZfGWr2k4pWESaDaRgC/MhKG3diyKTHDECjPU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=YUavELefFnrcSgeO8cs8MQddiMCBHUTnJMbQ37YhKDiKKzUpDzHxOyUx7a6WP62yd
	 LuSah5+A3cj7PALTKWCjIitlezz30N/milmia+AwDiH+/yfHx9oZgDYeTTsZbNyMIy
	 YwoE85dqlu5Do4BXjdwW1vpifBN5bkkt78Ec02fc/dpeQMEMz7uDcugrfoX25ON96w
	 9yekFsBvxOVgQ3HM72Zs8bTjTLgjSmXJL+sz+9KAgk2JpBtuFgrjq1sN06xfOOvb8x
	 2M/1fQbovrfgQrIcwWSn79IuNiMfU5ReZK+wrDpCcEAPwLNd2cksaK/P5vy9tkIwxI
	 CZa+M8sg6NFbA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4h5Knd4LClz3xmG
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 07:44:37 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h5Knd2YXgz8svF
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 07:44:37 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DF1EE5FC79
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 07:44:36 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <40feb9e0-edd9-4493-adeb-11ff23729836@leemhuis.info>
Date: Thu, 23 Jul 2026 07:44:36 +0200
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
X-PPP-Message-ID: <178478547708.3711757.9758003713815822342@mxe9fb.netcup.net>
X-NC-CID: sGgtX6QNDv4lNUWbuXlgNDDeQHTurptYkWKCxRTSe31Kx0oxfog=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221696#c10
#regzbot fix: Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c

#regzbot report:
https://lore.kernel.org/stable/MRWPR01MB12852A981954ABE86057B04AEBBFB2@MRWPR01MB12852.eurprd01.prod.exchangelabs.com/
#regzbot fix: drm/i915: ensure segment offset never exceeds allowed max

#regzbot report:
https://lore.kernel.org/stable/6eccafaaaa60651ef091257c3439c46b@stwm.de/
#regzbot introduced: 516403d4d85607

#regzbot report:
https://lore.kernel.org/lkml/784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com/
#regzbot monitor:
https://lore.kernel.org/lkml/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221721
#regzbot resolve: inconclusive: borderline, should not happen with
oldconfig and can be resolved with updated initramfs generators

#regzbot report:
https://lore.kernel.org/lkml/oTZ1wsFlcf4l8zMuD8DYCCvff35nVbFn7gTb5_vrUPSJtjVBSTmGti8S3KnbVdVWJEzP1QRbWma6UYYXyi6v2J0fl61khniPROEhsdxMIz8=@proton.me/
#regzbot dup:
https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
#regzbot dup:
https://lore.kernel.org/all/20260619204832.586079-1-dan@reactivated.net/
#regzbot fix: clocksource/drivers/arm_arch_timer: Workaround bcm2712
broken EL2 virtual timer
#regzbot monitor:
https://lore.kernel.org/all/20260710080958.491620-1-maz@kernel.org/

#regzbot report:
https://lore.kernel.org/linux-nfs/CAHC9VhQy4LOgQg0mk%2Bs5sjHOzMe1sxPUgJ2W7vRT8ms4znZp%2BQ@mail.gmail.com/
#regzbot resolve: fixed by a rule update

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5418
#regzbot fix: Revert "drm/amd/display: Restore 5s vbl offdelay for NV3x+
DGPUs"

#regzbot report:
https://lore.kernel.org/regressions/087dfb52-7ae5-4ad6-8e07-19e4f1834381@leemhuis.info/
#regzbot dup:
https://lore.kernel.org/linux-sound/95c21574-97d5-4311-9263-9e174d22d22c@opensource.cirrus.com/

#regzbot report:
ttps://lore.kernel.org/linux-sound/95c21574-97d5-4311-9263-9e174d22d22c@opensource.cirrus.com/
#regzbot introduced: e496112529006
#regzbot fix: ASoC: cs35l56: Fix possible probe() deadlock
