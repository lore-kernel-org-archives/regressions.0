Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1EE374187
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499937; cv=none; b=EMW3NtKq5dX/r2GtPil+Q/evEoJNEPl0y8AUXJASIua7STRpwobSaKLWaT68q34GatoM//HToUdnVoO6jfiFBUNYqD22G9OuhCNTZo1OT4I/zrLJ+/1FBcrPyyUkbHQnB2VPf26JzrvXseTW8cUsGqoZHnoC09MVFggnLTZ0oPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499937; c=relaxed/simple;
	bh=LoBBFFmJSYRfR2t6BmLfXNxl3t73iagTGsznReQ7kvY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=L2WrZgCy5lpZMR4MZWbQ7PcBGQ/ignccyqosVYsqoY/ZcJRfYtoBvz3bPdh3iH63yUZG0ZVC05Y+gtvzqMpIDG2aOlyoR0dZthZGRVVJzhezxIzuSixPMnCuUlG68qHaUEXGmVa3p1AmwJAla+luYoyyFxETcytyRtAJS5INijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=beWtsixL; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="beWtsixL"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gDdFm0L8lz65s1
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 13:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778499932;
	bh=LoBBFFmJSYRfR2t6BmLfXNxl3t73iagTGsznReQ7kvY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=beWtsixLXBjiTfKU2JqfrhbuxsbUY56Eq1W5QwbKtBbzgmOIc2tPo9wgcZf5myVDc
	 6rBbE5VMuDk4gNXFfNMU0SqVJhuL3/vqaMWXzN1HSr93zUhIQ9dJo+4LGlOx/sYr4r
	 aFmAdyeiQddI1UfW+98UQ6RWwsxU9nublNXZOnkZdsCaWrTkF81ZODn4dnAjqUganr
	 Eyr9AJ4UBZ915LgV3hrujoG6V3q1DctdtANya5bGQdOnEzhAu08D+2JebuRVOY1D70
	 q9jUeZ4XpnQvn3T+AYbAV2JdOME47/MYIr5H+7LO1/anvELQdy3ZWUZV8UGWhCseuR
	 fVOpctZcmNMug==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gDdFl6krQz4xZL
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 13:45:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gDdFk4wzRz8tZd
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 13:45:30 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0D43C60300
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 13:45:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4a4afc5e-2b86-4c2c-a48c-1e86a88f9303@leemhuis.info>
Date: Mon, 11 May 2026 13:45:29 +0200
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
 <177849993021.4072723.18375345307705474295@mxe9fb.netcup.net>
X-NC-CID: 7AR0nrK7UJ4o8H7QAOtAc+80KW0E6HsWgPf6rKNatwri39DOud8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
> 
> Interacting with regzbot from arbitrary places is a recently added
> feature of regzbot usable via the new '#regzbot report <url>' command.
> The indented use of this feature is for updating minor aspect of
> regressions already tracked, e.g. "change the title" or "tell regzbot
> about a related discussion". Such things until now had to be done using
> regzbot commands in a direct or indirect reply to report -- but there
> they would mainly be noise for most others and just add to the huge
> amount of mail people already get. It's also takes a more time to send a
> lot of individual mails instead of preparing just one.
> 
> The new command will be documented on
> https://gitlab.com/knurd42/regzbot/ once it got a bit more testing.
> 
> Ciao, Thorsten

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5272
#regzbot introduced: 33efc6346e8cf7
#regzbot title: drm/amd/display: screen goes black halfway through the
booting process

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043
#regzbot introduced: 40d2f5820951de
#regzbot title: drm/i915/backlight: S0iX broken

#regzbot report:
https://lore.kernel.org/lkml/CAMpZ1qEwNOqR-KQD4kEqd93aB-TpHnG6WdQc2tXUF0aXMmw_SA@mail.gmail.com/
#regzbot fix: c171e679ee66d7

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221394
#regzbot introduced: dbf9b7bb0edf
#regzbot fix: wifi: rtl8xxxu: Detect the maximum supported channel width




