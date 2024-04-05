Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636315FD18
	for <regressions@lists.linux.dev>; Fri,  5 Apr 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712309753; cv=none; b=eMVF8BDctiGj/EjB6D5LwvssKEcZk0ia5XZv48kxGgxxjbOb1iYqM27DYHBlHqpv9ztOL2i9Y8LgdTpOdw3Eo18uQX4VuGS1rtIN8/4c8S+/gp7BsQyUCQCt5euehQJjcY62BFVd41Y3zQXgtrltuGj0Ws+9eASK0hFEdXlKEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712309753; c=relaxed/simple;
	bh=EsXdMFD4/eHvZfCq2A994xrliz/F9wfQmJ26yE3iJNM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=umjUFDuPY/dJDYBkGq9yvePaP9R8MWzqNOvrjwoAZmRlkyooRM2WrWyb5TMVSADpJaov5R0BV8XJnqGu/WMBMdniPn/qvSyKllqqfKp3364GyQEKwlT1Bg8i3tS+jR5ZlSeuk6kip3lzhkGypuLk77J9yUIM1oB3WUbFEt2du3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CFMAmJsI; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CFMAmJsI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=EsXdMFD4/eHvZfCq2A994xrliz/F9wfQmJ26yE3iJNM=; t=1712309750;
	x=1712741750; b=CFMAmJsIhXOVzsHYh2Xcj6UMmPtUi9rWg2wPVesTzH3Ht0DpV3Gs75gwRhiuR
	ZxjOruqEkWtcXMO9o0omKrBebdCba83j04cSNA1XyGmaFJYlm+CsL9lkiae2axZ5BKpbBeZryRDdR
	RfFv8XknKI48FRy8kUr4PI07v2a+FcGfnFFUb8q1usPtYHCZvt6dgNowP278zaHuQt9eQ08lwPgyz
	WDmQGtHqCn15nbwrHEjn6NheJMA+I3mtSpvMkGQSCsFHE8k92rrKbB7XS6DM5VxqEwx4XYyOZ4Rn+
	+qMxeIwCtz3dAPaSQGBXP8IXidiHPhs+tQUY5aMMtQn20XcnOg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rsfz6-0005TQ-VP; Fri, 05 Apr 2024 11:35:45 +0200
Message-ID: <dcb3ced4-23a5-4655-8e5a-a2f112b91e93@leemhuis.info>
Date: Fri, 5 Apr 2024 11:35:44 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712309750;721679a3;
X-HE-SMSGID: 1rsfz6-0005TQ-VP



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/Zgg9OzeFZUTc4hck@tissot.1015granger.net/
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218671
#regzbot fix: SUNRPC: Fix a slow server-side memory leak with RPC-over-TCP

#regzbot report:
https://lore.kernel.org/all/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
#regzbot introduced: f5c31bcf604db54470868f3118a60dc4a9ba8813
#regzbot title: leds: hangs on boot

#regzbot report:
https://lore.kernel.org/lkml/tQ0L3-34g4t-mzfQIP6KDe5OYelGnEo6Udzq6Kb_nEcljppSQUXOktpE__nL-CdLOu9gW-4tIIbjtSbqrdCrjEkdhZLPiiHTqRcCB6WORuM=@thefossguy.com/
