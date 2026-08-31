Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2E3C1F57
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176230; cv=none; b=niXKheAOM0ZxWE50lFJl4J2rr6D/stxZvZdiajVi4NNdqr8+2LutjkfqyoRhWkzBIc5RiLM2hM2bu9NSQmwySoHEqnzJRKSI+bEAgWzMFdGCAtS7fJEt4bne5ehzh3z+h0l3+3RAW+OFMjIPiiXUaLlci6hzuevZkzkEJPBF/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176230; c=relaxed/simple;
	bh=isZVwDijBk+KIQv2RGLafI4Iqn0cjmx/Un6NCE5US+k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=f8LyHoDxNt+qsb4gVs5hGQi2o/4Bwo1lZnk5OiJ77r4wQZa4F9Idhrd9eBf36xYvTE9yotSQIg9CKkSmT02KD+i8VEVT3LEs4KLmpssanJoA5up5VtktZu9bnrD+Hk+C2Dd9y2m1uByIKiY4xHB1pq5n0dDNVnxLU3tp7+hj2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fihkREt2; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fihkREt2"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hYRmK119Hz9CT8;
	Mon, 31 Aug 2026 13:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788176225;
	bh=isZVwDijBk+KIQv2RGLafI4Iqn0cjmx/Un6NCE5US+k=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fihkREt250jiS8Md9ecfUy9x38LM4O+gDnJAZsl1FkOo6Mn0Bw762d4IR6ZsoyTyE
	 V7SwPd9FrNF3mbjZGPmncZtpxELwR4QydiP++RKffzLrr3V6P0AsJu/EvnMbYpYeFI
	 QSUHr6lPNrH/QgT6YwGBvJ9Jo6riS/oLA6NmeKvebTXo0ouiliAs8ygjWAcZiQKWxd
	 f9yhUu5Bo4jd/JjAX9y5hUKeuwOCKgOntNO47yDcEE0lf4tRLzfyIKkQ5yehzZaDVf
	 0pa73uFd//NbMXTDFPHmqhOT1hT1eBDs9QRH7cixGliEYrD0h02DVommjyvGYkGNZ8
	 rOGkw62X4UiRg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hYRlS5GnBz7y7g;
	Mon, 31 Aug 2026 13:36:20 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYRlR1Jlvz8sgW;
	Mon, 31 Aug 2026 13:36:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 43C7C5F98B;
	Mon, 31 Aug 2026 13:36:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <89d99e3a-0f67-4116-a262-98be59f76f5d@leemhuis.info>
Date: Mon, 31 Aug 2026 13:36:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
From: Thorsten Leemhuis <regressions@leemhuis.info>
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
 <1c855bb3-2bac-4f25-b97f-3a7436a6291b@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <1c855bb3-2bac-4f25-b97f-3a7436a6291b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178817617477.3414618.9641711164375870603@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 43C7C5F98B
X-NC-CID: 4ULurhGSr1QWexU9BvtvXiI4DTx6gifNl9q5coIrUCuzMvfKd8I=



On 8/31/26 13:28, Thorsten Leemhuis wrote:
> On 8/31/26 11:21, Mathias Nyman wrote:
>> On 8/31/26 09:55, Thorsten Leemhuis wrote:
>>> On 8/30/26 05:12, Pierre-David Belanger wrote:
>>>> The failure on 08dbfad3f504:
>>>>
>>>>    xhci_hcd 0000:00:04.0: xHCI Host Controller
>>>>    xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
>>>>    xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
>>>>    xhci_hcd 0000:00:04.0: can't setup: -12
>>>>    xhci_hcd 0000:00:04.0: USB bus 1 deregistered
>>>>    xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
>>>>    xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with
>>>> error -12
>>> Sadly this missed -rc1, wonder why it wasn't submitted for it to prevent
>>> more people from running into this, but whatever, that's ship has sailed.
>>
>> Looks like at least QEMU and Mediatek users were hit by this issue.
> 
> Ahh, good to known. And thx for sending one of the fixes to Greg
> meanwhile (saw that by chance).
>> Note that this is a v7.3-rc1 regression which was found during merge
>> window for v7.3-rc1.
>> v7.3-rc1 came out a few hours ago.
>> I can't resolve it much earlier than this.
> Out of curiosity: why?
> 
> Just ignore the question if it was something like "real life got in the
> way" or "it fell through the cracks" -- that's how it is sometimes, no
> worries. But in other cases I'd be glad if you could take a few minutes
> if you have them to satisfy my curiosity, as in preparation for a
> maintainer summit proposal I sent[1] I'm just trying to understand
> better why regression fixes sometimes take quite a while from submission
> to landing in mainline

For the record (sorry, this should have bin in above mail!), as it might
sound hostile without context, as obviously there would not have been
enough time to fix this if the issue would only have become known during
the end of the merge window. But that is not the case here afaics
(please correct me if I'm wrong!), as the first patch to fix this was
afaics submitted on 2026-08-20:

https://lore.kernel.org/linux-usb/7e6648ad-7459-4248-8c6c-227cfc2586d8@linux.intel.com/

> [1]
> https://lore.kernel.org/all/75dc0e2d-2deb-4776-977c-1de7c33465e1@leemhuis.info/

Ciao, THorsten
