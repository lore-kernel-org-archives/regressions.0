Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617597;
	b=jfX3uzhCB0RCiQAtatd192TZmZVYzqQB+EzRqgvmWBQc6WGlX6ZRw+9W9tGOFs3qoJQH
	 vqTT9mjm/mfQXVoh5DpVQEeWmc/LfhTNORXfF7INXCtSiIwGtcDERsvBVzHdGnh3BmiBZ
	 RMi2uUhVqddiOccJlYWkeTpA/oBJv0fD7QVUAiBt+yODCK0VPNe/gwvPZVHBFbkfAEZGa
	 Q+euZ830LxER3mgeIeqlRZxvLzl8aN5wY4TEqnNYOWyBP7HwdhLeolWMmipL0//biOzMP
	 3VjKvkV2jQGt5ozEB439ditJZlyeNx6BmgGZjXaPeIvD3h/65rxsmtdyybLR/GvOifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=7uACpj18c5vSxhT04PkcvzJ4BcwC0s67cyii/fIfICg=;
	b=Ou3PssjRjgQ1W+xpKdmkt5Rr8knRyV0vqye2Abft04OO9AxTpttTBTULCkT0NJt3R9zg
	 WUPijVHSGFQQdRKUOkTHPsfkSCYgRMEkdhhrcX5YDNscDQX35p8af60697OtwdQHYWSme
	 onNkP9XcAFU9tn6Ft3egqCQw3uQUzcAo4K+zACryo6mSyTqROLYLUz+JyQZrT9RlNQ5hH
	 zI7lUHRliP7Lp2QOn/4KR9QXiL48kvhBkIF+tW6LcXyaNVolP9ZQHjX0UIUVfSffwAgcV
	 SrockcUXrfVngFBTteiWj7woZ5GDMtO5uBtYw9SgSHkA3U1BO+Q+prSCaSyncdcb1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=hKn+VAfd;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145E606A326
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 11:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B145E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=hKn+VAfd
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jJ85x24xwz9DYb;
	Mon,  2 Nov 2026 12:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793617589;
	bh=JcpHIHPRbTHiaFAGdolcnzsT+BS2ZSoJfZD+/uv9GMk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hKn+VAfdEPTJEAo92CKadHZv8WDHz0pIorUb1CnFEExAy23Dsf/RnoOXXFML1oht/
	 uEYkfky0ygeLrc1+sUJxPVHpf+IsKZof1GgpEATLJRc96GAWB6bqC56Mf7Gg82Kn9f
	 OD4MnhmvkMPic67+FFfTF+VwwRizrpdZ9rG3IdrJzlu0fw/sI8mtDNOOpi4WYM3C7b
	 Eqjpc4+pP/e1zB8iyQtTvWDm3UENnS38bRNzIfywQkrw30fcz5gx0vX9qIAi2yWl+9
	 Bl0JPFsc0m1P6riegrkH4SPEgsKVgQtDbLH1+Hs5XEojEiNeNBhsP/XuoyBklRQys9
	 sUNWEo/B0FKig==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jJ85x1N37z7wLr;
	Mon,  2 Nov 2026 12:06:29 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jJ84t2JpZz8tgf;
	Mon,  2 Nov 2026 12:05:33 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AB0685F9CA;
	Mon,  2 Nov 2026 12:05:04 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <509e17d2-ddc7-45a7-b801-08d8125869cf@leemhuis.info>
Date: Mon, 2 Nov 2026 12:05:04 +0100
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
Subject: Re: [regression 6.12.y] After backport of 980084de4d9b ("Bluetooth:
 btusb: Add ASUS USB-BT540 for Realtek 8761CU") bluethooth not anymore working
 on 0b05:1bef ASUSTek Computer, Inc. Bluetooth Controller (requests firmware)
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Christoph Zwerschke <cito@online.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Sasha Levin
 <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Erik Brangs <erik.brangs@gmx.de>, benh@debian.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org,
 1149377@bugs.debian.org
References: <bdafa01c-f75a-41fa-a264-407400a2cd81@leemhuis.info>
 <2026-10-25-1-daily-reply-0004-bluetooth-asus-rtl8761cu-hold@kernel.org>
 <auLhWSOpMQg6cALq@eldamar.lan>
 <0cf3aaf2-9911-4918-8f6f-c11d6077d39b@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <0cf3aaf2-9911-4918-8f6f-c11d6077d39b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179361750525.1205629.14667278806776514133@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: AB0685F9CA
X-NC-CID: tK+jJPFNB2NlJBfmjJJ24n4SWq7C3MQrDui4qUqrxrrONCFdJJ4=

On 11/2/26 12:04, Thorsten Leemhuis wrote:
> On 10/29/26 07:02, Salvatore Bonaccorso wrote:
>> On Sun, Oct 25, 2026 at 07:29:50PM -0400, Sasha Levin wrote:
>>>>> If it helps, I can send reverts of 980084de4d9b and 6f0624b4427e
>>>>> (on top of bluetooth.git master, with Cc: stable). Alternatively,
>>>>> btrtl could fall back to the ROM firmware when rtl8761cu_fw.bin
>>>>> is missing.
>>>> I didn't see any regression reports for 7.x releases about those
>>>> changes, [...] So I'm still inclined to say: leave everything as it is
>>>> in mainline to avoid any risk and revert only the backports of those
>>>> two in 6.18.y and 6.12.y.
>>>
>>> Yup, that would be appreciated.
>>
>> I'm bit lost here :) Who is now going to sen the reverts for the older
>> stable series? 
>
> Christian, you offered sending the reverts earlier, could you do this
> please now that we all seem to be in agreement?
s/Christian/Christoph/

Sorry!
