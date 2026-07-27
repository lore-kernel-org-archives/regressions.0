Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629F353A9D
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134658; cv=none; b=Wk9jviSJ+YQcq7Ydg0yWC7k7zSjss0hLEIZVvVbq3aBlDP4e/pBddm5aI/SKSz3O7Z62NXnop9jNA13Xf0UqISYwL70LI0FXv+Fl6RDzFjtSxQ48rX8uXm7ppJsqRITuQto2zRYGPDZYsocOzdEEMTmvXLTHc9Vq0oD8I31VyBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134658; c=relaxed/simple;
	bh=jl79Lc3XXYQSpnkh8ayGR71/Kpn4u3ExNM8zgC1h/H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sgVepCNhsYzvAB8BLu42JSw8K59PTTJdnBMlKaZ3xSFFqMxw7WGa1rUJcGQXJCo461l++30hICA0Fb9aI1V54cJA78c4ivEm+GBQPsu4SNH4bC+WfFPlMKwAw6hZtcrbC8Y45qv+GH5IeEi9Fw5KqaBaA4pUe2aSGQxrjK0mnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YhadP1F2; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YhadP1F2"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7pwQ1248z8jrB;
	Mon, 27 Jul 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785134646;
	bh=jl79Lc3XXYQSpnkh8ayGR71/Kpn4u3ExNM8zgC1h/H0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YhadP1F2RxCe3RqfEGzJ3sNK73YthmsKnKAId0n2T2nPHDROMtoQZte4yCqzSGez4
	 pxfVI8ttN0dlKd4J26SZaZIptp9OG8Fw+bymwFxVlLsDcXc0+ZN7smBRDo9AqSo7dv
	 2lfUxRA1Jl45zTuFWOXAEZR89y7Xx0gomWyE0oTiXT7XBG5ymh057APqWUBLIwZpr9
	 OGPCaeYhbU0yQ6hctxwcE42USJMPutNFjcUtYdHqFjAzBuGmDBcCe39hYdCgyc40uV
	 /DhdA39AExNPbEgBaZDfKNIfKcvw0le60pzt6eNOYOnQTgjwiPDOp8gftw3dmx2YK7
	 /RWuRLTZLFMdg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7pwQ0JcVz8jql;
	Mon, 27 Jul 2026 06:44:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h7pwP1RRHz8sbc;
	Mon, 27 Jul 2026 08:44:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 85C655FB98;
	Mon, 27 Jul 2026 08:44:00 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <00c2bf41-f3a6-4e43-89a7-c7a59f36a832@leemhuis.info>
Date: Mon, 27 Jul 2026 08:43:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] No physical display brightness control on kernel
 7.1.x
To: anon <anon90372@gmail.com>, regressions@lists.linux.dev
References: 
 <CAPu26+sy2awkTJ3=abmDXzuaBBaC_LM8_QZm8kmhVBHLkmMMwQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAPu26+sy2awkTJ3=abmDXzuaBBaC_LM8_QZm8kmhVBHLkmMMwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178513464072.662762.194582056550671015@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 85C655FB98
X-NC-CID: VUO/V+ulEc9H9e+sIC3clCRXZEH5lQaJZ1BcoPxrA4jE0tx8KFs=

On 7/25/26 22:04, anon wrote:
> Device model: Google Pixelbook 2017 i7 (EVE)
> OS: Fedora 44 KDE
> Kernel: 7.1.4
> Firmware: MrChromebox UEFI full ROM (https://docs.mrchromebox.tech/)
> 
> Hi. I'm experiencing an issue on the above system where adjusting
> brightness values via the DE UI doesn't affect the physical brightness
> of the display itself. The problem began following a recent system
> update.

This sounds a bit like a known problem (see
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507 ) that
is fixed by a411ea4a871628 ("drm/i915/backlight: Remove
DP_EDP_BACKLIGHT_AUX_ENABLE_CAP check for DPCD backlight") [v7.2-rc5].
This likely will be backported to 7.1.y sooner or later, but if you
could confirm that applying this to 7.1.y fixes your issue then we could
speed things up by asking the stable team to pick this up.

Ciao, Thorsten

> Admittedly, I haven't done the work myself to verify that this is a
> kernel regression, though I believe it probable due to this forum
> discussion: (https://forum.chrultrabook.com/t/2017-pixelbook-backlight-control-doesnt-work-with-7-1-kernel/8954),
> the efforts of the OP in that discussion and the fact that I also own
> a Kubuntu system running kernel 7.0.x without issue.


