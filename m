Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891883;
	b=FZ+V6pIFC5SS724/nRtkWiZVCgHk94ueJkFa4GYkfZM9iyzuYPw1lqUvtJ4TtlzJQ4hH
	 E5PkIfQLFFe09RipUmejmgp5NuO+bbPL5zo7hqKbUeLRqZVszFi9YvDHGh72d2K5GEm9V
	 VRTyRZdmWSpz3Fz77gNupHj8UA5DuvMoYLR5+qOINiDzcCwChl6PuvG6X9ocMLl7OvoHJ
	 YJrEU/Uayk4ZLb3M59CTVcdILH8v4mdovgaXAk8QpVbp/4gR9Ep8odu7tJtLl6M1ofbme
	 tfNuc38JJS8poTEOZN3xwpJUpY4SyEPaOKRF02Kot0hIyYLDI/fJLFAl6EcLZE9T93Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
	b=IAM6PL/v4C1NhCEswbj39f+BtypWNNrFLJbkWx/0by8cplnqdH7M49BGwpF8RoeLZHmy
	 AXX/ZDhDJiwzCG4UKcaFlUiwyVQbCy94oVAHQr+0HTrERfoqUaXkZirhBPpIW90Tcp4uo
	 ELY0rHWuMlcrrtyK5ubU1FK4PAA5WLphyjFBKwKiNEVwHSZEir9inyWrzOK9egq+vB8dv
	 dOCBiXJvjSmTn9CAUbTpctiSkpuCBXS9OOJndigfrObdFcmeX1bgLZQypdR5tcb96OHhv
	 yvptJUutzpCsx8e1uZZs20M8a8Vfis+BnCrXIlVXv+jBnHhIvU34Kx0UH9hQTkFusug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5I2s3yJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B342606A329
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 15:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B342606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5I2s3yJ
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so694996137.1
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 07:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891882; cv=none;
        d=google.com; s=arc-20260327;
        b=HfuiEwSxTXbZWJ5Oxqlk7i0dFhbbSZsuhCyMMUTYal0i/GWEeQbSWuac9N6MD/71DR
         198VZHmK1G+PRscNJI3fdwhmGqW8EsdboLlnlJd2DdbbMMgtWolnpHlzODMRYU0/xbxT
         cQJ4bOD/zVjXsQwLS8FsbfVqIcUm1bjn/j1T80PYQDU1IluDu30W+sBDLvc9iYld3TLr
         vcW69QCJVYGd3nj15jhqaCMZGyp3tOFnGnj3/Q2CYS/eEZqZVBw45OYSaHHkmMlFyJSX
         f8l+tHZhR4Ia31rergGEN6n9NQk1zdcFXYosHlcYRb1rJgYTdCrM/JvScMUIuaniE7L2
         tXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        fh=XBLXdqZtV+lZoXkEiI2VlW1nG/2FaCuzAQWCzG6xlWw=;
        b=lu7GTtQFehTLY74lSvH84XFTmDhLcoTQ32lV0b6BOo97FymR3fXQ9vWXGIijCJ16nU
         m2k/GGIOFJkYsVZN5LEBUAi9qns6cFhNI/oY0DgNplPswPx1aEqbUavdnnG13dT/CUeN
         NxHfZ43wUfD+AAU40spL7fUokGoxMe9Dx7a1sioqNB7ncI7ezCosnHSh1YcTQWvgDC5X
         xYc6VnZVpDZpZRhTN37vBWr0PqwN+kV/P457qkFq0RDZL6N/QkvgHGE3gbVB7MKGb4IC
         Ef8MvP2j7iMDrEZ/kM+vFF8oqrDwjnGe/e2YNRbhr6CFDiT5CPO7rCfheWckqbrLfU4G
         36kA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891882; x=1794496682; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        b=p5I2s3yJkn4Dxw8TfZdOPUlEZDrqr6zDzL+MgoBxwr1bMq6fiPbwJ8TkbMu1qYUxl0
         SJQvQN/l77Ej3QqyRiKP1Gw1vumcda8nJLfwppi9+WxFCN5MRVUQPMZjAX5mgi7T2Xd+
         wcsWuH8EjW/PYtr05HIyj5/XCouD2CU7Zi27ddA+T5/c12lTzNus4chAdjGRXpPfJ50M
         f1tuKI5Ry5PpBJCr725omIzRRLqF7GMjjhCVfc7yKeQJa23HyXonbub6J162xG1gIXFE
         dbSRS8rvTYh8nB9MH2K6SOjpB29kOxDI0ipxThFcM1FGoPKKVGYST5+vnRphAO30TJdA
         8Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891882; x=1794496682;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        b=TTzejxg59lvL4cbYnPaLaCXNK5jIIFlltbmcaxScRSDrmLDfsmV4Lh4t6oF7g8F/LP
         IPIGr3kcbwSKz7sqLQFtka0ltagFHfg4TKvacYeVvlyhAd7RRb5pGd8aIQaBkvDWfMsn
         p97r2mOY+EBXvgqJW/1Vx30lSQ1zO8uDd0cTNbqPN5a0q/JDueRg/2Au2Q95pStMY1Jl
         y7y7BYqx00/WWYrDlqw/m7RVfq9v7AGabv0JcjpqdjGwvPENHoPGM6ET0mkxy1G+3++U
         RXYZRcAkWaaS+3qH8Xlym6daa1epmMXDGFZib6q1bWP2tbSEpojUEeEQqMXh50KGKdmj
         J51w==
