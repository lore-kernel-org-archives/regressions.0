Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47F87C08D
	for <regressions@lists.linux.dev>; Tue,  9 Apr 2024 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712648215; cv=none; b=La80PFxDhn14gugNdG4fpxsjvLhgRA7043gJvQkPK6/sdMm1858KSXKDt2XcC58fhUYe2yZ8h4+3q5+yYZt2RZdNSIDeGhxnjxOL+Ym4jhay/m4hpSqJqBvXnG1peZUmIj9wN9iQntfzc9yrhKv8fYQ3r70tF6I6dGmTS5Sx0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712648215; c=relaxed/simple;
	bh=0OsgygWE847EvL7YQcWZOPwRIp8fpJNyMdM1Ih82n4c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=GinUZR7XCzi6AGQ0gPHO4M0hLuJaxHV44M9M2EUKSdExCPdmYBXrK+HTHdgQXFcWAQZYz1oAmUkbeBk0jvUN7qq1FfkPppWaroXlpQbudlPC99tJlpg7tIehPUFXCmsGtSQgTpzZomP28j3MzU/wJTQbG4QbaD/mcxgk3WLwKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cF2pvCLn; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cF2pvCLn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0OsgygWE847EvL7YQcWZOPwRIp8fpJNyMdM1Ih82n4c=; t=1712648213;
	x=1713080213; b=cF2pvCLnLiZI4yAfW9HmawrgUQkgENoCBr0T9t2QA0y0/qsdQBn1+MoZqxtfD
	lPDI359K3V7Kz0JQGyHSwD4JjFIBE8iBmB53YlGnAEQDAR9npNoMH6YXff43MZGKKdWN9Rtz/bnlp
	qKK/CiZW3yQQccU0kl3K9C8tKlAWOZb526iY5RbrOjjBIS9ppQmma/4PlFba9tXWSixgZXVyX4QHC
	5nipQchauWick1fwW51QkNI4jQ6G5JKPBZQXxgH8UM/up8pmBb9fKukt1e4iTRvMByaFCd+vUUa9P
	7NNnuIBAYxvZMQqqAeOwm3fsjNPWXjM5/nuFLbp+6eIcKDSt1Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ru62F-0007cl-TZ; Tue, 09 Apr 2024 09:36:51 +0200
Message-ID: <970dc454-1e1e-4db5-8c6f-fb869e5cfef4@leemhuis.info>
Date: Tue, 9 Apr 2024 09:36:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712648213;7bbca814;
X-HE-SMSGID: 1ru62F-0007cl-TZ



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

From
https://lore.kernel.org/lkml/Z6J7NF8AKNHDzwd1lbld1obVJZrKq0UKLSzKVtoL0TmOzpdyM8PRMvel8IUyhwsphxBg1bjku4ZaeQcwMhfKagEM2lRYtMChYv6VNPK5Tvg=@thefossguy.com/:

#regzbot report: https://lore.kernel.org/lkml/ZfvN5jDrftG-YRG4@titan/
#regzbot fix: a8037ceb896496


#regzbot report: https://lore.kernel.org/all/ZhNvwwYRN4-EczYi@codewreck.org/
#regzbot introduced: v6.8..v6.9-rc2
#regzbot duplicate:
https://lore.kernel.org/all/f6upxoxa6d2c6cbh4ka775msggvuduigiu7xgvfx7qsufg2lo6@2ellaad6b2on/
#regzbot duplicate:
https://lore.kernel.org/all/E7D462A2-EE93-4A57-9F15-8565EE1567F3@linux.dev/
#regzbot title: fs: 9p: various problems (xfstests; open / unlink /
fstat|ftruncate etc fail; warning when using apt)
