Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED9449EB7
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 18:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980285; cv=none; b=UpOac7ZmauhAYsxA41VuZrmixylyhaf17idxByZjWnJh/toOb8WvUjWCjCa1luEZOoxSyU9aQvZ1QW8E6Rf1reJsCnEBeSUkokUOrCXEwF9ZtRS4Uzzt2uevDK59buxuQcGHM2vqjPHPb7eApm/Gxqotws3J3pwARTkYjbiaJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980285; c=relaxed/simple;
	bh=TC+9X3XNrQ6yzD1uDevruiF4F3xBaihyG1YtVGrkQwQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=an8VzFdqVNGLGESlbKRRYrSr0A4JeJA4TWAGyVfRfmaAzAiGiHbexLd0oCdS5IEcV8hz5IiyZsnZQFkemzQCXnA2ivljTXpL+InV/2EN7FPnqmgzgohFTVghtrd4SgzRwjOaXKaIDGAenBc9mNBmc2tcsGEG58UDufQGeYkB8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PfO/FHvl; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PfO/FHvl"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4flbc81XFLz95Sy
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 20:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1774980280;
	bh=TC+9X3XNrQ6yzD1uDevruiF4F3xBaihyG1YtVGrkQwQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=PfO/FHvl3i4BJWik8lUD+FEo8xG3VpxdFbDNxoYcA60/Q2qBpp8yG2Zr/set1quOU
	 aoejtUPT4VhXUTP19qnACNAQ6AqQSmWnEVnZsz9oSxZjpxkc3pBoheHZF0rFL/KkHX
	 3fGJTW4ZguTrQ+WayEU7E5vwyv6ZXw+nu0x1mS0ngoU1T/y+l7t61b8XoNhEtYypQR
	 RRkSVJ2NdhifhIUp7Tt0iJc+Y4wGaYeO4mzX6Zrrsan1xIdx0f8gOZVBkPpzhTecEK
	 jiD2sNCJGnYI6SZCDZlc6HoQOjeXjtuj0jducgT6n6ojJg4Yda6iBYP7OpE6vEGsRn
	 yJl5PJPuHf89g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4flbc80svgz7wCw
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 20:04:40 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4flbc7674zz8svC
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 20:04:39 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 53AE0632AE
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 20:04:38 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4ce2109a-e51b-4978-96ea-dc4e02c171b4@leemhuis.info>
Date: Tue, 31 Mar 2026 20:04:37 +0200
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
 <177498027851.1736904.16203504646402803547@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 53AE0632AE
X-NC-CID: mYx8VmkyFGqLPkRUdFMp1JZ+YANsD24AUwqAULFreRMbF2zADVw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221271
#regzbot introduced: 0a3fe972a7cb
#regzbot title: HID: core: GPD Win5 handhelds stopped working
#regzbot monitor:
https://lore.kernel.org/all/20260324013847.68024-1-honjow311@gmail.com/
#regzbot fix: HID: gpd: fix report descriptor on GPD Win handheld
(2f24:0137)

#regzbot report:
https://lore.kernel.org/lkml/39ef5c99-ba8e-40c1-bf93-359db7297d55@kernel.org/
#regzbot fix: "Revert "ARM: dts: imx: move nand related property under
nand@0""

#regzbot report: https://lore.kernel.org/all/abcGli7C40kr72mB@m.b4.vu/
#regzbot fix: ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from
SKIP_IFACE_SETUP

#regzbot report:
https://lore.kernel.org/lkml/20260312173349.GA137045@francesco-nb/
#regzbot fix: e8d97c270cb46a

#regzbot report:
https://lore.kernel.org/all/CAOKSTBs1VNBdjRZe3M2v-nC%2BpLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/issues/5052

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221023
#regzbot introduced: 2cedb296988c
#regzbot fix: mei: me: reduce the scope on unexpected reset
#regbbot monitor:
https://lore.kernel.org/all/20260330083830.536056-1-alexander.usyskin@intel.com/


