Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115E3B19BC
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 06:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392903; cv=none; b=Lv0P40E1WJdczjdX0MOu6ZTUpxo0UVJoy4up+XOvMkbcwSIJ/YdM0TEEG3XVcp6nCrn4zb5nqgotP+VPy95hXpTfJFgjixoubM3JSGc07EO7qif2/JYfqbAVytTl9h5TTVdbPF3GiyH6p70cX8qZUdPaD1OZliWe+GK3EifF8RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392903; c=relaxed/simple;
	bh=6/gajI7Jp38hRSZxRm1bq31JPvxfTzF+5MRx0sB26CM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ufPEKFFhURbTIbTxjgZp9qD1GQrAcIWSQL816RToM0euIwN6nTNNGMD0pUhbGwv9VGT0d5BpIR/7jcb9GCv8Ro7oM3PEmtDbX7JcdPrBoFamkI9BqV4Ylg3huxTPjJj7rCjmYD9O0kV2cjGThe6yeZ2ZKXFNZBwjHm9JHtoUJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Bzhl2p/N; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Bzhl2p/N"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4h9fFP6VHcz6LVR
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785392409;
	bh=6/gajI7Jp38hRSZxRm1bq31JPvxfTzF+5MRx0sB26CM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Bzhl2p/NWO2dH2PRaBPle4cfKTMCIjk8k9fSNkyToZftYjqDyvyGnwRG2J7lN2TPJ
	 Takl1NWBKDPoQh/A6L1ajHcxL0Ub75vOievfJP3E4GyH1YvCccVIuW8i68W3mQq6hI
	 +rm7HZ6SUJn+lsGn+svvKJfYmG8ZflmkbNywa5ctH144wG4wAmIyegIvSYkHvjh6HY
	 E7JE9UqFLVVqln/Fh1QdH/5By8pgWOavDfBGqvDBDvAiaEpYOk5YNhjUfSXQ6OzIWm
	 TG63CIWAdXT+2hFMnqKp0lcmQc7llR8dN+1NXGdD7TqubcIffOAVHF+js3FtD0iA/m
	 ZEufrRXdRvReQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4h9fFP5nt9z51fg
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:20:09 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h9fFP42S7z8sbD
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:20:09 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1439B5FB7C
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:20:09 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d9d42720-1e80-4854-b11f-4874b6dccc6c@leemhuis.info>
Date: Thu, 30 Jul 2026 08:20:08 +0200
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
X-PPP-Message-ID: 
 <178539240925.3083936.10291046841115682368@mxe9fb.netcup.net>
X-NC-CID: W6xh4rnnJAuGmR+mH5CSCFxGRKE1pnYkfgpwLZX6a3avIWR/pL0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221801
#regzbot introduced: 72780f7964684939d7d2f69c348876213b184
#regzbot title: PCI: booting a lot slower (or broke ?)

#regzbot report:
https://lore.kernel.org/all/605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site/
#regzbot introduced: cfa1539b24aff1
#regzbot title: io_uring/epoll: libuv test case broken

#regzbot report:
https://lore.kernel.org/all/CAOESE2Q2-0KUDaM0mUo+c_F-tMaUsBZ-gpnhdoe0rmYdgnnuJQ@mail.gmail.com/
#regzbot introduced: c9bb03ac2c66
#regzbot fix: kbuild: Stop modifying $(objtree)/Makefile when building
oot-kmods oos
