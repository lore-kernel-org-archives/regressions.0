Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398523;
	b=YNbKq831elWmMTHAsIiU+RQMRfFgx/hnMytprbQBK9zHeiOAZN1XT2QjVqxzuN7GoLis
	 7mP4itXwh1Xvj5rW3GmnggFqSI3q8buODa7pOj8X0e/fYPiXdiNW5VHWLgFkPp97pmYhx
	 8nSWZFFvYCIpLwz4XrCHrr5/vXln+nNINSuFN5n2iNskqg8je5RHuyRXdq4OTvjnT98Qj
	 Xr4u+1SnIh3jD0rDOD//WwHvtSkOLYN2MbT2duPaW2eJ7HcAspu4uknspXRgqDf6wOrNk
	 uMD+YkNBOkwovffeL+L3auWCps3bgrB1UmmuPBoNZehoLdOlMbByfWuq7l4GiEuKm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=crE7mCj8HVMIwCXGhTFTepEGE4TSQlMeH+mJdkrlI3w=;
	b=XN6nZ0PT5+e3Gaj+MnN7VQdlmUXBtXMUGuw0UK3FB0eOnXKKMUz07EW4C53RQnFATe0X
	 JXxRJy43Ub/glDM5kGHb04AhFlrMxujwz39URAjBRSAU2o+ugi4P2O4TAHCtbHMsH07xd
	 NHXv5f/M7PZ6yZUTix6CUdp0TFeegIJDxKczCtw71g2ETU8+hlXiz6eZCH3+4G5G1d/ue
	 QEbnNry97rRbHL/CdEQQ07OD92UDZozksS6vur4CynTdIaO7ihH8MymMU2MJyA1W69cmX
	 WCUOI2pPd2nMceEreTh3mEbZqwyeP0VSuSHsfJ5VWl7m4guE+4mWz13nznYVHyVhbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="bczQul3/";
	arc=none smtp.remote-ip=188.68.61.107
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2B6606A32E
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 12:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2B6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bczQul3/
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4jPhvr4rHyz7CKx
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 13:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794398520;
	bh=crE7mCj8HVMIwCXGhTFTepEGE4TSQlMeH+mJdkrlI3w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bczQul3/gOhNcEOIx0f/79R1RKtoHszbttTqb2Mp6M7pcT2SeaB4cPXd9A3AopDR+
	 B1rrC9CbaD0GBvD8h8T5KhLUGCLJ+OhbMWfyo69UtZTxSL/neIRArDNtOuImAGutl8
	 QiaAFLQNQQbcbrYyaoTS8yXu00R1sBH7/17FsM12xVqVYh/ZZ7SAhZhm/C9UaLxbOM
	 MOdXpfc3pQVTLaVffs0HYTeQINQWYySwdyrZfxv408RthpQV8Fgv+XQ1e2ORHHhlIl
	 j+SKIFmjzpQMcYnBV0HzZ5N1YDNJJSRubPIGP4UQ9SCHlTRPBo9O5vVIKPIBsmh0nQ
	 GoUaGncndftkg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4jPhvr47phz7CJN
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 13:02:00 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jPhvr2dq9z8sZd
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 13:02:00 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9DE855F9FF
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 13:01:54 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3a3b17d7-ca3d-4329-bbc2-87fb37e0e17f@leemhuis.info>
Date: Wed, 11 Nov 2026 13:01:52 +0100
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
X-PPP-Message-ID: <179439851481.925163.11539419403991510173@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9DE855F9FF
X-NC-CID: AA/YrEaPjaOSihBk2W1kKjoYx4JnDTvmo6DrV0JGgClb2Jzq4Vk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CABhMZUVJjeNUwp_yT3kkyk1U%2B0MNw0_qF%3DRU39keKnypd9T2YQ@mail.gmail.com/
#regzbot from: Kameron Markham <kameron.markham@gmail.com>
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=222253

#regzbot report:
https://lore.kernel.org/all/20261105192517.228523-1-tracekotae@gmail.com/
#regzbot introduced: 0b9c0aeba938
#regzbot fix: mm/filemap: let sequential faults restart mmap readahead

#regzbot report:
https://lore.kernel.org/all/20261110132853.71228-1-noah@feldt.systems/
#regzbot introduced: f304652609ea
#regzbot title: mm/memcg: list_del corruption on memcg LRU
#regzbot fix: mm: mglru: splice all generations when reparenting a memcg

#regzbot report:
https://lore.kernel.org/stable/20261108143640.6252e6a8@teclador/
#regzbot introduced: 38c79dacc8063f

#regzbot report:
https://lore.kernel.org/lkml/20261030114705.3159093-1-jjc@jclark.com/
#regzbot title: usb: misc: BeagleY-AI no longer boot


