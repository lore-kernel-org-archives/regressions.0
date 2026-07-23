Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DD3859CB
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787439; cv=none; b=TbgKOw2hFS9g9Ce91dlGCFbuL0NZP4isJW7l/vPwSEJJvkCrUOdvX2z8nCc0BExRuFKX+mXkDEchtar+2nG6Xj4PN2+SVUkGXRjcfOmpiEUG46ZJSax2G16wUHyF1WsClOSAiKiqlbbczW9EtQ7CTpcy6dggOhqZA6/Uc0ZPEjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787439; c=relaxed/simple;
	bh=yDqogXopZlzspiBfaL8L444xP1sWJavnj+1fMM1cLjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iP1pde2pdnbE3pjt7NK6YYLFFpNGBRbTAtCiNoppCvwj3B6G1XCE5KI2RWlsL08+Bc+laxFVjes8TgUjJLRw6ExGr1mWgdlUrpVQbTwrR8syoIxyuv0YV+BQ8SQr8rr5SKiRxlQKr3z4L9EU9WL0sM1a8kUm2gZaVaCzmHBq6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jHght0yx; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jHght0yx"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4h5LW724Pqz76RV;
	Thu, 23 Jul 2026 08:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784787427;
	bh=yDqogXopZlzspiBfaL8L444xP1sWJavnj+1fMM1cLjk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jHght0yxxztOW60EISZoo2Oz1EQOVykdamq8MsjPTAjGuvSXMFcrSa2kSAIz1MeLw
	 aXrFLrwOIM/CngE9peo1cmG/5znLBoKh9i7bgc/OW9cN+40MkUkuyJmFb3IoHGwFE2
	 /PUyDevIf1lYiG7wQpK4hpU7sbBOPmynGF5UtREJoJ+egDMyQnPCuiVSPzgV+qN6SY
	 B+q6a3iwzrgSPQ1RlW6Tp6eA9kdmd7LIeG0glEhobtaeOrqwNqzSfy3yemf6jL5Tl8
	 6+CRLggQZQ3n3o9rxHOb53M8wFaBULG50njOZMn3USwcIuxQ2sdAveFWKM9zw/9ToC
	 FJ/lzgYM684Sg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4h5LW71NMCz76R4;
	Thu, 23 Jul 2026 08:17:07 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h5LW66Pcwz8svZ;
	Thu, 23 Jul 2026 08:17:06 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6631F5FB8F;
	Thu, 23 Jul 2026 08:17:06 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b601a4cb-4e63-4b7a-9ab6-2ce3b9549d65@leemhuis.info>
Date: Thu, 23 Jul 2026 08:17:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pixelbook 2017 display backlight with 7.1.x
To: Matthew Obets <matthew@obets.net>, regressions@lists.linux.dev
References: 
 <CA+UyQRutDUHbSSDv=MeNNXzSoKc_AWfhBzON0vjQ7Q9TP-Ujvg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CA+UyQRutDUHbSSDv=MeNNXzSoKc_AWfhBzON0vjQ7Q9TP-Ujvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178478742661.3766200.2329563343454122243@mxe9fb.netcup.net>
X-NC-CID: BWtZK9UMVMU+iiSg9ZNrZw+ZTyHJaSsBvezlr/i9t8il+dEkafM=

On 7/23/26 03:27, Matthew Obets wrote:
> After upgrading to kernel 7.1 the display backlight brightness
> adjustment stopped working in KDE on my Google PixelBook 2017.
> 
> Neither the keyboard brightness keys nor the brightness slider change
> the display's brightness.
> 
> I'm currently running kernel version 7.1.4-202.fc44.x86_64

Thx for the report. There was a earlier similar one about a device like
yours:
https://lore.kernel.org/all/CALcz8n5nB%3DH8CZza-Pw%3D%3DGfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com/
It didn't get anywhere as the git bisection didn't work out.

And another one about a Pixelbook
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507

Is that a device like yours? Then this should help:
https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/a411ea4a87162898d2a0547fdfb721ddb7626be3

It will hopefully land in mainline this week. Could you maybe try that?

If that doesn't help: Could you try latest 7.2-rc, as there is another
fix that always went into 7.2-rc1.

Ciao, Thorsten
> Please let me know if you need any additional information.
> 
> Operating System: Ultramarine Linux 44
> KDE Plasma Version: 6.7.3
> KDE Frameworks Version: 6.28.0
> Qt Version: 6.11.1
> Kernel Version: 7.1.4-202.fc44.x86_64 (64-bit)
> Graphics Platform: Wayland
> Processors: 4 × Intel® Core™ i5-7Y57 CPU @ 1.20GHz
> Memory: 8 GiB of RAM (7.6 GiB usable)
> Graphics Processor: Intel® HD Graphics 615
> Manufacturer: Google
> Product Name: Eve
> System Version: 1.0
