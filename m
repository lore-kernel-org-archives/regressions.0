Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2D430CD4
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241067; cv=none; b=GQgbShD5H5fOxpzRjLgla+46q4OWxYYSQnoP84r+ueW06WoCgcC+rrN29Fw4NfzE7QrXho0rZO6DyEH5c3zzmtca35pyzxKTpID+jL1dUP25On7BEDyxDG/W8ek4OCTEHLK2eA6Js5pls5nr5ySLaYEoSmz+9LPOzN7KudQJS6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241067; c=relaxed/simple;
	bh=3tlyuVrb55/2iTK8nfnUE6fdvmRCOSdRqsED41bqEik=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HCasUrEgcdbFf+N5u2FSIxh/wZqk0R94iNJUmBDHVMhTmi284KoVadOgtj5LIa95goXDYbaT5Rrqn5AgCoCGawC4luSxex8D0kyHUKIFO/kk8affgqzLUOSnynd+saaGudY5exXijAwL7DxcHZAUmD4xToU+txoc1Hamm06zxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RxiwGxgy; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RxiwGxgy"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h8ZGB59Srz83Hs
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 14:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785241026;
	bh=3tlyuVrb55/2iTK8nfnUE6fdvmRCOSdRqsED41bqEik=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=RxiwGxgyJ3do1bKXkVPohTCiUtb1hds0j/W3gqfHn/UNqj+JF0kfiri+Hi9BYjOdT
	 wHOApe65y0JfbnrDNUTtau1xYPAzsI1SmT9GAAt9c5dyDWfmvA/MgFWXi3DJ3Wi9+Z
	 8JKFh/OogVoIrgV0Dne06qoCIpWtwK8jmi3DdTi5RYxjdIJFETBOBBSsLwetY4kVSj
	 dAfMoIc6AwpIjPY6nzW+nBRBr6yDG/UJwgbP0XEaonUV28pZvVWOzakGhqKQdFP1i0
	 25Es+zBwuqNf7TxP617QJp6h2NlTao/O0wikWRssEwOYMo2TkDnMFr4hidy7hX8BLd
	 cPzS3n22vnN0Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h8ZGB4QTVz504q
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 14:17:06 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h8ZGB2sVLz8tGh
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 14:17:06 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A4DF95FA79
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 14:17:01 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <badf08fe-16db-42b2-bcf7-74b11e4757b2@leemhuis.info>
Date: Tue, 28 Jul 2026 14:17:01 +0200
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
X-PPP-Message-ID: <178524102203.878745.12510021430660949993@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A4DF95FA79
X-NC-CID: TpbIFiJL4vyhGC6B+81RVKiWl+unP1CTE9Wx7Uux1I1N8XaOvGY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com/
#regzbot dup: https://lore.kernel.org/linux-usb/amdezCBiW4fd_DuB@mail-itl/

#regzbot report: https://lore.kernel.org/lkml/87wlvazrdy.fsf@igel.home/
#regzbot monitor: https://lore.kernel.org/all/20260707172430.790040-1-mkchauras@gmail.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221696#c10
#regzbot resolve: inconclusive: should be fixed by additional backports