X-Forwarded-Encrypted: i=1; AKwUvBzjNTmo/xs/QEbycA/v4xWqJdud9ez1HZCUfiwNnEw3tNAvay5q8Pyyoowkiq6CpE/ZabaGzS6mFQPcfg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/JbDst4jINxy4z96Jy5zjB0BW8f/59hw3boltDIDSTpX9QXPa6
	nwmtocnLknV4398GEYBLV2wfcw1xUpWtvUoJ4TF++sGs+5fxVFg9i6FFTHeZBEAWQehPlvDeeoe
	FPqKVqN45W4jEqi2xAcyURmgPmdZU220=
X-Gm-Gg: AYBFou00kWJGxx1EjBQ13d5z1qNeurMcHPg0jNIwgIA7SUYDXj9sQ/LCyYhWwdRNfNe
	sOkRzYNlsoKwoSp0B+vDAfoBpGYQD+gLrOG9Y9mxRi2DBBCZ3txVYrtBXkJj2XnrXgryH2P2YlQ
	tYni1sNSoz3UerD6z56H3WMZ91ZQBHPzlPmNw0oMck2EV8wVY+xbh1H2sfH6+sjFDNqUvMAsFOC
	xJ9iyz0kEfRMa0HkJgGKE9mx49m3vYk7ugFiyIK7l+iNPxeXLTDv+KnyrnxsWYr8HUb0Gq5xEJf
	YPYW5kqyGv8oihu9nCbiN+YyMnGxQWjPJRPZ45xdts+7iGYePTy6tmLB42qpvvf+yf1HR1Ohlls
	47wkSMm6KwDqgvTBfuk68oUAeeUjVn4vkQE62CcDbe+pFtawM7w9KtUMeaiolTVTchksvUdzzyx
	F2Hf0ZFm7lXZP5
X-Received: by 2002:a05:6102:1483:b0:7cc:1ace:fd06 with SMTP id
 ada2fe7eead31-7d07264004cmr7537993137.20.1793891881909; Thu, 05 Nov 2026
 07:18:01 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Krzysztof Wasiucionek <kwasiek@gmail.com>
Date: Thu, 5 Nov 2026 16:17:50 +0100
X-Gm-Features: AclHuK90XU4JzRKVq0JJzfUhHT5tXzMsp5UI7nHy2Kz6KnblvwFIoazGN4kpTUc
Message-ID: <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
Subject: [REGRESSION] rt721-sdca: PCM open fails with -ENODATA on 7.3 (AMD ACP
 SoundWire, ASUS ProArt PX13)
To: oder_chiou@realtek.com, Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

after updating from 7.2 to the 7.3 series, the rt721-sdca jack codec on
my laptop can no longer be opened at all. Speakers (TAS2783 on the same
link) keep working at the ALSA level, but userspace loses the UCM HiFi
profile because of the rt721 failure.

Hardware
--------
Machine : ASUS ProArt PX13 HN7306EAC (Ryzen AI Max, "Strix Halo")
Card : 1 [amdsoundwire]: amd-soundwire
ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
Link 1 : rt721-sdca (sdw:0:1:025d:0721:01)
2x TAS2783 (sdw:0:1:0102:0000:01:8 / :01:b)

Kernels (CachyOS builds)
------------------------
Good: 7.2.7 - UCM HiFi profile available, jack and speakers work,
no rt721 errors
Bad : 7.3.1 - see below (7.3.0 was installed in between, not tested
separately)

Symptoms on 7.3.1
-----------------
From boot, every open of the rt721 PCMs (hw:1,0 SimpleJack playback,
hw:1,1 SimpleJack capture) fails:

rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open()
on SDW1-PIN0-PLAYBACK-SimpleJack

$ speaker-test -D hw:1,0 -c 2 -r 48000 -F S16_LE -t wav -l 1
Playback open error: -61,No data available

The peripheral is enumerated and attached:

/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/status Attached
/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/device_number 3
/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status suspended

Writing "on" to power/control does not help; open still returns -61.

TAS2783 playback on hw:1,2 works on 7.3.1 (speaker-test plays both
channels).

Userspace impact: PipeWire 1.6.10 / ACP rejects the whole UCM HiFi verb
("Profile 'HiFi' mapping 'HiFi: Headphones: sink': output PCM open
failed"), leaving only the pro-audio profile, so the internal speakers
are not usable in a normal desktop setup. Same userspace on 7.2.7
gives a working HiFi profile.

I can test patches or provide full dmesg / additional debug output.

#regzbot introduced: v7.2..v7.3

Thanks,
Krzysztof Wasiucionek
