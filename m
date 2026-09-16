Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0C3BBFC2
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540245; cv=none; b=VTsvm3o6CcCDWQFWMQtJ/GyD3cXuw2kSHXni1iWTzbjPOMlfVydkkz9QbT2qBkSrQB9xaxfT6GzPIzKFADeqXPf3PMsxhvZCtOZ8C0+5uYeksywkbK/pQg/xlMZS8hm/P99Yc+EGGQPyiPlNuwwIIu3l5rndjRi57X2O1NElyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540245; c=relaxed/simple;
	bh=4adzdkyS6XeXKbl6zU2c2shBLF3+Kon9+nbNlKt/DA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXQylMfagL1DecIIscnfgI8SGuxYUSYMHplkELj8/yMA62dLuyJ8XlbOZ5080LXRqUBnViEgagyfqz9dzjgue9xWJHZrFZdPbJ+Fbi7E+ay5ij2pxJbhxOtl2KjIWRcBMOsC0sV1ly0pzDwHcJIpuVpzCP5U8XbUahVtMrDs7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OSMi+vxm; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OSMi+vxm"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hl8BD24jrz893l;
	Wed, 16 Sep 2026 08:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789540180;
	bh=4adzdkyS6XeXKbl6zU2c2shBLF3+Kon9+nbNlKt/DA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OSMi+vxmFMu49L/6pT++enzazONrFbpjM+f9UVmgA5jKltZe2l+IyM6gPMuVy2q0W
	 hfOFcwqc7UFds6O8glOw4rSjF1ILHTTOFLSYGFJ1SEiwvE3N/owj6eELo1NtlIZYfF
	 oAuwY9fr1H79UcleD2FSXeG07xPzLgoB2P0NrycXNdt00tzp1zmNHdtVhq3IAMBkKl
	 2oSE8FK+CBFolHu+OTudtqDMzt9Nzmol1UbBDpCjfZBQeG68koojteFQF6MFUUYjpw
	 AwTRo2dv/jVMQ1Bos9H1yxIMUm2ncNItgbRh0SjKlXNWTRyJoDzz/X5SjJ+Dxk7Vzm
	 VQJJdceZl6s3A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hl87b0qvvz894q;
	Wed, 16 Sep 2026 08:27:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hl87Z17F3z8tbb;
	Wed, 16 Sep 2026 08:27:22 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 58DCA5FAD7;
	Wed, 16 Sep 2026 08:27:13 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1dba4e50-2468-4cc6-b002-907ca1438b2d@leemhuis.info>
Date: Wed, 16 Sep 2026 08:27:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Sound broken on Cirrus Logic CS8409 / iMac19,1
 between 7.1.13 and 7.2.4
To: Zachary Hunt <1zachhunt@gmail.com>, alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: 
 <CAOD3=bOhpz2P2+UUNeTsdxXiPtdhFQ+jZg-1WQmFAPYchSvhEg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAOD3=bOhpz2P2+UUNeTsdxXiPtdhFQ+jZg-1WQmFAPYchSvhEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178954003376.626450.11625335250586460561@mxe9fb.netcup.net>
X-NC-CID: etn+woiEZmqizqAkoOXMdS1A8HaEHRyKKSmFE9L16HTyYLmrc4o=

Hi! Thx for the report!

On 9/12/26 20:42, Zachary Hunt wrote:
> 
> Audio output via internal speakers works on kernel 7.1.13 but stops
> working after updating to kernel 7.2.4.
> 
> Hardware & Environment:
> - Machine: Apple Inc. iMac19,1 (Board: Mac-AA95B1DDAB278B95)
> - Audio Codec: Cirrus Logic CS8409 (snd_hda_intel)
> - OS: Fedora Linux 44 (KDE Plasma Desktop Edition)
> - Sound Server: PipeWire
> 
> Symptom:
> On kernel 7.2.4, built-in speakers produce no audio. The card is
> recognized by ALSA and PipeWire is running, but sound playback fails.
> The system functions as expected on kernel 7.1.13.
> 
> Attached is the full alsa-info.sh output for kernel 7.2.4. Please let
> me know if additional logs or bisection testing are needed to help
> track this down.
Nobody replied yet, so it seems nobody has an idea what's wrong here.
Unless somebody comes around with one, I guess you'll have to do a git
bisection to find what caused this. Remember to check mainline first to
see if it maybe was already fixed.

Ciao, Thorsten
