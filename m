Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067230;
	b=TXdsZ5Fj/+3Z53EfJbwIIeQ04z3otomTwrcxEOPst3R6Nbd1jXiV/ejjiLakGM+MJmzz
	 FbM02jHm+YGj46YdoK/TAa6XuZcU+kdX10chkXO6RIe9ZSnjIDqseKWvMEOuOsmCja8hj
	 PzsyApJW3ssD3EQZAwZ0oZ072NIxMpwuSogy5lrE1aFiYbANhP6MYL3Th8c5qW6K2A3VF
	 NP8XjleOT1DLOv06e67tHjb1OwDyac51/UcXXcOqfNDq2hUURBI02fkM2i7SyUsai3MxC
	 gsFmTbVdlxUW/sRz96zLX7qIBUDRjzqVXPwPlJCHIA9rDL2k9qvuWDb2RIgjxyRTDtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=r4THe8XWKXJkaW+4b/Eh0tG/C2S4ZirrXFlB5HEaKwQ=;
	b=x7fIKFJSGteDJjb1QQgXPtYZ4RsCfkjYiPjrlYeKy+K4O10Pgd6S6/aeM88cLuNSz/Q5
	 2C7ym6xQpAeQP61z4bz+FK5P6wpbAF5LFPeRyKd+BhQhQBqd4ZDJbWN9m0zJw5w23bCv/
	 MztUvMRIU6WlpACO9Ie58WvQYjJFF3Voc9AVM/LnKuxrNUsqGAvAnsOdBvjSzhR4FHr5x
	 U5lEd3VEvOrrRovMzuNODiUgoK0BFQgMJu+TuycKY75qWt7CxIGiAsOeBwo21i0lOufXO
	 6cGpde0uIjVby/SjJAxa2P2DeHB7fWaRmESVgXZEzmqubbmNRIQfk9MBJnwaZ4VU+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SK1XLn5h;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77179606A32A
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 05:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77179606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SK1XLn5h
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jVS9X63Mcz40sG;
	Thu, 19 Nov 2026 06:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795067120;
	bh=HJ5BpCGKnBIXcgRmXImslcxZp1HiWCvJJXfR6h/yHM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SK1XLn5h9ySLm9QuXg3z9Y6xenUerRC97ARP9O9KXEKvYHEf9vU7RCjr/y/Eg+jyc
	 5jIa311DbKE5srq5MER5HZatRA+Gv4CFCIEWrW2Yh6MsGKl5tsSgweAHVQVUSB+dD6
	 IiZXBYIGLXJEFnjdzWVGy2qCVhyKy5bGCYsjdIGNXxceDBNFdeQWIRg7+DBO7zFs/h
	 yWsFfQvLEwQ/f0L1wUS6pbVzKboeQRse6amScL+QJN7Xnz7gd0p7wl3c+elq5ccyB8
	 I71T+1tGn1y8CLaeo2V8eJ42ZM+31JcGx34blcV53pbZGXohdV2B5CjnXBaVCGFNuc
	 ZUgkDDvl/uZqw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jVS9K046Hz42pv;
	Thu, 19 Nov 2026 06:45:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jVS9J0p3hz8v3M;
	Thu, 19 Nov 2026 06:45:08 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 498855F9D3;
	Thu, 19 Nov 2026 06:44:59 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f5864dec-ed41-4285-b888-737f3a38b33d@leemhuis.info>
Date: Thu, 19 Nov 2026 06:44:58 +0100
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
Subject: Re: [REGRESSION] media: em28xx: NULL pointer dereference in
 em28xx_close_extension() on disconnect/unload
To: =?UTF-8?Q?Pawe=C5=82_Ziemniak?= <pziemniak@gmail.com>,
 linux-media@vger.kernel.org, regressions@lists.linux.dev
Cc: jiangong.han@windriver.com, hverkuil+cisco@kernel.org,
 mchehab@kernel.org, stable@vger.kernel.org
References: <ec1ffcbb-1625-4925-ae6b-f2b04dca1e1a@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ec1ffcbb-1625-4925-ae6b-f2b04dca1e1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179506709964.4076388.12474738743134347074@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 498855F9D3
X-NC-CID: r61N+65jG942qagyqzFIgs1wHPUQDiodh/ZL3xH6asghtG5cDnA=

On 11/18/26 22:56, Paweł Ziemniak wrote:
> 
> Commit 826915b6b65e ("media: em28xx: fix use-after-free of dev_next-
>>devlist on disconnect",
> CVE-2026-89891) introduces a 100% reproducible kernel NULL pointer
> dereference in
> em28xx_close_extension() on real dual-TS hardware (Hauppauge WinTV-
> dualHD, USB ID 2040:8265)
> whenever the device disconnects or the em28xx module is unloaded.

This is not my area of expertise, so the following might be sending you
in the wrong direction. But FWIW:

From a very quick look this seems to be the problem that was reported
earlier; a fix is discussed here:

[PATCH] media: em28xx: fix NULL pointer dereference on disconnect of
dual-TS devices
https://lore.kernel.org/all/20261104052800.44551-1-sikorski.grzegorz@gmail.com/

If your's is a different problem, please let us know.

Ciao, Thorsten
