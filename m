Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3D43D9522
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900394; cv=none; b=Ac4YDF/Qgxfm+AmpYzOgyiRrjALgf+Z34Gd9+I3HCobN3CVJE77AgLSc8+3mxIroY9aZ4y7JLCufz7rHOuwQzCsK2/skP2X4SodRbxwi4TM3NX+uU5Bp2zG4Q/BoRG2vyNILwQ9iQAK2sZgw/YFVELEeOhMKR3cBd1HFmTPXdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900394; c=relaxed/simple;
	bh=7SbPfAx37VqYUqxPL+Vug027PL9gr1YL3zo5A0yu0QQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=WYbLg/8WSVM61SFzFRyaJE3JNQWrkYjTL3TnyEOaQIvjTPK21eUKuOtWuUbN1ffPJUK+sHX+oYPEYs6sbBx9M8clj+MLGWpeph21etsGDUmgYhw5rc2WyOprzgxmdqEBXZ3As+1WvrLn4iHy0Vku4IX9WZ8V+hkHmfViPdsQfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IhzLFaog; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IhzLFaog"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hWTlf0sBMz8kXZ
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787900382;
	bh=7SbPfAx37VqYUqxPL+Vug027PL9gr1YL3zo5A0yu0QQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=IhzLFaogiLsqYEFDaKh98h9lq3UNia2FZHFu1RoAGH1Im0wI/r9iurjTuucKF2DrI
	 MfqlmqJpbAdxVmRiugQJxsccomu89szPSBl2h4IGQcAwiPa0lLwJkILL5fv1weRC4G
	 aptLNXS/ud9XVY+1W6+XI7l75czKvfa3wm7KEmXqMe5KHX1FHT6CuTdGefJlCWawMO
	 fHb1Wym9wizJNk6g4IocmYSuQINRkGf2SzlwCQGMnDYzL48mIXhkX2GdRa6crrUFse
	 qxyZ3Da+lDwmKJm1ZzPH/IT5NPsSMoiJcMP32RC/QXEnBIM7YXTwm5OZU70OAh0Dq4
	 MpWHukUEiUxsQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hWTlf09CYz8k4G
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 06:59:42 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hWTld5Vcfz8sZP
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 08:59:41 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AD7B75F9CE
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 08:59:40 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1a01a392-6102-449d-8419-58be7b412065@leemhuis.info>
Date: Fri, 28 Aug 2026 08:59:39 +0200
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
X-PPP-Message-ID: <178790038088.3273212.5596014743040955232@mxe9fb.netcup.net>
X-NC-CID: UpNnLtw8v13eWhzbZvpqdsFUX89Pw33odKTejQ47ar+YXdpo4XM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260825212815.48959-1-mikhail.v.gavrilov@gmail.com/
#regzbot fix: drm/amd/display: advertise PIXEL_NONE as blend mode for
DCE generations
#regzbot monitor:
https://lore.kernel.org/all/20260813143605.106104-1-mwen@igalia.com/

#regzbot report:
https://lore.kernel.org/all/e301014d-568f-4ed5-bc64-b8a85ca0b1e1@linux.ibm.com/
#regzbot introduced: 3424d8c18a7d
#regzbot title: powerpc: userspace processes crash on abort() from libc.so.6
#regzbot fix: powerpc/entry: Clear TIF_SYSCALL_RET before syscall error
return
#regzbot monitor:
https://lore.kernel.org/all/20260828053811.1042300-1-sshegde@linux.ibm.com/

