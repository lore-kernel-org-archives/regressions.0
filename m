Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B251C46
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711706426; cv=none; b=TFxCoRVxWkRDs+8VttXwr6AX/ZeRWhArmTKF8OO7cLebWabrI7yYLPCzoK9jk2B5y3PyL3Yd/uJP9YcBhJdWJkPw3q3H2MgZ+EoB9BwOOhe5tTkb09Q/i+izjJ6pS1X6EUyDfWWhYKCR8cg9qKRU0XYkWMO5pttQ/2k4Htq9NsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711706426; c=relaxed/simple;
	bh=Xf7/VRL3Cg0cj0R1DCNjac0CmIm6pJcrq6MiP5TUl4M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Bdc1hD4f0sjylVVrCi8jqgkT+xxirsnOhQQZkuXvofTpE+dyfZ1AvZwTKUERXaCOpqKy7Akf0UbLNdKmGJWytK/27fDDfzeWXhuZ/TO/mnWeh99rNPiYr3IEQn98WgZq3VFPN6fnfnaGdzFqz9ZaTg/XwyE4h32ms5B4t69QXyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=wnUAFRDw; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="wnUAFRDw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Xf7/VRL3Cg0cj0R1DCNjac0CmIm6pJcrq6MiP5TUl4M=; t=1711706424;
	x=1712138424; b=wnUAFRDwAafq2VLDFI0HUIt9eletmv32JwYcMFtHBEjkaGQSStliE8ITgfFGX
	Ywzkld+Rd+xAv7p/zPqtzWDkVHPEu6eD/vTSJEQu7/L9/kTueJta/PYmWlFBsaMdmTqTg7E0Z9EW8
	LzKDAwTSxfS9Spn1OoO9E4ZtDaUy88Cq0g/4trM/eFfACNijJMGE15ILsCFEHZoSEYhlhofWE/gY6
	mIJvhfhus52IYrcx1bh+LFNfMs9BsgT+ZdFql1LOhMgCiC1Tn++bJn34cW62QstO9kTSZcLfF5P9K
	ODT/iWEVxNXzi8Cxu+KSnsQ8RhpFI3uiMeeLPbmY2l3zY1cdlg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rq926-0005J5-2h; Fri, 29 Mar 2024 11:00:22 +0100
Message-ID: <a02b05be-f70b-4e4c-89fe-04d53211b477@leemhuis.info>
Date: Fri, 29 Mar 2024 11:00:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1711706424;d34340db;
X-HE-SMSGID: 1rq926-0005J5-2h



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/9a880b2b-2a28-4647-9f0f-223f9976fdee@manjaro.org/
#regzbot introduced: v6.7..v6.8
#regzbot summary: i2c_hid_acpi: probe of i2c-XXX0001:00 failed with
error -110

#regzbot report: https://lore.kernel.org/linux-nfs/ZfxJZFwXqqurfet0@aion/
#regzbot fix: 6978bd6a913825

#regzbot report:
https://lore.kernel.org/lkml/bbc242d5-3ab0-410f-a3b1-54a68e3e375f@roeck-us.net/
#regzbot fix: mm: vmalloc: bail out early in find_vmap_area() if vmap is
not init

#regzbot report:
https://lore.kernel.org/lkml/d84baa5d-a092-3647-8062-ed7081d329d4@draconx.ca/
#regzbot fix: serial: core: Fix regression when runtime PM is not enabled
#regzbot monitor:
https://lore.kernel.org/linux-serial/20240325071649.27040-1-tony@atomide.com/
