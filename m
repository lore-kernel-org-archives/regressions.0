Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21213A784E
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339566; cv=none; b=K8WHzkmQHNnuc3fc0zQ4gHhlUBBZv3J+08bmC9SNf5AbCBT2M78droxxtUx/xquoCzb/HUq6jpeUZz75rTiLmYCOWKZ7vK4uWzNhHM0DBOTC0HZcY8PFYC8S2mGRmQt2Siv4JoziKFDougWk+w7bW2usNC40W9g7ZXu1crQ5SUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339566; c=relaxed/simple;
	bh=LERJqbsjrjSB/Ze/DldV01kRhX6yhzuOyCC2dw34Q+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=skak30sZmeGDdgbzfiWKn3EO61J7IolApb+mG+l/N3/9qB0+8FJ/klbN3QiotYIXmMhEXui5JzeBUY6t2Ew25FnZ+NzSYLtZZzZ9G7S68JIUbY9+1X0U/Nf9p7TFTK1lWIbA8cbkREznbln/pjkYcFjuED9w1rzTKSJM4waFTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QMMnfseW; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QMMnfseW"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hrqpr24ZSz4F3K
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790339556;
	bh=LERJqbsjrjSB/Ze/DldV01kRhX6yhzuOyCC2dw34Q+U=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QMMnfseWjodRX5Gt7jdz7yvZxQrcyvb44GomK25cup4UrQyBK1xc71QUcbdHg6JMv
	 N7LcKxpzwjEnH8+YJpXbtffU6WVipWc/6gwgZrYrjqQYfTK4MXe8a8/NuW22Thk0Bx
	 LaXBvw8r0ICZnEcoArWSVlyYvsqPu+rYZSrlXsBzv+N/1qAl+BpOpiyy9asJP489U8
	 HZzhBhDPBqrRz1krxUeDcrcJI74EnOh1OvsbnF09ZYM7NFWW+v+doUSxV/r6F4/aag
	 JLqCyWjYSC/yFPaUsxoYU2RkYf+IuOykIcljUP/gOpubVCjSH6PrgpuPqLTYSdaTnw
	 TLEvrxYFzPdew==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hrqpr1MM9z4F3x
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:32:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hrqpq0lRbz8tdZ
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:32:34 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 403465F8CC
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:32:34 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <acf0103a-aa22-4fd0-a7fd-740524489ed8@leemhuis.info>
Date: Fri, 25 Sep 2026 14:32:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
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
X-PPP-Message-ID: <179033955442.644127.12307363014383498483@mxe9fb.netcup.net>
X-NC-CID: 68a+gb/9wUnCdyltP2Du6FCAaaAZib9Qp1Dvi0HElvnzdvi0LYE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/069bd866-4eb0-4c42-bcf4-6983ba59aa49@slotpi16m74/
#regzbot introduced: d0754db7883c
#regzbot fix: HID: asus: fortify keyboard handshake

#regzbot report:
https://lore.kernel.org/all/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com/
#regzbot introduced: 9e4a3ec3411b
#regzbot title: x86: mm: protection fault when using a boot-time
function tracer and a filter
#regzbot fix: mm: don't schedule deferred kernel page table freeing
while booting

#regzbot report:
https://lore.kernel.org/all/20260923074256.9357-1-liujianfeng1994@gmail.com/
#regzbot introduced: 143755bdabaa9
#regzbot title: dma-buf: drm/msm hardware video decode broken


