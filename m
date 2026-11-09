Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248610;
	b=1l6UTk7mJY4aOnSO2YxDh+DHP81LUEqswXfVmE2MlnJVXhU3n97kiXY/s8AT3nbm+w5D
	 stRldqQkLT0RyjHxGvt0b3u/aAcriRbwx8HWn62oW/9Ytjo1ukurvg/BctLYHhGJd37y/
	 f2S8E4+J8nHr/Ltq2Tq+XDL7swhQo8CrcZkr2FuGKnWc5MwNf1PbAaGtgDNAcrL6PdUBM
	 bp+c3BCQ6jh8kJGNjUAopNhXuiZgj7QuktuvueSsiNugtmKbm6yHYpBirg2rgOfpdib4g
	 YQeYfblBvXaBYxNPhuwTqu/4h3WqZfek2SJpcEktbZTJex+8wr/XdKY3uJvPeDX6vcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248610;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:To:References:Subject:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=Jd/zzpeMLBUNoJEexbYTlOrQahNCYFOT/GdVllv71Uw=;
	b=Ty8Cr1s6Kv2+Je4XGoTCx0s3QvQbvzf42bjjJeZN/uuo6xieaoz5n6haJI74Z3bxyYNr
	 Ca/0ivESr0mSGWyk2wuvvxcG489nKnLzlFJ4djnL64bCAlpF2jrUrvjP9i3mPdCMpaU76
	 bNzeGu8Wv0FyzXsJ6t1QKjnyYEdyQz6MQL76XdZuICEmY49C0GmP18WoFV5HIUW73kB9D
	 Nu4tiOxfJ5veLtxP1t66sXHklKOVoahp9n5Kpq8RMhVkIsqYyHwoRKRiyVY9LlYWr4Jd1
	 RZSFlASTsPIq8hTl9fXQ7DGpYsWoxiQLV6Pk+wq8PMSrp3+ZJ2hTljFXpHTlN3dTycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=MyOXZisF;
	arc=none smtp.remote-ip=160.92.124.96
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net [160.92.124.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDC4606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 18:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=MyOXZisF
X-mail-filterd: {"version":"1.9.7","queueID":"4jNdSB3wQcz10MQP","contextId":
 "cc0ff9dc-59ec-4f81-89a7-92bb3dbe51b2"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0103.laposte.net (SMTP Server) with ESMTP id 4jNdSB3wQcz10MQP;
	Mon,  9 Nov 2026 19:22:50 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jNdSB23zKz10MQ4","contextId":
 "ef57c16d-c6d1-4884-a5e0-675ae4d83744"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from [10.10.191.53] (unknown [185.234.140.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0103.laposte.net (SMTP Server) with ESMTPSA id 4jNdSB23zKz10MQ4;
	Mon,  9 Nov 2026 19:22:50 +0100 (CET)
Message-ID: <318f1745-acd7-430f-818b-c961987fe108@laposte.net>
Date: Mon, 9 Nov 2026 19:22:49 +0100
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
To: rujbin@proton.me, regressions@lists.linux.dev
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me>
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails
 with ASoC route errors (-19)
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1794248600; bh=LDgyzX6zXWcaS1omO2mOsHkuKtyq26XAgAS2V7pbN1k=; h=Message-ID:Date:MIME-Version:To:References:Subject:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=MyOXZisFu7Cf0u7Ist35MqERjt9zT9pEH2twqcyQrW1sxufujYaRQmtEkxleS4eGmbLxScPUz1k5CvA98ZuqHODb7elsaC9CmFRxEfpEBoi2vY+7qS4l/lP02lTGrJiWBgF91/eVmzLf46r4d+rRcLBbZgo95VOjwWoU96+gTK/XPO23sLsgHFyG/IhlMem0vJ/9ecvRIGCrH/pzAG7IpEpVFu/yHAg9oWhS2EeMR/rUpx/gLlcri0CIWATKw7f9xBGpDkBKsiaSwJ/hXXxnEKo7LExeefun1fXl7jETeTcXTSdlz9TmFIuVCidUmgqcNfS+3BHTNr3Pdqn2ZpztdA==;

Hi,

I can confirm the same regression in 7.4-rc2 on:
HP Spectre x360 2-in-1 Laptop 14-eu0xxx/8C15, BIOS F.17 04/20/2026 (i7 155h)

[    6.737799] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog In -> Codec Input Pin1(*)
[    6.737802] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital In -> Codec Input Pin2(*)
[    6.737803] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog In -> Codec Input Pin3(*)
[    6.737804] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin1(*) -> Analog Out
[    6.737805] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin2(*) -> Digital Out
[    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Codec Output Pin3(*) -> Alt Analog Out
[    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Capture(*) -> codec0_in(*)
[    6.737807] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog Codec Capture(*) -> Analog CPU Capture(*)
[    6.737808] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital CPU Capture(*) -> codec1_in(*)
[    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital Codec Capture(*) -> Digital CPU Capture(*)
[    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog CPU Capture(*) -> codec2_in(*)
[    6.737810] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog Codec Capture(*) -> Alt Analog CPU Capture(*)
[    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Playback(*) -> Analog Codec Playback(*)
[    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec0_out(*) -> Analog CPU Playback(*)
[    6.737812] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Digital CPU Playback(*) -> Digital Codec Playback(*)
[    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec1_out(*) -> Digital CPU Playback(*)
[    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route Alt Analog CPU Playback(*) -> Alt Analog Codec Playback(*)
[    6.737814] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route codec2_out(*) -> Alt Analog CPU Playback(*)
[    6.737815]  Analog Playback and Capture: fail to add hda routes, ret -19
[    6.737815]  Analog Playback and Capture: ASoC error (-19): at snd_soc_link_init() on Analog Playback and Capture

Regards
