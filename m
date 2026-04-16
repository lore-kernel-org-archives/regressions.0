Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F6332604
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327789; cv=none; b=ZkLCmHMuA+2hBu8ORt2jNDznREKoJRebqpw4KzDwuhJH4beiQniPJzYbt3AqlbpWJrsBXc8up/k96pS7OT5wkUsbKgSNJKW+B2TgKardcO8be/FzYN2a6rTyJh/mzEyh7bvniSU0ff/tVh0aNFe49wCxNpJFxfKvZDgoL/BBb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327789; c=relaxed/simple;
	bh=iO14iXEc5oLLuQcN35in0IXZw9mdYPEW++qBQhusv+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=jJM+LNWe6iwP7CQ4/5cu9sDOvYG4sY+hooVOdF/mRxBAk1OGz+8E6tiemXMkr6cB24OoYeiRR51gBaKYwEy2acQOclDDTrDowpJHbs5LVD1AJHOmO6L/DFQqgT5O0SvnBsuoeHAsOTeFWmEzfX7K7qGXkEZsnw8BU/iULVMlXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ivGANpWv; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ivGANpWv"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fx9xg6PcZz4360;
	Thu, 16 Apr 2026 10:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776327783;
	bh=iO14iXEc5oLLuQcN35in0IXZw9mdYPEW++qBQhusv+8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=ivGANpWv5Qjq0IWdHQ3gGhdoHHxQqwzwCgW6OtgBgiuoQlpp1rjCoU98CH0XUSL8P
	 9pCMKl89EdQ+oRTUie/zbU/ujkippK8ulk5itC5Zj+fdQBF1u/iBi++MArh55D/Ory
	 4+ZNghYro5jruIXOR+aQcRMOKH+gMO3CKR2rwLiu2sbMl3e5zeEN+vXKc1qAGTdi3d
	 8gqqJ4hUseIy2QNaX/kPmqv/dD9m41UpoTVZy0isE34lD/iyFdmWOaQDUCIQMc1xZ0
	 FHM03wFpGglWGdnUhB6s7FCOtV+pAbsP8IvpTnIsaNAEDSR4hRTQ62JcaHwyBC8RSa
	 oBPDTkJbRbXJg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fx9x20mNnz40XD;
	Thu, 16 Apr 2026 10:22:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fx9x10GZRz8tY2;
	Thu, 16 Apr 2026 10:22:28 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BE18F633C0;
	Thu, 16 Apr 2026 10:22:27 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <10843916-38a7-4d19-8c23-4b2014806eaa@leemhuis.info>
Date: Thu, 16 Apr 2026 10:22:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pressing the power button causes the device to freeze completely
To: Evgeny Sagatov <sagatov@ya.ru>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <184091776095270@mail.yandex.ru>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Michal Wilczynski <michal.wilczynski@intel.com>
In-Reply-To: <184091776095270@mail.yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177632774807.3484110.8040801677991415031@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BE18F633C0
X-NC-CID: Ta5+vXKASD09ibVEXYqrh8/a6CLNg7h+74bWkT2bvC3Nw0s1XDg=

[removing the stable list, this is not something for them]

On 4/13/26 18:46, Evgeny Sagatov wrote:
> I have a PC with a motherboard GA-EP45T-UD3LR (Rev. 1.0) <https://
> www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10> and processor Intel
> Core 2 Quad Q9550.
> Previously, I had Debian 12 with kernel 6.1 installed, and pressing the
> power button would shut down the PC as usual.
> I updated to Debian 13 with kernel 6.12.74, and now pressing the power
> button causes the PC to freeze completely.
>  
> I see that systemd doesn't even begin to shut down. It freezes
> immediately after pressing the button. There's no error message in
> console. There's no error message in the logs either. Netconsole doesn't
> report any errors, and the kernel doesn't panic. It just freezes completely.
>  
> I checked that Live CD with Debian 12 continue to shut down normally,
> but Live CD with Debian 13 freeze.
> I tried updating and resetting the BIOS. I tried various kernel
> parameters related to ACPI settings. I also tried kernels 6.18 and 6.19.
> Nothing fixed the problem.

Could you please try 7.0 as well? It contains a fix for the commit you
mentioned below.

>  
> If I unload the "button" module, the system doesn't freeze, but it also
> doesn't shut down.
> I built "button" module by rolling back its version to commit 1a20d40
> <https://github.com/torvalds/linux/
> commit/1a20d409c874255086e2f42a729826d490294c91>, which corresponds to
> kernel version 6.1. This module does not freeze, but does not turn off
> the PC either.
>  
> I've found that the freezes have been occurring since commit 0d51157
> <https://github.com/torvalds/linux/
> commit/0d51157dfaac05ea66616d8a250dce04bef49a4f>.

That is 0d51157dfaac05 ("ACPI: button: Eliminate the driver notify
callback") [v6.5-rc1] from Rafael. But that is a very old commit; and
you seem to be switching distro versions and kernel at the same time,
which could interfere.

How did you find that this causes the problem? Did you do a proper
bisection and thus checked if the parent of that commit really works?

> Unfortunately, my skills are not enough to understand the reason for the
> freeze.
>  
> I'm attaching dmesg and lspci logs.
Ciao, Thorsten
