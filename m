Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914390;
	b=c86eSB6+1HBC/TfYOrJYtJ/MMOm0fxI96cH6+ISXAUD6GO3CYFOd8Et5tsAFdu1Oduw2
	 KsknHmGFdSDrR+m5rIcPksP1+T/Tyg80OPZUclawgwlAOHMxUTFmWBHKTnuiYHVXnzcCo
	 6NPpxJlKGkzFBgzBaga/C/nKJ9I0ORIyvz6sLwt2Cm0SmN3s48JxxogjOivk/qQxlkXwu
	 BbG2ZwS8MYqpONcDZAXs2n+WfqmfN2LsMoBtyI+6IVVHXNqezWBpPuqgo8aW82CyW8W2o
	 cAIPjWY8q0jBy4eEsu2IncJqAwxZigIW3oUfzjE+P3mcUGfzXqx2smLSicfEqlsWyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=637AXF9wFoSkEmtNS0d29vTnknxZCJItDtybf93OyJQ=;
	b=1MEECRBsofCLObt8qo21YxWN9u0/CcDSdZWPECzHCUvjYPRO5CjsEqHo3QKG9BCqdzQ5
	 2oXeECv0nDXEYx6dEdj9sEqk09Hdp6sly2Qgauj9TRhOrgBcA3Ban4FkmCHY4vBH5wpr2
	 1I+St0sgvL8etHUF3k0EbOXFu7qkE8/MSIExu+kpJSzWA0IPsZCfoT6OQyrT38ROtvpi4
	 OE/X5B6jNHONGqjyoJ14QH1jsjteqeZsZG48MLzdgvDS86Ge9HuKaubGkF/fidDYUrInG
	 MeYi7fXuKMEZY/LiaOc38ZfecTAMX+v9HVvj129tEQWddVu4S0Mto4VJVS+F265hwYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="eW1/iavd";
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2999606A880
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 11:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2999606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eW1/iavd
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jTMhD6mSYz6Ch4
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:19:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794914381;
	bh=637AXF9wFoSkEmtNS0d29vTnknxZCJItDtybf93OyJQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=eW1/iavd3XDSWxDIAGwfSWJA7p/D4qcCLFXmMTlQoz7k7VvDBoG6ufeGt0ad80mLz
	 VmsqtkK9XNFCtMrqGReGr6qAM0ydZC3/GXorFB1nNgv6w7k1kt6OQ/+DdTqSQIXHef
	 DOuIXf+yeZIAB6P/NhmO7wJNNwdtKGnXG0cMbkco+O8EQUHytfc60wHdJqku5KaVRR
	 eNt9ZQO4IPz1w6MSGinOB/HxS600EYRMYI9Q5GxtYBYJtiaUL0hpRaRbMkJaSipOXT
	 RTdbchi3oNebpOSXO1LSgK6Ikd1PTI8AGvkwfFpLTv7g98we+6N249DZfYlaFVgHbA
	 wxd+28ZAUJm2A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jTMfr6BSDz50wj
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:18:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jTMfl37ffz8v3g
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:18:23 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1FDD95F8B2
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:17:56 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8504cec4-4bc6-47ef-bd14-e99b27fd0e36@leemhuis.info>
Date: Tue, 17 Nov 2026 12:17:54 +0100
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
X-PPP-Message-ID: <179491427631.868355.14638397336664385553@mxe9fb.netcup.net>
X-NC-CID: 3VZEfvmfHsRcD2O4Ly50Ie6KUiuvO75VQ3H3susDH9K+Tt732cg=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-mmc/20261112124430.110629-1-johannes.goede@oss.qualcomm.com/johannes.goede@oss.qualcomm.com/
#regzbot introduced: eed222aca8d0
#regzbot title: mmc: sdio: rtw88 8723bs support sometimes fails to bind
at boot
#regzbot fix: mmc: sdio: Set acpi_device.power.flags.ignore_parent flag
on sdio_func companion

#regzbot report: https://lore.kernel.org/all/aveDNRBLx1a-9hRQ@mail.tty42.de/
#regzbot dup:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17848

#regzbot report:
https://lore.kernel.org/stable/20261108143640.6252e6a8@teclador/
#regzbot fix: ACPI: button: Enable wakeup GPEs for ACPI buttons at probe
time

#regzbot report:
https://lore.kernel.org/stable/179104011040.2214689.5921682013387867802@eldamar.lan/
#regzbot fix: Revert "Bluetooth: btusb: Add ASUS USB-BT540 for Realtek
8761CU"


