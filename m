Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC4F1A6820
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049204; cv=none; b=TQyFknXSXu4fEW4OjyvfS0jatX0xNLGst+B1otXkhw46o+EH2tKW/9FKgGvh+x1hV+pXxroKA13zaA1ZI5YQGFNR+4ee8g6cVPjq39dyc0W22KhukIiRQDzZaq6wBXuq7P86j5YT0mo/DO14rux5tVwbkxUIiBOzMlcwjE0/Bp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049204; c=relaxed/simple;
	bh=cnGDF1vmv3OA5If192bW0Xx6xpQ6o7VzYJvjj5RZJr0=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=o6sd5hO65shm4M0WXFKvoh/cbzAwroFkUf/6LNuYPrGHUPA/7SQvKx58wfzQHJjrnmTKuUEJXb94DmTGaKyq6eGLRngVhSJs5u8ESjC3eK2UbWMuK2melQLnTLrNEf8uGdpBenIAYPsLUD+d0TcF75oC8zVIngKyCsC3uIFWZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EwYwy5/g; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EwYwy5/g"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4g9QMq5dFxz98fG;
	Wed,  6 May 2026 08:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778048679;
	bh=cnGDF1vmv3OA5If192bW0Xx6xpQ6o7VzYJvjj5RZJr0=;
	h=Date:From:To:Cc:Subject:From;
	b=EwYwy5/gIZfKqRVg+S5H6lILMG1Tze/WDValZgk9CAuSLpNqDD2QTeT7UGrM1tOLV
	 n5/i/a+Rs6f3DtTi+c+8OkplgADCmFOzMMxMd2ro92j0fdge6w9Ajpyt3wIA5MgGuv
	 ugXuOTWCrtN54+74+jWXvd/43v4hrJOEEzm89ujb3P+24L4B+vv+zL6lXUjeY6Po7P
	 n6RCeH3sQ7MjNpXZaJOogZxanrAlWQMswkFNgErj+eN3BSMUrh9pWGO+uHPnJgxiZ0
	 X7WRmMTSk69kj7OGhXI6W1YZiGIBs1nYsnoqcYkTM9txNgmEQ80cqFxRP3oL99zsFh
	 a3oEG3q7ptRBg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4g9QMq4x0bz7wT7;
	Wed,  6 May 2026 08:24:39 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g9QMq1Kp0z8tH0;
	Wed,  6 May 2026 08:24:39 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 616A863304;
	Wed,  6 May 2026 08:24:38 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
Date: Wed, 6 May 2026 08:24:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stoa@gmx.us, Harin Lee <me@harin.net>
Subject: [regression] ctxfi: no speaker output when headphones connected on
 >=7.0.x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177804867871.3542330.14212866223770791000@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 616A863304
X-NC-CID: CVuLerVtKSZWOkotPRFlUWqmERuHinQhfAud3Cq4m46JOFb0W1I=

Hi! Just FYI, I noticed a regression report in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=221461

To quote:

> Dutch Ingraham 2026-05-03 18:12:49 UTC
>
> Kernels >=7.0.1 contain a regression as to Creative Sound Blaster Z SE 
> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0.2, and 
> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12.x does 
> not present the issue.
> 
> Specifically, using pipewire managed by pavucontrol, on both Gentoo and 
> Arch Linux, when both external speakers and headphones are connected,
> all sound is routed through the headphones regardless of whether settings
> are set to Line Out/Speaker or Line Out/Headphones; there is no speaker 
> output. If headphones are disconnected, without reboot, speakers work; 
> reconnect headphones, without reboot, sound reverts to headphones.
> 
> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig on 6.18.24
> 		.config; Arch standard release
> 'lspci -nnk | grep -i audio' attached
> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> pipewire-1.6.4 on both Gentoo and Arch Linux
> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Arch Linux
> 
> Processor		:	AMD Ryzen7 5700G
> Motherboard		:	Asus Prime X570-Pro
> RAM				:	Patriot Viper Steel DDR-4 @3200mHz
> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> Sound Card      :   Creative Sound Blaster Z SE
> 
> 
> Expected outcome: ability to choose output to either speakers or head-
> phones while both are plugged-in to sound card.
> 
> Workaround: none known.

See the ticket for more details. One of them: 7.1-rc2 is affected as
well. Reporter is CCed. Forwarded this to ensure this report makes it to
the interested parties, as bugzilla might not have forwarded this.

Dutch Ingraham: if nobody within a few days has an idea why this
happens, you will likely have to use a git bisection to get this resolved.

Ciao, Thorsten
