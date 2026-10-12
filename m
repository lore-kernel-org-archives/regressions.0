Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890037FF40;
	Mon, 12 Oct 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811433; cv=none; b=LB1z/3yNN+gAqSyjGVMz31dhqpS1p4GhEDOxAwBRJKHcXPBLhkOMRK/b73H6zFU/PwsofWVZ+THqdqN2DMS3ReUAY5U10GysMv3s5tRviNHwYEC+2oqP6IiUieUgXZ8Paj+cvikRJHvH55pxFkLufSmDYYx8LTLeiHOyzh21Xf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811433; c=relaxed/simple;
	bh=4cY6VHqR0hLpzvBnVwAH94/g6ztuA/NmsJVWylpX0Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMOkcZNBqL6PDnwXSVhEtALrHcfx5L1h0/MnKA7RSflY15EBKnb1BhTNnZxIyVB5rNmxUd7JkuBX97ZPs8/OTutZqDdSyohfPcS45/RMdTggSAG60v1K157d27C6QiogcYBuU7LaGnoaMqvFmJlUrlJ3IjkqBUEBmQgddUzp82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=W184wtA9; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="W184wtA9"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j3J7q0c2wz68H7;
	Mon, 12 Oct 2026 15:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791811415;
	bh=4cY6VHqR0hLpzvBnVwAH94/g6ztuA/NmsJVWylpX0Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W184wtA9f/K8gFfZLgskUxdO+vPcvdsYmKMLl+WF/4rzy2RaLwfv9CFr8HjEABk4l
	 02SVnzy7lwriWfixoltpg1KT+ISgtQP2+eoIRBjMs8ZVqtFjTXaXYjX936o+4Znxbt
	 7oGcxfIakc8GrceickxClt8rAdg/k9bN4X5Pc3YLDP9gyEY3Vd5rVYSpDZ8lfFKQ/R
	 Aa4tUc+IyGPm9+q0zVTjgoz0K149QhWTCuA4xKahF9rr8rZ9JM1RTOg7TuowMLcGeo
	 zkp4JLLl+lv/NnrxqhJW2P5lFdCdJ+DvY9CyaJvYyJLkujWCmJoeIhccmf5AQnW9cb
	 Ha47Vaiqb4Z7g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j3J7p6znnz4ySk;
	Mon, 12 Oct 2026 15:23:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j3J7n2jlHz8tj1;
	Mon, 12 Oct 2026 15:23:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 81C065F9CD;
	Mon, 12 Oct 2026 15:23:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info>
Date: Mon, 12 Oct 2026 15:23:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: Martin Wetterwald <martin@wetterwald.eu>, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, jai.luthra@ideasonboard.com
Cc: uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 regressions@lists.linux.dev
References: 
 <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179181139500.74058.10067141689391167732@mxe9fb.netcup.net>
X-NC-CID: kIGjrELXplyiRnveCXibd8KrkB3U/XWGy+EGBdzKxNsiTEFqkCg=

On 9/21/26 12:07, Martin Wetterwald wrote:

> After moving from 6.18.52 to 6.19 (still present in 7.2.6), the bcm2835
> Headphones sound card no longer appears on my Raspberry Pi 3 Model B Rev 1.2
> (arm64). 6.18.52 works with the exact same userspace.
> [...]
> My suspect is this commit:
> 
>   aa125180c673881f88b528600b57865dc158b3a7
>   ("platform/raspberrypi: Destage VCHIQ interface")
> 
> I could not bisect to a single commit,

Hmm, no answer, so it seems nobody really cares. A bisection might help.
Or at least validating your suspicion, hence: why can't you check the
parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
with that commit in it? And is latest 7.3-rc still broken?

Ciao, Thorsten
