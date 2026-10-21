Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590855;
	b=0inI3UUjGcPpQpYc58m722p5hUqnaJnaWxoluEQsHtpK+MFkvvuytQM30M77MRoVaRwH
	 hJAmr8/SMyw2oLGqJpAhF/j/NZYTo8Kx3w+l1zsfuKhjQXDtmhX2dJA0vrk8C58BomzmJ
	 5RWlo1bQFoLYyfkIniiGQoeg/Oje2wbPRi8Nf7hxGyHUkk0I9HTpZvYYuV8mjI126DMf2
	 VJ3meHWDz1kXK351GYBF7iAr7yZsPNeNhF4FtnrSWasgcsLpsq04SGh8unI3icbXE1XhL
	 kPXdH8Zj8RDtz3QKiioVAAi5nJ7FO+mjt1/EiE9TpUX5vKe7EhSJGuU5J2xzwURgs9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=1W9snRxGb2Dueqfe+SJB0GolyjLQkquHng3Qp2HEBx4=;
	b=3UQN4y6xdaEzwJuVQ1Ha7ctsTkckVZpCIqL22WfLUfnJuVfyVGshNdyrSSPQRWTGQ4jp
	 G9NeSSenXmAKHmaOKlbGbN5+g2l49nE7OGjLM74ytf8E2Axm9hoADLQiBbnWArM7uJaly
	 u1ZJsp/47epLdQ2w7VI3KlhXjikOryfkqWOWfS7QHi8h5fErghlkrp/AWAiajhyJZH2+f
	 ozkWEaZBAR+Kner+jHwzvV3ZrtWZg9ghXHpQl6tzzfUGfDYsDiImUAkhziyk57qU3OJqW
	 9QpwD/6vuxRNCkng6SXVlZdsi+Mnl39GWvmftHgYAzjcR4CLQ4TkDAa4RFgc3e9FaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eltxvrdB;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B6606A31A
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 13:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=eltxvrdB
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j8rP01kHDz3yQ3;
	Wed, 21 Oct 2026 15:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792590852;
	bh=1W9snRxGb2Dueqfe+SJB0GolyjLQkquHng3Qp2HEBx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eltxvrdBrGuvr+VeMJVD6WW+GvPmmxOnTnRHy4bro6KHPNesZB074SuvgYsqrMR9q
	 CYMkSYbBu1WFbSeqSWay0fIyD9sisB0MSpvXoAEY5Ch6uvHkBIZfAPOUBI/palMBOb
	 buinrYcUFXcc7zYk7TgB3vUaa6KiuZJMl7mLHUHD66w26DfH+qSDilrpkN80sWlDiF
	 tKmnqBF9GryA14xP660blxP7Hj10RW46r2FD0UMNgDzG9e84uJX3ZBxbTdmXByqpzw
	 EmnaAFDAP72McFKKZLfOAOVb/MsEP8q9u4n5Uq2W3JtPKtev1pN11PQ5gt6p+5JGmW
	 w6EXgWTla7fSg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j8rNh4Rw4z3yw5;
	Wed, 21 Oct 2026 15:53:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j8rNg6gzZz8tjr;
	Wed, 21 Oct 2026 15:53:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D492D5F8D5;
	Wed, 21 Oct 2026 15:53:46 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e8e153c8-2c09-4b86-8991-a8eed56526cb@leemhuis.info>
Date: Wed, 21 Oct 2026 15:53:44 +0200
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
Subject: Re: [REGRESSION] 6.18.57: resume from s2idle triggers poweroff and
 hangs when tiny_power_button is built as a module
To: Mikkel Sejdelin <mikkel.sejdelin@proton.me>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "sashal@kernel.org" <sashal@kernel.org>
References: 
 <1kU98bgDqqEMGUcpGahaBYlaPiP2ssSCZj1uIKq1MEaGpNv2exGeJc3VWzXxB8-VJQ1Uk62W19oByt2KC-v1bSA4Sux9fBhnlA_IHWjV2Zw=@proton.me>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <1kU98bgDqqEMGUcpGahaBYlaPiP2ssSCZj1uIKq1MEaGpNv2exGeJc3VWzXxB8-VJQ1Uk62W19oByt2KC-v1bSA4Sux9fBhnlA_IHWjV2Zw=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179259082737.842613.2678257844613427806@mxe9fb.netcup.net>
X-NC-CID: UIlnd6wQu6n3PzuMLOc3ZGkfGlQ7p1Ecdf/WpZQ4wEEOwVJaiEE=

On 10/21/26 10:35, Mikkel Sejdelin wrote:

> Since 6.18.57, my laptop never comes back from suspend-to-idle: on resume
> init receives SIGRTMIN+4 and starts a poweroff, the display stays off, and
> the machine hangs until it is forced off. 6.18.56 works fine.
> [...]
> Suggested fix: backport f4203ec64e11 together with 52d864019636, or
> revert 38c79dacc806 (and its dependents) from 6.18.y. Note that the same
> backport also appears to lose fixed-event power buttons (LNXPWRBN)
> without ab06eb920401 ("ACPI: scan: Register platform devices for fixed
> event buttons"), reported at
> https://github.com/siderolabs/talos/issues/14657

FWIW, ab06eb9204010c ("ACPI: scan: Register platform devices for fixed
event buttons") is already queued for the next 6.18.y release.

Maybe your request to pick up f4203ec64e1155 ("ACPI: tiny-power-button:
Convert the driver to a platform one") is enough to make the stable team
pick this up for 6.18.y. Ideally you would try if this really fix this;
or have you and I missed this in your mail? Ciao, Thorsten
