Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02E33AD9C
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222017; cv=none; b=qhtHnVnAT6Cshyh1nXc5OP1vcW/N2bQLTOljklehK0xLP/ae3OzDXV9ytQQ9cKM01BXcGEJ8xX00qcUMiG0sq14pyXtP1tw9oVL3/TUdUoeDFLEDUg8Jxe2YNJA9xoNfNlG1nY+frLHIoZdOjnV9LlnTlZVbi2u+gb72+8GlkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222017; c=relaxed/simple;
	bh=lCKo62+PdQ9b8FPWXetloQ/qLurm0UCRo6ajqLyX12A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJbUQM/XLsIjFC664q3UOX287M7iRc69kGAO4km2Xge0BrPleI9aeYreUFOz5GM39DAscDIsBQ5zZmI3uj4rUZ6VJewdmXdjGCf3/TajS95rqEX6gShWtsZQlW2OOypKFlkfr1PH3zmDARaHKn8s44/WNYucB+99AEPyz7u3ymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aM0tTOCW; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aM0tTOCW"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gBfSw2gkLz8klS;
	Fri,  8 May 2026 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778222000;
	bh=lCKo62+PdQ9b8FPWXetloQ/qLurm0UCRo6ajqLyX12A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aM0tTOCWxrAFOavdcHrFzrHiPlsnZyMr2BxxNOycyrjiB9uvncXmKISPfHPLeSv8Y
	 cb3ZJlxCpnGZtCrpReULw5O/geO1LEJDRqlY99mxlrIZf34nhvXnwy/2En0Hd5DtXk
	 CvWDP5G6bV5CWVpWFev1LL5Q+xvnYySkvA0NsBX0egbNnfEYmcOXbS7hRh5sYRVk15
	 Nzwz0sufuUYOAMizSWXBSjijHj/0KMIfZsaFfokLwPyT3MJuXBoJrl8CnJjxZCNkR9
	 XA8PrjLSN/N/JPyXEurj2/nRJ2gL5Rq43zd9x5EIl7Wt3CrfukxQpp0HVuNPD8Yq7i
	 BAdUbF/N5pcUA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gBfSw1x3kz8kl2;
	Fri,  8 May 2026 06:33:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gBfSv2ZnFz8tZp;
	Fri,  8 May 2026 08:33:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9D58961826;
	Fri,  8 May 2026 08:33:18 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
Date: Fri, 8 May 2026 08:33:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Tony Rodriguez <unixpro1970@gmail.com>
References: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>
 <371674dd1f67973025d9fa293c01c99ee3279fc8.camel@physik.fu-berlin.de>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: 
 <371674dd1f67973025d9fa293c01c99ee3279fc8.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177822199895.1965071.4662186663855972614@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9D58961826
X-NC-CID: 4GNVuDBa2B5b5qI86awJ0i+hcXD8pvfsPLajzhlyQ2joMYTIQzk=

On 5/8/26 07:51, John Paul Adrian Glaubitz wrote:
> On Thu, 2026-04-23 at 18:30 +0200, Thorsten Leemhuis wrote:
>> FWIW, here is the rough timeline of the regression, just to be sure we
>> are all on the same page:
>>
>> * The regression I'm talking about is caused by d6e152d905bdb1
>> ("clockevents: Prevent timer interrupt starvation") [authored:
>> 2026-04-07 10:54:17; committed: 2026-04-10 22:45:38; next arrival:
>> next-20260413; merged: 2026-04-12 19:01:55; v7.0 (2026-04-12 22:48:06)]
> [...]
> Tony Rodriguez from the SPARC community has observed the regression on SPARC as well
> and proposed a fix to address it [1]. Not sure whether he has retested on the latest
> commit of Linus' tree yet.
> 
> Tony, can you verify that 4096fd0e8eaea1 fixes the issue for you?
>
>> [1] https://github.com/sparclinux/issues/issues/79

It's likely a different regressions, as that report's title says that
v7.0.1, v7.0.2, v7.0.3, and v7.1‑rc1 are affected, which all contain the
fix, aka 4096fd0e8eaea1. Reporting in a new thread is likely best, as
the authors of the culprit are not even CCed here.

Ciao, Thorsten


