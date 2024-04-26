Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F8213C838
	for <regressions@lists.linux.dev>; Fri, 26 Apr 2024 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714122337; cv=none; b=kyhmOqCzo/uJITXBSLGbaI4WVJaNILudGpKfKAq0tMVrbqGsfrq9PVsXphrIl7TaEwEHejgEOyE5o2WjldP+yXb97QY1SOgogaefkXWcxZ/iPA/LIqD2riz/KqqGU2UdBcGPgeQZ0W9i2uDcbW79YsaeiO+GX49YJ0SsGNsdoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714122337; c=relaxed/simple;
	bh=7DYHAybeEIQ+KOBzGSPwYKKI54sUB+yPDcf1IzNZdy8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EkVt91+4XUMI34fo7GbQNga1P5MpCl4tmBPmVvO1kN8jBqhX1alMBrsEX+nZs0oLeu6EAkYdNMgRBvdX9t9QPW6pXcTHcdLulVyjqMAvQCINhwbS7I9jJ8mMDWfFYLmWPGb3aWrz9MIFeBEpdV28ECxIZW+LCfurX+LScGsHrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=B+EHp/5u; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="B+EHp/5u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7DYHAybeEIQ+KOBzGSPwYKKI54sUB+yPDcf1IzNZdy8=; t=1714122335;
	x=1714554335; b=B+EHp/5uQTmobqb4S4/zZYfn2o4+s4pGAgsbC6N4DNQCJ3TWrEFKoQW2XJ8f1
	4yWzSQbjmfOiKHzaWi6Ry3N2LcHhn6vmK116BHm7Gt6Z6MLGsKb4xiUEyMNA1WpKpZpH7z/HWMOQh
	2OnKd7EhXEx/BjT90Ugwy0GliR8jv0Yf5FSCMd5JQGF1awXFcqEJ749xxtEabMg/GTSy1nGr9mrUI
	GOKDfG9b+SxER8b7Qll+vdRu1ZMEL3/ImC7K/SJZd2xt41aOUleEOHd0iMnkEUBmw2mTz4lRgghKz
	JEAST0WDn5W+cywxUw+X/XPTBHhDy/9ThAeqlFjP/FB7DnUBCg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s0HWK-0001tO-DS; Fri, 26 Apr 2024 11:05:28 +0200
Message-ID: <9bb17713-e3b7-4c8d-ba70-0221a969b154@leemhuis.info>
Date: Fri, 26 Apr 2024 11:05:28 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714122335;7f1a528e;
X-HE-SMSGID: 1s0HWK-0001tO-DS



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218665
#regzbot fix: b6ad00418eaf376b4f2a6

#regzbot report:
https://lore.kernel.org/linux-bluetooth/a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org/
#regzbot fix: Bluetooth: qca: set power_ctrl_enabled on NULL returned by
gpiod_get_optional()

#regzbot report:
https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
#regzbot monitor
https://lore.kernel.org/all/20240424174748.957641-1-greearb@candelatech.com/
#regzbot fix: wifi: iwlwifi: Use request_module_nowait
