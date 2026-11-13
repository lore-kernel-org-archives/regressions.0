Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571748;
	b=UWHdOnzWeos5cLX7jCiAamyXYimCIvVflQByNk6w+7t/yelYHnG/1gC46BFwgHfHdPDL
	 GUfxbU0FlY3FFPowpBggNLNeNB3qKwo0Nj586j6pN5eQ9s/iciY+94jyoGCp7w22E1Fys
	 Q/6L7chICEc4/nEnIxGL/zhNGaM+nG6uUHrnHe3Ld3N2huLFb+Yp22JL+s3qDpL3x3acB
	 Nn4EgmWF0Pqc7pIWdsHLPXvbVdh9/EBvZUlTFxL69Aaw4ybNct9Jv35Oc9q+9FimJzh4Y
	 yTGeUXsYmqIH2yNIWpn8K3L8ZQGV0BTmXV8bUu7Z6v5uyYhZyHcvKl7f0JW849zprcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=xLZRJNqf2nnZ12pwBR2LFWcyido2Yq8r/3Zhtdj3H0g=;
	b=TiJJKyDuMvstxwg8eqp9g7QZ6b9fBB0ojgZHtWKaTTjc0OQxGBlNscEbBYcw2WmWgC2s
	 0qYVlwrsCN2WMB/OSfIuHbrciHcag4lPsB9YaPKQXlpx9GjHotWMXpvJ0f8PgJ7b58/Lr
	 7TkfDt4mrv94MQ6KKqcHCOmofMnpmbkBP5YECVESdBYylp5YhAXbtGcFx7rd8iuRp1ggM
	 doiBKYjlYo7Mejpc1BuCDYbQ7QWU0mGLUo3Q4gR+/4brELOaMkJKUo+YA/Bah9VDWTDlb
	 phBBp3tAiuTlm2YIjzlTSHrnwNGtiUNYcsgFDmX7ej95CnvYFdT0jG121SQHE+u+bbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XoqzMQfC;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFE9606A323
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 12:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BFE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XoqzMQfC
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jQwx82cGJz4XVG;
	Fri, 13 Nov 2026 13:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794571644;
	bh=x3XUK4PEvirZiY84EqhnOK4VJttR8MMMU/LdhyNjwM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XoqzMQfClfvdhiHIAmFgwM940TA8E7l/++Oyw+jFTHXTK8E9uvtq480bh9C+hRTHT
	 4jHD4/LI8Y2yS2joGzh2MzjB5PlapHsraIOdCCU1a4WXcR87S1EaCApwusV8vljxiZ
	 HxrLgYCcHCF0PXAZQWQvDBxdrbT6CF7h6zd9QcsATgTEroICeXqkGiWKRr/WbES5Gb
	 FqQorR/rzwhaVhdkdcNXsWM7WJuVRlsSikbUle1l/CqIgi6NmEq4tIQ7tJFyXibQgr
	 hpmsuz5GcfV86O6npqGBrD8oOzX30qnfEuS0Ajf84CF+Fqc05NC+rZmKWnwnJUBpbp
	 DgBaRsHJGMNjA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jQwx81vByz4XTw;
	Fri, 13 Nov 2026 13:07:24 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jQwx74TWwz8sbs;
	Fri, 13 Nov 2026 13:07:23 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D55705F97D;
	Fri, 13 Nov 2026 13:07:08 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
Date: Fri, 13 Nov 2026 13:07:07 +0100
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
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
To: Lee Mann <leepaulmann@gmail.com>, baojun.xu@ti.com, broonie@kernel.org
Cc: shenghao-ding@ti.com, niranjan.hy@ti.com, antoine@montane.tech,
 andrey.golovko@gmail.com, pierre-louis.bossart@linux.dev,
 matthew.schwartz@linux.dev, linux-sound@vger.kernel.org,
 regressions@lists.linux.dev
References: <20261107212552.10990-1-leepaulmann@gmail.com>
 <20261109170325.10953-1-leepaulmann@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261109170325.10953-1-leepaulmann@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179457162934.1115284.15655238484368062611@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D55705F97D
X-NC-CID: A2jqbRO4Rij73N8Z6e5YddwUaFQhl4SGEgbV3zzmyxlkcMmhK/k=

On 11/9/26 18:03, Lee Mann wrote:
> Follow-up with one more data point, which supports the approach in
> this patch.

/me is not sure what "this patch" exactly means (the culprit?)

Anyway:
> Same PX13, kernel 7.3.3, with two modules swapped:
> 
>   - snd-soc-tas2783-sdw: unmodified v7.4-rc1 tas2783-sdw.c/tas2783.h
>   - snd-soc-sdca: v7.3.3 plus only the sdca_functions.c fallback from
>     SOF PR #5904 (function type for mfg 0x0102 / part 0x0000)
> 
> Kernel log:
> 
>   acpi device:26: function type not a DisCo constant, using fallback for known peripheral
>   acpi device:26: SDCA function SmartAmp (type 1) at 0x1
>   acpi device:28: function type not a DisCo constant, using fallback for known peripheral
>   acpi device:28: SDCA function SmartAmp (type 1) at 0x1
>   slave-tas2783 sdw:0:1:0102:0000:01:8: Found Smart Amp function at index 0
>   slave-tas2783 sdw:0:1:0102:0000:01:b: Found Smart Amp function at index 0
> 
> speaker-test -c2 -t wav: Front Left from the left speaker, Front Right
> from the right speaker. No "Defer on undeferrable control" warnings
> (with the same fallback on the v7.3-rc6 driver I saw ~1600 of them
> during playback).
> 
> So on the PX13 the v7.4 driver works as intended once the ASUS SDCA
> function is parsed. The regression is only that the parse fails on
> this firmware. Getting the PR #5904 fallback (or an equivalent) into
> v7.4 would fix it without bringing back the split. I can test a
> posted version.
> 
> https://github.com/thesofproject/linux/pull/5904
Hmm, still no reaction from Baojun Xu, who authored the culprit.
Shouldn't be like that, but that's just how it is sometimes. Maybe this
mail gets things rolling.

But if not: Lee, does a revert of the culprit fix this? Or do you want
to maybe open a separate bug in https://github.com/thesofproject/linux/
and see if that gets things rolling, give that a partial fix seems to
exists there already?

Ciao, Thorsten
