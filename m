Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC1832B124
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490803; cv=none; b=D6GLzx7GrWBokiZupImrHJk94udvr8t4hI3RtgG1MQUiHodooR9SIn1HSm+AccC/wf50W6T7TARiVpeQ3pXCAT7q/55zDjvtxoh4Dy7Z1/vnlE+RCzmIiJ9SPmNf7qRuk04f+175c4iudCLapcwCH2KwVYf2OYbeG+uSHKKD06s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490803; c=relaxed/simple;
	bh=qb0t+wnlJAfTlYQVll+TAOze8a8GQPol16whw3IyuTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LjBTWYCiNtgqWlysTXumncu9LgjncGIkbHozvPV8nmF1A+UewhBO/Lv3QtX35FUmueDsOH92uUyBr9p3xNtVF11elk6l+FMtZkucM5XdWY3hFu8cuCQrHRKpzzyCIE5TCbiHHDP6JVPYB7m2L2qHuc61zbQlgcO/ldwfi/LlK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fp3j5l1b; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fp3j5l1b"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hBLdP3CYqz69w6;
	Fri, 31 Jul 2026 11:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785490793;
	bh=qb0t+wnlJAfTlYQVll+TAOze8a8GQPol16whw3IyuTg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fp3j5l1b8mRmltdIh+nOWXGSGZR+jE4oqBemfKA/MEwuiTSspMc+oQBKaXkPW73vS
	 UT1vRSBn09r6oilHld61n8zq8/Gv98GUUNNMdbwwzPxiiAdUHM1FjNJ1iVagchEZlH
	 MFCQiajpvNogGyKLhJ6piMASHO+jtwEsur+BScqxWRFR0XuC97syZE4IE3HmHmIMyb
	 5kch9/BY/hz0fBznKZZIGUObngLDcCAMVRPZJ9u5SXwQqCf2YVa8UMIMS5OOEz0dR/
	 jCppxillykQwSimhuIz/3fppteSgkgD5bOLmR2MLAHjXlo4f/iKAQoB2EhZaVDUG8o
	 sWu17pYHZmlyA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hBLdP2VRZz4xN0;
	Fri, 31 Jul 2026 11:39:53 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hBLdN3sbqz8sbs;
	Fri, 31 Jul 2026 11:39:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AA0DA5F9AF;
	Fri, 31 Jul 2026 11:39:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3b5586d0-b973-4984-9fbc-43c9ab960d76@leemhuis.info>
Date: Fri, 31 Jul 2026 11:39:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Black screen after splash with Linux 7.0 on MSI
 Creator A16 AI+ (AMD Strix Point + NVIDIA)
To: Alexander Zorn <alexander-zorn@gmx.net>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <24d84eb2-1b63-407f-ae5c-6831650ad67b@gmx.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <24d84eb2-1b63-407f-ae5c-6831650ad67b@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178549078798.2776737.4346767989372177260@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: AA0DA5F9AF
X-NC-CID: suLOq7t4cSMKQNwWDhdy4ICBzWgur9YsmJ8zneH0SHF+q1jMGFc=

On 7/30/26 19:28, Alexander Zorn wrote:
> Hello,
> 
> I am seeing a reproducible boot regression with Linux 7.0 on an
> MSI Creator A16 AI+ A3HVGG laptop.
> 
> Last known working kernel:
>   Ubuntu/Mint kernel 6.17.0-41-generic
> 
> Affected kernels:
>   7.0.0-27-generic
>   7.0.0-28-generic

Mandy thx for the report. Sadly those are kernels from a EOL series that
are heavily modified and thus might contain bugs that never even
occurred with a proper upstream series -- which could also be the case
due to a add-on module you use. The issue might also be fixed already.

Please retest with vanilla mainline (e.g. 7.2-rc5 or later). If it does,
please report to https://gitlab.freedesktop.org/drm/amd/-/work_items/
(ideally drop a link here afterwards; you might also search for existing
bugs there, there are a few that mention Strix Point that might match).
If the problem is not known yet, you might need to bisect this, but this
is to early to tell.

Alternatively, report the problem to the vendor of your kernel.

Ciao Thorsten
> Symptom:
>   The system reaches the Linux Mint splash screen, then the display turns
>   completely black. No graphical login screen is visible and switching to
>   a TTY with Ctrl+Alt+F2 does not produce visible output.
> 
>   The system appears to continue booting: logs from the failed boot show
>   that amdgpu and the NVIDIA driver load and LightDM starts. I did not see
>   a kernel panic, GPU reset, amdgpu timeout, or obvious Xorg crash.
> 
> Regression status:
>   Reproducible with both tested 7.0 kernels.
>   Booting 6.17.0-41 restores normal display output.
> 
> Hardware:
>   Laptop: MSI Creator A16 AI+ A3HVGG, motherboard MS-15FK
>   CPU: AMD Ryzen AI 9 365
>   Integrated GPU: AMD Radeon 890M / Strix Point
>   Discrete GPU: NVIDIA GeForce RTX 4070 Laptop GPU
>   BIOS: E15FKAMS.316, dated 2025-09-11
>   Desktop: Linux Mint 22.3 Cinnamon, Ubuntu 24.04 base
>   Display manager: LightDM
>   NVIDIA driver: 595.84 open kernel modules
> 
> Display configuration:
>   Internal panel: 2560x1600 at 240 Hz
>   External monitor: 1920x1080 at 120 Hz via USB-C DisplayPort Alt Mode
>   The AMD GPU drives the displays.
> 
> Relevant messages seen in the failed boot include:
>   NVRM: failed to get target temp from SBIOS
>   NVRM: failed to get platform power mode from SBIOS
> 
> There are also several ACPI BIOS error messages, but these are present or
> similar on the working kernel as well.
> 
> I can provide the complete logs and test additional kernel parameters or
> patched kernels.
> 
> #regzbot introduced: v6.17..v7.0
> 
> Regards,
> Alexander Zorn
> 
> 
> 
> 

