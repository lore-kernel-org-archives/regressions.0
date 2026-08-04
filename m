Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A79456E0C
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840954; cv=none; b=beSjEVMAOttggf3dKWeOMSNFPD3Y5UbzoLeGYW5qa6rm5sFv9MP6qqR1wsZHkJhZAH3juF13pNeY1VCFbqtywOHyUNQvC6yE6BTFMUjP0MfPz9A2kwL8bJuOauj6dzoER7bHDNOczg/BwqVPpDY1dZEwcMnMD6xOY0PSGLcrHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840954; c=relaxed/simple;
	bh=hYD/uJkbb4bRMfK5l/rut1196ykv3mdFGue48M0JJRQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sEFdmsuYL2xPbE7ccPdVeb8jKG+H27fWlG7hzCCVfBMqt0wiTqOnKfA0DrL68/M+VFytHcO+ueIkkqc5lUUiAinztGiIJzMDBZkh6d5P1C4yWXRblMI+eW8k9/oEGAfkWt2/BHH8M/7iIMIChlQsGMMHftw6r8VOQC9Ujc4Js98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=C+a/SO4W; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="C+a/SO4W"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hDr7055dXz8Fn5
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785840940;
	bh=hYD/uJkbb4bRMfK5l/rut1196ykv3mdFGue48M0JJRQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=C+a/SO4WVzbGQIcXXEINtRNDjimcuHRaZPEk9DnIaqh2MZtOrq8P+1B41hfPnje7H
	 D8BeOPq/4S/IvhldEboAzEOzjrJ/7tijQzqsHgs9auJSvgxD95whkKwLRektgmBnW+
	 YvtQ4r/ZD5dENaGPwuVadWiUqn5WCHDMJuwqZOJQsd8EnUngquvgXJewiCWRkxeZWV
	 3icFLknZxVkhsGHkFeEJZwvIwNaL3xp7WZRg1QiC2tnJkpXnuu+DjSKMeOd8CJA1Zi
	 LEXhTCXZePkXVOks9h71CFjwWetB7G2MvN1DP3SjvvMoADqPiXnEN+rfZlv4xr1KrE
	 qdtmdyvxwvvLw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hDr704P83z8Fmx
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:55:40 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hDr702vstz8sh8
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:55:40 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A102A5FC63
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:55:35 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <54e37cb1-1d0f-4728-b917-bf54a4514fd6@leemhuis.info>
Date: Tue, 4 Aug 2026 12:55:34 +0200
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
X-PPP-Message-ID: <178584093587.493415.9937359750046238820@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A102A5FC63
X-NC-CID: C01zK1FCr21Y/UX3pdzlYts2EwrWRFWtllCj6UafCc2+I59GLNY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221827
#regzbot introduced: 1191285ecb4233
#regzbot title: drm/amd: backlight at 100% is set to dimmest level

#regzbot report:
https://lore.kernel.org/lkml/20260724151419.26014-1-spasswolf@web.de/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221818

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5557
#regzbot introduced: 443290d70b01e9c35830c300e3247c06581b5
#regzbot title: drm: amd: crash when display tries to turn itself off


