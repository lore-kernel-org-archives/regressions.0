Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D832D0614
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365722; cv=none; b=RCV2jXAYW+lNNevpDwJmdYf3GYRiQFz4jj+QdNj0CKNmdFkNp5Rq1e/Bhbqw2yIS8cSAdsNOjChl1snFM9jagRyExp0Vz01+uLcPuo61nDHPtV2TEH4dd4qQ8orOmO5pOPxQPFtpfY3iKu8woDsJKEINEMGN2iVJGT3bQMoKEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365722; c=relaxed/simple;
	bh=DdEqWnDc3ZiFQy37P0HUypH2IdUfiwEbjJclRv7NLsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aOqbjr8TR6Ou18mJLCc9iEynlpBdHT9gNQzkmPBHJJXY4og0p1cVdjD5SWS9okeffvmWTumRIOpWudPAHX8IORLPH1I5MH17ZUif9T7uOj7UY3L0ZLqJ0ZXQVl4TZziAGr1UptRY9GBkyPO0IDv31vOGA0DdJU6iKukKiuOTkT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Gs8JB4AJ; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Gs8JB4AJ"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4g4Yns0tfxz8fcL;
	Tue, 28 Apr 2026 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777365713;
	bh=DdEqWnDc3ZiFQy37P0HUypH2IdUfiwEbjJclRv7NLsw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Gs8JB4AJ7CiobSGmROBUc5h5Kr5Z2mEoDKW71UUlG255IyP54yax/m46HvfmL0mNV
	 SqFIVM98yDc8AWs7pLnimQJGA1qmW1kof8gG/q9hG9eQmb//KuIdaaxMj7/Y9eZq3v
	 XRXMv68WxlGAfAxHwUSIaO4CbPYTc3qEMz7dRH3BOQCSUneo8UZsnrSVpKhcgvSds/
	 LyYyJ+d9gCf50JFTuoClHfhe/FP9HyDdRy3F8IwgWqjs347C8kMHcm6QZrRTkJfunp
	 pNpjMRkKr+PLuJw5mSOsIXtK3jh4aVVRCZhQLvisDLA1tONpWkS72m1FPlGL03XnA1
	 f2EVBVx6cOkag==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4g4Yns09NJz8fcF;
	Tue, 28 Apr 2026 08:41:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4g4Ynr3PYdz8tY1;
	Tue, 28 Apr 2026 10:41:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CE652633D0;
	Tue, 28 Apr 2026 10:41:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <833c7e46-c44d-4715-b2ea-01723ada8e58@leemhuis.info>
Date: Tue, 28 Apr 2026 10:41:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.12.y regression] Regression with 58130e7ce6cb ("PCI/ERR:
 Ensure error recoverability at all times"): echo vfio-pci >driver_override
 does not work for DVB Adapter
To: Lukas Wunner <lukas@wunner.de>, regressions@lists.linux.dev
References: 
 <177373189751.7987.7156982489427825197.reportbug@obelix-trixie.bs.de>
 <acfZrlP0Ua_5D3U4@eldamar.lan>
 <f0054ecb-2524-42e5-ac1d-ed8ab114bcef@leemhuis.info>
 <ae2lgMRLPDQZSzI6@wunner.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ae2lgMRLPDQZSzI6@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177736571202.1347080.3882828679099835305@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CE652633D0
X-NC-CID: V5eWmLN/qR8yjSPYZplvLTHLH8n3IZV2p1z4XVtOzBHno0gvbCs=

On 4/26/26 07:41, Lukas Wunner wrote:
> #regzbot introduced: a2f1e22390ac
> #regzbot introduced: v6.12.70..
> #regzbot introduced: v6.18.10..
> #regzbot introduced: v6.19..

Thx for this. This is an interesting idea nobody had yet. But I guess it
should work the other way around: assume that affects all branches that
contain a2f1e22390ac and a backport of it, unless told otherwise (at
usually that's the case).

> #regzbot title: PCI VFIO passthrough broken if BIOS assigned incorrect BARs
> #regzbot fix: 'PCI: Update saved_config_space upon resource assignment'
> #regzbot monitor: https://lore.kernel.org/all/acfZrlP0Ua_5D3U4@eldamar.lan/

Any idea when that patch might be reviewed and make it further? I assume
Bjorn is the bottleneck (and seems to have been afk or something?)?

Ciao, Thorsten
