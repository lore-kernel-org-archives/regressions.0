Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250198;
	b=oY7hyhIasfZchExMPDn1GZ0xkxJBN1Po8Ck5+fkdOnf5vo53/MerkpUQjXYN3vPb8NZh
	 fgryEe8j157qf4HD/BPpXGoBcQyygccewQ+eMX7odf49WcBy+7dIm7L5THGwf97/h/JUz
	 Bg6lpS0ekupQf4C/mL43sQW6nCkRqejf3fRjck2VHBK9Ap5Ip8Hyf7tfXM1RkyvAjM6ZK
	 MJGE8aKNkqkk7Bnj4RyKJmk8M0FICFNL9gNTKzFL4bOD4bwgOy5s74WzcTswYl6f+g4HZ
	 bGcIJ4o15ap8G2E3WYx+B3y0P6Pgy4kaIRoL6iBUk0da08p3fGdh6SQLNVcUUOSYuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:From:Content-Language:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=kOH++dAfy6xBCfFPToxjXvO/Tt6+YbGGDwDQ6M22zL0=;
	b=CFcc1KA8R3uZuHeN1HzUdpOTE8lG/gunQzVnY7f9GEphqpkwUNw7ZcxNFcPi8JVqCSVB
	 cqoyUHs/CU1+phxsmw1BDB3i8/L4EC80GcaxyTYmxg/VVBDzU5NB+RTA8WGakcfYuIHtF
	 mZKapUKshbBxVmo/znoxx99waIihjevM72ujNOIcZA4qVMQQK3/GQ83iUpsGRmNQSecD0
	 U3SAN3fk86v4693zdotRunehtFiNVHkmusL9616HuMaaCqM6J25PRiVyKOMIZuao1NaIl
	 FRr624M1WQ/SZUhcmjHcZO0pwqq/AXxiDfioIM/P44bfzOFTwyBWyppmZOhQnCzcLiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="gQ2eIF/y";
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F80606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 18:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=gQ2eIF/y
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jNf2V1LWkz45Ly;
	Mon,  9 Nov 2026 19:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794250146;
	bh=UaJWP9BXbStuPqCoBjBkbV1qBaFVRFDYDXstpjt/nwY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=gQ2eIF/yVEjZbmWQIZnwI1wCejocihWuLzDgtzlZZ2w+DV15QKLub8fbpLh+21fAb
	 2GaZ6upCHG+p9lkMZfL30+ZdrjqFnKfHKMPfsGYBJEribNJKyoY4ITbGogwF/G2LO4
	 QYel4pL78Td3584ESIqkCn1jYpuVQWOXSDtk5ujmhGlL8v+OkTZhejBZf0+IxMM2xN
	 4EDCwYtx5yf8eUtq0yErB1xZBJwDcBMMn3XRxRSAP6UmuyxQ7BAZ20OAc9ZnBsBGQZ
	 T5joJb7g80G1Grc/pIaKoLkxB5wEJuK+oAGsYV2j/Ks6x3kn+ZreJUTF3JcDh6r0YE
	 9KEonXUABQrzA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jNf242TjZz470F;
	Mon,  9 Nov 2026 19:48:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jNf214WZVz8v5N;
	Mon,  9 Nov 2026 19:48:41 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 89A595F960;
	Mon,  9 Nov 2026 19:48:36 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
Date: Mon, 9 Nov 2026 19:48:35 +0100
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
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails
 with ASoC route errors (-19)
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: 
 <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me>
 <318f1745-acd7-430f-818b-c961987fe108@laposte.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Alain Cousinie <alain.cousinie@laposte.net>, rujbin@proton.me,
 Linux Sound System <linux-sound@vger.kernel.org>, regressions@lists.linux.dev
In-Reply-To: <318f1745-acd7-430f-818b-c961987fe108@laposte.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179425011701.3340908.7487051154511804313@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 89A595F960
X-NC-CID: COc+AK1z9AnIXev47RHPIJmr11h+APHhkM5LwJsWf+PgtNcj2Nc=

Lo! Sending this just to add the skl_hda_dsp_generic maintainers to this
discussion below -- maybe they have an idea what's wrong here. Alain,
Rujbin: if not, one of you will most likely have to run a git bisection
to identify the culprit. Ciao, Thorsten

