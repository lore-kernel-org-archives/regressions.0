Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4A040D58B
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228232; cv=none; b=PI/oB7nVOOjwErymLbiu061tPcII49vkLH5Lj++iq5rIAMX3ABtHfO/6kiQeXouser8GulJ2GSJ8N+iExy+0TPzP/ZDnGWIXZBF573NTUzHGPud9mtDFN6kaaxoBTnTrflkYaqOh4NIw4udt8GEyOqMG1GlKbRE67++ygIV19PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228232; c=relaxed/simple;
	bh=iOBUFBemG8NEe5V2MAgisOYGyy2Zcl52meNMunyOkoU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=YFOuLFny/QBsAg85BmvXno4O6Va1wQwMSU+EUICflzEYD/6DPgoGkzARGBKQb+VnxTsV3NaTaBpasXeKzDme9gaQgqbfpi9LM3skxe4GxTGpaMrI7wHUH+koI10BZ5Hj+lO90AmOsBciS9z7TQZm23w/YOXVO6r4GTOuZ61PZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=b/wm/RkJ; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="b/wm/RkJ"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h8TWx2kj2z88pD
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 10:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785228221;
	bh=iOBUFBemG8NEe5V2MAgisOYGyy2Zcl52meNMunyOkoU=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=b/wm/RkJygv+9ZBevRfGfbmJ0LOV9AroyrJtEG3Wo7Uy2l9/NVIXq4aGp8M4/Z4t0
	 aKq5vuz8E+m0hZBMpFsmIhvYBYLj0bzYsX/T+mHxGX6FarEx+JPBp2pz/7KkUAG5DJ
	 9cnF9+nKEYaxdg71lZiJkU22XAFLAPgZTMlvyLMZggkstfNpGRp/YbsGfL9rGDUSe8
	 wPWPJ4o0NoQb5xyhCSuI+qJ70WEIY8MUh0Ob1eXXOkjGGXiAoFXwnXl+Hmdlj/zf8x
	 +mJ+KvFlIBDt+3X1uJAT/2YEHXToJazzRu48Z/tgqLdo69ZmaZg+wDZimOnHvWyn3f
	 8kr3MUa+pxElA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h8TWx22Zqz4yxt
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 10:43:41 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h8TWx0Vxqz8svF
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 10:43:40 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 61FBB5FBB4
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 10:43:40 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c9e788ad-4a7a-470c-a847-8df24b240d5f@leemhuis.info>
Date: Tue, 28 Jul 2026 10:43:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178522822057.318687.7491698035965463302@mxe9fb.netcup.net>
X-NC-CID: 4Uw0mrRYZIAqOxP5FZURJhdtMy5UtsQaqjTtlNxoHOZxheUo0y4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/178198613176.3658222.16247101620976737948@eldamar.lan/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5531

#regzbot report:
https://lore.kernel.org/all/CANn89iJkmTwbHkTJ0LgHvhF8PN3zkXmK7A8bydXh-B7yE4K6Rw@mail.gmail.com/
#regzbot resolve: inconclusive: reporter MIA

#regzbot report:
https://lore.kernel.org/lkml/42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com/
#regzbot dup: https://lore.kernel.org/lkml/8733xko1ms.fsf@geanix.com/

#regzbot report:
https://lore.kernel.org/all/20260724151419.26014-1-spasswolf@web.de/
#regzbot introduced: 13b7e6a96a00
#regzbot title: wifi: mt76: mt792x: hang during shutdown
#regzbot fix: wifi: mt76: mt792x: drop redundant napi_disable() in
unregister path
#regzbot monitor:
https://lore.kernel.org/all/20260728002048.19351-1-mikhail.v.gavrilov@gmail.com/


