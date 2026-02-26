Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B3376BE4
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106169; cv=none; b=VZHCuSKobI9qxKLduwxR7dX6ukDGH/5wsnwlZHRGTzUemGDdrgnmhw1IpiMe/zt8yF5vfJHWEfhtJCHsDPoGoOTXszvMV24p3EihbZA3+D4UneUYd+TIXpgY9bUjCzq+ECDScI4n/3R6c2MS9AIJsk+gV0aWbUalVfMYa4fz92U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106169; c=relaxed/simple;
	bh=ZwOxhl0m7f8ACPsX34CLeKn5CefuFnSnB4gO2UuVQT0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=nvPaR77pL8ZSvABvVkq76eMyZhnHADho2WOsgAlefMZN11cFiX/QtWZ1kJGGMXmwBz6Zq7HyJr7HWYa0c0y1S0Z9Zv4cnVr46dlzRSFObGWryGbP5sbeE1U8xSFLspnvSOZMkmmbN/dcKc8xCo2KOb5GBSQX5P4qg52sNgb5elc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YPX56CG3; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YPX56CG3"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fM8V40KhVz4H2D
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 12:33:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772105612;
	bh=ZwOxhl0m7f8ACPsX34CLeKn5CefuFnSnB4gO2UuVQT0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=YPX56CG3hbWzTWLdPAVQMwgtYXmpsFVt+LBTth7RWlpm0Oz7zHA/u8CZZV05L2Va/
	 tvlu+fQppKmQF407w8BO2QpIJ3pVIvd+4lvSn+zCougJS+y/Ya0TehHC4LOiQ9jich
	 zKl8rmEp1zgdG/lM4P+ldQTYGcQ3MKW0kDQwBvGvp6dDgPBJ68uQInm9BPvU8ctznK
	 gnBRpb7Urx57D+ZGYiREFgVePCtSaqmDJJcizMvJPgS5DgGjaHpitnHMBjY9kxXpOM
	 s3Oal0cGDaAug0NnoQJ3eMoA/QSKfNCImDQl+xHt9SjdVHfV43uzMzVz+rjQN57nUt
	 fFDbazwo/NGrA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fM8V36m17z7vhT
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 12:33:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fM8V33BFvz8sfv
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 12:33:31 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3942967458
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 12:33:30 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <414b2060-930f-4b65-a6fc-bb5ea1165a21@leemhuis.info>
Date: Thu, 26 Feb 2026 12:33:29 +0100
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
 <177210561038.1711075.13057308647469010650@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 3942967458
X-NC-CID: itgKNFanZP4FmffJdzNsck60f6vPoyonGLg1JtgdnwMzecbYmSk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.redhat.com/show_bug.cgi?id=2440581
#regzbot introduced: d5ebe3f7d13d
#regzbot title: media: ipu-bridge: upside-down sensor DMI quirk needed
#regzbot monitor:
https://lore.kernel.org/all/20260225203058.40545-2-johannes.goede@oss.qualcomm.com/
#regzbot fix: media: ipu-bridge: Add upside-down sensor DMI quirk for
Dell XPS 13 9340 and XPS 14 9440

#regzbot report:
https://lore.kernel.org/all/CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com/
#regzbot introduced: d1b618e7954802fe
#regzbot title: Display freeze on VT switch back to X11 since v6.16

#regzbot report:
https://lore.kernel.org/all/20260226060714.1636773-1-changyuanl@google.com/
#regzbot introduced: 68a501d7fd82
#regzbot title: x86/boot: early boot SEV-SNP panic in direct kernel boot
