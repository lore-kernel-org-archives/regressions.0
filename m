Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425073;
	b=QJvRautRNUGUvtBk4xqPlyXGEi4aO64cN791IKPulwFf1ClmIvNWH4O7mc92wE1GEyhe
	 9f1QDXMqVccO04v3MMdy7P5cAwFey67h32Qo2SKfn2w7DPqHY9GI8p4ifsP+gjsVY2jH0
	 dHifQt/NjJ5+9xKU6npdV92VDy/g/jwiWtaQbs4mI2vlWsGD2hRzGNRES0sfIyhe/7yvk
	 ssPmW4mvhL5KHYQwJTtmnfso4KgQHUO1e+FWphNlYGPTcFEqcxQnlim61RqwWdKe1GCtx
	 quEQ9yw4ye8p/QNDbLcCGo1/8OcP92ZtNjFKmXvRpWn5r00Zs++NaXuGqbw9N4lLmbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=9/FaXEod2ixG06LMAORRyt35ukaqyRic/FlEHLSyurY=;
	b=na1Vg7xClNqcHkAjKcAvDTXEuGsZHSr5JGol9Te3VgZPx4SjRMnJa2Rxj8r1U+/YOYRH
	 Yk5mts5qai1+DwH1zVAI2RoQHZx4TmomI9FEVK++kb9OerXuqRqnhdlcicAqzreat16nV
	 WsXAqZuLy34nMHL0uWaguiGSN26+jbt0UZsojIef9dlMmOaac6OBY8mwzPwf9pKnKuTqJ
	 ynx2cQRhnhMslKB3Vyd3KA5MmwbTXr49ZsFwrfYmyB+snRQjnRubtujDzeBdxRYggS5m7
	 xrMwtOwvwH3LkiCpECPyRp3oAgnPIpakoREnH1I1Mqy7mayVfiK14y12MNwFxGOtcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FNKyuXvs;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF47606A31A
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 09:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FNKyuXvs
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jY0XP6KQfz6QG2;
	Mon, 23 Nov 2026 10:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795425029;
	bh=9P6t4W1hAzSJiynme1yqoi4YwIyP9mVZ6rIrsRK1X/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNKyuXvsmv6ggcYzsJUK20Om/TRjAVovg9Bf6T5HxNBfrfNxoYHkS3wxtn4niOzaN
	 9gsdX5Hs2Q45LV6mF2p5nqGi2vFaihWlDYqpBLiBiuOtlFnAl34hYo3cMs1Z2SsSU6
	 dB8rTr0yzQAZtqLEM8TeYqjYp54Q1a0Brqx37OAsuvZXlIP4EAjREGxlGo+3KtgCi1
	 oj7eVK4tDi1P1ZJURt1vAR5PPyXFaQY7OuI5VoWpfaFnOjEkXtcf27M1XmP2O1v4wK
	 TeEhzoLv3MxaUA4YqVjCQxFxagWeYxhntpExt6zlNKtC3igytq7rwzSbLYl3MXzZxp
	 mEriOtEp2HE4A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jY0XP5WL8z4y5P;
	Mon, 23 Nov 2026 10:10:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jY0XN22R1z8vJT;
	Mon, 23 Nov 2026 10:10:28 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0D4DB5FAB2;
	Mon, 23 Nov 2026 10:10:13 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <241085e8-cb69-4dbf-9375-e024fe658335@leemhuis.info>
Date: Mon, 23 Nov 2026 10:10:12 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Logitech G733 USB audio volume issue since Linux 7.3
To: Lucas Cota <lucasbrunocota@live.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Rong Zhang <i@rong.moe>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>
References: 
 <SA3PR11MB87055423D68E21680C47BB55B4B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
 <SA3PR11MB870554D0B14BDBE05EC72B8B59B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <SA3PR11MB870554D0B14BDBE05EC72B8B59B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179542501344.1169179.16639057523463222476@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0D4DB5FAB2
X-NC-CID: Tz9ng+2zipavYseCsq5eqIDGQT9WzAuUMRaIs2ysRomlc9Xo2a8=

On 11/17/26 22:17, Lucas Cota wrote:
> 
> I have some additional findings regarding the Logitech G733
> (USB ID 046d:0b1f) volume issue.

FWIW, details for that issue can be found below in a mail that didn't
make it to the lists or something.
> I confirmed that the physical volume wheel can also cause abnormal
> volume attenuation on Linux 7.2.15, so the issue is not exclusive
> to Linux 7.3.

Thx for the update. I CCed three people, maybe one of them might have an
idea what's wrong here.

Side note: If (a) there really is something that works on 7.2.y, but
does not on 7.3 and (b) nobody comes up with an idea what's wrong,
please run a "git bisection" to find the change that broke things:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

Ciao, Thorsten

> On Linux 7.3.x, the hardware PCM mixer sometimes initializes at
> 51/74 (-23 dB), even though ALSA has 74/74 saved in asound.state.
> 
> I found two workarounds that together resolve the issue:
> 
> 1. Enable "api.alsa.soft-mixer = true" for the G733 in WirePlumber.
>    This prevents the physical volume wheel from causing excessive
>    attenuation or loss of audio.
> 
> 2. At session startup, explicitly change the hardware PCM volume
>    from 38/74 to 74/74 using:
> 
>    amixer -c Headset cset 'name=PCM Playback Volume' 38,38
>    amixer -c Headset cset 'name=PCM Playback Volume' 74,74
> 
>    Setting 74/74 directly is not always sufficient. Forcing an
>    actual volume transition restores the expected hardware gain.
> 
> I currently apply the second workaround using a systemd user
> oneshot service after WirePlumber starts.
> 
> Both workarounds have been tested successfully after reboot on
> Fedora 45 with Linux 7.3.x. The headset now starts at the expected
> volume, and the physical volume wheel works without abnormal
> attenuation.
> 
> The root cause remains unclear, but the findings suggest an
> interaction with the USB audio hardware mixer controls.
> 
> Best regards,
> Lucas
> ________________________________________
> From: Lucas Cota <lucasbrunocota@live.com>
> Sent: Tuesday, November 17, 2026 16:47
> To: linux-sound@vger.kernel.org <linux-sound@vger.kernel.org>
> Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>
> Subject: [REGRESSION] Logitech G733 USB audio volume issue since Linux 7.3
>  
> Hi,
> 
> I'm experiencing an audio volume regression with my Logitech G733 wireless headset (USB ID 046d:0b1f) on Fedora 45.
> 
> Kernels tested:
> - 7.2.15: Everything works normally, including the physical volume wheel, without any custom ALSA or WirePlumber configuration.
> - 7.3.3 and 7.3.4: Audio volume is significantly lower, and using the physical volume wheel causes further issues.
> 
> On 7.2.15, the kernel reports:
> sticky mixer values (...), disabling
> 
> On 7.3.x, it reports:
> broken mixer GET_CUR
> 
> Unlike 7.2.15, the newer kernels expose a hardware PCM volume control (0-74).
> 
> I can temporarily restore the expected volume using:
> 
> amixer -c Headset cset name='PCM Playback Volume' 38,38
> amixer -c Headset cset name='PCM Playback Volume' 74,74
> 
> However, turning the headset's physical volume wheel makes the audio quiet again, even though ALSA still reports PCM at 74/74.
> 
> Enabling WirePlumber's api.alsa.soft-mixer = true helps with software volume control but doesn't fix the physical wheel issue.
> 
> This seems related to the USB mixer behavior change between Linux 7.2 and 7.3.
> 
> Could you please investigate whether the G733 needs a device-specific fix?
> 
> Thanks!

