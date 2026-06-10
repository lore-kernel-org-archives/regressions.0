Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828E33438F
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084110; cv=none; b=heFmLYx/Q8leUy0SffAk15J8R4NSdqoJYmaQM0LW+uJTI/DO5IRv6XdoJaK40QxMK6hDlRWFKAFZGu8B6vH48ozgwdpsgf1dH/W6DeOJ9Uh9xWlE/jsDkfYPrPh9iHbyirlu+ZhvYx70lt2mkOLh/xLiUOhdLM480zyj/JHy8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084110; c=relaxed/simple;
	bh=S0M2Cth8pZwQfQOa7dmLVKP+EcyGu6sVDYt/ZnaQcSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fq3bqsp0dJe7U4Hu8EYLpS19gK/t/3/FBIgVidzkxZ7qqQh44JYQO+6IdLYbHRVMT5yJ04EwyKOlFpVGh/L0fs1l0B1DfFgr2F0b35dq3p+x+TwVoycjNzpyK/okAE7rvawBfYsvgPQW5b0IkkWPxG5i1xPCEblPpiRj/hrjnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PthFqRAb; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PthFqRAb"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gb0nM317Dz71ql;
	Wed, 10 Jun 2026 11:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1781083687;
	bh=S0M2Cth8pZwQfQOa7dmLVKP+EcyGu6sVDYt/ZnaQcSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PthFqRAbFCgu4w0YctJ28a79BiD0jHo44vb3aRdFy0oxvPiGZ4/OPJc9lM3KyfpyR
	 B9dl7EJvDuwFTJ7SVN3Cl3FJJZ+SbL5aAeEbaY6cPBpCmEYh6QMZGeMD11gjpRs7AM
	 nw/01HbLpBv7LqR8SR0SIxQCulNJL1uiMx4S2sQkIxmi1+x6rKy1KbQTZqf963Hh5T
	 s3uvfXdICsBnupmROfLlFIFpox5/lHMg837kCp+oLwJ1I6lg143bd2w9GY/j36nGbu
	 W8O/mHZSldgYnsVvN3zjvzYG6mxWCM5OBoRfVcgZuJlc4H+D2xUnlny8Qi41I5ow12
	 z5CYdkvwRuXIg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gb0nM2KCMz71q3;
	Wed, 10 Jun 2026 11:28:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gb0nK1J2Bz8tdc;
	Wed, 10 Jun 2026 11:28:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BFF8861834;
	Wed, 10 Jun 2026 11:28:03 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b68dc2ab-ab54-435f-a4e5-05b1b8397505@leemhuis.info>
Date: Wed, 10 Jun 2026 11:28:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] wireless networking broken on Pinephone
 Pro
To: Oren Klopfer <oklopfer37@gmail.com>, linux-rockchip@lists.infradead.org
Cc: regressions@lists.linux.dev, pbrobinson@gmail.com, heiko@sntech.de,
 guptarud@gmail.com, megi@xff.cz
References: <20260607225901.64019-1-oklopfer37@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260607225901.64019-1-oklopfer37@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178108368414.1890399.13005960660434409860@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BFF8861834
X-NC-CID: 598cZP64CGrnjzi48ziqCffhEELqW7MMqIF991CvHUWGt+Cmwdc=

On 6/8/26 00:59, Oren Klopfer wrote:
> Apologies if this is not formatted properly, this is my first
> submission to the kernel mailing list. WiFi specifications were
> introduced into the Pinephone Pro device tree in
> 096bd8c679185f898cae9933c6a68650fa26ea4f, but this causes complete
> networking failure on some devices. The regression affects all
> versions v6.18-rc1..v7.1-rc6.
> 
> An identical issue was reported for the Pinebook Pro at https://
> lore.kernel.org/all/aUKOlj-RvTYlrpiS@rock.grzadka/; the regression
> was reverted in 29d1f56c4f3001b7f547123e0a307c009ac717f8. The errors
> faced on the Pinephone Pro are exactly the same as were reported for
> the Pinebook Pro regression.
> 
> A previous patch at https://lore.kernel.org/all/20260112-
> ppp_connectivity-v1-3-284d6e83b212@gmail.com/ attempted to resolve
> this issue but never ended up being merged.
> 
> 096bd8c679185f898cae9933c6a68650fa26ea4f is the first bad commit
> commit 096bd8c679185f898cae9933c6a68650fa26ea4f
> Author: Peter Robinson <pbrobinson@gmail.com>
> Date:   Fri Aug 29 12:38:24 2025 +0100
> 
>     arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro
> [...]
> 
> Reverting the commit allows wireless connection to function again. I
> am not really familiar with the process of submitting a revert
> patch, but I'd request that this be done on all of 6.18 (LTS), 7.0
> (Stable), 7.1 (Mainline). Thanks!
Thx for the report. Sounds like a revert is the right course of action
here. Could you submit one with a stable tag to ensure backporting? That
might be the fastest way to resolve this, as that makes it easy to
process for the maintainers to process this.

Ciao, Thorsten
