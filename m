Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53AB125B3
	for <regressions@lists.linux.dev>; Fri, 23 Feb 2024 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708674575; cv=none; b=d8IMrlMILan93NgiFnerD5EciyrHryM54JTTDyVCAdFlpd7GlDxQOQ3Q4ypRu9zD2yLqJ5whHaqfR9WpNURd9gA94FpKq0YpXcdIAbCqOaKF5fGU5+XjiTuR27OxAbqLqBRcd05U9w+o0aaYarQI0uCWCkoEn8HqJ0v5hGfgqdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708674575; c=relaxed/simple;
	bh=v5+zzE+YDsrzw5Q1gdGFS33K1JAUK7Q8mTQLrdQJ8FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bvLOj29XUMltffe54LkRUjkRz9ul1MEFo/SNx7yesnn6rPqIbbmVkTJSZLxIhCeS8smj6R9nB7TYCANnP2fDRSuA4QoHIwBpIW0Gz+x51qnbGYbl1p5P2HjqAvP0CEaR2QdA7bAh+UJfLnTSSffKv6kx52g4XtABUmJqEnuKbEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VYgt2Ft2; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VYgt2Ft2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=eR4Iwxk2hmxNxW1U6qOJ94qEAjc3jUKNyUrQ69EDwgw=; t=1708674572;
	x=1709106572; b=VYgt2Ft2+i3knYilwZrtmEWLQuJnQ/n69A5y+LsmCEJmt1wzB9PCFn4FaOkmX
	Z6+2nF9rA9d1KvUO6q/fa8/v+YENbmkyrUfKk8EmSWwtv3Zq5antDAhkqNu9CIaHPeg8OjgJC6Dg4
	ZPT7esSCO/QgHUrrG7hx38TLmqrJmwGtXTPhzqjn79hZpy4E4gRbri0PmSxnaWI53W7+8EcYyRviH
	pqcMPOCNUxJhQxoNrLjOHsWrC4Ae2Uj1gThFShuwsnFG4WK68VqPXMce4uvVAhYFdSYhDAkcIEetG
	RKSWKFuFD+XDmD8dMPJ6VfFdQRouTYs4zu0AdDnG7wbh9Pf4zg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rdQJG-0003bD-Sx; Fri, 23 Feb 2024 08:49:30 +0100
Message-ID: <f49c65d0-8f6b-4261-a831-82dd9d3091e1@leemhuis.info>
Date: Fri, 23 Feb 2024 08:49:30 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708674572;54e69538;
X-HE-SMSGID: 1rdQJG-0003bD-Sx

On 13.02.24 12:42, Johan Hovold wrote:
> 
> Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
> not always show up on boot.
>

Having two problems discussed in one thread is confusing and not
supported by rezbot (not totally sure, but I guess it likely
shouldn't!). So tell regzbot to handle this like the initial regression;
I'll send a second mail to ensure the other one it tracked, too.

#regzbot introduced: 2bcca96abfbf
#regzbot title: drm as well as soc: qcom: internal eDP display on the
Lenovo ThinkPad X13s does not always show up on boot
#regzbot monitor:
https://lore.kernel.org/all/ZctVmLK4zTwcpW3A@hovoldconsulting.com/
#regzbot from: Johan Hovold <johan+linaro@kernel.org>
#regzbot fix: soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
#regzbot monitor:
https://lore.kernel.org/lkml/20240217150228.5788-1-johan%2Blinaro@kernel.org/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
