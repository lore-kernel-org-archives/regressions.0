Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A52DEA79
	for <regressions@lists.linux.dev>; Thu,  6 Nov 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426295; cv=none; b=ljnKANyQNnkQ/AqsB3NpKDmenyprxiOYgwUXYiEXDT7qBe1BBP3a3jVMWLUR/d8jIqKOZqucvHSGmc/TvR0+eu3tCOGBjDFiut5dgaKopwASXvEkYLRb18NiWYhBm2oZyAZ2ulEKMC5nrtxFnKowZmBlDg34hQzXVnJ3CZnJCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426295; c=relaxed/simple;
	bh=E2AaPjQ8xSx9cRkbxYiXUwfZ94s5r74B27Vev3sgoJU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VrPXfT/tnq9y7KJ5QHF10CRJmpyAd4d4TD6MwYn37ldbVJ2SnLN9GI1MtgNmhEGlDpa6Tcgvfdp9HpVhoSoYi26QhFhZ8Yr8M6wLLDimxOG46nHaKbHrt3vHsir6XBjj5lb4KMlrKScBNl8z8el9RMwMcli2dt1hfDRXd2Odpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CLEZ+ilA; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CLEZ+ilA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=E2AaPjQ8xSx9cRkbxYiXUwfZ94s5r74B27Vev3sgoJU=; t=1762426293;
	x=1762858293; b=CLEZ+ilAyCLnJpaCQ+Sz4I3vxmcsxlT2/oiWcoAZ104f5SJk2LaW+Kqtv7GcK
	8HOiddhe/gEvO6mzd8jMN7nVgUrjFbSmZgRGJWs4Peotigqe9Vse9hkcZHvFf+WrJqyAxrX/jGjjE
	SP7ZAHJUry5kEF+W2B3PTHndhQbpIPrRJeZ8tixkdNm7Tu3e6lnuaUBn9vjEPCay1JC2Yl0yR6ta0
	BkwC9JAuijGo0SXM1WXzrzLpSYToYnrv6g9CUyz6MXivQIpm7ULGuXwPhVE28Nnys+nHI/3OrnDOx
	gRNLPEJnIqBBOZ9788rs2H2kxqaU4IznFDosFSeRuECgSj1F8A==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vGxaV-005atF-1b;
	Thu, 06 Nov 2025 11:51:31 +0100
Message-ID: <5b0fd693-5e26-46c3-8d1e-726edc470177@leemhuis.info>
Date: Thu, 6 Nov 2025 11:51:31 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1762426293;1f05a44d;
X-HE-SMSGID: 1vGxaV-005atF-1b

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report:
https://lore.kernel.org/lkml/3d7f77d2-b1f8-4d49-b36a-927a943efc2f@heusel.eu/
#regzbot fix: 3471c1400ad177

#regzbot report:
https://lore.kernel.org/linux-pci/20251013211815.GA864904@bhelgaas/
#regzbot fix: e433110eb5bf

#regzbot report:
https://lore.kernel.org/lkml/CA%2BG9fYuF44WkxhDj9ZQ1%2BPwdsU_rHGcYoVqMDr3AL=AvweiCxg@mail.gmail.com/
#regzbot resolve: testcase adjusted
https://lore.kernel.org/all/20251023164401.302967-1-naresh.kamboju@linaro.org/

#regzbot report:
https://lore.kernel.org/stable/03727147-0115-4ce9-b68d-756c6e41db94@onway.ch/
#regzbot fix: Revert "wifi: ath10k: avoid unnecessary wait for service
ready message"

#regzbot report:
https://lore.kernel.org/lkml/krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt/
#regzbot introduced: 795cda8338e
#regzbot summary: tc: interface: hwclock busted w/ M48T59 RTC (regression)

#regzbot report:
https://lore.kernel.org/lkml/DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com/
#regzbot duplicate:
https://lore.kernel.org/lkml/krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt/

#regzbot report:
https://lore.kernel.org/linuxppc-dev/20251008195136.GA634732@bhelgaas/
#regzbot introduced: f3ac2ff14834

#regzbot report:
https://lore.kernel.org/linuxppc-dev/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
#regzbot introduced: f3ac2ff14834
#regzbot summary: pci: ppc boot problems
#regzbot dup:
https://lore.kernel.org/linuxppc-dev/20251008195136.GA634732@bhelgaas/

#regzbot report:
https://lore.kernel.org/lkml/20251013210116.GA864145@bhelgaas/
#regzbot fix: 469276c06affdfd2d






