Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612923EDAD2
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176273; cv=none; b=YnRkOZV5mZDfB5EoPQcaFeeU1UekUYuTGXzmVzSNTpfi16+fsZgY7422tkkUCwlPZiqE6K8mCE/B9eq+gMn4fERoMepgb8PBs8gf0FYKyKDXhhps2g9rwX7lhCVw724ZoMUlPNwa722+v0Uq+Brms1/CZcQ0ZfHXMe4a7UXHaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176273; c=relaxed/simple;
	bh=VD0d3ENv4SdHSRLR5Wrel9flUnCQBQhU5Db+lfkT4fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g87zW+PsFIoc8OTgLt9O7gqMfJhq9NQ9guNKsmfEMh0FimuFvS1BCs8NYLx6f3rafZToko4xRLmMqzIVp194WhaLOTjwqfB72f1AElwaJaabtx9sNog38xOZo7guo6ua/siI5AoIdLG4IZQ86GmXKn7kyhSsRqlIE+yBNER/lms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GV0C0x5+; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GV0C0x5+"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hYRb01TTCz8CD2;
	Mon, 31 Aug 2026 13:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788175740;
	bh=VD0d3ENv4SdHSRLR5Wrel9flUnCQBQhU5Db+lfkT4fE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GV0C0x5+ToaUDUU6ofTDHpYNgOk7OZTFn2K8E3B6+IurwW/FE+0/x/xW2awU0XziL
	 /enRwBOLDaVcQak8LCOyvddF/3VkFqL7qUB9pPQN9Qi5s5mWMvrv18J9bc0IU3dSzu
	 JN91hgDQQ8cyCLkexbnt9jygEdz3uO7p9hEMJcjYwss0r4In7IUXtlQkX4frHcVU+m
	 piVc19RavqUgJ9aVP9nSV1PDov1ewUwvHPcJebdNn793o//hxpVqwbDvc1Rcw1P96r
	 OCjevWDu04lje4UHBWc/BfyEbsPdPtNGjSgqK15BdsXI3QNwQuEuqyffcthkkrTzHR
	 Jyy0qPc0jb6BQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hYRb00n8kz4y4x;
	Mon, 31 Aug 2026 13:29:00 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYRZy22n8z8svL;
	Mon, 31 Aug 2026 13:28:58 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3322B5FAB4;
	Mon, 31 Aug 2026 13:28:57 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1c855bb3-2bac-4f25-b97f-3a7436a6291b@leemhuis.info>
Date: Mon, 31 Aug 2026 13:28:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Pierre-David Belanger <pierredavidbelanger@gmail.com>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260828105926.930033-1-oushixiong1025@163.com>
 <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
 <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
 <81ddd491-1ec3-4a0c-90b3-6a286ff1a908@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <81ddd491-1ec3-4a0c-90b3-6a286ff1a908@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178817573763.3411727.9290102466049313861@mxe9fb.netcup.net>
X-NC-CID: BacT/202HD0ewFbPir0OZEme2PY2meMvuRND3scEUDBv94a6si0=

On 8/31/26 11:21, Mathias Nyman wrote:
> On 8/31/26 09:55, Thorsten Leemhuis wrote:
>> On 8/30/26 05:12, Pierre-David Belanger wrote:
>>> The failure on 08dbfad3f504:
>>>
>>>    xhci_hcd 0000:00:04.0: xHCI Host Controller
>>>    xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
>>>    xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
>>>    xhci_hcd 0000:00:04.0: can't setup: -12
>>>    xhci_hcd 0000:00:04.0: USB bus 1 deregistered
>>>    xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
>>>    xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with
>>> error -12
>> Sadly this missed -rc1, wonder why it wasn't submitted for it to prevent
>> more people from running into this, but whatever, that's ship has sailed.
> 
> Looks like at least QEMU and Mediatek users were hit by this issue.

Ahh, good to known. And thx for sending one of the fixes to Greg
meanwhile (saw that by chance).
> Note that this is a v7.3-rc1 regression which was found during merge
> window for v7.3-rc1.
> v7.3-rc1 came out a few hours ago.
> I can't resolve it much earlier than this.
Out of curiosity: why?

Just ignore the question if it was something like "real life got in the
way" or "it fell through the cracks" -- that's how it is sometimes, no
worries. But in other cases I'd be glad if you could take a few minutes
if you have them to satisfy my curiosity, as in preparation for a
maintainer summit proposal I sent[1] I'm just trying to understand
better why regression fixes sometimes take quite a while from submission
to landing in mainline

Ciao, Thorsten

[1]
https://lore.kernel.org/all/75dc0e2d-2deb-4776-977c-1de7c33465e1@leemhuis.info/
