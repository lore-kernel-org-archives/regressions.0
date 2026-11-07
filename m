Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048982;
	b=uQ8u6+OperbMDic2qUasIghxWhT/7gjI3xVJ0EglL0ayJjzrlRBUNeTMj7cPsQXvAVdr
	 I+MDfcNDrIlu7ysGcMO+HsCKeifPZBDafiI5alccU9pfGk3PkT5yhoSs1SEQBg1jcqCgi
	 hB6KU3gXIAyd7MQoEA1amn5qNnndQ7o3T/xiDVOC3xGBe7LJ70iEy9EZMijpCMZZUsYk6
	 9lwLjdqAMN54YNL1yNzR2wFpvBvixYSLqq2h+BpuiZ4zB10zz8ByywrH6cTJ5h5+XEdhj
	 raQ/AhwKMMcQJCUUKAfCMIukwHJW2pdA9EaedS4FHqWqHzrZmxhQ66RMumuepcCIa2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=w/gaTN6W/a49lhECTOr1GuWoMta3S3bcbB4BZOhpBco=;
	b=aK9VuB1ACozahHsmUG50K1gMPVUYA+wvDvUOwVp/GIgCJBO2Pfb+cncUHNlSy6Q9MPDu
	 r8GXy1sT2c8jkYGh751PQfPQ+NricokLtl/EqIZjARudhhHv/T575G8cbNNbmFHiQU3VR
	 f6OUg0QbrXNVeqfXMc7mJFvkfkswXCtrOtZO8vh7tQwSWMFcDen9STXDovpeVLySqAXdA
	 Mo+HbN7ZsgDaipR6xH7td37G49K79o4YuHrn1bUR6jV/m6f8foJl2vS1AbV2bobtAtOJy
	 ugT3iGmQZ/T+TFn9qwj5Eon36/8bnJ/ecoybK+9O6GqSXLzWhtGzkl5MJosdS16kQBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=g1sOqOLw;
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3D606A326
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 10:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=g1sOqOLw
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jMCdm45p2z4VJ0
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 11:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794048972;
	bh=w/gaTN6W/a49lhECTOr1GuWoMta3S3bcbB4BZOhpBco=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=g1sOqOLwBkdjODxOE18xfLCrTqGSIN/V3QmvIWcyzp40FalXVHAKOheaVNTY2rrz3
	 2EdnHMCuOhtXQHh5+9vAjrA3kcaH7+aq1irRew15tiaVqTk9M2M02CzjtGZ4qaDrDg
	 fE99yHGhbB1t3dGgSFarINJKNKXFhq6HjWN+LBIpt8FRhBj0KOLamvfexg5mo210c8
	 ElFCp+4Nle0wj4RTA4sDjl50cN4Fx0JYUPbn/dhtts2YUmLXfSiUBTKwhlg4mqrcEo
	 1DpAP72HGUcWLgY3FwAvSw/RXLgbs2QuH4mSUsyArVg6vJ2AIbYGDJXAyHaVUZQP4y
	 dwKla315v5Ykg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jMCdm3Qjnz80Wp
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 11:56:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jMCdl49QFz8tj8
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 11:56:11 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EF3BC5F985
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 11:56:02 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <811a4751-40f1-41e1-8cd4-f41040dd8e16@leemhuis.info>
Date: Sat, 7 Nov 2026 11:56:01 +0100
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
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179404896317.1065209.7727813723292322278@mxe9fb.netcup.net>
X-NC-CID: +cAuCB7s23Xu+5v9vTsvLO7Lh2JPRN5E3sjGReo3qHC2f0rdw4s=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/aaa3241b-4dc7-47da-8703-067ffc4ce252@tu-dresden.de/
#regzbot resolve: invalid: turns out to be a OpenSM problem, not a
kernel problem

#regzbot report:
https://lore.kernel.org/all/CAMODhBLCdFXpkC1RCJdu5HBbW8TOFy4W7E1P0o5x8kwpPq_YMA@mail.gmail.com/
#regzbot introduced: 7a0886826308
#regzbot dup:
https://lore.kernel.org/all/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro/

#regzbot report:
https://lore.kernel.org/stable/shfaXkZCI7FtyNr5tS4kCC_d5E4uQFhc0MtwJa2CQFXpNMfSw7Ub6urwWpGrcoRnHuoneJEi9mLwtnvVImMhz1Hb25iwNJxx8GZZsDCV_HE=@protonmail.com/
#regzbot fix: ALSA: usb-audio: Use the right limit for PCM OOB check

#regzbot report:
https://lore.kernel.org/stable/CAEVL6QtFUCs66EtLFj6dO8DQq9YE0Corvy3BTj-9HEvPkTP7xg@mail.gmail.com/
#regzbot introduced: a3a7d360252c0d
#regzbot fix: ext4: fix NULL folio dereference in mballoc

#regzbot report:
https://lore.kernel.org/stable/20261105192503.228363-1-tracekotae@gmail.com/
#regzbot fix: drm/amdgpu: drop retry loop in amdgpu_hmm_range_get_pages

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6011
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/issues/5714

#regzbot report:
https://lore.kernel.org/stable/a84fe7b5-ba90-4e51-afcc-548f8b30180b@icloud.com/
#regzbot fix: ALSA: hda/tas2781: Only accept CRC-less V1 data if all
entries are valid

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221675
#regzbot introduced:

#regzbot report:
https://lore.kernel.org/lkml/20261010065509.72916-1-kmehltretter@gmail.com/
#regzbot fix: f322d7f7ae56bce

#regzbot report:
https://lore.kernel.org/regressions/CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com/
#regzbot introduced: 7a0886826308
#regzbot fix: ASoC: rt721: Remove invalid register defaults
