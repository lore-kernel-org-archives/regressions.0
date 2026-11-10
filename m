Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337763;
	b=O2IyBEQxJRC0AAMDlR057oaeV+66XkL/RXQ36lQe/9wFwGBVqRQ8rFY/QVlwQvx+7MmO
	 Jgp9b1MJp2qvoGuM71TZtENYb34/gJrt0URnC433MPTH2ZUoULFgyBPR9+1Olc0XuLXG0
	 fFLBbEKorsF8UXfb1hQF9PTUv/IWMUrjnGA4GJf7Mm3azbGb5AvfC3/SuoOh1L7kr7uYJ
	 VyVnfRYOPW44YCiUgHu35TMBIgrMdRvghjlv5RxQrCImZhvNfqM9JecUP6VwQthXbIRnk
	 wVPRqlj4skP8g0r7V54lJDhco8XkUaxmMtz19UmidkArZNSyIM0oeX6JBJWZ9Psjryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337763;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:To:Cc:References:Subject:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=WGZJnIXaQTHHyWQvMA6spMYXr8LqVNnU93YEdu6wYwU=;
	b=hXAbcPL4jeBdgHtdn8BOfoGtzQVIAYWbpKmq7vp0fgLt13IlzkVVDL4ANpNJMbzfTZEl
	 iNKdOsxbcBYj0Qlad2FP2pxnX1+v6sXglGc42drjUVoeomjf7mV8a75d/8hEtvASDbUvT
	 BP2Ns29AqFnqZYxEGR3+gIb/CopKIMK7tQ8urkvZsVVqAjVBdo7OWmLz7Gvo/GJh91GwF
	 K9mIdq4NIAmGQdtSMuanJMbw2ci/K0U2/lPlqJ9Qr9jb2uiNEHER1ryGF0YjijbGxOynZ
	 4LD7NW7Ti2Yjn0xnxmJI3ls1OsLfbo7HEsyCf66YDcAQTiKVfazrDLd1LALede17LGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=jOEU6yPr;
	arc=none smtp.remote-ip=160.92.124.100
Received: from smtp-outgoing-1702.laposte.net (smtp-outgoing-1702.laposte.net [160.92.124.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF2606A320
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 19:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDF2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=jOEU6yPr
X-mail-filterd: {"version":"1.9.7","queueID":"4jPGRD02LZzWf0T","contextId":
 "4ebba964-9afa-4289-a513-b93dd67dd20f"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4jPGRD02LZzWf0T;
	Tue, 10 Nov 2026 20:09:12 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jPGRC0QqWzWf0M","contextId":
 "0265c011-5ee2-455c-b348-22e8045951a3"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from [10.10.191.53] (unknown [185.234.140.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4jPGRC0QqWzWf0M;
	Tue, 10 Nov 2026 20:09:10 +0100 (CET)
Message-ID: <cd6b07b3-f50c-410c-b230-43889ef7a455@laposte.net>
Date: Tue, 10 Nov 2026 20:09:09 +0100
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
To: regressions@leemhuis.info
Cc: alain.cousinie@laposte.net, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, liam.r.girdwood@linux.intel.com,
 linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
 regressions@lists.linux.dev, rujbin@proton.me,
 yung-chuan.liao@linux.intel.com
References: <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails
 with ASoC route errors (-19)
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1794337754; bh=Ggn9M5FHXjMwPj2eKHmLanYF59svyOw6n4unnJUT+VY=; h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=jOEU6yPrMYJRKM4qz/69nsmIpHLNEmT5vztHLyiTcVidRpMdrk029AaM9tNU7w+1/a44G2c0HRdzEDjVO8TWvEECnuU/he5pJwTJoD5sjhkofosMxedLmNam2YU6ZodbaU4gamM1H7EiEmxJjC1JxW+WxvZLeR4jDi5jbxbGJ69CcHwEY7pWMQGmGiSSXt4KVBVHcYk5I5LLNiKP99NFLuJKz4Ka09OE9rok43/F37utW4CcA955/Dt/qUmdShLOXm1nhuGuZrfd1bUSulql2rOgQVrCHW055FzQR4pJOzULVCbnhjU0UhHb70xqNaM2Ra5yWrnRJnqA86u5oCefmA==;

Hi,
Hi,

After upgrading from Linux 7.4-rc1 to 7.4-rc2 on an HP Spectre (Intel Meteor
Lake), internal audio fails to initialize with repeated DAPM route errors.

I bisected the issue between v7.4-rc1 and v7.4-rc2, and git bisect identified:

  4dd10fbbeb9c33709edc89916e19c03c780a0751 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")

I also verified that reverting only the sound/ portion of 4dd10fbbeb9c33709edc89916e19c03c780a0751
(`git show 4dd10fbbeb9c33709edc89916e19c03c780a0751 -- sound/ | git apply -R`)
restores audio completely without any route errors.

#regzbot introduced: 4dd10fbbeb9c33709edc89916e19c03c780a0751

Best regards,
Alain
