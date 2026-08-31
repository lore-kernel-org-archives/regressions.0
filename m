Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3A2941A
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159907; cv=none; b=qZQu2AvNtQh+eCYJ1fIiIsALO0S8gRWfX+wpW3mr/H8zAIRCsWrZvoVBVr2YOYtelnPgXDrdxIdz+TBRkLBKfVtU5oFBbbZyuzqugSbSsZ9RbaBDDxHuENSVmgTjsU+4h5rR+a5m8FbgGdNY4+Zn6wEixsUtDnsP7+Ba2PUZUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159907; c=relaxed/simple;
	bh=OsT9wSR3yxny15+BmcuiJ+mNDi5s7WDwal1ui55WUS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTvWW6+yv0zbz8UGe65HUS+8r6NjCxWhomHq1Ur4HEofuimUXPlbg2xe0cHxOjy9ZukIdGLOvSDJf43dxvhZA2XyY4kSkeJe8wRhgKZS9gIuYAnch/8fCXKFD5XRVGY7SvnlrMWlC9r4NrU8ig3pmq75vHAPv/OY2+6SzUDYtq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZM0jHShE; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZM0jHShE"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hYKWy6W3wz6F5q;
	Mon, 31 Aug 2026 08:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788159358;
	bh=OsT9wSR3yxny15+BmcuiJ+mNDi5s7WDwal1ui55WUS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZM0jHShE24T+GzkuKdbh4evQfvvlbFUM8Mq8egMD1k+CD32gj0clgIJZm/FmKJNc5
	 xMBaW+SUBdj3utN4GqSMAhKegD2I9kmFuoz6WHz4OMRSqYryMnao736gFp7+sKNedn
	 c16AUcUFNLp0I9+QRCU0755p/t0FSafp//n4B4sWLkzjiygfeorWLYEs4DxpRCw8Yl
	 ywc19pbbhO8sc7JU6caOD8UN4d4Q+8vO2SHHCGCuqkR54R3vhLoAB0sK5sOeZBLdJA
	 Xj7un0L5GLRaMc49jByFe1fqckdHB/7nVbgqokqkjgRAfCWB1iPhYwz1Stpt/2e/jS
	 GDypiwKomT/vg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hYKWy5nq8z50kj;
	Mon, 31 Aug 2026 08:55:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hYKWv3V24z8tbl;
	Mon, 31 Aug 2026 08:55:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C6B325FAC8;
	Mon, 31 Aug 2026 08:55:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
Date: Mon, 31 Aug 2026 08:55:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: Pierre-David Belanger <pierredavidbelanger@gmail.com>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260828105926.930033-1-oushixiong1025@163.com>
 <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178815935522.2907656.14889156823355571379@mxe9fb.netcup.net>
X-NC-CID: eiXoVUb+xadsh/1ByZXAYrQjTaBHEI2FtxuHLrDBusnQ1zxHnPA=

On 8/30/26 05:12, Pierre-David Belanger wrote:

> The failure on 08dbfad3f504:
> 
>   xhci_hcd 0000:00:04.0: xHCI Host Controller
>   xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
>   xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
>   xhci_hcd 0000:00:04.0: can't setup: -12
>   xhci_hcd 0000:00:04.0: USB bus 1 deregistered
>   xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
>   xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with error -12
FWIW, not my area of expertise, but to me it looks like there were two
similar fixes submitted earlier to address this and "usb: xhci: Fix
HCS_ERST_MAX conversion" (
https://lore.kernel.org/all/20260828105926.930033-1-oushixiong1025@163.com/
) seems to be heading towards mainline already according to Mathias.
Sadly this missed -rc1, wonder why it wasn't submitted for it to prevent
more people from running into this, but whatever, that's ship has sailed.

Ciao, Thorsten
