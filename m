Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78B3F99E3
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417059; cv=none; b=sez366R+JuQxAoSZhFTXXW/bzR6UbVUiQT1XtIYMg7NR43hkZEdegcRBxdJcHAsxInpMvH37XMA1UCT2D1/pIwxn5ibmI865d59niHC+6xUTF2lcCvtQODihUFPEkUFBfFFF/MmGcl0RkjPtaaaY0CpTUf8ct9q0EyGN6zZViyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417059; c=relaxed/simple;
	bh=tWzjvAOTu/DB++0t8KEKEOlzrG0eYCgN8/SYWXqJPrU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=SMVhQTGFFvwPQxv5wJn7dT7NUWDPe4Kzdhg4NGUA5EpHJsVT0IrVCMQrtUHg0YsszqgEWDbnNda2F2URYmTVjjACyckx7RzQ0AdJ+xXVjpF9gFeuIYHfPZ1CYk/74m7Ubw2AECZsFT3wJrJY0souA3naNaYTuzT/hHHr87m8rdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A7zXmCxv; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A7zXmCxv"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j7c6Z5wQLz4MbS
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792417046;
	bh=tWzjvAOTu/DB++0t8KEKEOlzrG0eYCgN8/SYWXqJPrU=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=A7zXmCxv4raj6sh69KZfnuYLV9bufoCafdJ3KyqfFStMBnnv0vi4slyBmedS8F0Gr
	 t+0ymfjmBN8Xd/ENnV5K/MsF8vj2DiobCFhcR0XDWshujZy5+zdpjtExh+yxEOlJ84
	 vO9QzdG+MlNnP/am7tiohjErjSSyBVplC77HE5+fT+lQTsUf52TgjO17shZQSYfIn8
	 BB1VkAIt2wSl6jP4405aIFDQNraa3Hl85rQKUItPViIfl+U+e1WMcapVDpuo1c0Tqn
	 Ru5UjrrHubb87fkbqJMNRJvBQU7x0Y8iywmNq7uesc55oAsixR6BADtk9sX+Ol2nFE
	 mg5eEAJrCSTHQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j7c6Y0kcgz4MZ1
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:37:25 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j7bzX752Gz8vYW
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:31:20 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 479325F959
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:31:16 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8c28bac6-247f-45ca-906e-92bc15d09821@leemhuis.info>
Date: Mon, 19 Oct 2026 15:31:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179241667648.599328.1888844527438161687@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 479325F959
X-NC-CID: aPxb/9FdLQoehb0f4/fYZZ9/88mCUO5EQerSAtMV2R1PxD4eXdg=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAF50T1myMs2LSPUsTAPKyJutxzqQihyxbY3%3DiVGpxenRbnXxKQ@mail.gmail.com/
#regzbot fix: ASoC: cs35l56: Add DAI for SDCA OT25 stream

#regzbot report:
https://lore.kernel.org/all/CADrS85612m-Hh-G4BJmOhy-y6r3Ni3kD8_GM-2QRBeWWEEZWuA@mail.gmail.com/
#regzbot fix: uhid: convert to hid_safe_input_report()