On 11/9/26 19:22, Alain Cousinie wrote:
> On 11/9/26 17:57, Rujbin wrote:
>> 
>> I'm reporting an audio regression between Linux 7.4-rc1 and 7.4-rc2 on a Lenovo laptop running Fedora 44.
>> 
>> Last known good kernel:
>> 7.4.0-rc1.vanilla.fc44.20261103210439475307
>> 
>> First known bad kernel:
>> 7.4.0-rc2.vanilla.fc44.20261109132241085802
>> 
>> Hardware:
>> 
>> -   Intel Meteor Lake-P HD Audio Controller (8086:7e28)
>>     
>> -   Lenovo subsystem (17aa:50e6)
>>     
>> -   SOF driver: sof-audio-pci-intel-mtl
>>     
>> -   Conexant SN6140 codec
>>     
>> 
>> Regression:
>> 
>> With 7.4-rc1, audio works normally and ALSA registers the `sof-hda-dsp` sound card.
>> 
>> With 7.4-rc2, ALSA reports no sound cards and PipeWire exposes only a dummy output.
>> 
>> The SOF firmware boots successfully in both versions (2.14.1.1), but 7.4-rc2 fails during ASoC route initialization.
>> 
>> Relevant kernel errors:
>> 
>>     skl_hda_dsp_generic: ASoC: Failed to add route Analog In -> Codec Input Pin1(*)
>>     skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Playback(*) -> Analog Codec Playback(*)
>>     Analog Playback and Capture: fail to add hda routes, ret -19
>>     Analog Playback and Capture: ASoC error (-19): at snd_soc_link_init()
>> 
>> On 7.4-rc1, the kernel successfully loads `sof-hda-generic-2ch.tplg`, initializes the Conexant SN6140 codec, and registers the audio devices.
>> 
>> On 7.4-rc2, this initialization does not complete.
>> 
>> Steps to reproduce:
>> 
>> 1.  Boot Linux 7.4-rc2 on the affected machine.
>>     
>> 2.  Run `aplay -l`.
>>     
>> 3.  Observe that no sound cards are available.
>>     
>> 4.  Reboot into 7.4-rc1 and confirm audio works.
>>     
>> 
>> This appears to be a regression in the SOF/HDA or ASoC initialization path. The responsible commit has not yet been identified.
>> 
>> Full kernel logs from both the working 7.4-rc1 and broken 7.4-rc2 boot sessions are attached.
>> 
>> Thanks!
>
> 
> I can confirm the same regression in 7.4-rc2 on:
> HP Spectre x360 2-in-1 Laptop 14-eu0xxx/8C15, BIOS F.17 04/20/2026 (i7 155h)
> 
> [    6.737799] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog In -> Codec Input Pin1(*)
> [    6.737802] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital In -> Codec Input Pin2(*)
> [    6.737803] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog In -> Codec Input Pin3(*)
> [    6.737804] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin1(*) -> Analog Out
> [    6.737805] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin2(*) -> Digital Out
> [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin3(*) -> Alt Analog Out
> [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Capture(*) -> codec0_in(*)
> [    6.737807] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog Codec Capture(*) -> Analog CPU Capture(*)
> [    6.737808] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital CPU Capture(*) -> codec1_in(*)
> [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital Codec Capture(*) -> Digital CPU Capture(*)
> [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog CPU Capture(*) -> codec2_in(*)
> [    6.737810] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog Codec Capture(*) -> Alt Analog CPU Capture(*)
> [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Playback(*) -> Analog Codec Playback(*)
> [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec0_out(*) -> Analog CPU Playback(*)
> [    6.737812] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital CPU Playback(*) -> Digital Codec Playback(*)
> [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec1_out(*) -> Digital CPU Playback(*)
> [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog CPU Playback(*) -> Alt Analog Codec Playback(*)
> [    6.737814] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec2_out(*) -> Alt Analog CPU Playback(*)
> [    6.737815]  Analog Playback and Capture: fail to add hda routes, ret -19
> [    6.737815]  Analog Playback and Capture: ASoC error (-19): at snd_soc_link_init() on Analog Playback and Capture



