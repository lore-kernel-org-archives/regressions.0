Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2769392C24
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143682; cv=none; b=WaWM0H8G3FpwuRyBEErqimeMYqofynD+oJaMdv8UqCyOAvf/BLIExWrT2vElL1+tOKcREfC03B7xgsHEtuNd7wr16i4gCFvY5hJw4TqBElcfUE04fGE4QSkVd2IzApy7bh0vJEdQStpZP+1NLeRjH9Y+q2zv5An1VP0x40fkwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143682; c=relaxed/simple;
	bh=GZwvjaAxMaN0zEjIj68qOPMOjr/ERwlTx9hUHMinmUc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=frzVrNoRGQT1GsiwiiB6OYvafKHIQSRl8JL2Wwhzik/6DnTxlOqAh/hpKm1uE0BiO4TOFmspPuTPcgrCpLPOxJeNuTB4xip7dkYpySoxr9e1CrnTqpUczSeaWIFD/WeNdoL7+SgW/04oAfy0FjcpV6L3JE6SkFNUvzBbaUH7TCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WpE6cCoH; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WpE6cCoH"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gB5VY27gkz89PR;
	Thu,  7 May 2026 10:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778143669;
	bh=GZwvjaAxMaN0zEjIj68qOPMOjr/ERwlTx9hUHMinmUc=;
	h=Date:Subject:From:To:References:Cc:In-Reply-To:From;
	b=WpE6cCoHF6KKWX9Fe5RybcLA5JiYnxypln0Agfm1nDzVapWNrnymmDPMY4+CEWBEo
	 4v6VCUWhZJt7wtvjs1Peu3pPPlucgcMKwgaG5jUxRoHwZlUUbu2V6ABcLi7Vt3EZbf
	 3q6Gbjh6qwT3tCXl0S1YgeozH7bzUcGBC/jgropExLq3lLriU522qiDTTFPVefauA6
	 7I31Hk/8o6O5Oz42B6TgUWoujp9ndBQOEau3Zr/LqLNdobwZaerEQV5wdiP7UB/Ymo
	 Jc2X2Glczoc407BA1CeK3YMJ6pI0c3WiMU4tX3OiNR5k7jTQBrd8O/6J9sEl/nmKMP
	 GidEgoXeRvmbA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gB5VY1QcTz89Nm;
	Thu,  7 May 2026 10:47:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gB5Tj6rJTz8tgZ;
	Thu,  7 May 2026 10:47:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5449F5FBF6;
	Thu,  7 May 2026 10:47:05 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <553a4232-f4cb-4d67-bdee-067b5f038f64@leemhuis.info>
Date: Thu, 7 May 2026 10:47:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Krishna Chomal <krishna.chomal108@gmail.com>
References: 
 <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
 <afb0f9gaS5z_SmRX@archlinux>
 <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info>
Content-Language: de-DE, en-US
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 yue li <mc.root.ly@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177814362558.3020373.11228376235196563331@mxe9fb.netcup.net>
X-NC-CID: ml2K0Mw3VVt6TznneIrspAxaF7L7rpJXeRQwbLKYfFDU+c+RdMY=

[+Ilpo]

On 5/4/26 09:22, Thorsten Leemhuis wrote:
> On 5/3/26 09:26, Krishna Chomal wrote:
>> On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
>>> [...]
>>> Regression:
>>> The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
>>> but fails to probe on 7.0.2-zen1-1-zen with error -22.
>>>
>>> Issue:
>>> On the affected kernel, loading the module fails:
>> [...]
>> Thanks for reporting. This is a known issue [1]. There are 2 failures in
>> your dmesg output:
>> 1. Unknown EC layout: The fix for this has been sent recently.
>>    Currently, it is in the review-ilpo-fixes branch [2].

It[1] afaics is sitting there for a week already afaics. Wondering if it
might be worth resubmitting the patch with a Fixes tag as well as a
Link/Closes tag pointing to this thread to make the "this is fixing a
regression" aspect obvious to ensure the fix is merged this cycle?
Adding a stable tag would be great, too.

Ciao, Thorsten

[1]
https://lore.kernel.org/all/20260429180953.129885-1-krishna.chomal108@gmail.com/

>> 2. Probe failed: This is due to a failure in parsing the fan table. The
>>    fix for this has been merged into 7.1-rc1 [3].
>>
>> Using kernel 7.1 (or applying the above mentioned 2 patch manually to
>> your current build) should restore full support for your device.
> 
> You you then maybe be so kind and submit backports to the 7.0.y stable
> series to prevent more people from running into this?

Side note: s/You you/Could you/ #uhhps #sorry

>> [1] https://lore.kernel.org/platform-driver-x86/4ae4d7f9-f1db-4394-b0d9-
>> c75dc39afcf8@gmail.com
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-
>> drivers-x86.git/commit/?h=review-ilpo-
>> fixes&id=c2d4b76458c9ebf81eae2916970320f1f61ad002
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>> commit/drivers/platform/x86/hp/hp-wmi.c?h=v7.1-
>> rc1&id=9d317a54e46d3b6420567dc5b63e9d7ff5c064a3
> 
> 

