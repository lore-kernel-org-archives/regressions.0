Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918437;
	b=xE5okKgHzXH2Fl28hNAR2D2L6WvfFbd4tW5p1GffN0qKeunjUhm4AWAEvBta2f0nGRIm
	 GWcfGYh3wPq522G3e+1dSxoF9Er9IHDILcyxhEedTVIroD8h4XAep5IOrDe/saoOrmfES
	 bUXGn9lc0nAzADaeIfIfzIu9mOGTRMYv5hso442s1hLKsGSKW0HXFClUXG+2lfpzzAcrP
	 h925Pxm89nsDSQgy7+nOQVKxOIClDoaoFXlzku81issKNNQBubTp4UuSARGMsby9JLfru
	 TGDr50KhC3ij4oMx4/an8kT+Kc9pdLhZok1f3bF9IOzX6qN5dWoQKkSI/FiSIIhfYRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=A1qSHT9KL3Ls536+9/tf2zygLC1N35ou0zdF6ITRFvY=;
	b=B1ZDIiBKZSpb0/SW85gLlLaUrvT/jyHp/tZK7unDzaUF8jGLIdWG7Tl4sZf94EYbl4hC
	 Vk85oHE6eVCOefsfhW22xzbB5KRs8+N+tENzVHTLh6W6kaJ4Xe9nGwR1QnzeWJeW+4nFf
	 eEQSpBE+SVqNlL0v2RLC69xMsW4qy1ktRoxdBwPgHdve5FmAwxHpm7ISZgK4yi7OSEKw7
	 ecEoTkd/BfFOBimJkDTv1AvStSARImpGmJWVgdvyeDMSCSutRkWN4StGLGmwM8+rmx6La
	 aZOe6ypEwciB0DRiimQd7KgQ6OBrKEoSbHAVRRjD1GHc6y/OzDxwpBHYy0FknOQ5Vsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SIzpfrV0;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591F606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 08:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8591F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SIzpfrV0
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jC9XL5RSPz6S4f
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 09:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792918418;
	bh=A1qSHT9KL3Ls536+9/tf2zygLC1N35ou0zdF6ITRFvY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=SIzpfrV09cIvV1PS1EC5u/7cuvH/pHroyu03HLjYJI0djgLMgAPlahiUBTqo3k224
	 vLgNg4qwkDW1ucfN54b8kT42kJeHNR+Q1m/0sTrcJ0OKCmh79uiWLomoRhXnhvxRRC
	 LFh5vIe05x0Dtm8/yDnwUUZ+enj/LN7k0g7mctJMBxJPKPbVNTHtS1ed+KZM18f+t5
	 j3tlGpNywmmby+Cg85AFyiuxNljRH/rDVo1kG/WCeKZuDcdT4xZOfEB/gWZmC1HseA
	 pKUvsmE3arew1OwQ/DQJ1m2IQot8t9hpal7LgCI2yxSLkCiUmSRaGGVRoHnTAcza3j
	 eUPyLVDMxqWhA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jC9XL4kC3z50pl
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 09:53:38 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jC9XL2jgHz8sZw
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 09:53:38 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 941AB5FD44
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 09:53:33 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <87eab6ac-d0a0-4f5c-83eb-6de7e67889f6@leemhuis.info>
Date: Sun, 25 Oct 2026 09:53:33 +0100
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
X-PPP-Message-ID: 
 <179291841379.1275538.15152412137434864554@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 941AB5FD44
X-NC-CID: zqOnyLpyu8qRdP9d72FB9Lf0fWUxKkapqS+2meeaXYjqjew+144=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/4MjB9K-2SoiA85WbI9iEig@dsine.de/
#regzbot introduced: 042aad8d0db6
#regzbot dup:
https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/


https://lore.kernel.org/linux-usb/20261023132616.339833-1-diogochaves@me.com/
