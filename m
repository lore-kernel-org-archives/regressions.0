Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917140;
	b=4Z05tJD+DmPqJtkw1oCyDkWgve5OCvlsQEj2LvR33iRUbUU+AcTVFaKGrlh76vc2ZfnQ
	 wCGqQsPx7QeoW4D+KQ16z1ioJECZeE4S5jHIhnv29NIh3rw2Yq77Wcn8qEHsuzUYKM2gQ
	 IoYQeJg5noSor7Eu6sSGSwll/TAAPv6J4BTDFERryUqJ3plLP2wEJlECwIXSIADtDqbs9
	 jwj7R0y8++gpxOjc7Urq5UW480pLeOTeAs7H3mJ63lhLzAac2Z36dRPumnZe7CyxDvBOA
	 kCZXFg5xxYd0Ie6EVWMscvAr5CKVMOVrzUQOnEqA4wha1jt0lYTyt/wX84lkK6hRxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=Xcy/mnhs57iCuGDBblYqg862fI8Hw/FZ6mBh9xp5qwE=;
	b=t6LYLZrY5bb1J01/PYkIh2/WRjXcsIqwaqTzG3VsmT9xbLmhBobRfXGnwmX3QMWIvUhD
	 bGeiHrO6oKl8uN5+xwRINP9cFKmfAI1TNTW6JDHN3CiscdcKscoTSysszubHqmJjbAI+6
	 3AeB784jYcMsq2ov2dcsGgPv2vIxnIe2vHwvm5v+NPMOM5yYUrX/thv8jOKo8NkR/t62n
	 29GxCnnqgeCUrTl97ABLVnDLs1aa0yHcUVQk6ZL266WKd+BGX1kPV7iRcTcMseUUyHHzD
	 cA8B5CWSAnH8GBVM8OG7kPM8yZvuFAYJ/8pZOZKsSgQZEtR+1qb8qVUGcwHyBJ4wMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=iiTe7NKT;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26780606A31A;
	Sun, 25 Oct 2026 08:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26780606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=iiTe7NKT
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jC93k266Fz4fMg;
	Sun, 25 Oct 2026 09:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792917138;
	bh=lOvw4cdjrryRRgALi97MmWm+plGKa23VizpGgteuWBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iiTe7NKTLVopOKttngruD72l3Ed+nCaBo+FNlC7GY4cw0dOn4OBypTPrmxLege/B1
	 XmrmTPvBaJYJcjoMv5ycR1NNIQDWRo1HrAkrEK1ldZbsvtA7Sfba3yqbl+O/wNYYPP
	 hRglKNkQn1DMXq/W7NVAdPhTGYfJ0aXhIUS02jGpRiHGV3w43Q7cJIhFE04usGN2+l
	 owI9sMU3ZFtjHj83DYq9l1vfcqc+XxbnBE/u95mhlm6uPf09eeG43394SxpXWuzbNk
	 bNSKnjz6tIOVJJUY1Z9TQiDaKstJYdqOAyRp4s45zqBkck4o/r0o75mb11oe4pnOFf
	 jZ9jx7lOVdJDg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jC93k1PyNz4fML;
	Sun, 25 Oct 2026 09:32:18 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jC93j4dsHz8svY;
	Sun, 25 Oct 2026 09:32:17 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0B00A5FD4E;
	Sun, 25 Oct 2026 09:32:02 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <466269c4-fa0b-4dd7-b40c-eba5c6f95035@leemhuis.info>
Date: Sun, 25 Oct 2026 09:32:01 +0100
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
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_mainline/master=3A_=28build=29inva?=
 =?UTF-8?Q?lid_use_of_undefined_type_=E2=80=98struct_acpi=5Fdevice=E2=80=99_?=
 =?UTF-8?Q?in_sound/soc/sof=2E=2E=2E?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
References: <179291154395.445511.11371466163163680530@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179291154395.445511.11371466163163680530@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179291712237.1257646.9435084170011722741@mxe9fb.netcup.net>
X-NC-CID: IhD2R63BT2dXgixUU7enHSsodoBzVoPFu++fJb9TymNeQCxCvxs=

On 10/25/26 07:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
> invalid use of undefined type ‘struct acpi_device’ in sound/soc/sof/amd/acp_asp_mailbox.o (sound/soc/sof/amd/acp_asp_mailbox.c) [logspec:kbuild,kbuild.compiler.error]
> ---
Thx for the report. Arnd sent a fix for this Mark already queued:
https://lore.kernel.org/all/20261020084656.2725461-1-arnd@kernel.org/

#regzbot fix: ASoC: SOF: amd: add ACPI dependency

Ciao, Thorsten
