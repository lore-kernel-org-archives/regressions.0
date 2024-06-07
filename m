Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89477194122
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766376; cv=none; b=O8UZmR/zQykw+VUlWTzDIdNFLZIv4oCe1uHtK9ob2GK00xQtOamVRZraiX5cpzXbS/Q40OG/PjW0z6ZXGNeU48nzB1lVl8Qlp96WWeFcvO7Kh0BAyPehI2g7Ld6QLfAb375rFHiJ1YJ0+4fVGbnMvFXfkA4KoL7qldr+iDsHSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766376; c=relaxed/simple;
	bh=7YdTbgRGKOOtMPUL6eMGwwnCs8nRHDbN+CT+I/yjdTQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=uqkoj+U/+eXvEc5NOyO38Md8kbQ1IEcKGw0q3hsqEexX1A2DzGlzgZU0dqwo7/UUoIBkAmfpU6PE2dbYLhcAsMD8EGv6yEuH8PWn2BJsx6ruKke6yxlsBJWSsyQj8EFE6s1iH0nQeBTLqfj2/yAnbmDbtE3u+WGJ/WvMz/oL7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IeGmoFUZ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IeGmoFUZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7YdTbgRGKOOtMPUL6eMGwwnCs8nRHDbN+CT+I/yjdTQ=; t=1717766374;
	x=1718198374; b=IeGmoFUZR9si6YEOkERkhAotlYUD72Gcgd3/AzIQ1cfIDy16NerFMotXE01Jy
	EG+PYA0dm/x/isFrzhjsPdXfUDWe4dNBSrWiEY6RoHXfcivumg5tG9CroQyG4iwsMWL858d2MjRhj
	gqc9lTdS1P0z/x3hM0Jj4bqAER9WUgZNGopxpj6WfzFnvU6glQXWY6ClnN4P6GkblORut160FHCsD
	BF5jYybtBBcse+ijyPS9qjybnS1qUGX0DDMEo52W+wOzMzZve0xGL6wMueF06xa/DvprazL4KS+2u
	nzGZLMJZ2Arw2kkCaH+fvggzcLUhBNPO9+hehuoBHYJ9A8pDAw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sFZVE-0002jQ-EW; Fri, 07 Jun 2024 15:19:32 +0200
Message-ID: <5350b473-6df6-47a6-863a-be11f9d8e3d4@leemhuis.info>
Date: Fri, 7 Jun 2024 15:19:32 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717766374;470414f2;
X-HE-SMSGID: 1sFZVE-0002jQ-EW



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218936
#regzbot introduced: bfd546a552e140b0a4c8a21527c39d6d21addb
#regzbot summary: e1000e: s2idle and S3 broken
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218940

#regzbot report:
https://lore.kernel.org/all/Zl%2FV0dU6SjAMkpLG@colin-ia-desktop/
#regzbot introduced: e64d3b6fc9a388
#regzbot summary: spi: omap2-mcpsi: boot hangs with ocelot_mfd driver

