Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624739;
	b=UpurlVdu0VRAcTZITrXDBqKUhC5PsUDyeWxIEUDhNE+itXcCzv0HX6BM5Qc+jXTtoLGc
	 MMs1UaZkByxwQH+tcL/9pmsN+SgCtVi5XqIAOD4XL6ueg9R5/vrMGD4R9/F0l4sCfBdk6
	 JFGGG9+OeIM4FV9mWcqya5qE4U+2uOamISMu5wpPtvw89lGR2ectMa/vsl1chLwluON4v
	 mC3iVV7L9xE99ioDyjSlyTBHBl1gPoMH2oxUz36qd2ySoh90k9xYZ2GJSxAegMzfffu/r
	 nzx42Odiz0j8ZPShOG7pX2xB3iv5tYutxiJd8myW+7RxKcUExSVX+yWeCqosDh7IOwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=HzXuhEx71Hpy4wYtz+K/wui272d9OBUwwbQLOU/obKs=;
	b=zvqgOXhw/1IrIJcE0176iOoPeyzSj+VTc1YCxp1bQAEMfS9BrqcAUPGbepaXmFYp8W0n
	 wFi7CKLPf/aLw8IxO+DHmF6Xe9fYxu3G0HHAwm3Beur50OptoLjner0Rvum44FoqsNxZk
	 1gq7y6etcUOx7ip3dyBXCStr+ngx6JdOEWZsQWqAWYU16v5NjGXkfmtpUFtQ5qz9W7BaF
	 4jLr8GKiBHGp2g+THQfzj816710/1/DQkjnzJHt7Eh+DxtwjGnauWCdY9BWoRSQIJxghP
	 GavnbG/eJl9cyJaDGUtlnv8lW/Umh4dkYigUyW8zbl5ev/vNf7dTQpxqBY4X0WCdDBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="QJW+q/sd";
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D436606A326
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 13:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D436606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QJW+q/sd
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJBlN1fV6z6Pj5;
	Mon,  2 Nov 2026 14:05:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793624736;
	bh=n1QC1xViEUoYd7x+7SOGK1PzI32IA2l2+MS0mTWHH2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QJW+q/sdfJB+fBx+ayeQT2/Xb4GuwJrVS7VjHsEp+rBCLl0yFVh4H4UoRP0iVXN3L
	 lyB5ZVEmGVJbouQA+2V2jAar19K2kJH6/fEMNvHj763/MN/pWZQx0jEbB1pU6l1F8Y
	 J3J5mXv78l9bQZ+bqiqVfMG90q5sKSeydz0D8o8UdccXzL4ov6RzMNY1q6Woh7Tx/Q
	 GEUPXGT9GUEgIo493tZbU44lBWRZdQRykJpG+yKdpY94lxzjDhvVsu2/NAVoJyN0ow
	 F2MzBLXVJm60myOvyFzfBwUuN9pCwrogsDHIjiZ1VZDR1kBrAjqMztIDEhGo7TeIil
	 RwhHuG2Eb7i0A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJBjq4jnhz4ynd;
	Mon,  2 Nov 2026 14:04:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jJBjp2tnhz8v4R;
	Mon,  2 Nov 2026 14:04:14 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 48C025FA1D;
	Mon,  2 Nov 2026 14:04:08 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ec430519-eb1c-4ba8-9960-e26c40a3a2ca@leemhuis.info>
Date: Mon, 2 Nov 2026 14:04:06 +0100
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
Subject: Re: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: Nathan Blomquist <nblomquist@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, alexander.deucher@amd.com,
 christian.koenig@amd.com
References: 
 <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
 <00da317f-ec33-4084-a48a-1a6b4e10dfc8@leemhuis.info>
 <CACOV87VsAxi_xY2Zghysv7hjqL8ppmpaut7S0JEnDHvH8HuKEQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CACOV87VsAxi_xY2Zghysv7hjqL8ppmpaut7S0JEnDHvH8HuKEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179362464861.1476491.862328837416605385@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 48C025FA1D
X-NC-CID: akShBU0wH7U20cR3vchEwFXReIwPKG7c9XgO9Oj8XK9ZCQDKGYQ=

On 11/2/26 13:37, Nathan Blomquist wrote:
> On Mon, Nov 2, 2026, Thorsten Leemhuis wrote:
>> Have you tried if 7.3 is affected as well? You also might want to check
>> if 7.4-rc1 might have fixed it.
> 
> Thanks for pointing this out. The original regression reproduces on
> unmodified upstream 7.3.1.

Thx for verifying. If you haven't done yet, I suggest to put this
information in the gitlab freedesktop ticket you mentioned -- and
continue there, unless this thread grains new traction (but for amdgpu
issues I guess everything is better dealt with in that bug tracker than
on the ml).

> I also attempted 7.4-rc1, but an earlier host
> GPU initialization failure prevented testing the handoff.
> [...]
> Is the 7.4-rc1 initialization failure a known issue, or should I report
> it separately?
Not that I know of. Best to bisect this and report it separately
afterwards.

Ciao, Thorsten
