Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AB31A555
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361281; cv=none; b=F8aICgPdPjfBf5wdf4uR5iZ2+KN2Nwr9K+4eh3KVbnp1Wdj2GZO45nd/9CyPIw2ElTU0mLy/sxUoxbb9ZDaqxH51iojIDiR60VpvnpMIN1N/UvnLJpHV9O/Li5tQCKXQEylOiMIDxZxrb06iOE95dWg7L3H+H4dnSzStLvjyzFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361281; c=relaxed/simple;
	bh=6ZlNePSW+LesjNJSSMtlYhy1bPfYGCT/dT8RlNEwov0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=up3jT04c/d+ghWXjmRRXC7YXQtc7g9/qmWY7WKlwBiq2AJcGpaKwZ5joj6igYpyrser//NyhAK1LyljdxcUeNDIbW5x+YhCRSmm/iS3SOOjlc/spHcaqNgcM+IVH2YT305O/i4taDPUaWYcRhQw9EpIhVl56gUz5qrZrFJ5TCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZhxlblUz; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZhxlblUz"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4fxQBq2VZJz8hlN;
	Thu, 16 Apr 2026 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776360915;
	bh=6ZlNePSW+LesjNJSSMtlYhy1bPfYGCT/dT8RlNEwov0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZhxlblUzu8kskJTVcqUhfZ5fB0boBO6NNeNXnS4xFNxkdAzPVTVR3PmThaY5YdaTN
	 pwSOSI1l1X3G8gPkrQ2riJjJBBl76TROoSsF4is1Wpic5iEGOmHlPeQybJ4qdGF/pT
	 GW4k4L5n/Ae2N65ZXjG3QaG5AFQ4MB41IxTsdsbOW2ZsdkXqvUKpXzxN/6V2bWLFX8
	 FJcAFrFqa+kvBn+2bjYetMsiPIQeP46smXX1JaaexSxujUul9/Nvh5xoEVzGLDb4Ub
	 wC1BbAo2qh7PQJyiEoh76T7TNSzd2yycYoDzajcXSmH4ragdDKMo1chfKGHuwnpcql
	 PbWJCsKHcgC6w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4fxQBq1hjgz8hlJ;
	Thu, 16 Apr 2026 17:35:15 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fxQBp3zzBz8sWT;
	Thu, 16 Apr 2026 19:35:14 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3A4A263608;
	Thu, 16 Apr 2026 19:35:13 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c64d69bb-9df9-46b7-a1ad-aada30310d36@leemhuis.info>
Date: Thu, 16 Apr 2026 19:35:11 +0200
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Michal Wilczynski <michal.wilczynski@intel.com>
References: <184091776095270@mail.yandex.ru>
 <10843916-38a7-4d19-8c23-4b2014806eaa@leemhuis.info>
 <186071776359023@mail.yandex.ru>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <186071776359023@mail.yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177636091350.1878812.7694770508197627927@mxe9fb.netcup.net>
X-NC-CID: sBzxRd94WofCwVj1pxqA/cibEeLHtf3JFoOovkkMokgPR0JuL2s=

On 4/16/26 19:22, Evgeny Sagatov wrote:
>> Could you please try 7.0 as well?
> I compiled 7.0.0 kernel from sources.
> Unfortunately, this kernel also freezes when the power button is pressed.

Thx for testing.
  
>> How did you find that this causes the problem? Did you do a proper
> bisection and thus checked if the parent of that commit really works?
>  
> I don't think I did it correctly.
> Because the previous commits didn't shut down the PC or cause it to
> freeze. I think they just weren't working.
>  
> I also tried a very simple module tity-power-button. Pressing the power
> button when using this module also causes a full freeze.
> I think the problem lies with the ACPI functionality, but none of kernel
> options helped fix it.
>  
> I'm confused.

Then you likely want to properly bisect the bug. Might be best to do
that on a Debian 12 install (where everything used to be working) by
following this guide:

https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

But be warned: the regression is old. Even if the culprit is identified
the usual rules wrt to "no regression" might not apply, as fixing the
regression could cause regressions for other users.

Ciao, Thorsten

> ----------------
> Кому: Evgeny Sagatov (sagatov@ya.ru), Rafael J. Wysocki
> (rafael.j.wysocki@intel.com);
> Копия: regressions@lists.linux.dev, LKML (linux-kernel@vger.kernel.org),
> Michal Wilczynski (michal.wilczynski@intel.com);
> Тема: Pressing the power button causes the device to freeze completely;
> 16.04.2026, 11:23, "Thorsten Leemhuis" <regressions@leemhuis.info>:
> 
>     [removing the stable list, this is not something for them]
> 
>     On 4/13/26 18:46, Evgeny Sagatov wrote:
> 
>          I have a PC with a motherboard GA-EP45T-UD3LR (Rev. 1.0) <https://
>          www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10 <https://
>         www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10>> and
>         processor Intel
>          Core 2 Quad Q9550.
>          Previously, I had Debian 12 with kernel 6.1 installed, and
>         pressing the
>          power button would shut down the PC as usual.
>          I updated to Debian 13 with kernel 6.12.74, and now pressing
>         the power
>          button causes the PC to freeze completely.
>           
>          I see that systemd doesn't even begin to shut down. It freezes
>          immediately after pressing the button. There's no error message in
>          console. There's no error message in the logs either.
>         Netconsole doesn't
>          report any errors, and the kernel doesn't panic. It just
>         freezes completely.
>           
>          I checked that Live CD with Debian 12 continue to shut down
>         normally,
>          but Live CD with Debian 13 freeze.
>          I tried updating and resetting the BIOS. I tried various kernel
>          parameters related to ACPI settings. I also tried kernels 6.18
>         and 6.19.
>          Nothing fixed the problem.
> 
> 
>     Could you please try 7.0 as well? It contains a fix for the commit you
>     mentioned below.
>      
> 
>           
>          If I unload the "button" module, the system doesn't freeze, but
>         it also
>          doesn't shut down.
>          I built "button" module by rolling back its version to commit
>         1a20d40
>          <https://github.com/torvalds/linux/ <https://github.com/
>         torvalds/linux/>
>          commit/1a20d409c874255086e2f42a729826d490294c91>, which
>         corresponds to
>          kernel version 6.1. This module does not freeze, but does not
>         turn off
>          the PC either.
>           
>          I've found that the freezes have been occurring since commit
>         0d51157
>          <https://github.com/torvalds/linux/ <https://github.com/
>         torvalds/linux/>
>          commit/0d51157dfaac05ea66616d8a250dce04bef49a4f>.
> 
> 
>     That is 0d51157dfaac05 ("ACPI: button: Eliminate the driver notify
>     callback") [v6.5-rc1] from Rafael. But that is a very old commit; and
>     you seem to be switching distro versions and kernel at the same time,
>     which could interfere.
> 
>     How did you find that this causes the problem? Did you do a proper
>     bisection and thus checked if the parent of that commit really works?
>      
> 
>          Unfortunately, my skills are not enough to understand the
>         reason for the
>          freeze.
>           
>          I'm attaching dmesg and lspci logs.
> 
>     Ciao, Thorsten
> 

