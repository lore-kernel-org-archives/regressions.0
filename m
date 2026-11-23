Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433118;
	b=4ltfaDCN79NyiAh+qAsD8P7s6e3Fvxln4Cj9avPFzdFgYZ2jt2HX4D6wIUDoODwO//sO
	 LpzUMD5xM5xLBZgt3tl4obw3PjhMZpqTIPaZEjzkdxql4lVBNDXuTkyEcaYvu3mWXwKIP
	 +UrYXPJmmW37v8GdqpvHV3d3QUHk/xhrX95oFlF045v9ARNrYgSXAfn+0yGA8m2JadZvC
	 CMYrkPjz/aAQiLl/oyCk5zwm18xY8Dk+ASXlz9L67TpRVCyh6DFvfNUH4fKvH2G/bBLaV
	 mFUhloDY72JfXXeAkb5oSJghRCHYybDynnJyNivV4zIusDsTWGXVK3Dc8IT9HYLMJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=QeFgwFK61Qlk9n0b9oGrXn+BKDOwoNhEC2QHtkJNw2s=;
	b=Efec77mbJyoQwC5e2tt7xbYfozB5gPpTJDOVxB7SH5EE+5C3I7irBBriRTbHC+fa+VOR
	 PqzyLSW46UhKkjh0Vky2NDSJgwm7LKgwoqVYyyc3DIvDIAPK7dHKi48eK33Rp1WrtbDSy
	 +QYNQ1LIcfQYfJseB6GrdPH+daVgw8ehl5+zOA5xHlX3xgZbt0cFkyJ8KdsfL2kJNoHvq
	 rN9Bd+d2z2vk6ISlMdTJwuNTOWwsBC24L1OSFkhaw7Kh32gX2XajbghJQ94wOIQpLNfBq
	 FWJq9Vk+L/shayTl4jkXy5R/FSpRP9UFbdtBNNP8+v4YEL48BPu+yJq51IBKeQSYU6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="W+7L/n+y";
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413D606A337
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 11:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A413D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=W+7L/n+y
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY3Ww0Jj3z6Kty;
	Mon, 23 Nov 2026 12:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795433116;
	bh=PwEIzrhdbOgq2dDwxEKJ5z1esNrMe4RRpf3PI8f6pVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+7L/n+ySgNKWpC7brvSwfoZ1lT/Bv2Sm0J4tqD8W+iYkueEtu0qz3+89etzy/dcw
	 rMXYxHxiW0awanzaqGkyfKM5OLoaXbVOqJ0XxfS5Cpesqc9y/MALXGWaahQUxgN1Bg
	 L9EHU6O/TNehrJV1O1VV+OpfzI2U/pDpDwBll9kMoDKlhC23aB/1y67FAbNTPaHicf
	 n0a+iqPgIAjIVbUCH0Dc9NBODQMJbKa6554td1tPwky49v7PsK2F6KlXmhwNArP79j
	 nOkR3aZ231IQJ0dLrITPI8KXlSY5YSwSPmdZQ4/GZkzxnWe6R/ArY8yhfV/AvXGkCH
	 jeuUznPQFXSog==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY3Wv6fr2z4ylg;
	Mon, 23 Nov 2026 12:25:15 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jY3Wt5Lhrz8sZw;
	Mon, 23 Nov 2026 12:25:14 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 239B75F837;
	Mon, 23 Nov 2026 12:24:42 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <52ec243f-5d13-4260-86cf-57800e1b887a@leemhuis.info>
Date: Mon, 23 Nov 2026 12:24:40 +0100
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
To: baojun.xu@ti.com, broonie@kernel.org
Cc: shenghao-ding@ti.com, niranjan.hy@ti.com, antoine@montane.tech,
 andrey.golovko@gmail.com, Lee Mann <leepaulmann@gmail.com>,
 pierre-louis.bossart@linux.dev, matthew.schwartz@linux.dev,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
 <20261113124358.11823-1-leepaulmann@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261113124358.11823-1-leepaulmann@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179543308261.1518568.3438918419129213930@mxe9fb.netcup.net>
X-NC-CID: jJ32yJnfBY/13nVQBaAUNW2EWUnQOY/8FGFK7MQOOiYo+29y2Bc=

On 11/13/26 13:43, Lee Mann wrote:
> On 11/13/26 13:07, Thorsten Leemhuis wrote:
>> /me is not sure what "this patch" exactly means (the culprit?)
> Yes, sorry: I meant the culprit's approach of leaving channel selection
> to the DisCo table.
> 
>> But if not: Lee, does a revert of the culprit fix this?
> Yes.

Hmmm. After more than two weeks still no reaction from Baojun Xu so far
afaics, neither here not in the ticket mentioned below. Lore also
doesn't find any other messages from Baojun Xu since early Nov.

Mark, do you know how to bring this to the attention of the right
developers? Or should we just revert the culprit for now?

Ciao, Thorsten

> Kernel 7.3.4 with only snd-soc-tas2783-sdw swapped for the
> v7.4-rc1 tas2783-sdw.c with f42fbd560cd8 reverted (the revert applies
> cleanly), stock snd-soc-sdca, no fallback:
> 
>   speaker-test -c2 -t wav: Front Left from the left speaker, Front
>   Right from the right speaker.
> 
> The kernel log still shows "function type only supported as DisCo
> constant" for both amps, so stereo there comes from the restored
> split, not from the ACPI table.
> 
> To sum up on the PX13:
> 
>   v7.4-rc1 driver                          : right speaker silent
>   v7.4-rc1 driver, f42fbd560cd8 reverted   : stereo
>   v7.4-rc1 driver + PR #5904 SDCA fallback : stereo
> 
>> Or do you want to maybe open a separate bug in
>> https://github.com/thesofproject/linux/ and see if that gets things
>> rolling
> 
> Done: https://github.com/thesofproject/linux/issues/6037
> 
> Thanks,
> Lee Mann

