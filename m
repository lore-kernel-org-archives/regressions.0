Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBA37C915
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233832; cv=none; b=kFNJBMPDCtf60KFUSNgiETXG0Mu86qhY7it+4Ex0Gw6u8RMPcl3WPa2LLP9qFQ8Fll7STxdd83qtJoHudJJV/HNmuJWCMH5mM8FMoYBjqL6Kyklc5j+r4obxQlowmgof3XnNJF0L4Lkb4UB2CPX/ZQ0o6fOrWWZfD5P8oOa7UbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233832; c=relaxed/simple;
	bh=wKV8XEMMAcvr8vhLZOUbbjZvdCKC+vef98quKz0DNKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=BOx+hxBX/7PRv0/PDlHrVAUNgtuADeK7l43FQHCeGv0aVWuSxl04ZiP6AOeVfuJCgFofHWwBSzMc3W7lrRNwkqo1ETCytzr4mX++WOD3+P0pdPB4sgtTeJs6yFpbvqfHB/xVKc1e9dLZ9YPazTC8OkkLKXiIrO0IswZXfPVlpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=M8XbEHcE; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="M8XbEHcE"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gBkrK3v1Qz68Yr;
	Fri,  8 May 2026 11:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778233825;
	bh=wKV8XEMMAcvr8vhLZOUbbjZvdCKC+vef98quKz0DNKY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=M8XbEHcExHO6I/kjFXAdific6v6UyIomV4wxCGN5Na264w5VzS5uwJwc7vhQsk5xv
	 zm6HliaUvxDBu2FW9hhYVXf61vC+vX9D0CgQKL6aY+JbdypvxhPvPmo+0nkc/8Y3h+
	 kEuCQKgfQBZM1QVuV4bzTGWl5nidjjwiRQNtT/gJqaKD0uVNvwkgfQLa4Rn8id3lr+
	 Gj2etcmfJTwN0a8WtwsoYktgN7IwvP/5nuPWDCLEUedL3qx7MmBFNZ5nxyHm7p+psz
	 LKIJlhrKeQ58vvbLM60mzN+/0Du2eK3POnVJHSwgXtc2imUPpcb5c7W3czmoQ211bg
	 lsaCuM/yE2ZyA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gBkrK37dGz4w1L;
	Fri,  8 May 2026 11:50:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gBkrJ56N9z8tch;
	Fri,  8 May 2026 11:50:24 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 243FB5FBF7;
	Fri,  8 May 2026 11:50:24 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <db1fa2d0-c048-4772-b366-30d1457820f9@leemhuis.info>
Date: Fri, 8 May 2026 11:50:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] AC adapter reported off-line, battery shows
 "Discharging" while charging
To: Goldi Fisch <Goldi3212023@outlook.de>
References: 
 <PH0PR03MB989097E7030A5BFC6ACF719898E63F2@PH0PR03MB989097.namprd03.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: 
 <PH0PR03MB989097E7030A5BFC6ACF719898E63F2@PH0PR03MB989097.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177823382436.2245226.18085058283215786588@mxe9fb.netcup.net>
X-NC-CID: 3T0Q11V9WOKLD6aKeJAH/Ip5T3oNvuGatOnJ5qgsjFP5/aSmGJU=

On 5/6/26 16:23, Goldi Fisch wrote:
> I am experiencing a regression in recent Linux kernel versions affecting AC adapter and battery reporting.
> 
> The system is physically charging:
> - Charging LED indicates charging
> - Windows reports charging correctly
> 
> This suggests the hardware and firmware behave correctly.
> 
> However, under Linux:
> - AC adapter is reported as off-line
> - Battery status is always "Discharging"
> - No charging is reported even when AC is connected
> 
> Working kernel:
> 6.18.13 (Fedora Workstation)
> 
> Broken kernels:
> 6.18.16 (Fedora Workstation 43)
> 7.0.3-1-cachyos

Cachyos uses a kernel that is quite a bit patched, which makes it a bad
fit for upstream reporting.

The big questions here are:
* is this a 6.18.y specific regression that still happens with latest
6.18.y?
* is this something that was already fixed with mainline? Could you
please try 7.1-rc2 or newer?

Please also provide full dmesg logs for the 6.18.y kernels that work and
are broken. Maybe that is enough to spot the problem. But if not, you
most likely will have to run a git bisection to find what's wrong:
https://docs.kernel.org/admin-guide/bug-bisect.html
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

Ciao, Thorsten

> Hardware:
> Denver NID 14106SSDE
> 
> Steps to reproduce:
> 
> 1. Boot affected kernel
> 2. Connect AC adapter
> 3. Run the following commands:
>    cat /sys/class/power_supply/ADP1/online
>    cat /sys/class/power_supply/BAT0/status
> 
> Actual result:
> 
> - AC adapter reports off-line
> - Battery reports "Discharging"
> - System is physically charging
> 
> Expected result:
> 
> - AC adapter should report on-line
> - Battery should report "Charging"
> 
> uname -a:
> Linux p288300f2e782385133fb26c6b6d4b847 7.0.3-1-cachyos #1 SMP PREEMPT Sat May 2 09:24:53 2026 x86_64 GNU/Linux
> 
> BAT0 uevent:
> DEVTYPE=power_supply
> POWER_SUPPLY_NAME=BAT0
> POWER_SUPPLY_TYPE=Battery
> POWER_SUPPLY_STATUS=Discharging
> POWER_SUPPLY_PRESENT=1
> POWER_SUPPLY_TECHNOLOGY=Li-ion
> POWER_SUPPLY_VOLTAGE_NOW=7400000
> POWER_SUPPLY_POWER_NOW=0
> POWER_SUPPLY_ENERGY_FULL_DESIGN=29600000
> POWER_SUPPLY_ENERGY_FULL=29600000
> POWER_SUPPLY_ENERGY_NOW=24494000
> POWER_SUPPLY_CAPACITY=83
> POWER_SUPPLY_CAPACITY_LEVEL=Normal
> POWER_SUPPLY_MODEL_NAME=Li-ion Battery
> POWER_SUPPLY_MANUFACTURER=GLK MRD
> 
> Relevant dmesg lines:
> ACPI: AC: AC Adapter [ADP1] (off-line)
> ACPI: battery: Slot [BAT0] (battery present)
> 
> Additional notes:
> 
> - Reproducible across multiple distributions (Fedora, CachyOS)
> - Regression between 6.18.13 and 6.18.16
> - Likely related to ACPI / power_supply subsystem

